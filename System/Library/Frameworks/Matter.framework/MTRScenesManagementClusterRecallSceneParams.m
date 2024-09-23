@implementation MTRScenesManagementClusterRecallSceneParams

- (MTRScenesManagementClusterRecallSceneParams)init
{
  MTRScenesManagementClusterRecallSceneParams *v2;
  MTRScenesManagementClusterRecallSceneParams *v3;
  NSNumber *groupID;
  NSNumber *sceneID;
  NSNumber *transitionTime;
  NSNumber *timedInvokeTimeoutMs;
  NSNumber *serverSideProcessingTimeout;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTRScenesManagementClusterRecallSceneParams;
  v2 = -[MTRScenesManagementClusterRecallSceneParams init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    groupID = v2->_groupID;
    v2->_groupID = (NSNumber *)&unk_250591A40;

    sceneID = v3->_sceneID;
    v3->_sceneID = (NSNumber *)&unk_250591A40;

    transitionTime = v3->_transitionTime;
    v3->_transitionTime = 0;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRScenesManagementClusterRecallSceneParams *v4;
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
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;

  v4 = objc_alloc_init(MTRScenesManagementClusterRecallSceneParams);
  objc_msgSend_groupID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setGroupID_(v4, v8, (uint64_t)v7);

  objc_msgSend_sceneID(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSceneID_(v4, v12, (uint64_t)v11);

  objc_msgSend_transitionTime(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTransitionTime_(v4, v16, (uint64_t)v15);

  objc_msgSend_timedInvokeTimeoutMs(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v20, (uint64_t)v19);

  objc_msgSend_serverSideProcessingTimeout(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setServerSideProcessingTimeout_(v4, v24, (uint64_t)v23);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: groupID:%@; sceneID:%@; transitionTime:%@; >"),
    v5,
    self->_groupID,
    self->_sceneID,
    self->_transitionTime);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)sceneID
{
  return self->_sceneID;
}

- (void)setSceneID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)transitionTime
{
  return self->_transitionTime;
}

- (void)setTransitionTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)serverSideProcessingTimeout
{
  return self->_serverSideProcessingTimeout;
}

- (void)setServerSideProcessingTimeout:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSideProcessingTimeout, 0);
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_transitionTime, 0);
  objc_storeStrong((id *)&self->_sceneID, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  char v27[64];
  void *v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  _QWORD *v33;
  _QWORD v34[2];
  unsigned __int16 v35;
  char v36;
  char v37;
  uint64_t v38;
  _BYTE v39[24];

  v35 = 0;
  v36 = 0;
  v37 = 0;
  v34[0] = 0;
  v34[1] = 0;
  v33 = v34;
  objc_msgSend_groupID(self, a3, (uint64_t)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend_unsignedShortValue(v7, v8, v9);

  objc_msgSend_sceneID(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend_unsignedCharValue(v12, v13, v14);

  objc_msgSend_transitionTime(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v37 = 1;
    v38 = 0;
    objc_msgSend_transitionTime(self, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      LODWORD(v38) = 0;
      BYTE4(v38) = 1;
      objc_msgSend_transitionTime(self, v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v38) = objc_msgSend_unsignedIntValue(v23, v24, v25);

    }
  }
  sub_234118674(0x62FuLL, 0, &v32);
  if (v32)
  {
    sub_234106C48((uint64_t)v27);
    v29 = 0;
    v30 = 0;
    v28 = &unk_250504030;
    v31 = 0;
    sub_233CAF098((uint64_t)&v28, &v32, 0);
    sub_234106CA8((uint64_t)v27, (uint64_t)&v28, 0xFFFFFFFF, (uint64_t)v39);
    *(_QWORD *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(_QWORD *)&retstr->mLine = 0;
    sub_233D1831C(&v35, v27, 0x100uLL, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      sub_233C115F0((uint64_t)v27, &v32, retstr);
      if (!retstr->mError)
      {
        sub_233C11670((uint64_t)a4, &v32);
        sub_234106010((uint64_t)a4, 21, 256, retstr);
      }
    }
    v28 = &unk_250504030;
    sub_233CAF128(&v30);
    sub_233CAF128(&v29);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 14112;
  }
  sub_233CAF128(&v32);
  return (ChipError *)sub_233CAF15C((uint64_t)&v33);
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
    v11 = 14141;
    sub_2340017F0((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_233CAF128(&v15);
  return v8;
}

@end
