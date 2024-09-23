@implementation MTSDeviceCredential

- (MTSDeviceCredential)initWithCertificationDeclaration:(id)a3 deviceAttestationCertificate:(id)a4 productAttestationIntermediateCertificate:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  MTSDeviceCredential *v12;
  uint64_t v13;
  NSData *certificationDeclaration;
  uint64_t v15;
  NSData *deviceAttestationCertificate;
  uint64_t v17;
  NSData *productAttestationIntermediateCertificate;
  MTSDeviceCredential *v20;
  SEL v21;
  _NSZone *v22;
  objc_super v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v9)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  v11 = v10;
  if (!v10)
  {
LABEL_9:
    v20 = (MTSDeviceCredential *)_HMFPreconditionFailure();
    return (MTSDeviceCredential *)-[MTSDeviceCredential copyWithZone:](v20, v21, v22);
  }
  v23.receiver = self;
  v23.super_class = (Class)MTSDeviceCredential;
  v12 = -[MTSDeviceCredential init](&v23, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v8, "copy");
    certificationDeclaration = v12->_certificationDeclaration;
    v12->_certificationDeclaration = (NSData *)v13;

    v15 = objc_msgSend(v9, "copy");
    deviceAttestationCertificate = v12->_deviceAttestationCertificate;
    v12->_deviceAttestationCertificate = (NSData *)v15;

    v17 = objc_msgSend(v11, "copy");
    productAttestationIntermediateCertificate = v12->_productAttestationIntermediateCertificate;
    v12->_productAttestationIntermediateCertificate = (NSData *)v17;

  }
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[MTSDeviceCredential certificationDeclaration](self, "certificationDeclaration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "certificationDeclaration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      -[MTSDeviceCredential deviceAttestationCertificate](self, "deviceAttestationCertificate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "deviceAttestationCertificate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqual:", v10))
      {
        -[MTSDeviceCredential productAttestationIntermediateCertificate](self, "productAttestationIntermediateCertificate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "productAttestationIntermediateCertificate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[MTSDeviceCredential certificationDeclaration](self, "certificationDeclaration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[MTSDeviceCredential deviceAttestationCertificate](self, "deviceAttestationCertificate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[MTSDeviceCredential productAttestationIntermediateCertificate](self, "productAttestationIntermediateCertificate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (MTSDeviceCredential)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  void *v11;
  NSObject *v12;
  void *v13;
  MTSDeviceCredential *v14;
  MTSDeviceCredential *v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTSDC.ck.certificationDeclaration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTSDC.ck.deviceAttestationCertificate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTSDC.ck.productAttestationIntermediateCertificate"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v5)
    v9 = v6 == 0;
  else
    v9 = 1;
  if (v9 || v7 == 0)
  {
    v11 = (void *)MEMORY[0x23493F978]();
    v14 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138544130;
      v18 = v13;
      v19 = 2112;
      v20 = v5;
      v21 = 2112;
      v22 = v6;
      v23 = 2112;
      v24 = v8;
      _os_log_impl(&dword_2344FE000, v12, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded certificationDeclaration: %@, deviceAttestationCertificate: %@, productAttestationIntermediateCertificate: %@", (uint8_t *)&v17, 0x2Au);

    }
    objc_autoreleasePoolPop(v11);
    v15 = 0;
  }
  else
  {
    v14 = -[MTSDeviceCredential initWithCertificationDeclaration:deviceAttestationCertificate:productAttestationIntermediateCertificate:](self, "initWithCertificationDeclaration:deviceAttestationCertificate:productAttestationIntermediateCertificate:", v5, v6, v7);
    v15 = v14;
  }

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[MTSDeviceCredential certificationDeclaration](self, "certificationDeclaration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("MTSDC.ck.certificationDeclaration"));

  -[MTSDeviceCredential deviceAttestationCertificate](self, "deviceAttestationCertificate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("MTSDC.ck.deviceAttestationCertificate"));

  -[MTSDeviceCredential productAttestationIntermediateCertificate](self, "productAttestationIntermediateCertificate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("MTSDC.ck.productAttestationIntermediateCertificate"));

}

- (NSData)certificationDeclaration
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (NSData)deviceAttestationCertificate
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (NSData)productAttestationIntermediateCertificate
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productAttestationIntermediateCertificate, 0);
  objc_storeStrong((id *)&self->_deviceAttestationCertificate, 0);
  objc_storeStrong((id *)&self->_certificationDeclaration, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
