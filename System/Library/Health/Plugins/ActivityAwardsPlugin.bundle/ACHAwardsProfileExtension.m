@implementation ACHAwardsProfileExtension

- (ACHAwardsProfileExtension)initWithProfile:(id)a3
{
  id v4;
  ACHAwardsProfileExtension *v5;
  NSObject *v6;
  uint64_t v7;
  ACHEarnedInstanceEntityWrapper *earnedInstanceEntityWrapper;
  uint64_t v9;
  ACHTemplateEntityWrapper *templateEntityWrapper;
  uint64_t v11;
  OS_dispatch_queue *databaseQueue;
  void *v13;
  id WeakRetained;
  void *v15;
  uint8_t v17[16];
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ACHAwardsProfileExtension;
  v5 = -[ACHAwardsProfileExtension init](&v18, sel_init);
  if (v5)
  {
    ACHLogDatabase();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_2322DD000, v6, OS_LOG_TYPE_DEFAULT, "Starting Activity Awards Plugin", v17, 2u);
    }

    objc_storeWeak((id *)&v5->_profile, v4);
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BE01A40]), "initWithProfile:", v4);
    earnedInstanceEntityWrapper = v5->_earnedInstanceEntityWrapper;
    v5->_earnedInstanceEntityWrapper = (ACHEarnedInstanceEntityWrapper *)v7;

    -[ACHEarnedInstanceEntityWrapper setSyncedEarnedInstancesObserver:](v5->_earnedInstanceEntityWrapper, "setSyncedEarnedInstancesObserver:", v5);
    objc_msgSend(MEMORY[0x24BE01A38], "setJournalEntryAppliedObserver:", v5);
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BE01AD0]), "initWithProfile:", v4);
    templateEntityWrapper = v5->_templateEntityWrapper;
    v5->_templateEntityWrapper = (ACHTemplateEntityWrapper *)v9;

    -[ACHTemplateEntityWrapper setSyncedTemplatesObserver:](v5->_templateEntityWrapper, "setSyncedTemplatesObserver:", v5);
    HDCreateSerialUtilityDispatchQueue();
    v11 = objc_claimAutoreleasedReturnValue();
    databaseQueue = v5->_databaseQueue;
    v5->_databaseQueue = (OS_dispatch_queue *)v11;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v5, sel_keyValuePairsDidUpdate_, *MEMORY[0x24BE01970], 0);

    WeakRetained = objc_loadWeakRetained((id *)&v5->_profile);
    objc_msgSend(WeakRetained, "daemon");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "registerDaemonReadyObserver:queue:", v5, v5->_databaseQueue);

  }
  return v5;
}

- (BOOL)earnedInstanceEntityDidReceiveSyncedEarnedInstances:(id)a3 provenance:(int64_t)a4
{
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  BOOL v11;
  _QWORD block[4];
  id v14;
  ACHAwardsProfileExtension *v15;
  uint64_t *v16;
  uint64_t *v17;
  int64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_2322DF144;
  v27 = sub_2322DF154;
  v28 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 1;
  -[ACHAwardsProfileExtension databaseQueue](self, "databaseQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2322DF15C;
  block[3] = &unk_25011C9E8;
  v16 = &v19;
  v8 = v6;
  v14 = v8;
  v15 = self;
  v17 = &v23;
  v18 = a4;
  dispatch_sync(v7, block);

  if (v24[5] || !*((_BYTE *)v20 + 24))
  {
    ACHLogDatabase();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v24[5];
      *(_DWORD *)buf = 138412290;
      v30 = v10;
      _os_log_impl(&dword_2322DD000, v9, OS_LOG_TYPE_DEFAULT, "Error inserting synced earned instances: %@", buf, 0xCu);
    }

  }
  notify_post((const char *)objc_msgSend((id)*MEMORY[0x24BE01260], "UTF8String"));
  v11 = *((_BYTE *)v20 + 24) != 0;

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

- (void)earnedInstanceEntityDidApplyJournalEntriesInsertedEarnedInstances:(id)a3 removedEarnedInstances:(id)a4
{
  notify_post((const char *)objc_msgSend((id)*MEMORY[0x24BE01260], "UTF8String", a3, a4));
}

- (void)templateEntityDidReceiveSyncedTemplates:(id)a3 provenance:(int64_t)a4
{
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD block[4];
  id v12;
  ACHAwardsProfileExtension *v13;
  uint64_t *v14;
  uint64_t *v15;
  int64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint8_t buf[4];
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_2322DF144;
  v25 = sub_2322DF154;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 1;
  -[ACHAwardsProfileExtension databaseQueue](self, "databaseQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2322DF440;
  block[3] = &unk_25011C9E8;
  v14 = &v17;
  v8 = v6;
  v12 = v8;
  v13 = self;
  v15 = &v21;
  v16 = a4;
  dispatch_sync(v7, block);

  if (v22[5] || !*((_BYTE *)v18 + 24))
  {
    ACHLogDatabase();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v22[5];
      *(_DWORD *)buf = 138412290;
      v28 = v10;
      _os_log_impl(&dword_2322DD000, v9, OS_LOG_TYPE_DEFAULT, "Error inserting synced templates: %@", buf, 0xCu);
    }

  }
  notify_post((const char *)objc_msgSend((id)*MEMORY[0x24BE01288], "UTF8String"));

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

}

- (void)keyValuePairsDidUpdate:(id)a3
{
  notify_post((const char *)objc_msgSend((id)*MEMORY[0x24BE01268], "UTF8String", a3));
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  notify_post((const char *)objc_msgSend((id)*MEMORY[0x24BE01560], "UTF8String", a3, a4));
}

- (void)daemonReady:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  AAPTriggerGenerator *v10;
  AAPTriggerGenerator *triggerGenerator;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addProtectedDataObserver:", self);

  objc_msgSend(WeakRetained, "daemon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "behavior");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isAppleWatch"))
  {

LABEL_4:
    v9 = objc_alloc_init(MEMORY[0x24BE01B40]);
    v10 = -[AAPTriggerGenerator initWithProfile:awardsClient:]([AAPTriggerGenerator alloc], "initWithProfile:awardsClient:", WeakRetained, v9);
    triggerGenerator = self->_triggerGenerator;
    self->_triggerGenerator = v10;

    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isStandalonePhoneFitnessMode");

  if (v8)
    goto LABEL_4;
LABEL_5:

}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (void)setProfile:(id)a3
{
  objc_storeWeak((id *)&self->_profile, a3);
}

- (ACHEarnedInstanceEntityWrapper)earnedInstanceEntityWrapper
{
  return self->_earnedInstanceEntityWrapper;
}

- (void)setEarnedInstanceEntityWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_earnedInstanceEntityWrapper, a3);
}

- (ACHTemplateEntityWrapper)templateEntityWrapper
{
  return self->_templateEntityWrapper;
}

- (void)setTemplateEntityWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_templateEntityWrapper, a3);
}

- (AAPTriggerGenerator)triggerGenerator
{
  return self->_triggerGenerator;
}

- (void)setTriggerGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_triggerGenerator, a3);
}

- (OS_dispatch_queue)databaseQueue
{
  return self->_databaseQueue;
}

- (void)setDatabaseQueue:(id)a3
{
  objc_storeStrong((id *)&self->_databaseQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseQueue, 0);
  objc_storeStrong((id *)&self->_triggerGenerator, 0);
  objc_storeStrong((id *)&self->_templateEntityWrapper, 0);
  objc_storeStrong((id *)&self->_earnedInstanceEntityWrapper, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
