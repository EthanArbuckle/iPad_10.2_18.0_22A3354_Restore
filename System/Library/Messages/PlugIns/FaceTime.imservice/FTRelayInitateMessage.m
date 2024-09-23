@implementation FTRelayInitateMessage

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FTRelayInitateMessage;
  return -[FTFaceTimeMessage copyWithZone:](&v4, sel_copyWithZone_, a3);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FTRelayInitateMessage;
  -[FTFaceTimeMessage dealloc](&v3, sel_dealloc);
}

- (id)bagKey
{
  return CFSTR("gk-invitation-relay-initiate");
}

- (id)requiredKeys
{
  void *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FTRelayInitateMessage;
  v2 = (void *)objc_msgSend(-[FTFaceTimeMessage requiredKeys](&v4, sel_requiredKeys), "mutableCopy");
  objc_msgSend(v2, "addObject:", CFSTR("self-push-token"));
  objc_msgSend(v2, "addObject:", CFSTR("self-nat-type"));
  objc_msgSend(v2, "addObject:", CFSTR("self-nat-ip"));
  objc_msgSend(v2, "addObject:", CFSTR("peer-id"));
  objc_msgSend(v2, "addObject:", CFSTR("peer-push-token"));
  objc_msgSend(v2, "addObject:", CFSTR("peer-nat-type"));
  objc_msgSend(v2, "addObject:", CFSTR("peer-nat-ip"));
  return v2;
}

- (id)messageBody
{
  __CFDictionary *v3;
  NSData *v4;
  const void *v5;
  NSNumber *v6;
  NSString *v7;
  NSData *v8;
  const void *v9;
  NSNumber *v10;
  NSData *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)FTRelayInitateMessage;
  v3 = (__CFDictionary *)objc_msgSend(-[FTFaceTimeMessage messageBody](&v13, sel_messageBody), "mutableCopy");
  v4 = -[FTRelayInitateMessage selfPushToken](self, "selfPushToken");
  if (v4)
  {
    CFDictionarySetValue(v3, CFSTR("self-push-token"), v4);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22925B5B0();
  }
  v5 = (const void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[NSNumber intValue](-[FTRelayInitateMessage selfNatType](self, "selfNatType"), "intValue"));
  if (v5)
  {
    CFDictionarySetValue(v3, CFSTR("self-nat-type"), v5);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22925B530();
  }
  v6 = -[FTRelayInitateMessage selfNATIP](self, "selfNATIP");
  if (v6)
  {
    CFDictionarySetValue(v3, CFSTR("self-nat-ip"), v6);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22925B430();
  }
  v7 = -[FTRelayInitateMessage peerID](self, "peerID");
  if (v7)
  {
    CFDictionarySetValue(v3, CFSTR("peer-id"), v7);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22925B3B0();
  }
  v8 = -[FTRelayInitateMessage peerPushToken](self, "peerPushToken");
  if (v8)
  {
    CFDictionarySetValue(v3, CFSTR("peer-push-token"), v8);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22925B330();
  }
  v9 = (const void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[NSNumber intValue](-[FTRelayInitateMessage peerNatType](self, "peerNatType"), "intValue"));
  if (v9)
  {
    CFDictionarySetValue(v3, CFSTR("peer-nat-type"), v9);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22925B2B0();
  }
  v10 = -[FTRelayInitateMessage peerNATIP](self, "peerNATIP");
  if (v10)
  {
    CFDictionarySetValue(v3, CFSTR("peer-nat-ip"), v10);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22925B1B0();
  }
  v11 = -[FTRelayInitateMessage relayCandidateID](self, "relayCandidateID");
  if (v11)
    CFDictionarySetValue(v3, CFSTR("relay-candidate-id"), v11);
  return v3;
}

