@implementation MTRElectricalMeasurementClusterGetProfileInfoResponseCommandParams

- (MTRElectricalMeasurementClusterGetProfileInfoResponseCommandParams)init
{
  MTRElectricalMeasurementClusterGetProfileInfoResponseCommandParams *v2;
  MTRElectricalMeasurementClusterGetProfileInfoResponseCommandParams *v3;
  NSNumber *profileCount;
  NSNumber *profileIntervalPeriod;
  NSNumber *maxNumberOfIntervals;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *listOfAttributes;
  NSNumber *timedInvokeTimeoutMs;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MTRElectricalMeasurementClusterGetProfileInfoResponseCommandParams;
  v2 = -[MTRElectricalMeasurementClusterGetProfileInfoResponseCommandParams init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    profileCount = v2->_profileCount;
    v2->_profileCount = (NSNumber *)&unk_250591A40;

    profileIntervalPeriod = v3->_profileIntervalPeriod;
    v3->_profileIntervalPeriod = (NSNumber *)&unk_250591A40;

    maxNumberOfIntervals = v3->_maxNumberOfIntervals;
    v3->_maxNumberOfIntervals = (NSNumber *)&unk_250591A40;

    objc_msgSend_array(MEMORY[0x24BDBCE30], v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    listOfAttributes = v3->_listOfAttributes;
    v3->_listOfAttributes = (NSArray *)v9;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRElectricalMeasurementClusterGetProfileInfoResponseCommandParams *v4;
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

  v4 = objc_alloc_init(MTRElectricalMeasurementClusterGetProfileInfoResponseCommandParams);
  objc_msgSend_profileCount(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setProfileCount_(v4, v8, (uint64_t)v7);

  objc_msgSend_profileIntervalPeriod(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setProfileIntervalPeriod_(v4, v12, (uint64_t)v11);

  objc_msgSend_maxNumberOfIntervals(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMaxNumberOfIntervals_(v4, v16, (uint64_t)v15);

  objc_msgSend_listOfAttributes(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setListOfAttributes_(v4, v20, (uint64_t)v19);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: profileCount:%@; profileIntervalPeriod:%@; maxNumberOfIntervals:%@; listOfAttributes:%@; >"),
    v5,
    self->_profileCount,
    self->_profileIntervalPeriod,
    self->_maxNumberOfIntervals,
    self->_listOfAttributes);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (MTRElectricalMeasurementClusterGetProfileInfoResponseCommandParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error
{
  NSDictionary *v6;
  const char *v7;
  MTRElectricalMeasurementClusterGetProfileInfoResponseCommandParams *v8;
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
  MTRElectricalMeasurementClusterGetProfileInfoResponseCommandParams *v31;
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
  v39.super_class = (Class)MTRElectricalMeasurementClusterGetProfileInfoResponseCommandParams;
  v8 = -[MTRElectricalMeasurementClusterGetProfileInfoResponseCommandParams init](&v39, sel_init);
  if (!v8)
  {
    v31 = 0;
    goto LABEL_16;
  }
  objc_msgSend__responseDataForCommand_clusterID_commandID_error_(MTRBaseDevice, v7, (uint64_t)v6, 2820, 0, error);
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
      sub_233D3D2C8(&buf, (uint64_t)v37, (uint64_t)&v33);
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

- (NSNumber)profileCount
{
  return self->_profileCount;
}

- (void)setProfileCount:(NSNumber *)profileCount
{
  objc_setProperty_nonatomic_copy(self, a2, profileCount, 8);
}

- (NSNumber)profileIntervalPeriod
{
  return self->_profileIntervalPeriod;
}

- (void)setProfileIntervalPeriod:(NSNumber *)profileIntervalPeriod
{
  objc_setProperty_nonatomic_copy(self, a2, profileIntervalPeriod, 16);
}

- (NSNumber)maxNumberOfIntervals
{
  return self->_maxNumberOfIntervals;
}

- (void)setMaxNumberOfIntervals:(NSNumber *)maxNumberOfIntervals
{
  objc_setProperty_nonatomic_copy(self, a2, maxNumberOfIntervals, 24);
}

- (NSArray)listOfAttributes
{
  return self->_listOfAttributes;
}

- (void)setListOfAttributes:(NSArray *)listOfAttributes
{
  objc_setProperty_nonatomic_copy(self, a2, listOfAttributes, 32);
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
  objc_storeStrong((id *)&self->_listOfAttributes, 0);
  objc_storeStrong((id *)&self->_maxNumberOfIntervals, 0);
  objc_storeStrong((id *)&self->_profileIntervalPeriod, 0);
  objc_storeStrong((id *)&self->_profileCount, 0);
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
  ChipError *result;
  unsigned __int16 v20;
  __int128 v21;
  uint64_t v22;
  unsigned __int8 v23[2];

  objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], a3, *(unsigned __int8 *)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setProfileCount_(self, v8, (uint64_t)v7);

  objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], v9, *((unsigned __int8 *)a4 + 1));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setProfileIntervalPeriod_(self, v11, (uint64_t)v10);

  objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], v12, *((unsigned __int8 *)a4 + 2));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMaxNumberOfIntervals_(self, v14, (uint64_t)v13);

  v15 = (void *)objc_opt_new();
  v23[0] = *((_BYTE *)a4 + 80);
  if (v23[0])
    v23[1] = *((_BYTE *)a4 + 81);
  sub_233C05E38((uint64_t)&v20, (uint64_t)a4 + 8, v23);
  while (sub_233CAF3D8((uint64_t)&v20))
  {
    objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v16, v20);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v15, v18, (uint64_t)v17);

  }
  *(_QWORD *)&retstr->mError = 0;
  retstr->mFile = 0;
  *(_QWORD *)&retstr->mLine = 0;
  if ((_DWORD)v21 == 33)
  {
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/app/data-model/DecodableList.h";
    retstr->mLine = 147;
  }
  else
  {
    *(_OWORD *)&retstr->mError = v21;
    *(_QWORD *)&retstr->mLine = v22;
    if (retstr->mError)
    {

      return result;
    }
  }
  objc_msgSend_setListOfAttributes_(self, v16, (uint64_t)v15);

  retstr->mError = 0;
  retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-gene"
                  "rated/MTRCommandPayloadsObjc.mm";
  retstr->mLine = 31622;
  return result;
}

@end
