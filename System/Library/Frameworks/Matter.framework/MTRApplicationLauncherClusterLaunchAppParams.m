@implementation MTRApplicationLauncherClusterLaunchAppParams

- (MTRApplicationLauncherClusterLaunchAppParams)init
{
  MTRApplicationLauncherClusterLaunchAppParams *v2;
  MTRApplicationLauncherClusterLaunchAppParams *v3;
  MTRApplicationLauncherClusterApplicationStruct *application;
  NSData *data;
  NSNumber *timedInvokeTimeoutMs;
  NSNumber *serverSideProcessingTimeout;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTRApplicationLauncherClusterLaunchAppParams;
  v2 = -[MTRApplicationLauncherClusterLaunchAppParams init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    application = v2->_application;
    v2->_application = 0;

    data = v3->_data;
    v3->_data = 0;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRApplicationLauncherClusterLaunchAppParams *v4;
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

  v4 = objc_alloc_init(MTRApplicationLauncherClusterLaunchAppParams);
  objc_msgSend_application(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setApplication_(v4, v8, (uint64_t)v7);

  objc_msgSend_data(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setData_(v4, v12, (uint64_t)v11);

  objc_msgSend_timedInvokeTimeoutMs(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v16, (uint64_t)v15);

  objc_msgSend_serverSideProcessingTimeout(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setServerSideProcessingTimeout_(v4, v20, (uint64_t)v19);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  MTRApplicationLauncherClusterApplicationStruct *application;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  application = self->_application;
  objc_msgSend_base64EncodedStringWithOptions_(self->_data, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v9, (uint64_t)CFSTR("<%@: application:%@; data:%@; >"), v5, application, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (MTRApplicationLauncherClusterApplicationStruct)application
{
  return self->_application;
}

- (void)setApplication:(MTRApplicationLauncherClusterApplicationStruct *)application
{
  objc_setProperty_nonatomic_copy(self, a2, application, 8);
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(NSData *)data
{
  objc_setProperty_nonatomic_copy(self, a2, data, 16);
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs
{
  objc_setProperty_nonatomic_copy(self, a2, timedInvokeTimeoutMs, 24);
}

- (NSNumber)serverSideProcessingTimeout
{
  return self->_serverSideProcessingTimeout;
}

- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout
{
  objc_setProperty_nonatomic_copy(self, a2, serverSideProcessingTimeout, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSideProcessingTimeout, 0);
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_application, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  id v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  id v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  char v38[64];
  void *v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  _QWORD *v44;
  _QWORD v45[2];
  char v46[8];
  uint64_t v47;
  __int128 v48;
  char v49;
  __int128 v50;
  _BYTE v51[24];

  v46[0] = 0;
  v49 = 0;
  v45[0] = 0;
  v45[1] = 0;
  v44 = v45;
  objc_msgSend_application(self, a3, (uint64_t)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v46[0] = 1;
    v48 = 0uLL;
    v47 = 0;
    objc_msgSend_application(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_catalogVendorID(v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LOWORD(v47) = objc_msgSend_unsignedShortValue(v13, v14, v15);

    objc_msgSend_application(self, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_applicationID(v18, v19, v20);
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v24 = objc_msgSend_UTF8String(v21, v22, v23);
    v26 = objc_msgSend_lengthOfBytesUsingEncoding_(v21, v25, 4);
    sub_233CAF22C(v38, v24, v26);

    v48 = *(_OWORD *)v38;
  }
  objc_msgSend_data(self, v8, v9);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    v49 = 1;
    v50 = 0uLL;
    objc_msgSend_data(self, v28, v29);
    v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v33 = objc_msgSend_bytes(v30, v31, v32);
    v36 = objc_msgSend_length(v30, v34, v35);
    sub_233BF7114(v38, v33, v36);

    v50 = *(_OWORD *)v38;
  }
  sub_234118674(0x62FuLL, 0, &v43);
  if (v43)
  {
    sub_234106C48((uint64_t)v38);
    v40 = 0;
    v41 = 0;
    v39 = &unk_250504030;
    v42 = 0;
    sub_233CAF098((uint64_t)&v39, &v43, 0);
    sub_234106CA8((uint64_t)v38, (uint64_t)&v39, 0xFFFFFFFF, (uint64_t)v51);
    *(_QWORD *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(_QWORD *)&retstr->mLine = 0;
    sub_233D3A73C(v46, v38, 0x100uLL, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      sub_233C115F0((uint64_t)v38, &v43, retstr);
      if (!retstr->mError)
      {
        sub_233C11670((uint64_t)a4, &v43);
        sub_234106010((uint64_t)a4, 21, 256, retstr);
      }
    }
    v39 = &unk_250504030;
    sub_233CAF128(&v41);
    sub_233CAF128(&v40);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 29516;
  }
  sub_233CAF128(&v43);
  return (ChipError *)sub_233CAF15C((uint64_t)&v44);
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
    v11 = 29545;
    sub_2340017F0((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_233CAF128(&v15);
  return v8;
}

@end
