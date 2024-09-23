@implementation MTROTASoftwareUpdateProviderClusterQueryImageResponseParams

- (MTROTASoftwareUpdateProviderClusterQueryImageResponseParams)init
{
  MTROTASoftwareUpdateProviderClusterQueryImageResponseParams *v2;
  MTROTASoftwareUpdateProviderClusterQueryImageResponseParams *v3;
  NSNumber *status;
  NSNumber *delayedActionTime;
  NSString *imageURI;
  NSNumber *softwareVersion;
  NSString *softwareVersionString;
  NSData *updateToken;
  NSNumber *userConsentNeeded;
  NSData *metadataForRequestor;
  NSNumber *timedInvokeTimeoutMs;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MTROTASoftwareUpdateProviderClusterQueryImageResponseParams;
  v2 = -[MTROTASoftwareUpdateProviderClusterQueryImageResponseParams init](&v14, sel_init);
  v3 = v2;
  if (v2)
  {
    status = v2->_status;
    v2->_status = (NSNumber *)&unk_250591A40;

    delayedActionTime = v3->_delayedActionTime;
    v3->_delayedActionTime = 0;

    imageURI = v3->_imageURI;
    v3->_imageURI = 0;

    softwareVersion = v3->_softwareVersion;
    v3->_softwareVersion = 0;

    softwareVersionString = v3->_softwareVersionString;
    v3->_softwareVersionString = 0;

    updateToken = v3->_updateToken;
    v3->_updateToken = 0;

    userConsentNeeded = v3->_userConsentNeeded;
    v3->_userConsentNeeded = 0;

    metadataForRequestor = v3->_metadataForRequestor;
    v3->_metadataForRequestor = 0;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTROTASoftwareUpdateProviderClusterQueryImageResponseParams *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;

  v4 = objc_alloc_init(MTROTASoftwareUpdateProviderClusterQueryImageResponseParams);
  objc_msgSend_status(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStatus_(v4, v8, (uint64_t)v7);

  objc_msgSend_delayedActionTime(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDelayedActionTime_(v4, v12, (uint64_t)v11);

  objc_msgSend_imageURI(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setImageURI_(v4, v16, (uint64_t)v15);

  objc_msgSend_softwareVersion(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSoftwareVersion_(v4, v20, (uint64_t)v19);

  objc_msgSend_softwareVersionString(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSoftwareVersionString_(v4, v24, (uint64_t)v23);

  objc_msgSend_updateToken(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUpdateToken_(v4, v28, (uint64_t)v27);

  objc_msgSend_userConsentNeeded(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUserConsentNeeded_(v4, v32, (uint64_t)v31);

  objc_msgSend_metadataForRequestor(self, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMetadataForRequestor_(v4, v36, (uint64_t)v35);

  objc_msgSend_timedInvokeTimeoutMs(self, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v40, (uint64_t)v39);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSNumber *status;
  NSNumber *delayedActionTime;
  NSString *imageURI;
  NSNumber *softwareVersion;
  NSString *softwareVersionString;
  const char *v11;
  void *v12;
  NSNumber *userConsentNeeded;
  const char *v14;
  void *v15;
  const char *v16;
  void *v17;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  status = self->_status;
  delayedActionTime = self->_delayedActionTime;
  imageURI = self->_imageURI;
  softwareVersion = self->_softwareVersion;
  softwareVersionString = self->_softwareVersionString;
  objc_msgSend_base64EncodedStringWithOptions_(self->_updateToken, v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  userConsentNeeded = self->_userConsentNeeded;
  objc_msgSend_base64EncodedStringWithOptions_(self->_metadataForRequestor, v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v16, (uint64_t)CFSTR("<%@: status:%@; delayedActionTime:%@; imageURI:%@; softwareVersion:%@; softwareVersionString:%@; updateToken:%@; userConsentNeeded:%@; metadataForRequestor:%@; >"),
    v5,
    status,
    delayedActionTime,
    imageURI,
    softwareVersion,
    softwareVersionString,
    v12,
    userConsentNeeded,
    v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (MTROTASoftwareUpdateProviderClusterQueryImageResponseParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error
{
  NSDictionary *v6;
  const char *v7;
  MTROTASoftwareUpdateProviderClusterQueryImageResponseParams *v8;
  const char *v9;
  void *v10;
  char *v11;
  const char *v12;
  void *v13;
  NSObject *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  id v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  MTROTASoftwareUpdateProviderClusterQueryImageResponseParams *v30;
  __int128 v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  _BYTE v36[72];
  uint64_t v37;
  objc_super v38;
  uint64_t v39;
  void *v40;
  __int128 buf;
  uint64_t v42;
  char v43;
  char v44;
  char v45;
  char v46;
  char v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v6 = responseValue;
  v38.receiver = self;
  v38.super_class = (Class)MTROTASoftwareUpdateProviderClusterQueryImageResponseParams;
  v8 = -[MTROTASoftwareUpdateProviderClusterQueryImageResponseParams init](&v38, sel_init);
  if (!v8)
  {
    v30 = 0;
    goto LABEL_16;
  }
  objc_msgSend__responseDataForCommand_clusterID_commandID_error_(MTRBaseDevice, v7, (uint64_t)v6, 41, 1, error);
  if (v37)
  {
    sub_234104468((uint64_t)v36);
    sub_234104498((uint64_t)v36, *(_QWORD *)(v37 + 8), *(_QWORD *)(v37 + 24));
    v34 = 0uLL;
    v35 = 0;
    sub_234105EE4((uint64_t)v36, 256, &v34);
    if (!(_DWORD)v34)
    {
      LOBYTE(buf) = 0;
      BYTE4(buf) = 0;
      LOBYTE(v42) = 0;
      v43 = 0;
      v44 = 0;
      v45 = 0;
      v46 = 0;
      v47 = 0;
      sub_233D015A0((uint64_t)&buf, (uint64_t)v36, (uint64_t)&v32);
      v34 = v32;
      v35 = v33;
      if (!(_DWORD)v32)
      {
        objc_msgSend__setFieldsFromDecodableStruct_(v8, v9, (uint64_t)&buf);
        v34 = v32;
        v35 = v33;
        if (!(_DWORD)v32)
        {
          v30 = v8;
          goto LABEL_14;
        }
      }
    }
    v10 = (void *)MEMORY[0x24BDD17C8];
    buf = v34;
    v42 = v35;
    v11 = sub_2341083CC((const char **)&buf, 1);
    objc_msgSend_stringWithFormat_(v10, v12, (uint64_t)CFSTR("Command payload decoding failed: %s"), v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    sub_234117B80(0, "NotSpecified");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = objc_retainAutorelease(v13);
      v18 = objc_msgSend_UTF8String(v15, v16, v17);
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = v18;
      _os_log_impl(&dword_233BF3000, v14, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&buf, 0xCu);
    }

    if (sub_234114844(1u))
    {
      v21 = objc_retainAutorelease(v13);
      objc_msgSend_UTF8String(v21, v22, v23);
      sub_2341147D0(0, 1);
    }
    if (error)
    {
      v39 = *MEMORY[0x24BDD0FD8];
      objc_msgSend_mainBundle(MEMORY[0x24BDD1488], v19, v20);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v24, v25, (uint64_t)v13, &stru_2505249E8, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v26;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v27, (uint64_t)&v40, &v39, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v29, (uint64_t)CFSTR("MTRErrorDomain"), 13, v28);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();

    }
  }
  v30 = 0;
LABEL_14:
  sub_233CAF128(&v37);
LABEL_16:

  return v30;
}

- (NSNumber)status
{
  return self->_status;
}

- (void)setStatus:(NSNumber *)status
{
  objc_setProperty_nonatomic_copy(self, a2, status, 8);
}

- (NSNumber)delayedActionTime
{
  return self->_delayedActionTime;
}

- (void)setDelayedActionTime:(NSNumber *)delayedActionTime
{
  objc_setProperty_nonatomic_copy(self, a2, delayedActionTime, 16);
}

- (NSString)imageURI
{
  return self->_imageURI;
}

- (void)setImageURI:(NSString *)imageURI
{
  objc_setProperty_nonatomic_copy(self, a2, imageURI, 24);
}

- (NSNumber)softwareVersion
{
  return self->_softwareVersion;
}

- (void)setSoftwareVersion:(NSNumber *)softwareVersion
{
  objc_setProperty_nonatomic_copy(self, a2, softwareVersion, 32);
}

- (NSString)softwareVersionString
{
  return self->_softwareVersionString;
}

- (void)setSoftwareVersionString:(NSString *)softwareVersionString
{
  objc_setProperty_nonatomic_copy(self, a2, softwareVersionString, 40);
}

- (NSData)updateToken
{
  return self->_updateToken;
}

- (void)setUpdateToken:(NSData *)updateToken
{
  objc_setProperty_nonatomic_copy(self, a2, updateToken, 48);
}

- (NSNumber)userConsentNeeded
{
  return self->_userConsentNeeded;
}

- (void)setUserConsentNeeded:(NSNumber *)userConsentNeeded
{
  objc_setProperty_nonatomic_copy(self, a2, userConsentNeeded, 56);
}

- (NSData)metadataForRequestor
{
  return self->_metadataForRequestor;
}

- (void)setMetadataForRequestor:(NSData *)metadataForRequestor
{
  objc_setProperty_nonatomic_copy(self, a2, metadataForRequestor, 64);
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs
{
  objc_setProperty_nonatomic_copy(self, a2, timedInvokeTimeoutMs, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_metadataForRequestor, 0);
  objc_storeStrong((id *)&self->_userConsentNeeded, 0);
  objc_storeStrong((id *)&self->_updateToken, 0);
  objc_storeStrong((id *)&self->_softwareVersionString, 0);
  objc_storeStrong((id *)&self->_softwareVersion, 0);
  objc_storeStrong((id *)&self->_imageURI, 0);
  objc_storeStrong((id *)&self->_delayedActionTime, 0);
  objc_storeStrong((id *)&self->_status, 0);
}

- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3
{
  void *v7;
  const char *v8;
  const char *v9;
  void *v10;
  _BYTE *v11;
  const char *v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  const char *v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  ChipError *result;
  const char *v27;
  __int128 *v28;
  void *v29;
  _BYTE *v30;
  const char *v31;
  void *v32;
  const char *v33;
  const char *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  const char *v39;
  void *v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t *v46;
  const char *v47;
  void *v48;
  const char *v49;
  const char *v50;
  void *v51;
  _BYTE *v52;
  const char *v53;
  void *v54;
  const char *v55;
  const char *v56;
  _BYTE *v57;
  int v58;
  uint64_t *v59;
  const char *v60;
  void *v61;
  const char *v62;

  objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], a3, *(unsigned __int8 *)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStatus_(self, v8, (uint64_t)v7);

  if (*((_BYTE *)a4 + 4))
  {
    v10 = (void *)MEMORY[0x24BDD16E0];
    v11 = sub_233C20E2C((_BYTE *)a4 + 4);
    objc_msgSend_numberWithUnsignedInt_(v10, v12, *(unsigned int *)v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDelayedActionTime_(self, v14, (uint64_t)v13);

  }
  else
  {
    objc_msgSend_setDelayedActionTime_(self, v9, 0);
  }
  if (*((_BYTE *)a4 + 16))
  {
    v16 = (uint64_t *)sub_233C05DB8((_BYTE *)a4 + 16);
    v17 = *v16;
    v18 = v16[1];
    v19 = objc_alloc(MEMORY[0x24BDD17C8]);
    v21 = (void *)objc_msgSend_initWithBytes_length_encoding_(v19, v20, v17, v18, 4);
    objc_msgSend_setImageURI_(self, v22, (uint64_t)v21);

    objc_msgSend_imageURI(self, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v25)
    {
      v28 = &xmmword_2504EEB38;
LABEL_14:
      *(_OWORD *)&retstr->mError = *v28;
      *(_QWORD *)&retstr->mLine = *((_QWORD *)v28 + 2);
      return result;
    }
  }
  else
  {
    objc_msgSend_setImageURI_(self, v15, 0);
  }
  if (*((_BYTE *)a4 + 40))
  {
    v29 = (void *)MEMORY[0x24BDD16E0];
    v30 = sub_233C20E2C((_BYTE *)a4 + 40);
    objc_msgSend_numberWithUnsignedInt_(v29, v31, *(unsigned int *)v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setSoftwareVersion_(self, v33, (uint64_t)v32);

  }
  else
  {
    objc_msgSend_setSoftwareVersion_(self, v27, 0);
  }
  if (*((_BYTE *)a4 + 48))
  {
    v35 = (uint64_t *)sub_233C05DB8((_BYTE *)a4 + 48);
    v36 = *v35;
    v37 = v35[1];
    v38 = objc_alloc(MEMORY[0x24BDD17C8]);
    v40 = (void *)objc_msgSend_initWithBytes_length_encoding_(v38, v39, v36, v37, 4);
    objc_msgSend_setSoftwareVersionString_(self, v41, (uint64_t)v40);

    objc_msgSend_softwareVersionString(self, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v44)
    {
      v28 = &xmmword_2504EEB50;
      goto LABEL_14;
    }
  }
  else
  {
    objc_msgSend_setSoftwareVersionString_(self, v34, 0);
  }
  if (*((_BYTE *)a4 + 72))
  {
    v46 = (uint64_t *)sub_233C05DB8((_BYTE *)a4 + 72);
    objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v47, *v46, v46[1]);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUpdateToken_(self, v49, (uint64_t)v48);

  }
  else
  {
    objc_msgSend_setUpdateToken_(self, v45, 0);
  }
  if (*((_BYTE *)a4 + 96))
  {
    v51 = (void *)MEMORY[0x24BDD16E0];
    v52 = sub_233C05DD8((_BYTE *)a4 + 96);
    objc_msgSend_numberWithBool_(v51, v53, *v52);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUserConsentNeeded_(self, v55, (uint64_t)v54);

  }
  else
  {
    objc_msgSend_setUserConsentNeeded_(self, v50, 0);
  }
  v58 = *((unsigned __int8 *)a4 + 104);
  v57 = (char *)a4 + 104;
  if (v58)
  {
    v59 = (uint64_t *)sub_233C05DB8(v57);
    objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v60, *v59, v59[1]);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setMetadataForRequestor_(self, v62, (uint64_t)v61);

  }
  else
  {
    result = (ChipError *)objc_msgSend_setMetadataForRequestor_(self, v56, 0);
  }
  retstr->mError = 0;
  retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-gene"
                  "rated/MTRCommandPayloadsObjc.mm";
  retstr->mLine = 3969;
  return result;
}

@end
