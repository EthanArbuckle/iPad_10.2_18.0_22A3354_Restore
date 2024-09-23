@implementation MTRThermostatClusterSetWeeklyScheduleParams

- (MTRThermostatClusterSetWeeklyScheduleParams)init
{
  MTRThermostatClusterSetWeeklyScheduleParams *v2;
  MTRThermostatClusterSetWeeklyScheduleParams *v3;
  NSNumber *numberOfTransitionsForSequence;
  NSNumber *dayOfWeekForSequence;
  NSNumber *modeForSequence;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *transitions;
  NSNumber *timedInvokeTimeoutMs;
  NSNumber *serverSideProcessingTimeout;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MTRThermostatClusterSetWeeklyScheduleParams;
  v2 = -[MTRThermostatClusterSetWeeklyScheduleParams init](&v14, sel_init);
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

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRThermostatClusterSetWeeklyScheduleParams *v4;
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

  v4 = objc_alloc_init(MTRThermostatClusterSetWeeklyScheduleParams);
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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: numberOfTransitionsForSequence:%@; dayOfWeekForSequence:%@; modeForSequence:%@; transitions:%@; >"),
    v5,
    self->_numberOfTransitionsForSequence,
    self->_dayOfWeekForSequence,
    self->_modeForSequence,
    self->_transitions);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
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
  objc_storeStrong((id *)&self->_transitions, 0);
  objc_storeStrong((id *)&self->_modeForSequence, 0);
  objc_storeStrong((id *)&self->_dayOfWeekForSequence, 0);
  objc_storeStrong((id *)&self->_numberOfTransitionsForSequence, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  unint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t i;
  void *v36;
  const char *v37;
  uint64_t v38;
  unint64_t v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  void *v44;
  char isKindOfClass;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  unsigned int v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v84[8];
  void *v85;
  uint64_t v86;
  uint64_t v87;
  char v88;
  uint64_t v89;
  uint64_t *v90;
  _QWORD v91[2];
  __int16 v92;
  char v93;
  __int128 v94;
  _BYTE v95[32];

  v92 = 0;
  v93 = 0;
  v94 = 0uLL;
  v91[0] = 0;
  v91[1] = 0;
  v90 = v91;
  objc_msgSend_numberOfTransitionsForSequence(self, a3, (uint64_t)a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v92) = objc_msgSend_unsignedCharValue(v6, v7, v8);

  objc_msgSend_dayOfWeekForSequence(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  HIBYTE(v92) = objc_msgSend_unsignedCharValue(v11, v12, v13);

  objc_msgSend_modeForSequence(self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = objc_msgSend_unsignedCharValue(v16, v17, v18);

  objc_msgSend_transitions(self, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend_count(v21, v22, v23);

  if (v24)
  {
    v25 = (_QWORD *)operator new();
    objc_msgSend_transitions(self, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend_count(v28, v29, v30);
    sub_233CB0E0C(v25, v31);

    if (v25[1])
    {
      v84[0] = (unint64_t)v25;
      sub_233CAF24C(&v90, v84, (uint64_t *)v84);
      v34 = 0;
      for (i = 0; ; ++i)
      {
        objc_msgSend_transitions(self, v32, v33);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend_count(v36, v37, v38);

        if (i >= v39)
        {
          v77 = v25[1];
          objc_msgSend_transitions(self, v40, v41);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v81 = objc_msgSend_count(v78, v79, v80);
          sub_233CAF22C(v84, v77, v81);
          v94 = *(_OWORD *)v84;

          goto LABEL_18;
        }
        objc_msgSend_transitions(self, v40, v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v42, v43, i);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
          break;
        objc_msgSend_transitions(self, v46, v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v48, v49, i);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_transitionTime(v50, v51, v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        *(_WORD *)(v25[1] + v34) = objc_msgSend_unsignedShortValue(v53, v54, v55);

        objc_msgSend_heatSetpoint(v50, v56, v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();

        v61 = v25[1];
        if (v58)
        {
          v62 = v61 + v34;
          *(_WORD *)(v62 + 2) = 0;
          *(_BYTE *)(v62 + 4) = 1;
          objc_msgSend_heatSetpoint(v50, v59, v60);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          *(_WORD *)(v62 + 2) = objc_msgSend_shortValue(v63, v64, v65);

        }
        else
        {
          v66 = v61 + v34;
          if (*(_BYTE *)(v66 + 4))
            *(_BYTE *)(v66 + 4) = 0;
        }
        objc_msgSend_coolSetpoint(v50, v59, v60);
        v67 = (void *)objc_claimAutoreleasedReturnValue();

        v70 = v25[1];
        if (v67)
        {
          v71 = v70 + v34;
          *(_WORD *)(v71 + 6) = 0;
          *(_BYTE *)(v71 + 8) = 1;
          objc_msgSend_coolSetpoint(v50, v68, v69);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          *(_WORD *)(v71 + 6) = objc_msgSend_shortValue(v72, v73, v74);

        }
        else
        {
          v75 = v70 + v34;
          if (*(_BYTE *)(v75 + 8))
            *(_BYTE *)(v75 + 8) = 0;
        }

        v34 += 10;
      }
      retstr->mError = 47;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-"
                      "generated/MTRCommandPayloadsObjc.mm";
      v76 = 21977;
    }
    else
    {
      retstr->mError = 47;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-"
                      "generated/MTRCommandPayloadsObjc.mm";
      v76 = 21971;
    }
    retstr->mLine = v76;
  }
  else
  {
    v94 = 0uLL;
LABEL_18:
    sub_234118674(0x62FuLL, 0, &v89);
    if (v89)
    {
      sub_234106C48((uint64_t)v84);
      v86 = 0;
      v87 = 0;
      v85 = &unk_250504030;
      v88 = 0;
      sub_233CAF098((uint64_t)&v85, &v89, 0);
      sub_234106CA8((uint64_t)v84, (uint64_t)&v85, 0xFFFFFFFF, (uint64_t)v95);
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      sub_233D2C214((unsigned __int8 *)&v92, (char *)v84, 0x100uLL, (uint64_t)retstr);
      if (!retstr->mError)
      {
        *(_QWORD *)&retstr->mError = 0;
        retstr->mFile = 0;
        *(_QWORD *)&retstr->mLine = 0;
        sub_233C115F0((uint64_t)v84, &v89, retstr);
        if (!retstr->mError)
        {
          sub_233C11670((uint64_t)a4, &v89);
          sub_234106010((uint64_t)a4, 21, 256, retstr);
        }
      }
      v85 = &unk_250504030;
      sub_233CAF128(&v87);
      sub_233CAF128(&v86);
    }
    else
    {
      retstr->mError = 11;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-"
                      "generated/MTRCommandPayloadsObjc.mm";
      retstr->mLine = 22003;
    }
    sub_233CAF128(&v89);
  }
  return (ChipError *)sub_233CAF15C((uint64_t)&v90);
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
    v11 = 22032;
    sub_2340017F0((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_233CAF128(&v15);
  return v8;
}

@end
