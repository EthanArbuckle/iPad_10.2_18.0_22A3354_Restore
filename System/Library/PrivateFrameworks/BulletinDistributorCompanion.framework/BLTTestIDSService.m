@implementation BLTTestIDSService

- (BLTTestIDSService)initWithService:(id)a3
{
  id v4;
  BLTTestIDSService *v5;
  BLTTestIDSService *v6;
  uint64_t v7;
  NSString *service;
  uint64_t v9;
  NSMutableDictionary *actionsByRequestType;
  uint64_t v11;
  NSMutableDictionary *actionsByResponseType;
  uint64_t v13;
  NSMutableArray *delegates;
  BLTPBProtobufSequenceNumberManager *v15;
  BLTPBProtobufSequenceNumberManager *sequenceNumberManager;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)BLTTestIDSService;
  v5 = -[BLTTestIDSService init](&v18, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_currentIdentifier = 1;
    v7 = objc_msgSend(v4, "copy");
    service = v6->_service;
    v6->_service = (NSString *)v7;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    actionsByRequestType = v6->_actionsByRequestType;
    v6->_actionsByRequestType = (NSMutableDictionary *)v9;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    actionsByResponseType = v6->_actionsByResponseType;
    v6->_actionsByResponseType = (NSMutableDictionary *)v11;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v13 = objc_claimAutoreleasedReturnValue();
    delegates = v6->_delegates;
    v6->_delegates = (NSMutableArray *)v13;

    v15 = -[BLTPBProtobufSequenceNumberManager initWithServiceName:updateSequenceNumbersOnOutOfOrder:]([BLTPBProtobufSequenceNumberManager alloc], "initWithServiceName:updateSequenceNumbersOnOutOfOrder:", v6->_service, 0);
    sequenceNumberManager = v6->_sequenceNumberManager;
    v6->_sequenceNumberManager = v15;

  }
  return v6;
}

- (BLTAbstractIDSDevice)defaultPairedDevice
{
  BLTTestIDSDevice *v2;

  v2 = objc_alloc_init(BLTTestIDSDevice);
  -[BLTTestIDSDevice setIsConnected:](v2, "setIsConnected:", 1);
  -[BLTTestIDSDevice setIsDefaultPairedDevice:](v2, "setIsDefaultPairedDevice:", 1);
  -[BLTTestIDSDevice setIsNearby:](v2, "setIsNearby:", 1);
  return (BLTAbstractIDSDevice *)v2;
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  BLTTestIDSServiceDelegate *v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(BLTTestIDSServiceDelegate);
  -[BLTTestIDSServiceDelegate setDelegate:](v8, "setDelegate:", v7);

  -[BLTTestIDSServiceDelegate setQueue:](v8, "setQueue:", v6);
  -[NSMutableArray addObject:](self->_delegates, "addObject:", v8);

}

- (void)removeDelegate:(id)a3
{
  id v4;
  NSMutableArray *delegates;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *, uint64_t, _BYTE *);
  void *v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0x7FFFFFFFFFFFFFFFLL;
  delegates = self->_delegates;
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __36__BLTTestIDSService_removeDelegate___block_invoke;
  v10 = &unk_24D762E80;
  v6 = v4;
  v11 = v6;
  v12 = &v13;
  -[NSMutableArray enumerateObjectsUsingBlock:](delegates, "enumerateObjectsUsingBlock:", &v7);
  if (v14[3] != 0x7FFFFFFFFFFFFFFFLL)
    -[NSMutableArray removeObjectAtIndex:](self->_delegates, "removeObjectAtIndex:", v7, v8, v9, v10);

  _Block_object_dispose(&v13, 8);
}

void __36__BLTTestIDSService_removeDelegate___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;

  objc_msgSend(a2, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 32);

  if (v7 == v8)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (void)setProtobufAction:(SEL)a3 forIncomingRequestsOfType:(unsigned __int16)a4
{
  uint64_t v4;
  NSMutableDictionary *actionsByRequestType;
  void *v7;
  id v8;

  v4 = a4;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  actionsByRequestType = self->_actionsByRequestType;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](actionsByRequestType, "setObject:forKeyedSubscript:", v8, v7);

}

