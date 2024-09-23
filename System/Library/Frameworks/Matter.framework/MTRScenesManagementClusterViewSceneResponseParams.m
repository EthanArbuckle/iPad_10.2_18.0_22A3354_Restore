@implementation MTRScenesManagementClusterViewSceneResponseParams

- (MTRScenesManagementClusterViewSceneResponseParams)init
{
  MTRScenesManagementClusterViewSceneResponseParams *v2;
  MTRScenesManagementClusterViewSceneResponseParams *v3;
  NSNumber *status;
  NSNumber *groupID;
  NSNumber *sceneID;
  NSNumber *transitionTime;
  NSString *sceneName;
  NSArray *extensionFieldSets;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MTRScenesManagementClusterViewSceneResponseParams;
  v2 = -[MTRScenesManagementClusterViewSceneResponseParams init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    status = v2->_status;
    v2->_status = (NSNumber *)&unk_250591A40;

    groupID = v3->_groupID;
    v3->_groupID = (NSNumber *)&unk_250591A40;

    sceneID = v3->_sceneID;
    v3->_sceneID = (NSNumber *)&unk_250591A40;

    transitionTime = v3->_transitionTime;
    v3->_transitionTime = 0;

    sceneName = v3->_sceneName;
    v3->_sceneName = 0;

    extensionFieldSets = v3->_extensionFieldSets;
    v3->_extensionFieldSets = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRScenesManagementClusterViewSceneResponseParams *v4;
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
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;

  v4 = objc_alloc_init(MTRScenesManagementClusterViewSceneResponseParams);
  objc_msgSend_status(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStatus_(v4, v8, (uint64_t)v7);

  objc_msgSend_groupID(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setGroupID_(v4, v12, (uint64_t)v11);

  objc_msgSend_sceneID(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSceneID_(v4, v16, (uint64_t)v15);

  objc_msgSend_transitionTime(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTransitionTime_(v4, v20, (uint64_t)v19);

  objc_msgSend_sceneName(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSceneName_(v4, v24, (uint64_t)v23);

  objc_msgSend_extensionFieldSets(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setExtensionFieldSets_(v4, v28, (uint64_t)v27);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: status:%@; groupID:%@; sceneID:%@; transitionTime:%@; sceneName:%@; extensionFieldSets:%@; >"),
    v5,
    self->_status,
    self->_groupID,
    self->_sceneID,
    self->_transitionTime,
    self->_sceneName,
    self->_extensionFieldSets);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (MTRScenesManagementClusterViewSceneResponseParams)initWithResponseValue:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  MTRScenesManagementClusterViewSceneResponseParams *v8;
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
  MTRScenesManagementClusterViewSceneResponseParams *v30;
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
  v38.super_class = (Class)MTRScenesManagementClusterViewSceneResponseParams;
  v8 = -[MTRScenesManagementClusterViewSceneResponseParams init](&v38, sel_init);
  if (!v8)
  {
    v30 = 0;
    goto LABEL_16;
  }
  objc_msgSend__responseDataForCommand_clusterID_commandID_error_(MTRBaseDevice, v7, (uint64_t)v6, 98, 1, a4);
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
      BYTE4(buf) = 0;
      BYTE8(buf) = 0;
      LOBYTE(v42) = 0;
      v43 = 0;
      sub_233D17B24((uint64_t)&buf, (uint64_t)v36, (uint64_t)&v32);
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

- (NSNumber)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)sceneID
{
  return self->_sceneID;
}

- (void)setSceneID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)transitionTime
{
  return self->_transitionTime;
}

- (void)setTransitionTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)sceneName
{
  return self->_sceneName;
}

- (void)setSceneName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)extensionFieldSets
{
  return self->_extensionFieldSets;
}

- (void)setExtensionFieldSets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionFieldSets, 0);
  objc_storeStrong((id *)&self->_sceneName, 0);
  objc_storeStrong((id *)&self->_transitionTime, 0);
  objc_storeStrong((id *)&self->_sceneID, 0);
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
  const char *v12;
  void *v13;
  const char *v14;
  const char *v15;
  void *v16;
  _BYTE *v17;
  const char *v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  const char *v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  ChipError *result;
  const char *v33;
  _BYTE *v34;
  int v35;
  _BYTE *v36;
  const char *v37;
  void *v38;
  const char *v39;
  void *v40;
  const char *v41;
  void *v42;
  const char *v43;
  void *v44;
  const char *v45;
  void *v46;
  const char *v47;
  const char *v48;
  void *v49;
  _BYTE *v50;
  const char *v51;
  void *v52;
  const char *v53;
  const char *v54;
  void *v55;
  _BYTE *v56;
  const char *v57;
  void *v58;
  const char *v59;
  const char *v60;
  void *v61;
  _BYTE *v62;
  const char *v63;
  void *v64;
  const char *v65;
  const char *v66;
  void *v67;
  _BYTE *v68;
  const char *v69;
  void *v70;
  const char *v71;
  const char *v72;
  void *v73;
  _BYTE *v74;
  const char *v75;
  void *v76;
  const char *v77;
  const char *v78;
  void *v79;
  _BYTE *v80;
  const char *v81;
  void *v82;
  const char *v83;
  const char *v84;
  void *v85;
  uint64_t *v86;
  const char *v87;
  void *v88;
  const char *v89;
  const char *v90;
  void *v91;
  uint64_t *v92;
  const char *v93;
  void *v94;
  const char *v95;
  const char *v96;
  const char *v97;
  MTRScenesManagementClusterViewSceneResponseParams *v98;
  ChipError *v99;
  void *v100;
  void *v101;
  unsigned int v102;
  _BYTE v103[2];
  _BYTE v104[2];
  _BYTE v105[4];
  _BYTE v106[4];
  _BYTE v107[8];
  _BYTE v108[8];
  _BYTE v109[16];
  _BYTE v110[16];
  __int128 v111;
  uint64_t v112;
  unsigned int v113;
  uint64_t v114;
  unsigned __int8 v115;
  unsigned __int8 v116;
  __int128 v117;
  uint64_t v118;
  unsigned __int8 v119[10];

  objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], a3, *(unsigned __int8 *)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStatus_(self, v8, (uint64_t)v7);

  objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v9, *((unsigned __int16 *)a4 + 1));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setGroupID_(self, v11, (uint64_t)v10);

  objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], v12, *((unsigned __int8 *)a4 + 4));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSceneID_(self, v14, (uint64_t)v13);

  if (*((_BYTE *)a4 + 8))
  {
    v16 = (void *)MEMORY[0x24BDD16E0];
    v17 = sub_233C20E2C((_BYTE *)a4 + 8);
    objc_msgSend_numberWithUnsignedInt_(v16, v18, *(unsigned int *)v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTransitionTime_(self, v20, (uint64_t)v19);

  }
  else
  {
    objc_msgSend_setTransitionTime_(self, v15, 0);
  }
  if (*((_BYTE *)a4 + 16))
  {
    v22 = (uint64_t *)sub_233C05DB8((_BYTE *)a4 + 16);
    v23 = *v22;
    v24 = v22[1];
    v25 = objc_alloc(MEMORY[0x24BDD17C8]);
    v27 = (void *)objc_msgSend_initWithBytes_length_encoding_(v25, v26, v23, v24, 4);
    objc_msgSend_setSceneName_(self, v28, (uint64_t)v27);

    objc_msgSend_sceneName(self, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v31)
    {
      *(_OWORD *)&retstr->mError = xmmword_2504EED48;
      *(_QWORD *)&retstr->mLine = 13443;
      return result;
    }
  }
  else
  {
    objc_msgSend_setSceneName_(self, v21, 0);
  }
  v35 = *((unsigned __int8 *)a4 + 40);
  v34 = (char *)a4 + 40;
  if (!v35)
  {
    result = (ChipError *)objc_msgSend_setExtensionFieldSets_(self, v33, 0);
LABEL_51:
    retstr->mError = 0;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 13528;
    return result;
  }
  v100 = (void *)objc_opt_new();
  v36 = sub_233C25EA4(v34);
  LOBYTE(v102) = v36[72];
  if ((_BYTE)v102)
    BYTE1(v102) = v36[73];
  sub_233CAFCC4((uint64_t)&v113, (uint64_t)v36, (unsigned __int8 *)&v102);
  v99 = retstr;
  while (1)
  {
    if (!sub_233CAFD48((uint64_t)&v113))
    {
      retstr = v99;
      *(_QWORD *)&v99->mError = 0;
      v99->mFile = 0;
      *(_QWORD *)&v99->mLine = 0;
      if ((_DWORD)v117 == 33)
      {
        v99->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/app/data-model/DecodableList.h";
        v99->mLine = 147;
        v98 = self;
      }
      else
      {
        *(_OWORD *)&v99->mError = v117;
        *(_QWORD *)&v99->mLine = v118;
        v98 = self;
        if (v99->mError)
          goto LABEL_53;
      }
      objc_msgSend_setExtensionFieldSets_(v98, v37, (uint64_t)v100);

      goto LABEL_51;
    }
    v38 = (void *)objc_opt_new();
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v39, v113);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = v38;
    objc_msgSend_setClusterID_(v38, v41, (uint64_t)v40);

    v42 = (void *)objc_opt_new();
    v119[0] = v115;
    if (v115)
      v119[1] = v116;
    sub_233CAFE5C((uint64_t)&v102, (uint64_t)&v114, v119);
    while (sub_233CAFEEC((uint64_t)&v102))
    {
      v44 = (void *)objc_opt_new();
      objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v45, v102);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setAttributeID_(v44, v47, (uint64_t)v46);

      if (v103[0])
      {
        v49 = (void *)MEMORY[0x24BDD16E0];
        v50 = sub_233C27DCC(v103);
        objc_msgSend_numberWithUnsignedChar_(v49, v51, *v50);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setValueUnsigned8_(v44, v53, (uint64_t)v52);

      }
      else
      {
        objc_msgSend_setValueUnsigned8_(v44, v48, 0);
      }
      if (v104[0])
      {
        v55 = (void *)MEMORY[0x24BDD16E0];
        v56 = sub_233C27DCC(v104);
        objc_msgSend_numberWithChar_(v55, v57, (char)*v56);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setValueSigned8_(v44, v59, (uint64_t)v58);

      }
      else
      {
        objc_msgSend_setValueSigned8_(v44, v54, 0);
      }
      if (v105[0])
      {
        v61 = (void *)MEMORY[0x24BDD16E0];
        v62 = sub_233C05D98(v105);
        objc_msgSend_numberWithUnsignedShort_(v61, v63, *(unsigned __int16 *)v62);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setValueUnsigned16_(v44, v65, (uint64_t)v64);

      }
      else
      {
        objc_msgSend_setValueUnsigned16_(v44, v60, 0);
      }
      if (v106[0])
      {
        v67 = (void *)MEMORY[0x24BDD16E0];
        v68 = sub_233C493C0(v106);
        objc_msgSend_numberWithShort_(v67, v69, *(__int16 *)v68);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setValueSigned16_(v44, v71, (uint64_t)v70);

      }
      else
      {
        objc_msgSend_setValueSigned16_(v44, v66, 0);
      }
      if (v107[0])
      {
        v73 = (void *)MEMORY[0x24BDD16E0];
        v74 = sub_233C20E2C(v107);
        objc_msgSend_numberWithUnsignedInt_(v73, v75, *(unsigned int *)v74);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setValueUnsigned32_(v44, v77, (uint64_t)v76);

      }
      else
      {
        objc_msgSend_setValueUnsigned32_(v44, v72, 0);
      }
      if (v108[0])
      {
        v79 = (void *)MEMORY[0x24BDD16E0];
        v80 = sub_233C20E2C(v108);
        objc_msgSend_numberWithInt_(v79, v81, *(unsigned int *)v80);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setValueSigned32_(v44, v83, (uint64_t)v82);

      }
      else
      {
        objc_msgSend_setValueSigned32_(v44, v78, 0);
      }
      if (v109[0])
      {
        v85 = (void *)MEMORY[0x24BDD16E0];
        v86 = (uint64_t *)sub_233C25EA4(v109);
        objc_msgSend_numberWithUnsignedLongLong_(v85, v87, *v86);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setValueUnsigned64_(v44, v89, (uint64_t)v88);

      }
      else
      {
        objc_msgSend_setValueUnsigned64_(v44, v84, 0);
      }
      if (v110[0])
      {
        v91 = (void *)MEMORY[0x24BDD16E0];
        v92 = (uint64_t *)sub_233C25EA4(v110);
        objc_msgSend_numberWithLongLong_(v91, v93, *v92);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setValueSigned64_(v44, v95, (uint64_t)v94);

      }
      else
      {
        objc_msgSend_setValueSigned64_(v44, v90, 0);
      }
      objc_msgSend_addObject_(v42, v96, (uint64_t)v44);

    }
    *(_QWORD *)&v99->mError = 0;
    v99->mFile = 0;
    *(_QWORD *)&v99->mLine = 0;
    if ((_DWORD)v111 == 33)
    {
      v99->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/app/data-model/DecodableList.h";
      v99->mLine = 147;
      goto LABEL_45;
    }
    *(_OWORD *)&v99->mError = v111;
    *(_QWORD *)&v99->mLine = v112;
    if (v99->mError)
      break;
LABEL_45:
    objc_msgSend_setAttributeValueList_(v101, v43, (uint64_t)v42);

    objc_msgSend_addObject_(v100, v97, (uint64_t)v101);
  }

LABEL_53:
  return result;
}

@end
