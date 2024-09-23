@implementation HMDCharacteristicReadWriteLogEventManager

- (HMDCharacteristicReadWriteLogEventManager)init
{
  HMDCharacteristicReadWriteLogEventManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *consecutiveFailureCountByHMDAccessoryUUID;
  NSMutableDictionary *v5;
  NSMutableDictionary *timeOfFirstFailureByHMDAccessoryUUID;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HMDCharacteristicReadWriteLogEventManager;
  v2 = -[HMDCharacteristicReadWriteLogEventManager init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    consecutiveFailureCountByHMDAccessoryUUID = v2->_consecutiveFailureCountByHMDAccessoryUUID;
    v2->_consecutiveFailureCountByHMDAccessoryUUID = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    timeOfFirstFailureByHMDAccessoryUUID = v2->_timeOfFirstFailureByHMDAccessoryUUID;
    v2->_timeOfFirstFailureByHMDAccessoryUUID = v5;

  }
  return v2;
}

- (void)handleSubmittedErrorCode:(int64_t)a3 forAccessoryUUID:(id)a4
{
  os_unfair_lock_s *p_lock;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (a3)
  {
    -[HMDCharacteristicReadWriteLogEventManager timeOfFirstFailureByHMDAccessoryUUID](self, "timeOfFirstFailureByHMDAccessoryUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = (void *)MEMORY[0x24BDD16E0];
      -[HMDCharacteristicReadWriteLogEventManager consecutiveFailureCountByHMDAccessoryUUID](self, "consecutiveFailureCountByHMDAccessoryUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v16);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "numberWithInt:", objc_msgSend(v11, "intValue") + 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCharacteristicReadWriteLogEventManager consecutiveFailureCountByHMDAccessoryUUID](self, "consecutiveFailureCountByHMDAccessoryUUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v16);

    }
    else
    {
      -[HMDCharacteristicReadWriteLogEventManager consecutiveFailureCountByHMDAccessoryUUID](self, "consecutiveFailureCountByHMDAccessoryUUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", &unk_24E96C638, v16);

      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCharacteristicReadWriteLogEventManager timeOfFirstFailureByHMDAccessoryUUID](self, "timeOfFirstFailureByHMDAccessoryUUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v16);
    }

  }
  else
  {
    -[HMDCharacteristicReadWriteLogEventManager consecutiveFailureCountByHMDAccessoryUUID](self, "consecutiveFailureCountByHMDAccessoryUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", &unk_24E96C650, v16);

    -[HMDCharacteristicReadWriteLogEventManager timeOfFirstFailureByHMDAccessoryUUID](self, "timeOfFirstFailureByHMDAccessoryUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, v16);
  }

  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)consecutiveFailureCountForAccessoryUUID:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  unint64_t v8;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDCharacteristicReadWriteLogEventManager consecutiveFailureCountByHMDAccessoryUUID](self, "consecutiveFailureCountByHMDAccessoryUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (double)timeIntervalSinceFirstFailureForAccessoryUUID:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDCharacteristicReadWriteLogEventManager timeOfFirstFailureByHMDAccessoryUUID](self, "timeOfFirstFailureByHMDAccessoryUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HMDCharacteristicReadWriteLogEventManager timeOfFirstFailureByHMDAccessoryUUID](self, "timeOfFirstFailureByHMDAccessoryUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceNow");
    v11 = v10;

  }
  else
  {
    v11 = 0.0;
  }
  os_unfair_lock_unlock(p_lock);

  return -v11;
}

- (NSMutableDictionary)consecutiveFailureCountByHMDAccessoryUUID
{
  return self->_consecutiveFailureCountByHMDAccessoryUUID;
}

- (NSMutableDictionary)timeOfFirstFailureByHMDAccessoryUUID
{
  return self->_timeOfFirstFailureByHMDAccessoryUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeOfFirstFailureByHMDAccessoryUUID, 0);
  objc_storeStrong((id *)&self->_consecutiveFailureCountByHMDAccessoryUUID, 0);
}

+ (HMDCharacteristicReadWriteLogEventManager)sharedInstance
{
  if (sharedInstance_onceToken_188932 != -1)
    dispatch_once(&sharedInstance_onceToken_188932, &__block_literal_global_188933);
  return (HMDCharacteristicReadWriteLogEventManager *)(id)sharedInstance_readWriteLogEventManager;
}

void __59__HMDCharacteristicReadWriteLogEventManager_sharedInstance__block_invoke()
{
  HMDCharacteristicReadWriteLogEventManager *v0;
  void *v1;

  v0 = objc_alloc_init(HMDCharacteristicReadWriteLogEventManager);
  v1 = (void *)sharedInstance_readWriteLogEventManager;
  sharedInstance_readWriteLogEventManager = (uint64_t)v0;

}

@end
