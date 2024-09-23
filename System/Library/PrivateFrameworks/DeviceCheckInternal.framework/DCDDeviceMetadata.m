@implementation DCDDeviceMetadata

- (DCDDeviceMetadata)initWithContext:(id)a3 cryptoProxy:(id)a4
{
  id v7;
  id v8;
  DCDDeviceMetadata *v9;
  DCDDeviceMetadata *v10;

  v7 = a3;
  v8 = a4;
  v9 = -[DCDDeviceMetadata init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cryptoProxy, a4);
    objc_storeStrong((id *)&v10->_context, a3);
  }

  return v10;
}

- (void)generateEncryptedBlobWithCompletion:(id)a3
{
  id v4;
  DCContext *context;
  DCCryptoProxy *cryptoProxy;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  cryptoProxy = self->_cryptoProxy;
  context = self->_context;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __57__DCDDeviceMetadata_generateEncryptedBlobWithCompletion___block_invoke;
  v8[3] = &unk_24ED11560;
  v9 = v4;
  v7 = v4;
  -[DCCryptoProxy fetchOpaqueBlobWithContext:completion:](cryptoProxy, "fetchOpaqueBlobWithContext:completion:", context, v8);

}

void __57__DCDDeviceMetadata_generateEncryptedBlobWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(v2 + 16))(*(_QWORD *)(a1 + 32), a2, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "dc_errorWithCode:", 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v2 + 16))(v2, 0, v3);

  }
}

- (void)baaSignatureForData:(id)a3 completion:(id)a4
{
  -[DCCryptoProxy baaSignatureForData:completion:](self->_cryptoProxy, "baaSignatureForData:completion:", a3, a4);
}

- (void)baaSignaturesForData:(id)a3 completion:(id)a4
{
  -[DCCryptoProxy baaSignaturesForData:completion:](self->_cryptoProxy, "baaSignaturesForData:completion:", a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_cryptoProxy, 0);
}

@end
