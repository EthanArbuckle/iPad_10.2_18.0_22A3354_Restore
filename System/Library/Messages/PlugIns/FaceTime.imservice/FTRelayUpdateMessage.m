@implementation FTRelayUpdateMessage

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FTRelayUpdateMessage;
  return -[FTFaceTimeMessage copyWithZone:](&v4, sel_copyWithZone_, a3);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FTRelayUpdateMessage;
  -[FTFaceTimeMessage dealloc](&v3, sel_dealloc);
}

- (id)bagKey
{
  return CFSTR("gk-invitation-relay-update");
}

- (id)requiredKeys
{
  void *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FTRelayUpdateMessage;
  v2 = (void *)objc_msgSend(-[FTFaceTimeMessage requiredKeys](&v4, sel_requiredKeys), "mutableCopy");
  objc_msgSend(v2, "addObject:", CFSTR("self-push-token"));
  objc_msgSend(v2, "addObject:", CFSTR("peer-id"));
  objc_msgSend(v2, "addObject:", CFSTR("peer-push-token"));
  objc_msgSend(v2, "addObject:", CFSTR("relay-type"));
  objc_msgSend(v2, "addObject:", CFSTR("relay-connection-id"));
  objc_msgSend(v2, "addObject:", CFSTR("relay-transaction-id-alloc"));
  objc_msgSend(v2, "addObject:", CFSTR("relay-token-alloc-res"));
  objc_msgSend(v2, "addObject:", CFSTR("self-relay-ip"));
  objc_msgSend(v2, "addObject:", CFSTR("self-relay-port"));
  objc_msgSend(v2, "addObject:", CFSTR("self-relay-nat-ip"));
  objc_msgSend(v2, "addObject:", CFSTR("self-relay-nat-port"));
  objc_msgSend(v2, "addObject:", CFSTR("peer-relay-ip"));
  objc_msgSend(v2, "addObject:", CFSTR("peer-relay-port"));
  return v2;
}

- (id)messageBody
{
  __CFDictionary *v3;
  NSData *v4;
  NSString *v5;
  NSData *v6;
  const void *v7;
  NSData *v8;
  NSData *v9;
  NSData *v10;
  NSData *v11;
  const void *v12;
  NSData *v13;
  const void *v14;
  NSData *v15;
  const void *v16;
  NSData *v17;
  NSData *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)FTRelayUpdateMessage;
  v3 = (__CFDictionary *)objc_msgSend(-[FTFaceTimeMessage messageBody](&v20, sel_messageBody), "mutableCopy");
  v4 = -[FTRelayUpdateMessage selfPushToken](self, "selfPushToken");
  if (v4)
  {
    CFDictionarySetValue(v3, CFSTR("self-push-token"), v4);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22925B5B0();
  }
  v5 = -[FTRelayUpdateMessage peerID](self, "peerID");
  if (v5)
  {
    CFDictionarySetValue(v3, CFSTR("peer-id"), v5);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22925B3B0();
  }
  v6 = -[FTRelayUpdateMessage peerPushToken](self, "peerPushToken");
  if (v6)
  {
    CFDictionarySetValue(v3, CFSTR("peer-push-token"), v6);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22925B330();
  }
  v7 = (const void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[NSNumber intValue](-[FTRelayUpdateMessage relayType](self, "relayType"), "intValue"));
  if (v7)
  {
    CFDictionarySetValue(v3, CFSTR("relay-type"), v7);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22925BAC8();
  }
  v8 = -[FTRelayUpdateMessage relayConnectionID](self, "relayConnectionID");
  if (v8)
  {
    CFDictionarySetValue(v3, CFSTR("relay-connection-id"), v8);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22925BA48();
  }
  v9 = -[FTRelayUpdateMessage relayTransactionIDAlloc](self, "relayTransactionIDAlloc");
  if (v9)
  {
    CFDictionarySetValue(v3, CFSTR("relay-transaction-id-alloc"), v9);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22925BCC8();
  }
  v10 = -[FTRelayUpdateMessage relayTokenAllocRes](self, "relayTokenAllocRes");
  if (v10)
  {
    CFDictionarySetValue(v3, CFSTR("relay-token-alloc-res"), v10);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22925BC48();
  }
  v11 = -[FTRelayUpdateMessage selfRelayIP](self, "selfRelayIP");
  if (v11)
  {
    CFDictionarySetValue(v3, CFSTR("self-relay-ip"), v11);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22925B9C8();
  }
  v12 = (const void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[NSNumber intValue](-[FTRelayUpdateMessage selfRelayPort](self, "selfRelayPort"), "intValue"));
  if (v12)
  {
    CFDictionarySetValue(v3, CFSTR("self-relay-port"), v12);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22925B948();
  }
  v13 = -[FTRelayUpdateMessage selfRelayNATIP](self, "selfRelayNATIP");
  if (v13)
  {
    CFDictionarySetValue(v3, CFSTR("self-relay-nat-ip"), v13);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22925BBC8();
  }
  v14 = (const void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[NSNumber intValue](-[FTRelayUpdateMessage selfRelayNATPort](self, "selfRelayNATPort"), "intValue"));
  if (v14)
  {
    CFDictionarySetValue(v3, CFSTR("self-relay-nat-port"), v14);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22925BB48();
  }
  v15 = -[FTRelayUpdateMessage peerRelayIP](self, "peerRelayIP");
  if (v15)
  {
    CFDictionarySetValue(v3, CFSTR("peer-relay-ip"), v15);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22925B8C8();
  }
  v16 = (const void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[NSNumber intValue](-[FTRelayUpdateMessage peerRelayPort](self, "peerRelayPort"), "intValue"));
  if (v16)
  {
    CFDictionarySetValue(v3, CFSTR("peer-relay-port"), v16);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22925B848();
  }
  v17 = -[FTRelayUpdateMessage selfRelayBlob](self, "selfRelayBlob");
  if (v17)
    CFDictionarySetValue(v3, CFSTR("self-relay-blob"), v17);
  v18 = -[FTRelayUpdateMessage relayCandidateID](self, "relayCandidateID");
  if (v18)
    CFDictionarySetValue(v3, CFSTR("relay-candidate-id"), v18);
  return v3;
}

