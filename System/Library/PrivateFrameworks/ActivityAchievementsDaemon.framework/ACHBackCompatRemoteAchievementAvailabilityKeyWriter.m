@implementation ACHBackCompatRemoteAchievementAvailabilityKeyWriter

- (ACHBackCompatRemoteAchievementAvailabilityKeyWriter)initWithHealthStore:(id)a3 creatorDevice:(unsigned __int8)a4
{
  id v7;
  ACHBackCompatRemoteAchievementAvailabilityKeyWriter *v8;
  ACHBackCompatRemoteAchievementAvailabilityKeyWriter *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ACHBackCompatRemoteAchievementAvailabilityKeyWriter;
  v8 = -[ACHBackCompatRemoteAchievementAvailabilityKeyWriter init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_healthStore, a3);
    v9->_creatorDevice = a4;
  }

  return v9;
}

- (ACHBackCompatRemoteAchievementAvailabilityKeyWriter)initWithProfile:(id)a3 creatorDevice:(unsigned __int8)a4
{
  id v6;
  ACHBackCompatRemoteAchievementAvailabilityKeyWriter *v7;
  ACHBackCompatRemoteAchievementAvailabilityKeyWriter *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ACHBackCompatRemoteAchievementAvailabilityKeyWriter;
  v7 = -[ACHBackCompatRemoteAchievementAvailabilityKeyWriter init](&v10, sel_init);
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
  id v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (-[ACHBackCompatRemoteAchievementAvailabilityKeyWriter creatorDevice](self, "creatorDevice") == 1)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v6, "uniqueName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHBackCompatRemoteAchievementAvailabilityKeyWriter companionAvailabilityStateKeyFromUniqueName:](self, "companionAvailabilityStateKeyFromUniqueName:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[ACHBackCompatRemoteAchievementAvailabilityKeyWriter profile](self, "profile");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v11 = (void *)MEMORY[0x24BE40C90];
        v12 = *MEMORY[0x24BE408C0];
        -[ACHBackCompatRemoteAchievementAvailabilityKeyWriter profile](self, "profile");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v11, "setNumber:forKey:domain:category:profile:error:", MEMORY[0x24BDBD1C8], v9, v12, 1, v13, a4);

      }
      else
      {
        v18 = objc_alloc(MEMORY[0x24BDD3C98]);
        -[ACHBackCompatRemoteAchievementAvailabilityKeyWriter healthStore](self, "healthStore");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_msgSend(v18, "initWithCategory:domainName:healthStore:", 4, CFSTR("HDKeyValueEntityDefaultDomain"), v19);

        v7 = objc_msgSend(v20, "setNumber:forKey:error:", MEMORY[0x24BDBD1C8], v9, a4);
      }
    }
    else
    {
      v14 = (void *)MEMORY[0x24BDD1540];
      v22 = *MEMORY[0x24BDD0FC8];
      v23[0] = CFSTR("Unable to mark template as available because its unique name is nil.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Achievements.BackCompatRemoteAvailability"), 101, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = v16;
      if (v17)
      {
        if (a4)
          *a4 = objc_retainAutorelease(v17);
        else
          _HKLogDroppedError();
      }

      v7 = 0;
    }

  }
  return v7;
}

- (id)companionAvailabilityStateKeyFromUniqueName:(id)a3
{
  return (id)objc_msgSend(a3, "stringByAppendingString:", CFSTR("-availability-companion"));
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
