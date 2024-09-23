@implementation HUSceneSuggestionsViewController

- (HUSceneSuggestionsViewController)init
{
  HUSceneSuggestionsItemManager *v3;
  HUSceneSuggestionsViewController *v4;
  HUSceneSuggestionsViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v3 = -[HFItemManager initWithDelegate:]([HUSceneSuggestionsItemManager alloc], "initWithDelegate:", self);
  v14.receiver = self;
  v14.super_class = (Class)HUSceneSuggestionsViewController;
  v4 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v14, sel_initWithItemManager_tableViewStyle_, v3, 1);
  v5 = v4;
  if (v4)
  {
    -[HUSceneSuggestionsViewController setSuggestionsItemManager:](v4, "setSuggestionsItemManager:", v3);
    _HULocalizedStringWithDefaultValue(CFSTR("HUSceneSuggestionsTitle"), CFSTR("HUSceneSuggestionsTitle"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSceneSuggestionsViewController setTitle:](v5, "setTitle:", v6);

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 1, v5, sel__cancel_);
    -[HUSceneSuggestionsViewController navigationItem](v5, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLeftBarButtonItem:", v7);

    _HULocalizedStringWithDefaultValue(CFSTR("HUSceneSuggestionsBackButton"), CFSTR("HUSceneSuggestionsBackButton"), 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSceneSuggestionsViewController navigationItem](v5, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackButtonTitle:", v9);

    -[HUSceneSuggestionsViewController navigationItem](v5, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "leftBarButtonItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAccessibilityIdentifier:", CFSTR("Home.NewScene.Cancel"));

  }
  return v5;
}

- (void)_cancel:(id)a3
{
  id v4;
  id v5;

  -[HUSceneSuggestionsViewController presentationDelegate](self, "presentationDelegate", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v5, "finishPresentation:animated:", self, 1);

}

- (void)_showActionEditorForActionSetSuggestionItem:(id)a3
{
  void *v4;
  void *v5;
  HUSceneActionEditorViewController *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "latestResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D30B20]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = -[HUSceneActionEditorViewController initWithActionSetBuilder:mode:]([HUSceneActionEditorViewController alloc], "initWithActionSetBuilder:mode:", v5, 1);
    -[HUSceneActionEditorViewController setShowCancelButton:](v6, "setShowCancelButton:", 0);
    -[HUSceneSuggestionsViewController sceneEditorDelegate](self, "sceneEditorDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSceneActionEditorViewController setSceneEditorDelegate:](v6, "setSceneEditorDelegate:", v7);

    -[HUSceneSuggestionsViewController presentationDelegate](self, "presentationDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSceneActionEditorViewController setPresentationDelegate:](v6, "setPresentationDelegate:", v8);

    -[HUSceneSuggestionsViewController navigationController](self, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v9, "hu_pushPreloadableViewController:animated:", v6, 1);

  }
  else
  {
    NSLog(CFSTR("HFActionSetSuggestionItem (%@) didn't produce an actionSetBuilder in its update"), v11);
  }

}

- (void)_showActionEditorForNewCustomScene
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  HUSceneActionEditorViewController *v7;

  v7 = -[HUSceneActionEditorViewController initWithActionSetBuilder:mode:]([HUSceneActionEditorViewController alloc], "initWithActionSetBuilder:mode:", 0, 2);
  -[HUSceneActionEditorViewController setShowCancelButton:](v7, "setShowCancelButton:", 0);
  -[HUSceneSuggestionsViewController sceneEditorDelegate](self, "sceneEditorDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSceneActionEditorViewController setSceneEditorDelegate:](v7, "setSceneEditorDelegate:", v3);

  -[HUSceneSuggestionsViewController presentationDelegate](self, "presentationDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSceneActionEditorViewController setPresentationDelegate:](v7, "setPresentationDelegate:", v4);

  -[HUSceneSuggestionsViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "hu_pushPreloadableViewController:animated:", v7, 1);

}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  -[HUSceneSuggestionsViewController suggestionsItemManager](self, "suggestionsItemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addCustomSceneItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)(id)objc_opt_class();
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  id v14;

  v14 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v14;
    objc_msgSend(v5, "setHideDescription:", 1);
    objc_msgSend(v5, "setAccessoryType:", 1);
    objc_msgSend(v5, "setIconDisplayStyle:", 1);
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "titleText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E6F60E80);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("Home.NewScene.%@"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAccessibilityIdentifier:", v9);

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      +[HUGridSceneCellLayoutOptions defaultOptionsForCellSizeSubclass:](HUGridSceneCellLayoutOptions, "defaultOptionsForCellSizeSubclass:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "font");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setTitleFont:", v11);

    }
    goto LABEL_7;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v13 = v14;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v14, "setAccessibilityIdentifier:", CFSTR("Home.NewScene.Custom"));
LABEL_7:
    v13 = v14;
  }

}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HUSceneSuggestionsViewController;
  v6 = a4;
  v7 = a3;
  -[HUItemTableViewController tableView:didSelectRowAtIndexPath:](&v13, sel_tableView_didSelectRowAtIndexPath_, v7, v6);
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1, v13.receiver, v13.super_class);

  -[HUItemTableViewController itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayedItemAtIndexPath:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[HUSceneSuggestionsViewController _showActionEditorForActionSetSuggestionItem:](self, "_showActionEditorForActionSetSuggestionItem:", v9);
  }
  else
  {
    -[HUSceneSuggestionsViewController suggestionsItemManager](self, "suggestionsItemManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addCustomSceneItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "isEqual:", v11);

    if (v12)
      -[HUSceneSuggestionsViewController _showActionEditorForNewCustomScene](self, "_showActionEditorForNewCustomScene");
  }

}

+ (id)computeNumberOfSuggestionsInHome:(id)a3
{
  return +[HUSceneSuggestionsItemManager computeNumberOfSuggestionsInHome:](HUSceneSuggestionsItemManager, "computeNumberOfSuggestionsInHome:", a3);
}

- (HUPresentationDelegate)presentationDelegate
{
  return (HUPresentationDelegate *)objc_loadWeakRetained((id *)&self->_presentationDelegate);
}

- (void)setPresentationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_presentationDelegate, a3);
}

- (HUSceneEditorDelegate)sceneEditorDelegate
{
  return (HUSceneEditorDelegate *)objc_loadWeakRetained((id *)&self->_sceneEditorDelegate);
}

- (void)setSceneEditorDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_sceneEditorDelegate, a3);
}

- (HUSceneSuggestionsItemManager)suggestionsItemManager
{
  return (HUSceneSuggestionsItemManager *)objc_loadWeakRetained((id *)&self->_suggestionsItemManager);
}

- (void)setSuggestionsItemManager:(id)a3
{
  objc_storeWeak((id *)&self->_suggestionsItemManager, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_suggestionsItemManager);
  objc_destroyWeak((id *)&self->_sceneEditorDelegate);
  objc_destroyWeak((id *)&self->_presentationDelegate);
}

@end
