@implementation MTRUnitTestingClusterTestListStructArgumentRequestParams

- (MTRUnitTestingClusterTestListStructArgumentRequestParams)init
{
  const char *v2;
  uint64_t v3;
  MTRUnitTestingClusterTestListStructArgumentRequestParams *v4;
  uint64_t v5;
  NSArray *arg1;
  NSNumber *timedInvokeTimeoutMs;
  NSNumber *serverSideProcessingTimeout;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTRUnitTestingClusterTestListStructArgumentRequestParams;
  v4 = -[MTRUnitTestingClusterTestListStructArgumentRequestParams init](&v10, sel_init);
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
  MTRUnitTestingClusterTestListStructArgumentRequestParams *v4;
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

  v4 = objc_alloc_init(MTRUnitTestingClusterTestListStructArgumentRequestParams);
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
  unint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t i;
  void *v22;
  const char *v23;
  uint64_t v24;
  unint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;
  char isKindOfClass;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  id v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  id v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  int v79;
  const char *v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  unsigned int v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v93[8];
  void *v94;
  uint64_t v95;
  uint64_t v96;
  char v97;
  uint64_t v98;
  uint64_t *v99;
  _QWORD v100[2];
  __int128 v101;
  _BYTE v102[32];

  v101 = 0uLL;
  v100[0] = 0;
  v100[1] = 0;
  v99 = v100;
  objc_msgSend_arg1(self, a3, (uint64_t)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_count(v7, v8, v9);

  if (v10)
  {
    v11 = (_QWORD *)operator new();
    objc_msgSend_arg1(self, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend_count(v14, v15, v16);
    sub_233CB24EC(v11, v17);

    if (v11[1])
    {
      v93[0] = (unint64_t)v11;
      sub_233CAF24C(&v99, v93, (uint64_t *)v93);
      v20 = 0;
      for (i = 0; ; ++i)
      {
        objc_msgSend_arg1(self, v18, v19);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend_count(v22, v23, v24);

        if (i >= v25)
        {
          v87 = v11[1];
          objc_msgSend_arg1(self, v26, v27);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          v91 = objc_msgSend_count(v88, v89, v90);
          sub_233CAF22C(v93, v87, v91);
          v101 = *(_OWORD *)v93;

          goto LABEL_10;
        }
        objc_msgSend_arg1(self, v26, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v28, v29, i);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
          break;
        objc_msgSend_arg1(self, v32, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v34, v35, i);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_a(v36, v37, v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_BYTE *)(v11[1] + v20) = objc_msgSend_unsignedCharValue(v39, v40, v41);

        objc_msgSend_b(v36, v42, v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_BYTE *)(v11[1] + v20 + 1) = objc_msgSend_BOOLValue(v44, v45, v46);

        objc_msgSend_c(v36, v47, v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_BYTE *)(v11[1] + v20 + 2) = objc_msgSend_unsignedCharValue(v49, v50, v51);

        objc_msgSend_d(v36, v52, v53);
        v54 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v57 = objc_msgSend_bytes(v54, v55, v56);
        v60 = objc_msgSend_length(v54, v58, v59);
        sub_233BF7114(v93, v57, v60);

        *(_OWORD *)(v11[1] + v20 + 8) = *(_OWORD *)v93;
        objc_msgSend_e(v36, v61, v62);
        v63 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v66 = objc_msgSend_UTF8String(v63, v64, v65);
        v68 = objc_msgSend_lengthOfBytesUsingEncoding_(v63, v67, 4);
        sub_233CAF22C(v93, v66, v68);

        *(_OWORD *)(v11[1] + v20 + 24) = *(_OWORD *)v93;
        objc_msgSend_f(v36, v69, v70);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        *(_BYTE *)(v11[1] + v20 + 40) = objc_msgSend_unsignedCharValue(v71, v72, v73);

        objc_msgSend_g(v36, v74, v75);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_floatValue(v76, v77, v78);
        *(_DWORD *)(v11[1] + v20 + 44) = v79;

        objc_msgSend_h(v36, v80, v81);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_doubleValue(v82, v83, v84);
        *(_QWORD *)(v11[1] + v20 + 48) = v85;

        v20 += 56;
      }
      retstr->mError = 47;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-"
                      "generated/MTRCommandPayloadsObjc.mm";
      v86 = 34321;
    }
    else
    {
      retstr->mError = 47;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-"
                      "generated/MTRCommandPayloadsObjc.mm";
      v86 = 34315;
    }
    retstr->mLine = v86;
  }
  else
  {
    v101 = 0uLL;
LABEL_10:
    sub_234118674(0x62FuLL, 0, &v98);
    if (v98)
    {
      sub_234106C48((uint64_t)v93);
      v95 = 0;
      v96 = 0;
      v94 = &unk_250504030;
      v97 = 0;
      sub_233CAF098((uint64_t)&v94, &v98, 0);
      sub_234106CA8((uint64_t)v93, (uint64_t)&v94, 0xFFFFFFFF, (uint64_t)v102);
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      sub_233D41994((uint64_t)&v101, (char *)v93, 0x100uLL, (uint64_t)retstr);
      if (!retstr->mError)
      {
        *(_QWORD *)&retstr->mError = 0;
        retstr->mFile = 0;
        *(_QWORD *)&retstr->mLine = 0;
        sub_233C115F0((uint64_t)v93, &v98, retstr);
        if (!retstr->mError)
        {
          sub_233C11670((uint64_t)a4, &v98);
          sub_234106010((uint64_t)a4, 21, 256, retstr);
        }
      }
      v94 = &unk_250504030;
      sub_233CAF128(&v96);
      sub_233CAF128(&v95);
    }
    else
    {
      retstr->mError = 11;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-"
                      "generated/MTRCommandPayloadsObjc.mm";
      retstr->mLine = 34342;
    }
    sub_233CAF128(&v98);
  }
  return (ChipError *)sub_233CAF15C((uint64_t)&v99);
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
    v11 = 34371;
    sub_2340017F0((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_233CAF128(&v15);
  return v8;
}

@end
