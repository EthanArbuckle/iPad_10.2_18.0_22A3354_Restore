@implementation SUUISettingsGroupDescription

- (SUUISettingsGroupDescription)initWithParent:(id)a3 settingsContext:(id)a4
{
  id v6;
  id v7;
  SUUISettingsGroupDescription *v8;
  SUUISettingsGroupDescription *v9;
  SUUISettingsHeaderFooterDescription *footerDescription;
  SUUISettingsHeaderFooterDescription *headerDescription;
  SUUISettingsObjectStore *v12;
  SUUISettingsObjectStore *settingDescriptions;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SUUISettingsGroupDescription;
  v8 = -[SUUISettingsGroupDescription init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_parent, v6);
    objc_storeWeak((id *)&v9->_settingsContext, v7);
    footerDescription = v9->_footerDescription;
    v9->_footerDescription = 0;

    headerDescription = v9->_headerDescription;
    v9->_headerDescription = 0;

    v12 = objc_alloc_init(SUUISettingsObjectStore);
    settingDescriptions = v9->_settingDescriptions;
    v9->_settingDescriptions = v12;

  }
  return v9;
}

- (void)addSettingDescription:(id)a3
{
  id WeakRetained;
  id v5;
  NSMutableSet *editableSettings;
  NSMutableSet *v7;
  NSMutableSet *v8;
  id v9;

  v9 = a3;
  -[SUUISettingsObjectStore addObject:hidden:](self->_settingDescriptions, "addObject:hidden:", v9, objc_msgSend(v9, "_initiallyHidden"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)&self->_controller);
    objc_msgSend(v5, "attachSettingDescription:", v9);

  }
  if (objc_msgSend((id)objc_opt_class(), "allowsEdit"))
  {
    editableSettings = self->_editableSettings;
    if (!editableSettings)
    {
      v7 = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", 1);
      v8 = self->_editableSettings;
      self->_editableSettings = v7;

      editableSettings = self->_editableSettings;
    }
    -[NSMutableSet addObject:](editableSettings, "addObject:", v9);
  }

}

- (void)addSettingViewElement:(id)a3
{
  SUUISettingsContext **p_settingsContext;
  id v5;
  id WeakRetained;
  id v7;

  p_settingsContext = &self->_settingsContext;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_settingsContext);
  objc_msgSend(WeakRetained, "dequeueReusableSettingDescriptionForViewElement:parent:", v5, self);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[SUUISettingsGroupDescription addSettingDescription:](self, "addSettingDescription:", v7);
}

- (void)addSibling:(id)a3
{
  id v4;
  SUUISettingsDescriptionUpdate *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[SUUISettingsGroupDescription addSettingDescription:](self, "addSettingDescription:", v4);
  objc_msgSend(v4, "indexPath");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v5 = -[SUUISettingsDescriptionUpdate initWithUpdateType:]([SUUISettingsDescriptionUpdate alloc], "initWithUpdateType:", 4);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUISettingsDescriptionUpdate setIndexPaths:](v5, "setIndexPaths:", v6);

    -[SUUISettingsGroupDescription dispatchUpdate:](self, "dispatchUpdate:", v5);
  }

}

- (SUUIClientContext)clientContext
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  objc_msgSend(WeakRetained, "clientContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SUUIClientContext *)v3;
}

- (void)deleteSettingsGroup
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  objc_msgSend(WeakRetained, "deleteSettingsGroupDescription:", self);

}

- (void)deleteSettingDescription:(id)a3
{
  id v4;
  void *v5;
  SUUISettingsDescriptionUpdate *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[SUUISettingsGroupDescription indexPathForSettingDescription:](self, "indexPathForSettingDescription:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SUUISettingsObjectStore removeObject:](self->_settingDescriptions, "removeObject:", v4);
  -[NSMutableSet removeObject:](self->_editableSettings, "removeObject:", v4);

  if (!-[SUUISettingsObjectStore numberOfObjects](self->_settingDescriptions, "numberOfObjects"))
  {
    -[SUUISettingsGroupDescription deleteSettingsGroup](self, "deleteSettingsGroup");
    goto LABEL_7;
  }
  if (!-[SUUISettingsObjectStore numberOfVisibleObjects](self->_settingDescriptions, "numberOfVisibleObjects"))
  {
    -[SUUISettingsGroupDescription hideSettingsGroup](self, "hideSettingsGroup");
    goto LABEL_7;
  }
  v5 = v8;
  if (v8)
  {
    v6 = -[SUUISettingsDescriptionUpdate initWithUpdateType:]([SUUISettingsDescriptionUpdate alloc], "initWithUpdateType:", 3);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUISettingsDescriptionUpdate setIndexPaths:](v6, "setIndexPaths:", v7);

    -[SUUISettingsGroupDescription dispatchUpdate:](self, "dispatchUpdate:", v6);
LABEL_7:
    v5 = v8;
  }

}

