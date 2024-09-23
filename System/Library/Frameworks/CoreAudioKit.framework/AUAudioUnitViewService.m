@implementation AUAudioUnitViewService

- (CGSize)determineViewSize:(id)a3
{
  id v3;
  double v4;
  unsigned int v5;
  double v6;
  unsigned int v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  v3 = a3;
  objc_msgSend(v3, "preferredContentSize");
  v5 = v4;
  objc_msgSend(v3, "preferredContentSize");
  v7 = v6;
  if (!v5)
  {
    objc_msgSend(v3, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "frame");
    v8 = v11;

    if (v7)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(v3, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "frame");
    v9 = v13;

    goto LABEL_6;
  }
  v8 = (double)v5;
  if (!v7)
    goto LABEL_5;
LABEL_3:
  v9 = (double)v7;
LABEL_6:

  v14 = (double)v8;
  v15 = (double)v9;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)setAUContainerViewConstraints:(id)a3 childView:(id)a4 auViewSize:(CGSize)a5
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a3;
  _NSDictionaryOfVariableBindings(CFSTR("childView"), a4, 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[childView]|"), 0, 0, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addConstraints:", v7);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[childView]|"), 0, 0, v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addConstraints:", v8);

}

- (void)connectChildView
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[AUAudioUnitViewService auRemoteExtensionContext](self, "auRemoteExtensionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __42__AUAudioUnitViewService_connectChildView__block_invoke;
  v4[3] = &unk_24CF54DD8;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "requestViewControllerWithCompletionHandler:", v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __42__AUAudioUnitViewService_connectChildView__block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (v16 && WeakRetained)
  {
    objc_msgSend(WeakRetained, "addChildViewController:", v16);
    objc_storeStrong(WeakRetained + 121, a2);
    objc_msgSend(v16, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "determineViewSize:", v16);
    v7 = v6;
    v9 = v8;
    objc_msgSend(WeakRetained, "setPreferredContentSize:");
    objc_msgSend(WeakRetained, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "resizeWindow:size:", v11, v7, v9);

    objc_msgSend(WeakRetained, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFrame:", 0.0, 0.0, v7, v9);

    objc_msgSend(WeakRetained, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", v5);

    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(WeakRetained, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setAUContainerViewConstraints:childView:auViewSize:", v14, v5, v7, v9);

    objc_msgSend(WeakRetained, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "markViewForRedraw:", v15);

    objc_msgSend(WeakRetained, "markViewForRedraw:", v5);
  }

}

- (void)initializeBlankView
{
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", 0.0, 0.0, 1.0, 1.0);
  -[AUAudioUnitViewService setView:](self, "setView:", v3);

}

- (void)loadView
{
  void *v3;
  void *v4;

  -[AUAudioUnitViewService initializeBlankView](self, "initializeBlankView");
  -[AUAudioUnitViewService extensionContext](self, "extensionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AUAudioUnitViewService setAuRemoteExtensionContext:](self, "setAuRemoteExtensionContext:", v3);

  -[AUAudioUnitViewService auRemoteExtensionContext](self, "auRemoteExtensionContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setViewService:", self);

  -[AUAudioUnitViewService connectChildView](self, "connectChildView");
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[AUAudioUnitViewService childViewControllers](self, "childViewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "view");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeFromSuperview");

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  v9.receiver = self;
  v9.super_class = (Class)AUAudioUnitViewService;
  -[AUAudioUnitViewService dealloc](&v9, sel_dealloc);
}

- (AURemoteExtensionContext)auRemoteExtensionContext
{
  return self->_auRemoteExtensionContext;
}

- (void)setAuRemoteExtensionContext:(id)a3
{
  self->_auRemoteExtensionContext = (AURemoteExtensionContext *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auViewController, 0);
}

@end
