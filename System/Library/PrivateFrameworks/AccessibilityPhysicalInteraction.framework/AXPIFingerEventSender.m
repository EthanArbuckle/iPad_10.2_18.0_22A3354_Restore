@implementation AXPIFingerEventSender

- (AXPIFingerEventSender)init
{
  return -[AXPIFingerEventSender initWithDisplayUUID:](self, "initWithDisplayUUID:", 0);
}

- (AXPIFingerEventSender)initWithDisplayUUID:(id)a3
{
  id v5;
  AXPIFingerEventSender *v6;
  AXPIFingerEventSender *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *eventSendingQueue;
  HIDVirtualEventService *v10;
  HIDVirtualEventService *eventService;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSDictionary *v18;
  NSDictionary *v19;
  NSDictionary *properties;
  NSDictionary *v21;
  NSObject *v22;
  _QWORD block[4];
  AXPIFingerEventSender *v25;
  objc_super v26;
  _QWORD v27[2];
  _QWORD v28[2];
  void *v29;
  _QWORD v30[9];
  _QWORD v31[10];

  v31[9] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)AXPIFingerEventSender;
  v6 = -[AXPIFingerEventSender init](&v26, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_displayUUID, a3);
    v8 = dispatch_queue_create("AXPIFingerEventSendingQueue", 0);
    eventSendingQueue = v7->_eventSendingQueue;
    v7->_eventSendingQueue = (OS_dispatch_queue *)v8;

    -[AXPIFingerEventSender setSenderID:](v7, "setSenderID:", 0x8000000817319372);
    v10 = (HIDVirtualEventService *)objc_alloc_init(MEMORY[0x24BE3E810]);
    eventService = v7->_eventService;
    v7->_eventService = v10;

    v31[0] = CFSTR("AXPIFingerTransport");
    v30[0] = CFSTR("Transport");
    v30[1] = CFSTR("PrimaryUsagePage");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", 13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v12;
    v30[2] = CFSTR("PrimaryUsage");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v31[2] = v13;
    v31[3] = MEMORY[0x24BDBD1C8];
    v30[3] = CFSTR("Authenticated");
    v30[4] = CFSTR("Built-In");
    v31[4] = MEMORY[0x24BDBD1C8];
    v31[5] = MEMORY[0x24BDBD1C8];
    v30[5] = CFSTR("DisplayIntegrated");
    v30[6] = CFSTR("VendorID");
    v31[6] = &unk_24F47C978;
    v31[7] = &unk_24F47C978;
    v30[7] = CFSTR("ProductID");
    v30[8] = CFSTR("DeviceUsagePairs");
    v27[0] = CFSTR("DeviceUsagePage");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", 13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = CFSTR("DeviceUsage");
    v28[0] = v14;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v29, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v31[8] = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 9);
    v18 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v19 = (NSDictionary *)-[NSDictionary mutableCopy](v18, "mutableCopy");
      -[NSDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], CFSTR("Built-In"));
      -[NSDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v5, CFSTR("displayUUID"));

      v18 = v19;
    }
    properties = v7->_properties;
    v7->_properties = v18;
    v21 = v18;

    v22 = v7->_eventSendingQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __45__AXPIFingerEventSender_initWithDisplayUUID___block_invoke;
    block[3] = &unk_24F4785E8;
    v25 = v7;
    dispatch_sync(v22, block);

  }
  return v7;
}

uint64_t __45__AXPIFingerEventSender_initWithDisplayUUID___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setDelegate:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setCancelHandler:", &__block_literal_global);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setDispatchQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "activate");
}

- (void)dealloc
{
  NSObject *eventSendingQueue;
  objc_super v4;
  _QWORD block[5];

  eventSendingQueue = self->_eventSendingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__AXPIFingerEventSender_dealloc__block_invoke;
  block[3] = &unk_24F4785E8;
  block[4] = self;
  dispatch_sync(eventSendingQueue, block);
  v4.receiver = self;
  v4.super_class = (Class)AXPIFingerEventSender;
  -[AXPIFingerEventSender dealloc](&v4, sel_dealloc);
}

void __32__AXPIFingerEventSender_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "cancel");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

}

- (void)setSenderID:(unint64_t)a3
{
  self->_senderID = a3;
}

- (void)startNewGeneration
{
  ++self->_eventGenerationCount;
}