- (void)dispatchUpdate:(id)a3
{
  SUUISettingsGroupsDescription **p_parent;
  id v4;
  id WeakRetained;

  p_parent = &self->_parent;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_parent);
  objc_msgSend(WeakRetained, "dispatchUpdate:", v4);

}

- (id)editableSettingDescriptions
{
  return (id)-[NSMutableSet copy](self->_editableSettings, "copy");
}

- (id)footerDescription
{
  return self->_footerDescription;
}

- (BOOL)hasEditableSettingDescriptions
{
  NSMutableSet *editableSettings;

  editableSettings = self->_editableSettings;
  if (editableSettings)
    LOBYTE(editableSettings) = -[NSMutableSet count](editableSettings, "count") != 0;
  return (char)editableSettings;
}

- (BOOL)hasFooter
{
  return self->_footerDescription != 0;
}

- (BOOL)hasHeader
{
  return self->_headerDescription != 0;
}

- (BOOL)hasNoVisibleSettings
{
  return -[SUUISettingsGroupDescription isEmpty](self, "isEmpty")
      || -[SUUISettingsObjectStore numberOfVisibleObjects](self->_settingDescriptions, "numberOfVisibleObjects") == 0;
}

- (id)headerDescription
{
  return self->_headerDescription;
}

- (void)hideSettingsGroup
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  objc_msgSend(WeakRetained, "hideSettingsGroupDescription:", self);

}

- (void)hideSettingDescription:(id)a3
{
  id v4;
  void *v5;
  SUUISettingsDescriptionUpdate *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[SUUISettingsGroupDescription indexPathForSettingDescription:](self, "indexPathForSettingDescription:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SUUISettingsObjectStore hideObject:](self->_settingDescriptions, "hideObject:", v4);

  if (!-[SUUISettingsObjectStore numberOfVisibleObjects](self->_settingDescriptions, "numberOfVisibleObjects"))
  {
    -[SUUISettingsGroupDescription hideSettingsGroup](self, "hideSettingsGroup");
    goto LABEL_5;
  }
  v5 = v8;
  if (v8)
  {
    v6 = -[SUUISettingsDescriptionUpdate initWithUpdateType:]([SUUISettingsDescriptionUpdate alloc], "initWithUpdateType:", 3);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUISettingsDescriptionUpdate setIndexPaths:](v6, "setIndexPaths:", v7);

    -[SUUISettingsGroupDescription dispatchUpdate:](self, "dispatchUpdate:", v6);
LABEL_5:
    v5 = v8;
  }

}

- (unint64_t)index
{
  id WeakRetained;
  unint64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  v4 = objc_msgSend(WeakRetained, "indexOfSettingsGroupDescription:", self);

  return v4;
}

- (id)indexPathForSettingDescription:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  void *v6;

  v4 = -[SUUISettingsObjectStore indexOfVisibleObject:](self->_settingDescriptions, "indexOfVisibleObject:", a3);
  v5 = -[SUUISettingsGroupDescription index](self, "index");
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (BOOL)isEmpty
{
  SUUISettingsObjectStore *settingDescriptions;

  settingDescriptions = self->_settingDescriptions;
  return !settingDescriptions || -[SUUISettingsObjectStore numberOfObjects](settingDescriptions, "numberOfObjects") == 0;
}

- (BOOL)isSettingDescriptionHidden:(id)a3
{
  return !-[SUUISettingsObjectStore objectIsVisible:](self->_settingDescriptions, "objectIsVisible:", a3);
}

- (id)newSiblingWithClass:(Class)a3
{
  return (id)objc_msgSend([a3 alloc], "initWithViewElement:parent:", 0, self);
}

- (unint64_t)numberOfSettings
{
  return -[SUUISettingsObjectStore numberOfVisibleObjects](self->_settingDescriptions, "numberOfVisibleObjects");
}

- (void)recycle
{
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_settingsContext);
  -[SUUISettingsObjectStore allObjects](self->_settingDescriptions, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "recycleSettingDescriptions:", v3);

}

