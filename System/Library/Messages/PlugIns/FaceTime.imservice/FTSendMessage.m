@implementation FTSendMessage

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FTSendMessage;
  v4 = -[FTFaceTimeMessage copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setPeers:", -[FTSendMessage peers](self, "peers"));
  objc_msgSend(v4, "setReason:", -[FTSendMessage reason](self, "reason"));
  objc_msgSend(v4, "setSelfPushToken:", -[FTSendMessage selfPushToken](self, "selfPushToken"));
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FTSendMessage;
  -[FTFaceTimeMessage dealloc](&v3, sel_dealloc);
}

- (id)bagKey
{
  return CFSTR("gk-invitation-send");
}

- (id)requiredKeys
{
  id v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FTSendMessage;
  v2 = (id)objc_msgSend(-[FTFaceTimeMessage requiredKeys](&v4, sel_requiredKeys), "mutableCopy");
  if (!v2)
    v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v2, "addObject:", CFSTR("reason"));
  objc_msgSend(v2, "addObject:", CFSTR("peers"));
  objc_msgSend(v2, "addObject:", CFSTR("self-push-token"));
  return v2;
}

- (id)messageBody
{
  __CFDictionary *v3;
  const void *v4;
  NSArray *v5;
  NSData *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FTSendMessage;
  v3 = (__CFDictionary *)objc_msgSend(-[FTFaceTimeMessage messageBody](&v8, sel_messageBody), "mutableCopy");
  v4 = (const void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[NSNumber intValue](-[FTSendMessage reason](self, "reason"), "intValue"));
  if (v4)
  {
    CFDictionarySetValue(v3, CFSTR("reason"), v4);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22925B7C8();
  }
  v5 = -[FTSendMessage peers](self, "peers");
  if (v5)
  {
    CFDictionarySetValue(v3, CFSTR("peers"), v5);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22925B748();
  }
  v6 = -[FTSendMessage selfPushToken](self, "selfPushToken");
  if (v6)
  {
    CFDictionarySetValue(v3, CFSTR("self-push-token"), v6);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22925B5B0();
  }
  return v3;
}

- (NSArray)peers
{
  return (NSArray *)objc_getProperty(self, a2, 432, 1);
}

- (void)setPeers:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 432);
}

- (NSNumber)reason
{
  return (NSNumber *)objc_getProperty(self, a2, 440, 1);
}

- (void)setReason:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 440);
}

- (NSData)selfPushToken
{
  return (NSData *)objc_getProperty(self, a2, 448, 1);
}

- (void)setSelfPushToken:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 448);
}

@end
