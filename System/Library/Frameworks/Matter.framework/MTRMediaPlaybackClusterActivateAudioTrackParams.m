@implementation MTRMediaPlaybackClusterActivateAudioTrackParams

- (MTRMediaPlaybackClusterActivateAudioTrackParams)init
{
  MTRMediaPlaybackClusterActivateAudioTrackParams *v2;
  MTRMediaPlaybackClusterActivateAudioTrackParams *v3;
  NSString *trackID;
  NSNumber *audioOutputIndex;
  NSNumber *timedInvokeTimeoutMs;
  NSNumber *serverSideProcessingTimeout;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTRMediaPlaybackClusterActivateAudioTrackParams;
  v2 = -[MTRMediaPlaybackClusterActivateAudioTrackParams init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    trackID = v2->_trackID;
    v2->_trackID = (NSString *)&stru_2505249E8;

    audioOutputIndex = v3->_audioOutputIndex;
    v3->_audioOutputIndex = (NSNumber *)&unk_250591A40;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRMediaPlaybackClusterActivateAudioTrackParams *v4;
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

  v4 = objc_alloc_init(MTRMediaPlaybackClusterActivateAudioTrackParams);
  objc_msgSend_trackID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTrackID_(v4, v8, (uint64_t)v7);

  objc_msgSend_audioOutputIndex(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAudioOutputIndex_(v4, v12, (uint64_t)v11);

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

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: trackID:%@; audioOutputIndex:%@; >"),
    v5,
    self->_trackID,
    self->_audioOutputIndex);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)trackID
{
  return self->_trackID;
}

- (void)setTrackID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)audioOutputIndex
{
  return self->_audioOutputIndex;
}

- (void)setAudioOutputIndex:(id)a3
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
  objc_storeStrong((id *)&self->_audioOutputIndex, 0);
  objc_storeStrong((id *)&self->_trackID, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  char v19[64];
  void *v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD v26[2];
  __int128 v27;
  char v28;
  _BYTE v29[24];

  v27 = 0uLL;
  v28 = 0;
  v26[0] = 0;
  v26[1] = 0;
  v25 = v26;
  objc_msgSend_trackID(self, a3, (uint64_t)a4);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = objc_msgSend_UTF8String(v7, v8, v9);
  v12 = objc_msgSend_lengthOfBytesUsingEncoding_(v7, v11, 4);
  sub_233CAF22C(v19, v10, v12);

  v27 = *(_OWORD *)v19;
  objc_msgSend_audioOutputIndex(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend_unsignedCharValue(v15, v16, v17);

  sub_234118674(0x62FuLL, 0, &v24);
  if (v24)
  {
    sub_234106C48((uint64_t)v19);
    v21 = 0;
    v22 = 0;
    v20 = &unk_250504030;
    v23 = 0;
    sub_233CAF098((uint64_t)&v20, &v24, 0);
    sub_234106CA8((uint64_t)v19, (uint64_t)&v20, 0xFFFFFFFF, (uint64_t)v29);
    *(_QWORD *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(_QWORD *)&retstr->mLine = 0;
    sub_233D37218((uint64_t)&v27, v19, 0x100uLL, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      sub_233C115F0((uint64_t)v19, &v24, retstr);
      if (!retstr->mError)
      {
        sub_233C11670((uint64_t)a4, &v24);
        sub_234106010((uint64_t)a4, 21, 256, retstr);
      }
    }
    v20 = &unk_250504030;
    sub_233CAF128(&v22);
    sub_233CAF128(&v21);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 28044;
  }
  sub_233CAF128(&v24);
  return (ChipError *)sub_233CAF15C((uint64_t)&v25);
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
    v11 = 28073;
    sub_2340017F0((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_233CAF128(&v15);
  return v8;
}

@end
