@implementation MCLockdownGetDeviceIntermediateCertificates

void __MCLockdownGetDeviceIntermediateCertificates_block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", CFSTR("/System/Library/Lockdown/iPhoneDeviceCA.pem"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  MCLockdownGetDeviceIntermediateCertificates_iPhoneDeviceCA = +[MCCrypto copyCertificateRefFromPEMData:](MCCrypto, "copyCertificateRefFromPEMData:", v1);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", CFSTR("/System/Library/Lockdown/iPhoneCA.pem"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  MCLockdownGetDeviceIntermediateCertificates_iPhoneCA = +[MCCrypto copyCertificateRefFromPEMData:](MCCrypto, "copyCertificateRefFromPEMData:", v0);

}

@end
