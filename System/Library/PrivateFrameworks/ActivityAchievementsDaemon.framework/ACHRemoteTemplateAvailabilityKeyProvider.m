@implementation ACHRemoteTemplateAvailabilityKeyProvider

- (ACHRemoteTemplateAvailabilityKeyProvider)initWithHealthStore:(id)a3 creatorDevice:(unsigned __int8)a4
{
  id v7;
  ACHRemoteTemplateAvailabilityKeyProvider *v8;
  ACHRemoteTemplateAvailabilityKeyProvider *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ACHRemoteTemplateAvailabilityKeyProvider;
  v8 = -[ACHRemoteTemplateAvailabilityKeyProvider init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_healthStore, a3);
    v9->_creatorDevice = a4;
  }

  return v9;
}

- (ACHRemoteTemplateAvailabilityKeyProvider)initWithProfile:(id)a3 creatorDevice:(unsigned __int8)a4
{
  id v6;
  ACHRemoteTemplateAvailabilityKeyProvider *v7;
  ACHRemoteTemplateAvailabilityKeyProvider *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ACHRemoteTemplateAvailabilityKeyProvider;
  v7 = -[ACHRemoteTemplateAvailabilityKeyProvider init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_profile, v6);
    v8->_creatorDevice = a4;
  }

  return v8;
}

- (BOOL)markTemplateAvailable:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "uniqueName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHRemoteTemplateAvailabilityKeyProvider availabilityStateKeyFromUniqueName:creatorDevice:](self, "availabilityStateKeyFromUniqueName:creatorDevice:", v6, -[ACHRemoteTemplateAvailabilityKeyProvider creatorDevice](self, "creatorDevice"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[ACHRemoteTemplateAvailabilityKeyProvider profile](self, "profile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = (void *)MEMORY[0x24BE40C90];
      v10 = *MEMORY[0x24BE01248];
      -[ACHRemoteTemplateAvailabilityKeyProvider profile](self, "profile");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v9, "setNumber:forKey:domain:category:profile:error:", MEMORY[0x24BDBD1C8], v7, v10, 1, v11, a4);

    }
    else
    {
      v17 = objc_alloc(MEMORY[0x24BDD3C98]);
      v18 = *MEMORY[0x24BE01248];
      -[ACHRemoteTemplateAvailabilityKeyProvider healthStore](self, "healthStore");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v17, "initWithCategory:domainName:healthStore:", 4, v18, v19);

      v12 = objc_msgSend(v20, "setNumber:forKey:error:", MEMORY[0x24BDBD1C8], v7, a4);
    }
  }
  else
  {
    v13 = (void *)MEMORY[0x24BDD1540];
    v22 = *MEMORY[0x24BDD0FC8];
    v23[0] = CFSTR("Unable to mark template as available because its unique name is nil.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Achievements.availability"), 101, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = v15;
    if (v16)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v16);
      else
        _HKLogDroppedError();
    }

    v12 = 0;
  }

  return v12;
}

- (BOOL)templateAvailableOnPairedDevice:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "uniqueName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHRemoteTemplateAvailabilityKeyProvider availabilityStateKeyFromUniqueName:creatorDevice:](self, "availabilityStateKeyFromUniqueName:creatorDevice:", v6, -[ACHRemoteTemplateAvailabilityKeyProvider creatorDevice](self, "creatorDevice"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[ACHRemoteTemplateAvailabilityKeyProvider profile](self, "profile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = (void *)MEMORY[0x24BE40C90];
      v10 = *MEMORY[0x24BE01248];
      -[ACHRemoteTemplateAvailabilityKeyProvider profile](self, "profile");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "numberForKey:domain:category:profile:entity:error:", v7, v10, 1, v11, 0, a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
        v13 = objc_msgSend(v12, "BOOLValue");
      else
        v13 = 0;
    }
    else
    {
      v18 = objc_alloc(MEMORY[0x24BDD3C98]);
      v19 = *MEMORY[0x24BE01248];
      -[ACHRemoteTemplateAvailabilityKeyProvider healthStore](self, "healthStore");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v18, "initWithCategory:domainName:healthStore:", 4, v19, v20);

      objc_msgSend(v12, "numberForKey:error:", v7, a4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v21)
        v13 = objc_msgSend(v21, "BOOLValue");
      else
        v13 = 0;

    }
  }
  else
  {
    v14 = (void *)MEMORY[0x24BDD1540];
    v24 = *MEMORY[0x24BDD0FC8];
    v25[0] = CFSTR("Unable to read template availability on paired device because its unique name is nil.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Achievements.availability"), 101, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = v16;
    if (v17)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v17);
      else
        _HKLogDroppedError();
    }

    v13 = 0;
  }

  return v13;
}

- (id)availabilityStateKeyFromUniqueName:(id)a3 creatorDevice:(unsigned __int8)a4
{
  _QWORD *v4;

  v4 = (_QWORD *)MEMORY[0x24BE01258];
  if (a4 != 1)
    v4 = (_QWORD *)MEMORY[0x24BE01250];
  objc_msgSend(a3, "stringByAppendingString:", *v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unsigned)creatorDevice
{
  return self->_creatorDevice;
}

- (void)setCreatorDevice:(unsigned __int8)a3
{
  self->_creatorDevice = a3;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthStore, a3);
}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (void)setProfile:(id)a3
{
  objc_storeWeak((id *)&self->_profile, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end
