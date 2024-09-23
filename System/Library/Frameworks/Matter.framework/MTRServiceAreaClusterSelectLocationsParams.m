@implementation MTRServiceAreaClusterSelectLocationsParams

- (MTRServiceAreaClusterSelectLocationsParams)init
{
  MTRServiceAreaClusterSelectLocationsParams *v2;
  MTRServiceAreaClusterSelectLocationsParams *v3;
  NSArray *newLocations;
  NSNumber *timedInvokeTimeoutMs;
  NSNumber *serverSideProcessingTimeout;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTRServiceAreaClusterSelectLocationsParams;
  v2 = -[MTRServiceAreaClusterSelectLocationsParams init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    newLocations = v2->_newLocations;
    v2->_newLocations = 0;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRServiceAreaClusterSelectLocationsParams *v4;
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

  v4 = objc_alloc_init(MTRServiceAreaClusterSelectLocationsParams);
  objc_msgSend_getNewLocations(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNewLocations_(v4, v8, (uint64_t)v7);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: newLocations:%@; >"), v5, self->_newLocations);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSArray)getNewLocations
{
  return self->_newLocations;
}

- (void)setNewLocations:(id)a3
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
  objc_storeStrong((id *)&self->_newLocations, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  unint64_t i;
  void *v23;
  const char *v24;
  uint64_t v25;
  unint64_t v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  void *v31;
  char isKindOfClass;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  unsigned int v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v47[8];
  void *v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  uint64_t *v53;
  _QWORD v54[2];
  __int128 v55;
  char v56;
  _BYTE v57[24];

  LOBYTE(v55) = 0;
  v56 = 0;
  v54[0] = 0;
  v54[1] = 0;
  v53 = v54;
  objc_msgSend_getNewLocations(self, a3, (uint64_t)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_11;
  v55 = 0uLL;
  v56 = 1;
  objc_msgSend_getNewLocations(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_count(v10, v11, v12);

  if (!v13)
  {
    v55 = 0uLL;
LABEL_11:
    sub_234118674(0x62FuLL, 0, &v52);
    if (v52)
    {
      sub_234106C48((uint64_t)v47);
      v49 = 0;
      v50 = 0;
      v48 = &unk_250504030;
      v51 = 0;
      sub_233CAF098((uint64_t)&v48, &v52, 0);
      sub_234106CA8((uint64_t)v47, (uint64_t)&v48, 0xFFFFFFFF, (uint64_t)v57);
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      sub_233D2A328((uint64_t)&v55, (char *)v47, 0x100uLL, (uint64_t)retstr);
      if (!retstr->mError)
      {
        *(_QWORD *)&retstr->mError = 0;
        retstr->mFile = 0;
        *(_QWORD *)&retstr->mLine = 0;
        sub_233C115F0((uint64_t)v47, &v52, retstr);
        if (!retstr->mError)
        {
          sub_233C11670((uint64_t)a4, &v52);
          sub_234106010((uint64_t)a4, 21, 256, retstr);
        }
      }
      v48 = &unk_250504030;
      sub_233CAF128(&v50);
      sub_233CAF128(&v49);
    }
    else
    {
      retstr->mError = 11;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-"
                      "generated/MTRCommandPayloadsObjc.mm";
      retstr->mLine = 21405;
    }
    sub_233CAF128(&v52);
    return (ChipError *)sub_233CAF15C((uint64_t)&v53);
  }
  v14 = (_QWORD *)operator new();
  objc_msgSend_getNewLocations(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_count(v17, v18, v19);
  *v14 = &off_2504EF520;
  v14[1] = operator new[]();

  if (v14[1])
  {
    v47[0] = (unint64_t)v14;
    sub_233CAF24C(&v53, v47, (uint64_t *)v47);
    for (i = 0; ; ++i)
    {
      objc_msgSend_getNewLocations(self, v20, v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend_count(v23, v24, v25);

      if (i >= v26)
      {
        v41 = v14[1];
        objc_msgSend_getNewLocations(self, v27, v28);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend_count(v42, v43, v44);
        sub_233CAF22C(v47, v41, v45);
        v55 = *(_OWORD *)v47;

        goto LABEL_11;
      }
      objc_msgSend_getNewLocations(self, v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v29, v30, i);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
        break;
      objc_msgSend_getNewLocations(self, v33, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v35, v36, i);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)(v14[1] + 4 * i) = objc_msgSend_unsignedIntValue(v37, v38, v39);
    }
    retstr->mError = 47;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    v40 = 21390;
  }
  else
  {
    retstr->mError = 47;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    v40 = 21384;
  }
  retstr->mLine = v40;
  return (ChipError *)sub_233CAF15C((uint64_t)&v53);
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
    v11 = 21434;
    sub_2340017F0((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_233CAF128(&v15);
  return v8;
}

@end
