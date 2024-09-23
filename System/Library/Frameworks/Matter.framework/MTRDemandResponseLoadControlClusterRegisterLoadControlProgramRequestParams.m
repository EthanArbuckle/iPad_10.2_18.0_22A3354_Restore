@implementation MTRDemandResponseLoadControlClusterRegisterLoadControlProgramRequestParams

- (MTRDemandResponseLoadControlClusterRegisterLoadControlProgramRequestParams)init
{
  MTRDemandResponseLoadControlClusterRegisterLoadControlProgramRequestParams *v2;
  uint64_t v3;
  MTRDemandResponseLoadControlClusterLoadControlProgramStruct *loadControlProgram;
  NSNumber *timedInvokeTimeoutMs;
  NSNumber *serverSideProcessingTimeout;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTRDemandResponseLoadControlClusterRegisterLoadControlProgramRequestParams;
  v2 = -[MTRDemandResponseLoadControlClusterRegisterLoadControlProgramRequestParams init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    loadControlProgram = v2->_loadControlProgram;
    v2->_loadControlProgram = (MTRDemandResponseLoadControlClusterLoadControlProgramStruct *)v3;

    timedInvokeTimeoutMs = v2->_timedInvokeTimeoutMs;
    v2->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v2->_serverSideProcessingTimeout;
    v2->_serverSideProcessingTimeout = 0;

  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRDemandResponseLoadControlClusterRegisterLoadControlProgramRequestParams *v4;
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

  v4 = objc_alloc_init(MTRDemandResponseLoadControlClusterRegisterLoadControlProgramRequestParams);
  objc_msgSend_loadControlProgram(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLoadControlProgram_(v4, v8, (uint64_t)v7);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: loadControlProgram:%@; >"), v5, self->_loadControlProgram);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (MTRDemandResponseLoadControlClusterLoadControlProgramStruct)loadControlProgram
{
  return self->_loadControlProgram;
}

- (void)setLoadControlProgram:(id)a3
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
  objc_storeStrong((id *)&self->_loadControlProgram, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  void *v7;
  const char *v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  id v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
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
  void *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  char v67[64];
  void *v68;
  uint64_t v69;
  uint64_t v70;
  char v71;
  uint64_t v72;
  _QWORD *v73;
  _QWORD v74[2];
  _BYTE v75[38];
  _BYTE v76[24];

  memset(v75, 0, sizeof(v75));
  v74[0] = 0;
  v74[1] = 0;
  v73 = v74;
  objc_msgSend_loadControlProgram(self, a3, (uint64_t)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_programID(v7, v8, v9);
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13 = objc_msgSend_bytes(v10, v11, v12);
  v16 = objc_msgSend_length(v10, v14, v15);
  sub_233BF7114(v67, v13, v16);

  *(_OWORD *)v75 = *(_OWORD *)v67;
  objc_msgSend_loadControlProgram(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(v19, v20, v21);
  v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v25 = objc_msgSend_UTF8String(v22, v23, v24);
  v27 = objc_msgSend_lengthOfBytesUsingEncoding_(v22, v26, 4);
  sub_233CAF22C(v67, v25, v27);

  *(_OWORD *)&v75[16] = *(_OWORD *)v67;
  objc_msgSend_loadControlProgram(self, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_enrollmentGroup(v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    *(_WORD *)&v75[32] = 256;
    objc_msgSend_loadControlProgram(self, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_enrollmentGroup(v36, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v75[32] = objc_msgSend_unsignedCharValue(v39, v40, v41);

  }
  objc_msgSend_loadControlProgram(self, v34, v35);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_randomStartMinutes(v42, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
  {
    *(_WORD *)&v75[34] = 256;
    objc_msgSend_loadControlProgram(self, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_randomStartMinutes(v48, v49, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v75[34] = objc_msgSend_unsignedCharValue(v51, v52, v53);

  }
  objc_msgSend_loadControlProgram(self, v46, v47);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_randomDurationMinutes(v54, v55, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  if (v57)
  {
    *(_WORD *)&v75[36] = 256;
    objc_msgSend_loadControlProgram(self, v58, v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_randomDurationMinutes(v60, v61, v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v75[36] = objc_msgSend_unsignedCharValue(v63, v64, v65);

  }
  sub_234118674(0x62FuLL, 0, &v72);
  if (v72)
  {
    sub_234106C48((uint64_t)v67);
    v69 = 0;
    v70 = 0;
    v68 = &unk_250504030;
    v71 = 0;
    sub_233CAF098((uint64_t)&v68, &v72, 0);
    sub_234106CA8((uint64_t)v67, (uint64_t)&v68, 0xFFFFFFFF, (uint64_t)v76);
    *(_QWORD *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(_QWORD *)&retstr->mLine = 0;
    sub_233D1CCD8((uint64_t)v75, v67, 0x100uLL, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      sub_233C115F0((uint64_t)v67, &v72, retstr);
      if (!retstr->mError)
      {
        sub_233C11670((uint64_t)a4, &v72);
        sub_234106010((uint64_t)a4, 21, 256, retstr);
      }
    }
    v68 = &unk_250504030;
    sub_233CAF128(&v70);
    sub_233CAF128(&v69);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 15272;
  }
  sub_233CAF128(&v72);
  return (ChipError *)sub_233CAF15C((uint64_t)&v73);
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
    v11 = 15301;
    sub_2340017F0((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_233CAF128(&v15);
  return v8;
}

@end
