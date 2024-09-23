@implementation MTRUnitTestingClusterTestStructArgumentRequestParams

- (MTRUnitTestingClusterTestStructArgumentRequestParams)init
{
  MTRUnitTestingClusterTestStructArgumentRequestParams *v2;
  uint64_t v3;
  MTRUnitTestingClusterSimpleStruct *arg1;
  NSNumber *timedInvokeTimeoutMs;
  NSNumber *serverSideProcessingTimeout;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTRUnitTestingClusterTestStructArgumentRequestParams;
  v2 = -[MTRUnitTestingClusterTestStructArgumentRequestParams init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    arg1 = v2->_arg1;
    v2->_arg1 = (MTRUnitTestingClusterSimpleStruct *)v3;

    timedInvokeTimeoutMs = v2->_timedInvokeTimeoutMs;
    v2->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v2->_serverSideProcessingTimeout;
    v2->_serverSideProcessingTimeout = 0;

  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRUnitTestingClusterTestStructArgumentRequestParams *v4;
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

  v4 = objc_alloc_init(MTRUnitTestingClusterTestStructArgumentRequestParams);
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

- (MTRUnitTestingClusterSimpleStruct)arg1
{
  return self->_arg1;
}

- (void)setArg1:(MTRUnitTestingClusterSimpleStruct *)arg1
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
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  id v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  id v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  int v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  char v79[64];
  void *v80;
  uint64_t v81;
  uint64_t v82;
  char v83;
  uint64_t v84;
  _QWORD *v85;
  _QWORD v86[2];
  __int16 v87;
  char v88;
  __int128 v89;
  __int128 v90;
  char v91;
  int v92;
  uint64_t v93;
  _BYTE v94[24];

  v87 = 0;
  v88 = 0;
  v92 = 0;
  v93 = 0;
  v89 = 0u;
  v90 = 0u;
  v91 = 0;
  v86[0] = 0;
  v86[1] = 0;
  v85 = v86;
  objc_msgSend_arg1(self, a3, (uint64_t)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_a(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v87) = objc_msgSend_unsignedCharValue(v10, v11, v12);

  objc_msgSend_arg1(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_b(v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  HIBYTE(v87) = objc_msgSend_BOOLValue(v18, v19, v20);

  objc_msgSend_arg1(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_c(v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = objc_msgSend_unsignedCharValue(v26, v27, v28);

  objc_msgSend_arg1(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_d(v31, v32, v33);
  v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v37 = objc_msgSend_bytes(v34, v35, v36);
  v40 = objc_msgSend_length(v34, v38, v39);
  sub_233BF7114(v79, v37, v40);

  v89 = *(_OWORD *)v79;
  objc_msgSend_arg1(self, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_e(v43, v44, v45);
  v46 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v49 = objc_msgSend_UTF8String(v46, v47, v48);
  v51 = objc_msgSend_lengthOfBytesUsingEncoding_(v46, v50, 4);
  sub_233CAF22C(v79, v49, v51);

  v90 = *(_OWORD *)v79;
  objc_msgSend_arg1(self, v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_f(v54, v55, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = objc_msgSend_unsignedCharValue(v57, v58, v59);

  objc_msgSend_arg1(self, v60, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_g(v62, v63, v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v65, v66, v67);
  v92 = v68;

  objc_msgSend_arg1(self, v69, v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_h(v71, v72, v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_doubleValue(v74, v75, v76);
  v93 = v77;

  sub_234118674(0x62FuLL, 0, &v84);
  if (v84)
  {
    sub_234106C48((uint64_t)v79);
    v81 = 0;
    v82 = 0;
    v80 = &unk_250504030;
    v83 = 0;
    sub_233CAF098((uint64_t)&v80, &v84, 0);
    sub_234106CA8((uint64_t)v79, (uint64_t)&v80, 0xFFFFFFFF, (uint64_t)v94);
    *(_QWORD *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(_QWORD *)&retstr->mLine = 0;
    sub_233D40BAC((unsigned __int8 *)&v87, v79, 0x100uLL, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      sub_233C115F0((uint64_t)v79, &v84, retstr);
      if (!retstr->mError)
      {
        sub_233C11670((uint64_t)a4, &v84);
        sub_234106010((uint64_t)a4, 21, 256, retstr);
      }
    }
    v80 = &unk_250504030;
    sub_233CAF128(&v82);
    sub_233CAF128(&v81);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 33620;
  }
  sub_233CAF128(&v84);
  return (ChipError *)sub_233CAF15C((uint64_t)&v85);
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
    v11 = 33649;
    sub_2340017F0((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_233CAF128(&v15);
  return v8;
}

@end
