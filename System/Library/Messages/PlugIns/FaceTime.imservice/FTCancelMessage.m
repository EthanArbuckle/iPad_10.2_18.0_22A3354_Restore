@implementation FTCancelMessage

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FTCancelMessage;
  v4 = -[FTFaceTimeMessage copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setPeers:", -[FTCancelMessage peers](self, "peers"));
  objc_msgSend(v4, "setReason:", -[FTCancelMessage reason](self, "reason"));
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FTCancelMessage;
  -[FTFaceTimeMessage dealloc](&v3, sel_dealloc);
}

- (id)bagKey
{
  return CFSTR("gk-invitation-cancel");
}

- (id)requiredKeys
{
  id v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FTCancelMessage;
  v2 = (id)objc_msgSend(-[FTFaceTimeMessage requiredKeys](&v4, sel_requiredKeys), "mutableCopy");
  if (!v2)
    v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v2, "addObject:", CFSTR("reason"));
  objc_msgSend(v2, "addObject:", CFSTR("peers"));
  return v2;
}

- (id)messageBody
{
  __CFDictionary *v3;
  const void *v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSArray *v13;
  _BOOL8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)FTCancelMessage;
  v3 = (__CFDictionary *)objc_msgSend(-[FTFaceTimeMessage messageBody](&v23, sel_messageBody), "mutableCopy");
  v4 = (const void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[NSNumber intValue](-[FTCancelMessage reason](self, "reason"), "intValue"));
  if (v4)
  {
    CFDictionarySetValue(v3, CFSTR("reason"), v4);
  }
  else
  {
    v5 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v5)
      sub_22925B6BC(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  v13 = -[FTCancelMessage peers](self, "peers");
  if (v13)
  {
    CFDictionarySetValue(v3, CFSTR("peers"), v13);
  }
  else
  {
    v14 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v14)
      sub_22925B630(v14, v15, v16, v17, v18, v19, v20, v21);
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

@end
