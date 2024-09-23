@implementation MTRDeviceControllerStartupParams

- (MTRDeviceControllerStartupParams)initWithIPK:(NSData *)ipk fabricID:(NSNumber *)fabricID nocSigner:(id)nocSigner
{
  NSData *v8;
  NSNumber *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  MTRDeviceControllerStartupParams *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  NSNumber *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  NSData *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  NSUUID *uniqueIdentifier;
  MTRDeviceControllerStartupParams *v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  objc_super v34;
  uint8_t buf[4];
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v8 = ipk;
  v9 = fabricID;
  v10 = nocSigner;
  v34.receiver = self;
  v34.super_class = (Class)MTRDeviceControllerStartupParams;
  v13 = -[MTRDeviceControllerStartupParams init](&v34, sel_init);
  if (!v13)
  {
LABEL_8:
    v26 = 0;
    goto LABEL_9;
  }
  if (!objc_msgSend_unsignedLongLongValue(v9, v11, v12))
  {
    sub_234117B80(0, "NotSpecified");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v30 = objc_msgSend_unsignedLongLongValue(v9, v28, v29);
      *(_DWORD *)buf = 134217984;
      v36 = v30;
      _os_log_impl(&dword_233BF3000, v27, OS_LOG_TYPE_ERROR, "%llu is not a valid fabric id to initialize a device controller with", buf, 0xCu);
    }

    if (sub_234114844(1u))
    {
      objc_msgSend_unsignedLongLongValue(v9, v31, v32);
      sub_2341147D0(0, 1);
    }
    goto LABEL_8;
  }
  objc_storeStrong((id *)&v13->_nocSigner, nocSigner);
  v16 = objc_msgSend_copy(v9, v14, v15);
  v17 = v13->_fabricID;
  v13->_fabricID = (NSNumber *)v16;

  v20 = objc_msgSend_copy(v8, v18, v19);
  v21 = v13->_ipk;
  v13->_ipk = (NSData *)v20;

  objc_msgSend_UUID(MEMORY[0x24BDD1880], v22, v23);
  v24 = objc_claimAutoreleasedReturnValue();
  uniqueIdentifier = v13->_uniqueIdentifier;
  v13->_uniqueIdentifier = (NSUUID *)v24;

  v26 = v13;
LABEL_9:

  return v26;
}

- (MTRDeviceControllerStartupParams)initWithIPK:(NSData *)ipk operationalKeypair:(id)operationalKeypair operationalCertificate:(MTRCertificateDERBytes)operationalCertificate intermediateCertificate:(MTRCertificateDERBytes)intermediateCertificate rootCertificate:(MTRCertificateDERBytes)rootCertificate
{
  NSData *v12;
  id v13;
  NSData *v14;
  NSData *v15;
  NSData *v16;
  MTRDeviceControllerStartupParams *v17;
  NSNumber *v18;
  MTRDeviceControllerStartupParams *v19;
  NSNumber *fabricID;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  NSData *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  NSData *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  NSData *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  NSData *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  NSUUID *uniqueIdentifier;
  id v42;
  _QWORD v43[3];
  objc_super v44;
  uint64_t v45;

  v12 = ipk;
  v13 = operationalKeypair;
  v14 = operationalCertificate;
  v15 = intermediateCertificate;
  v16 = rootCertificate;
  v44.receiver = self;
  v44.super_class = (Class)MTRDeviceControllerStartupParams;
  v17 = -[MTRDeviceControllerStartupParams init](&v44, sel_init);
  if (v17)
  {
    memset(v43, 0, sizeof(v43));
    v42 = 0;
    v45 = 0;
    sub_234005ECC((uint64_t)v14, (char *)&v45, &v42, (uint64_t)v43);
    v18 = (NSNumber *)v42;
    if (!LODWORD(v43[0]))
    {
      fabricID = v17->_fabricID;
      v17->_fabricID = v18;

      objc_storeStrong((id *)&v17->_operationalKeypair, operationalKeypair);
      v23 = objc_msgSend_copy(v14, v21, v22);
      v24 = v17->_operationalCertificate;
      v17->_operationalCertificate = (NSData *)v23;

      v27 = objc_msgSend_copy(v15, v25, v26);
      v28 = v17->_intermediateCertificate;
      v17->_intermediateCertificate = (NSData *)v27;

      v31 = objc_msgSend_copy(v16, v29, v30);
      v32 = v17->_rootCertificate;
      v17->_rootCertificate = (NSData *)v31;

      v35 = objc_msgSend_copy(v12, v33, v34);
      v36 = v17->_ipk;
      v17->_ipk = (NSData *)v35;

      objc_msgSend_UUID(MEMORY[0x24BDD1880], v37, v38);
      v39 = objc_claimAutoreleasedReturnValue();
      uniqueIdentifier = v17->_uniqueIdentifier;
      v17->_uniqueIdentifier = (NSUUID *)v39;

      v19 = v17;
      goto LABEL_6;
    }

  }
  v19 = 0;
LABEL_6:

  return v19;
}

