@implementation MTROTASoftwareUpdateProviderClusterQueryImageParams

- (MTROTASoftwareUpdateProviderClusterQueryImageParams)init
{
  MTROTASoftwareUpdateProviderClusterQueryImageParams *v2;
  MTROTASoftwareUpdateProviderClusterQueryImageParams *v3;
  NSNumber *vendorID;
  NSNumber *productID;
  NSNumber *softwareVersion;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *protocolsSupported;
  NSNumber *hardwareVersion;
  NSString *location;
  NSNumber *requestorCanConsent;
  NSData *metadataForProvider;
  NSNumber *timedInvokeTimeoutMs;
  NSNumber *serverSideProcessingTimeout;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)MTROTASoftwareUpdateProviderClusterQueryImageParams;
  v2 = -[MTROTASoftwareUpdateProviderClusterQueryImageParams init](&v18, sel_init);
  v3 = v2;
  if (v2)
  {
    vendorID = v2->_vendorID;
    v2->_vendorID = (NSNumber *)&unk_250591A40;

    productID = v3->_productID;
    v3->_productID = (NSNumber *)&unk_250591A40;

    softwareVersion = v3->_softwareVersion;
    v3->_softwareVersion = (NSNumber *)&unk_250591A40;

    objc_msgSend_array(MEMORY[0x24BDBCE30], v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    protocolsSupported = v3->_protocolsSupported;
    v3->_protocolsSupported = (NSArray *)v9;

    hardwareVersion = v3->_hardwareVersion;
    v3->_hardwareVersion = 0;

    location = v3->_location;
    v3->_location = 0;

    requestorCanConsent = v3->_requestorCanConsent;
    v3->_requestorCanConsent = 0;

    metadataForProvider = v3->_metadataForProvider;
    v3->_metadataForProvider = 0;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTROTASoftwareUpdateProviderClusterQueryImageParams *v4;
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
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;

  v4 = objc_alloc_init(MTROTASoftwareUpdateProviderClusterQueryImageParams);
  objc_msgSend_vendorID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setVendorID_(v4, v8, (uint64_t)v7);

  objc_msgSend_productID(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setProductID_(v4, v12, (uint64_t)v11);

  objc_msgSend_softwareVersion(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSoftwareVersion_(v4, v16, (uint64_t)v15);

  objc_msgSend_protocolsSupported(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setProtocolsSupported_(v4, v20, (uint64_t)v19);

  objc_msgSend_hardwareVersion(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setHardwareVersion_(v4, v24, (uint64_t)v23);

  objc_msgSend_location(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLocation_(v4, v28, (uint64_t)v27);

  objc_msgSend_requestorCanConsent(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRequestorCanConsent_(v4, v32, (uint64_t)v31);

  objc_msgSend_metadataForProvider(self, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMetadataForProvider_(v4, v36, (uint64_t)v35);

  objc_msgSend_timedInvokeTimeoutMs(self, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v40, (uint64_t)v39);

  objc_msgSend_serverSideProcessingTimeout(self, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setServerSideProcessingTimeout_(v4, v44, (uint64_t)v43);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSNumber *vendorID;
  NSNumber *productID;
  NSNumber *softwareVersion;
  NSArray *protocolsSupported;
  NSNumber *hardwareVersion;
  NSString *location;
  NSNumber *requestorCanConsent;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  vendorID = self->_vendorID;
  productID = self->_productID;
  softwareVersion = self->_softwareVersion;
  protocolsSupported = self->_protocolsSupported;
  hardwareVersion = self->_hardwareVersion;
  location = self->_location;
  requestorCanConsent = self->_requestorCanConsent;
  objc_msgSend_base64EncodedStringWithOptions_(self->_metadataForProvider, v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v15, (uint64_t)CFSTR("<%@: vendorID:%@; productID:%@; softwareVersion:%@; protocolsSupported:%@; hardwareVersion:%@; location:%@; requestorCanConsent:%@; metadataForProvider:%@; >"),
    v5,
    vendorID,
    productID,
    softwareVersion,
    protocolsSupported,
    hardwareVersion,
    location,
    requestorCanConsent,
    v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (NSNumber)vendorID
{
  return self->_vendorID;
}

- (void)setVendorID:(NSNumber *)vendorID
{
  objc_setProperty_nonatomic_copy(self, a2, vendorID, 8);
}

- (NSNumber)productID
{
  return self->_productID;
}

- (void)setProductID:(NSNumber *)productID
{
  objc_setProperty_nonatomic_copy(self, a2, productID, 16);
}

- (NSNumber)softwareVersion
{
  return self->_softwareVersion;
}

- (void)setSoftwareVersion:(NSNumber *)softwareVersion
{
  objc_setProperty_nonatomic_copy(self, a2, softwareVersion, 24);
}

- (NSArray)protocolsSupported
{
  return self->_protocolsSupported;
}

- (void)setProtocolsSupported:(NSArray *)protocolsSupported
{
  objc_setProperty_nonatomic_copy(self, a2, protocolsSupported, 32);
}

- (NSNumber)hardwareVersion
{
  return self->_hardwareVersion;
}

- (void)setHardwareVersion:(NSNumber *)hardwareVersion
{
  objc_setProperty_nonatomic_copy(self, a2, hardwareVersion, 40);
}

- (NSString)location
{
  return self->_location;
}

- (void)setLocation:(NSString *)location
{
  objc_setProperty_nonatomic_copy(self, a2, location, 48);
}

- (NSNumber)requestorCanConsent
{
  return self->_requestorCanConsent;
}

- (void)setRequestorCanConsent:(NSNumber *)requestorCanConsent
{
  objc_setProperty_nonatomic_copy(self, a2, requestorCanConsent, 56);
}

- (NSData)metadataForProvider
{
  return self->_metadataForProvider;
}

- (void)setMetadataForProvider:(NSData *)metadataForProvider
{
  objc_setProperty_nonatomic_copy(self, a2, metadataForProvider, 64);
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs
{
  objc_setProperty_nonatomic_copy(self, a2, timedInvokeTimeoutMs, 72);
}

- (NSNumber)serverSideProcessingTimeout
{
  return self->_serverSideProcessingTimeout;
}

- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout
{
  objc_setProperty_nonatomic_copy(self, a2, serverSideProcessingTimeout, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSideProcessingTimeout, 0);
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_metadataForProvider, 0);
  objc_storeStrong((id *)&self->_requestorCanConsent, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_hardwareVersion, 0);
  objc_storeStrong((id *)&self->_protocolsSupported, 0);
  objc_storeStrong((id *)&self->_softwareVersion, 0);
  objc_storeStrong((id *)&self->_productID, 0);
  objc_storeStrong((id *)&self->_vendorID, 0);
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
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  _QWORD *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  unint64_t i;
  void *v37;
  const char *v38;
  uint64_t v39;
  unint64_t v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  void *v45;
  char isKindOfClass;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  unsigned int v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  id v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  id v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v92[8];
  void *v93;
  uint64_t v94;
  uint64_t v95;
  char v96;
  uint64_t v97;
  uint64_t *v98;
  _QWORD v99[2];
  uint64_t v100;
  __int128 v101;
  char v102;
  __int16 v103;
  char v104;
  __int128 v105;
  __int16 v106;
  char v107;
  __int128 v108;
  _BYTE v109[40];

  v104 = 0;
  LOBYTE(v106) = 0;
  v107 = 0;
  v101 = 0uLL;
  v99[1] = 0;
  v100 = 0;
  v102 = 0;
  v98 = v99;
  v99[0] = 0;
  objc_msgSend_vendorID(self, a3, (uint64_t)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(v100) = objc_msgSend_unsignedShortValue(v7, v8, v9);

  objc_msgSend_productID(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  WORD1(v100) = objc_msgSend_unsignedShortValue(v12, v13, v14);

  objc_msgSend_softwareVersion(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v100) = objc_msgSend_unsignedIntValue(v17, v18, v19);

  objc_msgSend_protocolsSupported(self, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend_count(v22, v23, v24);

  if (v25)
  {
    v28 = (_QWORD *)operator new();
    objc_msgSend_protocolsSupported(self, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_count(v31, v32, v33);
    *v28 = &off_2504EF280;
    v28[1] = operator new[]();

    if (v28[1])
    {
      v92[0] = (unint64_t)v28;
      sub_233CAF24C(&v98, v92, (uint64_t *)v92);
      for (i = 0; ; ++i)
      {
        objc_msgSend_protocolsSupported(self, v34, v35);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend_count(v37, v38, v39);

        if (i >= v40)
        {
          v55 = v28[1];
          objc_msgSend_protocolsSupported(self, v41, v42);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = objc_msgSend_count(v56, v57, v58);
          sub_233CAF22C(v92, v55, v59);
          v101 = *(_OWORD *)v92;

          goto LABEL_10;
        }
        objc_msgSend_protocolsSupported(self, v41, v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v43, v44, i);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
          break;
        objc_msgSend_protocolsSupported(self, v47, v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v49, v50, i);
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        *(_BYTE *)(v28[1] + i) = objc_msgSend_unsignedCharValue(v51, v52, v53);
      }
      retstr->mError = 47;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-"
                      "generated/MTRCommandPayloadsObjc.mm";
      v54 = 3707;
    }
    else
    {
      retstr->mError = 47;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-"
                      "generated/MTRCommandPayloadsObjc.mm";
      v54 = 3701;
    }
    retstr->mLine = v54;
  }
  else
  {
    v101 = 0uLL;
LABEL_10:
    objc_msgSend_hardwareVersion(self, v26, v27);
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    if (v60)
    {
      v102 = 1;
      v103 = 0;
      objc_msgSend_hardwareVersion(self, v61, v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v103 = objc_msgSend_unsignedShortValue(v63, v64, v65);

    }
    objc_msgSend_location(self, v61, v62);
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    if (v66)
    {
      v104 = 1;
      v105 = 0uLL;
      objc_msgSend_location(self, v67, v68);
      v69 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v72 = objc_msgSend_UTF8String(v69, v70, v71);
      v74 = objc_msgSend_lengthOfBytesUsingEncoding_(v69, v73, 4);
      sub_233CAF22C(v92, v72, v74);

      v105 = *(_OWORD *)v92;
    }
    objc_msgSend_requestorCanConsent(self, v67, v68);
    v75 = (void *)objc_claimAutoreleasedReturnValue();

    if (v75)
    {
      v106 = 1;
      objc_msgSend_requestorCanConsent(self, v76, v77);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      HIBYTE(v106) = objc_msgSend_BOOLValue(v78, v79, v80);

    }
    objc_msgSend_metadataForProvider(self, v76, v77);
    v81 = (void *)objc_claimAutoreleasedReturnValue();

    if (v81)
    {
      v107 = 1;
      v108 = 0uLL;
      objc_msgSend_metadataForProvider(self, v82, v83);
      v84 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v87 = objc_msgSend_bytes(v84, v85, v86);
      v90 = objc_msgSend_length(v84, v88, v89);
      sub_233BF7114(v92, v87, v90);

      v108 = *(_OWORD *)v92;
    }
    sub_234118674(0x62FuLL, 0, &v97);
    if (v97)
    {
      sub_234106C48((uint64_t)v92);
      v94 = 0;
      v95 = 0;
      v93 = &unk_250504030;
      v96 = 0;
      sub_233CAF098((uint64_t)&v93, &v97, 0);
      sub_234106CA8((uint64_t)v92, (uint64_t)&v93, 0xFFFFFFFF, (uint64_t)v109);
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      sub_233D00E1C((unsigned __int16 *)&v100, (char *)v92, 0x100uLL, (uint64_t)retstr);
      if (!retstr->mError)
      {
        *(_QWORD *)&retstr->mError = 0;
        retstr->mFile = 0;
        *(_QWORD *)&retstr->mLine = 0;
        sub_233C115F0((uint64_t)v92, &v97, retstr);
        if (!retstr->mError)
        {
          sub_233C11670((uint64_t)a4, &v97);
          sub_234106010((uint64_t)a4, 21, 256, retstr);
        }
      }
      v93 = &unk_250504030;
      sub_233CAF128(&v95);
      sub_233CAF128(&v94);
    }
    else
    {
      retstr->mError = 11;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-"
                      "generated/MTRCommandPayloadsObjc.mm";
      retstr->mLine = 3745;
    }
    sub_233CAF128(&v97);
  }
  return (ChipError *)sub_233CAF15C((uint64_t)&v98);
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
    v11 = 3774;
    sub_2340017F0((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_233CAF128(&v15);
  return v8;
}

@end
