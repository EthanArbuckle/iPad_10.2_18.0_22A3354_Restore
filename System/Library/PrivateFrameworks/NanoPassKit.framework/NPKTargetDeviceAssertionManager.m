@implementation NPKTargetDeviceAssertionManager

- (NPKTargetDeviceAssertionManager)initWithTransportationService:(id)a3
{
  id v5;
  NPKTargetDeviceAssertionManager *v6;
  NPKTargetDeviceAssertionManager *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *internalQueue;
  uint64_t v10;
  NSMutableDictionary *outstandingAssertionStatusUpdaters;
  uint64_t v12;
  NSMutableDictionary *assertTypesUUIDsMap;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NPKTargetDeviceAssertionManager;
  v6 = -[NPKTargetDeviceAssertionManager init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_transportationService, a3);
    v8 = dispatch_queue_create("com.apple.NanoPassKit.TargetDevice.AssertionManager", 0);
    internalQueue = v7->_internalQueue;
    v7->_internalQueue = (OS_dispatch_queue *)v8;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    outstandingAssertionStatusUpdaters = v7->_outstandingAssertionStatusUpdaters;
    v7->_outstandingAssertionStatusUpdaters = (NSMutableDictionary *)v10;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v12 = objc_claimAutoreleasedReturnValue();
    assertTypesUUIDsMap = v7->_assertTypesUUIDsMap;
    v7->_assertTypesUUIDsMap = (NSMutableDictionary *)v12;

  }
  return v7;
}

- (id)acquireAssertionOfType:(unint64_t)a3
{
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  NSObject *internalQueue;
  id v10;
  id v11;
  _QWORD block[4];
  id v14;
  NPKTargetDeviceAssertionManager *v15;
  unint64_t v16;
  uint8_t buf[4];
  unint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  pk_Payment_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    pk_Payment_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v18 = a3;
      v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Remote Assertion - Request acquire assertion of type:%lu with UUID:%@", buf, 0x16u);
    }

  }
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__NPKTargetDeviceAssertionManager_acquireAssertionOfType___block_invoke;
  block[3] = &unk_24CFE83A8;
  v16 = a3;
  v10 = v5;
  v14 = v10;
  v15 = self;
  dispatch_async(internalQueue, block);
  v11 = v10;

  return v11;
}

void __58__NPKTargetDeviceAssertionManager_acquireAssertionOfType___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NPKProtoAssertionRequest *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  __CFString *v13;
  uint8_t buf[4];
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = protobufAssertionTypeWithPKAssertionType(*(_QWORD *)(a1 + 48));
  if ((_DWORD)v2)
  {
    v3 = v2;
    v4 = objc_alloc_init(NPKProtoAssertionRequest);
    -[NPKProtoAssertionRequest setAssertionType:](v4, "setAssertionType:", v3);
    objc_msgSend(*(id *)(a1 + 32), "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKProtoAssertionRequest setRequestUUIDString:](v4, "setRequestUUIDString:", v5);

    -[NPKProtoAssertionRequest setPending:](v4, "setPending:", 1);
    objc_msgSend(*(id *)(a1 + 40), "_sendAssertionRequest:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 40), "_outstandingAssertionStatusUpdaterWithRequest:assertionType:assertionUUID:", v4, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "_addOutstandingAssertionStatusUpdater:withAssertType:", v7, v3);

    }
    else
    {
      pk_Payment_log();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

      if (v11)
      {
        pk_Payment_log();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          if ((_DWORD)v3 == 1)
          {
            v13 = CFSTR("Provisioning");
          }
          else if ((_DWORD)v3 == 2)
          {
            v13 = CFSTR("ProvisioningRequiringUpgradedPasscode");
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), v3);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          *(_DWORD *)buf = 138412290;
          v15 = v13;
          _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_ERROR, "Error: Remote Assertion - Failed to send Assertion request type:%@", buf, 0xCu);

        }
      }
    }

  }
  else
  {
    pk_Payment_log();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

    if (!v9)
      return;
    pk_Payment_log();
    v4 = (NPKProtoAssertionRequest *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v4->super.super.super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = CFSTR("Unknown");
      _os_log_impl(&dword_213518000, &v4->super.super.super, OS_LOG_TYPE_ERROR, "Error: Remote Assertion - Unknown assertion request type:%@", buf, 0xCu);
    }
  }

}

