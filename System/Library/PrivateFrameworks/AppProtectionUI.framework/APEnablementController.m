@implementation APEnablementController

- (APEnablementController)initWithSubject:(id)a3 forEnablement:(unint64_t)a4 ofFeature:(unint64_t)a5
{
  id v9;
  APEnablementController *v10;
  APEnablementController *v11;
  uint64_t v12;
  NSHashTable *observers;
  SBSRemoteAlertHandle *alertHandle;
  objc_super v16;

  v9 = a3;
  v16.receiver = self;
  v16.super_class = (Class)APEnablementController;
  v10 = -[APEnablementController init](&v16, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_subject, a3);
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v12 = objc_claimAutoreleasedReturnValue();
    observers = v11->_observers;
    v11->_observers = (NSHashTable *)v12;

    v11->_lock._os_unfair_lock_opaque = 0;
    v11->_feature = a5;
    v11->_action = a4;
    alertHandle = v11->_alertHandle;
    v11->_alertHandle = 0;

  }
  return v11;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  APEnablementController *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  APUIDefaultFrameworkLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_impl(&dword_2362EA000, v3, OS_LOG_TYPE_DEFAULT, "destroying controller %@", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)APEnablementController;
  -[APEnablementController dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  APSubject *subject;
  unint64_t feature;
  __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  subject = self->_subject;
  feature = self->_feature;
  if (feature >= 4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UnknownFeature%lld"), self->_feature);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = off_25079FE30[feature];
  }
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %@, %@>"), v4, subject, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void)registerObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable addObject:](self->_observers, "addObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)unregisterObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)_didCompleteWithError:(id)a3
{
  id v4;
  NSObject *v5;
  APSubject *subject;
  unint64_t feature;
  unint64_t action;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  APSubject *v21;
  __int16 v22;
  unint64_t v23;
  __int16 v24;
  unint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  APUIDefaultFrameworkLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    subject = self->_subject;
    feature = self->_feature;
    action = self->_action;
    *(_DWORD *)buf = 138413058;
    v21 = subject;
    v22 = 2048;
    v23 = feature;
    v24 = 2048;
    v25 = action;
    v26 = 2112;
    v27 = v4;
    _os_log_impl(&dword_2362EA000, v5, OS_LOG_TYPE_DEFAULT, "enablement controller for %@ feature %lld enablement %lld complete with error %@", buf, 0x2Au);
  }

  os_unfair_lock_lock(&self->_lock);
  -[NSHashTable allObjects](self->_observers, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lock);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "enablementController:didCompleteWithError:", self, v4, (_QWORD)v15);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

}

