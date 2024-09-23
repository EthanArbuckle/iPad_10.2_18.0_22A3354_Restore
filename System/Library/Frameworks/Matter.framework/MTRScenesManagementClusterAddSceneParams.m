@implementation MTRScenesManagementClusterAddSceneParams

- (MTRScenesManagementClusterAddSceneParams)init
{
  MTRScenesManagementClusterAddSceneParams *v2;
  MTRScenesManagementClusterAddSceneParams *v3;
  NSNumber *groupID;
  NSNumber *sceneID;
  NSNumber *transitionTime;
  NSString *sceneName;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  NSArray *extensionFieldSets;
  NSNumber *timedInvokeTimeoutMs;
  NSNumber *serverSideProcessingTimeout;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MTRScenesManagementClusterAddSceneParams;
  v2 = -[MTRScenesManagementClusterAddSceneParams init](&v15, sel_init);
  v3 = v2;
  if (v2)
  {
    groupID = v2->_groupID;
    v2->_groupID = (NSNumber *)&unk_250591A40;

    sceneID = v3->_sceneID;
    v3->_sceneID = (NSNumber *)&unk_250591A40;

    transitionTime = v3->_transitionTime;
    v3->_transitionTime = (NSNumber *)&unk_250591A40;

    sceneName = v3->_sceneName;
    v3->_sceneName = (NSString *)&stru_2505249E8;

    objc_msgSend_array(MEMORY[0x24BDBCE30], v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    extensionFieldSets = v3->_extensionFieldSets;
    v3->_extensionFieldSets = (NSArray *)v10;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRScenesManagementClusterAddSceneParams *v4;
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
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;

  v4 = objc_alloc_init(MTRScenesManagementClusterAddSceneParams);
  objc_msgSend_groupID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setGroupID_(v4, v8, (uint64_t)v7);

  objc_msgSend_sceneID(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSceneID_(v4, v12, (uint64_t)v11);

  objc_msgSend_transitionTime(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTransitionTime_(v4, v16, (uint64_t)v15);

  objc_msgSend_sceneName(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSceneName_(v4, v20, (uint64_t)v19);

  objc_msgSend_extensionFieldSets(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setExtensionFieldSets_(v4, v24, (uint64_t)v23);

  objc_msgSend_timedInvokeTimeoutMs(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v28, (uint64_t)v27);

  objc_msgSend_serverSideProcessingTimeout(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setServerSideProcessingTimeout_(v4, v32, (uint64_t)v31);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: groupID:%@; sceneID:%@; transitionTime:%@; sceneName:%@; extensionFieldSets:%@; >"),
    v5,
    self->_groupID,
    self->_sceneID,
    self->_transitionTime,
    self->_sceneName,
    self->_extensionFieldSets);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)sceneID
{
  return self->_sceneID;
}

- (void)setSceneID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)transitionTime
{
  return self->_transitionTime;
}

- (void)setTransitionTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)sceneName
{
  return self->_sceneName;
}

- (void)setSceneName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)extensionFieldSets
{
  return self->_extensionFieldSets;
}

- (void)setExtensionFieldSets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)serverSideProcessingTimeout
{
  return self->_serverSideProcessingTimeout;
}

- (void)setServerSideProcessingTimeout:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSideProcessingTimeout, 0);
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_extensionFieldSets, 0);
  objc_storeStrong((id *)&self->_sceneName, 0);
  objc_storeStrong((id *)&self->_transitionTime, 0);
  objc_storeStrong((id *)&self->_sceneID, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  id v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  unint64_t v37;
  const char *v38;
  uint64_t v39;
  unint64_t i;
  void *v41;
  const char *v42;
  uint64_t v43;
  unint64_t v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  void *v49;
  char isKindOfClass;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t j;
  void *v78;
  const char *v79;
  uint64_t v80;
  unint64_t v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  void *v86;
  char v87;
  const char *v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  const char *v133;
  uint64_t v134;
  void *v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  const char *v140;
  uint64_t v141;
  void *v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  const char *v147;
  uint64_t v148;
  void *v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  _QWORD *v153;
  void *v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  void *v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  unsigned int v163;
  ChipError *v164;
  int v165;
  uint64_t v167;
  void *v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  _QWORD *v174;
  unint64_t v175[8];
  void *v176;
  uint64_t v177;
  uint64_t v178;
  char v179;
  uint64_t v180;
  uint64_t *v181;
  _QWORD v182[2];
  unsigned __int16 v183;
  char v184;
  _DWORD v185[9];
  _BYTE v186[40];

  v183 = 0;
  v184 = 0;
  memset(v185, 0, sizeof(v185));
  v182[0] = 0;
  v182[1] = 0;
  v181 = v182;
  objc_msgSend_groupID(self, a3, (uint64_t)a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v183 = objc_msgSend_unsignedShortValue(v5, v6, v7);

  objc_msgSend_sceneID(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v184 = objc_msgSend_unsignedCharValue(v10, v11, v12);

  objc_msgSend_transitionTime(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v185[0] = objc_msgSend_unsignedIntValue(v15, v16, v17);

  objc_msgSend_sceneName(self, v18, v19);
  v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v23 = objc_msgSend_UTF8String(v20, v21, v22);
  v25 = objc_msgSend_lengthOfBytesUsingEncoding_(v20, v24, 4);
  sub_233CAF22C(v175, v23, v25);

  *(_OWORD *)&v185[1] = *(_OWORD *)v175;
  objc_msgSend_extensionFieldSets(self, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend_count(v28, v29, v30);

  if (v31)
  {
    v174 = (_QWORD *)operator new();
    objc_msgSend_extensionFieldSets(self, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend_count(v34, v35, v36);
    sub_233CAFA54(v174, v37);

    if (v174[1])
    {
      v175[0] = (unint64_t)v174;
      sub_233CAF24C(&v181, v175, (uint64_t *)v175);
      for (i = 0; ; ++i)
      {
        objc_msgSend_extensionFieldSets(self, v38, v39);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend_count(v41, v42, v43);

        if (i >= v44)
        {
          v167 = v174[1];
          objc_msgSend_extensionFieldSets(self, v45, v46);
          v168 = (void *)objc_claimAutoreleasedReturnValue();
          v171 = objc_msgSend_count(v168, v169, v170);
          sub_233CAF22C(v175, v167, v171);
          *(_OWORD *)&v185[5] = *(_OWORD *)v175;

          goto LABEL_32;
        }
        objc_msgSend_extensionFieldSets(self, v45, v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v47, v48, i);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {
          v164 = retstr;
          retstr->mError = 47;
          retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/"
                          "zap-generated/MTRCommandPayloadsObjc.mm";
          v165 = 13057;
          goto LABEL_40;
        }
        objc_msgSend_extensionFieldSets(self, v51, v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v53, v54, i);
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_clusterID(v55, v56, v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)(v174[1] + 24 * i) = objc_msgSend_unsignedIntValue(v58, v59, v60);

        objc_msgSend_attributeValueList(v55, v61, v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = objc_msgSend_count(v63, v64, v65);

        if (v66)
          break;
        v157 = v174[1] + 24 * i;
        *(_QWORD *)(v157 + 8) = 0;
        *(_QWORD *)(v157 + 16) = 0;
LABEL_30:

      }
      v67 = (_QWORD *)operator new();
      objc_msgSend_attributeValueList(v55, v68, v69);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = objc_msgSend_count(v70, v71, v72);
      sub_233CAFB78(v67, v73);

      if (v67[1])
      {
        v175[0] = (unint64_t)v67;
        sub_233CAF24C(&v181, v175, (uint64_t *)v175);
        v76 = 0;
        for (j = 56; ; j += 64)
        {
          objc_msgSend_attributeValueList(v55, v74, v75);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v81 = objc_msgSend_count(v78, v79, v80);

          if (v76 >= v81)
          {
            v158 = v67[1];
            objc_msgSend_attributeValueList(v55, v82, v83);
            v159 = (void *)objc_claimAutoreleasedReturnValue();
            v162 = objc_msgSend_count(v159, v160, v161);
            sub_233CAF22C(v175, v158, v162);
            *(_OWORD *)(v174[1] + 24 * i + 8) = *(_OWORD *)v175;

            goto LABEL_30;
          }
          objc_msgSend_attributeValueList(v55, v82, v83);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndexedSubscript_(v84, v85, v76);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v87 = objc_opt_isKindOfClass();

          if ((v87 & 1) == 0)
            break;
          objc_msgSend_attributeValueList(v55, v88, v89);
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndexedSubscript_(v90, v91, v76);
          v92 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_attributeID(v92, v93, v94);
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)(v67[1] + j - 56) = objc_msgSend_unsignedIntValue(v95, v96, v97);

          objc_msgSend_valueUnsigned8(v92, v98, v99);
          v100 = (void *)objc_claimAutoreleasedReturnValue();

          if (v100)
          {
            v103 = v67[1] + j;
            *(_WORD *)(v103 - 52) = 1;
            objc_msgSend_valueUnsigned8(v92, v101, v102);
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            *(_BYTE *)(v103 - 51) = objc_msgSend_unsignedCharValue(v104, v105, v106);

          }
          objc_msgSend_valueSigned8(v92, v101, v102);
          v107 = (void *)objc_claimAutoreleasedReturnValue();

          if (v107)
          {
            v110 = v67[1] + j;
            *(_WORD *)(v110 - 50) = 1;
            objc_msgSend_valueSigned8(v92, v108, v109);
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            *(_BYTE *)(v110 - 49) = objc_msgSend_charValue(v111, v112, v113);

          }
          objc_msgSend_valueUnsigned16(v92, v108, v109);
          v114 = (void *)objc_claimAutoreleasedReturnValue();

          if (v114)
          {
            v117 = v67[1] + j;
            *(_BYTE *)(v117 - 48) = 1;
            *(_WORD *)(v117 - 46) = 0;
            objc_msgSend_valueUnsigned16(v92, v115, v116);
            v118 = (void *)objc_claimAutoreleasedReturnValue();
            *(_WORD *)(v117 - 46) = objc_msgSend_unsignedShortValue(v118, v119, v120);

          }
          objc_msgSend_valueSigned16(v92, v115, v116);
          v121 = (void *)objc_claimAutoreleasedReturnValue();

          if (v121)
          {
            v124 = v67[1] + j;
            *(_BYTE *)(v124 - 44) = 1;
            *(_WORD *)(v124 - 42) = 0;
            objc_msgSend_valueSigned16(v92, v122, v123);
            v125 = (void *)objc_claimAutoreleasedReturnValue();
            *(_WORD *)(v124 - 42) = objc_msgSend_shortValue(v125, v126, v127);

          }
          objc_msgSend_valueUnsigned32(v92, v122, v123);
          v128 = (void *)objc_claimAutoreleasedReturnValue();

          if (v128)
          {
            v131 = v67[1] + j;
            *(_BYTE *)(v131 - 40) = 1;
            *(_DWORD *)(v131 - 36) = 0;
            objc_msgSend_valueUnsigned32(v92, v129, v130);
            v132 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)(v131 - 36) = objc_msgSend_unsignedIntValue(v132, v133, v134);

          }
          objc_msgSend_valueSigned32(v92, v129, v130);
          v135 = (void *)objc_claimAutoreleasedReturnValue();

          if (v135)
          {
            v138 = v67[1] + j;
            *(_BYTE *)(v138 - 32) = 1;
            *(_DWORD *)(v138 - 28) = 0;
            objc_msgSend_valueSigned32(v92, v136, v137);
            v139 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)(v138 - 28) = objc_msgSend_intValue(v139, v140, v141);

          }
          objc_msgSend_valueUnsigned64(v92, v136, v137);
          v142 = (void *)objc_claimAutoreleasedReturnValue();

          if (v142)
          {
            v145 = v67[1] + j;
            *(_BYTE *)(v145 - 24) = 1;
            *(_QWORD *)(v145 - 16) = 0;
            objc_msgSend_valueUnsigned64(v92, v143, v144);
            v146 = (void *)objc_claimAutoreleasedReturnValue();
            *(_QWORD *)(v145 - 16) = objc_msgSend_unsignedLongLongValue(v146, v147, v148);

          }
          objc_msgSend_valueSigned64(v92, v143, v144);
          v149 = (void *)objc_claimAutoreleasedReturnValue();

          if (v149)
          {
            v152 = v67[1];
            v153 = (_QWORD *)(v152 + j);
            *((_BYTE *)v153 - 8) = 1;
            *v153 = 0;
            objc_msgSend_valueSigned64(v92, v150, v151);
            v154 = (void *)objc_claimAutoreleasedReturnValue();
            *(_QWORD *)(v152 + j) = objc_msgSend_longLongValue(v154, v155, v156);

          }
          ++v76;
        }
        v163 = 13073;
      }
      else
      {
        v163 = 13067;
      }
      retstr->mError = 47;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-"
                      "generated/MTRCommandPayloadsObjc.mm";
      retstr->mLine = v163;

    }
    else
    {
      v164 = retstr;
      retstr->mError = 47;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-"
                      "generated/MTRCommandPayloadsObjc.mm";
      v165 = 13051;
LABEL_40:
      v164->mLine = v165;
    }
  }
  else
  {
    *(_QWORD *)&v185[5] = 0;
    *(_QWORD *)&v185[7] = 0;
LABEL_32:
    sub_234118674(0x62FuLL, 0, &v180);
    if (v180)
    {
      sub_234106C48((uint64_t)v175);
      v177 = 0;
      v178 = 0;
      v176 = &unk_250504030;
      v179 = 0;
      sub_233CAF098((uint64_t)&v176, &v180, 0);
      sub_234106CA8((uint64_t)v175, (uint64_t)&v176, 0xFFFFFFFF, (uint64_t)v186);
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      sub_233D17114(&v183, (char *)v175, 0x100uLL, (uint64_t)retstr);
      if (!retstr->mError)
      {
        *(_QWORD *)&retstr->mError = 0;
        retstr->mFile = 0;
        *(_QWORD *)&retstr->mLine = 0;
        sub_233C115F0((uint64_t)v175, &v180, retstr);
        if (!retstr->mError)
        {
          sub_233C11670((uint64_t)a4, &v180);
          sub_234106010((uint64_t)a4, 21, 256, retstr);
        }
      }
      v176 = &unk_250504030;
      sub_233CAF128(&v178);
      sub_233CAF128(&v177);
    }
    else
    {
      retstr->mError = 11;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-"
                      "generated/MTRCommandPayloadsObjc.mm";
      retstr->mLine = 13125;
    }
    sub_233CAF128(&v180);
  }
  return (ChipError *)sub_233CAF15C((uint64_t)&v181);
}

- (id)_encodeAsDataValue:(id *)a3
{
  double v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  int v11;
  __int128 v12;
  uint64_t v13;
  _BYTE v14[72];
  uint64_t v15;

  v5 = sub_234104468((uint64_t)v14);
  v15 = 0;
  v12 = 0uLL;
  v13 = 0;
  objc_msgSend__encodeToTLVReader_(self, v6, (uint64_t)v14, v5);
  sub_233CE3234((uint64_t)v14, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (a3 && !v7)
  {
    LODWORD(v10) = 3;
    *((_QWORD *)&v10 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHI"
                            "P/zap-generated/MTRCommandPayloadsObjc.mm";
    v11 = 13154;
    sub_2340017F0((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_233CAF128(&v15);
  return v8;
}

@end