- (void)invalidateAssertionWithUUID:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  NSObject *internalQueue;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v4;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Remote Assertion - Request to invalidate assertion with UUID:%@", buf, 0xCu);
    }

  }
  internalQueue = self->_internalQueue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __63__NPKTargetDeviceAssertionManager_invalidateAssertionWithUUID___block_invoke;
  v10[3] = &unk_24CFE7E40;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  dispatch_async(internalQueue, v10);

}

void __63__NPKTargetDeviceAssertionManager_invalidateAssertionWithUUID___block_invoke(uint64_t a1)
{
  NPKProtoAssertionRequest *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_removeOutstandingAssertionStatusUpdaterWithUUID:", *(_QWORD *)(a1 + 40));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v2 = objc_alloc_init(NPKProtoAssertionRequest);
    -[NPKProtoAssertionRequest setAssertionType:](v2, "setAssertionType:", objc_msgSend(v6, "assertType"));
    objc_msgSend(v6, "assertionUUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKProtoAssertionRequest setRequestUUIDString:](v2, "setRequestUUIDString:", v4);

    -[NPKProtoAssertionRequest setPending:](v2, "setPending:", 0);
    v5 = (id)objc_msgSend(*(id *)(a1 + 32), "_sendAssertionRequest:", v2);

  }
}

- (id)assertionsUUIDsOfType:(unint64_t)a3
{
  uint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = protobufAssertionTypeWithPKAssertionType(a3);
  if (v4 >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_24CFEA280[(int)v4];
  }
  -[NPKTargetDeviceAssertionManager assertTypesUUIDsMap](self, "assertTypesUUIDsMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_msgSend(v7, "copy");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  return v9;
}

- (id)_sendAssertionRequest:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  __CFString *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_msgSend(v4, "assertionType");
      if (v8 >= 3)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = off_24CFEA280[(int)v8];
      }
      objc_msgSend(v4, "requestUUIDString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v22 = v9;
      v23 = 2112;
      v24 = v10;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Remote Assertion - Sending assertion request of type:%@ UUID:%@", buf, 0x16u);

    }
  }
  v11 = objc_alloc(MEMORY[0x24BE4FE40]);
  objc_msgSend(v4, "data");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithProtobufData:type:isResponse:", v12, 59, 0);

  -[NPKTargetDeviceAssertionManager transportationService](self, "transportationService");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __57__NPKTargetDeviceAssertionManager__sendAssertionRequest___block_invoke;
  v19[3] = &unk_24CFE79C0;
  v20 = v4;
  v15 = v4;
  -[NPKTargetDeviceAssertionManager _IDSSendOptions](self, "_IDSSendOptions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  NPKProtoSendWithOptions(v14, v13, 200, 0, 0, v19, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

void __57__NPKTargetDeviceAssertionManager__sendAssertionRequest___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  uint8_t buf[4];
  __CFString *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = objc_msgSend(*(id *)(a1 + 32), "assertionType");
      if (v5 >= 3)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), v5);
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = off_24CFEA280[(int)v5];
      }
      objc_msgSend(*(id *)(a1 + 32), "requestUUIDString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v9 = v6;
      v10 = 2112;
      v11 = v7;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_ERROR, "Error: Remote Assertion - Failed to sendAssertionrequest of type:%@ UUID:%@", buf, 0x16u);

    }
  }
}

