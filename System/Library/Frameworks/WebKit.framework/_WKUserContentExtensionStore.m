@implementation _WKUserContentExtensionStore

+ (id)defaultStore
{
  return (id)(id)CFMakeCollectable(-[_WKUserContentExtensionStore _initWithWKContentRuleListStore:]([_WKUserContentExtensionStore alloc], "_initWithWKContentRuleListStore:", +[WKContentRuleListStore defaultStoreWithLegacyFilename](WKContentRuleListStore, "defaultStoreWithLegacyFilename")));
}

+ (id)storeWithURL:(id)a3
{
  return (id)(id)CFMakeCollectable(-[_WKUserContentExtensionStore _initWithWKContentRuleListStore:]([_WKUserContentExtensionStore alloc], "_initWithWKContentRuleListStore:", +[WKContentRuleListStore storeWithURLAndLegacyFilename:](WKContentRuleListStore, "storeWithURLAndLegacyFilename:", a3)));
}

- (void)compileContentExtensionForIdentifier:(id)a3 encodedContentExtension:(id)a4 completionHandler:(id)a5
{
  void *m_ptr;
  _QWORD v6[5];

  m_ptr = self->_contentRuleListStore.m_ptr;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __111___WKUserContentExtensionStore_compileContentExtensionForIdentifier_encodedContentExtension_completionHandler___block_invoke;
  v6[3] = &unk_1E34C3F60;
  v6[4] = a5;
  objc_msgSend(m_ptr, "compileContentRuleListForIdentifier:encodedContentRuleList:completionHandler:", a3, a4, v6);
}

- (void)lookupContentExtensionForIdentifier:(id)a3 completionHandler:(id)a4
{
  void *m_ptr;
  _QWORD v5[5];

  m_ptr = self->_contentRuleListStore.m_ptr;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __86___WKUserContentExtensionStore_lookupContentExtensionForIdentifier_completionHandler___block_invoke;
  v5[3] = &unk_1E34C3F60;
  v5[4] = a4;
  objc_msgSend(m_ptr, "lookUpContentRuleListForIdentifier:completionHandler:", a3, v5);
}

- (void)removeContentExtensionForIdentifier:(id)a3 completionHandler:(id)a4
{
  void *m_ptr;
  _QWORD v5[5];

  m_ptr = self->_contentRuleListStore.m_ptr;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __86___WKUserContentExtensionStore_removeContentExtensionForIdentifier_completionHandler___block_invoke;
  v5[3] = &unk_1E34C3F88;
  v5[4] = a4;
  objc_msgSend(m_ptr, "removeContentRuleListForIdentifier:completionHandler:", a3, v5);
}

- (Object)_apiObject
{
  return (Object *)objc_msgSend(self->_contentRuleListStore.m_ptr, "_apiObject");
}

- (void).cxx_destruct
{
  void *m_ptr;

  m_ptr = self->_contentRuleListStore.m_ptr;
  self->_contentRuleListStore.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

- (void)_removeAllContentExtensions
{
  objc_msgSend(self->_contentRuleListStore.m_ptr, "_removeAllContentRuleLists");
}

- (void)_invalidateContentExtensionVersionForIdentifier:(id)a3
{
  objc_msgSend(self->_contentRuleListStore.m_ptr, "_invalidateContentRuleListVersionForIdentifier:", a3);
}

- (id)_initWithWKContentRuleListStore:(id)a3
{
  _WKUserContentExtensionStore *v4;
  void *m_ptr;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_WKUserContentExtensionStore;
  v4 = -[_WKUserContentExtensionStore init](&v7, sel_init);
  if (v4)
  {
    if (a3)
      CFRetain(a3);
    m_ptr = v4->_contentRuleListStore.m_ptr;
    v4->_contentRuleListStore.m_ptr = a3;
    if (m_ptr)
      CFRelease(m_ptr);
  }
  return v4;
}

- (WKContentRuleListStore)_contentRuleListStore
{
  return (WKContentRuleListStore *)self->_contentRuleListStore.m_ptr;
}

@end
