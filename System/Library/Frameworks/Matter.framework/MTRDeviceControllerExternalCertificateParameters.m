@implementation MTRDeviceControllerExternalCertificateParameters

- (MTRDeviceControllerExternalCertificateParameters)initWithStorageDelegate:(id)a3 storageDelegateQueue:(id)a4 uniqueIdentifier:(id)a5 ipk:(id)a6 vendorID:(id)a7 operationalKeypair:(id)a8 operationalCertificate:(id)a9 intermediateCertificate:(id)a10 rootCertificate:(id)a11
{
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MTRDeviceControllerExternalCertificateParameters;
  return -[MTRDeviceControllerParameters initWithStorageDelegate:storageDelegateQueue:uniqueIdentifier:ipk:vendorID:operationalKeypair:operationalCertificate:intermediateCertificate:rootCertificate:](&v12, sel_initWithStorageDelegate_storageDelegateQueue_uniqueIdentifier_ipk_vendorID_operationalKeypair_operationalCertificate_intermediateCertificate_rootCertificate_, a3, a4, a5, a6, a7, a8, a9, a10, a11);
}

@end
