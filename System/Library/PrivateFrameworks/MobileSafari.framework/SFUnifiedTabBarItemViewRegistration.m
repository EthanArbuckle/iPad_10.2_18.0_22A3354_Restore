@implementation SFUnifiedTabBarItemViewRegistration

- (SFUnifiedTabBarItemViewRegistration)initWithViewProvider:(id)a3 configurationHandler:(id)a4
{
  id v6;
  id v7;
  SFUnifiedTabBarItemViewRegistration *v8;
  void *v9;
  id configurationHandler;
  void *v11;
  id viewProvider;
  uint64_t v13;
  NSMutableArray *viewReuseStack;
  SFUnifiedTabBarItemViewRegistration *v15;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SFUnifiedTabBarItemViewRegistration;
  v8 = -[SFUnifiedTabBarItemViewRegistration init](&v17, sel_init);
  if (v8)
  {
    v9 = _Block_copy(v7);
    configurationHandler = v8->_configurationHandler;
    v8->_configurationHandler = v9;

    v11 = _Block_copy(v6);
    viewProvider = v8->_viewProvider;
    v8->_viewProvider = v11;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = objc_claimAutoreleasedReturnValue();
    viewReuseStack = v8->_viewReuseStack;
    v8->_viewReuseStack = (NSMutableArray *)v13;

    v15 = v8;
  }

  return v8;
}

- (id)dequeueOrCreateViewForItem:(id)a3 isPreview:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (v4)
    objc_msgSend(v6, "reusablePreviewView");
  else
    objc_msgSend(v6, "reusableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    -[NSMutableArray lastObject](self->_viewReuseStack, "lastObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v8 = (void *)v9;
      -[NSMutableArray removeLastObject](self->_viewReuseStack, "removeLastObject");
    }
    else
    {
      (*((void (**)(void))self->_viewProvider + 2))();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (v4)
      objc_msgSend(v7, "setReusablePreviewView:", v8);
    else
      objc_msgSend(v7, "setReusableView:", v8);
    objc_msgSend(v8, "setItem:", v7);
    objc_msgSend(v8, "prepareForReuse");
  }
  v10 = v8;

  return v10;
}

- (id)createItemView
{
  return (id)(*((uint64_t (**)(void))self->_viewProvider + 2))();
}

- (void)enqueueItemView:(id)a3
{
  -[NSMutableArray addObject:](self->_viewReuseStack, "addObject:", a3);
}

- (void)configureView:(id)a3 forItem:(id)a4 inArrangement:(id)a5 isPreview:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  BOOL v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)MEMORY[0x1E0DC3F10];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __85__SFUnifiedTabBarItemViewRegistration_configureView_forItem_inArrangement_isPreview___block_invoke;
  v17[3] = &unk_1E21E27C0;
  v17[4] = self;
  v18 = v10;
  v19 = v11;
  v20 = v12;
  v21 = a6;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  objc_msgSend(v13, "performWithoutAnimation:", v17);

}

uint64_t __85__SFUnifiedTabBarItemViewRegistration_configureView_forItem_inArrangement_isPreview___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v2)
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 48), "configureItemView:isPreview:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewReuseStack, 0);
  objc_storeStrong(&self->_viewProvider, 0);
  objc_storeStrong(&self->_configurationHandler, 0);
}

@end
