@implementation SUUISettingDescription

- (SUUISettingDescription)initWithViewElement:(id)a3 parent:(id)a4
{
  id v7;
  id v8;
  SUUISettingDescription *v9;
  SUUISettingDescription *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SUUISettingDescription;
  v9 = -[SUUISettingDescription init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_parent, v8);
    objc_storeStrong((id *)&v10->_viewElement, a3);
  }

  return v10;
}

+ (BOOL)allowsEdit
{
  return 0;
}

+ (Class)viewClassForSettingDescription:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_viewClassForSettingDescription:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v4;
}

- (BOOL)allowsSelection
{
  return 1;
}

- (BOOL)commitEdits:(id)a3
{
  (*((void (**)(id, uint64_t))a3 + 2))(a3, 1);
  return 0;
}

- (BOOL)editsValid
{
  return !objc_msgSend((id)objc_opt_class(), "allowsEdit") || self->_editsValid;
}

- (void)handleSelectionOnCompletion:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  SUUIViewElement *viewElement;
  _QWORD v7[4];
  void (**v8)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  v5 = v4;
  viewElement = self->_viewElement;
  if (viewElement)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __54__SUUISettingDescription_handleSelectionOnCompletion___block_invoke;
    v7[3] = &unk_2511F5EE8;
    v8 = v4;
    -[SUUIViewElement dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:](viewElement, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, 0, v7);

  }
  else
  {
    v4[2](v4);
  }

}

void __54__SUUISettingDescription_handleSelectionOnCompletion___block_invoke(uint64_t a1)
{
  dispatch_async(MEMORY[0x24BDAC9B8], *(dispatch_block_t *)(a1 + 32));
}

- (id)indexPath
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  objc_msgSend(WeakRetained, "indexPathForSettingDescription:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)reloadWithViewElement:(id)a3 parent:(id)a4
{
  SUUIViewElement *v6;
  SUUIViewElement *viewElement;

  v6 = (SUUIViewElement *)a3;
  objc_storeWeak((id *)&self->_parent, a4);
  viewElement = self->_viewElement;
  self->_viewElement = v6;

}

- (SUUIViewElement)viewElement
{
  return self->_viewElement;
}

+ (Class)_viewClassForSettingDescription:(id)a3
{
  return 0;
}

- (void)_deleteSetting
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  objc_msgSend(WeakRetained, "deleteSettingDescription:", self);

}

- (void)_dismissViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  SUUISettingsGroupDescription **p_parent;
  id v8;
  id v9;
  id WeakRetained;

  v5 = a4;
  p_parent = &self->_parent;
  v8 = a5;
  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_parent);
  objc_msgSend(WeakRetained, "_dismissViewController:animated:completion:", v9, v5, v8);

}

- (void)_dispatchUpdate:(id)a3
{
  SUUISettingsGroupDescription **p_parent;
  id v4;
  id WeakRetained;

  p_parent = &self->_parent;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_parent);
  objc_msgSend(WeakRetained, "dispatchUpdate:", v4);

}

- (void)_hideSetting
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  objc_msgSend(WeakRetained, "hideSettingDescription:", self);

}

- (BOOL)_initiallyHidden
{
  return 0;
}

- (BOOL)_isHidden
{
  SUUISettingDescription *v2;
  id WeakRetained;

  v2 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  LOBYTE(v2) = objc_msgSend(WeakRetained, "isSettingDescriptionHidden:", v2);

  return (char)v2;
}

- (void)_presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  SUUISettingsGroupDescription **p_parent;
  id v8;
  id v9;
  id WeakRetained;

  v5 = a4;
  p_parent = &self->_parent;
  v8 = a5;
  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_parent);
  objc_msgSend(WeakRetained, "_presentViewController:animated:completion:", v9, v5, v8);

}

- (void)_reloadSetting
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  objc_msgSend(WeakRetained, "reloadSettingDescription:", self);

}

- (void)_revealSetting
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  objc_msgSend(WeakRetained, "revealSettingDescription:", self);

}

- (void)_setEditsValid:(BOOL)a3
{
  id WeakRetained;

  if (self->_editsValid != a3)
  {
    self->_editsValid = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
    objc_msgSend(WeakRetained, "_updatedEditsValid");

  }
}

- (SUUISettingsGroupDescription)parent
{
  return (SUUISettingsGroupDescription *)objc_loadWeakRetained((id *)&self->_parent);
}

- (void)setParent:(id)a3
{
  objc_storeWeak((id *)&self->_parent, a3);
}

- (void)setViewElement:(id)a3
{
  objc_storeStrong((id *)&self->_viewElement, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_viewElement, 0);
}

@end
