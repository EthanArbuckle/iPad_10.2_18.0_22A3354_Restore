@implementation MTREnergyEVSEClusterSetTargetsParams

- (MTREnergyEVSEClusterSetTargetsParams)init
{
  const char *v2;
  uint64_t v3;
  MTREnergyEVSEClusterSetTargetsParams *v4;
  uint64_t v5;
  NSArray *chargingTargetSchedules;
  NSNumber *timedInvokeTimeoutMs;
  NSNumber *serverSideProcessingTimeout;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTREnergyEVSEClusterSetTargetsParams;
  v4 = -[MTREnergyEVSEClusterSetTargetsParams init](&v10, sel_init);
  if (v4)
  {
    objc_msgSend_array(MEMORY[0x24BDBCE30], v2, v3);
    v5 = objc_claimAutoreleasedReturnValue();
    chargingTargetSchedules = v4->_chargingTargetSchedules;
    v4->_chargingTargetSchedules = (NSArray *)v5;

    timedInvokeTimeoutMs = v4->_timedInvokeTimeoutMs;
    v4->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v4->_serverSideProcessingTimeout;
    v4->_serverSideProcessingTimeout = 0;

  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTREnergyEVSEClusterSetTargetsParams *v4;
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

  v4 = objc_alloc_init(MTREnergyEVSEClusterSetTargetsParams);
  objc_msgSend_chargingTargetSchedules(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setChargingTargetSchedules_(v4, v8, (uint64_t)v7);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: chargingTargetSchedules:%@; >"),
    v5,
    self->_chargingTargetSchedules);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSArray)chargingTargetSchedules
{
  return self->_chargingTargetSchedules;
}

- (void)setChargingTargetSchedules:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)serverSideProcessingTimeout
{
  return self->_serverSideProcessingTimeout;
}

