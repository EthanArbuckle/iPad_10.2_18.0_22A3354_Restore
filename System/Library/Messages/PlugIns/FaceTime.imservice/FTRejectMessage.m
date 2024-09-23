@implementation FTRejectMessage

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FTRejectMessage;
  return -[FTFaceTimeMessage copyWithZone:](&v4, sel_copyWithZone_, a3);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FTRejectMessage;
  -[FTFaceTimeMessage dealloc](&v3, sel_dealloc);
}

- (id)bagKey
{
  return CFSTR("gk-invitation-reject");
}

- (id)requiredKeys
{
  void *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FTRejectMessage;
  v2 = (void *)objc_msgSend(-[FTFaceTimeMessage requiredKeys](&v4, sel_requiredKeys), "mutableCopy");
  objc_msgSend(v2, "addObject:", CFSTR("peer-id"));
  objc_msgSend(v2, "addObject:", CFSTR("self-push-token"));
  objc_msgSend(v2, "addObject:", CFSTR("peer-push-token"));
  objc_msgSend(v2, "addObject:", CFSTR("reason"));
  return v2;
}

- (id)messageBody
{
  __CFDictionary *v3;
  NSString *v4;
  NSData *v5;
  NSData *v6;
  const void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FTRejectMessage;
  v3 = (__CFDictionary *)objc_msgSend(-[FTFaceTimeMessage messageBody](&v9, sel_messageBody), "mutableCopy");
  v4 = -[FTRejectMessage peerID](self, "peerID");
  if (v4)
  {
    CFDictionarySetValue(v3, CFSTR("peer-id"), v4);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22925B3B0();
  }
  v5 = -[FTRejectMessage selfPushToken](self, "selfPushToken");
  if (v5)
  {
    CFDictionarySetValue(v3, CFSTR("self-push-token"), v5);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22925B5B0();
  }
  v6 = -[FTRejectMessage peerPushToken](self, "peerPushToken");
  if (v6)
  {
    CFDictionarySetValue(v3, CFSTR("peer-push-token"), v6);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22925B330();
  }
  v7 = (const void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[NSNumber intValue](-[FTRejectMessage reason](self, "reason"), "intValue"));
  if (v7)
  {
    CFDictionarySetValue(v3, CFSTR("reason"), v7);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22925B7C8();
  }
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

- (NSData)peerPushToken
{
  return (NSData *)objc_getProperty(self, a2, 440, 1);
}

- (void)setPeerPushToken:(id)a3
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

- (NSNumber)reason
{
  return (NSNumber *)objc_getProperty(self, a2, 456, 1);
}

- (void)setReason:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 456);
}

@end
