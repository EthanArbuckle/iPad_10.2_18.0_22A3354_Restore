@implementation MTRDeviceControllerParameters

- (MTRDeviceControllerParameters)initWithStorageDelegate:(id)a3 storageDelegateQueue:(id)a4 uniqueIdentifier:(id)a5 ipk:(id)a6 vendorID:(id)a7 operationalKeypair:(id)a8 operationalCertificate:(id)a9 intermediateCertificate:(id)a10 rootCertificate:(id)a11
{
  MTRDeviceControllerParameters *v18;
  MTRDeviceControllerParameters *v19;
  NSArray *productAttestationAuthorityCertificates;
  NSArray *certificationDeclarationCertificates;
  MTROperationalCertificateIssuer *operationalCertificateIssuer;
  OS_dispatch_queue *operationalCertificateIssuerQueue;
  MTRDeviceControllerParameters *v24;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  objc_super v35;

  v34 = a3;
  v33 = a4;
  v32 = a5;
  v31 = a6;
  v30 = a7;
  v29 = a8;
  v28 = a9;
  v27 = a10;
  v26 = a11;
  v35.receiver = self;
  v35.super_class = (Class)MTRDeviceControllerParameters;
  v18 = -[MTRDeviceControllerAbstractParameters _initInternal](&v35, sel__initInternal);
  v19 = v18;
  if (v18)
  {
    productAttestationAuthorityCertificates = v18->_productAttestationAuthorityCertificates;
    v18->_productAttestationAuthorityCertificates = 0;

    certificationDeclarationCertificates = v19->_certificationDeclarationCertificates;
    v19->_certificationDeclarationCertificates = 0;

    v19->_shouldAdvertiseOperational = 0;
    objc_storeStrong((id *)&v19->_ipk, a6);
    objc_storeStrong((id *)&v19->_vendorID, a7);
    objc_storeStrong((id *)&v19->_rootCertificate, a11);
    objc_storeStrong((id *)&v19->_intermediateCertificate, a10);
    objc_storeStrong((id *)&v19->_operationalCertificate, a9);
    objc_storeStrong((id *)&v19->_operationalKeypair, a8);
    operationalCertificateIssuer = v19->_operationalCertificateIssuer;
    v19->_operationalCertificateIssuer = 0;

    operationalCertificateIssuerQueue = v19->_operationalCertificateIssuerQueue;
    v19->_operationalCertificateIssuerQueue = 0;

    objc_storeStrong((id *)&v19->_storageDelegate, a3);
    objc_storeStrong((id *)&v19->_storageDelegateQueue, a4);
    objc_storeStrong((id *)&v19->_uniqueIdentifier, a5);
    v19->_concurrentSubscriptionEstablishmentsAllowedOnThread = 300;
    v24 = v19;
  }

  return v19;
}

- (void)setOperationalCertificateIssuer:(id)a3 queue:(id)a4
{
  MTROperationalCertificateIssuer *v6;
  OS_dispatch_queue *v7;
  MTROperationalCertificateIssuer *operationalCertificateIssuer;
  OS_dispatch_queue *operationalCertificateIssuerQueue;
  MTROperationalCertificateIssuer *v10;

  v6 = (MTROperationalCertificateIssuer *)a3;
  v7 = (OS_dispatch_queue *)a4;
  operationalCertificateIssuer = self->_operationalCertificateIssuer;
  self->_operationalCertificateIssuer = v6;
  v10 = v6;

  operationalCertificateIssuerQueue = self->_operationalCertificateIssuerQueue;
  self->_operationalCertificateIssuerQueue = v7;

}

- (void)setOTAProviderDelegate:(id)a3 queue:(id)a4
{
  MTROTAProviderDelegate *v6;
  OS_dispatch_queue *v7;
  MTROTAProviderDelegate *otaProviderDelegate;
  OS_dispatch_queue *otaProviderDelegateQueue;
  MTROTAProviderDelegate *v10;

  v6 = (MTROTAProviderDelegate *)a3;
  v7 = (OS_dispatch_queue *)a4;
  otaProviderDelegate = self->_otaProviderDelegate;
  self->_otaProviderDelegate = v6;
  v10 = v6;

  otaProviderDelegateQueue = self->_otaProviderDelegateQueue;
  self->_otaProviderDelegateQueue = v7;

}

- (NSArray)productAttestationAuthorityCertificates
{
  return self->_productAttestationAuthorityCertificates;
}

- (void)setProductAttestationAuthorityCertificates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)certificationDeclarationCertificates
{
  return self->_certificationDeclarationCertificates;
}

- (void)setCertificationDeclarationCertificates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)shouldAdvertiseOperational
{
  return self->_shouldAdvertiseOperational;
}

- (void)setShouldAdvertiseOperational:(BOOL)a3
{
  self->_shouldAdvertiseOperational = a3;
}

- (unint64_t)concurrentSubscriptionEstablishmentsAllowedOnThread
{
  return self->_concurrentSubscriptionEstablishmentsAllowedOnThread;
}

- (void)setConcurrentSubscriptionEstablishmentsAllowedOnThread:(unint64_t)a3
{
  self->_concurrentSubscriptionEstablishmentsAllowedOnThread = a3;
}

- (MTRDeviceStorageBehaviorConfiguration)storageBehaviorConfiguration
{
  return self->_storageBehaviorConfiguration;
}

- (void)setStorageBehaviorConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSData)ipk
{
  return self->_ipk;
}

- (NSNumber)vendorID
{
  return self->_vendorID;
}

- (NSData)rootCertificate
{
  return self->_rootCertificate;
}

- (NSData)intermediateCertificate
{
  return self->_intermediateCertificate;
}

- (NSData)operationalCertificate
{
  return self->_operationalCertificate;
}

- (MTRKeypair)operationalKeypair
{
  return self->_operationalKeypair;
}

- (MTROperationalCertificateIssuer)operationalCertificateIssuer
{
  return self->_operationalCertificateIssuer;
}

- (OS_dispatch_queue)operationalCertificateIssuerQueue
{
  return self->_operationalCertificateIssuerQueue;
}

- (MTRDeviceControllerStorageDelegate)storageDelegate
{
  return self->_storageDelegate;
}

- (OS_dispatch_queue)storageDelegateQueue
{
  return self->_storageDelegateQueue;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (MTROTAProviderDelegate)otaProviderDelegate
{
  return self->_otaProviderDelegate;
}

- (OS_dispatch_queue)otaProviderDelegateQueue
{
  return self->_otaProviderDelegateQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otaProviderDelegateQueue, 0);
  objc_storeStrong((id *)&self->_otaProviderDelegate, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_storageDelegateQueue, 0);
  objc_storeStrong((id *)&self->_storageDelegate, 0);
  objc_storeStrong((id *)&self->_operationalCertificateIssuerQueue, 0);
  objc_storeStrong((id *)&self->_operationalCertificateIssuer, 0);
  objc_storeStrong((id *)&self->_operationalKeypair, 0);
  objc_storeStrong((id *)&self->_operationalCertificate, 0);
  objc_storeStrong((id *)&self->_intermediateCertificate, 0);
  objc_storeStrong((id *)&self->_rootCertificate, 0);
  objc_storeStrong((id *)&self->_vendorID, 0);
  objc_storeStrong((id *)&self->_ipk, 0);
  objc_storeStrong((id *)&self->_storageBehaviorConfiguration, 0);
  objc_storeStrong((id *)&self->_certificationDeclarationCertificates, 0);
  objc_storeStrong((id *)&self->_productAttestationAuthorityCertificates, 0);
}

@end
