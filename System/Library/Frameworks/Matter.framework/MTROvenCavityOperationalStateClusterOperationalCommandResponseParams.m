@implementation MTROvenCavityOperationalStateClusterOperationalCommandResponseParams

- (MTROvenCavityOperationalStateClusterOperationalCommandResponseParams)init
{
  MTROvenCavityOperationalStateClusterOperationalCommandResponseParams *v2;
  uint64_t v3;
  MTROvenCavityOperationalStateClusterErrorStateStruct *commandResponseState;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTROvenCavityOperationalStateClusterOperationalCommandResponseParams;
  v2 = -[MTROvenCavityOperationalStateClusterOperationalCommandResponseParams init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    commandResponseState = v2->_commandResponseState;
    v2->_commandResponseState = (MTROvenCavityOperationalStateClusterErrorStateStruct *)v3;

  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTROvenCavityOperationalStateClusterOperationalCommandResponseParams *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;

  v4 = objc_alloc_init(MTROvenCavityOperationalStateClusterOperationalCommandResponseParams);
  objc_msgSend_commandResponseState(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCommandResponseState_(v4, v8, (uint64_t)v7);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: commandResponseState:%@; >"),
    v5,
    self->_commandResponseState);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (MTROvenCavityOperationalStateClusterOperationalCommandResponseParams)initWithResponseValue:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  MTROvenCavityOperationalStateClusterOperationalCommandResponseParams *v8;
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
  MTROvenCavityOperationalStateClusterOperationalCommandResponseParams *v30;
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
  v38.super_class = (Class)MTROvenCavityOperationalStateClusterOperationalCommandResponseParams;
  v8 = -[MTROvenCavityOperationalStateClusterOperationalCommandResponseParams init](&v38, sel_init);
  if (!v8)
  {
    v30 = 0;
    goto LABEL_16;
  }
  objc_msgSend__responseDataForCommand_clusterID_commandID_error_(MTRBaseDevice, v7, (uint64_t)v6, 72, 4, a4);
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
      sub_233D128EC((uint64_t)&buf, (uint64_t)v36, (uint64_t)&v32);
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

- (MTROvenCavityOperationalStateClusterErrorStateStruct)commandResponseState
{
  return self->_commandResponseState;
}

- (void)setCommandResponseState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandResponseState, 0);
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
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  ChipError *result;
  const char *v34;
  uint64_t v35;
  __int128 *v36;
  void *v37;
  const char *v38;
  _BYTE *v39;
  int v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  const char *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  const char *v58;

  v7 = (void *)objc_opt_new();
  objc_msgSend_setCommandResponseState_(self, v8, (uint64_t)v7);

  objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], v9, *(unsigned __int8 *)a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_commandResponseState(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setErrorStateID_(v13, v14, (uint64_t)v10);

  if (*((_BYTE *)a4 + 8))
  {
    v17 = (uint64_t *)sub_233C05DB8((_BYTE *)a4 + 8);
    v18 = *v17;
    v19 = v17[1];
    v20 = objc_alloc(MEMORY[0x24BDD17C8]);
    v22 = (void *)objc_msgSend_initWithBytes_length_encoding_(v20, v21, v18, v19, 4);
    objc_msgSend_commandResponseState(self, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setErrorStateLabel_(v25, v26, (uint64_t)v22);

    objc_msgSend_commandResponseState(self, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorStateLabel(v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v32)
    {
      v36 = &xmmword_2504EEC28;
LABEL_8:
      *(_OWORD *)&retstr->mError = *v36;
      *(_QWORD *)&retstr->mLine = *((_QWORD *)v36 + 2);
      return result;
    }
  }
  else
  {
    objc_msgSend_commandResponseState(self, v15, v16);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setErrorStateLabel_(v37, v38, 0);

  }
  v40 = *((unsigned __int8 *)a4 + 32);
  v39 = (char *)a4 + 32;
  if (v40)
  {
    v41 = (uint64_t *)sub_233C05DB8(v39);
    v42 = *v41;
    v43 = v41[1];
    v44 = objc_alloc(MEMORY[0x24BDD17C8]);
    v46 = (void *)objc_msgSend_initWithBytes_length_encoding_(v44, v45, v42, v43, 4);
    objc_msgSend_commandResponseState(self, v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setErrorStateDetails_(v49, v50, (uint64_t)v46);

    objc_msgSend_commandResponseState(self, v51, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorStateDetails(v53, v54, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v56)
    {
      v36 = &xmmword_2504EEC40;
      goto LABEL_8;
    }
  }
  else
  {
    objc_msgSend_commandResponseState(self, v34, v35);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setErrorStateDetails_(v57, v58, 0);

  }
  retstr->mError = 0;
  retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-gene"
                  "rated/MTRCommandPayloadsObjc.mm";
  retstr->mLine = 10641;
  return result;
}

@end