- (id)_IDSSendOptions
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[4];
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE4FAC0];
  v5[0] = *MEMORY[0x24BE4FA90];
  v5[1] = v2;
  v6[0] = MEMORY[0x24BDBD1C8];
  v6[1] = MEMORY[0x24BDBD1C8];
  v3 = *MEMORY[0x24BE4FB30];
  v5[2] = *MEMORY[0x24BE4FB18];
  v5[3] = v3;
  v6[2] = CFSTR("AssertRequest");
  v6[3] = &unk_24D0566E0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_outstandingAssertionStatusUpdaterWithRequest:(id)a3 assertionType:(unint64_t)a4 assertionUUID:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NPKOutstandingAssertionStatusUpdater *v16;
  void *v17;
  NPKOutstandingAssertionStatusUpdater *v18;

  v8 = (objc_class *)MEMORY[0x24BE4FE40];
  v9 = a5;
  v10 = a3;
  v11 = [v8 alloc];
  objc_msgSend(v10, "data");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(v11, "initWithProtobufData:type:isResponse:", v12, 59, 0);
  -[NPKTargetDeviceAssertionManager _IDSSendOptions](self, "_IDSSendOptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 == 6)
    v15 = -1;
  else
    v15 = 12;
  v16 = [NPKOutstandingAssertionStatusUpdater alloc];
  -[NPKTargetDeviceAssertionManager transportationService](self, "transportationService");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[NPKIDSHeartbeat initWithPendingStatusProtobuf:service:priority:maxUpdates:responseIdentifier:sendOptions:queue:updateInterval:](v16, "initWithPendingStatusProtobuf:service:priority:maxUpdates:responseIdentifier:sendOptions:queue:updateInterval:", v13, v17, 200, v15, 0, v14, 30.0, self->_internalQueue);

  -[NPKOutstandingAssertionStatusUpdater setAssertType:](v18, "setAssertType:", protobufAssertionTypeWithPKAssertionType(a4));
  -[NPKOutstandingAssertionStatusUpdater setAssertionUUID:](v18, "setAssertionUUID:", v9);

  return v18;
}

- (void)_addOutstandingAssertionStatusUpdater:(id)a3 withAssertType:(int)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = *(_QWORD *)&a4;
  v13 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  -[NPKTargetDeviceAssertionManager outstandingAssertionStatusUpdaters](self, "outstandingAssertionStatusUpdaters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "assertionUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, v7);

  if (v4 >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = off_24CFEA280[(int)v4];
  }
  -[NPKTargetDeviceAssertionManager assertTypesUUIDsMap](self, "assertTypesUUIDsMap");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKTargetDeviceAssertionManager assertTypesUUIDsMap](self, "assertTypesUUIDsMap");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v8);

  }
  objc_msgSend(v13, "assertionUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v12);

}

- (id)_removeOutstandingAssertionStatusUpdaterWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  void *v11;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  -[NPKTargetDeviceAssertionManager outstandingAssertionStatusUpdaters](self, "outstandingAssertionStatusUpdaters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "invalidate");
    -[NPKTargetDeviceAssertionManager outstandingAssertionStatusUpdaters](self, "outstandingAssertionStatusUpdaters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", v4);

    v8 = objc_msgSend(v6, "assertType");
    if (v8 >= 3)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_24CFEA280[(int)v8];
    }
    -[NPKTargetDeviceAssertionManager assertTypesUUIDsMap](self, "assertTypesUUIDsMap");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObject:", v4);

  }
  return v6;
}

- (IDSService)transportationService
{
  return self->_transportationService;
}

- (NSMutableDictionary)outstandingAssertionStatusUpdaters
{
  return self->_outstandingAssertionStatusUpdaters;
}

- (void)setOutstandingAssertionStatusUpdaters:(id)a3
{
  objc_storeStrong((id *)&self->_outstandingAssertionStatusUpdaters, a3);
}

- (NSMutableDictionary)assertTypesUUIDsMap
{
  return self->_assertTypesUUIDsMap;
}

- (void)setAssertTypesUUIDsMap:(id)a3
{
  objc_storeStrong((id *)&self->_assertTypesUUIDsMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertTypesUUIDsMap, 0);
  objc_storeStrong((id *)&self->_outstandingAssertionStatusUpdaters, 0);
  objc_storeStrong((id *)&self->_transportationService, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end
