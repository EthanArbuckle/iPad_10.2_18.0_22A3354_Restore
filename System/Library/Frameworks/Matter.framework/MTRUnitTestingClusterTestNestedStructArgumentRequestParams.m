@implementation MTRUnitTestingClusterTestNestedStructArgumentRequestParams

- (MTRUnitTestingClusterTestNestedStructArgumentRequestParams)init
{
  MTRUnitTestingClusterTestNestedStructArgumentRequestParams *v2;
  uint64_t v3;
  MTRUnitTestingClusterNestedStruct *arg1;
  NSNumber *timedInvokeTimeoutMs;
  NSNumber *serverSideProcessingTimeout;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTRUnitTestingClusterTestNestedStructArgumentRequestParams;
  v2 = -[MTRUnitTestingClusterTestNestedStructArgumentRequestParams init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    arg1 = v2->_arg1;
    v2->_arg1 = (MTRUnitTestingClusterNestedStruct *)v3;

    timedInvokeTimeoutMs = v2->_timedInvokeTimeoutMs;
    v2->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v2->_serverSideProcessingTimeout;
    v2->_serverSideProcessingTimeout = 0;

  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRUnitTestingClusterTestNestedStructArgumentRequestParams *v4;
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

  v4 = objc_alloc_init(MTRUnitTestingClusterTestNestedStructArgumentRequestParams);
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

- (MTRUnitTestingClusterNestedStruct)arg1
{
  return self->_arg1;
}

- (void)setArg1:(MTRUnitTestingClusterNestedStruct *)arg1
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
  void *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  id v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  id v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  int v105;
  const char *v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  char v119[64];
  void *v120;
  uint64_t v121;
  uint64_t v122;
  char v123;
  uint64_t v124;
  _QWORD *v125;
  _QWORD v126[2];
  unsigned __int8 v127[8];
  __int16 v128;
  char v129;
  __int128 v130;
  __int128 v131;
  char v132;
  int v133;
  uint64_t v134;
  _BYTE v135[24];

  *(_WORD *)v127 = 0;
  v128 = 0;
  v129 = 0;
  v133 = 0;
  v134 = 0;
  v130 = 0u;
  v131 = 0u;
  v132 = 0;
  v126[0] = 0;
  v126[1] = 0;
  v125 = v126;
  objc_msgSend_arg1(self, a3, (uint64_t)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_a(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v127[0] = objc_msgSend_unsignedCharValue(v10, v11, v12);

  objc_msgSend_arg1(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_b(v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v127[1] = objc_msgSend_BOOLValue(v18, v19, v20);

  objc_msgSend_arg1(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_c(v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_a(v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v128) = objc_msgSend_unsignedCharValue(v29, v30, v31);

  objc_msgSend_arg1(self, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_c(v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_b(v37, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  HIBYTE(v128) = objc_msgSend_BOOLValue(v40, v41, v42);

  objc_msgSend_arg1(self, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_c(v45, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_c(v48, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v129 = objc_msgSend_unsignedCharValue(v51, v52, v53);

  objc_msgSend_arg1(self, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_c(v56, v57, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_d(v59, v60, v61);
  v62 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v65 = objc_msgSend_bytes(v62, v63, v64);
  v68 = objc_msgSend_length(v62, v66, v67);
  sub_233BF7114(v119, v65, v68);

  v130 = *(_OWORD *)v119;
  objc_msgSend_arg1(self, v69, v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_c(v71, v72, v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_e(v74, v75, v76);
  v77 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v80 = objc_msgSend_UTF8String(v77, v78, v79);
  v82 = objc_msgSend_lengthOfBytesUsingEncoding_(v77, v81, 4);
  sub_233CAF22C(v119, v80, v82);

  v131 = *(_OWORD *)v119;
  objc_msgSend_arg1(self, v83, v84);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_c(v85, v86, v87);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_f(v88, v89, v90);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v132 = objc_msgSend_unsignedCharValue(v91, v92, v93);

  objc_msgSend_arg1(self, v94, v95);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_c(v96, v97, v98);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_g(v99, v100, v101);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v102, v103, v104);
  v133 = v105;

  objc_msgSend_arg1(self, v106, v107);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_c(v108, v109, v110);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_h(v111, v112, v113);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_doubleValue(v114, v115, v116);
  v134 = v117;

  sub_234118674(0x62FuLL, 0, &v124);
  if (v124)
  {
    sub_234106C48((uint64_t)v119);
    v121 = 0;
    v122 = 0;
    v120 = &unk_250504030;
    v123 = 0;
    sub_233CAF098((uint64_t)&v120, &v124, 0);
    sub_234106CA8((uint64_t)v119, (uint64_t)&v120, 0xFFFFFFFF, (uint64_t)v135);
    *(_QWORD *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(_QWORD *)&retstr->mLine = 0;
    sub_233D4170C(v127, v119, 0x100uLL, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      sub_233C115F0((uint64_t)v119, &v124, retstr);
      if (!retstr->mError)
      {
        sub_233C11670((uint64_t)a4, &v124);
        sub_234106010((uint64_t)a4, 21, 256, retstr);
      }
    }
    v120 = &unk_250504030;
    sub_233CAF128(&v122);
    sub_233CAF128(&v121);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 34143;
  }
  sub_233CAF128(&v124);
  return (ChipError *)sub_233CAF15C((uint64_t)&v125);
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
    v11 = 34172;
    sub_2340017F0((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_233CAF128(&v15);
  return v8;
}

@end
