@implementation SUUISettingsGroupsDescription

- (SUUISettingsGroupsDescription)init
{
  SUUISettingsGroupsDescription *v2;
  SUUISettingsObjectStore *v3;
  SUUISettingsObjectStore *groupDescriptions;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUUISettingsGroupsDescription;
  v2 = -[SUUISettingsGroupsDescription init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SUUISettingsObjectStore);
    groupDescriptions = v2->_groupDescriptions;
    v2->_groupDescriptions = v3;

  }
  return v2;
}

- (SUUISettingsGroupsDescription)initWithDelegate:(id)a3 settingsContext:(id)a4
{
  id v6;
  id v7;
  SUUISettingsGroupsDescription *v8;
  SUUISettingsGroupsDescription *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = -[SUUISettingsGroupsDescription init](self, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_settingsContext, v7);
    objc_msgSend(v7, "clientContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v9->_clientContext, v10);

    objc_storeWeak((id *)&v9->_delegate, v6);
  }

  return v9;
}

- (void)addSettingsGroupWithViewElement:(id)a3
{
  -[SUUISettingsGroupsDescription _addSettingsGroupWithViewElement:controller:](self, "_addSettingsGroupWithViewElement:controller:", a3, 0);
}

- (id)createEditTransaction
{
  void *v2;
  SUUISettingsEditTransaction *v3;

  -[SUUISettingsGroupsDescription _gatherEditableSettings](self, "_gatherEditableSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[SUUISettingsEditTransaction initWithSettingDescriptions:]([SUUISettingsEditTransaction alloc], "initWithSettingDescriptions:", v2);

  return v3;
}

- (void)deleteSettingAtIndexPath:(id)a3
{
  void *v4;
  void *v5;
  id WeakRetained;
  char v7;
  id v8;
  id v9;
  char v10;
  id v11;

  v11 = a3;
  -[SUUISettingsObjectStore visibleObjectAtIndex:](self->_groupDescriptions, "visibleObjectAtIndex:", objc_msgSend(v11, "section"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "settingDescriptionAtIndex:", objc_msgSend(v11, "row"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deleteSettingDescription:", v5);
  if (objc_msgSend(v4, "isEmpty"))
  {
    -[SUUISettingsObjectStore removeObject:](self->_groupDescriptions, "removeObject:", v4);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v8, "settingsGroupsDescription:deletedSettingsGroupAtIndex:", self, objc_msgSend(v11, "section"));
LABEL_6:

    }
  }
  else
  {
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v8, "settingsGroupsDescription:deletedSettingAtIndexPath:", self, v11);
      goto LABEL_6;
    }
  }

}

- (void)deleteSettingsGroupDescription:(id)a3
{
  uint64_t v4;
  id v5;

  v5 = a3;
  if (-[SUUISettingsObjectStore objectIsVisible:](self->_groupDescriptions, "objectIsVisible:"))
  {
    v4 = objc_msgSend(v5, "index");
    -[SUUISettingsObjectStore removeObject:](self->_groupDescriptions, "removeObject:", v5);
    -[SUUISettingsGroupsDescription _dispatchUpdateForSettingsGroupDescription:atIndex:withUpdateType:](self, "_dispatchUpdateForSettingsGroupDescription:atIndex:withUpdateType:", v5, v4, 0);
  }
  else
  {
    -[SUUISettingsObjectStore removeObject:](self->_groupDescriptions, "removeObject:", v5);
  }

}

- (void)dispatchUpdate:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "settingsGroupsDescription:didUpdateSettingsDescription:", self, v7);

  }
}