- (void)reloadData
{
  -[SUUISettingsObjectStore enumerateObjects:](self->_settingDescriptions, "enumerateObjects:", &__block_literal_global_58);
}

uint64_t __42__SUUISettingsGroupDescription_reloadData__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reloadData");
}

- (void)reloadSettingDescription:(id)a3
{
  -[SUUISettingsGroupDescription _dispatchUpdateForSettingDescription:updateType:](self, "_dispatchUpdateForSettingDescription:updateType:", a3, 5);
}

- (void)requestLayoutForWidth:(double)a3 context:(id)a4
{
  id v6;
  objc_class *v7;
  objc_class *v8;
  SUUISettingsObjectStore *settingDescriptions;
  id v10;
  _QWORD v11[4];
  id v12;
  double v13;

  v6 = a4;
  if (-[SUUISettingsGroupDescription hasFooter](self, "hasFooter"))
  {
    v7 = +[SUUISettingsHeaderFooterDescription viewClassForSettingsHeaderFooterDescription:](SUUISettingsHeaderFooterDescription, "viewClassForSettingsHeaderFooterDescription:", self->_footerDescription);
    -[objc_class prefetchResourcesForSettingsHeaderFooterDescription:reason:context:](v7, "prefetchResourcesForSettingsHeaderFooterDescription:reason:context:", self->_footerDescription, 0, v6);
    -[objc_class requestLayoutForSettingsHeaderFooterDescription:width:context:](v7, "requestLayoutForSettingsHeaderFooterDescription:width:context:", self->_footerDescription, v6, a3);
  }
  if (-[SUUISettingsGroupDescription hasHeader](self, "hasHeader"))
  {
    v8 = +[SUUISettingsHeaderFooterDescription viewClassForSettingsHeaderFooterDescription:](SUUISettingsHeaderFooterDescription, "viewClassForSettingsHeaderFooterDescription:", self->_headerDescription);
    -[objc_class prefetchResourcesForSettingsHeaderFooterDescription:reason:context:](v8, "prefetchResourcesForSettingsHeaderFooterDescription:reason:context:", self->_headerDescription, 0, v6);
    -[objc_class requestLayoutForSettingsHeaderFooterDescription:width:context:](v8, "requestLayoutForSettingsHeaderFooterDescription:width:context:", self->_headerDescription, v6, a3);
  }
  settingDescriptions = self->_settingDescriptions;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __62__SUUISettingsGroupDescription_requestLayoutForWidth_context___block_invoke;
  v11[3] = &unk_2511FCDA8;
  v12 = v6;
  v13 = a3;
  v10 = v6;
  -[SUUISettingsObjectStore enumerateObjects:](settingDescriptions, "enumerateObjects:", v11);

}

void __62__SUUISettingsGroupDescription_requestLayoutForWidth_context___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;

  v4 = a2;
  v3 = +[SUUISettingDescription viewClassForSettingDescription:](SUUISettingDescription, "viewClassForSettingDescription:", v4);
  -[objc_class prefetchResourcesForSettingDescription:reason:context:](v3, "prefetchResourcesForSettingDescription:reason:context:", v4, 0, *(_QWORD *)(a1 + 32));
  -[objc_class requestLayoutForSettingDescription:width:context:](v3, "requestLayoutForSettingDescription:width:context:", v4, *(_QWORD *)(a1 + 32), *(double *)(a1 + 40));

}

- (void)revealSettingDescription:(id)a3
{
  unint64_t v4;
  id v5;

  v5 = a3;
  v4 = -[SUUISettingsObjectStore numberOfVisibleObjects](self->_settingDescriptions, "numberOfVisibleObjects");
  -[SUUISettingsObjectStore revealObject:](self->_settingDescriptions, "revealObject:", v5);
  if (v4)
    -[SUUISettingsGroupDescription _dispatchUpdateForSettingDescription:updateType:](self, "_dispatchUpdateForSettingDescription:updateType:", v5, 4);
  else
    -[SUUISettingsGroupDescription revealSettingsGroup](self, "revealSettingsGroup");

}

- (void)revealSettingsGroup
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  objc_msgSend(WeakRetained, "revealSettingsGroupDescription:", self);

}

- (void)setFooterDescription:(id)a3
{
  objc_storeStrong((id *)&self->_footerDescription, a3);
}