- (MTRDeviceControllerStartupParams)initWithParams:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  MTRDeviceControllerStartupParams *v7;
  uint64_t v8;
  MTRKeypair *nocSigner;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  NSNumber *fabricID;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  NSData *ipk;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  NSNumber *vendorID;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  NSNumber *nodeID;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  NSSet *caseAuthenticatedTags;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  NSData *rootCertificate;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  NSData *intermediateCertificate;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  NSData *operationalCertificate;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  MTRKeypair *operationalKeypair;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  MTROperationalCertificateIssuer *operationalCertificateIssuer;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  OS_dispatch_queue *operationalCertificateIssuerQueue;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  NSUUID *uniqueIdentifier;
  MTRDeviceControllerStartupParams *v58;
  objc_super v60;

  v4 = a3;
  v60.receiver = self;
  v60.super_class = (Class)MTRDeviceControllerStartupParams;
  v7 = -[MTRDeviceControllerStartupParams init](&v60, sel_init);
  if (v7)
  {
    objc_msgSend_nocSigner(v4, v5, v6);
    v8 = objc_claimAutoreleasedReturnValue();
    nocSigner = v7->_nocSigner;
    v7->_nocSigner = (MTRKeypair *)v8;

    objc_msgSend_fabricID(v4, v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    fabricID = v7->_fabricID;
    v7->_fabricID = (NSNumber *)v12;

    objc_msgSend_ipk(v4, v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    ipk = v7->_ipk;
    v7->_ipk = (NSData *)v16;

    objc_msgSend_vendorID(v4, v18, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    vendorID = v7->_vendorID;
    v7->_vendorID = (NSNumber *)v20;

    objc_msgSend_nodeID(v4, v22, v23);
    v24 = objc_claimAutoreleasedReturnValue();
    nodeID = v7->_nodeID;
    v7->_nodeID = (NSNumber *)v24;

    objc_msgSend_caseAuthenticatedTags(v4, v26, v27);
    v28 = objc_claimAutoreleasedReturnValue();
    caseAuthenticatedTags = v7->_caseAuthenticatedTags;
    v7->_caseAuthenticatedTags = (NSSet *)v28;

    objc_msgSend_rootCertificate(v4, v30, v31);
    v32 = objc_claimAutoreleasedReturnValue();
    rootCertificate = v7->_rootCertificate;
    v7->_rootCertificate = (NSData *)v32;

    objc_msgSend_intermediateCertificate(v4, v34, v35);
    v36 = objc_claimAutoreleasedReturnValue();
    intermediateCertificate = v7->_intermediateCertificate;
    v7->_intermediateCertificate = (NSData *)v36;

    objc_msgSend_operationalCertificate(v4, v38, v39);
    v40 = objc_claimAutoreleasedReturnValue();
    operationalCertificate = v7->_operationalCertificate;
    v7->_operationalCertificate = (NSData *)v40;

    objc_msgSend_operationalKeypair(v4, v42, v43);
    v44 = objc_claimAutoreleasedReturnValue();
    operationalKeypair = v7->_operationalKeypair;
    v7->_operationalKeypair = (MTRKeypair *)v44;

    objc_msgSend_operationalCertificateIssuer(v4, v46, v47);
    v48 = objc_claimAutoreleasedReturnValue();
    operationalCertificateIssuer = v7->_operationalCertificateIssuer;
    v7->_operationalCertificateIssuer = (MTROperationalCertificateIssuer *)v48;

    objc_msgSend_operationalCertificateIssuerQueue(v4, v50, v51);
    v52 = objc_claimAutoreleasedReturnValue();
    operationalCertificateIssuerQueue = v7->_operationalCertificateIssuerQueue;
    v7->_operationalCertificateIssuerQueue = (OS_dispatch_queue *)v52;

    objc_msgSend_uniqueIdentifier(v4, v54, v55);
    v56 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v7->_uniqueIdentifier;
    v7->_uniqueIdentifier = (NSUUID *)v56;

    v58 = v7;
  }

  return v7;
}

- (MTRDeviceControllerStartupParams)initWithParameters:(id)a3 error:(ChipError *)a4
{
  id v6;
  MTRDeviceControllerStartupParams *v7;
  MTRDeviceControllerStartupParams *v8;
  MTRKeypair *nocSigner;
  const char *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  unsigned int v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSData *ipk;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  NSNumber *vendorID;
  NSNumber *nodeID;
  NSSet *caseAuthenticatedTags;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  NSData *rootCertificate;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  NSData *intermediateCertificate;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  NSData *operationalCertificate;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  MTRKeypair *operationalKeypair;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  MTROperationalCertificateIssuer *operationalCertificateIssuer;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  OS_dispatch_queue *operationalCertificateIssuerQueue;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  NSUUID *uniqueIdentifier;
  id v56;
  uint8_t buf[16];
  uint64_t v58;
  objc_super v59;
  uint64_t v60;

  v6 = a3;
  v59.receiver = self;
  v59.super_class = (Class)MTRDeviceControllerStartupParams;
  v7 = -[MTRDeviceControllerStartupParams init](&v59, sel_init);
  v8 = v7;
  if (!v7)
  {
    a4->mError = 3;
    a4->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDeviceC"
                "ontrollerStartupParams.mm";
    v15 = 146;
LABEL_11:
    a4->mLine = v15;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    sub_234117B80(0, "NotSpecified");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_233BF3000, v16, OS_LOG_TYPE_ERROR, "Unexpected subclass of MTRDeviceControllerParameters", buf, 2u);
    }

    if (sub_234114844(1u))
      sub_2341147D0(0, 1);
    v7 = 0;
    a4->mError = 47;
    a4->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDeviceC"
                "ontrollerStartupParams.mm";
    v15 = 152;
    goto LABEL_11;
  }
  nocSigner = v7->_nocSigner;
  v7->_nocSigner = 0;

  objc_msgSend_operationalCertificate(v6, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0;
  v60 = 0;
  sub_234005ECC((uint64_t)v12, (char *)&v60, &v56, (uint64_t)buf);
  v13 = v56;
  v14 = v56;
  *(_OWORD *)&a4->mError = *(_OWORD *)buf;
  *(_QWORD *)&a4->mLine = v58;

  if (a4->mError)
  {
    v7 = 0;
  }
  else
  {
    objc_storeStrong((id *)&v7->_fabricID, v13);
    objc_msgSend_ipk(v6, v17, v18);
    v19 = objc_claimAutoreleasedReturnValue();
    ipk = v7->_ipk;
    v7->_ipk = (NSData *)v19;

    objc_msgSend_vendorID(v6, v21, v22);
    v23 = objc_claimAutoreleasedReturnValue();
    vendorID = v7->_vendorID;
    v7->_vendorID = (NSNumber *)v23;

    nodeID = v7->_nodeID;
    v7->_nodeID = 0;

    caseAuthenticatedTags = v7->_caseAuthenticatedTags;
    v7->_caseAuthenticatedTags = 0;

    objc_msgSend_rootCertificate(v6, v27, v28);
    v29 = objc_claimAutoreleasedReturnValue();
    rootCertificate = v7->_rootCertificate;
    v7->_rootCertificate = (NSData *)v29;

    objc_msgSend_intermediateCertificate(v6, v31, v32);
    v33 = objc_claimAutoreleasedReturnValue();
    intermediateCertificate = v7->_intermediateCertificate;
    v7->_intermediateCertificate = (NSData *)v33;

    objc_msgSend_operationalCertificate(v6, v35, v36);
    v37 = objc_claimAutoreleasedReturnValue();
    operationalCertificate = v7->_operationalCertificate;
    v7->_operationalCertificate = (NSData *)v37;

    objc_msgSend_operationalKeypair(v6, v39, v40);
    v41 = objc_claimAutoreleasedReturnValue();
    operationalKeypair = v7->_operationalKeypair;
    v7->_operationalKeypair = (MTRKeypair *)v41;

    objc_msgSend_operationalCertificateIssuer(v6, v43, v44);
    v45 = objc_claimAutoreleasedReturnValue();
    operationalCertificateIssuer = v7->_operationalCertificateIssuer;
    v7->_operationalCertificateIssuer = (MTROperationalCertificateIssuer *)v45;

    objc_msgSend_operationalCertificateIssuerQueue(v6, v47, v48);
    v49 = objc_claimAutoreleasedReturnValue();
    operationalCertificateIssuerQueue = v7->_operationalCertificateIssuerQueue;
    v7->_operationalCertificateIssuerQueue = (OS_dispatch_queue *)v49;

    objc_msgSend_uniqueIdentifier(v6, v51, v52);
    v53 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v7->_uniqueIdentifier;
    v7->_uniqueIdentifier = (NSUUID *)v53;

    v7 = v7;
  }

LABEL_14:
  return v7;
}

- (id)nocSigner
{
  return self->_nocSigner;
}

- (NSNumber)fabricID
{
  return self->_fabricID;
}

- (NSData)ipk
{
  return self->_ipk;
}

- (NSNumber)vendorID
{
  return self->_vendorID;
}

- (void)setVendorID:(NSNumber *)vendorID
{
  objc_setProperty_nonatomic_copy(self, a2, vendorID, 32);
}

- (NSNumber)nodeID
{
  return self->_nodeID;
}

- (void)setNodeID:(NSNumber *)nodeID
{
  objc_setProperty_nonatomic_copy(self, a2, nodeID, 40);
}

- (NSSet)caseAuthenticatedTags
{
  return self->_caseAuthenticatedTags;
}

- (void)setCaseAuthenticatedTags:(NSSet *)caseAuthenticatedTags
{
  objc_setProperty_nonatomic_copy(self, a2, caseAuthenticatedTags, 48);
}

- (MTRCertificateDERBytes)rootCertificate
{
  return self->_rootCertificate;
}

- (void)setRootCertificate:(MTRCertificateDERBytes)rootCertificate
{
  objc_setProperty_nonatomic_copy(self, a2, rootCertificate, 56);
}

- (MTRCertificateDERBytes)intermediateCertificate
{
  return self->_intermediateCertificate;
}

- (void)setIntermediateCertificate:(MTRCertificateDERBytes)intermediateCertificate
{
  objc_setProperty_nonatomic_copy(self, a2, intermediateCertificate, 64);
}

- (MTRCertificateDERBytes)operationalCertificate
{
  return self->_operationalCertificate;
}

- (void)setOperationalCertificate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)operationalKeypair
{
  return self->_operationalKeypair;
}

