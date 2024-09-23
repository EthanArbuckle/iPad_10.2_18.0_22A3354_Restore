@implementation FTInitiateMessage

- (FTInitiateMessage)init
{
  FTInitiateMessage *v2;
  FTInitiateMessage *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FTInitiateMessage;
  v2 = -[FTFaceTimeMessage init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[IDSBaseMessage setTimeout:](v2, "setTimeout:", 35.0);
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FTInitiateMessage;
  return -[FTFaceTimeMessage copyWithZone:](&v4, sel_copyWithZone_, a3);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FTInitiateMessage;
  -[FTFaceTimeMessage dealloc](&v3, sel_dealloc);
}

- (id)bagKey
{
  return CFSTR("gk-invitation-initiate");
}

- (id)requiredKeys
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v2, "addObject:", CFSTR("self-push-token"));
  objc_msgSend(v2, "addObject:", CFSTR("self-blob"));
  objc_msgSend(v2, "addObject:", CFSTR("self-nat-ip"));
  objc_msgSend(v2, "addObject:", CFSTR("self-nat-type"));
  objc_msgSend(v2, "addObject:", CFSTR("peers"));
  return v2;
}

- (id)messageBody
{
  __CFDictionary *v3;
  NSData *v4;
  NSDictionary *v5;
  NSDictionary *v6;
  NSData *v7;
  NSData *v8;
  NSData *v9;
  const void *v10;
  NSArray *v11;
  NSArray *v12;

  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  v4 = -[FTFaceTimeMessage sessionToken](self, "sessionToken");
  if (v4)
    CFDictionarySetValue(v3, CFSTR("session-token"), v4);
  v5 = -[FTInitiateMessage regionInformation](self, "regionInformation");
  if (v5)
    CFDictionarySetValue(v3, CFSTR("service-data"), v5);
  v6 = -[IDSBaseMessage clientInfo](self, "clientInfo");
  if (v6)
    CFDictionarySetValue(v3, CFSTR("client-data"), v6);
  v7 = -[FTInitiateMessage selfPushToken](self, "selfPushToken");
  if (v7)
  {
    CFDictionarySetValue(v3, CFSTR("self-push-token"), v7);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22925B5B0();
  }
  v8 = -[FTInitiateMessage selfBlob](self, "selfBlob");
  if (v8)
  {
    CFDictionarySetValue(v3, CFSTR("self-blob"), v8);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22925B4B0();
  }
  v9 = -[FTInitiateMessage selfNatIP](self, "selfNatIP");
  if (v9)
  {
    CFDictionarySetValue(v3, CFSTR("self-nat-ip"), v9);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22925B430();
  }
  v10 = (const void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[NSNumber intValue](-[FTInitiateMessage selfNATType](self, "selfNATType"), "intValue"));
  if (v10)
  {
    CFDictionarySetValue(v3, CFSTR("self-nat-type"), v10);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22925B530();
  }
  v11 = -[FTInitiateMessage peers](self, "peers");
  if (v11)
  {
    CFDictionarySetValue(v3, CFSTR("peers"), v11);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22925B748();
  }
  v12 = -[FTInitiateMessage pushTokensToExclude](self, "pushTokensToExclude");
  if (v12)
    CFDictionarySetValue(v3, CFSTR("exclude-peers"), v12);
  return v3;
}

- (void)handleResponseDictionary:(id)a3
{
  uint64_t v5;
  uint64_t v6;

  v5 = objc_msgSend(a3, "objectForKey:", CFSTR("session-token"));
  if (v5)
    -[FTFaceTimeMessage setSessionToken:](self, "setSessionToken:", v5);
  v6 = objc_msgSend(a3, "objectForKey:", CFSTR("peers"));
  if (v6)
    -[FTInitiateMessage setCanonicalizedPeers:](self, "setCanonicalizedPeers:", v6);
  objc_msgSend(a3, "objectForKey:", CFSTR("alert"));
  MEMORY[0x24BEDD108](self, sel_setResponseAlertInfo_);
}

- (NSData)selfBlob
{
  return (NSData *)objc_getProperty(self, a2, 432, 1);
}

- (void)setSelfBlob:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 432);
}

- (NSData)selfPushToken
{
  return (NSData *)objc_getProperty(self, a2, 440, 1);
}

- (void)setSelfPushToken:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 440);
}

- (NSNumber)selfNATType
{
  return (NSNumber *)objc_getProperty(self, a2, 448, 1);
}

- (void)setSelfNATType:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 448);
}

- (NSData)selfNatIP
{
  return (NSData *)objc_getProperty(self, a2, 456, 1);
}

- (void)setSelfNatIP:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 456);
}

- (NSArray)peers
{
  return (NSArray *)objc_getProperty(self, a2, 464, 1);
}

- (void)setPeers:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 464);
}

- (NSArray)pushTokensToExclude
{
  return (NSArray *)objc_getProperty(self, a2, 472, 1);
}

- (void)setPushTokensToExclude:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 472);
}

- (NSArray)canonicalizedPeers
{
  return (NSArray *)objc_getProperty(self, a2, 480, 1);
}

- (void)setCanonicalizedPeers:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 480);
}

- (NSDictionary)regionInformation
{
  return (NSDictionary *)objc_getProperty(self, a2, 488, 1);
}

- (void)setRegionInformation:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 488);
}

@end
