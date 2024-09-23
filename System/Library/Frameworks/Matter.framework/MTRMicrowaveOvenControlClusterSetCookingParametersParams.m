@implementation MTRMicrowaveOvenControlClusterSetCookingParametersParams

- (MTRMicrowaveOvenControlClusterSetCookingParametersParams)init
{
  MTRMicrowaveOvenControlClusterSetCookingParametersParams *v2;
  MTRMicrowaveOvenControlClusterSetCookingParametersParams *v3;
  NSNumber *cookMode;
  NSNumber *cookTime;
  NSNumber *powerSetting;
  NSNumber *wattSettingIndex;
  NSNumber *startAfterSetting;
  NSNumber *timedInvokeTimeoutMs;
  NSNumber *serverSideProcessingTimeout;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MTRMicrowaveOvenControlClusterSetCookingParametersParams;
  v2 = -[MTRMicrowaveOvenControlClusterSetCookingParametersParams init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    cookMode = v2->_cookMode;
    v2->_cookMode = 0;

    cookTime = v3->_cookTime;
    v3->_cookTime = 0;

    powerSetting = v3->_powerSetting;
    v3->_powerSetting = 0;

    wattSettingIndex = v3->_wattSettingIndex;
    v3->_wattSettingIndex = 0;

    startAfterSetting = v3->_startAfterSetting;
    v3->_startAfterSetting = 0;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRMicrowaveOvenControlClusterSetCookingParametersParams *v4;
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

  v4 = objc_alloc_init(MTRMicrowaveOvenControlClusterSetCookingParametersParams);
  objc_msgSend_cookMode(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCookMode_(v4, v8, (uint64_t)v7);

  objc_msgSend_cookTime(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCookTime_(v4, v12, (uint64_t)v11);

  objc_msgSend_powerSetting(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPowerSetting_(v4, v16, (uint64_t)v15);

  objc_msgSend_wattSettingIndex(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWattSettingIndex_(v4, v20, (uint64_t)v19);

  objc_msgSend_startAfterSetting(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStartAfterSetting_(v4, v24, (uint64_t)v23);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: cookMode:%@; cookTime:%@; powerSetting:%@; wattSettingIndex:%@; startAfterSetting:%@; >"),
    v5,
    self->_cookMode,
    self->_cookTime,
    self->_powerSetting,
    self->_wattSettingIndex,
    self->_startAfterSetting);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)cookMode
{
  return self->_cookMode;
}

- (void)setCookMode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)cookTime
{
  return self->_cookTime;
}

- (void)setCookTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)powerSetting
{
  return self->_powerSetting;
}

- (void)setPowerSetting:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)wattSettingIndex
{
  return self->_wattSettingIndex;
}

- (void)setWattSettingIndex:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)startAfterSetting
{
  return self->_startAfterSetting;
}

- (void)setStartAfterSetting:(id)a3
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
  objc_storeStrong((id *)&self->_startAfterSetting, 0);
  objc_storeStrong((id *)&self->_wattSettingIndex, 0);
  objc_storeStrong((id *)&self->_powerSetting, 0);
  objc_storeStrong((id *)&self->_cookTime, 0);
  objc_storeStrong((id *)&self->_cookMode, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  char v38[64];
  void *v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  _QWORD *v44;
  _QWORD v45[2];
  __int16 v46;
  char v47;
  int v48;
  __int16 v49;
  __int16 v50;
  __int16 v51;
  _BYTE v52[24];

  LOBYTE(v46) = 0;
  v47 = 0;
  LOBYTE(v49) = 0;
  LOBYTE(v50) = 0;
  LOBYTE(v51) = 0;
  v45[0] = 0;
  v45[1] = 0;
  v44 = v45;
  objc_msgSend_cookMode(self, a3, (uint64_t)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v46 = 1;
    objc_msgSend_cookMode(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    HIBYTE(v46) = objc_msgSend_unsignedCharValue(v10, v11, v12);

  }
  objc_msgSend_cookTime(self, v8, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v47 = 1;
    v48 = 0;
    objc_msgSend_cookTime(self, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend_unsignedIntValue(v16, v17, v18);

  }
  objc_msgSend_powerSetting(self, v14, v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v49 = 1;
    objc_msgSend_powerSetting(self, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    HIBYTE(v49) = objc_msgSend_unsignedCharValue(v22, v23, v24);

  }
  objc_msgSend_wattSettingIndex(self, v20, v21);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v50 = 1;
    objc_msgSend_wattSettingIndex(self, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    HIBYTE(v50) = objc_msgSend_unsignedCharValue(v28, v29, v30);

  }
  objc_msgSend_startAfterSetting(self, v26, v27);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    v51 = 1;
    objc_msgSend_startAfterSetting(self, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    HIBYTE(v51) = objc_msgSend_BOOLValue(v34, v35, v36);

  }
  sub_234118674(0x62FuLL, 0, &v43);
  if (v43)
  {
    sub_234106C48((uint64_t)v38);
    v40 = 0;
    v41 = 0;
    v39 = &unk_250504030;
    v42 = 0;
    sub_233CAF098((uint64_t)&v39, &v43, 0);
    sub_234106CA8((uint64_t)v38, (uint64_t)&v39, 0xFFFFFFFF, (uint64_t)v52);
    *(_QWORD *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(_QWORD *)&retstr->mLine = 0;
    sub_233D158B0(&v46, v38, 0x100uLL, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      sub_233C115F0((uint64_t)v38, &v43, retstr);
      if (!retstr->mError)
      {
        sub_233C11670((uint64_t)a4, &v43);
        sub_234106010((uint64_t)a4, 21, 256, retstr);
      }
    }
    v39 = &unk_250504030;
    sub_233CAF128(&v41);
    sub_233CAF128(&v40);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 12161;
  }
  sub_233CAF128(&v43);
  return (ChipError *)sub_233CAF15C((uint64_t)&v44);
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
    v11 = 12190;
    sub_2340017F0((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_233CAF128(&v15);
  return v8;
}

@end