- (BOOL)_setNoLongerWaitingForService
{
  os_unfair_lock_s *p_lock;
  BOOL waitingForService;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  waitingForService = self->_waitingForService;
  self->_waitingForService = 0;
  os_unfair_lock_unlock(p_lock);
  return waitingForService;
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  __int16 v8;
  APEnablementController *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  APUIDefaultFrameworkLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412546;
    v7 = v4;
    v8 = 2112;
    v9 = self;
    _os_log_impl(&dword_2362EA000, v5, OS_LOG_TYPE_DEFAULT, "handle %@ activated for %@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  __int16 v8;
  APEnablementController *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  APUIDefaultFrameworkLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412546;
    v7 = v4;
    v8 = 2112;
    v9 = self;
    _os_log_impl(&dword_2362EA000, v5, OS_LOG_TYPE_DEFAULT, "handle %@ deactivated for %@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(v4, "invalidate");
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  OS_xpc_object *serviceConnection;
  uint64_t v14;
  const __CFString *v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  APEnablementController *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  APUIDefaultFrameworkLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v17 = v6;
    v18 = 2112;
    v19 = self;
    v20 = 2112;
    v21 = v7;
    _os_log_impl(&dword_2362EA000, v8, OS_LOG_TYPE_DEFAULT, "handle %@ invalidated for %@: %@", buf, 0x20u);
  }

  if (-[APEnablementController _setNoLongerWaitingForService](self, "_setNoLongerWaitingForService"))
  {
    v9 = (void *)MEMORY[0x24BDD1540];
    v10 = *MEMORY[0x24BDD1128];
    v14 = *MEMORY[0x24BDD0BA0];
    v15 = CFSTR("remote alert for enablement flow invalidated before completion");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 4, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[APEnablementController _didCompleteWithError:](self, "_didCompleteWithError:", v12);
  }
  xpc_connection_cancel(self->_listenerConnection);
  xpc_connection_set_event_handler(self->_listenerConnection, &__block_literal_global);
  serviceConnection = self->_serviceConnection;
  if (serviceConnection)
  {
    xpc_connection_cancel(serviceConnection);
    xpc_connection_set_event_handler(self->_serviceConnection, &__block_literal_global_9);
  }
  -[SBSRemoteAlertHandle unregisterObserver:](self->_alertHandle, "unregisterObserver:", self);

}

- (void)_handleServiceConnectionEvent:(id)a3
{
  id v4;
  NSObject *v5;
  OS_xpc_object *serviceConnection;
  xpc_object_t reply;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  APUIDefaultFrameworkLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_2362EA000, v5, OS_LOG_TYPE_DEFAULT, "handle service connection event: %@", (uint8_t *)&v9, 0xCu);
  }

  if (-[APEnablementController _setNoLongerWaitingForService](self, "_setNoLongerWaitingForService"))
  {
    serviceConnection = self->_serviceConnection;
    reply = xpc_dictionary_create_reply(v4);
    xpc_connection_send_message(serviceConnection, reply);

    -[APEnablementController _didCompleteWithError:](self, "_didCompleteWithError:", 0);
    APUIDefaultFrameworkLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_2362EA000, v8, OS_LOG_TYPE_DEFAULT, "waiting for service and service is done; invalidating handle",
        (uint8_t *)&v9,
        2u);
    }

    -[SBSRemoteAlertHandle invalidate](self->_alertHandle, "invalidate");
  }

}

- (void)beginFlow
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0(&dword_2362EA000, v0, v1, "invalid subject for enablement %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __35__APEnablementController_beginFlow__block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  const _xpc_type_s *v6;
  const _xpc_type_s *v7;
  NSObject *v8;
  _BOOL4 v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  NSObject *v13;
  uint64_t v14;
  _xpc_connection_s *v15;
  _QWORD handler[5];
  uint8_t buf[4];
  const char *name;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = MEMORY[0x23B7EFE58]();
  if (v5 != MEMORY[0x24BDACF88])
  {
    v6 = (const _xpc_type_s *)v5;
    v7 = (const _xpc_type_s *)MEMORY[0x24BDACFB8];
    APUIDefaultFrameworkLog();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v6 == v7)
    {
      if (v9)
      {
        *(_WORD *)buf = 0;
        v10 = "got error on listener";
        v11 = v8;
        v12 = 2;
        goto LABEL_10;
      }
    }
    else if (v9)
    {
      *(_DWORD *)buf = 136315138;
      name = xpc_type_get_name(v6);
      v10 = "got unknown object of type %s";
      v11 = v8;
      v12 = 12;
LABEL_10:
      _os_log_impl(&dword_2362EA000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
    }

    goto LABEL_12;
  }
  APUIDefaultFrameworkLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2362EA000, v13, OS_LOG_TYPE_DEFAULT, "got connection from service", buf, 2u);
  }

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 72), a2);
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(_xpc_connection_s **)(v14 + 72);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __35__APEnablementController_beginFlow__block_invoke_12;
  handler[3] = &unk_25079FD58;
  handler[4] = v14;
  xpc_connection_set_event_handler(v15, handler);
  xpc_connection_resume(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 72));
LABEL_12:

}

uint64_t __35__APEnablementController_beginFlow__block_invoke_12(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleServiceConnectionEvent:", a2);
}

