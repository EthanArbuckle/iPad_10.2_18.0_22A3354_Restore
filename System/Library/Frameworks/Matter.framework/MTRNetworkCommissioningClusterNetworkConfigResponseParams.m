@implementation MTRNetworkCommissioningClusterNetworkConfigResponseParams

- (MTRNetworkCommissioningClusterNetworkConfigResponseParams)init
{
  MTRNetworkCommissioningClusterNetworkConfigResponseParams *v2;
  MTRNetworkCommissioningClusterNetworkConfigResponseParams *v3;
  NSNumber *networkingStatus;
  NSString *debugText;
  NSNumber *networkIndex;
  NSData *clientIdentity;
  NSData *possessionSignature;
  NSNumber *timedInvokeTimeoutMs;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MTRNetworkCommissioningClusterNetworkConfigResponseParams;
  v2 = -[MTRNetworkCommissioningClusterNetworkConfigResponseParams init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    networkingStatus = v2->_networkingStatus;
    v2->_networkingStatus = (NSNumber *)&unk_250591A40;

    debugText = v3->_debugText;
    v3->_debugText = 0;

    networkIndex = v3->_networkIndex;
    v3->_networkIndex = 0;

    clientIdentity = v3->_clientIdentity;
    v3->_clientIdentity = 0;

    possessionSignature = v3->_possessionSignature;
    v3->_possessionSignature = 0;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRNetworkCommissioningClusterNetworkConfigResponseParams *v4;
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

  v4 = objc_alloc_init(MTRNetworkCommissioningClusterNetworkConfigResponseParams);
  objc_msgSend_networkingStatus(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNetworkingStatus_(v4, v8, (uint64_t)v7);

  objc_msgSend_debugText(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDebugText_(v4, v12, (uint64_t)v11);

  objc_msgSend_networkIndex(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNetworkIndex_(v4, v16, (uint64_t)v15);

  objc_msgSend_clientIdentity(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClientIdentity_(v4, v20, (uint64_t)v19);

  objc_msgSend_possessionSignature(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPossessionSignature_(v4, v24, (uint64_t)v23);

  objc_msgSend_timedInvokeTimeoutMs(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v28, (uint64_t)v27);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSNumber *networkingStatus;
  NSString *debugText;
  NSNumber *networkIndex;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  networkingStatus = self->_networkingStatus;
  debugText = self->_debugText;
  networkIndex = self->_networkIndex;
  objc_msgSend_base64EncodedStringWithOptions_(self->_clientIdentity, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_base64EncodedStringWithOptions_(self->_possessionSignature, v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v13, (uint64_t)CFSTR("<%@: networkingStatus:%@; debugText:%@; networkIndex:%@; clientIdentity:%@; possessionSignature:%@; >"),
    v5,
    networkingStatus,
    debugText,
    networkIndex,
    v10,
    v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (MTRNetworkCommissioningClusterNetworkConfigResponseParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error
{
  NSDictionary *v6;
  const char *v7;
  MTRNetworkCommissioningClusterNetworkConfigResponseParams *v8;
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
  MTRNetworkCommissioningClusterNetworkConfigResponseParams *v30;
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
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v6 = responseValue;
  v38.receiver = self;
  v38.super_class = (Class)MTRNetworkCommissioningClusterNetworkConfigResponseParams;
  v8 = -[MTRNetworkCommissioningClusterNetworkConfigResponseParams init](&v38, sel_init);
  if (!v8)
  {
    v30 = 0;
    goto LABEL_16;
  }
  objc_msgSend__responseDataForCommand_clusterID_commandID_error_(MTRBaseDevice, v7, (uint64_t)v6, 49, 5, error);
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
      BYTE8(buf) = 0;
      v43 = 0;
      v44 = 0;
      v45 = 0;
      sub_233D06564((uint64_t)&buf, (uint64_t)v36, (uint64_t)&v32);
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

- (NSNumber)networkingStatus
{
  return self->_networkingStatus;
}

- (void)setNetworkingStatus:(NSNumber *)networkingStatus
{
  objc_setProperty_nonatomic_copy(self, a2, networkingStatus, 8);
}

- (NSString)debugText
{
  return self->_debugText;
}

- (void)setDebugText:(NSString *)debugText
{
  objc_setProperty_nonatomic_copy(self, a2, debugText, 16);
}

- (NSNumber)networkIndex
{
  return self->_networkIndex;
}

- (void)setNetworkIndex:(NSNumber *)networkIndex
{
  objc_setProperty_nonatomic_copy(self, a2, networkIndex, 24);
}

- (NSData)clientIdentity
{
  return self->_clientIdentity;
}

- (void)setClientIdentity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSData)possessionSignature
{
  return self->_possessionSignature;
}

- (void)setPossessionSignature:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs
{
  objc_setProperty_nonatomic_copy(self, a2, timedInvokeTimeoutMs, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_possessionSignature, 0);
  objc_storeStrong((id *)&self->_clientIdentity, 0);
  objc_storeStrong((id *)&self->_networkIndex, 0);
  objc_storeStrong((id *)&self->_debugText, 0);
  objc_storeStrong((id *)&self->_networkingStatus, 0);
}

- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3
{
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  const char *v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  ChipError *result;
  const char *v21;
  void *v22;
  _BYTE *v23;
  const char *v24;
  void *v25;
  const char *v26;
  const char *v27;
  uint64_t *v28;
  const char *v29;
  void *v30;
  const char *v31;
  const char *v32;
  _BYTE *v33;
  int v34;
  uint64_t *v35;
  const char *v36;
  void *v37;
  const char *v38;

  objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], a3, *(unsigned __int8 *)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNetworkingStatus_(self, v8, (uint64_t)v7);

  if (*((_BYTE *)a4 + 8))
  {
    v10 = (uint64_t *)sub_233C05DB8((_BYTE *)a4 + 8);
    v11 = *v10;
    v12 = v10[1];
    v13 = objc_alloc(MEMORY[0x24BDD17C8]);
    v15 = (void *)objc_msgSend_initWithBytes_length_encoding_(v13, v14, v11, v12, 4);
    objc_msgSend_setDebugText_(self, v16, (uint64_t)v15);

    objc_msgSend_debugText(self, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      *(_OWORD *)&retstr->mError = xmmword_2504EEBE0;
      *(_QWORD *)&retstr->mLine = 5568;
      return result;
    }
  }
  else
  {
    objc_msgSend_setDebugText_(self, v9, 0);
  }
  if (*((_BYTE *)a4 + 32))
  {
    v22 = (void *)MEMORY[0x24BDD16E0];
    v23 = sub_233C27DCC((_BYTE *)a4 + 32);
    objc_msgSend_numberWithUnsignedChar_(v22, v24, *v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setNetworkIndex_(self, v26, (uint64_t)v25);

  }
  else
  {
    objc_msgSend_setNetworkIndex_(self, v21, 0);
  }
  if (*((_BYTE *)a4 + 40))
  {
    v28 = (uint64_t *)sub_233C05DB8((_BYTE *)a4 + 40);
    objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v29, *v28, v28[1]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setClientIdentity_(self, v31, (uint64_t)v30);

  }
  else
  {
    objc_msgSend_setClientIdentity_(self, v27, 0);
  }
  v34 = *((unsigned __int8 *)a4 + 64);
  v33 = (char *)a4 + 64;
  if (v34)
  {
    v35 = (uint64_t *)sub_233C05DB8(v33);
    objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v36, *v35, v35[1]);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPossessionSignature_(self, v38, (uint64_t)v37);

  }
  else
  {
    result = (ChipError *)objc_msgSend_setPossessionSignature_(self, v32, 0);
  }
  retstr->mError = 0;
  retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-gene"
                  "rated/MTRCommandPayloadsObjc.mm";
  retstr->mLine = 5596;
  return result;
}

@end
