@implementation MTRColorControlClusterMoveToHueAndSaturationParams

- (MTRColorControlClusterMoveToHueAndSaturationParams)init
{
  MTRColorControlClusterMoveToHueAndSaturationParams *v2;
  MTRColorControlClusterMoveToHueAndSaturationParams *v3;
  NSNumber *hue;
  NSNumber *saturation;
  NSNumber *transitionTime;
  NSNumber *optionsMask;
  NSNumber *optionsOverride;
  NSNumber *timedInvokeTimeoutMs;
  NSNumber *serverSideProcessingTimeout;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MTRColorControlClusterMoveToHueAndSaturationParams;
  v2 = -[MTRColorControlClusterMoveToHueAndSaturationParams init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    hue = v2->_hue;
    v2->_hue = (NSNumber *)&unk_250591A40;

    saturation = v3->_saturation;
    v3->_saturation = (NSNumber *)&unk_250591A40;

    transitionTime = v3->_transitionTime;
    v3->_transitionTime = (NSNumber *)&unk_250591A40;

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
  MTRColorControlClusterMoveToHueAndSaturationParams *v4;
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

  v4 = objc_alloc_init(MTRColorControlClusterMoveToHueAndSaturationParams);
  objc_msgSend_hue(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setHue_(v4, v8, (uint64_t)v7);

  objc_msgSend_saturation(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSaturation_(v4, v12, (uint64_t)v11);

  objc_msgSend_transitionTime(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTransitionTime_(v4, v16, (uint64_t)v15);

  objc_msgSend_optionsMask(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOptionsMask_(v4, v20, (uint64_t)v19);

  objc_msgSend_optionsOverride(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOptionsOverride_(v4, v24, (uint64_t)v23);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: hue:%@; saturation:%@; transitionTime:%@; optionsMask:%@; optionsOverride:%@; >"),
    v5,
    self->_hue,
    self->_saturation,
    self->_transitionTime,
    self->_optionsMask,
    self->_optionsOverride);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)hue
{
  return self->_hue;
}

- (void)setHue:(NSNumber *)hue
{
  objc_setProperty_nonatomic_copy(self, a2, hue, 8);
}

- (NSNumber)saturation
{
  return self->_saturation;
}

- (void)setSaturation:(NSNumber *)saturation
{
  objc_setProperty_nonatomic_copy(self, a2, saturation, 16);
}

- (NSNumber)transitionTime
{
  return self->_transitionTime;
}

- (void)setTransitionTime:(NSNumber *)transitionTime
{
  objc_setProperty_nonatomic_copy(self, a2, transitionTime, 24);
}

- (NSNumber)optionsMask
{
  return self->_optionsMask;
}

- (void)setOptionsMask:(NSNumber *)optionsMask
{
  objc_setProperty_nonatomic_copy(self, a2, optionsMask, 32);
}

- (NSNumber)optionsOverride
{
  return self->_optionsOverride;
}

- (void)setOptionsOverride:(NSNumber *)optionsOverride
{
  objc_setProperty_nonatomic_copy(self, a2, optionsOverride, 40);
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs
{
  objc_setProperty_nonatomic_copy(self, a2, timedInvokeTimeoutMs, 48);
}

- (NSNumber)serverSideProcessingTimeout
{
  return self->_serverSideProcessingTimeout;
}

- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout
{
  objc_setProperty_nonatomic_copy(self, a2, serverSideProcessingTimeout, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSideProcessingTimeout, 0);
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_optionsOverride, 0);
  objc_storeStrong((id *)&self->_optionsMask, 0);
  objc_storeStrong((id *)&self->_transitionTime, 0);
  objc_storeStrong((id *)&self->_saturation, 0);
  objc_storeStrong((id *)&self->_hue, 0);
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
  char v31[64];
  void *v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  _QWORD *v37;
  _QWORD v38[2];
  int v39;
  __int16 v40;
  _BYTE v41[24];

  v40 = 0;
  v39 = 0;
  v38[0] = 0;
  v38[1] = 0;
  v37 = v38;
  objc_msgSend_hue(self, a3, (uint64_t)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v39) = objc_msgSend_unsignedCharValue(v7, v8, v9);

  objc_msgSend_saturation(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE1(v39) = objc_msgSend_unsignedCharValue(v12, v13, v14);

  objc_msgSend_transitionTime(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  HIWORD(v39) = objc_msgSend_unsignedShortValue(v17, v18, v19);

  objc_msgSend_optionsMask(self, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v40) = objc_msgSend_unsignedCharValue(v22, v23, v24);

  objc_msgSend_optionsOverride(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  HIBYTE(v40) = objc_msgSend_unsignedCharValue(v27, v28, v29);

  sub_234118674(0x62FuLL, 0, &v36);
  if (v36)
  {
    sub_234106C48((uint64_t)v31);
    v33 = 0;
    v34 = 0;
    v32 = &unk_250504030;
    v35 = 0;
    sub_233CAF098((uint64_t)&v32, &v36, 0);
    sub_234106CA8((uint64_t)v31, (uint64_t)&v32, 0xFFFFFFFF, (uint64_t)v41);
    *(_QWORD *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(_QWORD *)&retstr->mLine = 0;
    sub_233D2E4AC((unsigned __int8 *)&v39, v31, 0x100uLL, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      sub_233C115F0((uint64_t)v31, &v36, retstr);
      if (!retstr->mError)
      {
        sub_233C11670((uint64_t)a4, &v36);
        sub_234106010((uint64_t)a4, 21, 256, retstr);
      }
    }
    v32 = &unk_250504030;
    sub_233CAF128(&v34);
    sub_233CAF128(&v33);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 23505;
  }
  sub_233CAF128(&v36);
  return (ChipError *)sub_233CAF15C((uint64_t)&v37);
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
    v11 = 23534;
    sub_2340017F0((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_233CAF128(&v15);
  return v8;
}

@end