- (void)setServerSideProcessingTimeout:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSideProcessingTimeout, 0);
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_chargingTargetSchedules, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  unint64_t v13;
  const char *v14;
  uint64_t v15;
  unint64_t i;
  void *v17;
  const char *v18;
  uint64_t v19;
  unint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  void *v25;
  char isKindOfClass;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  unint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t j;
  void *v54;
  const char *v55;
  uint64_t v56;
  unint64_t v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  void *v62;
  char v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  unsigned int v96;
  ChipError *v97;
  int v98;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  _QWORD *v107;
  unint64_t v109[8];
  void *v110;
  uint64_t v111;
  uint64_t v112;
  char v113;
  uint64_t v114;
  uint64_t *v115;
  _QWORD v116[2];
  __int128 v117;
  _BYTE v118[32];

  v117 = 0uLL;
  v116[0] = 0;
  v116[1] = 0;
  v115 = v116;
  objc_msgSend_chargingTargetSchedules(self, a3, (uint64_t)a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_count(v4, v5, v6);

  if (v7)
  {
    v107 = (_QWORD *)operator new();
    objc_msgSend_chargingTargetSchedules(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend_count(v10, v11, v12);
    sub_233CB08B8(v107, v13);

    if (v107[1])
    {
      v109[0] = (unint64_t)v107;
      sub_233CAF24C(&v115, v109, (uint64_t *)v109);
      for (i = 0; ; ++i)
      {
        objc_msgSend_chargingTargetSchedules(self, v14, v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend_count(v17, v18, v19);

        if (i >= v20)
        {
          v100 = v107[1];
          objc_msgSend_chargingTargetSchedules(self, v21, v22);
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          v104 = objc_msgSend_count(v101, v102, v103);
          sub_233CAF22C(v109, v100, v104);
          v117 = *(_OWORD *)v109;

          goto LABEL_20;
        }
        objc_msgSend_chargingTargetSchedules(self, v21, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v23, v24, i);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {
          v97 = retstr;
          retstr->mError = 47;
          retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/"
                          "zap-generated/MTRCommandPayloadsObjc.mm";
          v98 = 17195;
          goto LABEL_28;
        }
        objc_msgSend_chargingTargetSchedules(self, v27, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v29, v30, i);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_dayOfWeekForSequence(v31, v32, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_BYTE *)(v107[1] + 24 * i) = objc_msgSend_unsignedCharValue(v34, v35, v36);

        objc_msgSend_chargingTargets(v31, v37, v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend_count(v39, v40, v41);

        if (v42)
          break;
        v90 = v107[1] + 24 * i;
        *(_QWORD *)(v90 + 8) = 0;
        *(_QWORD *)(v90 + 16) = 0;
LABEL_18:

      }
      v43 = (_QWORD *)operator new();
      objc_msgSend_chargingTargets(v31, v44, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend_count(v46, v47, v48);
      sub_233CB09DC(v43, v49);

      if (v43[1])
      {
        v109[0] = (unint64_t)v43;
        sub_233CAF24C(&v115, v109, (uint64_t *)v109);
        v52 = 0;
        for (j = 0; ; ++j)
        {
          objc_msgSend_chargingTargets(v31, v50, v51);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = objc_msgSend_count(v54, v55, v56);

          if (j >= v57)
          {
            v91 = v43[1];
            objc_msgSend_chargingTargets(v31, v58, v59);
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            v95 = objc_msgSend_count(v92, v93, v94);
            sub_233CAF22C(v109, v91, v95);
            *(_OWORD *)(v107[1] + 24 * i + 8) = *(_OWORD *)v109;

            goto LABEL_18;
          }
          objc_msgSend_chargingTargets(v31, v58, v59);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndexedSubscript_(v60, v61, j);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v63 = objc_opt_isKindOfClass();

          if ((v63 & 1) == 0)
            break;
          objc_msgSend_chargingTargets(v31, v64, v65);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndexedSubscript_(v66, v67, j);
          v68 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_targetTimeMinutesPastMidnight(v68, v69, v70);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          *(_WORD *)(v43[1] + v52) = objc_msgSend_unsignedShortValue(v71, v72, v73);

          objc_msgSend_targetSoC(v68, v74, v75);
          v76 = (void *)objc_claimAutoreleasedReturnValue();

          if (v76)
          {
            v79 = v43[1] + v52;
            *(_WORD *)(v79 + 2) = 1;
            objc_msgSend_targetSoC(v68, v77, v78);
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            *(_BYTE *)(v79 + 3) = objc_msgSend_unsignedCharValue(v80, v81, v82);

          }
          objc_msgSend_addedEnergy(v68, v77, v78);
          v83 = (void *)objc_claimAutoreleasedReturnValue();

          if (v83)
          {
            v86 = v43[1] + v52;
            *(_BYTE *)(v86 + 8) = 1;
            *(_QWORD *)(v86 + 16) = 0;
            objc_msgSend_addedEnergy(v68, v84, v85);
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            *(_QWORD *)(v86 + 16) = objc_msgSend_longLongValue(v87, v88, v89);

          }
          v52 += 24;
        }
        v96 = 17211;
      }
      else
      {
        v96 = 17205;
      }
      retstr->mError = 47;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-"
                      "generated/MTRCommandPayloadsObjc.mm";
      retstr->mLine = v96;

    }
    else
    {
      v97 = retstr;
      retstr->mError = 47;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-"
                      "generated/MTRCommandPayloadsObjc.mm";
      v98 = 17189;
LABEL_28:
      v97->mLine = v98;
    }
  }
  else
  {
    v117 = 0uLL;
LABEL_20:
    sub_234118674(0x62FuLL, 0, &v114);
    if (v114)
    {
      sub_234106C48((uint64_t)v109);
      v111 = 0;
      v112 = 0;
      v110 = &unk_250504030;
      v113 = 0;
      sub_233CAF098((uint64_t)&v110, &v114, 0);
      sub_234106CA8((uint64_t)v109, (uint64_t)&v110, 0xFFFFFFFF, (uint64_t)v118);
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      sub_233D21B90((uint64_t)&v117, (char *)v109, 0x100uLL, (uint64_t)retstr);
      if (!retstr->mError)
      {
        *(_QWORD *)&retstr->mError = 0;
        retstr->mFile = 0;
        *(_QWORD *)&retstr->mLine = 0;
        sub_233C115F0((uint64_t)v109, &v114, retstr);
        if (!retstr->mError)
        {
          sub_233C11670((uint64_t)a4, &v114);
          sub_234106010((uint64_t)a4, 21, 256, retstr);
        }
      }
      v110 = &unk_250504030;
      sub_233CAF128(&v112);
      sub_233CAF128(&v111);
    }
    else
    {
      retstr->mError = 11;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-"
                      "generated/MTRCommandPayloadsObjc.mm";
      retstr->mLine = 17239;
    }
    sub_233CAF128(&v114);
  }
  return (ChipError *)sub_233CAF15C((uint64_t)&v115);
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
    v11 = 17268;
    sub_2340017F0((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_233CAF128(&v15);
  return v8;
}

@end
