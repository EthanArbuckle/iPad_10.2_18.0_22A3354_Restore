@implementation FTGetRegionMetadataMessage

- (FTGetRegionMetadataMessage)init
{
  FTGetRegionMetadataMessage *v2;
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  const char *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)FTGetRegionMetadataMessage;
  v2 = -[IDSBaseMessage init](&v10, sel_init);
  if (v2)
  {
    IMGetConferenceSettings();
    v3 = 0;
    objc_msgSend_lastObject(v3, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTopic_(v2, v7, (uint64_t)v6);

    objc_msgSend_setWantsResponse_(v2, v8, 1);
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)FTGetRegionMetadataMessage;
  v4 = -[IDSBaseMessage copyWithZone:](&v14, sel_copyWithZone_, a3);
  objc_msgSend_language(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLanguage_(v4, v8, (uint64_t)v7);

  objc_msgSend_responseRegionInformation(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setResponseRegionInformation_(v4, v12, (uint64_t)v11);

  return v4;
}

- (BOOL)wantsBagKey
{
  return 1;
}

- (BOOL)wantsHTTPHeaders
{
  return 1;
}

- (BOOL)wantsCompressedBody
{
  return 1;
}

- (BOOL)wantsBinaryPush
{
  return 1;
}

- (BOOL)wantsBAASigning
{
  return 1;
}

- (int64_t)command
{
  return 96;
}

- (int64_t)responseCommand
{
  return 97;
}

- (BOOL)wantsHTTPGet
{
  return 1;
}

- (id)bagKey
{
  return CFSTR("vc-profile-get-region-metadata");
}

- (id)requiredKeys
{
  id v2;
  const char *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend_addObject_(v2, v3, (uint64_t)CFSTR("accept-language"));
  return v2;
}

- (id)messageBody
{
  __CFDictionary *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend_language(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    CFDictionarySetValue(v3, CFSTR("accept-language"), v6);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    sub_1A4CBB618();
  }

  return v3;
}

- (void)handleResponseDictionary:(id)a3
{
  const char *v4;
  id v5;

  objc_msgSend_objectForKey_(a3, a2, (uint64_t)CFSTR("regions"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setResponseRegionInformation_(self, v4, (uint64_t)v5);

}

- (NSString)language
{
  return (NSString *)objc_getProperty(self, a2, 304, 1);
}

- (void)setLanguage:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 304);
}

- (NSDictionary)responseRegionInformation
{
  return (NSDictionary *)objc_getProperty(self, a2, 312, 1);
}

- (void)setResponseRegionInformation:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 312);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseRegionInformation, 0);
  objc_storeStrong((id *)&self->_language, 0);
}

@end
