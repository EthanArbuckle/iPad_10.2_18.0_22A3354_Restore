@implementation MTRDoorLockClusterSetYearDayScheduleParams

- (MTRDoorLockClusterSetYearDayScheduleParams)init
{
  MTRDoorLockClusterSetYearDayScheduleParams *v2;
  MTRDoorLockClusterSetYearDayScheduleParams *v3;
  NSNumber *yearDayIndex;
  NSNumber *userIndex;
  NSNumber *localStartTime;
  NSNumber *localEndTime;
  NSNumber *timedInvokeTimeoutMs;
  NSNumber *serverSideProcessingTimeout;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MTRDoorLockClusterSetYearDayScheduleParams;
  v2 = -[MTRDoorLockClusterSetYearDayScheduleParams init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    yearDayIndex = v2->_yearDayIndex;
    v2->_yearDayIndex = (NSNumber *)&unk_250591A40;

    userIndex = v3->_userIndex;
    v3->_userIndex = (NSNumber *)&unk_250591A40;

    localStartTime = v3->_localStartTime;
    v3->_localStartTime = (NSNumber *)&unk_250591A40;

    localEndTime = v3->_localEndTime;
    v3->_localEndTime = (NSNumber *)&unk_250591A40;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRDoorLockClusterSetYearDayScheduleParams *v4;
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

  v4 = objc_alloc_init(MTRDoorLockClusterSetYearDayScheduleParams);
  objc_msgSend_yearDayIndex(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setYearDayIndex_(v4, v8, (uint64_t)v7);

  objc_msgSend_userIndex(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUserIndex_(v4, v12, (uint64_t)v11);

  objc_msgSend_localStartTime(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLocalStartTime_(v4, v16, (uint64_t)v15);

  objc_msgSend_localEndTime(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLocalEndTime_(v4, v20, (uint64_t)v19);

  objc_msgSend_timedInvokeTimeoutMs(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v24, (uint64_t)v23);

  objc_msgSend_serverSideProcessingTimeout(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setServerSideProcessingTimeout_(v4, v28, (uint64_t)v27);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: yearDayIndex:%@; userIndex:%@; localStartTime:%@; localEndTime:%@; >"),
    v5,
    self->_yearDayIndex,
    self->_userIndex,
    self->_localStartTime,
    self->_localEndTime);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)yearDayIndex
{
  return self->_yearDayIndex;
}

- (void)setYearDayIndex:(NSNumber *)yearDayIndex
{
  objc_setProperty_nonatomic_copy(self, a2, yearDayIndex, 8);
}

- (NSNumber)userIndex
{
  return self->_userIndex;
}

- (void)setUserIndex:(NSNumber *)userIndex
{
  objc_setProperty_nonatomic_copy(self, a2, userIndex, 16);
}

- (NSNumber)localStartTime
{
  return self->_localStartTime;
}

- (void)setLocalStartTime:(NSNumber *)localStartTime
{
  objc_setProperty_nonatomic_copy(self, a2, localStartTime, 24);
}

- (NSNumber)localEndTime
{
  return self->_localEndTime;
}

- (void)setLocalEndTime:(NSNumber *)localEndTime
{
  objc_setProperty_nonatomic_copy(self, a2, localEndTime, 32);
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs
{
  objc_setProperty_nonatomic_copy(self, a2, timedInvokeTimeoutMs, 40);
}

- (NSNumber)serverSideProcessingTimeout
{
  return self->_serverSideProcessingTimeout;
}

- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout
{
  objc_setProperty_nonatomic_copy(self, a2, serverSideProcessingTimeout, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSideProcessingTimeout, 0);
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_localEndTime, 0);
  objc_storeStrong((id *)&self->_localStartTime, 0);
  objc_storeStrong((id *)&self->_userIndex, 0);
  objc_storeStrong((id *)&self->_yearDayIndex, 0);
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
  char v26[64];
  void *v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD v33[2];
  unsigned __int8 v34[2];
  __int16 v35;
  uint64_t v36;
  _BYTE v37[24];

  v34[0] = 0;
  v35 = 0;
  v36 = 0;
  v33[0] = 0;
  v33[1] = 0;
  v32 = v33;
  objc_msgSend_yearDayIndex(self, a3, (uint64_t)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = objc_msgSend_unsignedCharValue(v7, v8, v9);

  objc_msgSend_userIndex(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend_unsignedShortValue(v12, v13, v14);

  objc_msgSend_localStartTime(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v36) = objc_msgSend_unsignedIntValue(v17, v18, v19);

  objc_msgSend_localEndTime(self, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v36) = objc_msgSend_unsignedIntValue(v22, v23, v24);

  sub_234118674(0x62FuLL, 0, &v31);
  if (v31)
  {
    sub_234106C48((uint64_t)v26);
    v28 = 0;
    v29 = 0;
    v27 = &unk_250504030;
    v30 = 0;
    sub_233CAF098((uint64_t)&v27, &v31, 0);
    sub_234106CA8((uint64_t)v26, (uint64_t)&v27, 0xFFFFFFFF, (uint64_t)v37);
    *(_QWORD *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(_QWORD *)&retstr->mLine = 0;
    sub_233D24EAC(v34, v26, 0x100uLL, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      sub_233C115F0((uint64_t)v26, &v31, retstr);
      if (!retstr->mError)
      {
        sub_233C11670((uint64_t)a4, &v31);
        sub_234106010((uint64_t)a4, 21, 256, retstr);
      }
    }
    v27 = &unk_250504030;
    sub_233CAF128(&v29);
    sub_233CAF128(&v28);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 18678;
  }
  sub_233CAF128(&v31);
  return (ChipError *)sub_233CAF15C((uint64_t)&v32);
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
    v11 = 18707;
    sub_2340017F0((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_233CAF128(&v15);
  return v8;
}

@end
