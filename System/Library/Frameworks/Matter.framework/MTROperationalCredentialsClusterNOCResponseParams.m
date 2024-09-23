@implementation MTROperationalCredentialsClusterNOCResponseParams

- (MTROperationalCredentialsClusterNOCResponseParams)init
{
  MTROperationalCredentialsClusterNOCResponseParams *v2;
  MTROperationalCredentialsClusterNOCResponseParams *v3;
  NSNumber *statusCode;
  NSNumber *fabricIndex;
  NSString *debugText;
  NSNumber *timedInvokeTimeoutMs;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTROperationalCredentialsClusterNOCResponseParams;
  v2 = -[MTROperationalCredentialsClusterNOCResponseParams init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    statusCode = v2->_statusCode;
    v2->_statusCode = (NSNumber *)&unk_250591A40;

    fabricIndex = v3->_fabricIndex;
    v3->_fabricIndex = 0;

    debugText = v3->_debugText;
    v3->_debugText = 0;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTROperationalCredentialsClusterNOCResponseParams *v4;
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

  v4 = objc_alloc_init(MTROperationalCredentialsClusterNOCResponseParams);
  objc_msgSend_statusCode(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStatusCode_(v4, v8, (uint64_t)v7);

  objc_msgSend_fabricIndex(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFabricIndex_(v4, v12, (uint64_t)v11);

  objc_msgSend_debugText(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDebugText_(v4, v16, (uint64_t)v15);

  objc_msgSend_timedInvokeTimeoutMs(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v20, (uint64_t)v19);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: statusCode:%@; fabricIndex:%@; debugText:%@; >"),
    v5,
    self->_statusCode,
    self->_fabricIndex,
    self->_debugText);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (MTROperationalCredentialsClusterNOCResponseParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error
{
  NSDictionary *v6;
  const char *v7;
  MTROperationalCredentialsClusterNOCResponseParams *v8;
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
  MTROperationalCredentialsClusterNOCResponseParams *v30;
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
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v6 = responseValue;
  v38.receiver = self;
  v38.super_class = (Class)MTROperationalCredentialsClusterNOCResponseParams;
  v8 = -[MTROperationalCredentialsClusterNOCResponseParams init](&v38, sel_init);
  if (!v8)
  {
    v30 = 0;
    goto LABEL_16;
  }
  objc_msgSend__responseDataForCommand_clusterID_commandID_error_(MTRBaseDevice, v7, (uint64_t)v6, 62, 8, error);
  if (v37)
  {
    sub_234104468((uint64_t)v36);
    sub_234104498((uint64_t)v36, *(_QWORD *)(v37 + 8), *(_QWORD *)(v37 + 24));
    v34 = 0uLL;
    v35 = 0;
    sub_234105EE4((uint64_t)v36, 256, &v34);
    if (!(_DWORD)v34)
    {
      LOWORD(buf) = 0;
      BYTE8(buf) = 0;
      sub_233D0FD14((uint64_t)&buf, (uint64_t)v36, (uint64_t)&v32);
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

- (NSNumber)statusCode
{
  return self->_statusCode;
}

- (void)setStatusCode:(NSNumber *)statusCode
{
  objc_setProperty_nonatomic_copy(self, a2, statusCode, 8);
}

- (NSNumber)fabricIndex
{
  return self->_fabricIndex;
}

- (void)setFabricIndex:(NSNumber *)fabricIndex
{
  objc_setProperty_nonatomic_copy(self, a2, fabricIndex, 16);
}

- (NSString)debugText
{
  return self->_debugText;
}

- (void)setDebugText:(NSString *)debugText
{
  objc_setProperty_nonatomic_copy(self, a2, debugText, 24);
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs
{
  objc_setProperty_nonatomic_copy(self, a2, timedInvokeTimeoutMs, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_debugText, 0);
  objc_storeStrong((id *)&self->_fabricIndex, 0);
  objc_storeStrong((id *)&self->_statusCode, 0);
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
  _BYTE *v16;
  int v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  const char *v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  ChipError *result;

  objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], a3, *(unsigned __int8 *)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStatusCode_(self, v8, (uint64_t)v7);

  if (*((_BYTE *)a4 + 1))
  {
    v10 = (void *)MEMORY[0x24BDD16E0];
    v11 = sub_233C27DCC((_BYTE *)a4 + 1);
    objc_msgSend_numberWithUnsignedChar_(v10, v12, *v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setFabricIndex_(self, v14, (uint64_t)v13);

  }
  else
  {
    objc_msgSend_setFabricIndex_(self, v9, 0);
  }
  v17 = *((unsigned __int8 *)a4 + 8);
  v16 = (char *)a4 + 8;
  if (v17)
  {
    v18 = (uint64_t *)sub_233C05DB8(v16);
    v19 = *v18;
    v20 = v18[1];
    v21 = objc_alloc(MEMORY[0x24BDD17C8]);
    v23 = (void *)objc_msgSend_initWithBytes_length_encoding_(v21, v22, v19, v20, 4);
    objc_msgSend_setDebugText_(self, v24, (uint64_t)v23);

    objc_msgSend_debugText(self, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v27)
    {
      *(_OWORD *)&retstr->mError = xmmword_2504EEC10;
      *(_QWORD *)&retstr->mLine = 8699;
      return result;
    }
  }
  else
  {
    result = (ChipError *)objc_msgSend_setDebugText_(self, v15, 0);
  }
  retstr->mError = 0;
  retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-gene"
                  "rated/MTRCommandPayloadsObjc.mm";
  retstr->mLine = 8706;
  return result;
}

@end
