@implementation HFAccessoriesToReadSet

- (void)markCharacteristicAsRead:(id)a3 withLogger:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  os_activity_scope_state_s v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFAccessoriesToReadSet accessories](self, "accessories");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "count");
  objc_msgSend(v12, "removeObject:", v7);

  if (!objc_msgSend(v12, "count"))
  {
    -[HFAccessoriesToReadSet accessories](self, "accessories");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uniqueIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeObjectForKey:", v15);

    if (v13)
    {
      if (v6)
      {
        objc_msgSend(v6, "loggerActivity", 0, 0);
        v16 = objc_claimAutoreleasedReturnValue();
        os_activity_scope_enter(v16, &v27);

        HFLogForCategory(0x38uLL);
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          -[HFAccessoriesToReadSet accessories](self, "accessories");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "count");
          -[HFAccessoriesToReadSet transportKey](self, "transportKey");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          +[HFCharacteristicReadLogger nameForTransportType:](HFCharacteristicReadLogger, "nameForTransportType:", objc_msgSend(v20, "integerValue"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v29 = v9;
          v30 = 2048;
          v31 = v19;
          v32 = 2112;
          v33 = v21;
          _os_log_impl(&dword_1DD34E000, v17, OS_LOG_TYPE_DEFAULT, "Reads Complete Tracking: All reads complete for accessory: %@ (%lu %@ accessories remaining)", buf, 0x20u);

        }
        os_activity_scope_leave(&v27);
      }
      else
      {
        HFLogForCategory(0x38uLL);
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          -[HFAccessoriesToReadSet accessories](self, "accessories");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "count");
          -[HFAccessoriesToReadSet transportKey](self, "transportKey");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          +[HFCharacteristicReadLogger nameForTransportType:](HFCharacteristicReadLogger, "nameForTransportType:", objc_msgSend(v25, "integerValue"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v29 = v9;
          v30 = 2048;
          v31 = v24;
          v32 = 2112;
          v33 = v26;
          _os_log_impl(&dword_1DD34E000, v22, OS_LOG_TYPE_DEFAULT, "Reads Complete Tracking: All reads complete for accessory: %@ (%lu %@ accessories remaining)", buf, 0x20u);

        }
      }
    }
  }

}

- (int64_t)count
{
  void *v2;
  int64_t v3;

  -[HFAccessoriesToReadSet accessories](self, "accessories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (NSMutableDictionary)accessories
{
  return self->_accessories;
}

- (void)addCharacteristic:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessory");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[HFAccessoriesToReadSet accessories](self, "accessories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_objectForKey:withDefaultValue:", v7, &__block_literal_global_89);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addObject:", v4);
}

- (NSNumber)transportKey
{
  return self->_transportKey;
}

- (HFAccessoriesToReadSet)initWithTransportType:(id)a3
{
  id v5;
  HFAccessoriesToReadSet *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *accessories;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HFAccessoriesToReadSet;
  v6 = -[HFAccessoriesToReadSet init](&v10, sel_init);
  if (v6)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    accessories = v6->_accessories;
    v6->_accessories = v7;

    objc_storeStrong((id *)&v6->_transportKey, a3);
  }

  return v6;
}

id __44__HFAccessoriesToReadSet_addCharacteristic___block_invoke()
{
  return objc_alloc_init(MEMORY[0x1E0C99E20]);
}

- (void)setAccessories:(id)a3
{
  objc_storeStrong((id *)&self->_accessories, a3);
}

- (void)setTransportKey:(id)a3
{
  objc_storeStrong((id *)&self->_transportKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportKey, 0);
  objc_storeStrong((id *)&self->_accessories, 0);
}

@end