- (void)setOperationalKeypair:(id)operationalKeypair
{
  objc_storeStrong((id *)&self->_operationalKeypair, operationalKeypair);
}

- (id)operationalCertificateIssuer
{
  return self->_operationalCertificateIssuer;
}

- (void)setOperationalCertificateIssuer:(id)operationalCertificateIssuer
{
  objc_storeStrong((id *)&self->_operationalCertificateIssuer, operationalCertificateIssuer);
}

- (dispatch_queue_t)operationalCertificateIssuerQueue
{
  return (dispatch_queue_t)self->_operationalCertificateIssuerQueue;
}

- (void)setOperationalCertificateIssuerQueue:(dispatch_queue_t)operationalCertificateIssuerQueue
{
  objc_storeStrong((id *)&self->_operationalCertificateIssuerQueue, operationalCertificateIssuerQueue);
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_operationalCertificateIssuerQueue, 0);
  objc_storeStrong((id *)&self->_operationalCertificateIssuer, 0);
  objc_storeStrong((id *)&self->_operationalKeypair, 0);
  objc_storeStrong((id *)&self->_operationalCertificate, 0);
  objc_storeStrong((id *)&self->_intermediateCertificate, 0);
  objc_storeStrong((id *)&self->_rootCertificate, 0);
  objc_storeStrong((id *)&self->_caseAuthenticatedTags, 0);
  objc_storeStrong((id *)&self->_nodeID, 0);
  objc_storeStrong((id *)&self->_vendorID, 0);
  objc_storeStrong((id *)&self->_ipk, 0);
  objc_storeStrong((id *)&self->_fabricID, 0);
  objc_storeStrong((id *)&self->_nocSigner, 0);
}

