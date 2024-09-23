@implementation MTRDeviceEnergyManagementClusterRequestConstraintBasedForecastParams

- (MTRDeviceEnergyManagementClusterRequestConstraintBasedForecastParams)init
{
  const char *v2;
  uint64_t v3;
  MTRDeviceEnergyManagementClusterRequestConstraintBasedForecastParams *v4;
  uint64_t v5;
  NSArray *constraints;
  NSNumber *cause;
  NSNumber *timedInvokeTimeoutMs;
  NSNumber *serverSideProcessingTimeout;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MTRDeviceEnergyManagementClusterRequestConstraintBasedForecastParams;
  v4 = -[MTRDeviceEnergyManagementClusterRequestConstraintBasedForecastParams init](&v11, sel_init);
  if (v4)
  {
    objc_msgSend_array(MEMORY[0x24BDBCE30], v2, v3);
    v5 = objc_claimAutoreleasedReturnValue();
    constraints = v4->_constraints;
    v4->_constraints = (NSArray *)v5;

    cause = v4->_cause;
    v4->_cause = (NSNumber *)&unk_250591A40;

    timedInvokeTimeoutMs = v4->_timedInvokeTimeoutMs;
    v4->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v4->_serverSideProcessingTimeout;
    v4->_serverSideProcessingTimeout = 0;

  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRDeviceEnergyManagementClusterRequestConstraintBasedForecastParams *v4;
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

  v4 = objc_alloc_init(MTRDeviceEnergyManagementClusterRequestConstraintBasedForecastParams);
  objc_msgSend_constraints(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setConstraints_(v4, v8, (uint64_t)v7);

  objc_msgSend_cause(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCause_(v4, v12, (uint64_t)v11);

  objc_msgSend_timedInvokeTimeoutMs(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v16, (uint64_t)v15);

  objc_msgSend_serverSideProcessingTimeout(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setServerSideProcessingTimeout_(v4, v20, (uint64_t)v19);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: constraints:%@; cause:%@; >"),
    v5,
    self->_constraints,
    self->_cause);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)cause
{
  return self->_cause;
}

- (void)setCause:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)serverSideProcessingTimeout
{
  return self->_serverSideProcessingTimeout;
}

- (void)setServerSideProcessingTimeout:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSideProcessingTimeout, 0);
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_cause, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  _QWORD *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  unint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t i;
  void *v23;
  const char *v24;
  uint64_t v25;
  unint64_t v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  void *v31;
  char isKindOfClass;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  unsigned int v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  unint64_t v82[8];
  void *v83;
  uint64_t v84;
  uint64_t v85;
  char v86;
  uint64_t v87;
  uint64_t *v88;
  _QWORD v89[2];
  __int128 v90;
  char v91;
  _BYTE v92[32];

  v90 = 0uLL;
  v91 = 0;
  v89[0] = 0;
  v89[1] = 0;
  v88 = v89;
  objc_msgSend_constraints(self, a3, (uint64_t)a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_count(v6, v7, v8);

  if (v9)
  {
    v12 = (_QWORD *)operator new();
    objc_msgSend_constraints(self, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend_count(v15, v16, v17);
    sub_233CB04B0(v12, v18);

    if (v12[1])
    {
      v82[0] = (unint64_t)v12;
      sub_233CAF24C(&v88, v82, (uint64_t *)v82);
      v21 = 0;
      for (i = 0; ; ++i)
      {
        objc_msgSend_constraints(self, v19, v20);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend_count(v23, v24, v25);

        if (i >= v26)
        {
          v72 = v12[1];
          objc_msgSend_constraints(self, v27, v28);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v76 = objc_msgSend_count(v73, v74, v75);
          sub_233CAF22C(v82, v72, v76);
          v90 = *(_OWORD *)v82;

          goto LABEL_16;
        }
        objc_msgSend_constraints(self, v27, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v29, v30, i);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
          break;
        objc_msgSend_constraints(self, v33, v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v35, v36, i);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_startTime(v37, v38, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)(v12[1] + v21) = objc_msgSend_unsignedIntValue(v40, v41, v42);

        objc_msgSend_duration(v37, v43, v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)(v12[1] + v21 + 4) = objc_msgSend_unsignedIntValue(v45, v46, v47);

        objc_msgSend_nominalPower(v37, v48, v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        if (v50)
        {
          v53 = v12[1] + v21;
          *(_BYTE *)(v53 + 8) = 1;
          *(_QWORD *)(v53 + 16) = 0;
          objc_msgSend_nominalPower(v37, v51, v52);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)(v53 + 16) = objc_msgSend_longLongValue(v54, v55, v56);

        }
        objc_msgSend_maximumEnergy(v37, v51, v52);
        v57 = (void *)objc_claimAutoreleasedReturnValue();

        if (v57)
        {
          v60 = v12[1] + v21;
          *(_BYTE *)(v60 + 24) = 1;
          *(_QWORD *)(v60 + 32) = 0;
          objc_msgSend_maximumEnergy(v37, v58, v59);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)(v60 + 32) = objc_msgSend_longLongValue(v61, v62, v63);

        }
        objc_msgSend_loadControl(v37, v58, v59);
        v64 = (void *)objc_claimAutoreleasedReturnValue();

        if (v64)
        {
          v67 = v12[1] + v21;
          *(_WORD *)(v67 + 40) = 1;
          objc_msgSend_loadControl(v37, v65, v66);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          *(_BYTE *)(v67 + 41) = objc_msgSend_charValue(v68, v69, v70);

        }
        v21 += 48;
      }
      retstr->mError = 47;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-"
                      "generated/MTRCommandPayloadsObjc.mm";
      v71 = 16554;
    }
    else
    {
      retstr->mError = 47;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-"
                      "generated/MTRCommandPayloadsObjc.mm";
      v71 = 16548;
    }
    retstr->mLine = v71;
  }
  else
  {
    v90 = 0uLL;
LABEL_16:
    objc_msgSend_cause(self, v10, v11);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = objc_msgSend_unsignedCharValue(v77, v78, v79);

    sub_234118674(0x62FuLL, 0, &v87);
    if (v87)
    {
      sub_234106C48((uint64_t)v82);
      v84 = 0;
      v85 = 0;
      v83 = &unk_250504030;
      v86 = 0;
      sub_233CAF098((uint64_t)&v83, &v87, 0);
      sub_234106CA8((uint64_t)v82, (uint64_t)&v83, 0xFFFFFFFF, (uint64_t)v92);
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      sub_233D20CFC((uint64_t)&v90, (char *)v82, 0x100uLL, (uint64_t)retstr);
      if (!retstr->mError)
      {
        *(_QWORD *)&retstr->mError = 0;
        retstr->mFile = 0;
        *(_QWORD *)&retstr->mLine = 0;
        sub_233C115F0((uint64_t)v82, &v87, retstr);
        if (!retstr->mError)
        {
          sub_233C11670((uint64_t)a4, &v87);
          sub_234106010((uint64_t)a4, 21, 256, retstr);
        }
      }
      v83 = &unk_250504030;
      sub_233CAF128(&v85);
      sub_233CAF128(&v84);
    }
    else
    {
      retstr->mError = 11;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-"
                      "generated/MTRCommandPayloadsObjc.mm";
      retstr->mLine = 16584;
    }
    sub_233CAF128(&v87);
  }
  return (ChipError *)sub_233CAF15C((uint64_t)&v88);
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
    v11 = 16613;
    sub_2340017F0((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_233CAF128(&v15);
  return v8;
}

@end
