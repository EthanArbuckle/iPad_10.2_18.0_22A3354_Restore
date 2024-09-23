@implementation FTRelayCancelMessage

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FTRelayCancelMessage;
  return -[FTFaceTimeMessage copyWithZone:](&v4, sel_copyWithZone_, a3);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FTRelayCancelMessage;
  -[FTFaceTimeMessage dealloc](&v3, sel_dealloc);
}

- (id)bagKey
{
  return CFSTR("gk-invitation-relay-cancel");
}

- (id)requiredKeys
{
  void *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FTRelayCancelMessage;
  v2 = (void *)objc_msgSend(-[FTFaceTimeMessage requiredKeys](&v4, sel_requiredKeys), "mutableCopy");
  objc_msgSend(v2, "addObject:", CFSTR("peer-id"));
  objc_msgSend(v2, "addObject:", CFSTR("peer-push-token"));
  objc_msgSend(v2, "addObject:", CFSTR("reason"));
  objc_msgSend(v2, "addObject:", CFSTR("relay-type"));
  objc_msgSend(v2, "addObject:", CFSTR("relay-connection-id"));
  objc_msgSend(v2, "addObject:", CFSTR("self-relay-ip"));
  objc_msgSend(v2, "addObject:", CFSTR("self-relay-port"));
  objc_msgSend(v2, "addObject:", CFSTR("peer-relay-ip"));
  objc_msgSend(v2, "addObject:", CFSTR("peer-relay-port"));
  return v2;
}

- (id)messageBody
{
  __CFDictionary *v3;
  NSString *v4;
  NSData *v5;
  const void *v6;
  const void *v7;
  NSData *v8;
  NSData *v9;
  const void *v10;
  NSData *v11;
  const void *v12;
  NSData *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)FTRelayCancelMessage;
  v3 = (__CFDictionary *)objc_msgSend(-[FTFaceTimeMessage messageBody](&v15, sel_messageBody), "mutableCopy");
  v4 = -[FTRelayCancelMessage peerID](self, "peerID");
  if (v4)
  {
    CFDictionarySetValue(v3, CFSTR("peer-id"), v4);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22925B3B0();
  }
  v5 = -[FTRelayCancelMessage peerPushToken](self, "peerPushToken");
  if (v5)
  {
    CFDictionarySetValue(v3, CFSTR("peer-push-token"), v5);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22925B330();
  }
  v6 = (const void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[NSNumber intValue](-[FTRelayCancelMessage reason](self, "reason"), "intValue"));
  if (v6)
  {
    CFDictionarySetValue(v3, CFSTR("reason"), v6);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22925B7C8();
  }
  v7 = (const void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[NSNumber intValue](-[FTRelayCancelMessage relayType](self, "relayType"), "intValue"));
  if (v7)
  {
    CFDictionarySetValue(v3, CFSTR("relay-type"), v7);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22925BAC8();
  }
  v8 = -[FTRelayCancelMessage relayConnectionID](self, "relayConnectionID");
  if (v8)
  {
    CFDictionarySetValue(v3, CFSTR("relay-connection-id"), v8);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22925BA48();
  }
  v9 = -[FTRelayCancelMessage selfRelayIP](self, "selfRelayIP");
  if (v9)
  {
    CFDictionarySetValue(v3, CFSTR("self-relay-ip"), v9);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22925B9C8();
  }
  v10 = (const void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[NSNumber intValue](-[FTRelayCancelMessage selfRelayPort](self, "selfRelayPort"), "intValue"));
  if (v10)
  {
    CFDictionarySetValue(v3, CFSTR("self-relay-port"), v10);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22925B948();
  }
  v11 = -[FTRelayCancelMessage peerRelayIP](self, "peerRelayIP");
  if (v11)
  {
    CFDictionarySetValue(v3, CFSTR("peer-relay-ip"), v11);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22925B8C8();
  }
  v12 = (const void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[NSNumber intValue](-[FTRelayCancelMessage peerRelayPort](self, "peerRelayPort"), "intValue"));
  if (v12)
  {
    CFDictionarySetValue(v3, CFSTR("peer-relay-port"), v12);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22925B848();
  }
  v13 = -[FTRelayCancelMessage relayCandidateID](self, "relayCandidateID");
  if (v13)
    CFDictionarySetValue(v3, CFSTR("relay-candidate-id"), v13);
  return v3;
}

- (NSString)peerID
{
  return (NSString *)objc_getProperty(self, a2, 432, 1);
}

- (void)setPeerID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 432);
}

- (NSData)peerPushToken
{
  return (NSData *)objc_getProperty(self, a2, 440, 1);
}

- (void)setPeerPushToken:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 440);
}

- (NSNumber)relayType
{
  return (NSNumber *)objc_getProperty(self, a2, 448, 1);
}

- (void)setRelayType:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 448);
}

- (NSNumber)reason
{
  return (NSNumber *)objc_getProperty(self, a2, 456, 1);
}

- (void)setReason:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 456);
}

- (NSData)relayConnectionID
{
  return (NSData *)objc_getProperty(self, a2, 464, 1);
}

- (void)setRelayConnectionID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 464);
}

- (NSData)relayCandidateID
{
  return (NSData *)objc_getProperty(self, a2, 472, 1);
}

- (void)setRelayCandidateID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 472);
}

- (NSData)selfRelayIP
{
  return (NSData *)objc_getProperty(self, a2, 480, 1);
}

- (void)setSelfRelayIP:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 480);
}

- (NSNumber)selfRelayPort
{
  return (NSNumber *)objc_getProperty(self, a2, 488, 1);
}

- (void)setSelfRelayPort:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 488);
}

- (NSData)peerRelayIP
{
  return (NSData *)objc_getProperty(self, a2, 496, 1);
}

- (void)setPeerRelayIP:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 496);
}

- (NSNumber)peerRelayPort
{
  return (NSNumber *)objc_getProperty(self, a2, 504, 1);
}

- (void)setPeerRelayPort:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 504);
}

@end
