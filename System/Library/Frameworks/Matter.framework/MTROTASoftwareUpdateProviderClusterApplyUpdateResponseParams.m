@implementation MTROTASoftwareUpdateProviderClusterApplyUpdateResponseParams

- (MTROTASoftwareUpdateProviderClusterApplyUpdateResponseParams)init
{
  MTROTASoftwareUpdateProviderClusterApplyUpdateResponseParams *v2;
  MTROTASoftwareUpdateProviderClusterApplyUpdateResponseParams *v3;
  NSNumber *action;
  NSNumber *delayedActionTime;
  NSNumber *timedInvokeTimeoutMs;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTROTASoftwareUpdateProviderClusterApplyUpdateResponseParams;
  v2 = -[MTROTASoftwareUpdateProviderClusterApplyUpdateResponseParams init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    action = v2->_action;
    v2->_action = (NSNumber *)&unk_250591A40;

    delayedActionTime = v3->_delayedActionTime;
    v3->_delayedActionTime = (NSNumber *)&unk_250591A40;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTROTASoftwareUpdateProviderClusterApplyUpdateResponseParams *v4;
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

  v4 = objc_alloc_init(MTROTASoftwareUpdateProviderClusterApplyUpdateResponseParams);
  objc_msgSend_action(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAction_(v4, v8, (uint64_t)v7);

  objc_msgSend_delayedActionTime(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDelayedActionTime_(v4, v12, (uint64_t)v11);

  objc_msgSend_timedInvokeTimeoutMs(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v16, (uint64_t)v15);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: action:%@; delayedActionTime:%@; >"),
    v5,
    self->_action,
    self->_delayedActionTime);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (MTROTASoftwareUpdateProviderClusterApplyUpdateResponseParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error
{
  NSDictionary *v6;
  const char *v7;
  MTROTASoftwareUpdateProviderClusterApplyUpdateResponseParams *v8;
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
  MTROTASoftwareUpdateProviderClusterApplyUpdateResponseParams *v30;
  _BYTE v32[4];
  int v33;
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
  v38.super_class = (Class)MTROTASoftwareUpdateProviderClusterApplyUpdateResponseParams;
  v8 = -[MTROTASoftwareUpdateProviderClusterApplyUpdateResponseParams init](&v38, sel_init);
  if (!v8)
  {
    v30 = 0;
    goto LABEL_16;
  }
  objc_msgSend__responseDataForCommand_clusterID_commandID_error_(MTRBaseDevice, v7, (uint64_t)v6, 41, 3, error);
  if (v37)
  {
    sub_234104468((uint64_t)v36);
    sub_234104498((uint64_t)v36, *(_QWORD *)(v37 + 8), *(_QWORD *)(v37 + 24));
    v34 = 0uLL;
    v35 = 0;
    sub_234105EE4((uint64_t)v36, 256, &v34);
    if (!(_DWORD)v34)
    {
      v32[0] = 0;
      v33 = 0;
      sub_233D01AC4((uint64_t)v32, (uint64_t)v36, (uint64_t)&buf);
      v34 = buf;
      v35 = v42;
      if (!(_DWORD)buf)
      {
        objc_msgSend__setFieldsFromDecodableStruct_(v8, v9, (uint64_t)v32);
        v34 = buf;
        v35 = v42;
        if (!(_DWORD)buf)
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

- (NSNumber)action
{
  return self->_action;
}

- (void)setAction:(NSNumber *)action
{
  objc_setProperty_nonatomic_copy(self, a2, action, 8);
}

- (NSNumber)delayedActionTime
{
  return self->_delayedActionTime;
}

- (void)setDelayedActionTime:(NSNumber *)delayedActionTime
{
  objc_setProperty_nonatomic_copy(self, a2, delayedActionTime, 16);
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs
{
  objc_setProperty_nonatomic_copy(self, a2, timedInvokeTimeoutMs, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_delayedActionTime, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3
{
  void *v7;
  const char *v8;
  const char *v9;
  void *v10;
  const char *v11;
  ChipError *result;

  objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], a3, a4->var0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAction_(self, v8, (uint64_t)v7);

  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v9, *(unsigned int *)&a4[4].var0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDelayedActionTime_(self, v11, (uint64_t)v10);

  retstr->mError = 0;
  retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-gene"
                  "rated/MTRCommandPayloadsObjc.mm";
  retstr->mLine = 4160;
  return result;
}

@end
