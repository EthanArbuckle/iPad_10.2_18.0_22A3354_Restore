@implementation MTRColorControlClusterStepColorTemperatureParams

- (MTRColorControlClusterStepColorTemperatureParams)init
{
  MTRColorControlClusterStepColorTemperatureParams *v2;
  MTRColorControlClusterStepColorTemperatureParams *v3;
  NSNumber *stepMode;
  NSNumber *stepSize;
  NSNumber *transitionTime;
  NSNumber *colorTemperatureMinimumMireds;
  NSNumber *colorTemperatureMaximumMireds;
  NSNumber *optionsMask;
  NSNumber *optionsOverride;
  NSNumber *timedInvokeTimeoutMs;
  NSNumber *serverSideProcessingTimeout;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MTRColorControlClusterStepColorTemperatureParams;
  v2 = -[MTRColorControlClusterStepColorTemperatureParams init](&v14, sel_init);
  v3 = v2;
  if (v2)
  {
    stepMode = v2->_stepMode;
    v2->_stepMode = (NSNumber *)&unk_250591A40;

    stepSize = v3->_stepSize;
    v3->_stepSize = (NSNumber *)&unk_250591A40;

    transitionTime = v3->_transitionTime;
    v3->_transitionTime = (NSNumber *)&unk_250591A40;

    colorTemperatureMinimumMireds = v3->_colorTemperatureMinimumMireds;
    v3->_colorTemperatureMinimumMireds = (NSNumber *)&unk_250591A40;

    colorTemperatureMaximumMireds = v3->_colorTemperatureMaximumMireds;
    v3->_colorTemperatureMaximumMireds = (NSNumber *)&unk_250591A40;

    optionsMask = v3->_optionsMask;
    v3->_optionsMask = (NSNumber *)&unk_250591A40;

    optionsOverride = v3->_optionsOverride;
    v3->_optionsOverride = (NSNumber *)&unk_250591A40;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRColorControlClusterStepColorTemperatureParams *v4;
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
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;

  v4 = objc_alloc_init(MTRColorControlClusterStepColorTemperatureParams);
  objc_msgSend_stepMode(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStepMode_(v4, v8, (uint64_t)v7);

  objc_msgSend_stepSize(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStepSize_(v4, v12, (uint64_t)v11);

  objc_msgSend_transitionTime(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTransitionTime_(v4, v16, (uint64_t)v15);

  objc_msgSend_colorTemperatureMinimumMireds(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setColorTemperatureMinimumMireds_(v4, v20, (uint64_t)v19);

  objc_msgSend_colorTemperatureMaximumMireds(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setColorTemperatureMaximumMireds_(v4, v24, (uint64_t)v23);

  objc_msgSend_optionsMask(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOptionsMask_(v4, v28, (uint64_t)v27);

  objc_msgSend_optionsOverride(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOptionsOverride_(v4, v32, (uint64_t)v31);

  objc_msgSend_timedInvokeTimeoutMs(self, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v36, (uint64_t)v35);

  objc_msgSend_serverSideProcessingTimeout(self, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setServerSideProcessingTimeout_(v4, v40, (uint64_t)v39);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: stepMode:%@; stepSize:%@; transitionTime:%@; colorTemperatureMinimumMireds:%@; colorTemperatureMaximumMireds:%@; optionsMask:%@; optionsOverride:%@; >"),
    v5,
    self->_stepMode,
    self->_stepSize,
    self->_transitionTime,
    self->_colorTemperatureMinimumMireds,
    self->_colorTemperatureMaximumMireds,
    self->_optionsMask,
    self->_optionsOverride);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)stepMode
{
  return self->_stepMode;
}

- (void)setStepMode:(NSNumber *)stepMode
{
  objc_setProperty_nonatomic_copy(self, a2, stepMode, 8);
}

- (NSNumber)stepSize
{
  return self->_stepSize;
}

- (void)setStepSize:(NSNumber *)stepSize
{
  objc_setProperty_nonatomic_copy(self, a2, stepSize, 16);
}

- (NSNumber)transitionTime
{
  return self->_transitionTime;
}

- (void)setTransitionTime:(NSNumber *)transitionTime
{
  objc_setProperty_nonatomic_copy(self, a2, transitionTime, 24);
}

- (NSNumber)colorTemperatureMinimumMireds
{
  return self->_colorTemperatureMinimumMireds;
}

- (void)setColorTemperatureMinimumMireds:(NSNumber *)colorTemperatureMinimumMireds
{
  objc_setProperty_nonatomic_copy(self, a2, colorTemperatureMinimumMireds, 32);
}

- (NSNumber)colorTemperatureMaximumMireds
{
  return self->_colorTemperatureMaximumMireds;
}

- (void)setColorTemperatureMaximumMireds:(NSNumber *)colorTemperatureMaximumMireds
{
  objc_setProperty_nonatomic_copy(self, a2, colorTemperatureMaximumMireds, 40);
}

- (NSNumber)optionsMask
{
  return self->_optionsMask;
}

- (void)setOptionsMask:(NSNumber *)optionsMask
{
  objc_setProperty_nonatomic_copy(self, a2, optionsMask, 48);
}

- (NSNumber)optionsOverride
{
  return self->_optionsOverride;
}

- (void)setOptionsOverride:(NSNumber *)optionsOverride
{
  objc_setProperty_nonatomic_copy(self, a2, optionsOverride, 56);
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs
{
  objc_setProperty_nonatomic_copy(self, a2, timedInvokeTimeoutMs, 64);
}

- (NSNumber)serverSideProcessingTimeout
{
  return self->_serverSideProcessingTimeout;
}

- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout
{
  objc_setProperty_nonatomic_copy(self, a2, serverSideProcessingTimeout, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSideProcessingTimeout, 0);
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_optionsOverride, 0);
  objc_storeStrong((id *)&self->_optionsMask, 0);
  objc_storeStrong((id *)&self->_colorTemperatureMaximumMireds, 0);
  objc_storeStrong((id *)&self->_colorTemperatureMinimumMireds, 0);
  objc_storeStrong((id *)&self->_transitionTime, 0);
  objc_storeStrong((id *)&self->_stepSize, 0);
  objc_storeStrong((id *)&self->_stepMode, 0);
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
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  char v41[64];
  void *v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  _QWORD *v47;
  _QWORD v48[2];
  _BYTE v49[2];
  uint64_t v50;
  __int16 v51;
  _BYTE v52[24];

  v49[0] = 0;
  v50 = 0;
  v51 = 0;
  v48[0] = 0;
  v48[1] = 0;
  v47 = v48;
  objc_msgSend_stepMode(self, a3, (uint64_t)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = objc_msgSend_unsignedCharValue(v7, v8, v9);

  objc_msgSend_stepSize(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(v50) = objc_msgSend_unsignedShortValue(v12, v13, v14);

  objc_msgSend_transitionTime(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  WORD1(v50) = objc_msgSend_unsignedShortValue(v17, v18, v19);

  objc_msgSend_colorTemperatureMinimumMireds(self, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  WORD2(v50) = objc_msgSend_unsignedShortValue(v22, v23, v24);

  objc_msgSend_colorTemperatureMaximumMireds(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  HIWORD(v50) = objc_msgSend_unsignedShortValue(v27, v28, v29);

  objc_msgSend_optionsMask(self, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v51) = objc_msgSend_unsignedCharValue(v32, v33, v34);

  objc_msgSend_optionsOverride(self, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  HIBYTE(v51) = objc_msgSend_unsignedCharValue(v37, v38, v39);

  sub_234118674(0x62FuLL, 0, &v46);
  if (v46)
  {
    sub_234106C48((uint64_t)v41);
    v43 = 0;
    v44 = 0;
    v42 = &unk_250504030;
    v45 = 0;
    sub_233CAF098((uint64_t)&v42, &v46, 0);
    sub_234106CA8((uint64_t)v41, (uint64_t)&v42, 0xFFFFFFFF, (uint64_t)v52);
    *(_QWORD *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(_QWORD *)&retstr->mLine = 0;
    sub_233D3060C((uint64_t)v49, v41, 0x100uLL, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      sub_233C115F0((uint64_t)v41, &v46, retstr);
      if (!retstr->mError)
      {
        sub_233C11670((uint64_t)a4, &v46);
        sub_234106010((uint64_t)a4, 21, 256, retstr);
      }
    }
    v42 = &unk_250504030;
    sub_233CAF128(&v44);
    sub_233CAF128(&v43);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 24747;
  }
  sub_233CAF128(&v46);
  return (ChipError *)sub_233CAF15C((uint64_t)&v47);
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
    v11 = 24776;
    sub_2340017F0((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_233CAF128(&v15);
  return v8;
}

@end
