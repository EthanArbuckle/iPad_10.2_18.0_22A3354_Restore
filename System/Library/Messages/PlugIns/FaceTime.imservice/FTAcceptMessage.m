@implementation FTAcceptMessage

- (FTAcceptMessage)init
{
  FTAcceptMessage *v2;
  FTAcceptMessage *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FTAcceptMessage;
  v2 = -[FTFaceTimeMessage init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[IDSBaseMessage setTimeout:](v2, "setTimeout:", 60.0);
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FTAcceptMessage;
  return -[FTFaceTimeMessage copyWithZone:](&v4, sel_copyWithZone_, a3);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FTAcceptMessage;
  -[FTFaceTimeMessage dealloc](&v3, sel_dealloc);
}

- (id)bagKey
{
  return CFSTR("gk-invitation-accept");
}

- (id)requiredKeys
{
  id v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FTAcceptMessage;
  v2 = (id)objc_msgSend(-[FTFaceTimeMessage requiredKeys](&v4, sel_requiredKeys), "mutableCopy");
  if (!v2)
    v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v2, "addObject:", CFSTR("self-push-token"));
  objc_msgSend(v2, "addObject:", CFSTR("self-nat-type"));
  objc_msgSend(v2, "addObject:", CFSTR("self-blob"));
  objc_msgSend(v2, "addObject:", CFSTR("self-nat-ip"));
  objc_msgSend(v2, "addObject:", CFSTR("peer-id"));
  objc_msgSend(v2, "addObject:", CFSTR("peer-push-token"));
  objc_msgSend(v2, "addObject:", CFSTR("peer-nat-type"));
  objc_msgSend(v2, "addObject:", CFSTR("peer-blob"));
  objc_msgSend(v2, "addObject:", CFSTR("peer-nat-ip"));
  return v2;
}

- (id)messageBody
{
  __CFDictionary *v3;
  NSData *v4;
  const void *v5;
  NSData *v6;
  NSData *v7;
  NSString *v8;
  NSData *v9;
  const void *v10;
  NSData *v11;
  NSData *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)FTAcceptMessage;
  v3 = (__CFDictionary *)objc_msgSend(-[FTFaceTimeMessage messageBody](&v14, sel_messageBody), "mutableCopy");
  v4 = -[FTAcceptMessage selfPushToken](self, "selfPushToken");
  if (v4)
  {
    CFDictionarySetValue(v3, CFSTR("self-push-token"), v4);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22925B5B0();
  }
  v5 = (const void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[NSNumber intValue](-[FTAcceptMessage selfNATType](self, "selfNATType"), "intValue"));
  if (v5)
  {
    CFDictionarySetValue(v3, CFSTR("self-nat-type"), v5);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22925B530();
  }
  v6 = -[FTAcceptMessage selfBlob](self, "selfBlob");
  if (v6)
  {
    CFDictionarySetValue(v3, CFSTR("self-blob"), v6);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22925B4B0();
  }
  v7 = -[FTAcceptMessage selfNATIP](self, "selfNATIP");
  if (v7)
  {
    CFDictionarySetValue(v3, CFSTR("self-nat-ip"), v7);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22925B430();
  }
  v8 = -[FTAcceptMessage peerID](self, "peerID");
  if (v8)
  {
    CFDictionarySetValue(v3, CFSTR("peer-id"), v8);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22925B3B0();
  }
  v9 = -[FTAcceptMessage peerPushToken](self, "peerPushToken");
  if (v9)
  {
    CFDictionarySetValue(v3, CFSTR("peer-push-token"), v9);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22925B330();
  }
  v10 = (const void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[NSNumber intValue](-[FTAcceptMessage peerNATType](self, "peerNATType"), "intValue"));
  if (v10)
  {
    CFDictionarySetValue(v3, CFSTR("peer-nat-type"), v10);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22925B2B0();
  }
  v11 = -[FTAcceptMessage peerBlob](self, "peerBlob");
  if (v11)
  {
    CFDictionarySetValue(v3, CFSTR("peer-blob"), v11);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22925B230();
  }
  v12 = -[FTAcceptMessage peerNATIP](self, "peerNATIP");
  if (v12)
  {
    CFDictionarySetValue(v3, CFSTR("peer-nat-ip"), v12);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22925B1B0();
  }
  return v3;
}

