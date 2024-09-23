@implementation WKUserContentController

- (void)removeAllContentRuleLists
{
  WebKit::WebUserContentControllerProxy::removeAllContentRuleLists((WebKit::WebUserContentControllerProxy *)&self->_userContentControllerProxy, (WTF::StringImpl *)a2);
}

- (void)addUserScript:(WKUserScript *)userScript
{
  WebKit::WebUserContentControllerProxy::addUserScript((uint64_t)&self->_userContentControllerProxy, (uint64_t)&userScript->_userScript, 0);
}

- (void)addContentRuleList:(WKContentRuleList *)contentRuleList
{
  ObjectStorage<WebKit::WebUserContentControllerProxy> *p_userContentControllerProxy;
  ObjectStorage<API::ContentRuleList> *p_contentRuleList;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7[5];

  p_userContentControllerProxy = &self->_userContentControllerProxy;
  p_contentRuleList = &contentRuleList->_contentRuleList;
  WTF::URL::URL((WTF::URL *)v7);
  WebKit::WebUserContentControllerProxy::addContentRuleList((WebKit::WebUserContentControllerProxy *)p_userContentControllerProxy, (API::ContentRuleList *)p_contentRuleList, (const WTF::URL *)v7);
  v6 = v7[0];
  v7[0] = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2)
      WTF::StringImpl::destroy(v6, v5);
    else
      *(_DWORD *)v6 -= 2;
  }
}

- (void)addScriptMessageHandler:(id)scriptMessageHandler name:(NSString *)name
{
  uint64_t v7;
  API::ContentWorld *v8;
  WebKit *v9;
  WTF::StringImpl *v10;
  WTF::StringImpl *v11;
  _DWORD *v12;
  WTF::StringImpl *v13;
  uint64_t v14;
  _DWORD *v15;

  v7 = WTF::fastMalloc((WTF *)0x28);
  ScriptMessageHandlerDelegate::ScriptMessageHandlerDelegate(v7, self, scriptMessageHandler, name);
  v14 = v7;
  v8 = (API::ContentWorld *)MEMORY[0x19AEABCC8](&v13, name);
  v9 = API::ContentWorld::pageContentWorld(v8);
  WebKit::WebScriptMessageHandler::create(&v14, (_DWORD **)&v13, (uint64_t)v9, (uint64_t *)&v15);
  v11 = v13;
  v13 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2)
      WTF::StringImpl::destroy(v11, v10);
    else
      *(_DWORD *)v11 -= 2;
  }
  if (v14)
    (*(void (**)(uint64_t))(*(_QWORD *)v14 + 8))(v14);
  v12 = v15;
  -[WKUserContentController _addScriptMessageHandler:](self, "_addScriptMessageHandler:", v15);
  if (v12)
  {
    if (v12[2] == 1)
      (*(void (**)(_DWORD *))(*(_QWORD *)v12 + 8))(v12);
    else
      --v12[2];
  }
}