- (void)performDownWithTouches:(id)a3
{
  id v4;

  -[AXPIFingerEventSender _assignFingerIdentifiersToTouches:](self, "_assignFingerIdentifiersToTouches:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXPIFingerEventSender performDownWithTouchesByFingerIdentifier:](self, "performDownWithTouchesByFingerIdentifier:", v4);

}

- (void)performDownWithTouchesByFingerIdentifier:(id)a3
{
  -[AXPIFingerEventSender _sendHandEvent:touchesByFingerIdentifier:](self, "_sendHandEvent:touchesByFingerIdentifier:", 1, a3);
}

- (void)performMoveWithTouches:(id)a3
{
  id v4;

  -[AXPIFingerEventSender _assignFingerIdentifiersToTouches:](self, "_assignFingerIdentifiersToTouches:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXPIFingerEventSender performMoveWithTouchesByFingerIdentifier:](self, "performMoveWithTouchesByFingerIdentifier:", v4);

}

- (void)performMoveWithTouchesByFingerIdentifier:(id)a3
{
  -[AXPIFingerEventSender _sendHandEvent:touchesByFingerIdentifier:](self, "_sendHandEvent:touchesByFingerIdentifier:", 2, a3);
}

- (void)performUpWithTouches:(id)a3
{
  id v4;

  -[AXPIFingerEventSender _assignFingerIdentifiersToTouches:](self, "_assignFingerIdentifiersToTouches:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXPIFingerEventSender performUpWithTouchesByFingerIdentifier:](self, "performUpWithTouchesByFingerIdentifier:", v4);

}

- (void)performUpWithTouchesByFingerIdentifier:(id)a3
{
  -[AXPIFingerEventSender _sendHandEvent:touchesByFingerIdentifier:](self, "_sendHandEvent:touchesByFingerIdentifier:", 6, a3);
}

- (void)_sendHandEvent:(unsigned int)a3 touchesByFingerIdentifier:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  const void *v24;
  _QWORD v25[6];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  _QWORD v32[4];
  id v33;
  uint64_t *v34;
  int v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy_;
    v30 = __Block_byref_object_dispose_;
    v31 = 0;
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "openSessions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x24BDAC760];
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __66__AXPIFingerEventSender__sendHandEvent_touchesByFingerIdentifier___block_invoke;
    v25[3] = &unk_24F478610;
    v25[4] = self;
    v25[5] = &v26;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v25);

    v10 = (void *)v27[5];
    if (!v10)
    {
      objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v27[5];
      v27[5] = v11;

      v10 = (void *)v27[5];
    }
    v13 = v6;
    v14 = v10;
    v15 = objc_msgSend(v13, "count");
    if ((_DWORD)v4 == 8 || v15)
    {
      objc_msgSend(MEMORY[0x24BE00628], "touchRepresentationWithHandType:location:", v4, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setAdditionalFlags:", objc_msgSend(v16, "additionalFlags"));
      v36 = 0;
      v37 = &v36;
      v38 = 0x3032000000;
      v39 = __Block_byref_object_copy_;
      v40 = __Block_byref_object_dispose_;
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v41 = (id)objc_claimAutoreleasedReturnValue();
      v32[0] = v9;
      v32[1] = 3221225472;
      v32[2] = __AXPIEventRepresentationFromTouches_block_invoke;
      v32[3] = &unk_24F478638;
      v17 = v14;
      v35 = v4;
      v33 = v17;
      v34 = &v36;
      objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v32);
      v18 = v37[5];
      objc_msgSend(v16, "handInfo");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setPaths:", v18);

      _Block_object_dispose(&v36, 8);
    }
    else
    {
      v16 = 0;
    }

    objc_msgSend(v16, "setGenerationCount:", self->_eventGenerationCount);
    if (v16)
    {
      if (-[AXPIFingerEventSender shouldAddRealEventFlag](self, "shouldAddRealEventFlag"))
        objc_msgSend(v16, "setAdditionalFlags:", objc_msgSend(v16, "additionalFlags") | 0x8000);
      -[AXPIFingerEventSender properties](self, "properties");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "valueForKey:", CFSTR("Built-In"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setIsBuiltIn:", objc_msgSend(v21, "BOOLValue"));

      -[AXPIFingerEventSender properties](self, "properties");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "valueForKey:", CFSTR("DisplayIntegrated"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setIsDisplayIntegrated:", objc_msgSend(v23, "BOOLValue"));

      v24 = (const void *)objc_msgSend(v16, "newHIDEventRef");
      if (v24)
      {
        IOHIDEventSetSenderID();
        -[HIDVirtualEventService dispatchEvent:](self->_eventService, "dispatchEvent:", v24);
        CFRelease(v24);
      }
    }

    _Block_object_dispose(&v26, 8);
  }

}

void __66__AXPIFingerEventSender__sendHandEvent_touchesByFingerIdentifier___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;

  objc_msgSend(a2, "scene");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = v15;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v15, "screen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "displayConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hardwareIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9
      || (objc_msgSend(*(id *)(a1 + 32), "displayUUID"), (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(*(id *)(a1 + 32), "displayUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqualToString:", v10);

      if (v9)
      {
        if (!v11)
        {
LABEL_7:

          v6 = v15;
          goto LABEL_8;
        }
      }
      else
      {

        if ((v11 & 1) == 0)
          goto LABEL_7;
      }
    }
    objc_msgSend(v15, "screen");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    *a3 = 1;
    goto LABEL_7;
  }
LABEL_8:

}

- (id)_assignFingerIdentifiersToTouches:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    v9 = 1;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v9 + v10, (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v12);

        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v9 += v10;
    }
    while (v7);
  }

  return v4;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4 forService:(id)a5
{
  return 0;
}

- (id)propertyForKey:(id)a3 forService:(id)a4
{
  return -[NSDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", a3, a4);
}

- (id)copyEventMatching:(id)a3 forService:(id)a4
{
  return 0;
}

- (BOOL)setOutputEvent:(id)a3 forService:(id)a4
{
  return 0;
}

- (BOOL)shouldAddRealEventFlag
{
  return self->_shouldAddRealEventFlag;
}

- (void)setShouldAddRealEventFlag:(BOOL)a3
{
  self->_shouldAddRealEventFlag = a3;
}

- (unint64_t)senderID
{
  return self->_senderID;
}

- (HIDVirtualEventService)eventService
{
  return self->_eventService;
}

- (void)setEventService:(id)a3
{
  objc_storeStrong((id *)&self->_eventService, a3);
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
  objc_storeStrong((id *)&self->_properties, a3);
}

- (OS_dispatch_queue)eventSendingQueue
{
  return self->_eventSendingQueue;
}

- (void)setEventSendingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_eventSendingQueue, a3);
}

- (NSString)displayUUID
{
  return self->_displayUUID;
}

- (void)setDisplayUUID:(id)a3
{
  objc_storeStrong((id *)&self->_displayUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayUUID, 0);
  objc_storeStrong((id *)&self->_eventSendingQueue, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_eventService, 0);
}

@end
