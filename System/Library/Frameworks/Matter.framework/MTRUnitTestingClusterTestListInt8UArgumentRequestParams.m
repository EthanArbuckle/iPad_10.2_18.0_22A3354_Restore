@implementation MTRUnitTestingClusterTestListInt8UArgumentRequestParams

- (MTRUnitTestingClusterTestListInt8UArgumentRequestParams)init
{
  const char *v2;
  uint64_t v3;
  MTRUnitTestingClusterTestListInt8UArgumentRequestParams *v4;
  uint64_t v5;
  NSArray *arg1;
  NSNumber *timedInvokeTimeoutMs;
  NSNumber *serverSideProcessingTimeout;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTRUnitTestingClusterTestListInt8UArgumentRequestParams;
  v4 = -[MTRUnitTestingClusterTestListInt8UArgumentRequestParams init](&v10, sel_init);
  if (v4)
  {
    objc_msgSend_array(MEMORY[0x24BDBCE30], v2, v3);
    v5 = objc_claimAutoreleasedReturnValue();
    arg1 = v4->_arg1;
    v4->_arg1 = (NSArray *)v5;

    timedInvokeTimeoutMs = v4->_timedInvokeTimeoutMs;
    v4->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v4->_serverSideProcessingTimeout;
    v4->_serverSideProcessingTimeout = 0;

  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRUnitTestingClusterTestListInt8UArgumentRequestParams *v4;
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

  v4 = objc_alloc_init(MTRUnitTestingClusterTestListInt8UArgumentRequestParams);
  objc_msgSend_arg1(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setArg1_(v4, v8, (uint64_t)v7);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: arg1:%@; >"), v5, self->_arg1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSArray)arg1
{
  return self->_arg1;
}

- (void)setArg1:(NSArray *)arg1
{
  objc_setProperty_nonatomic_copy(self, a2, arg1, 8);
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs
{
  objc_setProperty_nonatomic_copy(self, a2, timedInvokeTimeoutMs, 16);
}

- (NSNumber)serverSideProcessingTimeout
{
  return self->_serverSideProcessingTimeout;
}

- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout
{
  objc_setProperty_nonatomic_copy(self, a2, serverSideProcessingTimeout, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSideProcessingTimeout, 0);
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_arg1, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  unint64_t i;
  void *v20;
  const char *v21;
  uint64_t v22;
  unint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  void *v28;
  char isKindOfClass;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  unsigned int v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v44[8];
  void *v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t *v50;
  _QWORD v51[2];
  __int128 v52;
  _BYTE v53[24];

  v52 = 0uLL;
  v51[0] = 0;
  v51[1] = 0;
  v50 = v51;
  objc_msgSend_arg1(self, a3, (uint64_t)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_count(v7, v8, v9);

  if (v10)
  {
    v11 = (_QWORD *)operator new();
    objc_msgSend_arg1(self, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_count(v14, v15, v16);
    *v11 = &off_2504EF750;
    v11[1] = operator new[]();

    if (v11[1])
    {
      v44[0] = (unint64_t)v11;
      sub_233CAF24C(&v50, v44, (uint64_t *)v44);
      for (i = 0; ; ++i)
      {
        objc_msgSend_arg1(self, v17, v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend_count(v20, v21, v22);

        if (i >= v23)
        {
          v38 = v11[1];
          objc_msgSend_arg1(self, v24, v25);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend_count(v39, v40, v41);
          sub_233BF7114(v44, v38, v42);
          v52 = *(_OWORD *)v44;

          goto LABEL_10;
        }
        objc_msgSend_arg1(self, v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v26, v27, i);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
          break;
        objc_msgSend_arg1(self, v30, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v32, v33, i);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        *(_BYTE *)(v11[1] + i) = objc_msgSend_unsignedCharValue(v34, v35, v36);
      }
      retstr->mError = 47;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-"
                      "generated/MTRCommandPayloadsObjc.mm";
      v37 = 34532;
    }
    else
    {
      retstr->mError = 47;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-"
                      "generated/MTRCommandPayloadsObjc.mm";
      v37 = 34526;
    }
    retstr->mLine = v37;
  }
  else
  {
    v52 = 0uLL;
LABEL_10:
    sub_234118674(0x62FuLL, 0, &v49);
    if (v49)
    {
      sub_234106C48((uint64_t)v44);
      v46 = 0;
      v47 = 0;
      v45 = &unk_250504030;
      v48 = 0;
      sub_233CAF098((uint64_t)&v45, &v49, 0);
      sub_234106CA8((uint64_t)v44, (uint64_t)&v45, 0xFFFFFFFF, (uint64_t)v53);
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      sub_233D402AC((unsigned __int8 **)&v52, (char *)v44, 0x100uLL, (uint64_t)retstr);
      if (!retstr->mError)
      {
        *(_QWORD *)&retstr->mError = 0;
        retstr->mFile = 0;
        *(_QWORD *)&retstr->mLine = 0;
        sub_233C115F0((uint64_t)v44, &v49, retstr);
        if (!retstr->mError)
        {
          sub_233C11670((uint64_t)a4, &v49);
          sub_234106010((uint64_t)a4, 21, 256, retstr);
        }
      }
      v45 = &unk_250504030;
      sub_233CAF128(&v47);
      sub_233CAF128(&v46);
    }
    else
    {
      retstr->mError = 11;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-"
                      "generated/MTRCommandPayloadsObjc.mm";
      retstr->mLine = 34546;
    }
    sub_233CAF128(&v49);
  }
  return (ChipError *)sub_233CAF15C((uint64_t)&v50);
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
    v11 = 34575;
    sub_2340017F0((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_233CAF128(&v15);
  return v8;
}

@end
