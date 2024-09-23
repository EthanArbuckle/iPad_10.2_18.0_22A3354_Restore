@implementation StoreScriptInterface

+ (id)webScriptNameForSelector:(SEL)a3
{
  void *v5;
  objc_super v7;

  SUWebScriptNameForSelector2();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___StoreScriptInterface;
    objc_msgSendSuper2(&v7, sel_webScriptNameForSelector_, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping = (uint64_t)sel_makeStoreSheetRequest;
    *(_QWORD *)algn_25718D328 = CFSTR("createStoreSheetRequest");
    qword_25718D330 = (uint64_t)sel_showStoreSheetWithRequest_animated_;
    unk_25718D338 = CFSTR("showStoreSheet");
  }
}

- (SUProductPageViewController)parentProductPageViewController
{
  return (SUProductPageViewController *)objc_loadWeakRetained((id *)&self->_parentProductPageViewController);
}

- (void)setParentProductPageViewController:(id)a3
{
  objc_storeWeak((id *)&self->_parentProductPageViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentProductPageViewController);
}

- (id)makeStoreSheetRequest
{
  SUScriptStoreSheetRequest *v3;

  v3 = objc_alloc_init(SUScriptStoreSheetRequest);
  -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v3);
  return v3;
}

- (void)showStoreSheetWithRequest:(id)a3 animated:(BOOL)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void (*v10)(_QWORD *);
  uint64_t v11;
  _QWORD v12[5];
  id v13;
  BOOL v14;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (void *)objc_msgSend(v6, "newNativeStorePageRequest");
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __86__StoreScriptInterface_SUScriptStoreSheetRequest__showStoreSheetWithRequest_animated___block_invoke;
    v12[3] = &unk_2511FA250;
    v12[4] = self;
    v13 = v7;
    v14 = a4;
    v8 = v7;
    v9 = (void *)SUUIWebCoreFramework();
    v10 = (void (*)(_QWORD *))SUUIWeakLinkedSymbolForString("WebThreadRunOnMainThread", v9);
    if (v10)
      v10(v12);

  }
  else
  {
    v11 = SUUIWebCoreFramework();
    objc_msgSend(SUUIWeakLinkedClassForString(CFSTR("WebScriptObject"), v11), "throwException:", CFSTR("Invalid argument"));
  }

}

void __86__StoreScriptInterface_SUScriptStoreSheetRequest__showStoreSheetWithRequest_animated___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "parentProductPageViewController");
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "parentViewController");
    v2 = objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      while (1)
      {
        v5 = (id)v2;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        objc_msgSend(v5, "parentViewController");
        v3 = objc_claimAutoreleasedReturnValue();

        v2 = v3;
        if (!v3)
          goto LABEL_2;
      }
      v2 = (uint64_t)v5;
    }
  }
LABEL_2:
  v4 = (id)v2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v4, "_showPageWithRequest:animated:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));

}

@end
