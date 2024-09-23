@implementation _CDPolicyBasedPersisting

- (void)saveValue:(id)a3 forKeyPath:(id)a4
{
  -[_CDContextPersisting saveValue:forKeyPath:](self->_persistenceSurvivingRelaunch, "saveValue:forKeyPath:", a3, a4);
}

- (void)deleteRegistration:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81590];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47___CDPolicyBasedPersisting_deleteRegistration___block_invoke;
  v7[3] = &unk_1E26D46A8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "runBlockWhenDeviceIsClassCUnlocked:", v7);

}

- (_CDPolicyBasedPersisting)initWithPersistenceSurvivingReboot:(id)a3 persistenceSurvivingRelaunch:(id)a4
{
  id v7;
  id v8;
  _CDPolicyBasedPersisting *v9;
  _CDPolicyBasedPersisting *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_CDPolicyBasedPersisting;
  v9 = -[_CDPolicyBasedPersisting init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_persistenceSurvivingReboot, a3);
    objc_storeStrong((id *)&v10->_persistenceSurvivingRelaunch, a4);
  }

  return v10;
}

+ (id)persistenceWithPersistenceSurvivingReboot:(id)a3 persistenceSurvivingRelaunch:(id)a4
{
  void *v4;
  id v7;
  id v8;

  v4 = 0;
  if (a3 && a4)
  {
    v7 = a4;
    v8 = a3;
    v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPersistenceSurvivingReboot:persistenceSurvivingRelaunch:", v8, v7);

  }
  return v4;
}

- (void)saveRegistration:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked"))
  {
    objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v4;
      _os_log_impl(&dword_18DD73000, v5, OS_LOG_TYPE_DEFAULT, "Registration persistance queued %@", buf, 0xCu);
    }

  }
  v6 = (void *)MEMORY[0x1E0D81590];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45___CDPolicyBasedPersisting_saveRegistration___block_invoke;
  v8[3] = &unk_1E26D46A8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "runBlockWhenDeviceIsClassCUnlocked:", v8);

}

- (void)deleteAllData
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41___CDPolicyBasedPersisting_deleteAllData__block_invoke;
  v3[3] = &unk_1E26D46E0;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0D81590], "runBlockWhenDeviceIsClassCUnlocked:", v3);
  -[_CDContextPersisting deleteAllData](self->_persistenceSurvivingRelaunch, "deleteAllData");
}

- (void)deleteDataCreatedBefore:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  _CDPolicyBasedPersisting *v11;
  id v12;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81590];
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __52___CDPolicyBasedPersisting_deleteDataCreatedBefore___block_invoke;
  v10 = &unk_1E26D46A8;
  v11 = self;
  v12 = v4;
  v6 = v4;
  objc_msgSend(v5, "runBlockWhenDeviceIsClassCUnlocked:", &v7);
  -[_CDContextPersisting deleteDataCreatedBefore:](self->_persistenceSurvivingRelaunch, "deleteDataCreatedBefore:", v6, v7, v8, v9, v10, v11);

}

- (id)loadValues
{
  return (id)-[_CDContextPersisting loadValues](self->_persistenceSurvivingRelaunch, "loadValues");
}

- (id)loadRegistrations
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[_CDContextPersisting loadRegistrations](self->_persistenceSurvivingReboot, "loadRegistrations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDContextPersisting loadRegistrations](self->_persistenceSurvivingRelaunch, "loadRegistrations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count") + objc_msgSend(v3, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
    objc_msgSend(v5, "addObjectsFromArray:", v3);
  if (objc_msgSend(v4, "count"))
    objc_msgSend(v5, "addObjectsFromArray:", v4);
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

- (_CDContextPersisting)persistenceSurvivingReboot
{
  return self->_persistenceSurvivingReboot;
}

- (_CDContextPersisting)persistenceSurvivingRelaunch
{
  return self->_persistenceSurvivingRelaunch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistenceSurvivingRelaunch, 0);
  objc_storeStrong((id *)&self->_persistenceSurvivingReboot, 0);
}

@end
