@implementation MTRUnitTestingClusterTestNullableOptionalResponseParams

- (MTRUnitTestingClusterTestNullableOptionalResponseParams)init
{
  MTRUnitTestingClusterTestNullableOptionalResponseParams *v2;
  MTRUnitTestingClusterTestNullableOptionalResponseParams *v3;
  NSNumber *wasPresent;
  NSNumber *wasNull;
  NSNumber *value;
  NSNumber *originalValue;
  NSNumber *timedInvokeTimeoutMs;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTRUnitTestingClusterTestNullableOptionalResponseParams;
  v2 = -[MTRUnitTestingClusterTestNullableOptionalResponseParams init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    wasPresent = v2->_wasPresent;
    v2->_wasPresent = (NSNumber *)&unk_250591A40;

    wasNull = v3->_wasNull;
    v3->_wasNull = 0;

    value = v3->_value;
    v3->_value = 0;

    originalValue = v3->_originalValue;
    v3->_originalValue = 0;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRUnitTestingClusterTestNullableOptionalResponseParams *v4;
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

  v4 = objc_alloc_init(MTRUnitTestingClusterTestNullableOptionalResponseParams);
  objc_msgSend_wasPresent(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWasPresent_(v4, v8, (uint64_t)v7);

  objc_msgSend_wasNull(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWasNull_(v4, v12, (uint64_t)v11);

  objc_msgSend_value(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_(v4, v16, (uint64_t)v15);

  objc_msgSend_originalValue(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOriginalValue_(v4, v20, (uint64_t)v19);

  objc_msgSend_timedInvokeTimeoutMs(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v24, (uint64_t)v23);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: wasPresent:%@; wasNull:%@; value:%@; originalValue:%@; >"),
    v5,
    self->_wasPresent,
    self->_wasNull,
    self->_value,
    self->_originalValue);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (MTRUnitTestingClusterTestNullableOptionalResponseParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error
{
  NSDictionary *v6;
  const char *v7;
  MTRUnitTestingClusterTestNullableOptionalResponseParams *v8;
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
  MTRUnitTestingClusterTestNullableOptionalResponseParams *v30;
  __int16 v32;
  char v33;
  char v34;
  __int128 v35;
  uint64_t v36;
  _BYTE v37[72];
  uint64_t v38;
  objc_super v39;
  uint64_t v40;
  void *v41;
  __int128 buf;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v6 = responseValue;
  v39.receiver = self;
  v39.super_class = (Class)MTRUnitTestingClusterTestNullableOptionalResponseParams;
  v8 = -[MTRUnitTestingClusterTestNullableOptionalResponseParams init](&v39, sel_init);
  if (!v8)
  {
    v30 = 0;
    goto LABEL_16;
  }
  objc_msgSend__responseDataForCommand_clusterID_commandID_error_(MTRBaseDevice, v7, (uint64_t)v6, 4294048773, 6, error);
  if (v38)
  {
    sub_234104468((uint64_t)v37);
    sub_234104498((uint64_t)v37, *(_QWORD *)(v38 + 8), *(_QWORD *)(v38 + 24));
    v35 = 0uLL;
    v36 = 0;
    sub_234105EE4((uint64_t)v37, 256, &v35);
    if (!(_DWORD)v35)
    {
      v32 = 0;
      v33 = 0;
      v34 = 0;
      sub_233D40A38((uint64_t)&v32, (uint64_t)v37, (uint64_t)&buf);
      v35 = buf;
      v36 = v43;
      if (!(_DWORD)buf)
      {
        objc_msgSend__setFieldsFromDecodableStruct_(v8, v9, (uint64_t)&v32);
        v35 = buf;
        v36 = v43;
        if (!(_DWORD)buf)
        {
          v30 = v8;
          goto LABEL_14;
        }
      }
    }
    v10 = (void *)MEMORY[0x24BDD17C8];
    buf = v35;
    v43 = v36;
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
      v40 = *MEMORY[0x24BDD0FD8];
      objc_msgSend_mainBundle(MEMORY[0x24BDD1488], v19, v20);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v24, v25, (uint64_t)v13, &stru_2505249E8, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v26;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v27, (uint64_t)&v41, &v40, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v29, (uint64_t)CFSTR("MTRErrorDomain"), 13, v28);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();

    }
  }
  v30 = 0;
LABEL_14:
  sub_233CAF128(&v38);
LABEL_16:

  return v30;
}

- (NSNumber)wasPresent
{
  return self->_wasPresent;
}

- (void)setWasPresent:(NSNumber *)wasPresent
{
  objc_setProperty_nonatomic_copy(self, a2, wasPresent, 8);
}

- (NSNumber)wasNull
{
  return self->_wasNull;
}

- (void)setWasNull:(NSNumber *)wasNull
{
  objc_setProperty_nonatomic_copy(self, a2, wasNull, 16);
}

- (NSNumber)value
{
  return self->_value;
}

- (void)setValue:(NSNumber *)value
{
  objc_setProperty_nonatomic_copy(self, a2, value, 24);
}

- (NSNumber)originalValue
{
  return self->_originalValue;
}

- (void)setOriginalValue:(NSNumber *)originalValue
{
  objc_setProperty_nonatomic_copy(self, a2, originalValue, 32);
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs
{
  objc_setProperty_nonatomic_copy(self, a2, timedInvokeTimeoutMs, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_originalValue, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_wasNull, 0);
  objc_storeStrong((id *)&self->_wasPresent, 0);
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
  void *v16;
  _BYTE *v17;
  const char *v18;
  void *v19;
  const char *v20;
  const char *v21;
  _BYTE *v22;
  int v23;
  void *v24;
  _BYTE *v25;
  const char *v26;
  void *v27;
  const char *v28;
  ChipError *result;

  objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], a3, *(unsigned __int8 *)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWasPresent_(self, v8, (uint64_t)v7);

  if (*((_BYTE *)a4 + 1))
  {
    v10 = (void *)MEMORY[0x24BDD16E0];
    v11 = sub_233C05DD8((_BYTE *)a4 + 1);
    objc_msgSend_numberWithBool_(v10, v12, *v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWasNull_(self, v14, (uint64_t)v13);

  }
  else
  {
    objc_msgSend_setWasNull_(self, v9, 0);
  }
  if (*((_BYTE *)a4 + 3))
  {
    v16 = (void *)MEMORY[0x24BDD16E0];
    v17 = sub_233C27DCC((_BYTE *)a4 + 3);
    objc_msgSend_numberWithUnsignedChar_(v16, v18, *v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setValue_(self, v20, (uint64_t)v19);

  }
  else
  {
    objc_msgSend_setValue_(self, v15, 0);
  }
  v23 = *((unsigned __int8 *)a4 + 5);
  v22 = (char *)a4 + 5;
  if (v23 && sub_233C27DCC(v22)[1])
  {
    v24 = (void *)MEMORY[0x24BDD16E0];
    v25 = sub_233C27DCC(v22);
    if (!v25[1])
      sub_233CAF304();
    objc_msgSend_numberWithUnsignedChar_(v24, v26, *v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setOriginalValue_(self, v28, (uint64_t)v27);

  }
  else
  {
    result = (ChipError *)objc_msgSend_setOriginalValue_(self, v21, 0);
  }
  retstr->mError = 0;
  retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-gene"
                  "rated/MTRCommandPayloadsObjc.mm";
  retstr->mLine = 33557;
  return result;
}

@end
