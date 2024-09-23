@implementation FTFaceTimeMessage

- (FTFaceTimeMessage)init
{
  FTFaceTimeMessage *v2;
  FTFaceTimeMessage *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FTFaceTimeMessage;
  v2 = -[FTIDSMessage init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[IDSBaseMessage setTimeout:](v2, "setTimeout:", 40.0);
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FTFaceTimeMessage;
  v4 = -[FTIDSMessage copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setSessionToken:", -[FTFaceTimeMessage sessionToken](self, "sessionToken"));
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[FTFaceTimeMessage setSessionToken:](self, "setSessionToken:", 0);
  v3.receiver = self;
  v3.super_class = (Class)FTFaceTimeMessage;
  -[FTIDSMessage dealloc](&v3, sel_dealloc);
}

- (BOOL)hasRequiredKeys:(id *)a3
{
  NSUInteger v4;

  v4 = -[NSString length](-[FTIDSMessage selfURI](self, "selfURI"), "length");
  if (!v4)
  {
    _IMWarn();
    if (a3)
      *a3 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", CFSTR("self URI"));
  }
  return v4 != 0;
}

- (BOOL)isValidMessage
{
  NSData *v3;
  unint64_t v4;
  NSData *v6;
  objc_super v8;

  v3 = -[FTFaceTimeMessage sessionToken](self, "sessionToken");
  if (!qword_255A3F508)
    qword_255A3F508 = (uint64_t)(id)objc_msgSend(CFSTR("0c0c0e0ececece"), "_FTDataFromHexString");
  v4 = -[NSData length](v3, "length");
  if (v4 > objc_msgSend((id)qword_255A3F508, "length") && qword_255A3F508 != 0)
  {
    v6 = -[NSData subdataWithRange:](v3, "subdataWithRange:", 0, objc_msgSend((id)qword_255A3F508, "length"));
    if (-[NSData isEqualToData:](v6, "isEqualToData:", qword_255A3F508))
      return 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)FTFaceTimeMessage;
  return -[IDSBaseMessage isValidMessage](&v8, sel_isValidMessage);
}

- (id)requiredKeys
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", CFSTR("session-token"));
}

- (id)messageBody
{
  __CFDictionary *v3;
  NSData *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FTFaceTimeMessage;
  v3 = (__CFDictionary *)-[NSDictionary mutableCopy](-[IDSBaseMessage messageBody](&v6, sel_messageBody), "mutableCopy");
  if (!v3)
    v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  v4 = -[FTFaceTimeMessage sessionToken](self, "sessionToken");
  if (v4)
  {
    CFDictionarySetValue(v3, CFSTR("session-token"), v4);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22925B118();
  }
  return v3;
}

- (NSData)sessionToken
{
  return (NSData *)objc_getProperty(self, a2, 424, 1);
}

- (void)setSessionToken:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 424);
}

@end
