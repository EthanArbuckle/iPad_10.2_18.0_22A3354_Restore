@implementation MTRDoorLockClusterGetYearDayScheduleResponseParams

- (MTRDoorLockClusterGetYearDayScheduleResponseParams)init
{
  MTRDoorLockClusterGetYearDayScheduleResponseParams *v2;
  MTRDoorLockClusterGetYearDayScheduleResponseParams *v3;
  NSNumber *yearDayIndex;
  NSNumber *userIndex;
  NSNumber *status;
  NSNumber *localStartTime;
  NSNumber *localEndTime;
  NSNumber *timedInvokeTimeoutMs;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MTRDoorLockClusterGetYearDayScheduleResponseParams;
  v2 = -[MTRDoorLockClusterGetYearDayScheduleResponseParams init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    yearDayIndex = v2->_yearDayIndex;
    v2->_yearDayIndex = (NSNumber *)&unk_250591A40;

    userIndex = v3->_userIndex;
    v3->_userIndex = (NSNumber *)&unk_250591A40;

    status = v3->_status;
    v3->_status = (NSNumber *)&unk_250591A40;

    localStartTime = v3->_localStartTime;
    v3->_localStartTime = 0;

    localEndTime = v3->_localEndTime;
    v3->_localEndTime = 0;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRDoorLockClusterGetYearDayScheduleResponseParams *v4;
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

  v4 = objc_alloc_init(MTRDoorLockClusterGetYearDayScheduleResponseParams);
  objc_msgSend_yearDayIndex(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setYearDayIndex_(v4, v8, (uint64_t)v7);

  objc_msgSend_userIndex(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUserIndex_(v4, v12, (uint64_t)v11);

  objc_msgSend_status(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStatus_(v4, v16, (uint64_t)v15);

  objc_msgSend_localStartTime(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLocalStartTime_(v4, v20, (uint64_t)v19);

  objc_msgSend_localEndTime(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLocalEndTime_(v4, v24, (uint64_t)v23);

  objc_msgSend_timedInvokeTimeoutMs(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v28, (uint64_t)v27);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: yearDayIndex:%@; userIndex:%@; status:%@; localStartTime:%@; localEndTime:%@; >"),
    v5,
    self->_yearDayIndex,
    self->_userIndex,
    self->_status,
    self->_localStartTime,
    self->_localEndTime);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (MTRDoorLockClusterGetYearDayScheduleResponseParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error
{
  NSDictionary *v6;
  const char *v7;
  MTRDoorLockClusterGetYearDayScheduleResponseParams *v8;
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
  MTRDoorLockClusterGetYearDayScheduleResponseParams *v30;
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
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v6 = responseValue;
  v38.receiver = self;
  v38.super_class = (Class)MTRDoorLockClusterGetYearDayScheduleResponseParams;
  v8 = -[MTRDoorLockClusterGetYearDayScheduleResponseParams init](&v38, sel_init);
  if (!v8)
  {
    v30 = 0;
    goto LABEL_16;
  }
  objc_msgSend__responseDataForCommand_clusterID_commandID_error_(MTRBaseDevice, v7, (uint64_t)v6, 257, 15, error);
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
      sub_233D253E4((uint64_t)&buf, (uint64_t)v36, (uint64_t)&v32);
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
    if (error)
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
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();

    }
  }
  v30 = 0;
LABEL_14:
  sub_233CAF128(&v37);
LABEL_16:

  return v30;
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

- (NSNumber)status
{
  return self->_status;
}

- (void)setStatus:(NSNumber *)status
{
  objc_setProperty_nonatomic_copy(self, a2, status, 24);
}

- (NSNumber)localStartTime
{
  return self->_localStartTime;
}

- (void)setLocalStartTime:(NSNumber *)localStartTime
{
  objc_setProperty_nonatomic_copy(self, a2, localStartTime, 32);
}

- (NSNumber)localEndTime
{
  return self->_localEndTime;
}

- (void)setLocalEndTime:(NSNumber *)localEndTime
{
  objc_setProperty_nonatomic_copy(self, a2, localEndTime, 40);
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs
{
  objc_setProperty_nonatomic_copy(self, a2, timedInvokeTimeoutMs, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_localEndTime, 0);
  objc_storeStrong((id *)&self->_localStartTime, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_userIndex, 0);
  objc_storeStrong((id *)&self->_yearDayIndex, 0);
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
  _BYTE *v22;
  int v23;
  void *v24;
  _BYTE *v25;
  const char *v26;
  void *v27;
  const char *v28;
  ChipError *result;

  objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], a3, *(unsigned __int8 *)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setYearDayIndex_(self, v8, (uint64_t)v7);

  objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v9, *((unsigned __int16 *)a4 + 1));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUserIndex_(self, v11, (uint64_t)v10);

  objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], v12, *((unsigned __int8 *)a4 + 4));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStatus_(self, v14, (uint64_t)v13);

  if (*((_BYTE *)a4 + 8))
  {
    v16 = (void *)MEMORY[0x24BDD16E0];
    v17 = sub_233C20E2C((_BYTE *)a4 + 8);
    objc_msgSend_numberWithUnsignedInt_(v16, v18, *(unsigned int *)v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLocalStartTime_(self, v20, (uint64_t)v19);

  }
  else
  {
    objc_msgSend_setLocalStartTime_(self, v15, 0);
  }
  v23 = *((unsigned __int8 *)a4 + 16);
  v22 = (char *)a4 + 16;
  if (v23)
  {
    v24 = (void *)MEMORY[0x24BDD16E0];
    v25 = sub_233C20E2C(v22);
    objc_msgSend_numberWithUnsignedInt_(v24, v26, *(unsigned int *)v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLocalEndTime_(self, v28, (uint64_t)v27);

  }
  else
  {
    result = (ChipError *)objc_msgSend_setLocalEndTime_(self, v21, 0);
  }
  retstr->mError = 0;
  retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-gene"
                  "rated/MTRCommandPayloadsObjc.mm";
  retstr->mLine = 18907;
  return result;
}

@end
