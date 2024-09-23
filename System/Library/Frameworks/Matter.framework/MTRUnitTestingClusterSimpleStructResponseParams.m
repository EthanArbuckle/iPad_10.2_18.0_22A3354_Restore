@implementation MTRUnitTestingClusterSimpleStructResponseParams

- (MTRUnitTestingClusterSimpleStructResponseParams)init
{
  MTRUnitTestingClusterSimpleStructResponseParams *v2;
  uint64_t v3;
  MTRUnitTestingClusterSimpleStruct *arg1;
  NSNumber *timedInvokeTimeoutMs;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTRUnitTestingClusterSimpleStructResponseParams;
  v2 = -[MTRUnitTestingClusterSimpleStructResponseParams init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    arg1 = v2->_arg1;
    v2->_arg1 = (MTRUnitTestingClusterSimpleStruct *)v3;

    timedInvokeTimeoutMs = v2->_timedInvokeTimeoutMs;
    v2->_timedInvokeTimeoutMs = 0;

  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRUnitTestingClusterSimpleStructResponseParams *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;

  v4 = objc_alloc_init(MTRUnitTestingClusterSimpleStructResponseParams);
  objc_msgSend_arg1(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setArg1_(v4, v8, (uint64_t)v7);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: arg1:%@; >"), v5, self->_arg1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (MTRUnitTestingClusterSimpleStructResponseParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error
{
  NSDictionary *v6;
  const char *v7;
  MTRUnitTestingClusterSimpleStructResponseParams *v8;
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
  MTRUnitTestingClusterSimpleStructResponseParams *v30;
  __int128 v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  _BYTE v36[72];
  uint64_t v37;
  objc_super v38;
  uint64_t v39;
  void *v40;
  _BYTE buf[24];
  __int128 v42;
  char v43;
  int v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v6 = responseValue;
  v38.receiver = self;
  v38.super_class = (Class)MTRUnitTestingClusterSimpleStructResponseParams;
  v8 = -[MTRUnitTestingClusterSimpleStructResponseParams init](&v38, sel_init);
  if (!v8)
  {
    v30 = 0;
    goto LABEL_16;
  }
  objc_msgSend__responseDataForCommand_clusterID_commandID_error_(MTRBaseDevice, v7, (uint64_t)v6, 4294048773, 9, error);
  if (v37)
  {
    sub_234104468((uint64_t)v36);
    sub_234104498((uint64_t)v36, *(_QWORD *)(v37 + 8), *(_QWORD *)(v37 + 24));
    v34 = 0uLL;
    v35 = 0;
    sub_234105EE4((uint64_t)v36, 256, &v34);
    if (!(_DWORD)v34)
    {
      *(_WORD *)buf = 0;
      buf[2] = 0;
      v44 = 0;
      v45 = 0;
      *(_OWORD *)&buf[8] = 0u;
      v42 = 0u;
      v43 = 0;
      sub_233D41B2C((uint64_t)buf, (uint64_t)v36, (uint64_t)&v32);
      v34 = v32;
      v35 = v33;
      if (!(_DWORD)v32)
      {
        objc_msgSend__setFieldsFromDecodableStruct_(v8, v9, (uint64_t)buf);
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
    *(_OWORD *)buf = v34;
    *(_QWORD *)&buf[16] = v35;
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

- (MTRUnitTestingClusterSimpleStruct)arg1
{
  return self->_arg1;
}

- (void)setArg1:(MTRUnitTestingClusterSimpleStruct *)arg1
{
  objc_setProperty_nonatomic_copy(self, a2, arg1, 8);
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
  objc_storeStrong((id *)&self->_arg1, 0);
}

- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3
{
  void *v7;
  const char *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  const char *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  const char *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  ChipError *result;
  const char *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  double v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;

  v7 = (void *)objc_opt_new();
  objc_msgSend_setArg1_(self, v8, (uint64_t)v7);

  objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], v9, *(unsigned __int8 *)a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arg1(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setA_(v13, v14, (uint64_t)v10);

  objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v15, *((unsigned __int8 *)a4 + 1));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arg1(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setB_(v19, v20, (uint64_t)v16);

  objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], v21, *((unsigned __int8 *)a4 + 2));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arg1(self, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setC_(v25, v26, (uint64_t)v22);

  objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v27, *((_QWORD *)a4 + 1), *((_QWORD *)a4 + 2));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arg1(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setD_(v31, v32, (uint64_t)v28);

  v33 = *((_QWORD *)a4 + 3);
  v34 = *((_QWORD *)a4 + 4);
  v35 = objc_alloc(MEMORY[0x24BDD17C8]);
  v37 = (void *)objc_msgSend_initWithBytes_length_encoding_(v35, v36, v33, v34, 4);
  objc_msgSend_arg1(self, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setE_(v40, v41, (uint64_t)v37);

  objc_msgSend_arg1(self, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_e(v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
  {
    objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], v49, *((unsigned __int8 *)a4 + 40));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_arg1(self, v51, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setF_(v53, v54, (uint64_t)v50);

    LODWORD(v55) = *((_DWORD *)a4 + 11);
    objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v56, v57, v55);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_arg1(self, v59, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setG_(v61, v62, (uint64_t)v58);

    objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v63, v64, *((double *)a4 + 6));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_arg1(self, v66, v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setH_(v68, v69, (uint64_t)v65);

    retstr->mError = 0;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 34472;
  }
  else
  {
    *(_OWORD *)&retstr->mError = xmmword_2504EF210;
    *(_QWORD *)&retstr->mLine = 34465;
  }
  return result;
}

@end
