@implementation DCCryptoProxyImpl

- (void)fetchOpaqueBlobWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  _DCLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_224FB2000, v8, OS_LOG_TYPE_DEFAULT, "Generating certificate...", buf, 2u);
  }

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __59__DCCryptoProxyImpl_fetchOpaqueBlobWithContext_completion___block_invoke;
  v11[3] = &unk_24ED11618;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[DCCryptoProxyImpl _fetchPublicKey:](self, "_fetchPublicKey:", v11);

}

void __59__DCCryptoProxyImpl_fetchOpaqueBlobWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  DCCertificateGenerator *v4;

  v3 = a2;
  v4 = -[DCCertificateGenerator initWithContext:publicKey:]([DCCertificateGenerator alloc], "initWithContext:publicKey:", *(_QWORD *)(a1 + 32), v3);

  -[DCCertificateGenerator generateEncryptedCertificateChainWithCompletion:](v4, "generateEncryptedCertificateChainWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)_fetchPublicKey:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  +[DCAssetFetcher sharedFetcher](DCAssetFetcher, "sharedFetcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __37__DCCryptoProxyImpl__fetchPublicKey___block_invoke;
  v6[3] = &unk_24ED11640;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "fetchPublicKeyAssetWithCompletion:", v6);

}

void __37__DCCryptoProxyImpl__fetchPublicKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "publicKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _DCLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_224FB2000, v8, OS_LOG_TYPE_DEFAULT, "Fetched remote public key...", (uint8_t *)&v13, 2u);
    }

    v10 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "publicKey");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v9)
    {
      v13 = 138412290;
      v14 = v6;
      _os_log_impl(&dword_224FB2000, v8, OS_LOG_TYPE_DEFAULT, "Falling back to locally cached key... Asset fetch failed: %@", (uint8_t *)&v13, 0xCu);
    }

    v10 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &fallback_server_pubkey, 65);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v11;
  (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v10, v11);

}

- (void)baaSignatureForData:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  v5 = a4;
  v6 = a3;
  _DCLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_224FB2000, v7, OS_LOG_TYPE_DEFAULT, "Signing with baa certs for data...", v9, 2u);
  }

  +[DCBAASigner sharedSigner](DCBAASigner, "sharedSigner");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "signatureForData:completion:", v6, v5);

}

- (void)baaSignaturesForData:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  _DCLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[DCCryptoProxyImpl baaSignaturesForData:completion:].cold.1(v7);

  +[DCBAASigner sharedSigner](DCBAASigner, "sharedSigner");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "signaturesForData:completion:", v6, v5);

}

- (void)baaSignaturesForData:(os_log_t)log completion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_224FB2000, log, OS_LOG_TYPE_DEBUG, "Signing with baa certs for dictionary", v1, 2u);
}

@end
