@implementation MTRContentAppObserverClusterContentAppMessageResponseParams

- (MTRContentAppObserverClusterContentAppMessageResponseParams)init
{
  MTRContentAppObserverClusterContentAppMessageResponseParams *v2;
  MTRContentAppObserverClusterContentAppMessageResponseParams *v3;
  NSNumber *status;
  NSString *data;
  NSString *encodingHint;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTRContentAppObserverClusterContentAppMessageResponseParams;
  v2 = -[MTRContentAppObserverClusterContentAppMessageResponseParams init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    status = v2->_status;
    v2->_status = (NSNumber *)&unk_250591A40;

    data = v3->_data;
    v3->_data = 0;

    encodingHint = v3->_encodingHint;
    v3->_encodingHint = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRContentAppObserverClusterContentAppMessageResponseParams *v4;
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

  v4 = objc_alloc_init(MTRContentAppObserverClusterContentAppMessageResponseParams);
  objc_msgSend_status(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStatus_(v4, v8, (uint64_t)v7);

  objc_msgSend_data(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setData_(v4, v12, (uint64_t)v11);

  objc_msgSend_encodingHint(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEncodingHint_(v4, v16, (uint64_t)v15);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: status:%@; data:%@; encodingHint:%@; >"),
    v5,
    self->_status,
    self->_data,
    self->_encodingHint);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (MTRContentAppObserverClusterContentAppMessageResponseParams)initWithResponseValue:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  MTRContentAppObserverClusterContentAppMessageResponseParams *v8;
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
  MTRContentAppObserverClusterContentAppMessageResponseParams *v30;
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
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v38.receiver = self;
  v38.super_class = (Class)MTRContentAppObserverClusterContentAppMessageResponseParams;
  v8 = -[MTRContentAppObserverClusterContentAppMessageResponseParams init](&v38, sel_init);
  if (!v8)
  {
    v30 = 0;
    goto LABEL_16;
  }
  objc_msgSend__responseDataForCommand_clusterID_commandID_error_(MTRBaseDevice, v7, (uint64_t)v6, 1296, 1, a4);
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
      sub_233D3C550((uint64_t)&buf, (uint64_t)v36, (uint64_t)&v32);
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
    if (a4)
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
      *a4 = (id)objc_claimAutoreleasedReturnValue();

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

- (void)setStatus:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)encodingHint
{
  return self->_encodingHint;
}

- (void)setEncodingHint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encodingHint, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_status, 0);
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
  __int128 *v22;
  _BYTE *v23;
  int v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  const char *v29;
  void *v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  void *v34;

  objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], a3, *(unsigned __int8 *)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStatus_(self, v8, (uint64_t)v7);

  if (*((_BYTE *)a4 + 8))
  {
    v10 = (uint64_t *)sub_233C05DB8((_BYTE *)a4 + 8);
    v11 = *v10;
    v12 = v10[1];
    v13 = objc_alloc(MEMORY[0x24BDD17C8]);
    v15 = (void *)objc_msgSend_initWithBytes_length_encoding_(v13, v14, v11, v12, 4);
    objc_msgSend_setData_(self, v16, (uint64_t)v15);

    objc_msgSend_data(self, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      v22 = &xmmword_2504EF108;
LABEL_8:
      *(_OWORD *)&retstr->mError = *v22;
      *(_QWORD *)&retstr->mLine = *((_QWORD *)v22 + 2);
      return result;
    }
  }
  else
  {
    objc_msgSend_setData_(self, v9, 0);
  }
  v24 = *((unsigned __int8 *)a4 + 32);
  v23 = (char *)a4 + 32;
  if (v24)
  {
    v25 = (uint64_t *)sub_233C05DB8(v23);
    v26 = *v25;
    v27 = v25[1];
    v28 = objc_alloc(MEMORY[0x24BDD17C8]);
    v30 = (void *)objc_msgSend_initWithBytes_length_encoding_(v28, v29, v26, v27, 4);
    objc_msgSend_setEncodingHint_(self, v31, (uint64_t)v30);

    objc_msgSend_encodingHint(self, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v34)
    {
      v22 = &xmmword_2504EF120;
      goto LABEL_8;
    }
  }
  else
  {
    result = (ChipError *)objc_msgSend_setEncodingHint_(self, v21, 0);
  }
  retstr->mError = 0;
  retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-gene"
                  "rated/MTRCommandPayloadsObjc.mm";
  retstr->mLine = 31203;
  return result;
}

@end
