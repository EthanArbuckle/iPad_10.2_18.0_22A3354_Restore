@implementation HFCharacteristicReadLogger

- (HFCharacteristicReadLogger)init
{
  HFCharacteristicReadLogger *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *accessoriesToReadByTransport;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HFCharacteristicReadLogger;
  v2 = -[HFCharacteristicReadLogger init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    accessoriesToReadByTransport = v2->_accessoriesToReadByTransport;
    v2->_accessoriesToReadByTransport = v3;

  }
  return v2;
}

- (void)addCharacteristic:(id)a3 withUpdateLogger:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HFAccessoriesToReadSet *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  os_activity_scope_state_s v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[HFCharacteristicReadLogger transportKeyForCharacteristic:](HFCharacteristicReadLogger, "transportKeyForCharacteristic:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v7, "loggerActivity", 0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    os_activity_scope_enter(v9, &v26);

    HFLogForCategory(0x38uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      +[HFCharacteristicReadLogger nameForTransportType:](HFCharacteristicReadLogger, "nameForTransportType:", objc_msgSend(v8, "integerValue"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "service");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "accessory");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v28 = v11;
      v29 = 2112;
      v30 = v14;
      _os_log_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_DEFAULT, "Reads Complete Tracking: %@ Accessory: %@", buf, 0x16u);

    }
    os_activity_scope_leave(&v26);
  }
  else
  {
    HFLogForCategory(0x38uLL);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      +[HFCharacteristicReadLogger nameForTransportType:](HFCharacteristicReadLogger, "nameForTransportType:", objc_msgSend(v8, "integerValue"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "service");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "accessory");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "name");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v28 = v22;
      v29 = 2112;
      v30 = v25;
      _os_log_impl(&dword_1DD34E000, v21, OS_LOG_TYPE_DEFAULT, "Reads Complete Tracking: %@ Accessory: %@", buf, 0x16u);

    }
  }
  -[HFCharacteristicReadLogger accessoriesToReadByTransport](self, "accessoriesToReadByTransport");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    v17 = -[HFAccessoriesToReadSet initWithTransportType:]([HFAccessoriesToReadSet alloc], "initWithTransportType:", v8);
    -[HFCharacteristicReadLogger accessoriesToReadByTransport](self, "accessoriesToReadByTransport");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v8);

  }
  -[HFCharacteristicReadLogger accessoriesToReadByTransport](self, "accessoriesToReadByTransport");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", v8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addCharacteristic:", v6);

}

- (unint64_t)numberOfAccessoriesForTransportType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCharacteristicReadLogger accessoriesToReadByTransport](self, "accessoriesToReadByTransport");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  return v7;
}

- (NSMutableDictionary)accessoriesToReadByTransport
{
  return self->_accessoriesToReadByTransport;
}

+ (id)nameForTransportType:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("'Other' Transport");
  if (a3 == 1)
    v3 = CFSTR("BLE");
  if (a3)
    return (id)v3;
  else
    return CFSTR("IP");
}

- (void)markCharacteristicAsRead:(id)a3 withLogger:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  os_activity_scope_state_s state;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  +[HFCharacteristicReadLogger transportKeyForCharacteristic:](HFCharacteristicReadLogger, "transportKeyForCharacteristic:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HFCharacteristicReadLogger numberOfAccessoriesForTransportType:](self, "numberOfAccessoriesForTransportType:", objc_msgSend(v8, "integerValue"));
  -[HFCharacteristicReadLogger accessoriesToReadByTransport](self, "accessoriesToReadByTransport");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "markCharacteristicAsRead:withLogger:", v7, v6);

  if (v9
    && !-[HFCharacteristicReadLogger numberOfAccessoriesForTransportType:](self, "numberOfAccessoriesForTransportType:", objc_msgSend(v8, "integerValue")))
  {
    if (v6)
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      objc_msgSend(v6, "loggerActivity");
      v12 = objc_claimAutoreleasedReturnValue();
      os_activity_scope_enter(v12, &state);

      HFLogForCategory(0x38uLL);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        +[HFCharacteristicReadLogger nameForTransportType:](HFCharacteristicReadLogger, "nameForTransportType:", objc_msgSend(v8, "integerValue"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138412290;
        v18 = v14;
        _os_log_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_DEFAULT, "Reads Complete Tracking: Completed reads for %@ accessories.", (uint8_t *)&v17, 0xCu);

      }
      os_activity_scope_leave(&state);
    }
    else
    {
      HFLogForCategory(0x38uLL);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        +[HFCharacteristicReadLogger nameForTransportType:](HFCharacteristicReadLogger, "nameForTransportType:", objc_msgSend(v8, "integerValue"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(state.opaque[0]) = 138412290;
        *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v16;
        _os_log_impl(&dword_1DD34E000, v15, OS_LOG_TYPE_DEFAULT, "Reads Complete Tracking: Completed reads for %@ accessories.", (uint8_t *)&state, 0xCu);

      }
    }
  }

}

+ (id)transportKeyForCharacteristic:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "transportTypes") & 1) != 0)
  {
    v5 = &unk_1EA7CC2E0;
  }
  else if ((objc_msgSend(v4, "transportTypes") & 2) != 0)
  {
    v5 = &unk_1EA7CC2F8;
  }
  else
  {
    v5 = &unk_1EA7CC310;
  }

  return v5;
}

- (void)setAccessoriesToReadByTransport:(id)a3
{
  objc_storeStrong((id *)&self->_accessoriesToReadByTransport, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoriesToReadByTransport, 0);
}

@end
