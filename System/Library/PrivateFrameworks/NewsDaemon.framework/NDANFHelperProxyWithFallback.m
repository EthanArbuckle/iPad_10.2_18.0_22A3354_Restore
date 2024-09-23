@implementation NDANFHelperProxyWithFallback

- (NDANFHelperProxyWithFallback)init
{
  NDANFHelperProxyWithFallback *v2;
  NDANFHelperProxy *v3;
  NDANFHelperProxy *proxyHelper;
  NDANFHelper *v5;
  NDANFHelper *inProcessHelper;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NDANFHelperProxyWithFallback;
  v2 = -[NDANFHelperProxyWithFallback init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(NDANFHelperProxy);
    proxyHelper = v2->_proxyHelper;
    v2->_proxyHelper = v3;

    v5 = objc_alloc_init(NDANFHelper);
    inProcessHelper = v2->_inProcessHelper;
    v2->_inProcessHelper = v5;

  }
  return v2;
}

- (void)pushInterest
{
  void *v3;
  id v4;

  -[NDANFHelperProxyWithFallback proxyHelper](self, "proxyHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pushInterest");

  -[NDANFHelperProxyWithFallback inProcessHelper](self, "inProcessHelper");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pushInterest");

}

- (void)popInterest
{
  void *v3;
  id v4;

  -[NDANFHelperProxyWithFallback proxyHelper](self, "proxyHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "popInterest");

  -[NDANFHelperProxyWithFallback inProcessHelper](self, "inProcessHelper");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "popInterest");

}

- (id)manifestFromANFDocumentData:(id)a3
{
  id v4;
  void *v5;
  os_log_t *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  uint8_t v11[16];
  uint8_t buf[15];
  char v13;

  v4 = a3;
  v13 = 0;
  -[NDANFHelperProxy manifestFromANFDocumentData:reachedService:](self->_proxyHelper, "manifestFromANFDocumentData:reachedService:", v4, &v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (os_log_t *)MEMORY[0x1E0D583E8];
  if (!v13)
    goto LABEL_6;
  v7 = *MEMORY[0x1E0D583E8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D583E8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D7105000, v7, OS_LOG_TYPE_DEFAULT, "Decoded ANF via XPC Service", buf, 2u);
  }
  if (v13)
  {
    v8 = v5;
  }
  else
  {
LABEL_6:
    -[NDANFHelper manifestFromANFDocumentData:](self->_inProcessHelper, "manifestFromANFDocumentData:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1D7105000, v9, OS_LOG_TYPE_DEFAULT, "Decoded ANF in process", v11, 2u);
    }
  }

  return v8;
}

- (NDANFHelperProxy)proxyHelper
{
  return self->_proxyHelper;
}

- (NDANFHelper)inProcessHelper
{
  return self->_inProcessHelper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inProcessHelper, 0);
  objc_storeStrong((id *)&self->_proxyHelper, 0);
}

@end