- (void)_addScriptMessageHandler:(void *)a3
{
  void *v4;
  WTF::StringImpl *v5;
  const __CFString *v6;
  WTF::StringImpl *v7;

  if ((WebKit::WebUserContentControllerProxy::addUserScriptMessageHandler((WebKit::WebUserContentControllerProxy *)&self->_userContentControllerProxy, (WebKit::WebScriptMessageHandler *)a3, (const WTF::StringImpl *)a3) & 1) == 0)
  {
    v4 = (void *)MEMORY[0x1E0C99DA0];
    v5 = (WTF::StringImpl *)*((_QWORD *)a3 + 4);
    if (v5)
    {
      *(_DWORD *)v5 += 2;
      v6 = (const __CFString *)WTF::StringImpl::operator NSString *();
    }
    else
    {
      v6 = &stru_1E351F1B8;
    }
    objc_msgSend(v4, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Attempt to add script message handler with name '%@' when one already exists."), v6);
    if (v5)
    {
      if (*(_DWORD *)v5 == 2)
        WTF::StringImpl::destroy(v5, v7);
      else
        *(_DWORD *)v5 -= 2;
    }
  }
}

- (void)removeAllUserScripts
{
  WebKit::WebUserContentControllerProxy::removeAllUserScripts((WebKit::WebUserContentControllerProxy *)&self->_userContentControllerProxy);
}

- (WKUserContentController)init
{
  WKUserContentController *v2;
  WKUserContentController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WKUserContentController;
  v2 = -[WKUserContentController init](&v5, sel_init);
  v3 = v2;
  if (v2)
    *((_QWORD *)WebKit::WebUserContentControllerProxy::WebUserContentControllerProxy((WebKit::WebUserContentControllerProxy *)-[WKUserContentController _apiObject](v2, "_apiObject"))
    + 1) = v2;
  return v3;
}

- (Object)_apiObject
{
  return (Object *)&self->_userContentControllerProxy;
}

- (void)dealloc
{
  objc_class *v3;
  objc_super v4;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    (**(void (***)(ObjectStorage<WebKit::WebUserContentControllerProxy> *))self->_userContentControllerProxy.data.__lx)(&self->_userContentControllerProxy);
    v4.receiver = self;
    v4.super_class = (Class)WKUserContentController;
    -[WKUserContentController dealloc](&v4, sel_dealloc);
  }
}

+ (BOOL)accessInstanceVariablesDirectly
{
  char v3;
  NSObject *v4;
  int v6;
  const char *Name;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = WTF::linkedOnOrAfterSDKWithBehavior();
  if ((v3 & 1) == 0 && (+[WKUserContentController accessInstanceVariablesDirectly]::didLogFault & 1) == 0)
  {
    +[WKUserContentController accessInstanceVariablesDirectly]::didLogFault = 1;
    v4 = qword_1ECE70E20;
    if (os_log_type_enabled((os_log_t)qword_1ECE70E20, OS_LOG_TYPE_FAULT))
    {
      v6 = 136446210;
      Name = class_getName((Class)a1);
      _os_log_fault_impl(&dword_196BCC000, v4, OS_LOG_TYPE_FAULT, "Do not access private instance variables of %{public}s via key-value coding. This will raise an exception when linking against newer SDKs.", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3 ^ 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)userScripts
{
  return *(NSArray **)(*(_QWORD *)self[1]._userContentControllerProxy.data.__lx + 8);
}

- (void)removeContentRuleList:(WKContentRuleList *)contentRuleList
{
  WebKit::WebUserContentControllerProxy::removeContentRuleList((WebKit::WebUserContentControllerProxy *)&self->_userContentControllerProxy, (WTF::StringImpl **)(*(_QWORD *)&contentRuleList->_contentRuleList.data.__lx[16] + 16), (const WTF::StringImpl *)contentRuleList);
}

- (void)addScriptMessageHandler:(id)scriptMessageHandler contentWorld:(WKContentWorld *)world name:(NSString *)name
{
  uint64_t v9;
  WTF::StringImpl *v10;
  WTF::StringImpl *v11;
  _DWORD *v12;
  WTF::StringImpl *v13;
  uint64_t v14;
  _DWORD *v15;

  v9 = WTF::fastMalloc((WTF *)0x28);
  ScriptMessageHandlerDelegate::ScriptMessageHandlerDelegate(v9, self, scriptMessageHandler, name);
  v14 = v9;
  MEMORY[0x19AEABCC8](&v13, name);
  WebKit::WebScriptMessageHandler::create(&v14, (_DWORD **)&v13, (uint64_t)&world->_contentWorld, (uint64_t *)&v15);
  v11 = v13;
  v13 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2)
      WTF::StringImpl::destroy(v11, v10);
    else
      *(_DWORD *)v11 -= 2;
  }
  if (v14)
    (*(void (**)(uint64_t))(*(_QWORD *)v14 + 8))(v14);
  v12 = v15;
  -[WKUserContentController _addScriptMessageHandler:](self, "_addScriptMessageHandler:", v15);
  if (v12)
  {
    if (v12[2] == 1)
      (*(void (**)(_DWORD *))(*(_QWORD *)v12 + 8))(v12);
    else
      --v12[2];
  }
}

- (void)addScriptMessageHandlerWithReply:(id)scriptMessageHandlerWithReply contentWorld:(WKContentWorld *)contentWorld name:(NSString *)name
{
  uint64_t v9;
  WTF::StringImpl *v10;
  WTF::StringImpl *v11;
  _DWORD *v12;
  WTF::StringImpl *v13;
  uint64_t v14;
  _DWORD *v15;

  v9 = WTF::fastMalloc((WTF *)0x28);
  *(_QWORD *)v9 = off_1E34BCC70;
  *(_QWORD *)(v9 + 8) = self;
  if (self)
    CFRetain(self);
  *(_QWORD *)(v9 + 16) = scriptMessageHandlerWithReply;
  if (scriptMessageHandlerWithReply)
    CFRetain(scriptMessageHandlerWithReply);
  *(_QWORD *)(v9 + 24) = -[NSString copy](name, "copy");
  *(_BYTE *)(v9 + 32) = 1;
  v14 = v9;
  MEMORY[0x19AEABCC8](&v13, name);
  WebKit::WebScriptMessageHandler::create(&v14, (_DWORD **)&v13, (uint64_t)&contentWorld->_contentWorld, (uint64_t *)&v15);
  v11 = v13;
  v13 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2)
      WTF::StringImpl::destroy(v11, v10);
    else
      *(_DWORD *)v11 -= 2;
  }
  if (v14)
    (*(void (**)(uint64_t))(*(_QWORD *)v14 + 8))(v14);
  v12 = v15;
  -[WKUserContentController _addScriptMessageHandler:](self, "_addScriptMessageHandler:", v15);
  if (v12)
  {
    if (v12[2] == 1)
      (*(void (**)(_DWORD *))(*(_QWORD *)v12 + 8))(v12);
    else
      --v12[2];
  }
}

