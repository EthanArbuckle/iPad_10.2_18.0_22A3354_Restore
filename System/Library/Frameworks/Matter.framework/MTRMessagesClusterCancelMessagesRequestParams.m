@implementation MTRMessagesClusterCancelMessagesRequestParams

- (MTRMessagesClusterCancelMessagesRequestParams)init
{
  const char *v2;
  uint64_t v3;
  MTRMessagesClusterCancelMessagesRequestParams *v4;
  uint64_t v5;
  NSArray *messageIDs;
  NSNumber *timedInvokeTimeoutMs;
  NSNumber *serverSideProcessingTimeout;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTRMessagesClusterCancelMessagesRequestParams;
  v4 = -[MTRMessagesClusterCancelMessagesRequestParams init](&v10, sel_init);
  if (v4)
  {
    objc_msgSend_array(MEMORY[0x24BDBCE30], v2, v3);
    v5 = objc_claimAutoreleasedReturnValue();
    messageIDs = v4->_messageIDs;
    v4->_messageIDs = (NSArray *)v5;

    timedInvokeTimeoutMs = v4->_timedInvokeTimeoutMs;
    v4->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v4->_serverSideProcessingTimeout;
    v4->_serverSideProcessingTimeout = 0;

  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRMessagesClusterCancelMessagesRequestParams *v4;
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

  v4 = objc_alloc_init(MTRMessagesClusterCancelMessagesRequestParams);
  objc_msgSend_messageIDs(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMessageIDs_(v4, v8, (uint64_t)v7);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: messageIDs:%@; >"), v5, self->_messageIDs);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSArray)messageIDs
{
  return self->_messageIDs;
}

- (void)setMessageIDs:(id)a3
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
  objc_storeStrong((id *)&self->_messageIDs, 0);
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
  uint64_t v17;
  void *v18;
  void *v19;
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
  id v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  unsigned int v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v52[8];
  void *v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  uint64_t *v58;
  _QWORD v59[2];
  uint64_t v60[3];
  _BYTE v61[24];

  *(_OWORD *)v60 = 0uLL;
  v59[0] = 0;
  v59[1] = 0;
  v58 = v59;
  objc_msgSend_messageIDs(self, a3, (uint64_t)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_count(v7, v8, v9);

  if (v10)
  {
    v11 = (_QWORD *)operator new();
    objc_msgSend_messageIDs(self, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend_count(v14, v15, v16);
    *v11 = &off_2504EF408;
    v18 = (void *)operator new[]();
    v19 = v18;
    if (v17)
      bzero(v18, 16 * v17);
    v11[1] = v19;

    if (v11[1])
    {
      v52[0] = (unint64_t)v11;
      sub_233CAF24C(&v58, v52, (uint64_t *)v52);
      for (i = 0; ; ++i)
      {
        objc_msgSend_messageIDs(self, v20, v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend_count(v23, v24, v25);

        if (i >= v26)
        {
          v46 = v11[1];
          objc_msgSend_messageIDs(self, v27, v28);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend_count(v47, v48, v49);
          sub_233CAF22C(v52, v46, v50);
          *(_OWORD *)v60 = *(_OWORD *)v52;

          goto LABEL_12;
        }
        objc_msgSend_messageIDs(self, v27, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v29, v30, i);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
          break;
        objc_msgSend_messageIDs(self, v33, v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v35, v36, i);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        v38 = objc_retainAutorelease(v37);
        v41 = objc_msgSend_bytes(v38, v39, v40);
        v44 = objc_msgSend_length(v38, v42, v43);
        sub_233BF7114(v52, v41, v44);

        *(_OWORD *)(v11[1] + 16 * i) = *(_OWORD *)v52;
      }
      retstr->mError = 47;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-"
                      "generated/MTRCommandPayloadsObjc.mm";
      v45 = 15927;
    }
    else
    {
      retstr->mError = 47;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-"
                      "generated/MTRCommandPayloadsObjc.mm";
      v45 = 15921;
    }
    retstr->mLine = v45;
  }
  else
  {
    *(_OWORD *)v60 = 0uLL;
LABEL_12:
    sub_234118674(0x62FuLL, 0, &v57);
    if (v57)
    {
      sub_234106C48((uint64_t)v52);
      v54 = 0;
      v55 = 0;
      v53 = &unk_250504030;
      v56 = 0;
      sub_233CAF098((uint64_t)&v53, &v57, 0);
      sub_234106CA8((uint64_t)v52, (uint64_t)&v53, 0xFFFFFFFF, (uint64_t)v61);
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      sub_233D1E294(v60, (char *)v52, 0x100uLL, (uint64_t)retstr);
      if (!retstr->mError)
      {
        *(_QWORD *)&retstr->mError = 0;
        retstr->mFile = 0;
        *(_QWORD *)&retstr->mLine = 0;
        sub_233C115F0((uint64_t)v52, &v57, retstr);
        if (!retstr->mError)
        {
          sub_233C11670((uint64_t)a4, &v57);
          sub_234106010((uint64_t)a4, 21, 256, retstr);
        }
      }
      v53 = &unk_250504030;
      sub_233CAF128(&v55);
      sub_233CAF128(&v54);
    }
    else
    {
      retstr->mError = 11;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-"
                      "generated/MTRCommandPayloadsObjc.mm";
      retstr->mLine = 15941;
    }
    sub_233CAF128(&v57);
  }
  return (ChipError *)sub_233CAF15C((uint64_t)&v58);
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
    v11 = 15970;
    sub_2340017F0((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_233CAF128(&v15);
  return v8;
}

@end
