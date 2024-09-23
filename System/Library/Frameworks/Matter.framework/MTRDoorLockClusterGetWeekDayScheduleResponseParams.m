@implementation MTRDoorLockClusterGetWeekDayScheduleResponseParams

- (MTRDoorLockClusterGetWeekDayScheduleResponseParams)init
{
  MTRDoorLockClusterGetWeekDayScheduleResponseParams *v2;
  MTRDoorLockClusterGetWeekDayScheduleResponseParams *v3;
  NSNumber *weekDayIndex;
  NSNumber *userIndex;
  NSNumber *status;
  NSNumber *daysMask;
  NSNumber *startHour;
  NSNumber *startMinute;
  NSNumber *endHour;
  NSNumber *endMinute;
  NSNumber *timedInvokeTimeoutMs;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MTRDoorLockClusterGetWeekDayScheduleResponseParams;
  v2 = -[MTRDoorLockClusterGetWeekDayScheduleResponseParams init](&v14, sel_init);
  v3 = v2;
  if (v2)
  {
    weekDayIndex = v2->_weekDayIndex;
    v2->_weekDayIndex = (NSNumber *)&unk_250591A40;

    userIndex = v3->_userIndex;
    v3->_userIndex = (NSNumber *)&unk_250591A40;

    status = v3->_status;
    v3->_status = (NSNumber *)&unk_250591A40;

    daysMask = v3->_daysMask;
    v3->_daysMask = 0;

    startHour = v3->_startHour;
    v3->_startHour = 0;

    startMinute = v3->_startMinute;
    v3->_startMinute = 0;

    endHour = v3->_endHour;
    v3->_endHour = 0;

    endMinute = v3->_endMinute;
    v3->_endMinute = 0;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRDoorLockClusterGetWeekDayScheduleResponseParams *v4;
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

  v4 = objc_alloc_init(MTRDoorLockClusterGetWeekDayScheduleResponseParams);
  objc_msgSend_weekDayIndex(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWeekDayIndex_(v4, v8, (uint64_t)v7);

  objc_msgSend_userIndex(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUserIndex_(v4, v12, (uint64_t)v11);

  objc_msgSend_status(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStatus_(v4, v16, (uint64_t)v15);

  objc_msgSend_daysMask(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDaysMask_(v4, v20, (uint64_t)v19);

  objc_msgSend_startHour(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStartHour_(v4, v24, (uint64_t)v23);

  objc_msgSend_startMinute(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStartMinute_(v4, v28, (uint64_t)v27);

  objc_msgSend_endHour(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEndHour_(v4, v32, (uint64_t)v31);

  objc_msgSend_endMinute(self, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEndMinute_(v4, v36, (uint64_t)v35);

  objc_msgSend_timedInvokeTimeoutMs(self, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v40, (uint64_t)v39);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: weekDayIndex:%@; userIndex:%@; status:%@; daysMask:%@; startHour:%@; startMinute:%@; endHour:%@; endMinute:%@; >"),
    v5,
    self->_weekDayIndex,
    self->_userIndex,
    self->_status,
    self->_daysMask,
    self->_startHour,
    self->_startMinute,
    self->_endHour,
    self->_endMinute);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (MTRDoorLockClusterGetWeekDayScheduleResponseParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error
{
  NSDictionary *v6;
  const char *v7;
  MTRDoorLockClusterGetWeekDayScheduleResponseParams *v8;
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
  MTRDoorLockClusterGetWeekDayScheduleResponseParams *v30;
  _BYTE v32[2];
  int v33;
  char v34;
  char v35;
  char v36;
  char v37;
  __int128 v38;
  uint64_t v39;
  _BYTE v40[72];
  uint64_t v41;
  objc_super v42;
  uint64_t v43;
  void *v44;
  uint8_t buf[16];
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v6 = responseValue;
  v42.receiver = self;
  v42.super_class = (Class)MTRDoorLockClusterGetWeekDayScheduleResponseParams;
  v8 = -[MTRDoorLockClusterGetWeekDayScheduleResponseParams init](&v42, sel_init);
  if (!v8)
  {
    v30 = 0;
    goto LABEL_16;
  }
  objc_msgSend__responseDataForCommand_clusterID_commandID_error_(MTRBaseDevice, v7, (uint64_t)v6, 257, 12, error);
  if (v41)
  {
    sub_234104468((uint64_t)v40);
    sub_234104498((uint64_t)v40, *(_QWORD *)(v41 + 8), *(_QWORD *)(v41 + 24));
    v38 = 0uLL;
    v39 = 0;
    sub_234105EE4((uint64_t)v40, 256, &v38);
    if (!(_DWORD)v38)
    {
      v32[0] = 0;
      v33 = 0;
      v34 = 0;
      v35 = 0;
      v36 = 0;
      v37 = 0;
      sub_233D24B4C((uint64_t)v32, (uint64_t)v40, (uint64_t)buf);
      v38 = *(_OWORD *)buf;
      v39 = v46;
      if (!*(_DWORD *)buf)
      {
        objc_msgSend__setFieldsFromDecodableStruct_(v8, v9, (uint64_t)v32);
        v38 = *(_OWORD *)buf;
        v39 = v46;
        if (!*(_DWORD *)buf)
        {
          v30 = v8;
          goto LABEL_14;
        }
      }
    }
    v10 = (void *)MEMORY[0x24BDD17C8];
    *(_OWORD *)buf = v38;
    v46 = v39;
    v11 = sub_2341083CC((const char **)buf, 1);
    objc_msgSend_stringWithFormat_(v10, v12, (uint64_t)CFSTR("Command payload decoding failed: %s"), v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    sub_234117B80(0, "NotSpecified");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = objc_retainAutorelease(v13);
      v18 = objc_msgSend_UTF8String(v15, v16, v17);
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v18;
      _os_log_impl(&dword_233BF3000, v14, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
    }

    if (sub_234114844(1u))
    {
      v21 = objc_retainAutorelease(v13);
      objc_msgSend_UTF8String(v21, v22, v23);
      sub_2341147D0(0, 1);
    }
    if (error)
    {
      v43 = *MEMORY[0x24BDD0FD8];
      objc_msgSend_mainBundle(MEMORY[0x24BDD1488], v19, v20);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v24, v25, (uint64_t)v13, &stru_2505249E8, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v26;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v27, (uint64_t)&v44, &v43, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v29, (uint64_t)CFSTR("MTRErrorDomain"), 13, v28);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();

    }
  }
  v30 = 0;
LABEL_14:
  sub_233CAF128(&v41);
LABEL_16:

  return v30;
}

- (NSNumber)weekDayIndex
{
  return self->_weekDayIndex;
}

- (void)setWeekDayIndex:(NSNumber *)weekDayIndex
{
  objc_setProperty_nonatomic_copy(self, a2, weekDayIndex, 8);
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

- (NSNumber)daysMask
{
  return self->_daysMask;
}

- (void)setDaysMask:(NSNumber *)daysMask
{
  objc_setProperty_nonatomic_copy(self, a2, daysMask, 32);
}

- (NSNumber)startHour
{
  return self->_startHour;
}

- (void)setStartHour:(NSNumber *)startHour
{
  objc_setProperty_nonatomic_copy(self, a2, startHour, 40);
}

- (NSNumber)startMinute
{
  return self->_startMinute;
}

- (void)setStartMinute:(NSNumber *)startMinute
{
  objc_setProperty_nonatomic_copy(self, a2, startMinute, 48);
}

- (NSNumber)endHour
{
  return self->_endHour;
}

- (void)setEndHour:(NSNumber *)endHour
{
  objc_setProperty_nonatomic_copy(self, a2, endHour, 56);
}

- (NSNumber)endMinute
{
  return self->_endMinute;
}

- (void)setEndMinute:(NSNumber *)endMinute
{
  objc_setProperty_nonatomic_copy(self, a2, endMinute, 64);
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs
{
  objc_setProperty_nonatomic_copy(self, a2, timedInvokeTimeoutMs, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_endMinute, 0);
  objc_storeStrong((id *)&self->_endHour, 0);
  objc_storeStrong((id *)&self->_startMinute, 0);
  objc_storeStrong((id *)&self->_startHour, 0);
  objc_storeStrong((id *)&self->_daysMask, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_userIndex, 0);
  objc_storeStrong((id *)&self->_weekDayIndex, 0);
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
  void *v22;
  _BYTE *v23;
  const char *v24;
  void *v25;
  const char *v26;
  const char *v27;
  void *v28;
  _BYTE *v29;
  const char *v30;
  void *v31;
  const char *v32;
  const char *v33;
  void *v34;
  _BYTE *v35;
  const char *v36;
  void *v37;
  const char *v38;
  const char *v39;
  _BYTE *v40;
  int v41;
  void *v42;
  _BYTE *v43;
  const char *v44;
  void *v45;
  const char *v46;
  ChipError *result;

  objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], a3, *(unsigned __int8 *)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWeekDayIndex_(self, v8, (uint64_t)v7);

  objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v9, *((unsigned __int16 *)a4 + 1));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUserIndex_(self, v11, (uint64_t)v10);

  objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], v12, *((unsigned __int8 *)a4 + 4));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStatus_(self, v14, (uint64_t)v13);

  if (*((_BYTE *)a4 + 5))
  {
    v16 = (void *)MEMORY[0x24BDD16E0];
    v17 = sub_233C27DCC((_BYTE *)a4 + 5);
    objc_msgSend_numberWithUnsignedChar_(v16, v18, *v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDaysMask_(self, v20, (uint64_t)v19);

  }
  else
  {
    objc_msgSend_setDaysMask_(self, v15, 0);
  }
  if (*((_BYTE *)a4 + 7))
  {
    v22 = (void *)MEMORY[0x24BDD16E0];
    v23 = sub_233C27DCC((_BYTE *)a4 + 7);
    objc_msgSend_numberWithUnsignedChar_(v22, v24, *v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setStartHour_(self, v26, (uint64_t)v25);

  }
  else
  {
    objc_msgSend_setStartHour_(self, v21, 0);
  }
  if (*((_BYTE *)a4 + 9))
  {
    v28 = (void *)MEMORY[0x24BDD16E0];
    v29 = sub_233C27DCC((_BYTE *)a4 + 9);
    objc_msgSend_numberWithUnsignedChar_(v28, v30, *v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setStartMinute_(self, v32, (uint64_t)v31);

  }
  else
  {
    objc_msgSend_setStartMinute_(self, v27, 0);
  }
  if (*((_BYTE *)a4 + 11))
  {
    v34 = (void *)MEMORY[0x24BDD16E0];
    v35 = sub_233C27DCC((_BYTE *)a4 + 11);
    objc_msgSend_numberWithUnsignedChar_(v34, v36, *v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setEndHour_(self, v38, (uint64_t)v37);

  }
  else
  {
    objc_msgSend_setEndHour_(self, v33, 0);
  }
  v41 = *((unsigned __int8 *)a4 + 13);
  v40 = (char *)a4 + 13;
  if (v41)
  {
    v42 = (void *)MEMORY[0x24BDD16E0];
    v43 = sub_233C27DCC(v40);
    objc_msgSend_numberWithUnsignedChar_(v42, v44, *v43);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setEndMinute_(self, v46, (uint64_t)v45);

  }
  else
  {
    result = (ChipError *)objc_msgSend_setEndMinute_(self, v39, 0);
  }
  retstr->mError = 0;
  retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-gene"
                  "rated/MTRCommandPayloadsObjc.mm";
  retstr->mLine = 18527;
  return result;
}

@end
