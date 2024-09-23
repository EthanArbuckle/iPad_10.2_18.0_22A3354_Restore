@implementation MTROTASoftwareUpdateRequestorClusterAnnounceOTAProviderParams

- (MTROTASoftwareUpdateRequestorClusterAnnounceOTAProviderParams)init
{
  MTROTASoftwareUpdateRequestorClusterAnnounceOTAProviderParams *v2;
  MTROTASoftwareUpdateRequestorClusterAnnounceOTAProviderParams *v3;
  NSNumber *providerNodeID;
  NSNumber *vendorID;
  NSNumber *announcementReason;
  NSData *metadataForNode;
  NSNumber *endpoint;
  NSNumber *timedInvokeTimeoutMs;
  NSNumber *serverSideProcessingTimeout;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MTROTASoftwareUpdateRequestorClusterAnnounceOTAProviderParams;
  v2 = -[MTROTASoftwareUpdateRequestorClusterAnnounceOTAProviderParams init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    providerNodeID = v2->_providerNodeID;
    v2->_providerNodeID = (NSNumber *)&unk_250591A40;

    vendorID = v3->_vendorID;
    v3->_vendorID = (NSNumber *)&unk_250591A40;

    announcementReason = v3->_announcementReason;
    v3->_announcementReason = (NSNumber *)&unk_250591A40;

    metadataForNode = v3->_metadataForNode;
    v3->_metadataForNode = 0;

    endpoint = v3->_endpoint;
    v3->_endpoint = (NSNumber *)&unk_250591A40;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTROTASoftwareUpdateRequestorClusterAnnounceOTAProviderParams *v4;
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
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;

  v4 = objc_alloc_init(MTROTASoftwareUpdateRequestorClusterAnnounceOTAProviderParams);
  objc_msgSend_providerNodeID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setProviderNodeID_(v4, v8, (uint64_t)v7);

  objc_msgSend_vendorID(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setVendorID_(v4, v12, (uint64_t)v11);

  objc_msgSend_announcementReason(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAnnouncementReason_(v4, v16, (uint64_t)v15);

  objc_msgSend_metadataForNode(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMetadataForNode_(v4, v20, (uint64_t)v19);

  objc_msgSend_endpoint(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEndpoint_(v4, v24, (uint64_t)v23);

  objc_msgSend_timedInvokeTimeoutMs(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v28, (uint64_t)v27);

  objc_msgSend_serverSideProcessingTimeout(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setServerSideProcessingTimeout_(v4, v32, (uint64_t)v31);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSNumber *providerNodeID;
  NSNumber *vendorID;
  NSNumber *announcementReason;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  providerNodeID = self->_providerNodeID;
  vendorID = self->_vendorID;
  announcementReason = self->_announcementReason;
  objc_msgSend_base64EncodedStringWithOptions_(self->_metadataForNode, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v11, (uint64_t)CFSTR("<%@: providerNodeID:%@; vendorID:%@; announcementReason:%@; metadataForNode:%@; endpoint:%@; >"),
    v5,
    providerNodeID,
    vendorID,
    announcementReason,
    v10,
    self->_endpoint);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSNumber)providerNodeID
{
  return self->_providerNodeID;
}

- (void)setProviderNodeID:(NSNumber *)providerNodeID
{
  objc_setProperty_nonatomic_copy(self, a2, providerNodeID, 8);
}

- (NSNumber)vendorID
{
  return self->_vendorID;
}

- (void)setVendorID:(NSNumber *)vendorID
{
  objc_setProperty_nonatomic_copy(self, a2, vendorID, 16);
}

- (NSNumber)announcementReason
{
  return self->_announcementReason;
}

- (void)setAnnouncementReason:(NSNumber *)announcementReason
{
  objc_setProperty_nonatomic_copy(self, a2, announcementReason, 24);
}

- (NSData)metadataForNode
{
  return self->_metadataForNode;
}

- (void)setMetadataForNode:(NSData *)metadataForNode
{
  objc_setProperty_nonatomic_copy(self, a2, metadataForNode, 32);
}

- (NSNumber)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(NSNumber *)endpoint
{
  objc_setProperty_nonatomic_copy(self, a2, endpoint, 40);
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs
{
  objc_setProperty_nonatomic_copy(self, a2, timedInvokeTimeoutMs, 48);
}

- (NSNumber)serverSideProcessingTimeout
{
  return self->_serverSideProcessingTimeout;
}

- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout
{
  objc_setProperty_nonatomic_copy(self, a2, serverSideProcessingTimeout, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSideProcessingTimeout, 0);
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_metadataForNode, 0);
  objc_storeStrong((id *)&self->_announcementReason, 0);
  objc_storeStrong((id *)&self->_vendorID, 0);
  objc_storeStrong((id *)&self->_providerNodeID, 0);
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
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  id v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  char v36[64];
  void *v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  _QWORD *v42;
  _QWORD v43[2];
  uint64_t v44;
  __int16 v45;
  char v46;
  char v47;
  __int128 v48;
  __int16 v49;
  _BYTE v50[24];

  v43[1] = 0;
  v44 = 0;
  v45 = 0;
  v46 = 0;
  v47 = 0;
  v49 = 0;
  v42 = v43;
  v43[0] = 0;
  objc_msgSend_providerNodeID(self, a3, (uint64_t)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend_unsignedLongLongValue(v7, v8, v9);

  objc_msgSend_vendorID(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend_unsignedShortValue(v12, v13, v14);

  objc_msgSend_announcementReason(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend_unsignedCharValue(v17, v18, v19);

  objc_msgSend_metadataForNode(self, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v47 = 1;
    v48 = 0uLL;
    objc_msgSend_metadataForNode(self, v23, v24);
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v28 = objc_msgSend_bytes(v25, v26, v27);
    v31 = objc_msgSend_length(v25, v29, v30);
    sub_233BF7114(v36, v28, v31);

    v48 = *(_OWORD *)v36;
  }
  objc_msgSend_endpoint(self, v23, v24);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend_unsignedShortValue(v32, v33, v34);

  sub_234118674(0x62FuLL, 0, &v41);
  if (v41)
  {
    sub_234106C48((uint64_t)v36);
    v38 = 0;
    v39 = 0;
    v37 = &unk_250504030;
    v40 = 0;
    sub_233CAF098((uint64_t)&v37, &v41, 0);
    sub_234106CA8((uint64_t)v36, (uint64_t)&v37, 0xFFFFFFFF, (uint64_t)v50);
    *(_QWORD *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(_QWORD *)&retstr->mLine = 0;
    sub_233D0205C((uint64_t)&v44, v36, 0x100uLL, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      sub_233C115F0((uint64_t)v36, &v41, retstr);
      if (!retstr->mError)
      {
        sub_233C11670((uint64_t)a4, &v41);
        sub_234106010((uint64_t)a4, 21, 256, retstr);
      }
    }
    v37 = &unk_250504030;
    sub_233CAF128(&v39);
    sub_233CAF128(&v38);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 4333;
  }
  sub_233CAF128(&v41);
  return (ChipError *)sub_233CAF15C((uint64_t)&v42);
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
    v11 = 4362;
    sub_2340017F0((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_233CAF128(&v15);
  return v8;
}

@end
