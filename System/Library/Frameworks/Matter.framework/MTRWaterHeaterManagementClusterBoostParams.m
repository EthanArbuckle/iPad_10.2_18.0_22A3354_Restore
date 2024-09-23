@implementation MTRWaterHeaterManagementClusterBoostParams

- (MTRWaterHeaterManagementClusterBoostParams)init
{
  MTRWaterHeaterManagementClusterBoostParams *v2;
  MTRWaterHeaterManagementClusterBoostParams *v3;
  NSNumber *duration;
  NSNumber *oneShot;
  NSNumber *emergencyBoost;
  NSNumber *temporarySetpoint;
  NSNumber *targetPercentage;
  NSNumber *targetReheat;
  NSNumber *timedInvokeTimeoutMs;
  NSNumber *serverSideProcessingTimeout;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MTRWaterHeaterManagementClusterBoostParams;
  v2 = -[MTRWaterHeaterManagementClusterBoostParams init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    duration = v2->_duration;
    v2->_duration = (NSNumber *)&unk_250591A40;

    oneShot = v3->_oneShot;
    v3->_oneShot = 0;

    emergencyBoost = v3->_emergencyBoost;
    v3->_emergencyBoost = 0;

    temporarySetpoint = v3->_temporarySetpoint;
    v3->_temporarySetpoint = 0;

    targetPercentage = v3->_targetPercentage;
    v3->_targetPercentage = 0;

    targetReheat = v3->_targetReheat;
    v3->_targetReheat = 0;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRWaterHeaterManagementClusterBoostParams *v4;
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
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;

  v4 = objc_alloc_init(MTRWaterHeaterManagementClusterBoostParams);
  objc_msgSend_duration(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDuration_(v4, v8, (uint64_t)v7);

  objc_msgSend_oneShot(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOneShot_(v4, v12, (uint64_t)v11);

  objc_msgSend_emergencyBoost(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEmergencyBoost_(v4, v16, (uint64_t)v15);

  objc_msgSend_temporarySetpoint(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTemporarySetpoint_(v4, v20, (uint64_t)v19);

  objc_msgSend_targetPercentage(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTargetPercentage_(v4, v24, (uint64_t)v23);

  objc_msgSend_targetReheat(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTargetReheat_(v4, v28, (uint64_t)v27);

  objc_msgSend_timedInvokeTimeoutMs(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v32, (uint64_t)v31);

  objc_msgSend_serverSideProcessingTimeout(self, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setServerSideProcessingTimeout_(v4, v36, (uint64_t)v35);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: duration:%@; oneShot:%@; emergencyBoost:%@; temporarySetpoint:%@; targetPercentage:%@; targetReheat:%@; >"),
    v5,
    self->_duration,
    self->_oneShot,
    self->_emergencyBoost,
    self->_temporarySetpoint,
    self->_targetPercentage,
    self->_targetReheat);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)duration
{
  return self->_duration;
}

- (void)setDuration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)oneShot
{
  return self->_oneShot;
}

- (void)setOneShot:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)emergencyBoost
{
  return self->_emergencyBoost;
}

- (void)setEmergencyBoost:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)temporarySetpoint
{
  return self->_temporarySetpoint;
}

- (void)setTemporarySetpoint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)targetPercentage
{
  return self->_targetPercentage;
}

- (void)setTargetPercentage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)targetReheat
{
  return self->_targetReheat;
}

- (void)setTargetReheat:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)serverSideProcessingTimeout
{
  return self->_serverSideProcessingTimeout;
}

- (void)setServerSideProcessingTimeout:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSideProcessingTimeout, 0);
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_targetReheat, 0);
  objc_storeStrong((id *)&self->_targetPercentage, 0);
  objc_storeStrong((id *)&self->_temporarySetpoint, 0);
  objc_storeStrong((id *)&self->_emergencyBoost, 0);
  objc_storeStrong((id *)&self->_oneShot, 0);
  objc_storeStrong((id *)&self->_duration, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  char v43[64];
  void *v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  _QWORD *v49;
  _QWORD v50[2];
  int v51;
  __int16 v52;
  __int16 v53;
  char v54;
  __int16 v55;
  __int16 v56;
  __int16 v57;
  _BYTE v58[24];

  v51 = 0;
  LOBYTE(v52) = 0;
  LOBYTE(v53) = 0;
  v54 = 0;
  LOBYTE(v56) = 0;
  LOBYTE(v57) = 0;
  v50[0] = 0;
  v50[1] = 0;
  v49 = v50;
  objc_msgSend_duration(self, a3, (uint64_t)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend_unsignedIntValue(v7, v8, v9);

  objc_msgSend_oneShot(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v52 = 1;
    objc_msgSend_oneShot(self, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    HIBYTE(v52) = objc_msgSend_BOOLValue(v15, v16, v17);

  }
  objc_msgSend_emergencyBoost(self, v13, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v53 = 1;
    objc_msgSend_emergencyBoost(self, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    HIBYTE(v53) = objc_msgSend_BOOLValue(v21, v22, v23);

  }
  objc_msgSend_temporarySetpoint(self, v19, v20);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    v54 = 1;
    v55 = 0;
    objc_msgSend_temporarySetpoint(self, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend_shortValue(v27, v28, v29);

  }
  objc_msgSend_targetPercentage(self, v25, v26);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    v56 = 1;
    objc_msgSend_targetPercentage(self, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    HIBYTE(v56) = objc_msgSend_unsignedCharValue(v33, v34, v35);

  }
  objc_msgSend_targetReheat(self, v31, v32);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    v57 = 1;
    objc_msgSend_targetReheat(self, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    HIBYTE(v57) = objc_msgSend_unsignedCharValue(v39, v40, v41);

  }
  sub_234118674(0x62FuLL, 0, &v48);
  if (v48)
  {
    sub_234106C48((uint64_t)v43);
    v45 = 0;
    v46 = 0;
    v44 = &unk_250504030;
    v47 = 0;
    sub_233CAF098((uint64_t)&v44, &v48, 0);
    sub_234106CA8((uint64_t)v43, (uint64_t)&v44, 0xFFFFFFFF, (uint64_t)v58);
    *(_QWORD *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(_QWORD *)&retstr->mLine = 0;
    sub_233D1B414((uint64_t)&v51, v43, 0x100uLL, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      sub_233C115F0((uint64_t)v43, &v48, retstr);
      if (!retstr->mError)
      {
        sub_233C11670((uint64_t)a4, &v48);
        sub_234106010((uint64_t)a4, 21, 256, retstr);
      }
    }
    v44 = &unk_250504030;
    sub_233CAF128(&v46);
    sub_233CAF128(&v45);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 15101;
  }
  sub_233CAF128(&v48);
  return (ChipError *)sub_233CAF15C((uint64_t)&v49);
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
    v11 = 15130;
    sub_2340017F0((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_233CAF128(&v15);
  return v8;
}

@end