- (id)footerDescriptionForGroupAtIndex:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[SUUISettingsObjectStore visibleObjectAtIndex:](self->_groupDescriptions, "visibleObjectAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "footerDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)hasEditableSettingDescriptions
{
  SUUISettingsObjectStore *groupDescriptions;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  groupDescriptions = self->_groupDescriptions;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __63__SUUISettingsGroupsDescription_hasEditableSettingDescriptions__block_invoke;
  v5[3] = &unk_2511F8158;
  v5[4] = &v6;
  -[SUUISettingsObjectStore enumerateObjects:](groupDescriptions, "enumerateObjects:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __63__SUUISettingsGroupsDescription_hasEditableSettingDescriptions__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "hasEditableSettingDescriptions");
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (id)headerDescriptionForGroupAtIndex:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[SUUISettingsObjectStore visibleObjectAtIndex:](self->_groupDescriptions, "visibleObjectAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "headerDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)hideSettingsGroupDescription:(id)a3
{
  uint64_t v4;
  id v5;

  v5 = a3;
  v4 = objc_msgSend(v5, "index");
  -[SUUISettingsObjectStore hideObject:](self->_groupDescriptions, "hideObject:", v5);
  -[SUUISettingsGroupsDescription _dispatchUpdateForSettingsGroupDescription:atIndex:withUpdateType:](self, "_dispatchUpdateForSettingsGroupDescription:atIndex:withUpdateType:", v5, v4, 0);

}

- (unint64_t)indexOfSettingsGroupDescription:(id)a3
{
  return -[SUUISettingsObjectStore indexOfVisibleObject:](self->_groupDescriptions, "indexOfVisibleObject:", a3);
}

- (unint64_t)numberOfGroups
{
  return -[SUUISettingsObjectStore numberOfVisibleObjects](self->_groupDescriptions, "numberOfVisibleObjects");
}

- (unint64_t)numberOfSettingsInGroupAtIndex:(unint64_t)a3
{
  void *v3;
  unint64_t v4;

  -[SUUISettingsObjectStore visibleObjectAtIndex:](self->_groupDescriptions, "visibleObjectAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfSettings");

  return v4;
}

- (void)recycle
{
  -[SUUISettingsObjectStore enumerateObjects:](self->_groupDescriptions, "enumerateObjects:", &__block_literal_global_21);
}

uint64_t __40__SUUISettingsGroupsDescription_recycle__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "recycle");
}

- (void)reloadData
{
  -[SUUISettingsObjectStore enumerateObjects:](self->_groupDescriptions, "enumerateObjects:", &__block_literal_global_8_0);
}

uint64_t __43__SUUISettingsGroupsDescription_reloadData__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reloadData");
}

- (void)requestLayoutForWidth:(double)a3 context:(id)a4
{
  id v6;
  SUUISettingsObjectStore *groupDescriptions;
  id v8;
  _QWORD v9[4];
  id v10;
  double v11;

  v6 = a4;
  groupDescriptions = self->_groupDescriptions;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __63__SUUISettingsGroupsDescription_requestLayoutForWidth_context___block_invoke;
  v9[3] = &unk_2511F81E0;
  v11 = a3;
  v10 = v6;
  v8 = v6;
  -[SUUISettingsObjectStore enumerateObjects:](groupDescriptions, "enumerateObjects:", v9);

}

uint64_t __63__SUUISettingsGroupsDescription_requestLayoutForWidth_context___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "requestLayoutForWidth:context:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 40));
}

- (void)revealSettingsGroupDescription:(id)a3
{
  SUUISettingsObjectStore *groupDescriptions;
  id v5;

  groupDescriptions = self->_groupDescriptions;
  v5 = a3;
  -[SUUISettingsObjectStore revealObject:](groupDescriptions, "revealObject:", v5);
  -[SUUISettingsGroupsDescription _dispatchUpdateForSettingsGroupDescription:atIndex:withUpdateType:](self, "_dispatchUpdateForSettingsGroupDescription:atIndex:withUpdateType:", v5, objc_msgSend(v5, "index"), 1);

}

