@implementation HMMTRControllerParameters

- (HMMTRControllerParameters)initWithIPK:(id)a3 operationalKeypair:(id)a4 operationalCertificate:(id)a5 intermediateCertificate:(id)a6 rootCertificate:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  HMMTRControllerParameters *v17;
  HMMTRControllerParameters *v18;
  uint64_t v19;
  NSNumber *fabricID;
  id v22;
  objc_super v23;

  v22 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)HMMTRControllerParameters;
  v17 = -[HMMTRControllerParameters init](&v23, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_ipk, a3);
    objc_storeStrong((id *)&v18->_operationalKeypair, a4);
    objc_storeStrong((id *)&v18->_operationalCertificate, a5);
    objc_storeStrong((id *)&v18->_intermediateCertificate, a6);
    objc_storeStrong((id *)&v18->_rootCertificate, a7);
    objc_msgSend(MEMORY[0x24BDDB5B0], "fabricIDFromCertificate:", v16);
    v19 = objc_claimAutoreleasedReturnValue();
    fabricID = v18->_fabricID;
    v18->_fabricID = (NSNumber *)v19;

  }
  return v18;
}

- (HMMTRControllerParameters)initWithStorageDelegate:(id)a3 storageDelegateQueue:(id)a4 uniqueIdentifier:(id)a5 ipk:(id)a6 vendorID:(id)a7 operationalKeypair:(id)a8 operationalCertificate:(id)a9 intermediateCertificate:(id)a10 rootCertificate:(id)a11
{
  id v18;
  HMMTRControllerParameters *v19;
  HMMTRControllerParameters *v20;
  uint64_t v21;
  NSNumber *fabricID;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  objc_super v32;

  v31 = a3;
  v30 = a4;
  v29 = a5;
  v28 = a6;
  v27 = a7;
  v26 = a8;
  v25 = a9;
  v24 = a10;
  v18 = a11;
  v32.receiver = self;
  v32.super_class = (Class)HMMTRControllerParameters;
  v19 = -[HMMTRControllerParameters init](&v32, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_storageDelegate, a3);
    objc_storeStrong((id *)&v20->_storageDelegateQueue, a4);
    objc_storeStrong((id *)&v20->_uniqueIdentifier, a5);
    objc_storeStrong((id *)&v20->_ipk, a6);
    objc_storeStrong((id *)&v20->_vendorID, a7);
    objc_storeStrong((id *)&v20->_operationalKeypair, a8);
    objc_storeStrong((id *)&v20->_operationalCertificate, a9);
    objc_storeStrong((id *)&v20->_intermediateCertificate, a10);
    objc_storeStrong((id *)&v20->_rootCertificate, a11);
    objc_msgSend(MEMORY[0x24BDDB5B0], "fabricIDFromCertificate:", v18);
    v21 = objc_claimAutoreleasedReturnValue();
    fabricID = v20->_fabricID;
    v20->_fabricID = (NSNumber *)v21;

  }
  return v20;
}

- (BOOL)usesCommonStorageDelegate
{
  void *v2;
  BOOL v3;

  -[HMMTRControllerParameters storageDelegate](self, "storageDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (id)controllerParams
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if (-[HMMTRControllerParameters usesCommonStorageDelegate](self, "usesCommonStorageDelegate"))
  {
    v3 = objc_alloc(MEMORY[0x24BDDB6A0]);
    -[HMMTRControllerParameters ipk](self, "ipk");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRControllerParameters operationalKeypair](self, "operationalKeypair");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRControllerParameters operationalCertificate](self, "operationalCertificate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRControllerParameters intermediateCertificate](self, "intermediateCertificate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRControllerParameters rootCertificate](self, "rootCertificate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v3, "initWithIPK:operationalKeypair:operationalCertificate:intermediateCertificate:rootCertificate:", v4, v5, v6, v7, v8);

    -[HMMTRControllerParameters vendorID](self, "vendorID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setVendorID:", v10);

    -[HMMTRControllerParameters operationalCertificateIssuer](self, "operationalCertificateIssuer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setOperationalCertificateIssuer:", v11);

    -[HMMTRControllerParameters operationalCertificateIssuerQueue](self, "operationalCertificateIssuerQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setOperationalCertificateIssuerQueue:", v12);

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)controllerParams2
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  id v20;

  if (-[HMMTRControllerParameters usesCommonStorageDelegate](self, "usesCommonStorageDelegate"))
  {
    v3 = 0;
  }
  else
  {
    v20 = objc_alloc(MEMORY[0x24BDDB688]);
    -[HMMTRControllerParameters storageDelegate](self, "storageDelegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRControllerParameters storageDelegateQueue](self, "storageDelegateQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRControllerParameters uniqueIdentifier](self, "uniqueIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRControllerParameters ipk](self, "ipk");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRControllerParameters vendorID](self, "vendorID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRControllerParameters operationalKeypair](self, "operationalKeypair");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRControllerParameters operationalCertificate](self, "operationalCertificate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRControllerParameters intermediateCertificate](self, "intermediateCertificate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRControllerParameters rootCertificate](self, "rootCertificate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(v20, "initWithStorageDelegate:storageDelegateQueue:uniqueIdentifier:ipk:vendorID:operationalKeypair:operationalCertificate:intermediateCertificate:rootCertificate:", v19, v4, v5, v6, v7, v8, v9, v10, v11);

    -[HMMTRControllerParameters otaProviderDelegate](self, "otaProviderDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRControllerParameters otaProviderDelegateQueue](self, "otaProviderDelegateQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setOTAProviderDelegate:queue:", v12, v13);

    -[HMMTRControllerParameters operationalCertificateIssuer](self, "operationalCertificateIssuer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRControllerParameters operationalCertificateIssuerQueue](self, "operationalCertificateIssuerQueue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setOperationalCertificateIssuer:queue:", v14, v15);

    -[HMMTRControllerParameters productAttestationAuthorityCertificates](self, "productAttestationAuthorityCertificates");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setProductAttestationAuthorityCertificates:", v16);

    -[HMMTRControllerParameters certificationDeclarationCertificates](self, "certificationDeclarationCertificates");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setCertificationDeclarationCertificates:", v17);

    objc_msgSend(v3, "setShouldAdvertiseOperational:", -[HMMTRControllerParameters shouldAdvertiseOperational](self, "shouldAdvertiseOperational"));
  }
  return v3;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)vendorID
{
  return self->_vendorID;
}

- (void)setVendorID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)fabricID
{
  return self->_fabricID;
}

- (void)setFabricID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSData)ipk
{
  return self->_ipk;
}

