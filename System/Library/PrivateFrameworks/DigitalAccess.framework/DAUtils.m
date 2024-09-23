@implementation DAUtils

+ (id)decryptVehicleMobilizationData:(id)a3 forKeyWithIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "encryptedRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ephemeralPublicKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  SESEndPointPrivacyDecryption();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"+[DAUtils decryptVehicleMobilizationData:forKeyWithIdentifier:]", 33, CFSTR("Result of decrypting vehicleMobilizationData: %@"), v11, v12, v13, v14, (uint64_t)v10);

  return v9;
}

@end