- (id)settingDescriptionAtIndexPath:(id)a3
{
  SUUISettingsObjectStore *groupDescriptions;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  groupDescriptions = self->_groupDescriptions;
  v4 = a3;
  -[SUUISettingsObjectStore visibleObjectAtIndex:](groupDescriptions, "visibleObjectAtIndex:", objc_msgSend(v4, "section"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "row");

  objc_msgSend(v5, "settingDescriptionAtIndex:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)shouldShowFooterForGroupAtIndex:(unint64_t)a3
{
  void *v3;
  char v4;

  -[SUUISettingsObjectStore visibleObjectAtIndex:](self->_groupDescriptions, "visibleObjectAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasFooter");

  return v4;
}

- (BOOL)shouldShowHeaderForGroupAtIndex:(unint64_t)a3
{
  void *v3;
  char v4;

  -[SUUISettingsObjectStore visibleObjectAtIndex:](self->_groupDescriptions, "visibleObjectAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasHeader");

  return v4;
}

- (id)viewElementForSettingAtIndexPath:(id)a3
{
  SUUISettingsObjectStore *groupDescriptions;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  groupDescriptions = self->_groupDescriptions;
  v4 = a3;
  -[SUUISettingsObjectStore visibleObjectAtIndex:](groupDescriptions, "visibleObjectAtIndex:", objc_msgSend(v4, "section"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "item");

  objc_msgSend(v5, "viewElementForSettingAtIndex:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)owningViewControllerForSettingsGroupController:(id)a3
{
  void *v4;
  void *v5;

  -[SUUISettingsGroupsDescription delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "owningViewControllerForSettingsGroupsDescription:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)settingsGroupController:(id)a3 reloadSettingDescription:(id)a4
{
  objc_msgSend(a4, "_reloadSetting", a3);
}

- (id)settingsGroupController:(id)a3 viewForSettingDescription:(id)a4
{
  id v5;
  id WeakRetained;
  char v7;
  void *v8;
  id v9;
  void *v10;

  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    objc_msgSend(v5, "indexPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v9, "settingsGroupsDescription:viewForSettingAtIndexPath:", self, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_addSettingsGroupWithViewElement:(id)a3 controller:(id)a4
{
  id v6;
  SUUISettingsGroupDescription *v7;
  id WeakRetained;
  SUUISettingsGroupDescription *v9;
  id v10;
  SUUISettingsGroupDescription *v11;
  id v12;
  _QWORD v13[4];
  SUUISettingsGroupDescription *v14;
  SUUISettingsGroupsDescription *v15;
  id v16;

  v6 = a3;
  v12 = a4;
  v7 = [SUUISettingsGroupDescription alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_settingsContext);
  v9 = -[SUUISettingsGroupDescription initWithParent:settingsContext:](v7, "initWithParent:settingsContext:", self, WeakRetained);

  if (v12)
    -[SUUISettingsGroupDescription setController:](v9, "setController:", v12);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __77__SUUISettingsGroupsDescription__addSettingsGroupWithViewElement_controller___block_invoke;
  v13[3] = &unk_2511F8208;
  v14 = v9;
  v15 = self;
  v16 = v6;
  v10 = v6;
  v11 = v9;
  objc_msgSend(v10, "enumerateChildrenUsingBlock:", v13);
  -[SUUISettingsObjectStore addObject:hidden:](self->_groupDescriptions, "addObject:hidden:", v11, -[SUUISettingsGroupDescription hasNoVisibleSettings](v11, "hasNoVisibleSettings"));

}

void __77__SUUISettingsGroupsDescription__addSettingsGroupWithViewElement_controller___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = objc_msgSend(v5, "elementType");
  switch(v3)
  {
    case '0':
      objc_msgSend(*(id *)(a1 + 32), "setHeaderViewElement:", v5);
      break;
    case '.':
      objc_msgSend(*(id *)(a1 + 40), "_controllerForGroupElement:", *(_QWORD *)(a1 + 48));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "_addSettingsGroupWithViewElement:controller:", v5, v4);

      break;
    case ')':
      objc_msgSend(*(id *)(a1 + 32), "setFooterViewElement:", v5);
      break;
    default:
      objc_msgSend(*(id *)(a1 + 32), "addSettingViewElement:", v5);
      break;
  }

}

- (id)_controllerForGroupElement:(id)a3
{
  id v4;
  SUUISignInSettingsGroupController *v5;
  void *v6;
  NSMapTable *v7;
  NSMapTable *controllers;

  v4 = a3;
  -[NSMapTable objectForKey:](self->_controllers, "objectForKey:", v4);
  v5 = (SUUISignInSettingsGroupController *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(v4, "type");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("signin")))
      v5 = objc_alloc_init(SUUISignInSettingsGroupController);
    else
      v5 = 0;
    if (!self->_controllers)
    {
      v7 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 0);
      controllers = self->_controllers;
      self->_controllers = v7;

    }
    if (v5)
    {
      -[SUUISettingsGroupController setDelegate:](v5, "setDelegate:", self);
      -[NSMapTable setObject:forKey:](self->_controllers, "setObject:forKey:", v5, v4);
    }

  }
  return v5;
}

- (void)_dismissViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id WeakRetained;
  void *v10;
  id v11;
  char v12;
  id v13;
  id v14;

  v6 = a4;
  v14 = a3;
  v8 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v10 = WeakRetained;
    v11 = objc_loadWeakRetained((id *)&self->_delegate);
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      v13 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v13, "settingsGroupsDescription:dismissViewController:animated:completion:", self, v14, v6, v8);

    }
  }

}

- (void)_dispatchUpdateForSettingsGroupDescription:(id)a3 atIndex:(unint64_t)a4 withUpdateType:(int64_t)a5
{
  void *v7;
  SUUISettingsDescriptionUpdate *v8;

  v8 = -[SUUISettingsDescriptionUpdate initWithUpdateType:]([SUUISettingsDescriptionUpdate alloc], "initWithUpdateType:", a5);
  objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUISettingsDescriptionUpdate setIndexSet:](v8, "setIndexSet:", v7);

  -[SUUISettingsGroupsDescription dispatchUpdate:](self, "dispatchUpdate:", v8);
}

