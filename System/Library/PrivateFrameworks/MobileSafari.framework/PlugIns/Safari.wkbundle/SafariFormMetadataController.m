@implementation SafariFormMetadataController

- (void)invalidate
{
  QuickWebsiteSearchEventListener *quickWebsiteSearchEventListener;
  objc_super v4;

  quickWebsiteSearchEventListener = self->_quickWebsiteSearchEventListener;
  self->_quickWebsiteSearchEventListener = 0;

  v4.receiver = self;
  v4.super_class = (Class)SafariFormMetadataController;
  -[_SFFormMetadataController invalidate](&v4, sel_invalidate);
}

- (void)didFindSearchURLTemplateString:(id)a3 inFrame:(id)a4 pageController:(id)a5
{
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  QuickWebsiteSearchEventListener *quickWebsiteSearchEventListener;
  void *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  QuickWebsiteSearchEventListener *v24;
  QuickWebsiteSearchEventListener *v25;
  void *v26;
  const char *v27;
  id v28;

  v28 = a3;
  v11 = a4;
  quickWebsiteSearchEventListener = self->_quickWebsiteSearchEventListener;
  if (!quickWebsiteSearchEventListener)
  {
    v13 = (void *)MEMORY[0x24BDFA9B0];
    v14 = a5;
    objc_msgSend_remoteObjectInterfaceWithProtocol_(v13, v15, (uint64_t)&unk_2559299B0, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__remoteObjectRegistry(v14, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_remoteObjectProxyWithInterface_(v21, v22, (uint64_t)v17, v23);
    v24 = (QuickWebsiteSearchEventListener *)objc_claimAutoreleasedReturnValue();
    v25 = self->_quickWebsiteSearchEventListener;
    self->_quickWebsiteSearchEventListener = v24;

    quickWebsiteSearchEventListener = self->_quickWebsiteSearchEventListener;
  }
  objc_msgSend_URL(v11, v8, v9, v10);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_didAutoDetectSiteSpecificSearchProviderWithOriginatingURL_searchURLTemplate_(quickWebsiteSearchEventListener, v27, (uint64_t)v26, (uint64_t)v28);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quickWebsiteSearchEventListener, 0);
}

@end
