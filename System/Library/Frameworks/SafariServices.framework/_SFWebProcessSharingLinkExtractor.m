@implementation _SFWebProcessSharingLinkExtractor

- (_SFWebProcessSharingLinkExtractor)initWithPageController:(id)a3
{
  id v4;
  _SFWebProcessSharingLinkExtractor *v5;
  _SFWebProcessSharingLinkExtractor *v6;
  _SFWebProcessSharingLinkExtractor *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SFWebProcessSharingLinkExtractor;
  v5 = -[_SFWebProcessSharingLinkExtractor init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_pageController, v4);
    -[_SFWebProcessSharingLinkExtractor _setUpRemoteInterface](v6, "_setUpRemoteInterface");
    v7 = v6;
  }

  return v6;
}

- (void)_setUpRemoteInterface
{
  _WKRemoteObjectInterface *v3;
  _WKRemoteObjectInterface *sharingLinkExtractorInterface;
  id WeakRetained;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CEF6C8], "remoteObjectInterfaceWithProtocol:", &unk_1EE791548);
  v3 = (_WKRemoteObjectInterface *)objc_claimAutoreleasedReturnValue();
  sharingLinkExtractorInterface = self->_sharingLinkExtractorInterface;
  self->_sharingLinkExtractorInterface = v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_pageController);
  objc_msgSend(WeakRetained, "browserContextController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_remoteObjectRegistry");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "registerExportedObject:interface:", self, self->_sharingLinkExtractorInterface);
}

- (id)_injectedLinkExtractorSourceString
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;

  v2 = (void *)_injectedLinkExtractorSourceString_sourceString;
  if (!_injectedLinkExtractorSourceString_sourceString)
  {
    v3 = objc_alloc(MEMORY[0x1E0CB3940]);
    v4 = objc_msgSend(v3, "initWithBytesNoCopy:length:encoding:freeWhenDone:", "//# sourceURL=__InjectedScript_SharingLinkExtractor.js\n/* Copyright (c) 2024 Apple Inc. All rights reserved. */\n/*\n * Copyright (c) 2017 Apple Inc. All rights reserved.\n */\nvar SharingLinkExtractor=function(){};SharingLinkExtractor.prototype={extractCanonicalLink:function(){var n=d"
           "ocument.head.querySelector(\"link[rel='canonical']\");if (!n)return null;var t=n.getAttribute(\"href\");if (!t)"
           "return null;var r=document.baseURI,e=new URL(t,r);return\"/\"!==document.location.pathname&&\"/\"===e.pathnam"
           "e||\"localhost\"===e.hostname&&\"localhost\"!==document.location.hostname?null:e.href},hitTestingPoints:funct"
           "ion(){const n=60,t=window.innerWidth-n,r=window.innerHeight-n;return[[n,n],[n,r],[t,n],[t,r]]},viewportDomina"
           "ntIFrameElement:function(){for (var n,t=this.hitTestingPoints(),r=t.length,e=0;e<r;e++){var i=t[e],o=document."
           "elementFromPoint(i[0],i[1]);if (!o)return null;if (\"IFRAME\"!==o.tagName)return null;if (n){if (n!==o)return nul"
           "l}else n=o}return n}};var SharingLinkExtractorJS=new SharingLinkExtractor;",
           sharingLinkExtractorSourceLength,
           4,
           0);
    v5 = (void *)_injectedLinkExtractorSourceString_sourceString;
    _injectedLinkExtractorSourceString_sourceString = v4;

    v2 = (void *)_injectedLinkExtractorSourceString_sourceString;
  }
  return v2;
}

- (void)_withInjectedLinkExtractorObjectInFrame:(id)a3 callback:(id)a4
{
  void *v6;
  void (**v7)(id, void *);
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v6 = (void *)MEMORY[0x1E0CEF628];
  v7 = (void (**)(id, void *))a4;
  v8 = a3;
  objc_msgSend(v6, "world");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "jsContextForWorld:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[_SFWebProcessSharingLinkExtractor _injectedLinkExtractorSourceString](self, "_injectedLinkExtractorSourceString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v9, "evaluateScript:", v10);

  objc_msgSend(v9, "globalObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "valueForProperty:", CFSTR("SharingLinkExtractorJS"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v7[2](v7, v13);
  objc_msgSend(v14, "clearWrappers");

}

- (void)fetchSharingLinkWithCompletionHandler:(id)a3
{
  void (**v4)(id, id);
  id v5;

  v4 = (void (**)(id, id))a3;
  -[_SFWebProcessSharingLinkExtractor _extractSharingLink](self, "_extractSharingLink");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v5);

}

- (id)_extractSharingLink
{
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  _QWORD v18[7];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  WeakRetained = objc_loadWeakRetained((id *)&self->_pageController);
  objc_msgSend(WeakRetained, "browserContextController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mainFrame");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__16;
  v29 = __Block_byref_object_dispose__16;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__16;
  v23 = __Block_byref_object_dispose__16;
  v24 = 0;
  v6 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __56___SFWebProcessSharingLinkExtractor__extractSharingLink__block_invoke;
  v18[3] = &unk_1E4AC7EC0;
  v18[4] = self;
  v18[5] = &v25;
  v18[6] = &v19;
  -[_SFWebProcessSharingLinkExtractor _withInjectedLinkExtractorObjectInFrame:callback:](self, "_withInjectedLinkExtractorObjectInFrame:callback:", v5, v18);
  v7 = (void *)v26[5];
  if (v7 || (v9 = v20[5]) == 0)
  {
    v8 = v7;
  }
  else
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__16;
    v16 = __Block_byref_object_dispose__16;
    v17 = 0;
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __56___SFWebProcessSharingLinkExtractor__extractSharingLink__block_invoke_2;
    v11[3] = &unk_1E4AC7EE8;
    v11[4] = self;
    v11[5] = &v12;
    -[_SFWebProcessSharingLinkExtractor _withInjectedLinkExtractorObjectInFrame:callback:](self, "_withInjectedLinkExtractorObjectInFrame:callback:", v9, v11);
    v8 = (id)v13[5];
    _Block_object_dispose(&v12, 8);

  }
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v8;
}

- (id)_extractCanonicalLinkWithInjectedObject:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "invokeMethod:withArguments:", CFSTR("extractCanonicalLink"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toObjectOfClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_extractDominantIFrameWithInjectedObject:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "invokeMethod:withArguments:", CFSTR("viewportDominantIFrameElement"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  if (objc_msgSend(v4, "isObject"))
  {
    v6 = (void *)MEMORY[0x1E0CEF620];
    objc_msgSend(v3, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "nodeHandleWithJSValue:inContext:", v4, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "htmlIFrameElementContentFrame");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingLinkExtractorInterface, 0);
  objc_destroyWeak((id *)&self->_pageController);
}

@end
