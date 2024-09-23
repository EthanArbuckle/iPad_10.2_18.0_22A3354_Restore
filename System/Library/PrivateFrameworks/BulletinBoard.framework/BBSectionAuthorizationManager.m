@implementation BBSectionAuthorizationManager

- (id)handleChangeForSectionInfo:(id)a3 replacingSectionInfo:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "authorizationStatus");
  v9 = objc_msgSend(v7, "authorizationStatus");
  objc_msgSend(v6, "authorizationExpirationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "authorizationExpirationDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastUserGrantedAuthorizationDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastUserGrantedAuthorizationDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 != 4)
  {
    if (v9 == 4)
    {
      objc_msgSend(v6, "sectionID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[BBSectionAuthorizationManager _cancelExisitingTimerForSectionID:](self, "_cancelExisitingTimerForSectionID:", v15);

    }
    if (!v10)
      goto LABEL_13;
    goto LABEL_9;
  }
  if (!v9)
  {
LABEL_11:
    objc_msgSend(v6, "sectionID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBSectionAuthorizationManager _addNewTimerForSectionID:withExpirationDate:](self, "_addNewTimerForSectionID:withExpirationDate:", v14, v10);
    goto LABEL_12;
  }
  if (v9 != 4)
  {
    if (v12 != v13)
      goto LABEL_11;
    objc_msgSend(v6, "setAuthorizationStatus:", v9);
LABEL_9:
    objc_msgSend(v6, "setAuthorizationExpirationDate:", 0);
    goto LABEL_13;
  }
  if (objc_msgSend(v10, "compare:", v11))
  {
    objc_msgSend(v6, "sectionID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBSectionAuthorizationManager _replaceExisitingTimerForSectionID:withExpirationDate:](self, "_replaceExisitingTimerForSectionID:withExpirationDate:", v14, v10);
LABEL_12:

  }
LABEL_13:

  return v6;
}

- (BBSectionAuthorizationManager)initWithQueue:(id)a3
{
  id v5;
  BBSectionAuthorizationManager *v6;
  BBSectionAuthorizationManager *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *sectionIDsToAuthorizationExpiryTimers;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BBSectionAuthorizationManager;
  v6 = -[BBSectionAuthorizationManager init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    sectionIDsToAuthorizationExpiryTimers = v7->_sectionIDsToAuthorizationExpiryTimers;
    v7->_sectionIDsToAuthorizationExpiryTimers = v8;

  }
  return v7;
}

- (void)_addNewTimerForSectionID:(id)a3 withExpirationDate:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v6 = (objc_class *)MEMORY[0x24BE71A08];
  v7 = a4;
  v8 = a3;
  v9 = [v6 alloc];
  v12 = CFSTR("sectionID");
  v13[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithFireDate:serviceIdentifier:target:selector:userInfo:", v7, v8, self, sel__queue_triggerDidFireForExpiryTimer_, v10);

  objc_msgSend(v11, "setMinimumEarlyFireProportion:", 1.0);
  objc_msgSend(v11, "setUserVisible:", 1);
  objc_msgSend(v11, "scheduleInQueue:", self->_queue);
  -[NSMutableDictionary setObject:forKey:](self->_sectionIDsToAuthorizationExpiryTimers, "setObject:forKey:", v11, v8);

}

- (void)_replaceExisitingTimerForSectionID:(id)a3 withExpirationDate:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[BBSectionAuthorizationManager _cancelExisitingTimerForSectionID:](self, "_cancelExisitingTimerForSectionID:", v7);
  -[BBSectionAuthorizationManager _addNewTimerForSectionID:withExpirationDate:](self, "_addNewTimerForSectionID:withExpirationDate:", v7, v6);

}

- (void)_cancelExisitingTimerForSectionID:(id)a3
{
  NSMutableDictionary *sectionIDsToAuthorizationExpiryTimers;
  id v5;
  id v6;

  sectionIDsToAuthorizationExpiryTimers = self->_sectionIDsToAuthorizationExpiryTimers;
  v5 = a3;
  -[NSMutableDictionary objectForKey:](sectionIDsToAuthorizationExpiryTimers, "objectForKey:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");
  -[NSMutableDictionary removeObjectForKey:](self->_sectionIDsToAuthorizationExpiryTimers, "removeObjectForKey:", v5);

}

- (void)_queue_triggerDidFireForExpiryTimer:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  id WeakRetained;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", CFSTR("sectionID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = BBLogSettings;
  if (os_log_type_enabled((os_log_t)BBLogSettings, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = v5;
    _os_log_impl(&dword_20CCB9000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Temporary authorization expired, effective authorization status has changed", (uint8_t *)&v8, 0xCu);
  }
  -[NSMutableDictionary removeObjectForKey:](self->_sectionIDsToAuthorizationExpiryTimers, "removeObjectForKey:", v5);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "didChangeEffectiveAuthorizationStatusForSectionID:", v5);

}

- (BBSectionAuthorizationManagerDelegate)delegate
{
  return (BBSectionAuthorizationManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sectionIDsToAuthorizationExpiryTimers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