- (void)removeScriptMessageHandlerForName:(NSString *)name
{
  API::ContentWorld *v4;
  WebKit *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;
  WTF::StringImpl *v8;

  v4 = (API::ContentWorld *)MEMORY[0x19AEABCC8](&v8, name);
  v5 = API::ContentWorld::pageContentWorld(v4);
  WebKit::WebUserContentControllerProxy::removeUserMessageHandlerForName((uint64_t)&self->_userContentControllerProxy, &v8, v5);
  v7 = v8;
  v8 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2)
      WTF::StringImpl::destroy(v7, v6);
    else
      *(_DWORD *)v7 -= 2;
  }
}

- (void)removeScriptMessageHandlerForName:(NSString *)name contentWorld:(WKContentWorld *)contentWorld
{
  ObjectStorage<WebKit::WebUserContentControllerProxy> *p_userContentControllerProxy;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;
  WTF::StringImpl *v8;

  p_userContentControllerProxy = &self->_userContentControllerProxy;
  MEMORY[0x19AEABCC8](&v8, name);
  WebKit::WebUserContentControllerProxy::removeUserMessageHandlerForName((uint64_t)p_userContentControllerProxy, &v8, (API::ContentWorld *)&contentWorld->_contentWorld);
  v7 = v8;
  v8 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2)
      WTF::StringImpl::destroy(v7, v6);
    else
      *(_DWORD *)v7 -= 2;
  }
}

- (void)removeAllScriptMessageHandlersFromContentWorld:(WKContentWorld *)contentWorld
{
  WebKit::WebUserContentControllerProxy::removeAllUserMessageHandlers((WebKit::WebUserContentControllerProxy *)&self->_userContentControllerProxy, (API::ContentWorld *)&contentWorld->_contentWorld);
}

- (void)removeAllScriptMessageHandlers
{
  WebKit::WebUserContentControllerProxy::removeAllUserMessageHandlers((WebKit::WebUserContentControllerProxy *)&self->_userContentControllerProxy);
}

