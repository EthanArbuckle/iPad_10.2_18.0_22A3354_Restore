@implementation FTReInitiateMessage

- (FTReInitiateMessage)init
{
  FTReInitiateMessage *v2;
  FTReInitiateMessage *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FTReInitiateMessage;
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
  v4.super_class = (Class)FTReInitiateMessage;
  return -[FTFaceTimeMessage copyWithZone:](&v4, sel_copyWithZone_, a3);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FTReInitiateMessage;
  -[FTFaceTimeMessage dealloc](&v3, sel_dealloc);
}

- (id)bagKey
{
  return CFSTR("gk-invitation-reinitiate");
}

- (id)requiredKeys
{
  void *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FTReInitiateMessage;
  v2 = (void *)objc_msgSend(-[FTFaceTimeMessage requiredKeys](&v4, sel_requiredKeys), "mutableCopy");
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
  NSDictionary *v4;
  NSDictionary *v5;
  NSData *v6;
  NSData *v7;
  NSData *v8;
  const void *v9;
  NSArray *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)FTReInitiateMessage;
  v3 = (__CFDictionary *)objc_msgSend(-[FTFaceTimeMessage messageBody](&v12, sel_messageBody), "mutableCopy");
  v4 = -[FTReInitiateMessage regionInformation](self, "regionInformation");
  if (v4)
    CFDictionarySetValue(v3, CFSTR("service-data"), v4);
  v5 = -[IDSBaseMessage clientInfo](self, "clientInfo");
  if (v5)
    CFDictionarySetValue(v3, CFSTR("client-data"), v5);
  v6 = -[FTReInitiateMessage selfPushToken](self, "selfPushToken");
  if (v6)
  {
    CFDictionarySetValue(v3, CFSTR("self-push-token"), v6);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22925B5B0();
  }
  v7 = -[FTReInitiateMessage selfBlob](self, "selfBlob");
  if (v7)
  {
    CFDictionarySetValue(v3, CFSTR("self-blob"), v7);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22925B4B0();
  }
  v8 = -[FTReInitiateMessage selfNatIP](self, "selfNatIP");
  if (v8)
  {
    CFDictionarySetValue(v3, CFSTR("self-nat-ip"), v8);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22925B430();
  }
  v9 = (const void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[NSNumber intValue](-[FTReInitiateMessage selfNATType](self, "selfNATType"), "intValue"));
  if (v9)
  {
    CFDictionarySetValue(v3, CFSTR("self-nat-type"), v9);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22925B530();
  }
  v10 = -[FTReInitiateMessage peers](self, "peers");
  if (v10)
  {
    CFDictionarySetValue(v3, CFSTR("peers"), v10);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22925B748();
  }
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
    -[FTReInitiateMessage setCanonicalizedPeers:](self, "setCanonicalizedPeers:", v6);
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

- (NSArray)canonicalizedPeers
{
  return (NSArray *)objc_getProperty(self, a2, 472, 1);
}

- (void)setCanonicalizedPeers:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 472);
}

- (NSDictionary)regionInformation
{
  return (NSDictionary *)objc_getProperty(self, a2, 480, 1);
}

- (void)setRegionInformation:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 480);
}

@end
