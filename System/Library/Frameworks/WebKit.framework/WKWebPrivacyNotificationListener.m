@implementation WKWebPrivacyNotificationListener

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (WKWebPrivacyNotificationListener)init
{
  WKWebPrivacyNotificationListener *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WKWebPrivacyNotificationListener;
  v2 = -[WKWebPrivacyNotificationListener init](&v5, sel_init);
  if (v2 && PAL::WebPrivacyLibrary((PAL *)1))
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_didUpdate_, PAL::get_WebPrivacy_WPResourceDataChangedNotificationName((PAL *)v3), 0);
  }
  return v2;
}

- (void)listenForStorageAccessUserAgentStringQuirkChanges:(id)a3
{
  void *v4;

  v4 = _Block_copy(a3);
  _Block_release(self->_storageAccessUserAgentStringQuirksDataCallback.m_block);
  self->_storageAccessUserAgentStringQuirksDataCallback.m_block = v4;
  _Block_release(0);
}

- (void)listenForStorageAccessPromptQuirkChanges:(id)a3
{
  void *v4;

  v4 = _Block_copy(a3);
  _Block_release(self->_storageAccessPromptQuirksDataCallback.m_block);
  self->_storageAccessPromptQuirksDataCallback.m_block = v4;
  _Block_release(0);
}

- (void)listenForLinkFilteringDataChanges:(id)a3
{
  void *v4;

  v4 = _Block_copy(a3);
  _Block_release(self->_linkFilteringDataCallback.m_block);
  self->_linkFilteringDataCallback.m_block = v4;
  _Block_release(0);
}

- (void)listenForRestrictedOpenerDomainsChanges:(id)a3
{
  void *v4;

  v4 = _Block_copy(a3);
  _Block_release(self->_restrictedOpenerDomainsCallback.m_block);
  self->_restrictedOpenerDomainsCallback.m_block = v4;
  _Block_release(0);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (PAL::WebPrivacyLibrary((PAL *)1))
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    objc_msgSend(v3, "removeObserver:name:object:", self, PAL::get_WebPrivacy_WPResourceDataChangedNotificationName((PAL *)v3), 0);
  }
  v4.receiver = self;
  v4.super_class = (Class)WKWebPrivacyNotificationListener;
  -[WKWebPrivacyNotificationListener dealloc](&v4, sel_dealloc);
}

- (void)didUpdate:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend(a3, "userInfo");
  v5 = (void *)objc_msgSend(v4, "objectForKey:", PAL::get_WebPrivacy_WPNotificationUserInfoResourceTypeKey((PAL *)v4));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && v5)
  {
    if (self->_linkFilteringDataCallback.m_block && objc_msgSend(v5, "integerValue") == 2)
      (*((void (**)(void))self->_linkFilteringDataCallback.m_block + 2))();
    if (self->_storageAccessPromptQuirksDataCallback.m_block && objc_msgSend(v5, "integerValue") == 7)
      (*((void (**)(void))self->_storageAccessPromptQuirksDataCallback.m_block + 2))();
    if (self->_storageAccessUserAgentStringQuirksDataCallback.m_block && objc_msgSend(v5, "integerValue") == 6)
      (*((void (**)(void))self->_storageAccessUserAgentStringQuirksDataCallback.m_block + 2))();
    if (self->_restrictedOpenerDomainsCallback.m_block)
    {
      if (objc_msgSend(v5, "integerValue") == 8)
        (*((void (**)(void))self->_restrictedOpenerDomainsCallback.m_block + 2))();
    }
  }
}

- (void).cxx_destruct
{
  _Block_release(self->_restrictedOpenerDomainsCallback.m_block);
  _Block_release(self->_storageAccessUserAgentStringQuirksDataCallback.m_block);
  _Block_release(self->_storageAccessPromptQuirksDataCallback.m_block);
  _Block_release(self->_linkFilteringDataCallback.m_block);
}

@end