- (void)_removeUserScript:(id)a3
{
  WebKit::WebUserContentControllerProxy::removeUserScript((WebKit::WebUserContentControllerProxy *)&self->_userContentControllerProxy, (API::UserScript *)((char *)a3 + 8));
}

- (void)_removeAllUserScriptsAssociatedWithContentWorld:(id)a3
{
  WebKit::WebUserContentControllerProxy::removeAllUserScripts((WebKit::WebUserContentControllerProxy *)&self->_userContentControllerProxy, (API::ContentWorld *)((char *)a3 + 8));
}

- (void)_addUserScriptImmediately:(id)a3
{
  WebKit::WebUserContentControllerProxy::addUserScript((uint64_t)&self->_userContentControllerProxy, (uint64_t)a3 + 8, 1);
}

- (void)_addUserContentFilter:(id)a3
{
  ObjectStorage<WebKit::WebUserContentControllerProxy> *p_userContentControllerProxy;
  API::ContentRuleList *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7[5];

  p_userContentControllerProxy = &self->_userContentControllerProxy;
  v4 = (API::ContentRuleList *)(*((_QWORD *)a3 + 1) + 8);
  WTF::URL::URL((WTF::URL *)v7);
  WebKit::WebUserContentControllerProxy::addContentRuleList((WebKit::WebUserContentControllerProxy *)p_userContentControllerProxy, v4, (const WTF::URL *)v7);
  v6 = v7[0];
  v7[0] = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2)
      WTF::StringImpl::destroy(v6, v5);
    else
      *(_DWORD *)v6 -= 2;
  }
}

- (void)_addContentRuleList:(id)a3 extensionBaseURL:(id)a4
{
  ObjectStorage<WebKit::WebUserContentControllerProxy> *p_userContentControllerProxy;
  API::ContentRuleList *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;
  WTF::StringImpl *v8[5];

  p_userContentControllerProxy = &self->_userContentControllerProxy;
  v5 = (API::ContentRuleList *)((char *)a3 + 8);
  MEMORY[0x19AEABB18](v8, a4);
  WebKit::WebUserContentControllerProxy::addContentRuleList((WebKit::WebUserContentControllerProxy *)p_userContentControllerProxy, v5, (const WTF::URL *)v8);
  v7 = v8[0];
  v8[0] = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2)
      WTF::StringImpl::destroy(v7, v6);
    else
      *(_DWORD *)v7 -= 2;
  }
}

- (void)_removeUserContentFilter:(id)a3
{
  ObjectStorage<WebKit::WebUserContentControllerProxy> *p_userContentControllerProxy;
  const WTF::StringImpl *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;

  p_userContentControllerProxy = &self->_userContentControllerProxy;
  MEMORY[0x19AEABCC8](&v7, a3);
  WebKit::WebUserContentControllerProxy::removeContentRuleList((WebKit::WebUserContentControllerProxy *)p_userContentControllerProxy, &v7, v4);
  v6 = v7;
  v7 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2)
      WTF::StringImpl::destroy(v6, v5);
    else
      *(_DWORD *)v6 -= 2;
  }
}

- (void)_removeAllUserContentFilters
{
  WebKit::WebUserContentControllerProxy::removeAllContentRuleLists((WebKit::WebUserContentControllerProxy *)&self->_userContentControllerProxy, (WTF::StringImpl *)a2);
}

- (NSArray)_userStyleSheets
{
  return *(NSArray **)(*(_QWORD *)&self[1]._userContentControllerProxy.data.__lx[8] + 8);
}

- (void)_addUserStyleSheet:(id)a3
{
  WebKit::WebUserContentControllerProxy::addUserStyleSheet((WebKit::WebUserContentControllerProxy *)&self->_userContentControllerProxy, (API::UserStyleSheet *)((char *)a3 + 8));
}

- (void)_removeUserStyleSheet:(id)a3
{
  WebKit::WebUserContentControllerProxy::removeUserStyleSheet((WebKit::WebUserContentControllerProxy *)&self->_userContentControllerProxy, (API::UserStyleSheet *)((char *)a3 + 8));
}

