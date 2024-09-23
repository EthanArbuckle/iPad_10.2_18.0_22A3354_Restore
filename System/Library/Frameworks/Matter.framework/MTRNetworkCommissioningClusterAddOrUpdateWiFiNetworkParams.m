@implementation MTRNetworkCommissioningClusterAddOrUpdateWiFiNetworkParams

- (MTRNetworkCommissioningClusterAddOrUpdateWiFiNetworkParams)init
{
  const char *v2;
  uint64_t v3;
  MTRNetworkCommissioningClusterAddOrUpdateWiFiNetworkParams *v4;
  uint64_t v5;
  NSData *ssid;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSData *credentials;
  NSNumber *breadcrumb;
  NSData *networkIdentity;
  NSData *clientIdentifier;
  NSData *possessionNonce;
  NSNumber *timedInvokeTimeoutMs;
  NSNumber *serverSideProcessingTimeout;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)MTRNetworkCommissioningClusterAddOrUpdateWiFiNetworkParams;
  v4 = -[MTRNetworkCommissioningClusterAddOrUpdateWiFiNetworkParams init](&v18, sel_init);
  if (v4)
  {
    objc_msgSend_data(MEMORY[0x24BDBCE50], v2, v3);
    v5 = objc_claimAutoreleasedReturnValue();
    ssid = v4->_ssid;
    v4->_ssid = (NSData *)v5;

    objc_msgSend_data(MEMORY[0x24BDBCE50], v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    credentials = v4->_credentials;
    v4->_credentials = (NSData *)v9;

    breadcrumb = v4->_breadcrumb;
    v4->_breadcrumb = 0;

    networkIdentity = v4->_networkIdentity;
    v4->_networkIdentity = 0;

    clientIdentifier = v4->_clientIdentifier;
    v4->_clientIdentifier = 0;

    possessionNonce = v4->_possessionNonce;
    v4->_possessionNonce = 0;

    timedInvokeTimeoutMs = v4->_timedInvokeTimeoutMs;
    v4->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v4->_serverSideProcessingTimeout;
    v4->_serverSideProcessingTimeout = 0;

  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRNetworkCommissioningClusterAddOrUpdateWiFiNetworkParams *v4;
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

  v4 = objc_alloc_init(MTRNetworkCommissioningClusterAddOrUpdateWiFiNetworkParams);
  objc_msgSend_ssid(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSsid_(v4, v8, (uint64_t)v7);

  objc_msgSend_credentials(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCredentials_(v4, v12, (uint64_t)v11);

  objc_msgSend_breadcrumb(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBreadcrumb_(v4, v16, (uint64_t)v15);

  objc_msgSend_networkIdentity(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNetworkIdentity_(v4, v20, (uint64_t)v19);

  objc_msgSend_clientIdentifier(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClientIdentifier_(v4, v24, (uint64_t)v23);

  objc_msgSend_possessionNonce(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPossessionNonce_(v4, v28, (uint64_t)v27);

  objc_msgSend_timedInvokeTimeoutMs(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v32, (uint64_t)v31);

  objc_msgSend_serverSideProcessingTimeout(self, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setServerSideProcessingTimeout_(v4, v36, (uint64_t)v35);

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
  NSNumber *breadcrumb;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  void *v18;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_base64EncodedStringWithOptions_(self->_ssid, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_base64EncodedStringWithOptions_(self->_credentials, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  breadcrumb = self->_breadcrumb;
  objc_msgSend_base64EncodedStringWithOptions_(self->_networkIdentity, v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_base64EncodedStringWithOptions_(self->_clientIdentifier, v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_base64EncodedStringWithOptions_(self->_possessionNonce, v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v17, (uint64_t)CFSTR("<%@: ssid:%@; credentials:%@; breadcrumb:%@; networkIdentity:%@; clientIdentifier:%@; possessionNonce:%@; >"),
    v5,
    v7,
    v9,
    breadcrumb,
    v12,
    v14,
    v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (NSData)ssid
{
  return self->_ssid;
}

- (void)setSsid:(NSData *)ssid
{
  objc_setProperty_nonatomic_copy(self, a2, ssid, 8);
}

- (NSData)credentials
{
  return self->_credentials;
}

- (void)setCredentials:(NSData *)credentials
{
  objc_setProperty_nonatomic_copy(self, a2, credentials, 16);
}

- (NSNumber)breadcrumb
{
  return self->_breadcrumb;
}

- (void)setBreadcrumb:(NSNumber *)breadcrumb
{
  objc_setProperty_nonatomic_copy(self, a2, breadcrumb, 24);
}

- (NSData)networkIdentity
{
  return self->_networkIdentity;
}

- (void)setNetworkIdentity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSData)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSData)possessionNonce
{
  return self->_possessionNonce;
}

- (void)setPossessionNonce:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs
{
  objc_setProperty_nonatomic_copy(self, a2, timedInvokeTimeoutMs, 56);
}

- (NSNumber)serverSideProcessingTimeout
{
  return self->_serverSideProcessingTimeout;
}

- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout
{
  objc_setProperty_nonatomic_copy(self, a2, serverSideProcessingTimeout, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSideProcessingTimeout, 0);
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_possessionNonce, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_networkIdentity, 0);
  objc_storeStrong((id *)&self->_breadcrumb, 0);
  objc_storeStrong((id *)&self->_credentials, 0);
  objc_storeStrong((id *)&self->_ssid, 0);
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
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
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
  void *v41;
  const char *v42;
  uint64_t v43;
  id v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  id v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  char v62[64];
  void *v63;
  uint64_t v64;
  uint64_t v65;
  char v66;
  uint64_t v67;
  _QWORD *v68;
  _QWORD v69[2];
  __int128 v70;
  __int128 v71;
  char v72;
  uint64_t v73;
  char v74;
  __int128 v75;
  char v76;
  __int128 v77;
  char v78;
  __int128 v79;
  _BYTE v80[24];

  v74 = 0;
  v76 = 0;
  v78 = 0;
  v70 = 0u;
  v71 = 0u;
  v72 = 0;
  v69[0] = 0;
  v69[1] = 0;
  v68 = v69;
  objc_msgSend_ssid(self, a3, (uint64_t)a4);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = objc_msgSend_bytes(v7, v8, v9);
  v13 = objc_msgSend_length(v7, v11, v12);
  sub_233BF7114(v62, v10, v13);

  v70 = *(_OWORD *)v62;
  objc_msgSend_credentials(self, v14, v15);
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v19 = objc_msgSend_bytes(v16, v17, v18);
  v22 = objc_msgSend_length(v16, v20, v21);
  sub_233BF7114(v62, v19, v22);

  v71 = *(_OWORD *)v62;
  objc_msgSend_breadcrumb(self, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v72 = 1;
    v73 = 0;
    objc_msgSend_breadcrumb(self, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = objc_msgSend_unsignedLongLongValue(v28, v29, v30);

  }
  objc_msgSend_networkIdentity(self, v26, v27);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    v74 = 1;
    v75 = 0uLL;
    objc_msgSend_networkIdentity(self, v32, v33);
    v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v37 = objc_msgSend_bytes(v34, v35, v36);
    v40 = objc_msgSend_length(v34, v38, v39);
    sub_233BF7114(v62, v37, v40);

    v75 = *(_OWORD *)v62;
  }
  objc_msgSend_clientIdentifier(self, v32, v33);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    v76 = 1;
    v77 = 0uLL;
    objc_msgSend_clientIdentifier(self, v42, v43);
    v44 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v47 = objc_msgSend_bytes(v44, v45, v46);
    v50 = objc_msgSend_length(v44, v48, v49);
    sub_233BF7114(v62, v47, v50);

    v77 = *(_OWORD *)v62;
  }
  objc_msgSend_possessionNonce(self, v42, v43);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (v51)
  {
    v78 = 1;
    v79 = 0uLL;
    objc_msgSend_possessionNonce(self, v52, v53);
    v54 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v57 = objc_msgSend_bytes(v54, v55, v56);
    v60 = objc_msgSend_length(v54, v58, v59);
    sub_233BF7114(v62, v57, v60);

    v79 = *(_OWORD *)v62;
  }
  sub_234118674(0x62FuLL, 0, &v67);
  if (v67)
  {
    sub_234106C48((uint64_t)v62);
    v64 = 0;
    v65 = 0;
    v63 = &unk_250504030;
    v66 = 0;
    sub_233CAF098((uint64_t)&v63, &v67, 0);
    sub_234106CA8((uint64_t)v62, (uint64_t)&v63, 0xFFFFFFFF, (uint64_t)v80);
    *(_QWORD *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(_QWORD *)&retstr->mLine = 0;
    sub_233D05CA8((uint64_t)&v70, v62, 0x100uLL, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      sub_233C115F0((uint64_t)v62, &v67, retstr);
      if (!retstr->mError)
      {
        sub_233C11670((uint64_t)a4, &v67);
        sub_234106010((uint64_t)a4, 21, 256, retstr);
      }
    }
    v63 = &unk_250504030;
    sub_233CAF128(&v65);
    sub_233CAF128(&v64);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 5264;
  }
  sub_233CAF128(&v67);
  return (ChipError *)sub_233CAF15C((uint64_t)&v68);
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
    v11 = 5293;
    sub_2340017F0((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_233CAF128(&v15);
  return v8;
}

@end