- (id)_gatherEditableSettings
{
  id v3;
  SUUISettingsObjectStore *groupDescriptions;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  groupDescriptions = self->_groupDescriptions;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__SUUISettingsGroupsDescription__gatherEditableSettings__block_invoke;
  v7[3] = &unk_2511F8230;
  v5 = v3;
  v8 = v5;
  -[SUUISettingsObjectStore enumerateObjects:](groupDescriptions, "enumerateObjects:", v7);

  return v5;
}

void __56__SUUISettingsGroupsDescription__gatherEditableSettings__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "hasEditableSettingDescriptions"))
  {
    objc_msgSend(v6, "editableSettingDescriptions");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v3, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v5);

  }
}

- (void)_presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id WeakRetained;
  void *v10;
  id v11;
  char v12;
  id v13;
  id v14;

  v6 = a4;
  v14 = a3;
  v8 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v10 = WeakRetained;
    v11 = objc_loadWeakRetained((id *)&self->_delegate);
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      v13 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v13, "settingsGroupsDescription:presentViewController:animated:completion:", self, v14, v6, v8);

    }
  }

}

- (void)_updatedEditsValid
{
  SUUISettingsGroupsDescriptionDelegate **p_delegate;
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v6 = objc_loadWeakRetained((id *)p_delegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v8, "settingsGroupsDescriptionDidUpdateValidity:", self);

    }
  }
}

- (SUUIClientContext)clientContext
{
  return (SUUIClientContext *)objc_loadWeakRetained((id *)&self->_clientContext);
}

- (void)setClientContext:(id)a3
{
  objc_storeWeak((id *)&self->_clientContext, a3);
}

- (SUUISettingsGroupsDescriptionDelegate)delegate
{
  return (SUUISettingsGroupsDescriptionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_clientContext);
  objc_destroyWeak((id *)&self->_settingsContext);
  objc_storeStrong((id *)&self->_groupDescriptions, 0);
  objc_storeStrong((id *)&self->_controllers, 0);
}

@end