- (void)setIpk:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSData)rootCertificate
{
  return self->_rootCertificate;
}

- (void)setRootCertificate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSData)intermediateCertificate
{
  return self->_intermediateCertificate;
}

- (void)setIntermediateCertificate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSData)operationalCertificate
{
  return self->_operationalCertificate;
}

- (void)setOperationalCertificate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (MTRKeypair)operationalKeypair
{
  return self->_operationalKeypair;
}

- (void)setOperationalKeypair:(id)a3
{
  objc_storeStrong((id *)&self->_operationalKeypair, a3);
}

- (MTRDeviceControllerStorageDelegate)storageDelegate
{
  return self->_storageDelegate;
}

- (void)setStorageDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_storageDelegate, a3);
}

- (OS_dispatch_queue)storageDelegateQueue
{
  return self->_storageDelegateQueue;
}

- (void)setStorageDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_storageDelegateQueue, a3);
}

- (MTROperationalCertificateIssuer)operationalCertificateIssuer
{
  return self->_operationalCertificateIssuer;
}

- (void)setOperationalCertificateIssuer:(id)a3
{
  objc_storeStrong((id *)&self->_operationalCertificateIssuer, a3);
}

- (OS_dispatch_queue)operationalCertificateIssuerQueue
{
  return self->_operationalCertificateIssuerQueue;
}

- (void)setOperationalCertificateIssuerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationalCertificateIssuerQueue, a3);
}

- (MTROTAProviderDelegate)otaProviderDelegate
{
  return self->_otaProviderDelegate;
}

- (void)setOtaProviderDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_otaProviderDelegate, a3);
}

- (OS_dispatch_queue)otaProviderDelegateQueue
{
  return self->_otaProviderDelegateQueue;
}

- (void)setOtaProviderDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_otaProviderDelegateQueue, a3);
}

- (NSArray)productAttestationAuthorityCertificates
{
  return self->_productAttestationAuthorityCertificates;
}

- (void)setProductAttestationAuthorityCertificates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSArray)certificationDeclarationCertificates
{
  return self->_certificationDeclarationCertificates;
}

- (void)setCertificationDeclarationCertificates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (BOOL)shouldAdvertiseOperational
{
  return self->_shouldAdvertiseOperational;
}

- (void)setShouldAdvertiseOperational:(BOOL)a3
{
  self->_shouldAdvertiseOperational = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certificationDeclarationCertificates, 0);
  objc_storeStrong((id *)&self->_productAttestationAuthorityCertificates, 0);
  objc_storeStrong((id *)&self->_otaProviderDelegateQueue, 0);
  objc_storeStrong((id *)&self->_otaProviderDelegate, 0);
  objc_storeStrong((id *)&self->_operationalCertificateIssuerQueue, 0);
  objc_storeStrong((id *)&self->_operationalCertificateIssuer, 0);
  objc_storeStrong((id *)&self->_storageDelegateQueue, 0);
  objc_storeStrong((id *)&self->_storageDelegate, 0);
  objc_storeStrong((id *)&self->_operationalKeypair, 0);
  objc_storeStrong((id *)&self->_operationalCertificate, 0);
  objc_storeStrong((id *)&self->_intermediateCertificate, 0);
  objc_storeStrong((id *)&self->_rootCertificate, 0);
  objc_storeStrong((id *)&self->_ipk, 0);
  objc_storeStrong((id *)&self->_fabricID, 0);
  objc_storeStrong((id *)&self->_vendorID, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end