- (void)setFooterViewElement:(id)a3
{
  SUUISettingsHeaderFooterDescription *v4;
  SUUISettingsHeaderFooterDescription *footerDescription;

  +[SUUISettingsHeaderFooterDescription settingsHeaderFooterDescriptionWithViewElement:](SUUISettingsHeaderFooterDescription, "settingsHeaderFooterDescriptionWithViewElement:", a3);
  v4 = (SUUISettingsHeaderFooterDescription *)objc_claimAutoreleasedReturnValue();
  footerDescription = self->_footerDescription;
  self->_footerDescription = v4;

}

- (void)setHeaderDescription:(id)a3
{
  objc_storeStrong((id *)&self->_headerDescription, a3);
}

- (void)setHeaderViewElement:(id)a3
{
  SUUISettingsHeaderFooterDescription *v4;
  SUUISettingsHeaderFooterDescription *headerDescription;

  +[SUUISettingsHeaderFooterDescription settingsHeaderFooterDescriptionWithViewElement:](SUUISettingsHeaderFooterDescription, "settingsHeaderFooterDescriptionWithViewElement:", a3);
  v4 = (SUUISettingsHeaderFooterDescription *)objc_claimAutoreleasedReturnValue();
  headerDescription = self->_headerDescription;
  self->_headerDescription = v4;

}

- (id)settingDescriptionAtIndex:(unint64_t)a3
{
  return -[SUUISettingsObjectStore visibleObjectAtIndex:](self->_settingDescriptions, "visibleObjectAtIndex:", a3);
}

- (id)viewElementForSettingAtIndex:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[SUUISettingsGroupDescription settingDescriptionAtIndex:](self, "settingDescriptionAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  SUUISettingsObjectStore *settingDescriptions;
  id v7;
  _QWORD v9[4];
  id v10;
  objc_super v11;

  v3 = objc_alloc(MEMORY[0x24BDD16A8]);
  v11.receiver = self;
  v11.super_class = (Class)SUUISettingsGroupDescription;
  -[SUUISettingsGroupDescription description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@: ["), v4);

  settingDescriptions = self->_settingDescriptions;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __43__SUUISettingsGroupDescription_description__block_invoke;
  v9[3] = &unk_2511FCDD0;
  v7 = v5;
  v10 = v7;
  -[SUUISettingsObjectStore enumerateObjects:](settingDescriptions, "enumerateObjects:", v9);
  objc_msgSend(v7, "appendString:", CFSTR("\n]"));

  return v7;
}

void __43__SUUISettingsGroupDescription_description__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "description");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("\n %@"), v3);

}

- (void)_dispatchUpdateForSettingDescription:(id)a3 updateType:(int64_t)a4
{
  SUUISettingsDescriptionUpdate *v6;
  void *v7;
  id v8;

  -[SUUISettingsGroupDescription indexPathForSettingDescription:](self, "indexPathForSettingDescription:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v6 = -[SUUISettingsDescriptionUpdate initWithUpdateType:]([SUUISettingsDescriptionUpdate alloc], "initWithUpdateType:", a4);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUISettingsDescriptionUpdate setIndexPaths:](v6, "setIndexPaths:", v7);

    -[SUUISettingsGroupDescription dispatchUpdate:](self, "dispatchUpdate:", v6);
  }

}

- (void)_dismissViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  SUUISettingsGroupsDescription **p_parent;
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

- (void)_presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  SUUISettingsGroupsDescription **p_parent;
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

- (void)_updatedEditsValid
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  objc_msgSend(WeakRetained, "_updatedEditsValid");

}

- (SUUISettingsGroupController)controller
{
  return (SUUISettingsGroupController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (void)setController:(id)a3
{
  objc_storeWeak((id *)&self->_controller, a3);
}

- (SUUISettingsGroupsDescription)parent
{
  return (SUUISettingsGroupsDescription *)objc_loadWeakRetained((id *)&self->_parent);
}

- (void)setParent:(id)a3
{
  objc_storeWeak((id *)&self->_parent, a3);
}

- (SUUIGroupViewElement)viewElement
{
  return self->_viewElement;
}

- (void)setViewElement:(id)a3
{
  objc_storeStrong((id *)&self->_viewElement, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewElement, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_destroyWeak((id *)&self->_controller);
  objc_destroyWeak((id *)&self->_settingsContext);
  objc_storeStrong((id *)&self->_settingDescriptions, 0);
  objc_storeStrong((id *)&self->_headerDescription, 0);
  objc_storeStrong((id *)&self->_footerDescription, 0);
  objc_storeStrong((id *)&self->_editableSettings, 0);
}

@end
