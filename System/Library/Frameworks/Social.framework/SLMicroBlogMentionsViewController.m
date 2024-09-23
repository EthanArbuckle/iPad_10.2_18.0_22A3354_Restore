@implementation SLMicroBlogMentionsViewController

- (SLMicroBlogMentionsViewController)initWithSheetDelegate:(id)a3
{
  id v4;
  SLMicroBlogMentionsViewController *v5;
  SLMicroBlogMentionsViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SLMicroBlogMentionsViewController;
  v5 = -[SLMicroBlogMentionsViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, 0, 0);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_sheetDelegate, v4);

  return v6;
}

- (void)completeWithSelectedMention:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SLMicroBlogMentionsViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mentionsViewController:finishedWithResult:", self, v4);

}

- (id)mentions
{
  NSArray *mentions;
  NSArray *v4;
  NSArray *v5;

  mentions = self->_mentions;
  if (!mentions)
  {
    v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = self->_mentions;
    self->_mentions = v4;

    -[SLMicroBlogMentionsViewController updateMentions](self, "updateMentions");
    mentions = self->_mentions;
  }
  return mentions;
}

- (void)setMentions:(id)a3
{
  uint64_t v3;
  NSArray *v5;
  NSArray *mentions;
  NSArray *v7;
  UITableView *tableView;
  void *v9;
  double v10;
  double v11;

  v5 = (NSArray *)a3;
  _SLLog(v3, 7, CFSTR("SLMicroBlogMentionsViewController setMentions:"));
  mentions = self->_mentions;
  self->_mentions = v5;
  v7 = v5;

  tableView = self->_tableView;
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView reloadSections:withRowAnimation:](tableView, "reloadSections:withRowAnimation:", v9, 100);

  -[UITableView sizeThatFits:](self->_tableView, "sizeThatFits:", 0.0, 1100.0);
  v11 = v10;
  -[NSArray count](self->_mentions, "count");

  _SLLog(v3, 7, CFSTR("SLMicroBlogMentionsViewController preferredContentSize => %g %g for _mentions.count %d"));
  -[SLMicroBlogMentionsViewController setPreferredContentSize:](self, "setPreferredContentSize:", 320.0, v11);
}

- (void)updateMentions
{
  void *v3;
  id WeakRetained;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__SLMicroBlogMentionsViewController_updateMentions__block_invoke;
  v5[3] = &unk_1E75913B8;
  v5[4] = self;
  v3 = (void *)MEMORY[0x1C3B6C8B8](v5, a2);
  WeakRetained = objc_loadWeakRetained((id *)&self->_sheetDelegate);
  objc_msgSend(WeakRetained, "recordsMatchingPrefixString:completion:", self->_searchString, v3);

}

uint64_t __51__SLMicroBlogMentionsViewController_updateMentions__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v4;
  _QWORD block[5];
  id v7;

  v4 = a2;
  _SLLog(v2, 7, CFSTR("Got mentions match error %{public}@ and results %@"));
  if (v4)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__SLMicroBlogMentionsViewController_updateMentions__block_invoke_2;
    block[3] = &unk_1E7590CC8;
    block[4] = *(_QWORD *)(a1 + 32);
    v7 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  return 1;
}

uint64_t __51__SLMicroBlogMentionsViewController_updateMentions__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setMentions:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("contentSizeForViewInPopover"));
  return objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("contentSizeForViewInPopover"));
}

- (void)setSearchString:(id)a3
{
  uint64_t v3;
  id v5;
  NSComparisonResult v6;
  NSString *v7;
  NSString *searchString;

  v5 = a3;
  _SLLog(v3, 7, CFSTR("SLMicroBlogMentionsViewController setSearchString: %@"));
  v6 = -[NSString compare:](self->_searchString, "compare:", v5, v5);
  v7 = (NSString *)objc_msgSend(v5, "copy");

  searchString = self->_searchString;
  self->_searchString = v7;

  if (v6)
  {
    if (-[NSString length](self->_searchString, "length"))
      -[SLMicroBlogMentionsViewController updateMentions](self, "updateMentions");
    else
      -[SLMicroBlogMentionsViewController setMentions:](self, "setMentions:", 0);
  }
}

