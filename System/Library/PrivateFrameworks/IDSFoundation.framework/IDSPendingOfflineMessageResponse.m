@implementation IDSPendingOfflineMessageResponse

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IDSPendingOfflineMessageResponse;
  return -[IDSMessage copyWithZone:](&v4, sel_copyWithZone_, a3);
}

- (int64_t)command
{
  return 160;
}

- (id)messageBody
{
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  __CFDictionary *Mutable;
  const char *v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  double v14;
  void *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  double v19;
  const char *v20;
  id v21;
  objc_super v23;
  uuid_t uu;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)IDSPendingOfflineMessageResponse;
  -[IDSMessage messageBody](&v23, sel_messageBody);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  Mutable = (__CFDictionary *)objc_msgSend_mutableCopy(v3, v4, v5, v6);

  if (!Mutable)
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFDictionarySetValue(Mutable, CFSTR("scv"), &unk_1E3C86880);
  objc_msgSend_messageIdentifier(self, v8, v9, v10);
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v15 = (void *)v11;
    objc_msgSend_messageIdentifier(self, v12, v13, v14);
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v20 = (const char *)objc_msgSend_UTF8String(v16, v17, v18, v19);

    if (v20)
    {
      memset(uu, 170, sizeof(uu));
      uuid_parse(v20, uu);
      jw_uuid_to_data();
      v21 = 0;
      if (v21)
        CFDictionarySetValue(Mutable, CFSTR("U"), v21);

    }
  }
  return Mutable;
}

- (NSString)messageIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 336, 1);
}

- (void)setMessageIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 336);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageIdentifier, 0);
}

@end
