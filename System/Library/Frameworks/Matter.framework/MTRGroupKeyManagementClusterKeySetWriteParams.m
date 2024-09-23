@implementation MTRGroupKeyManagementClusterKeySetWriteParams

- (MTRGroupKeyManagementClusterKeySetWriteParams)init
{
  MTRGroupKeyManagementClusterKeySetWriteParams *v2;
  uint64_t v3;
  MTRGroupKeyManagementClusterGroupKeySetStruct *groupKeySet;
  NSNumber *timedInvokeTimeoutMs;
  NSNumber *serverSideProcessingTimeout;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTRGroupKeyManagementClusterKeySetWriteParams;
  v2 = -[MTRGroupKeyManagementClusterKeySetWriteParams init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    groupKeySet = v2->_groupKeySet;
    v2->_groupKeySet = (MTRGroupKeyManagementClusterGroupKeySetStruct *)v3;

    timedInvokeTimeoutMs = v2->_timedInvokeTimeoutMs;
    v2->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v2->_serverSideProcessingTimeout;
    v2->_serverSideProcessingTimeout = 0;

  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRGroupKeyManagementClusterKeySetWriteParams *v4;
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

  v4 = objc_alloc_init(MTRGroupKeyManagementClusterKeySetWriteParams);
  objc_msgSend_groupKeySet(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setGroupKeySet_(v4, v8, (uint64_t)v7);

  objc_msgSend_timedInvokeTimeoutMs(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v12, (uint64_t)v11);

  objc_msgSend_serverSideProcessingTimeout(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setServerSideProcessingTimeout_(v4, v16, (uint64_t)v15);

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

- (NSNumber)serverSideProcessingTimeout
{
  return self->_serverSideProcessingTimeout;
}

- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout
{
  objc_setProperty_nonatomic_copy(self, a2, serverSideProcessingTimeout, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSideProcessingTimeout, 0);
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_groupKeySet, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  void *v7;
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
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  id v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  id v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  id v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  char v108[64];
  void *v109;
  uint64_t v110;
  uint64_t v111;
  char v112;
  uint64_t v113;
  _QWORD *v114;
  _QWORD v115[2];
  __int16 v116;
  char v117;
  __int128 v118;
  char v119;
  uint64_t v120;
  char v121;
  __int128 v122;
  char v123;
  uint64_t v124;
  char v125;
  __int128 v126;
  char v127;
  uint64_t v128;
  char v129;
  _BYTE v130[24];

  v116 = 0;
  v117 = 0;
  LOBYTE(v118) = 0;
  v119 = 0;
  LOBYTE(v120) = 0;
  v121 = 0;
  LOBYTE(v122) = 0;
  v123 = 0;
  LOBYTE(v124) = 0;
  v125 = 0;
  LOBYTE(v126) = 0;
  v127 = 0;
  LOBYTE(v128) = 0;
  v129 = 0;
  v115[0] = 0;
  v115[1] = 0;
  v114 = v115;
  objc_msgSend_groupKeySet(self, a3, (uint64_t)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_groupKeySetID(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = objc_msgSend_unsignedShortValue(v10, v11, v12);

  objc_msgSend_groupKeySet(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_groupKeySecurityPolicy(v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = objc_msgSend_unsignedCharValue(v18, v19, v20);

  objc_msgSend_groupKeySet(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_epochKey0(v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    v118 = 0uLL;
    v119 = 1;
    objc_msgSend_groupKeySet(self, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_epochKey0(v29, v30, v31);
    v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v35 = objc_msgSend_bytes(v32, v33, v34);
    v38 = objc_msgSend_length(v32, v36, v37);
    sub_233BF7114(v108, v35, v38);

    v118 = *(_OWORD *)v108;
  }
  objc_msgSend_groupKeySet(self, v27, v28);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_epochStartTime0(v39, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    v120 = 0;
    v121 = 1;
    objc_msgSend_groupKeySet(self, v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_epochStartTime0(v45, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v120 = objc_msgSend_unsignedLongLongValue(v48, v49, v50);

  }
  objc_msgSend_groupKeySet(self, v43, v44);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_epochKey1(v51, v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  if (v54)
  {
    v122 = 0uLL;
    v123 = 1;
    objc_msgSend_groupKeySet(self, v55, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_epochKey1(v57, v58, v59);
    v60 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v63 = objc_msgSend_bytes(v60, v61, v62);
    v66 = objc_msgSend_length(v60, v64, v65);
    sub_233BF7114(v108, v63, v66);

    v122 = *(_OWORD *)v108;
  }
  objc_msgSend_groupKeySet(self, v55, v56);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_epochStartTime1(v67, v68, v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  if (v70)
  {
    v124 = 0;
    v125 = 1;
    objc_msgSend_groupKeySet(self, v71, v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_epochStartTime1(v73, v74, v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = objc_msgSend_unsignedLongLongValue(v76, v77, v78);

  }
  objc_msgSend_groupKeySet(self, v71, v72);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_epochKey2(v79, v80, v81);
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  if (v82)
  {
    v126 = 0uLL;
    v127 = 1;
    objc_msgSend_groupKeySet(self, v83, v84);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_epochKey2(v85, v86, v87);
    v88 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v91 = objc_msgSend_bytes(v88, v89, v90);
    v94 = objc_msgSend_length(v88, v92, v93);
    sub_233BF7114(v108, v91, v94);

    v126 = *(_OWORD *)v108;
  }
  objc_msgSend_groupKeySet(self, v83, v84);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_epochStartTime2(v95, v96, v97);
  v98 = (void *)objc_claimAutoreleasedReturnValue();

  if (v98)
  {
    v128 = 0;
    v129 = 1;
    objc_msgSend_groupKeySet(self, v99, v100);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_epochStartTime2(v101, v102, v103);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v128 = objc_msgSend_unsignedLongLongValue(v104, v105, v106);

  }
  sub_234118674(0x62FuLL, 0, &v113);
  if (v113)
  {
    sub_234106C48((uint64_t)v108);
    v110 = 0;
    v111 = 0;
    v109 = &unk_250504030;
    v112 = 0;
    sub_233CAF098((uint64_t)&v109, &v113, 0);
    sub_234106CA8((uint64_t)v108, (uint64_t)&v109, 0xFFFFFFFF, (uint64_t)v130);
    *(_QWORD *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(_QWORD *)&retstr->mLine = 0;
    sub_233D10DB0((unsigned __int8 *)&v116, v108, 0x100uLL, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      sub_233C115F0((uint64_t)v108, &v113, retstr);
      if (!retstr->mError)
      {
        sub_233C11670((uint64_t)a4, &v113);
        sub_234106010((uint64_t)a4, 21, 256, retstr);
      }
    }
    v109 = &unk_250504030;
    sub_233CAF128(&v111);
    sub_233CAF128(&v110);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 9040;
  }
  sub_233CAF128(&v113);
  return (ChipError *)sub_233CAF15C((uint64_t)&v114);
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
    v11 = 9069;
    sub_2340017F0((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_233CAF128(&v15);
  return v8;
}

@end