- (void)loadView
{
  id v3;
  void *v4;
  UITableView *v5;
  UITableView *tableView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SLMicroBlogMentionsViewController;
  -[SLMicroBlogMentionsViewController loadView](&v13, sel_loadView);
  v3 = objc_alloc(MEMORY[0x1E0CEAA58]);
  -[SLMicroBlogMentionsViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v5 = (UITableView *)objc_msgSend(v3, "initWithFrame:");
  tableView = self->_tableView;
  self->_tableView = v5;

  -[UITableView setAutoresizingMask:](self->_tableView, "setAutoresizingMask:", 18);
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
  -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
  -[UITableView setOpaque:](self->_tableView, "setOpaque:", 0);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView setBackgroundColor:](self->_tableView, "setBackgroundColor:", v7);

  -[UITableView backgroundView](self->_tableView, "backgroundView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setOpaque:", 0);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView backgroundView](self->_tableView, "backgroundView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v9);

  -[UITableView setRowHeight:](self->_tableView, "setRowHeight:", *MEMORY[0x1E0CEBC10]);
  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lineHeight");
  -[UITableView setEstimatedRowHeight:](self->_tableView, "setEstimatedRowHeight:", v12 + v12);

  -[SLMicroBlogMentionsViewController setView:](self, "setView:", self->_tableView);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v4;
  void *v5;
  int64_t v6;

  -[SLMicroBlogMentionsViewController mentions](self, "mentions", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _SLLog(v4, 7, CFSTR("Mentions tableView:numberOfRowsInSection: with results %@"));
  v6 = objc_msgSend(v5, "count", v5);

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v4;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id WeakRetained;
  char v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  _QWORD v40[4];
  id v41;
  SLMicroBlogMentionsViewController *v42;
  id v43;

  v7 = a3;
  v8 = a4;
  _SLLog(v4, 7, CFSTR("Mentions tableView:cellForRowAtIndexPath: %@"));
  v9 = objc_msgSend(v8, "indexAtPosition:", 1, v8);

  -[SLMicroBlogMentionsViewController mentions](self, "mentions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndex:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  _SLLog(v4, 7, CFSTR("Mentions tableView:cellForRowAtIndexPath: using userRecord %@"));
  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v11, "screen_name", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("@%@"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", CFSTR("MicroBlogMentionCell"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA60]), "initWithStyle:reuseIdentifier:", 3, CFSTR("MicroBlogMentionCell"));
  objc_msgSend(v15, "setOpaque:", 0);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBackgroundColor:", v16);

  objc_msgSend(v15, "textLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setText:", v14);

  objc_msgSend(v11, "name");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v11, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "detailTextLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setText:", v19);

  }
  objc_msgSend(v11, "profileImageCache");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "imageView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setImage:", v21);

  objc_msgSend(v15, "imageView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "image");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_sheetDelegate);
    v26 = objc_opt_respondsToSelector();

    if ((v26 & 1) != 0)
    {
      v27 = objc_loadWeakRetained((id *)&self->_sheetDelegate);
      objc_msgSend(v11, "screen_name");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "cachedProfileImageDataForScreenName:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        objc_msgSend(MEMORY[0x1E0CEA638], "imageWithData:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "imageView");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setImage:", v30);

      }
    }
  }
  objc_msgSend(v15, "imageView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "image");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v33)
  {
    +[SLMicroBlogMentionsViewController _blankSurrogateProfileImage](SLMicroBlogMentionsViewController, "_blankSurrogateProfileImage");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setProfileImageCache:", v34);

    objc_msgSend(v11, "profileImageCache");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "imageView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setImage:", v35);

    _SLLog(v4, 7, CFSTR("Mentions will fetch profile image for userRecord %@"));
    v37 = objc_loadWeakRetained((id *)&self->_sheetDelegate);
    objc_msgSend(v11, "screen_name", v11);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __69__SLMicroBlogMentionsViewController_tableView_cellForRowAtIndexPath___block_invoke;
    v40[3] = &unk_1E75913E0;
    v41 = v11;
    v42 = self;
    v43 = v7;
    objc_msgSend(v37, "fetchProfileImageDataForScreenName:completion:", v38, v40);

  }
  return v15;
}

void __69__SLMicroBlogMentionsViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  id v6;
  id v7;
  int8x16_t v8;
  _QWORD block[4];
  int8x16_t v10;
  id v11;
  id v12;

  v6 = a2;
  _SLLog(v3, 7, CFSTR("Mentions did fetch profile image data %lx error %{public}@ for userRecord %@"));
  if (v6 && !a3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__SLMicroBlogMentionsViewController_tableView_cellForRowAtIndexPath___block_invoke_2;
    block[3] = &unk_1E7590BD8;
    v8 = *(int8x16_t *)(a1 + 32);
    v7 = (id)v8.i64[0];
    v10 = vextq_s8(v8, v8, 8uLL);
    v11 = v6;
    v12 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __69__SLMicroBlogMentionsViewController_tableView_cellForRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "mentions");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v11, "indexOfObject:", *(_QWORD *)(a1 + 40));
  v4 = v11;
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "imageWithData:", *(_QWORD *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 40);
    _SLLog(v1, 7, CFSTR("Mentions built image %@ for userRecord %@"));
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 40), "setProfileImageCache:", v5, v5, v9);
      v6 = (void *)MEMORY[0x1E0C99D20];
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v3, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "arrayWithObject:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = *(_QWORD *)(a1 + 40);
      _SLLog(v1, 7, CFSTR("Mentions refreshing row %@ for userRecord %@"));
      objc_msgSend(*(id *)(a1 + 56), "reloadRowsAtIndexPaths:withRowAnimation:", v8, 100, v8, v10);

    }
    v4 = v11;
  }

}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v5;
  id v6;

  v5 = a4;
  objc_msgSend(v5, "setOpaque:", 0);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

}

- (void)chooseRow:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  -[NSArray objectAtIndex:](self->_mentions, "objectAtIndex:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "screen_name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", CFSTR(" "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SLMicroBlogMentionsViewController completeWithSelectedMention:](self, "completeWithSelectedMention:", v5);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v4;
  id v6;
  uint64_t v7;

  v6 = a4;
  _SLLog(v4, 7, CFSTR("SLMicroBlogMentionsViewController didSelectRowAtIndexPath: %@"));
  v7 = objc_msgSend(v6, "indexAtPosition:", 1, v6);

  -[SLMicroBlogMentionsViewController chooseRow:](self, "chooseRow:", v7);
}

+ (id)_blankSurrogateProfileImage
{
  void *v2;
  CGContext *CurrentContext;
  uint64_t v4;
  void *v5;
  CGSize v7;

  v2 = (void *)_blankSurrogateProfileImage___blankImage;
  if (!_blankSurrogateProfileImage___blankImage)
  {
    v7.width = 50.0;
    v7.height = 50.0;
    UIGraphicsBeginImageContext(v7);
    CurrentContext = UIGraphicsGetCurrentContext();
    UIGraphicsPushContext(CurrentContext);
    UIGraphicsPopContext();
    UIGraphicsGetImageFromCurrentImageContext();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)_blankSurrogateProfileImage___blankImage;
    _blankSurrogateProfileImage___blankImage = v4;

    UIGraphicsEndImageContext();
    v2 = (void *)_blankSurrogateProfileImage___blankImage;
  }
  return v2;
}

- (SLMicroBlogMentionsDelegate)delegate
{
  return (SLMicroBlogMentionsDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_mentions, 0);
  objc_destroyWeak((id *)&self->_sheetDelegate);
}

@end
