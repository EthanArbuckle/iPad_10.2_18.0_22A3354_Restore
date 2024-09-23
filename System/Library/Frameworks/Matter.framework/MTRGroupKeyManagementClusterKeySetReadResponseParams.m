@implementation MTRGroupKeyManagementClusterKeySetReadResponseParams

- (MTRGroupKeyManagementClusterKeySetReadResponseParams)init
{
  MTRGroupKeyManagementClusterKeySetReadResponseParams *v2;
  uint64_t v3;
  MTRGroupKeyManagementClusterGroupKeySetStruct *groupKeySet;
  NSNumber *timedInvokeTimeoutMs;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTRGroupKeyManagementClusterKeySetReadResponseParams;
  v2 = -[MTRGroupKeyManagementClusterKeySetReadResponseParams init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    groupKeySet = v2->_groupKeySet;
    v2->_groupKeySet = (MTRGroupKeyManagementClusterGroupKeySetStruct *)v3;

    timedInvokeTimeoutMs = v2->_timedInvokeTimeoutMs;
    v2->_timedInvokeTimeoutMs = 0;

  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRGroupKeyManagementClusterKeySetReadResponseParams *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;

  v4 = objc_alloc_init(MTRGroupKeyManagementClusterKeySetReadResponseParams);
  objc_msgSend_groupKeySet(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setGroupKeySet_(v4, v8, (uint64_t)v7);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: groupKeySet:%@; >"), v5, self->_groupKeySet);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (MTRGroupKeyManagementClusterKeySetReadResponseParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error
{
  NSDictionary *v6;
  const char *v7;
  MTRGroupKeyManagementClusterKeySetReadResponseParams *v8;
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
  MTRGroupKeyManagementClusterKeySetReadResponseParams *v30;
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
  char v46;
  char v47;
  char v48;
  char v49;
  char v50;
  char v51;
  char v52;
  char v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v6 = responseValue;
  v38.receiver = self;
  v38.super_class = (Class)MTRGroupKeyManagementClusterKeySetReadResponseParams;
  v8 = -[MTRGroupKeyManagementClusterKeySetReadResponseParams init](&v38, sel_init);
  if (!v8)
  {
    v30 = 0;
    goto LABEL_16;
  }
  objc_msgSend__responseDataForCommand_clusterID_commandID_error_(MTRBaseDevice, v7, (uint64_t)v6, 63, 2, error);
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
      BYTE2(buf) = 0;
      BYTE8(buf) = 0;
      v43 = 0;
      v44 = 0;
      v45 = 0;
      v46 = 0;
      v47 = 0;
      v48 = 0;
      v49 = 0;
      v50 = 0;
      v51 = 0;
      v52 = 0;
      v53 = 0;
      sub_233D11038((uint64_t)&buf, (uint64_t)v36, (uint64_t)&v32);
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

- (MTRGroupKeyManagementClusterGroupKeySetStruct)groupKeySet
{
  return self->_groupKeySet;
}

- (void)setGroupKeySet:(MTRGroupKeyManagementClusterGroupKeySetStruct *)groupKeySet
{
  objc_setProperty_nonatomic_copy(self, a2, groupKeySet, 8);
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
  objc_storeStrong((id *)&self->_groupKeySet, 0);
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
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  const char *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  const char *v68;
  ChipError *result;

  v7 = (void *)objc_opt_new();
  objc_msgSend_setGroupKeySet_(self, v8, (uint64_t)v7);

  objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v9, *(unsigned __int16 *)a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_groupKeySet(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setGroupKeySetID_(v13, v14, (uint64_t)v10);

  objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], v15, *((unsigned __int8 *)a4 + 2));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_groupKeySet(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setGroupKeySecurityPolicy_(v19, v20, (uint64_t)v16);

  if (*((_BYTE *)a4 + 24))
  {
    objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v21, *((_QWORD *)a4 + 1), *((_QWORD *)a4 + 2));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_groupKeySet(self, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setEpochKey0_(v26, v27, (uint64_t)v23);

  }
  else
  {
    objc_msgSend_groupKeySet(self, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setEpochKey0_(v23, v28, 0);
  }

  if (*((_BYTE *)a4 + 40))
  {
    objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], v29, *((_QWORD *)a4 + 4));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_groupKeySet(self, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setEpochStartTime0_(v34, v35, (uint64_t)v31);

  }
  else
  {
    objc_msgSend_groupKeySet(self, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setEpochStartTime0_(v31, v36, 0);
  }

  if (*((_BYTE *)a4 + 64))
  {
    objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v37, *((_QWORD *)a4 + 6), *((_QWORD *)a4 + 7));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_groupKeySet(self, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setEpochKey1_(v42, v43, (uint64_t)v39);

  }
  else
  {
    objc_msgSend_groupKeySet(self, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setEpochKey1_(v39, v44, 0);
  }

  if (*((_BYTE *)a4 + 80))
  {
    objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], v45, *((_QWORD *)a4 + 9));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_groupKeySet(self, v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setEpochStartTime1_(v50, v51, (uint64_t)v47);

  }
  else
  {
    objc_msgSend_groupKeySet(self, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setEpochStartTime1_(v47, v52, 0);
  }

  if (*((_BYTE *)a4 + 104))
  {
    objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v53, *((_QWORD *)a4 + 11), *((_QWORD *)a4 + 12));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_groupKeySet(self, v56, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setEpochKey2_(v58, v59, (uint64_t)v55);

  }
  else
  {
    objc_msgSend_groupKeySet(self, v53, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setEpochKey2_(v55, v60, 0);
  }

  if (*((_BYTE *)a4 + 120))
  {
    objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], v61, *((_QWORD *)a4 + 14));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_groupKeySet(self, v64, v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setEpochStartTime2_(v66, v67, (uint64_t)v63);

  }
  else
  {
    objc_msgSend_groupKeySet(self, v61, v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setEpochStartTime2_(v63, v68, 0);
  }

  retstr->mError = 0;
  retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-gene"
                  "rated/MTRCommandPayloadsObjc.mm";
  retstr->mLine = 9263;
  return result;
}

@end
