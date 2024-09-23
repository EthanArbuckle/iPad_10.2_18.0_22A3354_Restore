@implementation IDSMessage

- (IDSMessage)init
{
  IDSMessage *v2;
  const char *v3;
  uint64_t v4;
  IDSMessage *v5;
  const char *v6;
  double v7;
  const char *v8;
  uint64_t v9;
  double v10;
  int shouldUseJSONForEncoding;
  const char *v12;
  double v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)IDSMessage;
  v2 = -[IDSBaseMessage init](&v15, sel_init);
  v5 = v2;
  if (v2)
  {
    objc_msgSend_setTimeout_(v2, v3, v4, 120.0);
    objc_msgSend_setWantsIntegerUniqueIDs_(v5, v6, 1, v7);
    shouldUseJSONForEncoding = objc_msgSend__shouldUseJSONForEncoding(v5, v8, v9, v10);
    objc_msgSend_setWantsBinaryPush_(v5, v12, shouldUseJSONForEncoding ^ 1u, v13);
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  const char *v11;
  uint64_t v12;
  double v13;
  void *v14;
  const char *v15;
  double v16;
  const char *v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  const char *v21;
  double v22;
  const char *v23;
  uint64_t v24;
  double v25;
  void *v26;
  const char *v27;
  double v28;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)IDSMessage;
  v4 = -[IDSBaseMessage copyWithZone:](&v30, sel_copyWithZone_, a3);
  objc_msgSend_wantsDeliveryStatus(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWantsDeliveryStatus_(v4, v9, (uint64_t)v8, v10);

  objc_msgSend_deliveryStatusContext(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDeliveryStatusContext_(v4, v15, (uint64_t)v14, v16);

  v20 = objc_msgSend_wantsCertifiedDelivery(self, v17, v18, v19);
  objc_msgSend_setWantsCertifiedDelivery_(v4, v21, v20, v22);
  objc_msgSend_version(self, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setVersion_(v4, v27, (uint64_t)v26, v28);

  return v4;
}

- (BOOL)wantsAPSRetries
{
  return 1;
}

- (BOOL)wantsHTTPHeaders
{
  return 1;
}

- (id)messageBody
{
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  __CFDictionary *v7;
  const char *v8;
  uint64_t v9;
  double v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  double v14;
  int v15;
  const char *v16;
  uint64_t v17;
  double v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  double v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  double v26;
  void *v27;
  const char *v28;
  double v29;
  void *v30;
  id v31;
  float v32;
  const char *v33;
  uint64_t v34;
  double v35;
  float v36;
  void *v37;
  uint64_t v38;
  const char *v39;
  double v40;
  void *v41;
  void *v42;
  objc_super v44;

  v44.receiver = self;
  v44.super_class = (Class)IDSMessage;
  -[IDSBaseMessage messageBody](&v44, sel_messageBody);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (__CFDictionary *)objc_msgSend_mutableCopy(v3, v4, v5, v6);

  objc_msgSend_wantsDeliveryStatus(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_intValue(v11, v12, v13, v14);

  if (v15 >= 1)
  {
    objc_msgSend_wantsDeliveryStatus(self, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      CFDictionarySetValue(v7, CFSTR("D"), v19);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      sub_19BAEF2B8();
    }

    objc_msgSend_deliveryStatusContext(self, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
      CFDictionarySetValue(v7, CFSTR("Dc"), v23);

  }
  if (objc_msgSend_wantsCertifiedDelivery(self, v16, v17, v18))
  {
    objc_msgSend_sharedInstance(IDSServerBag, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v27, v28, (uint64_t)CFSTR("certified-delivery-probability"), v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v31 = v30;
    else
      v31 = &unk_1E3C8A630;
    v32 = (float)arc4random_uniform(0x64u);
    objc_msgSend_floatValue(v31, v33, v34, v35);
    if ((float)(v36 * 100.0) > v32)
    {
      v37 = (void *)MEMORY[0x1E0CB37E8];
      v38 = _IDSCertifiedDeliveryVersion();
      objc_msgSend_numberWithInteger_(v37, v39, v38, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (v41)
      {
        CFDictionarySetValue(v7, CFSTR("cdv"), v41);
      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        sub_19BAEF234();
      }

    }
  }
  _IDSTransportVersionNumber();
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    CFDictionarySetValue(v7, CFSTR("v"), v42);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    sub_19BAEF1B4();
  }

  return v7;
}

- (id)userAgentHeaderString
{
  return CFSTR("ua");
}

- (BOOL)wantsUserAgentInHeaders
{
  return 0;
}

- (BOOL)_shouldUseJSONForEncoding
{
  double v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  char v7;

  objc_msgSend__objectForKeyFromMadridBag_(self, a2, (uint64_t)CFSTR("md-use-json"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_intValue(v3, v4, v5, v6))
    v7 = 1;
  else
    v7 = IMGetCachedDomainBoolForKey();

  return v7;
}

- (id)_madridServerBag
{
  double v2;

  return (id)objc_msgSend_sharedInstanceForBagType_(IDSServerBag, a2, 1, v2);
}

- (id)_objectForKeyFromMadridBag:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  const char *v8;
  uint64_t v9;
  double v10;
  void *v11;
  const char *v12;
  double v13;
  void *v14;

  v4 = a3;
  if (objc_msgSend_length(v4, v5, v6, v7))
  {
    objc_msgSend__madridServerBag(self, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v11, v12, (uint64_t)v4, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (NSNumber)wantsDeliveryStatus
{
  return (NSNumber *)objc_getProperty(self, a2, 304, 1);
}

- (void)setWantsDeliveryStatus:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 304);
}

- (BOOL)wantsCertifiedDelivery
{
  return self->_wantsCertifiedDelivery;
}

- (void)setWantsCertifiedDelivery:(BOOL)a3
{
  self->_wantsCertifiedDelivery = a3;
}

- (NSDictionary)deliveryStatusContext
{
  return (NSDictionary *)objc_getProperty(self, a2, 320, 1);
}

- (void)setDeliveryStatusContext:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 320);
}

- (NSNumber)version
{
  return (NSNumber *)objc_getProperty(self, a2, 312, 1);
}

- (void)setVersion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 312);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deliveryStatusContext, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_wantsDeliveryStatus, 0);
}

@end
