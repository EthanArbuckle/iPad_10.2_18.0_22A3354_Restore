@implementation SFBrowsingAssistantSearchResultView

- (SFBrowsingAssistantSearchResultView)initWithSearchResult:(id)a3
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  SFBrowsingAssistantSearchResultView *v10;
  SFBrowsingAssistantSearchResultView *v11;
  uint64_t v12;
  UITableView *tableView;
  SFBrowsingAssistantSearchResultView *v14;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SFBrowsingAssistantSearchResultView;
  v6 = *MEMORY[0x1E0C9D648];
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v10 = -[SFBrowsingAssistantSearchResultView initWithFrame:](&v16, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v7, v8, v9);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_searchResult, a3);
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D48]), "initWithFrame:", v6, v7, v8, v9);
    tableView = v11->_tableView;
    v11->_tableView = (UITableView *)v12;

    -[UITableView setDataSource:](v11->_tableView, "setDataSource:", v11);
    -[UITableView setDelegate:](v11->_tableView, "setDelegate:", v11);
    -[UITableView setScrollEnabled:](v11->_tableView, "setScrollEnabled:", 0);
    -[UITableView setScrollsToTop:](v11->_tableView, "setScrollsToTop:", 0);
    -[UITableView setSeparatorStyle:](v11->_tableView, "setSeparatorStyle:", 0);
    -[UIView _sf_addEdgeMatchedSubview:](v11, "_sf_addEdgeMatchedSubview:", v11->_tableView);
    v14 = v11;
  }

  return v11;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v8 = 11;
  do
  {
    v9 = height;
    -[SFBrowsingAssistantSearchResultView setBounds:](self, "setBounds:", 0.0, 0.0, width, height);
    -[SFBrowsingAssistantSearchResultView layoutIfNeeded](self, "layoutIfNeeded");
    -[UITableView contentSize](self->_tableView, "contentSize");
    height = fmax(v10, 60.0);
    if (_SFEqualWithEpsilon(height, v9, 0.01))
      break;
    v9 = height;
    --v8;
  }
  while (v8);
  v11 = width;
  v12 = v9;
  result.height = v12;
  result.width = v11;
  return result;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v6 = a3;
  v7 = a4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2050000000;
  v8 = (void *)getSearchUITableViewCellClass_softClass;
  v27 = getSearchUITableViewCellClass_softClass;
  if (!getSearchUITableViewCellClass_softClass)
  {
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __getSearchUITableViewCellClass_block_invoke;
    v22 = &unk_1E21E3330;
    v23 = &v24;
    __getSearchUITableViewCellClass_block_invoke((uint64_t)&v19);
    v8 = (void *)v25[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v24, 8);
  objc_msgSend(v9, "reuseIdentifierForResult:", self->_searchResult);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v12 = CFSTR("BrowsingAssistantSearchResult");
  if (v10)
    v12 = (__CFString *)v10;
  v13 = v12;

  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x2050000000;
    v15 = (void *)getSearchUIClass_softClass;
    v27 = getSearchUIClass_softClass;
    if (!getSearchUIClass_softClass)
    {
      v19 = MEMORY[0x1E0C809B0];
      v20 = 3221225472;
      v21 = __getSearchUIClass_block_invoke;
      v22 = &unk_1E21E3330;
      v23 = &v24;
      __getSearchUIClass_block_invoke((uint64_t)&v19);
      v15 = (void *)v25[3];
    }
    v16 = objc_retainAutorelease(v15);
    _Block_object_dispose(&v24, 8);
    objc_msgSend(v16, "rowViewForResult:style:feedbackDelegate:", self->_searchResult, 0, self);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v14, "setAccessibilityIdentifier:", v13);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v14, "updateWithResult:", self->_searchResult);
  objc_msgSend(MEMORY[0x1E0DC34D8], "listGroupedCellConfiguration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setCornerRadius:", 22.0);
  objc_msgSend(v14, "setBackgroundConfiguration:", v17);

  return v14;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void (**actionHandler)(id, SFSearchResult *);
  id v6;

  objc_msgSend(a3, "cellForRowAtIndexPath:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "executeCommandWithTriggerEvent:", 2);
  actionHandler = (void (**)(id, SFSearchResult *))self->_actionHandler;
  if (actionHandler)
    actionHandler[2](actionHandler, self->_searchResult);

}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a3;
  v8 = a4;
  if (-[SFSearchResult _sf_isMediaResult](self->_searchResult, "_sf_isMediaResult"))
  {
    objc_msgSend(v7, "cellForRowAtIndexPath:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v10 = (void *)MEMORY[0x1E0DC36B8];
      objc_msgSend(v9, "contextMenuActionProvider");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)shouldHandleCardSectionEngagement:(id)a3
{
  return !-[SFSearchResult _sf_canOpenInBrowser](self->_searchResult, "_sf_canOpenInBrowser", a3);
}

- (void)didEngageResult:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0D8A0B8];
  v4 = a3;
  objc_msgSend(v3, "sharedPARSession");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didEngageResult:", v4);

}

- (void)didEngageCardSection:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0D8A0B8];
  v4 = a3;
  objc_msgSend(v3, "sharedPARSession");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didEngageCardSection:", v4);

}

- (void)didPerformCommand:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0D8A0B8];
  v5 = a3;
  objc_msgSend(v4, "sharedPARSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "didPerformCommand:", v5);

  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didClickEntityCardSBA");

  objc_msgSend(MEMORY[0x1E0D8A0B0], "sharedManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "donateBrowsingAssistantUserInteractionDetectedWithWebPageID:componentType:componentIdentifier:summaryText:tableOfContentsArrayLength:", self->_webpageIdentifier, objc_msgSend(MEMORY[0x1E0D8A0B0], "entityComponentTypeFromResult:", self->_searchResult), self->_componentIdentifier, 0, 0);

}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (NSString)webpageIdentifier
{
  return self->_webpageIdentifier;
}

- (void)setWebpageIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
}

- (NSNumber)componentIdentifier
{
  return self->_componentIdentifier;
}

- (void)setComponentIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_componentIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentIdentifier, 0);
  objc_storeStrong((id *)&self->_webpageIdentifier, 0);
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_searchResult, 0);
}

@end
