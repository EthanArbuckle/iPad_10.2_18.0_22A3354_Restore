@implementation MTRGroupsClusterViewGroupResponseParams

- (MTRGroupsClusterViewGroupResponseParams)init
{
  MTRGroupsClusterViewGroupResponseParams *v2;
  MTRGroupsClusterViewGroupResponseParams *v3;
  NSNumber *status;
  NSNumber *groupID;
  NSString *groupName;
  NSNumber *timedInvokeTimeoutMs;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTRGroupsClusterViewGroupResponseParams;
  v2 = -[MTRGroupsClusterViewGroupResponseParams init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    status = v2->_status;
    v2->_status = (NSNumber *)&unk_250591A40;

    groupID = v3->_groupID;
    v3->_groupID = (NSNumber *)&unk_250591A40;

    groupName = v3->_groupName;
    v3->_groupName = (NSString *)&stru_2505249E8;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRGroupsClusterViewGroupResponseParams *v4;
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

  v4 = objc_alloc_init(MTRGroupsClusterViewGroupResponseParams);
  objc_msgSend_status(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStatus_(v4, v8, (uint64_t)v7);

  objc_msgSend_groupID(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setGroupID_(v4, v12, (uint64_t)v11);

  objc_msgSend_groupName(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setGroupName_(v4, v16, (uint64_t)v15);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: status:%@; groupID:%@; groupName:%@; >"),
    v5,
    self->_status,
    self->_groupID,
    self->_groupName);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (MTRGroupsClusterViewGroupResponseParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error
{
  NSDictionary *v6;
  const char *v7;
  MTRGroupsClusterViewGroupResponseParams *v8;
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
  MTRGroupsClusterViewGroupResponseParams *v30;
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
  v38.super_class = (Class)MTRGroupsClusterViewGroupResponseParams;
  v8 = -[MTRGroupsClusterViewGroupResponseParams init](&v38, sel_init);
  if (!v8)
  {
    v30 = 0;
    goto LABEL_16;
  }
  objc_msgSend__responseDataForCommand_clusterID_commandID_error_(MTRBaseDevice, v7, (uint64_t)v6, 4, 1, error);
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
      WORD1(buf) = 0;
      *((_QWORD *)&buf + 1) = 0;
      v42 = 0;
      sub_233CF9C60((uint64_t)&buf, (uint64_t)v36, (uint64_t)&v32);
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

- (NSNumber)status
{
  return self->_status;
}

- (void)setStatus:(NSNumber *)status
{
  objc_setProperty_nonatomic_copy(self, a2, status, 8);
}

- (NSNumber)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(NSNumber *)groupID
{
  objc_setProperty_nonatomic_copy(self, a2, groupID, 16);
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void)setGroupName:(NSString *)groupName
{
  objc_setProperty_nonatomic_copy(self, a2, groupName, 24);
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
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_status, 0);
}

- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3
{
  void *v7;
  const char *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  const char *v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  ChipError *result;

  objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], a3, *(unsigned __int8 *)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStatus_(self, v8, (uint64_t)v7);

  objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v9, *((unsigned __int16 *)a4 + 1));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setGroupID_(self, v11, (uint64_t)v10);

  v12 = *((_QWORD *)a4 + 1);
  v13 = *((_QWORD *)a4 + 2);
  v14 = objc_alloc(MEMORY[0x24BDD17C8]);
  v16 = (void *)objc_msgSend_initWithBytes_length_encoding_(v14, v15, v12, v13, 4);
  objc_msgSend_setGroupName_(self, v17, (uint64_t)v16);

  objc_msgSend_groupName(self, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    retstr->mError = 0;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 579;
  }
  else
  {
    *(_OWORD *)&retstr->mError = xmmword_2504EEB20;
    *(_QWORD *)&retstr->mLine = 575;
  }
  return result;
}

@end
