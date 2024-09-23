@implementation SUUIFamilySettingDescription

- (SUUIFamilySettingDescription)initWithViewElement:(id)a3 parent:(id)a4
{
  SUUIFamilySettingDescription *v4;
  SUUIFamilySettingDescription *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUUIFamilySettingDescription;
  v4 = -[SUUISettingDescription initWithViewElement:parent:](&v7, sel_initWithViewElement_parent_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_viewState = -1;
    -[SUUIFamilySettingDescription _updateViewState](v4, "_updateViewState");
  }
  return v5;
}

- (void)handleSelectionOnCompletion:(id)a3
{
  id v4;
  unint64_t v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = self->_viewState + 1;
  if (v5 > 3)
    v6 = CFSTR("complete");
  else
    v6 = off_2511F5F58[v5];
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", v6, CFSTR("state"), 0);
  -[SUUISettingDescription viewElement](self, "viewElement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __60__SUUIFamilySettingDescription_handleSelectionOnCompletion___block_invoke;
  v10[3] = &unk_2511F5EE8;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v8, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, v7, v10);

}

void __60__SUUIFamilySettingDescription_handleSelectionOnCompletion___block_invoke(uint64_t a1)
{
  dispatch_async(MEMORY[0x24BDAC9B8], *(dispatch_block_t *)(a1 + 32));
}

+ (Class)_viewClassForSettingDescription:(id)a3
{
  return (Class)objc_opt_class();
}

- (BOOL)_initiallyHidden
{
  return (unint64_t)(self->_viewState - 4) < 0xFFFFFFFFFFFFFFFDLL;
}

- (void)_updateViewState
{
  SUUISettingsFamilyViewStateCoordinator *viewStateCoordinator;
  SUUISettingsFamilyViewStateCoordinator *v4;
  SUUISettingsFamilyViewStateCoordinator *v5;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  viewStateCoordinator = self->_viewStateCoordinator;
  if (!viewStateCoordinator)
  {
    v4 = objc_alloc_init(SUUISettingsFamilyViewStateCoordinator);
    v5 = self->_viewStateCoordinator;
    self->_viewStateCoordinator = v4;

    viewStateCoordinator = self->_viewStateCoordinator;
  }
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48__SUUIFamilySettingDescription__updateViewState__block_invoke;
  v6[3] = &unk_2511F5F38;
  objc_copyWeak(&v7, &location);
  -[SUUISettingsFamilyViewStateCoordinator checkSettingsFamilyViewStateWithBlock:](viewStateCoordinator, "checkSettingsFamilyViewStateWithBlock:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __48__SUUIFamilySettingDescription__updateViewState__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4[2];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __48__SUUIFamilySettingDescription__updateViewState__block_invoke_2;
  v3[3] = &unk_2511F5F10;
  objc_copyWeak(v4, (id *)(a1 + 32));
  v4[1] = a2;
  dispatch_async(MEMORY[0x24BDAC9B8], v3);
  objc_destroyWeak(v4);
}

void __48__SUUIFamilySettingDescription__updateViewState__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateWithViewState:", *(_QWORD *)(a1 + 40));

}

- (void)_updateWithViewState:(int64_t)a3
{
  self->_viewState = a3;
  if ((unint64_t)(a3 - 1) >= 3)
  {
    if (a3)
    {
      if (a3 == -1 && !-[SUUISettingDescription _isHidden](self, "_isHidden"))
        -[SUUISettingDescription _hideSetting](self, "_hideSetting");
    }
    else
    {
      -[SUUISettingDescription _deleteSetting](self, "_deleteSetting");
    }
  }
  else
  {
    if (-[SUUISettingDescription _isHidden](self, "_isHidden"))
      -[SUUISettingDescription _revealSetting](self, "_revealSetting");
    -[SUUISettingDescription _reloadSetting](self, "_reloadSetting");
  }
}

- (int64_t)viewState
{
  return self->_viewState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewStateCoordinator, 0);
}

@end
