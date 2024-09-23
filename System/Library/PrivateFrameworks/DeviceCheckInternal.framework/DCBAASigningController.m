@implementation DCBAASigningController

- (DCCryptoProxyImpl)cryptoProxy
{
  DCCryptoProxyImpl *cryptoProxy;
  DCCryptoProxyImpl *v4;
  DCCryptoProxyImpl *v5;

  cryptoProxy = self->_cryptoProxy;
  if (!cryptoProxy)
  {
    v4 = objc_alloc_init(DCCryptoProxyImpl);
    v5 = self->_cryptoProxy;
    self->_cryptoProxy = v4;

    cryptoProxy = self->_cryptoProxy;
  }
  return cryptoProxy;
}

- (void)baaSignatureForData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[DCBAASigningController cryptoProxy](self, "cryptoProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "baaSignatureForData:completion:", v7, v6);

}

- (void)baaSignaturesForData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[DCBAASigningController cryptoProxy](self, "cryptoProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "baaSignaturesForData:completion:", v7, v6);

}

- (void)setCryptoProxy:(id)a3
{
  objc_storeStrong((id *)&self->_cryptoProxy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cryptoProxy, 0);
}

@end
