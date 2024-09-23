@implementation MTRDemandResponseLoadControlClusterRemoveLoadControlEventRequestParams

- (MTRDemandResponseLoadControlClusterRemoveLoadControlEventRequestParams)init
{
  const char *v2;
  uint64_t v3;
  MTRDemandResponseLoadControlClusterRemoveLoadControlEventRequestParams *v4;
  uint64_t v5;
  NSData *eventID;
  NSNumber *cancelControl;
  NSNumber *timedInvokeTimeoutMs;
  NSNumber *serverSideProcessingTimeout;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MTRDemandResponseLoadControlClusterRemoveLoadControlEventRequestParams;
  v4 = -[MTRDemandResponseLoadControlClusterRemoveLoadControlEventRequestParams init](&v11, sel_init);
  if (v4)
  {
    objc_msgSend_data(MEMORY[0x24BDBCE50], v2, v3);
    v5 = objc_claimAutoreleasedReturnValue();
    eventID = v4->_eventID;
    v4->_eventID = (NSData *)v5;

    cancelControl = v4->_cancelControl;
    v4->_cancelControl = (NSNumber *)&unk_250591A40;

    timedInvokeTimeoutMs = v4->_timedInvokeTimeoutMs;
    v4->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v4->_serverSideProcessingTimeout;
    v4->_serverSideProcessingTimeout = 0;

  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRDemandResponseLoadControlClusterRemoveLoadControlEventRequestParams *v4;
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

  v4 = objc_alloc_init(MTRDemandResponseLoadControlClusterRemoveLoadControlEventRequestParams);
  objc_msgSend_eventID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEventID_(v4, v8, (uint64_t)v7);

  objc_msgSend_cancelControl(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCancelControl_(v4, v12, (uint64_t)v11);

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
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_base64EncodedStringWithOptions_(self->_eventID, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v8, (uint64_t)CFSTR("<%@: eventID:%@; cancelControl:%@; >"),
    v5,
    v7,
    self->_cancelControl);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSData)eventID
{
  return self->_eventID;
}

- (void)setEventID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)cancelControl
{
  return self->_cancelControl;
}

- (void)setCancelControl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)serverSideProcessingTimeout
{
  return self->_serverSideProcessingTimeout;
}

- (void)setServerSideProcessingTimeout:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSideProcessingTimeout, 0);
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_cancelControl, 0);
  objc_storeStrong((id *)&self->_eventID, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  char v20[64];
  void *v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD v27[2];
  __int128 v28;
  __int16 v29;
  _BYTE v30[24];

  v28 = 0uLL;
  v29 = 0;
  v27[0] = 0;
  v27[1] = 0;
  v26 = v27;
  objc_msgSend_eventID(self, a3, (uint64_t)a4);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = objc_msgSend_bytes(v7, v8, v9);
  v13 = objc_msgSend_length(v7, v11, v12);
  sub_233BF7114(v20, v10, v13);

  v28 = *(_OWORD *)v20;
  objc_msgSend_cancelControl(self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend_unsignedShortValue(v16, v17, v18);

  sub_234118674(0x62FuLL, 0, &v25);
  if (v25)
  {
    sub_234106C48((uint64_t)v20);
    v22 = 0;
    v23 = 0;
    v21 = &unk_250504030;
    v24 = 0;
    sub_233CAF098((uint64_t)&v21, &v25, 0);
    sub_234106CA8((uint64_t)v20, (uint64_t)&v21, 0xFFFFFFFF, (uint64_t)v30);
    *(_QWORD *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(_QWORD *)&retstr->mLine = 0;
    sub_233D1D164((uint64_t)&v28, v20, 0x100uLL, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      sub_233C115F0((uint64_t)v20, &v25, retstr);
      if (!retstr->mError)
      {
        sub_233C11670((uint64_t)a4, &v25);
        sub_234106010((uint64_t)a4, 21, 256, retstr);
      }
    }
    v21 = &unk_250504030;
    sub_233CAF128(&v23);
    sub_233CAF128(&v22);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 15612;
  }
  sub_233CAF128(&v25);
  return (ChipError *)sub_233CAF15C((uint64_t)&v26);
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
    v11 = 15641;
    sub_2340017F0((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_233CAF128(&v15);
  return v8;
}

@end
