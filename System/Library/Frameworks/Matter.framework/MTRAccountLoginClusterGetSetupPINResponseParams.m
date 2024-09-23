@implementation MTRAccountLoginClusterGetSetupPINResponseParams

- (MTRAccountLoginClusterGetSetupPINResponseParams)init
{
  MTRAccountLoginClusterGetSetupPINResponseParams *v2;
  MTRAccountLoginClusterGetSetupPINResponseParams *v3;
  NSString *setupPIN;
  NSNumber *timedInvokeTimeoutMs;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTRAccountLoginClusterGetSetupPINResponseParams;
  v2 = -[MTRAccountLoginClusterGetSetupPINResponseParams init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    setupPIN = v2->_setupPIN;
    v2->_setupPIN = (NSString *)&stru_2505249E8;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRAccountLoginClusterGetSetupPINResponseParams *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;

  v4 = objc_alloc_init(MTRAccountLoginClusterGetSetupPINResponseParams);
  objc_msgSend_setupPIN(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSetupPIN_(v4, v8, (uint64_t)v7);

  objc_msgSend_timedInvokeTimeoutMs(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v12, (uint64_t)v11);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: setupPIN:%@; >"), v5, self->_setupPIN);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (MTRAccountLoginClusterGetSetupPINResponseParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error
{
  NSDictionary *v6;
  const char *v7;
  MTRAccountLoginClusterGetSetupPINResponseParams *v8;
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
  MTRAccountLoginClusterGetSetupPINResponseParams *v30;
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
  v6 = responseValue;
  v37.receiver = self;
  v37.super_class = (Class)MTRAccountLoginClusterGetSetupPINResponseParams;
  v8 = -[MTRAccountLoginClusterGetSetupPINResponseParams init](&v37, sel_init);
  if (!v8)
  {
    v30 = 0;
    goto LABEL_16;
  }
  objc_msgSend__responseDataForCommand_clusterID_commandID_error_(MTRBaseDevice, v7, (uint64_t)v6, 1294, 1, error);
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
      sub_233D3B1C0(&v32, (uint64_t)v35, (uint64_t)buf);
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
    if (error)
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
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();

    }
  }
  v30 = 0;
LABEL_14:
  sub_233CAF128(&v36);
LABEL_16:

  return v30;
}

- (NSString)setupPIN
{
  return self->_setupPIN;
}

- (void)setSetupPIN:(NSString *)setupPIN
{
  objc_setProperty_nonatomic_copy(self, a2, setupPIN, 8);
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs
{
  objc_setProperty_nonatomic_copy(self, a2, timedInvokeTimeoutMs, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_setupPIN, 0);
}

- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  const char *v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  ChipError *result;

  v6 = *(_QWORD *)a4;
  v7 = *((_QWORD *)a4 + 1);
  v8 = objc_alloc(MEMORY[0x24BDD17C8]);
  v10 = (void *)objc_msgSend_initWithBytes_length_encoding_(v8, v9, v6, v7, 4);
  objc_msgSend_setSetupPIN_(self, v11, (uint64_t)v10);

  objc_msgSend_setupPIN(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    retstr->mError = 0;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 29968;
  }
  else
  {
    *(_OWORD *)&retstr->mError = xmmword_2504EF0D8;
    *(_QWORD *)&retstr->mLine = 29964;
  }
  return result;
}

@end
