@implementation CKTokenizationSearchResultCell

+ (id)reuseIdentifier
{
  return CFSTR("TokenizationSearchCell");
}

- (CKTokenizationSearchResultCell)initWithFrame:(CGRect)a3
{
  CKTokenizationSearchResultCell *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKTokenizationSearchResultCell;
  v3 = -[CKTokenizationSearchResultCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTokenizationSearchResultCell setTintColor:](v3, "setTintColor:", v4);

  return v3;
}

- (void)configureWithQueryResult:(id)a3 searchText:(id)a4 mode:(unint64_t)a5
{
  id v7;
  void *v8;
  double v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v7 = a3;
  v8 = (void *)MEMORY[0x1E0DC1350];
  v9 = *MEMORY[0x1E0DC1440];
  v10 = a4;
  objc_msgSend(v8, "systemFontOfSize:weight:", 14.0, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA5F8], "metricsForTextStyle:", *MEMORY[0x1E0CEB540]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "scaledFontForFont:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithFont:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTokenizationSearchResultCell defaultContentConfiguration](self, "defaultContentConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "searchSuggestionsImageToTextPadding");
  objc_msgSend(v15, "setImageToTextPadding:");

  v20 = v7;
  -[CKTokenizationSearchResultCell _displayStringForTokenResult:searchText:](self, "_displayStringForTokenResult:searchText:", v20, v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setAttributedText:", v17);
  objc_msgSend(v20, "image");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "imageByApplyingSymbolConfiguration:", v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setImage:", v19);

  -[CKTokenizationSearchResultCell setContentConfiguration:](self, "setContentConfiguration:", v15);
}

- (id)_displayStringForTokenResult:(id)a3 searchText:(id)a4
{
  void *v5;
  double v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = (void *)MEMORY[0x1E0DC1350];
  v6 = *MEMORY[0x1E0DC1440];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v5, "systemFontOfSize:weight:", 16.0, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA5F8], "metricsForTextStyle:", *MEMORY[0x1E0CEB538]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scaledFontForFont:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "attributedSuggestionTextForSearchText:font:", v7, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (UIEdgeInsets)marginInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->marginInsets.top;
  left = self->marginInsets.left;
  bottom = self->marginInsets.bottom;
  right = self->marginInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setMarginInsets:(UIEdgeInsets)a3
{
  self->marginInsets = a3;
}

- (BOOL)_ck_isEditing
{
  return self->_ck_editing;
}

- (void)_ck_setEditing:(BOOL)a3
{
  self->_ck_editing = a3;
}

- (NSString)resultIdentifier
{
  return self->resultIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->resultIdentifier, 0);
}

@end
