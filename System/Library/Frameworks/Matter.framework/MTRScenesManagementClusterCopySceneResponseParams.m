@implementation MTRScenesManagementClusterCopySceneResponseParams

- (MTRScenesManagementClusterCopySceneResponseParams)init
{
  MTRScenesManagementClusterCopySceneResponseParams *v2;
  MTRScenesManagementClusterCopySceneResponseParams *v3;
  NSNumber *status;
  NSNumber *groupIdentifierFrom;
  NSNumber *sceneIdentifierFrom;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTRScenesManagementClusterCopySceneResponseParams;
  v2 = -[MTRScenesManagementClusterCopySceneResponseParams init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    status = v2->_status;
    v2->_status = (NSNumber *)&unk_250591A40;

    groupIdentifierFrom = v3->_groupIdentifierFrom;
    v3->_groupIdentifierFrom = (NSNumber *)&unk_250591A40;

    sceneIdentifierFrom = v3->_sceneIdentifierFrom;
    v3->_sceneIdentifierFrom = (NSNumber *)&unk_250591A40;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRScenesManagementClusterCopySceneResponseParams *v4;
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

  v4 = objc_alloc_init(MTRScenesManagementClusterCopySceneResponseParams);
  objc_msgSend_status(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStatus_(v4, v8, (uint64_t)v7);

  objc_msgSend_groupIdentifierFrom(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setGroupIdentifierFrom_(v4, v12, (uint64_t)v11);

  objc_msgSend_sceneIdentifierFrom(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSceneIdentifierFrom_(v4, v16, (uint64_t)v15);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: status:%@; groupIdentifierFrom:%@; sceneIdentifierFrom:%@; >"),
    v5,
    self->_status,
    self->_groupIdentifierFrom,
    self->_sceneIdentifierFrom);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (MTRScenesManagementClusterCopySceneResponseParams)initWithResponseValue:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  MTRScenesManagementClusterCopySceneResponseParams *v8;
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
  MTRScenesManagementClusterCopySceneResponseParams *v30;
  _BYTE v32[2];
  __int16 v33;
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
  v6 = a3;
  v39.receiver = self;
  v39.super_class = (Class)MTRScenesManagementClusterCopySceneResponseParams;
  v8 = -[MTRScenesManagementClusterCopySceneResponseParams init](&v39, sel_init);
  if (!v8)
  {
    v30 = 0;
    goto LABEL_16;
  }
  objc_msgSend__responseDataForCommand_clusterID_commandID_error_(MTRBaseDevice, v7, (uint64_t)v6, 98, 64, a4);
  if (v38)
  {
    sub_234104468((uint64_t)v37);
    sub_234104498((uint64_t)v37, *(_QWORD *)(v38 + 8), *(_QWORD *)(v38 + 24));
    v35 = 0uLL;
    v36 = 0;
    sub_234105EE4((uint64_t)v37, 256, &v35);
    if (!(_DWORD)v35)
    {
      v32[0] = 0;
      v33 = 0;
      v34 = 0;
      sub_233D18C24((uint64_t)v32, (uint64_t)v37, (uint64_t)&buf);
      v35 = buf;
      v36 = v43;
      if (!(_DWORD)buf)
      {
        objc_msgSend__setFieldsFromDecodableStruct_(v8, v9, (uint64_t)v32);
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
    if (a4)
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
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  v30 = 0;
LABEL_14:
  sub_233CAF128(&v38);
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

- (NSNumber)groupIdentifierFrom
{
  return self->_groupIdentifierFrom;
}

- (void)setGroupIdentifierFrom:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)sceneIdentifierFrom
{
  return self->_sceneIdentifierFrom;
}

- (void)setSceneIdentifierFrom:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneIdentifierFrom, 0);
  objc_storeStrong((id *)&self->_groupIdentifierFrom, 0);
  objc_storeStrong((id *)&self->_status, 0);
}

- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3
{
  void *v7;
  const char *v8;
  const char *v9;
  void *v10;
  const char *v11;
  const char *v12;
  void *v13;
  const char *v14;
  ChipError *result;

  objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], a3, a4->var0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStatus_(self, v8, (uint64_t)v7);

  objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v9, *(unsigned __int16 *)&a4[2].var0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setGroupIdentifierFrom_(self, v11, (uint64_t)v10);

  objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], v12, a4[4].var0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSceneIdentifierFrom_(self, v14, (uint64_t)v13);

  retstr->mError = 0;
  retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-gene"
                  "rated/MTRCommandPayloadsObjc.mm";
  retstr->mLine = 14535;
  return result;
}

@end