- (void)setProtobufAction:(SEL)a3 forIncomingResponsesOfType:(unsigned __int16)a4
{
  uint64_t v4;
  NSMutableDictionary *actionsByResponseType;
  void *v7;
  id v8;

  v4 = a4;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  actionsByResponseType = self->_actionsByResponseType;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](actionsByResponseType, "setObject:forKeyedSubscript:", v8, v7);

}

- (BOOL)sendProtobuf:(id)a3 toDestinations:(id)a4 priority:(int64_t)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8
{
  id v10;
  unint64_t v11;
  NSMutableArray *delegates;
  id *v13;
  _QWORD v15[4];
  id *v16;
  unint64_t v17;

  v10 = a3;
  if (a7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), self->_currentIdentifier);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
    ++self->_currentIdentifier;
    a7 = (id *)*a7;
  }
  else
  {
    ++self->_currentIdentifier;
  }
  v11 = -[BLTTestIDSService _randomSendDelay](self, "_randomSendDelay");
  delegates = self->_delegates;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __83__BLTTestIDSService_sendProtobuf_toDestinations_priority_options_identifier_error___block_invoke;
  v15[3] = &unk_24D762EA8;
  v16 = a7;
  v17 = v11;
  v13 = a7;
  -[NSMutableArray enumerateObjectsUsingBlock:](delegates, "enumerateObjectsUsingBlock:", v15);
  -[BLTTestIDSService _handleProtobuf:identifier:sendDelay:](self, "_handleProtobuf:identifier:sendDelay:", v10, v13, v11);

  return 1;
}

void __83__BLTTestIDSService_sendProtobuf_toDestinations_priority_options_identifier_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  dispatch_time_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = dispatch_time(0, 1000000000 * *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __83__BLTTestIDSService_sendProtobuf_toDestinations_priority_options_identifier_error___block_invoke_2;
  v7[3] = &unk_24D761AA8;
  v8 = v3;
  v9 = *(id *)(a1 + 32);
  v6 = v3;
  dispatch_after(v4, v5, v7);

}

void __83__BLTTestIDSService_sendProtobuf_toDestinations_priority_options_identifier_error___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "service:account:identifier:didSendWithSuccess:error:", 0, 0, *(_QWORD *)(a1 + 40), 1, 0);

}

- (BOOL)sendResourceAtURL:(id)a3 metadata:(id)a4 toDestinations:(id)a5 priority:(int64_t)a6 options:(id)a7 identifier:(id *)a8 error:(id *)a9
{
  return 0;
}

- (void)_handleProtobuf:(id)a3 identifier:(id)a4 sendDelay:(unint64_t)a5
{
  id v8;
  int v9;
  id v10;

  v10 = a3;
  v8 = a4;
  v9 = objc_msgSend(v10, "type");
  switch(v9)
  {
    case 13:
      -[BLTTestIDSService _sendSetSectionInfoResponseWithIdentifier:sendDelay:](self, "_sendSetSectionInfoResponseWithIdentifier:sendDelay:", v8, a5);
      break;
    case 12:
      -[BLTPBProtobufSequenceNumberManager setSessionState:](self->_sequenceNumberManager, "setSessionState:", 0);
      break;
    case 1:
      -[BLTTestIDSService _sendLightsAndSirensRequestForProtobuf:identifier:sendDelay:](self, "_sendLightsAndSirensRequestForProtobuf:identifier:sendDelay:", v10, v8, a5);
      break;
  }

}

