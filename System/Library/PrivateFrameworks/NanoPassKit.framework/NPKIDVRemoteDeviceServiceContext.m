@implementation NPKIDVRemoteDeviceServiceContext

- (NPKIDVRemoteDeviceServiceContext)init
{
  NPKIDVRemoteDeviceServiceContext *v2;
  void *v3;
  uint64_t v4;
  NSString *remoteDeviceID;
  NSMutableDictionary *v6;
  NSMutableDictionary *eventsToServiceNames;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NPKIDVRemoteDeviceServiceContext;
  v2 = -[NPKIDVRemoteDeviceServiceContext init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = objc_claimAutoreleasedReturnValue();
    remoteDeviceID = v2->_remoteDeviceID;
    v2->_remoteDeviceID = (NSString *)v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    eventsToServiceNames = v2->_eventsToServiceNames;
    v2->_eventsToServiceNames = v6;

  }
  return v2;
}

- (NPKIDVRemoteDeviceServiceContext)initWithCoder:(id)a3
{
  id v4;
  NPKIDVRemoteDeviceServiceContext *v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *p_super;
  NSObject *v18;
  _BOOL4 v19;
  uint8_t v20[16];
  uint8_t buf[16];

  v4 = a3;
  if (v4)
  {
    v5 = -[NPKIDVRemoteDeviceServiceContext init](self, "init");
    if (v5)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("remoteDeviceID"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "length"))
      {
        objc_storeStrong((id *)&v5->_remoteDeviceID, v6);
      }
      else
      {
        pk_Payment_log();
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

        if (v8)
        {
          pk_Payment_log();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Missing remote DeviceID from archived context, generating a new one", buf, 2u);
          }

        }
      }
      v10 = (void *)MEMORY[0x24BDBCF20];
      v11 = objc_opt_class();
      v12 = objc_opt_class();
      objc_msgSend(v10, "setWithObjects:", v11, v12, objc_opt_class(), 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("eventsToServiceNames"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        v15 = objc_msgSend(v14, "mutableCopy");
        p_super = &v5->_eventsToServiceNames->super.super;
        v5->_eventsToServiceNames = (NSMutableDictionary *)v15;
      }
      else
      {
        pk_Payment_log();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);

        if (!v19)
          goto LABEL_13;
        pk_Payment_log();
        p_super = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v20 = 0;
          _os_log_impl(&dword_213518000, p_super, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Missing registered event from archived context, starting fresh", v20, 2u);
        }
      }

LABEL_13:
    }
  }
  else
  {

    v5 = 0;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *remoteDeviceID;
  id v5;

  remoteDeviceID = self->_remoteDeviceID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", remoteDeviceID, CFSTR("remoteDeviceID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_eventsToServiceNames, CFSTR("eventsToServiceNames"));

}

- (unint64_t)registerEvents:(unint64_t)a3 forServiceName:(id)a4
{
  id v6;
  void *v7;
  id v8;
  unint64_t v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  NPKIDVRemoteDeviceServiceContext *v15;
  id v16;

  v6 = a4;
  stringsArrayFromNPKIDVRemoteDeviceServiceEvents(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __66__NPKIDVRemoteDeviceServiceContext_registerEvents_forServiceName___block_invoke;
  v14 = &unk_24CFE9EC0;
  v15 = self;
  v16 = v6;
  v8 = v6;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", &v11);
  v9 = -[NPKIDVRemoteDeviceServiceContext _registeredEventsForServiceName:](self, "_registeredEventsForServiceName:", v8, v11, v12, v13, v14, v15);

  return v9;
}

void __66__NPKIDVRemoteDeviceServiceContext_registerEvents_forServiceName___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_serviceNamesForEventString:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_setServiceNames:forEventString:", v5, v4);

}

- (unint64_t)unregisterEvents:(unint64_t)a3 forServiceName:(id)a4
{
  id v6;
  void *v7;
  id v8;
  unint64_t v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  NPKIDVRemoteDeviceServiceContext *v15;
  id v16;

  v6 = a4;
  stringsArrayFromNPKIDVRemoteDeviceServiceEvents(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __68__NPKIDVRemoteDeviceServiceContext_unregisterEvents_forServiceName___block_invoke;
  v14 = &unk_24CFE9EC0;
  v15 = self;
  v16 = v6;
  v8 = v6;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", &v11);
  v9 = -[NPKIDVRemoteDeviceServiceContext _registeredEventsForServiceName:](self, "_registeredEventsForServiceName:", v8, v11, v12, v13, v14, v15);

  return v9;
}

void __68__NPKIDVRemoteDeviceServiceContext_unregisterEvents_forServiceName___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_serviceNamesForEventString:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_setServiceNames:forEventString:", v5, v4);

}

- (id)serviceNamesForEvent:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  stringsArrayFromNPKIDVRemoteDeviceServiceEvents(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[NPKIDVRemoteDeviceServiceContext _serviceNamesForEventString:](self, "_serviceNamesForEventString:", v5);
  else
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_serviceNamesForEventString:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_eventsToServiceNames, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = (id)objc_msgSend(v3, "mutableCopy");
  }
  else
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  }
  v5 = v4;

  return v5;
}

- (void)_setServiceNames:(id)a3 forEventString:(id)a4
{
  id v6;
  uint64_t v7;
  NSMutableDictionary *eventsToServiceNames;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = objc_msgSend(v9, "count");
  eventsToServiceNames = self->_eventsToServiceNames;
  if (v7)
    -[NSMutableDictionary setObject:forKeyedSubscript:](eventsToServiceNames, "setObject:forKeyedSubscript:", v9, v6);
  else
    -[NSMutableDictionary removeObjectForKey:](eventsToServiceNames, "removeObjectForKey:", v6);

}

- (unint64_t)_registeredEventsForServiceName:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *eventsToServiceNames;
  id v7;
  id v8;
  unint64_t v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSMutableDictionary count](self->_eventsToServiceNames, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  eventsToServiceNames = self->_eventsToServiceNames;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __68__NPKIDVRemoteDeviceServiceContext__registeredEventsForServiceName___block_invoke;
  v11[3] = &unk_24CFE9EE8;
  v12 = v4;
  v13 = v5;
  v7 = v5;
  v8 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](eventsToServiceNames, "enumerateKeysAndObjectsUsingBlock:", v11);
  v9 = NPKIDVRemoteDeviceServiceEventsFromStringsArray(v7);

  return v9;
}

void __68__NPKIDVRemoteDeviceServiceContext__registeredEventsForServiceName___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(a3, "containsObject:", *(_QWORD *)(a1 + 32)))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@:%p> {deviceID:%@, eventsToServiceNames:%@}"), objc_opt_class(), self, self->_remoteDeviceID, self->_eventsToServiceNames);
}

- (NSString)remoteDeviceID
{
  return self->_remoteDeviceID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteDeviceID, 0);
  objc_storeStrong((id *)&self->_eventsToServiceNames, 0);
}

@end