- (NSData)selfPushToken
{
  return (NSData *)objc_getProperty(self, a2, 432, 1);
}

- (void)setSelfPushToken:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 432);
}

- (NSData)selfRelayBlob
{
  return (NSData *)objc_getProperty(self, a2, 440, 1);
}

- (void)setSelfRelayBlob:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 440);
}

- (NSString)peerID
{
  return (NSString *)objc_getProperty(self, a2, 448, 1);
}

- (void)setPeerID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 448);
}

- (NSData)peerPushToken
{
  return (NSData *)objc_getProperty(self, a2, 456, 1);
}

- (void)setPeerPushToken:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 456);
}

- (NSNumber)relayType
{
  return (NSNumber *)objc_getProperty(self, a2, 464, 1);
}

- (void)setRelayType:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 464);
}

- (NSData)relayConnectionID
{
  return (NSData *)objc_getProperty(self, a2, 472, 1);
}

- (void)setRelayConnectionID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 472);
}

- (NSData)relayTransactionIDAlloc
{
  return (NSData *)objc_getProperty(self, a2, 480, 1);
}

- (void)setRelayTransactionIDAlloc:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 480);
}

- (NSData)relayTokenAllocRes
{
  return (NSData *)objc_getProperty(self, a2, 488, 1);
}

- (void)setRelayTokenAllocRes:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 488);
}

- (NSData)relayCandidateID
{
  return (NSData *)objc_getProperty(self, a2, 496, 1);
}

- (void)setRelayCandidateID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 496);
}

- (NSData)selfRelayIP
{
  return (NSData *)objc_getProperty(self, a2, 504, 1);
}

- (void)setSelfRelayIP:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 504);
}

- (NSNumber)selfRelayPort
{
  return (NSNumber *)objc_getProperty(self, a2, 512, 1);
}

- (void)setSelfRelayPort:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 512);
}

- (NSData)selfRelayNATIP
{
  return (NSData *)objc_getProperty(self, a2, 520, 1);
}

- (void)setSelfRelayNATIP:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 520);
}

- (NSNumber)selfRelayNATPort
{
  return (NSNumber *)objc_getProperty(self, a2, 528, 1);
}

- (void)setSelfRelayNATPort:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 528);
}

- (NSData)peerRelayIP
{
  return (NSData *)objc_getProperty(self, a2, 536, 1);
}

- (void)setPeerRelayIP:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 536);
}

- (NSNumber)peerRelayPort
{
  return (NSNumber *)objc_getProperty(self, a2, 544, 1);
}

- (void)setPeerRelayPort:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 544);
}

@end
