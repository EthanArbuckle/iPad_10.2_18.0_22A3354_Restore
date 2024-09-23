@implementation MTRTimeSynchronizationClusterSetTimeZoneParams

- (MTRTimeSynchronizationClusterSetTimeZoneParams)init
{
  const char *v2;
  uint64_t v3;
  MTRTimeSynchronizationClusterSetTimeZoneParams *v4;
  uint64_t v5;
  NSArray *timeZone;
  NSNumber *timedInvokeTimeoutMs;
  NSNumber *serverSideProcessingTimeout;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTRTimeSynchronizationClusterSetTimeZoneParams;
  v4 = -[MTRTimeSynchronizationClusterSetTimeZoneParams init](&v10, sel_init);
  if (v4)
  {
    objc_msgSend_array(MEMORY[0x24BDBCE30], v2, v3);
    v5 = objc_claimAutoreleasedReturnValue();
    timeZone = v4->_timeZone;
    v4->_timeZone = (NSArray *)v5;

    timedInvokeTimeoutMs = v4->_timedInvokeTimeoutMs;
    v4->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v4->_serverSideProcessingTimeout;
    v4->_serverSideProcessingTimeout = 0;

  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRTimeSynchronizationClusterSetTimeZoneParams *v4;
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

  v4 = objc_alloc_init(MTRTimeSynchronizationClusterSetTimeZoneParams);
  objc_msgSend_timeZone(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimeZone_(v4, v8, (uint64_t)v7);

  objc_msgSend_timedInvokeTimeoutMs(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v12, (uint64_t)v11);

  objc_msgSend_serverSideProcessingTimeout(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setServerSideProcessingTimeout_(v4, v16, (uint64_t)v15);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: timeZone:%@; >"), v5, self->_timeZone);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSArray)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)serverSideProcessingTimeout
{
  return self->_serverSideProcessingTimeout;
}

- (void)setServerSideProcessingTimeout:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSideProcessingTimeout, 0);
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  unint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t i;
  void *v21;
  const char *v22;
  uint64_t v23;
  unint64_t v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  void *v29;
  char isKindOfClass;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  unsigned int v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v66[8];
  void *v67;
  uint64_t v68;
  uint64_t v69;
  char v70;
  uint64_t v71;
  uint64_t *v72;
  _QWORD v73[2];
  __int128 v74;
  _BYTE v75[32];

  v74 = 0uLL;
  v73[0] = 0;
  v73[1] = 0;
  v72 = v73;
  objc_msgSend_timeZone(self, a3, (uint64_t)a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_count(v6, v7, v8);

  if (v9)
  {
    v10 = (_QWORD *)operator new();
    objc_msgSend_timeZone(self, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend_count(v13, v14, v15);
    sub_233CAF7E4(v10, v16);

    if (v10[1])
    {
      v66[0] = (unint64_t)v10;
      sub_233CAF24C(&v72, v66, (uint64_t *)v66);
      v19 = 0;
      for (i = 0; ; ++i)
      {
        objc_msgSend_timeZone(self, v17, v18);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend_count(v21, v22, v23);

        if (i >= v24)
        {
          v59 = v10[1];
          objc_msgSend_timeZone(self, v25, v26);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = objc_msgSend_count(v60, v61, v62);
          sub_233CAF22C(v66, v59, v63);
          v74 = *(_OWORD *)v66;

          goto LABEL_12;
        }
        objc_msgSend_timeZone(self, v25, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v27, v28, i);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
          break;
        objc_msgSend_timeZone(self, v31, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v33, v34, i);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_offset(v35, v36, v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)(v10[1] + v19) = objc_msgSend_intValue(v38, v39, v40);

        objc_msgSend_validAt(v35, v41, v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)(v10[1] + v19 + 8) = objc_msgSend_unsignedLongLongValue(v43, v44, v45);

        objc_msgSend_name(v35, v46, v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        if (v48)
        {
          v51 = v10[1] + v19;
          *(_QWORD *)(v51 + 24) = 0;
          v51 += 24;
          *(_BYTE *)(v51 - 8) = 1;
          *(_QWORD *)(v51 + 8) = 0;
          objc_msgSend_name(v35, v49, v50);
          v52 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v55 = objc_msgSend_UTF8String(v52, v53, v54);
          v57 = objc_msgSend_lengthOfBytesUsingEncoding_(v52, v56, 4);
          sub_233CAF22C(v66, v55, v57);

          *(_OWORD *)v51 = *(_OWORD *)v66;
        }

        v19 += 40;
      }
      retstr->mError = 47;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-"
                      "generated/MTRCommandPayloadsObjc.mm";
      v58 = 7234;
    }
    else
    {
      retstr->mError = 47;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-"
                      "generated/MTRCommandPayloadsObjc.mm";
      v58 = 7228;
    }
    retstr->mLine = v58;
  }
  else
  {
    v74 = 0uLL;
LABEL_12:
    sub_234118674(0x62FuLL, 0, &v71);
    if (v71)
    {
      sub_234106C48((uint64_t)v66);
      v68 = 0;
      v69 = 0;
      v67 = &unk_250504030;
      v70 = 0;
      sub_233CAF098((uint64_t)&v67, &v71, 0);
      sub_234106CA8((uint64_t)v66, (uint64_t)&v67, 0xFFFFFFFF, (uint64_t)v75);
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      sub_233D0C6F4((uint64_t *)&v74, (char *)v66, 0x100uLL, (uint64_t)retstr);
      if (!retstr->mError)
      {
        *(_QWORD *)&retstr->mError = 0;
        retstr->mFile = 0;
        *(_QWORD *)&retstr->mLine = 0;
        sub_233C115F0((uint64_t)v66, &v71, retstr);
        if (!retstr->mError)
        {
          sub_233C11670((uint64_t)a4, &v71);
          sub_234106010((uint64_t)a4, 21, 256, retstr);
        }
      }
      v67 = &unk_250504030;
      sub_233CAF128(&v69);
      sub_233CAF128(&v68);
    }
    else
    {
      retstr->mError = 11;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-"
                      "generated/MTRCommandPayloadsObjc.mm";
      retstr->mLine = 7253;
    }
    sub_233CAF128(&v71);
  }
  return (ChipError *)sub_233CAF15C((uint64_t)&v72);
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
    v11 = 7282;
    sub_2340017F0((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_233CAF128(&v15);
  return v8;
}

@end