- (void)handleResponseDictionary:(id)a3
{
  if (objc_msgSend(a3, "objectForKey:", CFSTR("relay-type")))
  {
    -[FTAcceptMessage setRelayType:](self, "setRelayType:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("relay-type")), "intValue")));
    -[FTAcceptMessage setRelayConnectionId:](self, "setRelayConnectionId:", objc_msgSend(a3, "objectForKey:", CFSTR("relay-connection-id")));
    -[FTAcceptMessage setRelayTransactionIdAlloc:](self, "setRelayTransactionIdAlloc:", objc_msgSend(a3, "objectForKey:", CFSTR("relay-transaction-id-alloc")));
    -[FTAcceptMessage setRelayTokenAllocReq:](self, "setRelayTokenAllocReq:", objc_msgSend(a3, "objectForKey:", CFSTR("relay-token-alloc-req")));
    -[FTAcceptMessage setSelfRelayIP:](self, "setSelfRelayIP:", objc_msgSend(a3, "objectForKey:", CFSTR("self-relay-ip")));
    -[FTAcceptMessage setSelfRelayPort:](self, "setSelfRelayPort:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("self-relay-port")), "intValue")));
    -[FTAcceptMessage setPeerRelayIP:](self, "setPeerRelayIP:", objc_msgSend(a3, "objectForKey:", CFSTR("peer-relay-ip")));
    -[FTAcceptMessage setPeerRelayPort:](self, "setPeerRelayPort:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("peer-relay-port")), "intValue")));
  }
}

- (NSData)selfPushToken
{
  return (NSData *)objc_getProperty(self, a2, 432, 1);
}

- (void)setSelfPushToken:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 432);
}

- (NSNumber)selfNATType
{
  return (NSNumber *)objc_getProperty(self, a2, 440, 1);
}

- (void)setSelfNATType:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 440);
}

- (NSData)selfBlob
{
  return (NSData *)objc_getProperty(self, a2, 448, 1);
}

- (void)setSelfBlob:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 448);
}

- (NSData)selfNATIP
{
  return (NSData *)objc_getProperty(self, a2, 456, 1);
}

- (void)setSelfNATIP:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 456);
}

- (NSString)peerID
{
  return (NSString *)objc_getProperty(self, a2, 464, 1);
}

- (void)setPeerID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 464);
}

- (NSData)peerPushToken
{
  return (NSData *)objc_getProperty(self, a2, 472, 1);
}

- (void)setPeerPushToken:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 472);
}

- (NSNumber)peerNATType
{
  return (NSNumber *)objc_getProperty(self, a2, 480, 1);
}

- (void)setPeerNATType:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 480);
}

- (NSData)peerBlob
{
  return (NSData *)objc_getProperty(self, a2, 488, 1);
}

- (void)setPeerBlob:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 488);
}

- (NSData)peerNATIP
{
  return (NSData *)objc_getProperty(self, a2, 496, 1);
}

- (void)setPeerNATIP:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 496);
}

- (NSNumber)relayType
{
  return (NSNumber *)objc_getProperty(self, a2, 504, 1);
}

- (void)setRelayType:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 504);
}

- (NSData)relayConnectionId
{
  return (NSData *)objc_getProperty(self, a2, 512, 1);
}

- (void)setRelayConnectionId:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 512);
}

- (NSData)relayTransactionIdAlloc
{
  return (NSData *)objc_getProperty(self, a2, 520, 1);
}

- (void)setRelayTransactionIdAlloc:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 520);
}

- (NSData)relayTokenAllocReq
{
  return (NSData *)objc_getProperty(self, a2, 528, 1);
}

- (void)setRelayTokenAllocReq:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 528);
}

- (NSData)selfRelayIP
{
  return (NSData *)objc_getProperty(self, a2, 536, 1);
}

- (void)setSelfRelayIP:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 536);
}

- (NSNumber)selfRelayPort
{
  return (NSNumber *)objc_getProperty(self, a2, 544, 1);
}

- (void)setSelfRelayPort:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 544);
}

- (NSData)peerRelayIP
{
  return (NSData *)objc_getProperty(self, a2, 552, 1);
}

- (void)setPeerRelayIP:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 552);
}

- (NSNumber)peerRelayPort
{
  return (NSNumber *)objc_getProperty(self, a2, 560, 1);
}

- (void)setPeerRelayPort:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 560);
}

@end
