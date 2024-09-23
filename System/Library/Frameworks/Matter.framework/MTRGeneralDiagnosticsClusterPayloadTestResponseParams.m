@implementation MTRGeneralDiagnosticsClusterPayloadTestResponseParams

- (MTRGeneralDiagnosticsClusterPayloadTestResponseParams)init
{
  const char *v2;
  uint64_t v3;
  MTRGeneralDiagnosticsClusterPayloadTestResponseParams *v4;
  uint64_t v5;
  NSData *payload;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTRGeneralDiagnosticsClusterPayloadTestResponseParams;
  v4 = -[MTRGeneralDiagnosticsClusterPayloadTestResponseParams init](&v8, sel_init);
  if (v4)
  {
    objc_msgSend_data(MEMORY[0x24BDBCE50], v2, v3);
    v5 = objc_claimAutoreleasedReturnValue();
    payload = v4->_payload;
    v4->_payload = (NSData *)v5;

  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRGeneralDiagnosticsClusterPayloadTestResponseParams *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;

  v4 = objc_alloc_init(MTRGeneralDiagnosticsClusterPayloadTestResponseParams);
  objc_msgSend_payload(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPayload_(v4, v8, (uint64_t)v7);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_base64EncodedStringWithOptions_(self->_payload, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v8, (uint64_t)CFSTR("<%@: payload:%@; >"), v5, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (MTRGeneralDiagnosticsClusterPayloadTestResponseParams)initWithResponseValue:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  MTRGeneralDiagnosticsClusterPayloadTestResponseParams *v8;
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
  MTRGeneralDiagnosticsClusterPayloadTestResponseParams *v30;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  _BYTE v35[72];
  uint64_t v36;
  objc_super v37;
  uint64_t v38;
  void *v39;
  uint8_t buf[16];
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v37.receiver = self;
  v37.super_class = (Class)MTRGeneralDiagnosticsClusterPayloadTestResponseParams;
  v8 = -[MTRGeneralDiagnosticsClusterPayloadTestResponseParams init](&v37, sel_init);
  if (!v8)
  {
    v30 = 0;
    goto LABEL_16;
  }
  objc_msgSend__responseDataForCommand_clusterID_commandID_error_(MTRBaseDevice, v7, (uint64_t)v6, 51, 4, a4);
  if (v36)
  {
    sub_234104468((uint64_t)v35);
    sub_234104498((uint64_t)v35, *(_QWORD *)(v36 + 8), *(_QWORD *)(v36 + 24));
    v33 = 0uLL;
    v34 = 0;
    sub_234105EE4((uint64_t)v35, 256, &v33);
    if (!(_DWORD)v33)
    {
      v32 = 0uLL;
      sub_233D08730(&v32, (uint64_t)v35, (uint64_t)buf);
      v33 = *(_OWORD *)buf;
      v34 = v41;
      if (!*(_DWORD *)buf)
      {
        objc_msgSend__setFieldsFromDecodableStruct_(v8, v9, (uint64_t)&v32);
        v33 = *(_OWORD *)buf;
        v34 = v41;
        if (!*(_DWORD *)buf)
        {
          v30 = v8;
          goto LABEL_14;
        }
      }
    }
    v10 = (void *)MEMORY[0x24BDD17C8];
    *(_OWORD *)buf = v33;
    v41 = v34;
    v11 = sub_2341083CC((const char **)buf, 1);
    objc_msgSend_stringWithFormat_(v10, v12, (uint64_t)CFSTR("Command payload decoding failed: %s"), v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    sub_234117B80(0, "NotSpecified");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = objc_retainAutorelease(v13);
      v18 = objc_msgSend_UTF8String(v15, v16, v17);
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v18;
      _os_log_impl(&dword_233BF3000, v14, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
    }

    if (sub_234114844(1u))
    {
      v21 = objc_retainAutorelease(v13);
      objc_msgSend_UTF8String(v21, v22, v23);
      sub_2341147D0(0, 1);
    }
    if (a4)
    {
      v38 = *MEMORY[0x24BDD0FD8];
      objc_msgSend_mainBundle(MEMORY[0x24BDD1488], v19, v20);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v24, v25, (uint64_t)v13, &stru_2505249E8, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v26;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v27, (uint64_t)&v39, &v38, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v29, (uint64_t)CFSTR("MTRErrorDomain"), 13, v28);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  v30 = 0;
LABEL_14:
  sub_233CAF128(&v36);
LABEL_16:

  return v30;
}

- (NSData)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
}

- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3
{
  void *v6;
  const char *v7;
  ChipError *result;

  objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], a3, *(_QWORD *)a4, *((_QWORD *)a4 + 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPayload_(self, v7, (uint64_t)v6);

  retstr->mError = 0;
  retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-gene"
                  "rated/MTRCommandPayloadsObjc.mm";
  retstr->mLine = 6700;
  return result;
}

@end
