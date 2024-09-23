@implementation HMDHomeWalletKeyISOCredentialACWG

- (HMDHomeWalletKeyISOCredentialACWG)initWithIssuerKeyPairExternalRepresentation:(id)a3 deviceCredentialPublicKeyExternalRepresentation:(id)a4
{
  id v7;
  id v8;
  HMDHomeWalletKeyISOCredentialACWG *v9;
  HMDHomeWalletKeyISOCredentialACWG *v10;
  uint64_t v11;
  CIDCPayloadBuilder *credentialBuilder;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDHomeWalletKeyISOCredentialACWG;
  v9 = -[HMDHomeWalletKeyISOCredentialACWG init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_issuerKeyPairExternalRepresentation, a3);
    objc_storeStrong((id *)&v10->_deviceCredentialPublicKeyExternalRepresentation, a4);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BE1BE08]), "initWithDelegate:", v10);
    credentialBuilder = v10->_credentialBuilder;
    v10->_credentialBuilder = (CIDCPayloadBuilder *)v11;

  }
  return v10;
}

- (void)encodeWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  _QWORD v44[5];
  id v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  void *v50;
  const __CFString *v51;
  _QWORD v52[3];

  v52[1] = *MEMORY[0x24BDAC8D0];
  v41 = a3;
  -[HMDHomeWalletKeyISOCredentialACWG deviceCredentialPublicKeyExternalRepresentation](self, "deviceCredentialPublicKeyExternalRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDHomeNFCReaderKey publicKeyWithPublicKeyExternalRepresentation:](HMDHomeNFCReaderKey, "publicKeyWithPublicKeyExternalRepresentation:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "subdataWithRange:", 0, 32);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subdataWithRange:", 32, 32);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)v6;
  v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE10208]), "initEC2WithAlgorithm:curveIdentifier:x:y:d:keyOperations:keyIdentifier:", -7, 1, v6, v42, 0, 0, 0);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithCOSEKey:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeWalletKeyISOCredentialACWG issuerKeyPairExternalRepresentation](self, "issuerKeyPairExternalRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDNIST256Utilities publicKeyFromKeyPairExternalRepresentation:](HMDNIST256Utilities, "publicKeyFromKeyPairExternalRepresentation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[HMDNIST256Utilities identifier8BytesForKey:](HMDNIST256Utilities, "identifier8BytesForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = CFSTR("ACWG-access");
  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1BE00]), "initWithElementIdentifier:dataValue:", CFSTR("credential_id"), v10);
  v50 = v39;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v50, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x227676638]();
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "hmf_hexadecimalRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v47 = v15;
    v48 = 2112;
    v49 = v16;
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@ISOCredentialEncode deviceCredentialPublicKey x: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v13);
  v17 = (void *)MEMORY[0x227676638]();
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "hmf_hexadecimalRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v47 = v19;
    v48 = 2112;
    v49 = v20;
    _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@ISOCredentialEncode deviceCredentialPublicKey y: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v17);
  v21 = (void *)MEMORY[0x227676638]();
  HMFGetOSLogHandle();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hmf_hexadecimalRepresentation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v47 = v23;
    v48 = 2112;
    v49 = v24;
    _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@ISOCredentialEncode dataWithCOSEKey: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v21);
  v25 = (void *)MEMORY[0x227676638]();
  HMFGetOSLogHandle();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hmf_hexadecimalRepresentation");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v47 = v27;
    v48 = 2112;
    v49 = v28;
    _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@ISOCredentialEncode issuerPublicKey: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v25);
  v29 = (void *)MEMORY[0x227676638]();
  HMFGetOSLogHandle();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hmf_hexadecimalRepresentation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v47 = v31;
    v48 = 2112;
    v49 = v32;
    _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_INFO, "%{public}@ISOCredentialEncode credentialId: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v29);
  v33 = objc_alloc(MEMORY[0x24BE1BE10]);
  objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v33, "initWithFormat:docType:elements:validFrom:validUntil:deviceKey:signingAlgorithm:", 1, CFSTR("ACWG-access-cred"), v12, v34, v35, v7, -7);

  -[HMDHomeWalletKeyISOCredentialACWG credentialBuilder](self, "credentialBuilder");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = MEMORY[0x24BDAC760];
  v44[1] = 3221225472;
  v44[2] = __58__HMDHomeWalletKeyISOCredentialACWG_encodeWithCompletion___block_invoke;
  v44[3] = &unk_24E7934D8;
  v44[4] = self;
  v45 = v41;
  v38 = v41;
  objc_msgSend(v37, "buildPayloadWithDetails:completion:", v36, v44);

}

- (void)signPayloadWithBuilder:(id)a3 data:(id)a4 completion:(id)a5
{
  const __CFData *v7;
  void (**v8)(id, void *, _QWORD);
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  const __CFDictionary *v13;
  const __CFData *v14;
  __SecKey *v15;
  CFDataRef v16;
  void *v17;
  CFErrorRef v18;
  CFErrorRef error;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  v7 = (const __CFData *)a4;
  v8 = (void (**)(id, void *, _QWORD))a5;
  -[HMDHomeWalletKeyISOCredentialACWG issuerKeyPairExternalRepresentation](self, "issuerKeyPairExternalRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDNIST256Utilities publicKeyFromKeyPairExternalRepresentation:](HMDNIST256Utilities, "publicKeyFromKeyPairExternalRepresentation:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  error = 0;
  v11 = *MEMORY[0x24BDE9050];
  v20[0] = *MEMORY[0x24BDE9028];
  v20[1] = v11;
  v12 = *MEMORY[0x24BDE9060];
  v21[0] = *MEMORY[0x24BDE9030];
  v21[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v13 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeWalletKeyISOCredentialACWG issuerKeyPairExternalRepresentation](self, "issuerKeyPairExternalRepresentation");
  v14 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  v15 = SecKeyCreateWithData(v14, v13, &error);

  if (v15)
  {
    v18 = 0;
    v16 = SecKeyCreateSignature(v15, (SecKeyAlgorithm)*MEMORY[0x24BDE92B0], v7, &v18);
    if (v16)
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1BDF8]), "initWithSigningAlgorithm:issuerKey:signature:", -7, v10, v16);
      v8[2](v8, v17, 0);

    }
    else
    {
      ((void (**)(id, void *, CFErrorRef))v8)[2](v8, 0, v18);
    }

  }
  else
  {
    ((void (**)(id, void *, CFErrorRef))v8)[2](v8, 0, error);
  }

}

- (NSData)issuerKeyPairExternalRepresentation
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (NSData)deviceCredentialPublicKeyExternalRepresentation
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (CIDCPayloadBuilder)credentialBuilder
{
  return (CIDCPayloadBuilder *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentialBuilder, 0);
  objc_storeStrong((id *)&self->_deviceCredentialPublicKeyExternalRepresentation, 0);
  objc_storeStrong((id *)&self->_issuerKeyPairExternalRepresentation, 0);
}

void __58__HMDHomeWalletKeyISOCredentialACWG_encodeWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BDD1398]);
    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:userInfo:", 52, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v7);

  }
}

@end