void __35__APEnablementController_beginFlow__block_invoke_29(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[5];
  id v18;
  _QWORD aBlock[5];

  v5 = a3;
  APUIDefaultFrameworkLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  if ((a2 & 1) != 0)
  {
    if (v7)
      __35__APEnablementController_beginFlow__block_invoke_29_cold_1();

    v8 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __35__APEnablementController_beginFlow__block_invoke_30;
    aBlock[3] = &unk_25079FD80;
    aBlock[4] = *(_QWORD *)(a1 + 32);
    v9 = _Block_copy(aBlock);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
    if (v10 == 3)
    {
      objc_msgSend(MEMORY[0x24BE04328], "sharedManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 32);
      v13 = *(_QWORD *)(v12 + 8);
      v17[0] = v8;
      v17[1] = 3221225472;
      v17[2] = __35__APEnablementController_beginFlow__block_invoke_32;
      v17[3] = &unk_25079FDA8;
      v17[4] = v12;
      v18 = v9;
      objc_msgSend(v11, "setSubject:isLocked:completion:", v13, 0, v17);

      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
    }
    objc_msgSend(MEMORY[0x24BE04328], "sharedManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (v10 == 1)
      objc_msgSend(v14, "setSubject:isLocked:completion:", v16, 0, v9);
    else
      objc_msgSend(v14, "setSubject:isHidden:completion:", v16, 0, v9);

  }
  else
  {
    if (v7)
      __35__APEnablementController_beginFlow__block_invoke_29_cold_2();

    objc_msgSend(*(id *)(a1 + 32), "_didCompleteWithError:", v5);
  }

}

void __35__APEnablementController_beginFlow__block_invoke_30(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    APUIDefaultFrameworkLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __35__APEnablementController_beginFlow__block_invoke_30_cold_1();

  }
  objc_msgSend(*(id *)(a1 + 32), "_didCompleteWithError:", v5);

}

void __35__APEnablementController_beginFlow__block_invoke_32(uint64_t a1, int a2)
{
  id v3;

  if (a2)
  {
    objc_msgSend(MEMORY[0x24BE04328], "sharedManager");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSubject:isHidden:completion:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), 0, *(_QWORD *)(a1 + 40));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

+ (void)oneshotBeginFlowToSetEnablement:(unint64_t)a3 ofFeature:(unint64_t)a4 forSubject:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  APOneshotObserverAdapter *v11;
  APEnablementController *v12;

  v9 = a6;
  v10 = a5;
  v12 = -[APEnablementController initWithSubject:forEnablement:ofFeature:]([APEnablementController alloc], "initWithSubject:forEnablement:ofFeature:", v10, a3, a4);

  v11 = -[APOneshotObserverAdapter initWithController:completionHandler:]([APOneshotObserverAdapter alloc], "initWithController:completionHandler:", v12, v9);
  -[APOneshotObserverAdapter kickoff](v11, "kickoff");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceConnection, 0);
  objc_storeStrong((id *)&self->_listenerConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_alertHandle, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_subject, 0);
}

void __35__APEnablementController_beginFlow__block_invoke_29_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_4(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_2362EA000, v0, v1, "authenticated, now disabling feature %lld for %@", v2);
  OUTLINED_FUNCTION_1();
}

void __35__APEnablementController_beginFlow__block_invoke_29_cold_2()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6();
  v3 = v0;
  OUTLINED_FUNCTION_2(&dword_2362EA000, v1, (uint64_t)v1, "Could not authenticate to disable feature %lld: %@", v2);
  OUTLINED_FUNCTION_1();
}

void __35__APEnablementController_beginFlow__block_invoke_30_cold_1()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  uint8_t v3[22];
  __int16 v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  v4 = v0;
  v5 = v1;
  _os_log_error_impl(&dword_2362EA000, v2, OS_LOG_TYPE_ERROR, "couldn't disable feature %lld of %@: %@", v3, 0x20u);
}

@end