- (id)_lightsAndSirensRequestForProtobuf:(id)a3
{
  id v4;
  BLTPBProtobuf *v5;
  BLTPBAddBulletinRequest *v6;
  void *v7;
  BLTPBAddBulletinRequest *v8;
  BLTPBHandleDidPlayLightsAndSirensReplyRequest *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  v5 = -[BLTPBProtobuf initWithIDSProtobuf:sequenceNumberManager:]([BLTPBProtobuf alloc], "initWithIDSProtobuf:sequenceNumberManager:", v4, self->_sequenceNumberManager);

  v6 = [BLTPBAddBulletinRequest alloc];
  -[BLTPBProtobuf data](v5, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[BLTPBAddBulletinRequest initWithData:](v6, "initWithData:", v7);

  v9 = objc_alloc_init(BLTPBHandleDidPlayLightsAndSirensReplyRequest);
  -[BLTPBHandleDidPlayLightsAndSirensReplyRequest setDidPlayLightsAndSirens:](v9, "setDidPlayLightsAndSirens:", 1);
  -[BLTPBAddBulletinRequest bulletin](v8, "bulletin");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "publisherBulletinID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBHandleDidPlayLightsAndSirensReplyRequest setPublisherMatchID:](v9, "setPublisherMatchID:", v11);

  -[BLTPBAddBulletinRequest bulletin](v8, "bulletin");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sectionID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBHandleDidPlayLightsAndSirensReplyRequest setPhoneSectionID:](v9, "setPhoneSectionID:", v13);

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "timeIntervalSince1970");
  -[BLTPBHandleDidPlayLightsAndSirensReplyRequest setDate:](v9, "setDate:");

  return v9;
}

- (void)_sendBlockToAllDelegatesAfterTime:(unint64_t)a3 block:(id)a4
{
  id v6;
  NSMutableArray *delegates;
  id v8;
  _QWORD v9[4];
  id v10;
  unint64_t v11;

  v6 = a4;
  delegates = self->_delegates;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __61__BLTTestIDSService__sendBlockToAllDelegatesAfterTime_block___block_invoke;
  v9[3] = &unk_24D762ED0;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  -[NSMutableArray enumerateObjectsUsingBlock:](delegates, "enumerateObjectsUsingBlock:", v9);

}

void __61__BLTTestIDSService__sendBlockToAllDelegatesAfterTime_block___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  dispatch_time_t v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  v4 = dispatch_time(0, *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __61__BLTTestIDSService__sendBlockToAllDelegatesAfterTime_block___block_invoke_2;
  v8[3] = &unk_24D761B20;
  v6 = *(id *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v7 = v3;
  dispatch_after(v4, v5, v8);

}

void __61__BLTTestIDSService__sendBlockToAllDelegatesAfterTime_block___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)_sendLightsAndSirensRequestForProtobuf:(id)a3 identifier:(id)a4 sendDelay:(unint64_t)a5
{
  id v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = -[BLTTestIDSService _randomResponseDelay](self, "_randomResponseDelay");
  v14[0] = MEMORY[0x24BDAC760];
  v11 = 1000000000 * (v10 + a5);
  v14[1] = 3221225472;
  v14[2] = __81__BLTTestIDSService__sendLightsAndSirensRequestForProtobuf_identifier_sendDelay___block_invoke;
  v14[3] = &unk_24D762EF8;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v12 = v9;
  v13 = v8;
  -[BLTTestIDSService _sendBlockToAllDelegatesAfterTime:block:](self, "_sendBlockToAllDelegatesAfterTime:block:", v11, v14);

}

void __81__BLTTestIDSService__sendLightsAndSirensRequestForProtobuf_identifier_sendDelay___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  BLTPBProtobuf *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v3, "_lightsAndSirensRequestForProtobuf:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = -[BLTPBProtobuf initWithProtobuf:type:isResponse:sequenceNumberManager:]([BLTPBProtobuf alloc], "initWithProtobuf:type:isResponse:sequenceNumberManager:", v7, 9, 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
  objc_msgSend(*(id *)(a1 + 32), "_callDelegateActionForProtobuf:delegate:identifier:type:isResponse:", v6, v5, *(_QWORD *)(a1 + 48), 9, 0);

}