- (uint64_t)fabricId
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend_fabricID(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_unsignedLongLongValue(v3, v4, v5);

  return v6;
}

- (MTRDeviceControllerStartupParams)initWithSigningKeypair:(id)nocSigner fabricId:(uint64_t)fabricId ipk:(NSData *)ipk
{
  id v8;
  NSData *v9;
  const char *v10;
  void *v11;
  const char *v12;
  MTRDeviceControllerStartupParams *v13;

  v8 = nocSigner;
  v9 = ipk;
  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], v10, fabricId);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (MTRDeviceControllerStartupParams *)objc_msgSend_initWithIPK_fabricID_nocSigner_(self, v12, (uint64_t)v9, v11, v8);

  return v13;
}

- (MTRDeviceControllerStartupParams)initWithOperationalKeypair:(id)operationalKeypair operationalCertificate:(MTRCertificateDERBytes)operationalCertificate intermediateCertificate:(MTRCertificateDERBytes)intermediateCertificate rootCertificate:(MTRCertificateDERBytes)rootCertificate ipk:(NSData *)ipk
{
  return (MTRDeviceControllerStartupParams *)MEMORY[0x24BEDD108](self, sel_initWithIPK_operationalKeypair_operationalCertificate_intermediateCertificate_rootCertificate_, ipk);
}

@end
