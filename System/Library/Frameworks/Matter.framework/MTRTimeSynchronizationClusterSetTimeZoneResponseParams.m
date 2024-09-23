@implementation MTRTimeSynchronizationClusterSetTimeZoneResponseParams

- (MTRTimeSynchronizationClusterSetTimeZoneResponseParams)init
{
  MTRTimeSynchronizationClusterSetTimeZoneResponseParams *v2;
  MTRTimeSynchronizationClusterSetTimeZoneResponseParams *v3;
  NSNumber *dstOffsetRequired;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTRTimeSynchronizationClusterSetTimeZoneResponseParams;
  v2 = -[MTRTimeSynchronizationClusterSetTimeZoneResponseParams init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    dstOffsetRequired = v2->_dstOffsetRequired;
    v2->_dstOffsetRequired = (NSNumber *)&unk_250591A40;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRTimeSynchronizationClusterSetTimeZoneResponseParams *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;

  v4 = objc_alloc_init(MTRTimeSynchronizationClusterSetTimeZoneResponseParams);
  objc_msgSend_dstOffsetRequired(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDstOffsetRequired_(v4, v8, (uint64_t)v7);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: dstOffsetRequired:%@; >"), v5, self->_dstOffsetRequired);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (MTRTimeSynchronizationClusterSetTimeZoneResponseParams)initWithResponseValue:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  MTRTimeSynchronizationClusterSetTimeZoneResponseParams *v8;
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
  MTRTimeSynchronizationClusterSetTimeZoneResponseParams *v30;
  char v32;
  __int128 v33;
  uint64_t v34;
  _BYTE v35[72];
  uint64_t v36;
  objc_super v37;
  uint64_t v38;
  void *v39;
  __int128 buf;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v37.receiver = self;
  v37.super_class = (Class)MTRTimeSynchronizationClusterSetTimeZoneResponseParams;
  v8 = -[MTRTimeSynchronizationClusterSetTimeZoneResponseParams init](&v37, sel_init);
  if (!v8)
  {
    v30 = 0;
    goto LABEL_16;
  }
  objc_msgSend__responseDataForCommand_clusterID_commandID_error_(MTRBaseDevice, v7, (uint64_t)v6, 56, 3, a4);
  if (v36)
  {
    sub_234104468((uint64_t)v35);
    sub_234104498((uint64_t)v35, *(_QWORD *)(v36 + 8), *(_QWORD *)(v36 + 24));
    v33 = 0uLL;
    v34 = 0;
    sub_234105EE4((uint64_t)v35, 256, &v33);
    if (!(_DWORD)v33)
    {
      v32 = 0;
      sub_233D0CA58(&v32, (uint64_t)v35, (uint64_t)&buf);
      v33 = buf;
      v34 = v41;
      if (!(_DWORD)buf)
      {
        objc_msgSend__setFieldsFromDecodableStruct_(v8, v9, (uint64_t)&v32);
        v33 = buf;
        v34 = v41;
        if (!(_DWORD)buf)
        {
          v30 = v8;
          goto LABEL_14;
        }
      }
    }
    v10 = (void *)MEMORY[0x24BDD17C8];
    buf = v33;
    v41 = v34;
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

- (NSNumber)dstOffsetRequired
{
  return self->_dstOffsetRequired;
}

- (void)setDstOffsetRequired:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dstOffsetRequired, 0);
}

- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3
{
  void *v6;
  const char *v7;
  ChipError *result;

  objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], a3, a4->var0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDstOffsetRequired_(self, v7, (uint64_t)v6);

  retstr->mError = 0;
  retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-gene"
                  "rated/MTRCommandPayloadsObjc.mm";
  retstr->mLine = 7363;
  return result;
}

@end