- (void)_sendSetSectionInfoResponseWithIdentifier:(id)a3 sendDelay:(unint64_t)a4
{
  id v6;
  unint64_t v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a3;
  v7 = 1000000000 * (-[BLTTestIDSService _randomResponseDelay](self, "_randomResponseDelay") + a4);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __73__BLTTestIDSService__sendSetSectionInfoResponseWithIdentifier_sendDelay___block_invoke;
  v9[3] = &unk_24D762F20;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  -[BLTTestIDSService _sendBlockToAllDelegatesAfterTime:block:](self, "_sendBlockToAllDelegatesAfterTime:block:", v7, v9);

}

void __73__BLTTestIDSService__sendSetSectionInfoResponseWithIdentifier_sendDelay___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BLTPBProtobuf *v4;
  BLTPBSetSectionInfoResponse *v5;

  v3 = a2;
  v5 = objc_alloc_init(BLTPBSetSectionInfoResponse);
  v4 = -[BLTPBProtobuf initWithProtobuf:type:isResponse:sequenceNumberManager:]([BLTPBProtobuf alloc], "initWithProtobuf:type:isResponse:sequenceNumberManager:", v5, 13, 1, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
  objc_msgSend(*(id *)(a1 + 32), "_callDelegateActionForProtobuf:delegate:identifier:type:isResponse:", v4, v3, *(_QWORD *)(a1 + 40), 13, 1);

}

- (void)_callDelegateActionForProtobuf:(id)a3 delegate:(id)a4 identifier:(id)a5 type:(unsigned __int16)a6 isResponse:(BOOL)a7
{
  _BOOL4 v7;
  uint64_t v8;
  id v12;
  objc_class *v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;

  v7 = a7;
  v8 = a6;
  v22 = a3;
  v12 = a4;
  v13 = (objc_class *)MEMORY[0x24BE4FC50];
  v14 = a5;
  v15 = objc_alloc_init(v13);
  objc_msgSend(v15, "setIncomingResponseIdentifier:", v14);
  objc_msgSend(v15, "setOutgoingResponseIdentifier:", v14);

  v16 = 16;
  if (v7)
    v16 = 24;
  v17 = *(id *)((char *)&self->super.isa + v16);
  objc_msgSend(v22, "setContext:", v15);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_msgSend(v19, "pointerValue");
  v21 = v12;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    ((void (*)(id, uint64_t, id))objc_msgSend(v21, "methodForSelector:", v20))(v21, v20, v22);
  objc_msgSend(v22, "setContext:", 0);

}

- (unint64_t)_randomSendDelay
{
  return -[BLTTestIDSService _randomValueBetweenMin:max:](self, "_randomValueBetweenMin:max:", self->_minimumSendDelay, self->_maximumSendDelay);
}

- (unint64_t)_randomResponseDelay
{
  return -[BLTTestIDSService _randomValueBetweenMin:max:](self, "_randomValueBetweenMin:max:", self->_minimumResponseDelay, self->_maximumResponseDelay);
}

- (unint64_t)_randomValueBetweenMin:(unint64_t)a3 max:(unint64_t)a4
{
  unint64_t v4;

  v4 = a3;
  if (a4 > a3)
    return arc4random() % (a4 - a3) + a3;
  return v4;
}

- (unint64_t)minimumSendDelay
{
  return self->_minimumSendDelay;
}

- (void)setMinimumSendDelay:(unint64_t)a3
{
  self->_minimumSendDelay = a3;
}

- (unint64_t)maximumSendDelay
{
  return self->_maximumSendDelay;
}

- (void)setMaximumSendDelay:(unint64_t)a3
{
  self->_maximumSendDelay = a3;
}

- (unint64_t)minimumResponseDelay
{
  return self->_minimumResponseDelay;
}

- (void)setMinimumResponseDelay:(unint64_t)a3
{
  self->_minimumResponseDelay = a3;
}

- (unint64_t)maximumResponseDelay
{
  return self->_maximumResponseDelay;
}

- (void)setMaximumResponseDelay:(unint64_t)a3
{
  self->_maximumResponseDelay = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sequenceNumberManager, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_actionsByResponseType, 0);
  objc_storeStrong((id *)&self->_actionsByRequestType, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end