- (void)handleResponseDictionary:(id)a3
{
  -[FTRelayInitateMessage setRelayType:](self, "setRelayType:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("relay-type")), "intValue")));
  -[FTRelayInitateMessage setRelayConnectionId:](self, "setRelayConnectionId:", objc_msgSend(a3, "objectForKey:", CFSTR("relay-connection-id")));
  -[FTRelayInitateMessage setRelayTransactionIdAlloc:](self, "setRelayTransactionIdAlloc:", objc_msgSend(a3, "objectForKey:", CFSTR("relay-transaction-id-alloc")));
  -[FTRelayInitateMessage setRelayTokenAllocReq:](self, "setRelayTokenAllocReq:", objc_msgSend(a3, "objectForKey:", CFSTR("relay-token-alloc-req")));
  -[FTRelayInitateMessage setSelfRelayIP:](self, "setSelfRelayIP:", objc_msgSend(a3, "objectForKey:", CFSTR("self-relay-ip")));
  -[FTRelayInitateMessage setSelfRelayPort:](self, "setSelfRelayPort:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("self-relay-port")), "intValue")));
  -[FTRelayInitateMessage setPeerRelayIP:](self, "setPeerRelayIP:", objc_msgSend(a3, "objectForKey:", CFSTR("peer-relay-ip")));
  -[FTRelayInitateMessage setPeerRelayPort:](self, "setPeerRelayPort:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("peer-relay-port")), "intValue")));
}

- (NSData)selfPushToken
{
  return (NSData *)objc_getProperty(self, a2, 432, 1);
}

- (void)setSelfPushToken:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 432);
}

- (NSNumber)selfNatType
{
  return (NSNumber *)objc_getProperty(self, a2, 440, 1);
}

- (void)setSelfNatType:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 440);
}

- (NSNumber)selfNATIP
{
  return (NSNumber *)objc_getProperty(self, a2, 448, 1);
}

- (void)setSelfNATIP:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 448);
}

- (NSString)peerID
{
  return (NSString *)objc_getProperty(self, a2, 456, 1);
}

- (void)setPeerID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 456);
}

- (NSData)peerPushToken
{
  return (NSData *)objc_getProperty(self, a2, 464, 1);
}

- (void)setPeerPushToken:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 464);
}

- (NSNumber)peerNatType
{
  return (NSNumber *)objc_getProperty(self, a2, 472, 1);
}

- (void)setPeerNatType:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 472);
}

- (NSNumber)peerNATIP
{
  return (NSNumber *)objc_getProperty(self, a2, 480, 1);
}

- (void)setPeerNATIP:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 480);
}

- (NSNumber)relayType
{
  return (NSNumber *)objc_getProperty(self, a2, 488, 1);
}

- (void)setRelayType:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 488);
}

- (NSData)relayConnectionId
{
  return (NSData *)objc_getProperty(self, a2, 496, 1);
}

- (void)setRelayConnectionId:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 496);
}

- (NSData)relayTransactionIdAlloc
{
  return (NSData *)objc_getProperty(self, a2, 504, 1);
}

- (void)setRelayTransactionIdAlloc:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 504);
}

- (NSData)relayTokenAllocReq
{
  return (NSData *)objc_getProperty(self, a2, 512, 1);
}

- (void)setRelayTokenAllocReq:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 512);
}

- (NSData)relayCandidateID
{
  return (NSData *)objc_getProperty(self, a2, 520, 1);
}

- (void)setRelayCandidateID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 520);
}

- (NSData)selfRelayIP
{
  return (NSData *)objc_getProperty(self, a2, 528, 1);
}

- (void)setSelfRelayIP:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 528);
}

- (NSNumber)selfRelayPort
{
  return (NSNumber *)objc_getProperty(self, a2, 536, 1);
}

- (void)setSelfRelayPort:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 536);
}

- (NSData)peerRelayIP
{
  return (NSData *)objc_getProperty(self, a2, 544, 1);
}

- (void)setPeerRelayIP:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 544);
}

- (NSNumber)peerRelayPort
{
  return (NSNumber *)objc_getProperty(self, a2, 552, 1);
}

- (void)setPeerRelayPort:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 552);
}

@end
