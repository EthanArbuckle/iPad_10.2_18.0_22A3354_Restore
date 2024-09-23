@implementation MTREnergyEVSEClusterGetTargetsResponseParams

- (MTREnergyEVSEClusterGetTargetsResponseParams)init
{
  const char *v2;
  uint64_t v3;
  MTREnergyEVSEClusterGetTargetsResponseParams *v4;
  uint64_t v5;
  NSArray *chargingTargetSchedules;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTREnergyEVSEClusterGetTargetsResponseParams;
  v4 = -[MTREnergyEVSEClusterGetTargetsResponseParams init](&v8, sel_init);
  if (v4)
  {
    objc_msgSend_array(MEMORY[0x24BDBCE30], v2, v3);
    v5 = objc_claimAutoreleasedReturnValue();
    chargingTargetSchedules = v4->_chargingTargetSchedules;
    v4->_chargingTargetSchedules = (NSArray *)v5;

  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTREnergyEVSEClusterGetTargetsResponseParams *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;

  v4 = objc_alloc_init(MTREnergyEVSEClusterGetTargetsResponseParams);
  objc_msgSend_chargingTargetSchedules(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setChargingTargetSchedules_(v4, v8, (uint64_t)v7);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: chargingTargetSchedules:%@; >"),
    v5,
    self->_chargingTargetSchedules);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (MTREnergyEVSEClusterGetTargetsResponseParams)initWithResponseValue:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  MTREnergyEVSEClusterGetTargetsResponseParams *v8;
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
  MTREnergyEVSEClusterGetTargetsResponseParams *v31;
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
  v6 = a3;
  v39.receiver = self;
  v39.super_class = (Class)MTREnergyEVSEClusterGetTargetsResponseParams;
  v8 = -[MTREnergyEVSEClusterGetTargetsResponseParams init](&v39, sel_init);
  if (!v8)
  {
    v31 = 0;
    goto LABEL_16;
  }
  objc_msgSend__responseDataForCommand_clusterID_commandID_error_(MTRBaseDevice, v7, (uint64_t)v6, 153, 0, a4);
  if (v38)
  {
    sub_234104468((uint64_t)v37);
    sub_234104498((uint64_t)v37, *(_QWORD *)(v38 + 8), *(_QWORD *)(v38 + 24));
    v35 = 0uLL;
    v36 = 0;
    sub_234105EE4((uint64_t)v37, 256, &v35);
    if (!(_DWORD)v35)
    {
      sub_234104468((uint64_t)&buf);
      v44 = 0;
      sub_234104498(v9, 0, 0);
      sub_233D21D40((uint64_t)&buf, (uint64_t)v37, (uint64_t)&v33);
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
    if (a4)
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
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  v31 = 0;
LABEL_14:
  sub_233CAF128(&v38);
LABEL_16:

  return v31;
}

- (NSArray)chargingTargetSchedules
{
  return self->_chargingTargetSchedules;
}

- (void)setChargingTargetSchedules:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chargingTargetSchedules, 0);
}

- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3
{
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  const char *v17;
  void *v18;
  _BYTE *v19;
  const char *v20;
  void *v21;
  const char *v22;
  const char *v23;
  void *v24;
  uint64_t *v25;
  const char *v26;
  void *v27;
  const char *v28;
  const char *v29;
  const char *v30;
  ChipError *result;
  void *v33;
  unsigned __int16 v34;
  _BYTE v35[6];
  _BYTE v36[16];
  __int128 v37;
  uint64_t v38;
  _BYTE v39[8];
  uint64_t v40;
  unsigned __int8 v41;
  unsigned __int8 v42;
  __int128 v43;
  uint64_t v44;
  unsigned __int8 v45[10];

  v33 = (void *)objc_opt_new();
  LOBYTE(v34) = *((_BYTE *)a4 + 72);
  if ((_BYTE)v34)
    HIBYTE(v34) = *((_BYTE *)a4 + 73);
  sub_233CB05FC((uint64_t)v39, (uint64_t)a4, (unsigned __int8 *)&v34);
  while (sub_233CB0680((uint64_t)v39))
  {
    v7 = (void *)objc_opt_new();
    objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], v8, v39[0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDayOfWeekForSequence_(v7, v10, (uint64_t)v9);

    v11 = (void *)objc_opt_new();
    v45[0] = v41;
    if (v41)
      v45[1] = v42;
    sub_233CB0794((uint64_t)&v34, (uint64_t)&v40, v45);
    while (sub_233CB080C((uint64_t)&v34))
    {
      v13 = (void *)objc_opt_new();
      objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v14, v34);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setTargetTimeMinutesPastMidnight_(v13, v16, (uint64_t)v15);

      if (v35[0])
      {
        v18 = (void *)MEMORY[0x24BDD16E0];
        v19 = sub_233C27DCC(v35);
        objc_msgSend_numberWithUnsignedChar_(v18, v20, *v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setTargetSoC_(v13, v22, (uint64_t)v21);

      }
      else
      {
        objc_msgSend_setTargetSoC_(v13, v17, 0);
      }
      if (v36[0])
      {
        v24 = (void *)MEMORY[0x24BDD16E0];
        v25 = (uint64_t *)sub_233C25EA4(v36);
        objc_msgSend_numberWithLongLong_(v24, v26, *v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setAddedEnergy_(v13, v28, (uint64_t)v27);

      }
      else
      {
        objc_msgSend_setAddedEnergy_(v13, v23, 0);
      }
      objc_msgSend_addObject_(v11, v29, (uint64_t)v13);

    }
    *(_QWORD *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(_QWORD *)&retstr->mLine = 0;
    if ((_DWORD)v37 == 33)
    {
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/app/data-model/DecodableList.h";
      retstr->mLine = 147;
    }
    else
    {
      *(_OWORD *)&retstr->mError = v37;
      *(_QWORD *)&retstr->mLine = v38;
      if (retstr->mError)
      {

        goto LABEL_25;
      }
    }
    objc_msgSend_setChargingTargets_(v7, v12, (uint64_t)v11);

    objc_msgSend_addObject_(v33, v30, (uint64_t)v7);
  }
  *(_QWORD *)&retstr->mError = 0;
  retstr->mFile = 0;
  *(_QWORD *)&retstr->mLine = 0;
  if ((_DWORD)v43 == 33)
  {
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/app/data-model/DecodableList.h";
    retstr->mLine = 147;
LABEL_23:
    objc_msgSend_setChargingTargetSchedules_(self, v6, (uint64_t)v33);

    retstr->mError = 0;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 16808;
    return result;
  }
  *(_OWORD *)&retstr->mError = v43;
  *(_QWORD *)&retstr->mLine = v44;
  if (!retstr->mError)
    goto LABEL_23;
LABEL_25:

  return result;
}

@end
