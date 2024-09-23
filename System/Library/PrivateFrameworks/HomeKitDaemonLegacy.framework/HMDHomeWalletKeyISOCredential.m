@implementation HMDHomeWalletKeyISOCredential

- (HMDHomeWalletKeyISOCredential)initWithHAPPairingIdentity:(id)a3 deviceCredentialKeyExternalRepresentation:(id)a4
{
  id v7;
  id v8;
  HMDHomeWalletKeyISOCredential *v9;
  HMDHomeWalletKeyISOCredential *v10;
  uint64_t v11;
  CIDCPayloadBuilder *credentialBuilder;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDHomeWalletKeyISOCredential;
  v9 = -[HMDHomeWalletKeyISOCredential init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_pairingIdentity, a3);
    objc_storeStrong((id *)&v10->_deviceCredentialKeyExternalRepresentation, a4);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0D168E8]), "initWithDelegate:", v10);
    credentialBuilder = v10->_credentialBuilder;
    v10->_credentialBuilder = (CIDCPayloadBuilder *)v11;

  }
  return v10;
}

- (void)encodeWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  void *v24;
  const __CFString *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v19 = a3;
  -[HMDHomeWalletKeyISOCredential deviceCredentialKeyExternalRepresentation](self, "deviceCredentialKeyExternalRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDHomeNFCReaderKey publicKeyWithPublicKeyExternalRepresentation:](HMDHomeNFCReaderKey, "publicKeyWithPublicKeyExternalRepresentation:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "subdataWithRange:", 0, 32);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subdataWithRange:", 32, 32);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D038C0]), "initEC2WithAlgorithm:curveIdentifier:x:y:d:keyOperations:keyIdentifier:", -7, 1, v21, v20, 0, 0, 0);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithCOSEKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeWalletKeyISOCredential pairingIdentity](self, "pairingIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDHome nfcIssuerKeyIdentifierWithPairingIdentity:](HMDHome, "nfcIssuerKeyIdentifierWithPairingIdentity:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D168E0]), "initWithElementIdentifier:dataValue:", CFSTR("credential_id"), v9);
  v24 = v10;
  v25 = CFSTR("com.apple.HomeKit");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_alloc(MEMORY[0x1E0D168F0]);
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v13, "initWithFormat:docType:elements:validFrom:validUntil:deviceKey:signingAlgorithm:", 0, CFSTR("com.apple.HomeKit.1.credential"), v12, v14, v15, v7, -8);

  -[HMDHomeWalletKeyISOCredential credentialBuilder](self, "credentialBuilder");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __54__HMDHomeWalletKeyISOCredential_encodeWithCompletion___block_invoke;
  v22[3] = &unk_1E89A86C0;
  v22[4] = self;
  v23 = v19;
  v18 = v19;
  objc_msgSend(v17, "buildPayloadWithDetails:completion:", v16, v22);

}

- (void)signPayloadWithBuilder:(id)a3 data:(id)a4 completion:(id)a5
{
  void (**v7)(id, void *, _QWORD);
  id v8;
  void *v9;
  void *v10;
  id v11;
  __int128 *v12;
  void *v13;
  void *v14;
  id v15;
  __int128 *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _OWORD v28[4];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  memset(v28, 0, sizeof(v28));
  v7 = (void (**)(id, void *, _QWORD))a5;
  v8 = a4;
  -[HMDHomeWalletKeyISOCredential pairingIdentity](self, "pairingIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "publicKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "data");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12 = (__int128 *)objc_msgSend(v11, "bytes");
  v26 = *v12;
  v27 = v12[1];

  -[HMDHomeWalletKeyISOCredential pairingIdentity](self, "pairingIdentity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "privateKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "data");
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v16 = (__int128 *)objc_msgSend(v15, "bytes");
  v24 = *v16;
  v25 = v16[1];

  v17 = objc_retainAutorelease(v8);
  objc_msgSend(v17, "bytes", v24, v25, v26, v27, 0, 0, 0, 0, 0, 0, 0, 0);
  objc_msgSend(v17, "length");

  cced25519_sign_compat();
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v28, 64);
  v19 = objc_alloc(MEMORY[0x1E0D168D8]);
  -[HMDHomeWalletKeyISOCredential pairingIdentity](self, "pairingIdentity");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "publicKey");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "data");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v19, "initWithSigningAlgorithm:issuerKey:signature:", -8, v22, v18);

  v7[2](v7, v23, 0);
}

- (HAPPairingIdentity)pairingIdentity
{
  return (HAPPairingIdentity *)objc_getProperty(self, a2, 8, 1);
}

- (NSData)deviceCredentialKeyExternalRepresentation
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
  objc_storeStrong((id *)&self->_deviceCredentialKeyExternalRepresentation, 0);
  objc_storeStrong((id *)&self->_pairingIdentity, 0);
}

void __54__HMDHomeWalletKeyISOCredential_encodeWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
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
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CB3388]);
    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:userInfo:", 52, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v7);

  }
}

@end