- (void)_removeAllUserStyleSheets
{
  WebKit::WebUserContentControllerProxy::removeAllUserStyleSheets((WebKit::WebUserContentControllerProxy *)&self->_userContentControllerProxy);
}

- (void)_removeAllUserStyleSheetsAssociatedWithContentWorld:(id)a3
{
  WebKit::WebUserContentControllerProxy::removeAllUserStyleSheets((WebKit::WebUserContentControllerProxy *)&self->_userContentControllerProxy, (API::ContentWorld *)((char *)a3 + 8));
}

- (void)_addScriptMessageHandler:(id)a3 name:(id)a4 userContentWorld:(id)a5
{
  uint64_t v9;
  WTF::StringImpl *v10;
  const WTF::StringImpl *v11;
  WTF::StringImpl *v12;
  ObjectStorage<WebKit::WebUserContentControllerProxy> *p_userContentControllerProxy;
  WebKit::WebScriptMessageHandler *v14;
  WTF::StringImpl *v15;
  uint64_t v16;
  WebKit::WebScriptMessageHandler *v17;

  v9 = WTF::fastMalloc((WTF *)0x28);
  ScriptMessageHandlerDelegate::ScriptMessageHandlerDelegate(v9, self, a3, a4);
  v16 = v9;
  MEMORY[0x19AEABCC8](&v15, a4);
  WebKit::WebScriptMessageHandler::create(&v16, (_DWORD **)&v15, *((_QWORD *)a5 + 1) + 8, (uint64_t *)&v17);
  v12 = v15;
  v15 = 0;
  if (v12)
  {
    if (*(_DWORD *)v12 == 2)
      WTF::StringImpl::destroy(v12, v10);
    else
      *(_DWORD *)v12 -= 2;
  }
  if (v16)
    (*(void (**)(uint64_t))(*(_QWORD *)v16 + 8))(v16);
  p_userContentControllerProxy = &self->_userContentControllerProxy;
  v14 = v17;
  if ((WebKit::WebUserContentControllerProxy::addUserScriptMessageHandler((WebKit::WebUserContentControllerProxy *)p_userContentControllerProxy, v17, v11) & 1) == 0)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Attempt to add script message handler with name '%@' when one already exists."), a4, v15);
  if (*((_DWORD *)v14 + 2) == 1)
    (*(void (**)(WebKit::WebScriptMessageHandler *))(*(_QWORD *)v14 + 8))(v14);
  else
    --*((_DWORD *)v14 + 2);
}

- (void)_addScriptMessageHandler:(id)a3 name:(id)a4 contentWorld:(id)a5
{
  -[WKUserContentController _addScriptMessageHandler:name:userContentWorld:](self, "_addScriptMessageHandler:name:userContentWorld:", a3, a4, objc_msgSend(a5, "_userContentWorld"));
}

- (void)_removeScriptMessageHandlerForName:(id)a3 userContentWorld:(id)a4
{
  ObjectStorage<WebKit::WebUserContentControllerProxy> *p_userContentControllerProxy;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;
  WTF::StringImpl *v8;

  p_userContentControllerProxy = &self->_userContentControllerProxy;
  MEMORY[0x19AEABCC8](&v8, a3);
  WebKit::WebUserContentControllerProxy::removeUserMessageHandlerForName((uint64_t)p_userContentControllerProxy, &v8, (API::ContentWorld *)(*((_QWORD *)a4 + 1) + 8));
  v7 = v8;
  v8 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2)
      WTF::StringImpl::destroy(v7, v6);
    else
      *(_DWORD *)v7 -= 2;
  }
}

- (void)_removeAllScriptMessageHandlersAssociatedWithUserContentWorld:(id)a3
{
  WebKit::WebUserContentControllerProxy::removeAllUserMessageHandlers((WebKit::WebUserContentControllerProxy *)&self->_userContentControllerProxy, (API::ContentWorld *)(*((_QWORD *)a3 + 1) + 8));
}

@end
