@implementation MTRThermostatClusterGetWeeklyScheduleResponseParams

- (MTRThermostatClusterGetWeeklyScheduleResponseParams)init
{
  MTRThermostatClusterGetWeeklyScheduleResponseParams *v2;
  MTRThermostatClusterGetWeeklyScheduleResponseParams *v3;
  NSNumber *numberOfTransitionsForSequence;
  NSNumber *dayOfWeekForSequence;
  NSNumber *modeForSequence;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *transitions;
  NSNumber *timedInvokeTimeoutMs;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MTRThermostatClusterGetWeeklyScheduleResponseParams;
  v2 = -[MTRThermostatClusterGetWeeklyScheduleResponseParams init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    numberOfTransitionsForSequence = v2->_numberOfTransitionsForSequence;
    v2->_numberOfTransitionsForSequence = (NSNumber *)&unk_250591A40;

    dayOfWeekForSequence = v3->_dayOfWeekForSequence;
    v3->_dayOfWeekForSequence = (NSNumber *)&unk_250591A40;

    modeForSequence = v3->_modeForSequence;
    v3->_modeForSequence = (NSNumber *)&unk_250591A40;

    objc_msgSend_array(MEMORY[0x24BDBCE30], v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    transitions = v3->_transitions;
    v3->_transitions = (NSArray *)v9;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRThermostatClusterGetWeeklyScheduleResponseParams *v4;
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

  v4 = objc_alloc_init(MTRThermostatClusterGetWeeklyScheduleResponseParams);
  objc_msgSend_numberOfTransitionsForSequence(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNumberOfTransitionsForSequence_(v4, v8, (uint64_t)v7);

  objc_msgSend_dayOfWeekForSequence(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDayOfWeekForSequence_(v4, v12, (uint64_t)v11);

  objc_msgSend_modeForSequence(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setModeForSequence_(v4, v16, (uint64_t)v15);

  objc_msgSend_transitions(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTransitions_(v4, v20, (uint64_t)v19);

  objc_msgSend_timedInvokeTimeoutMs(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v24, (uint64_t)v23);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: numberOfTransitionsForSequence:%@; dayOfWeekForSequence:%@; modeForSequence:%@; transitions:%@; >"),
    v5,
    self->_numberOfTransitionsForSequence,
    self->_dayOfWeekForSequence,
    self->_modeForSequence,
    self->_transitions);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (MTRThermostatClusterGetWeeklyScheduleResponseParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error
{
  NSDictionary *v6;
  const char *v7;
  MTRThermostatClusterGetWeeklyScheduleResponseParams *v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  char *v12;
  const char *v13;
  void *v14;
  NSObject *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  id v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  MTRThermostatClusterGetWeeklyScheduleResponseParams *v31;
  __int128 v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;
  _BYTE v37[72];
  uint64_t v38;
  objc_super v39;
  uint64_t v40;
  void *v41;
  __int128 buf;
  uint64_t v43;
  char v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v6 = responseValue;
  v39.receiver = self;
  v39.super_class = (Class)MTRThermostatClusterGetWeeklyScheduleResponseParams;
  v8 = -[MTRThermostatClusterGetWeeklyScheduleResponseParams init](&v39, sel_init);
  if (!v8)
  {
    v31 = 0;
    goto LABEL_16;
  }
  objc_msgSend__responseDataForCommand_clusterID_commandID_error_(MTRBaseDevice, v7, (uint64_t)v6, 513, 0, error);
  if (v38)
  {
    sub_234104468((uint64_t)v37);
    sub_234104498((uint64_t)v37, *(_QWORD *)(v38 + 8), *(_QWORD *)(v38 + 24));
    v35 = 0uLL;
    v36 = 0;
    sub_234105EE4((uint64_t)v37, 256, &v35);
    if (!(_DWORD)v35)
    {
      LOWORD(buf) = 0;
      BYTE2(buf) = 0;
      sub_234104468((uint64_t)&buf + 8);
      v44 = 0;
      sub_234104498(v9, 0, 0);
      sub_233D2C448(&buf, (uint64_t)v37, (uint64_t)&v33);
      v35 = v33;
      v36 = v34;
      if (!(_DWORD)v33)
      {
        objc_msgSend__setFieldsFromDecodableStruct_(v8, v10, (uint64_t)&buf);
        v35 = v33;
        v36 = v34;
        if (!(_DWORD)v33)
        {
          v31 = v8;
          goto LABEL_14;
        }
      }
    }
    v11 = (void *)MEMORY[0x24BDD17C8];
    buf = v35;
    v43 = v36;
    v12 = sub_2341083CC((const char **)&buf, 1);
    objc_msgSend_stringWithFormat_(v11, v13, (uint64_t)CFSTR("Command payload decoding failed: %s"), v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    sub_234117B80(0, "NotSpecified");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = objc_retainAutorelease(v14);
      v19 = objc_msgSend_UTF8String(v16, v17, v18);
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = v19;
      _os_log_impl(&dword_233BF3000, v15, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&buf, 0xCu);
    }

    if (sub_234114844(1u))
    {
      v22 = objc_retainAutorelease(v14);
      objc_msgSend_UTF8String(v22, v23, v24);
      sub_2341147D0(0, 1);
    }
    if (error)
    {
      v40 = *MEMORY[0x24BDD0FD8];
      objc_msgSend_mainBundle(MEMORY[0x24BDD1488], v20, v21);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v25, v26, (uint64_t)v14, &stru_2505249E8, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v27;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v28, (uint64_t)&v41, &v40, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v30, (uint64_t)CFSTR("MTRErrorDomain"), 13, v29);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();

    }
  }
  v31 = 0;
LABEL_14:
  sub_233CAF128(&v38);
LABEL_16:

  return v31;
}

- (NSNumber)numberOfTransitionsForSequence
{
  return self->_numberOfTransitionsForSequence;
}

- (void)setNumberOfTransitionsForSequence:(NSNumber *)numberOfTransitionsForSequence
{
  objc_setProperty_nonatomic_copy(self, a2, numberOfTransitionsForSequence, 8);
}

- (NSNumber)dayOfWeekForSequence
{
  return self->_dayOfWeekForSequence;
}

- (void)setDayOfWeekForSequence:(NSNumber *)dayOfWeekForSequence
{
  objc_setProperty_nonatomic_copy(self, a2, dayOfWeekForSequence, 16);
}

- (NSNumber)modeForSequence
{
  return self->_modeForSequence;
}

- (void)setModeForSequence:(NSNumber *)modeForSequence
{
  objc_setProperty_nonatomic_copy(self, a2, modeForSequence, 24);
}

- (NSArray)transitions
{
  return self->_transitions;
}

- (void)setTransitions:(NSArray *)transitions
{
  objc_setProperty_nonatomic_copy(self, a2, transitions, 32);
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs
{
  objc_setProperty_nonatomic_copy(self, a2, timedInvokeTimeoutMs, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_transitions, 0);
  objc_storeStrong((id *)&self->_modeForSequence, 0);
  objc_storeStrong((id *)&self->_dayOfWeekForSequence, 0);
  objc_storeStrong((id *)&self->_numberOfTransitionsForSequence, 0);
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
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  const char *v21;
  void *v22;
  const char *v23;
  const char *v24;
  void *v25;
  const char *v26;
  const char *v27;
  ChipError *result;
  _WORD v29[2];
  char v30;
  __int16 v31;
  char v32;
  __int128 v33;
  uint64_t v34;
  unsigned __int8 v35[2];

  objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], a3, *(unsigned __int8 *)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNumberOfTransitionsForSequence_(self, v8, (uint64_t)v7);

  objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], v9, *((unsigned __int8 *)a4 + 1));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDayOfWeekForSequence_(self, v11, (uint64_t)v10);

  objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], v12, *((unsigned __int8 *)a4 + 2));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setModeForSequence_(self, v14, (uint64_t)v13);

  v15 = (void *)objc_opt_new();
  v35[0] = *((_BYTE *)a4 + 80);
  if (v35[0])
    v35[1] = *((_BYTE *)a4 + 81);
  sub_233CB0CE4((uint64_t)v29, (uint64_t)a4 + 8, v35);
  while (sub_233CB0D64((uint64_t)v29))
  {
    v17 = (void *)objc_opt_new();
    objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v18, v29[0]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTransitionTime_(v17, v20, (uint64_t)v19);

    if (v30)
    {
      objc_msgSend_numberWithShort_(MEMORY[0x24BDD16E0], v21, v29[1]);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setHeatSetpoint_(v17, v23, (uint64_t)v22);

    }
    else
    {
      objc_msgSend_setHeatSetpoint_(v17, v21, 0);
    }
    if (v32)
    {
      objc_msgSend_numberWithShort_(MEMORY[0x24BDD16E0], v24, v31);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setCoolSetpoint_(v17, v26, (uint64_t)v25);

    }
    else
    {
      objc_msgSend_setCoolSetpoint_(v17, v24, 0);
    }
    objc_msgSend_addObject_(v15, v27, (uint64_t)v17);

  }
  *(_QWORD *)&retstr->mError = 0;
  retstr->mFile = 0;
  *(_QWORD *)&retstr->mLine = 0;
  if ((_DWORD)v33 == 33)
  {
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/app/data-model/DecodableList.h";
    retstr->mLine = 147;
  }
  else
  {
    *(_OWORD *)&retstr->mError = v33;
    *(_QWORD *)&retstr->mLine = v34;
    if (retstr->mError)
    {

      return result;
    }
  }
  objc_msgSend_setTransitions_(self, v16, (uint64_t)v15);

  retstr->mError = 0;
  retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-gene"
                  "rated/MTRCommandPayloadsObjc.mm";
  retstr->mLine = 21904;
  return result;
}

@end
