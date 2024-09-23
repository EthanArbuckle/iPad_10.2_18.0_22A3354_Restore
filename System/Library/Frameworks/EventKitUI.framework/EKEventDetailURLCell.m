@implementation EKEventDetailURLCell

+ (Class)_SGSuggestionsServiceClass
{
  return (Class)EKWeakLinkClass();
}

- (EKEventDetailURLCell)initWithEvent:(id)a3 url:(id)a4 editable:(BOOL)a5 style:(int64_t)a6
{
  _BOOL8 v7;
  id v11;
  EKEventDetailURLCell *v12;
  EKEventDetailURLCell *v13;
  SGSuggestedEventLaunchInfo *launchInfo;
  objc_super v16;

  v7 = a5;
  v11 = a4;
  v16.receiver = self;
  v16.super_class = (Class)EKEventDetailURLCell;
  v12 = -[EKEventDetailCell initWithEvent:editable:style:](&v16, sel_initWithEvent_editable_style_, a3, v7, a6);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_url, a4);
    launchInfo = v13->_launchInfo;
    v13->_launchInfo = 0;

  }
  return v13;
}

- (EKEventDetailURLCell)initWithEvent:(id)a3 launchInfo:(id)a4 editable:(BOOL)a5 style:(int64_t)a6
{
  _BOOL8 v7;
  id v11;
  EKEventDetailURLCell *v12;
  EKEventDetailURLCell *v13;
  NSURL *url;
  objc_super v16;

  v7 = a5;
  v11 = a4;
  v16.receiver = self;
  v16.super_class = (Class)EKEventDetailURLCell;
  v12 = -[EKEventDetailCell initWithEvent:editable:style:](&v16, sel_initWithEvent_editable_style_, a3, v7, a6);
  v13 = v12;
  if (v12)
  {
    url = v12->_url;
    v12->_url = 0;

    objc_storeStrong((id *)&v13->_launchInfo, a4);
  }

  return v13;
}

- (void)updateWithURL:(id)a3 launchInfo:(id)a4
{
  NSURL *v6;
  SGSuggestedEventLaunchInfo *v7;
  NSURL *url;
  NSURL *v9;
  SGSuggestedEventLaunchInfo *launchInfo;

  v6 = (NSURL *)a3;
  v7 = (SGSuggestedEventLaunchInfo *)a4;
  url = self->_url;
  self->_url = v6;
  v9 = v6;

  launchInfo = self->_launchInfo;
  self->_launchInfo = v7;

  -[EKEventDetailURLCell update](self, "update");
}

- (BOOL)update
{
  BOOL v3;
  UILabel *URLTitleView;
  uint64_t v5;
  void *v6;
  UILabel *v7;
  void *v8;
  UITextView *URLView;
  void *v10;
  UITextView *v11;
  void *v12;

  v3 = -[EKEventDetailURLCell updateLink](self, "updateLink");
  URLTitleView = self->_URLTitleView;
  v5 = *MEMORY[0x1E0DC4A88];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](URLTitleView, "setFont:", v6);

  v7 = self->_URLTitleView;
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v7, "setTextColor:", v8);

  URLView = self->_URLView;
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setFont:](URLView, "setFont:", v10);

  v11 = self->_URLView;
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setTextColor:](v11, "setTextColor:", v12);

  return v3;
}

- (BOOL)updateLink
{
  if (self->_launchInfo)
  {
    -[EKEventDetailURLCell updateLinkWithLaunchInfo](self, "updateLinkWithLaunchInfo");
  }
  else
  {
    if (!self->_url)
      return 0;
    -[EKEventDetailURLCell updateLinkWithURL](self, "updateLinkWithURL");
  }
  return 1;
}

- (void)updateLinkWithURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[EKEvent URL](self->super._event, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[EKEventDetailURLCell _URLView](self, "_URLView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAttributedText:", 0);
    goto LABEL_5;
  }
  -[EKEvent URL](self->super._event, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CUIKGetAttributedStringForEventDetailWithURL();
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v7;
  if (v7)
  {
    -[EKEventDetailURLCell _URLView](self, "_URLView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAttributedText:", v7);

LABEL_5:
    v5 = v7;
  }

}

- (void)updateLinkWithLaunchInfo
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("calshow://launchSuggestedEvent"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0CB3498]);
  -[SGSuggestedEventLaunchInfo localizedShowInString](self->_launchInfo, "localizedShowInString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0DC1160];
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithString:attributes:", v6, v7);

  -[EKEventDetailURLCell _URLView](self, "_URLView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAttributedText:", v8);

}

- (void)layoutSubviews
{
  double v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EKEventDetailURLCell;
  -[EKUITableViewCell layoutSubviews](&v4, sel_layoutSubviews);
  -[EKEventDetailURLCell bounds](self, "bounds");
  -[EKEventDetailURLCell _layoutForWidth:position:](self, "_layoutForWidth:position:", self->_lastLayoutPosition, v3);
}

- (void)_layoutForWidth:(double)a3 position:(int)a4
{
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  int IsLeftToRight;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  uint64_t v52;
  id v53;

  -[EKEventDetailURLCell _URLTitleView](self, "_URLTitleView");
  v53 = (id)objc_claimAutoreleasedReturnValue();
  -[EKEventDetailURLCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v53);

  -[EKEventDetailURLCell _URLView](self, "_URLView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventDetailURLCell contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v8);

  -[EKEventDetailCell detailsLeftInset](self, "detailsLeftInset");
  v11 = v10;
  objc_msgSend(v53, "sizeToFit");
  v12 = v11;
  if ((CalInterfaceIsLeftToRight() & 1) == 0)
  {
    -[EKEventDetailURLCell safeAreaInsets](self, "safeAreaInsets");
    v14 = a3 - v13;
    -[EKEventDetailURLCell safeAreaInsets](self, "safeAreaInsets");
    v16 = v14 - v15;
    -[EKEventDetailCell detailsLeftInset](self, "detailsLeftInset");
    v18 = v16 - v17;
    objc_msgSend(v53, "frame");
    v12 = v18 - v19;
  }
  objc_msgSend(v53, "frame");
  objc_msgSend(v53, "setFrame:", v12, 11.0);
  objc_msgSend(v8, "contentInset");
  v21 = v20;
  if (a4 == 5)
  {
    v22 = 0.0 - v20;
    IsLeftToRight = CalInterfaceIsLeftToRight();
    objc_msgSend(v53, "frame");
    v25 = v24;
    objc_msgSend((id)objc_opt_class(), "detailsPostLabelSpace");
    v27 = v25 + v26;
    v28 = a3 - v27;
    v29 = v11 + v27;
    if (IsLeftToRight)
      v11 = v29;
    else
      a3 = v28;
  }
  else
  {
    v30 = *MEMORY[0x1E0DC4A88];
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "capHeight");
    v33 = v32;
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v30);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "_leading");
    v36 = v33 + v35;
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v30);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "descender");
    v39 = -(v38 - v36 * 1.5);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v30);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "_leading");
    CalRoundToScreenScale(v39 - v41);
    v22 = v21 + v42 + 11.0;

  }
  -[EKEventDetailURLCell safeAreaInsets](self, "safeAreaInsets");
  v44 = a3 - v43;
  -[EKEventDetailURLCell safeAreaInsets](self, "safeAreaInsets");
  v46 = v44 - v45 - v11;
  -[EKEventDetailCell detailsLeftInset](self, "detailsLeftInset");
  v48 = v46 - v47;
  objc_msgSend(v8, "contentInset");
  v50 = v48 - v49;
  objc_msgSend(v8, "sizeThatFits:", v50, 1000.0);
  objc_msgSend(v8, "setFrame:", v11, v22, v50, v51);
  if (a4 == 5)
  {
    if (CalInterfaceIsLeftToRight())
      v52 = 2;
    else
      v52 = 0;
  }
  else
  {
    v52 = 4;
  }
  objc_msgSend(v8, "setTextAlignment:", v52);

}

- (void)layoutForWidth:(double)a3 position:(int)a4
{
  uint64_t v4;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  CGFloat MaxY;
  double v15;
  objc_super v16;
  CGRect v17;

  v4 = *(_QWORD *)&a4;
  v16.receiver = self;
  v16.super_class = (Class)EKEventDetailURLCell;
  -[EKEventDetailCell layoutForWidth:position:](&v16, sel_layoutForWidth_position_);
  self->_lastLayoutPosition = v4;
  -[EKEventDetailURLCell _layoutForWidth:position:](self, "_layoutForWidth:position:", v4, a3);
  -[EKEventDetailURLCell frame](self, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[EKEventDetailURLCell _URLView](self, "_URLView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  MaxY = CGRectGetMaxY(v17);
  v15 = CalCeilToScreenScale(MaxY + -3.0);

  -[EKEventDetailURLCell setFrame:](self, "setFrame:", v8, v10, v12, v15);
}

- (id)_URLTitleView
{
  UILabel *URLTitleView;
  id v4;
  UILabel *v5;
  UILabel *v6;
  UILabel *v7;
  void *v8;
  void *v9;
  UILabel *v10;
  void *v11;

  URLTitleView = self->_URLTitleView;
  if (!URLTitleView)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3990]);
    v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_URLTitleView;
    self->_URLTitleView = v5;

    v7 = self->_URLTitleView;
    EventKitUIBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("URL"), &stru_1E601DFA8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v7, "setText:", v9);

    -[UILabel setBackgroundColor:](self->_URLTitleView, "setBackgroundColor:", 0);
    v10 = self->_URLTitleView;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setHighlightedTextColor:](v10, "setHighlightedTextColor:", v11);

    -[UILabel setOpaque:](self->_URLTitleView, "setOpaque:", 0);
    URLTitleView = self->_URLTitleView;
  }
  return URLTitleView;
}

- (id)_URLView
{
  UITextView *URLView;
  EKTextViewWithLabelTextMetrics *v4;
  UITextView *v5;
  UITextView *v6;
  UITextView *v7;
  void *v8;

  URLView = self->_URLView;
  if (!URLView)
  {
    v4 = [EKTextViewWithLabelTextMetrics alloc];
    v5 = -[EKTextViewWithLabelTextMetrics initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_URLView;
    self->_URLView = v5;

    v7 = self->_URLView;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setBackgroundColor:](v7, "setBackgroundColor:", v8);

    -[UITextView setTextAlignment:](self->_URLView, "setTextAlignment:", 2);
    -[UITextView setOpaque:](self->_URLView, "setOpaque:", 0);
    -[UITextView setAutoresizingMask:](self->_URLView, "setAutoresizingMask:", 2);
    -[UITextView setDelegate:](self->_URLView, "setDelegate:", self);
    URLView = self->_URLView;
  }
  return URLView;
}

- (id)textView:(id)a3 primaryActionForTextItem:(id)a4 defaultAction:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[5];

  v7 = a5;
  objc_msgSend(a4, "link");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = v7;
  if (v8)
  {
    objc_msgSend(v8, "absoluteString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("calshow://launchSuggestedEvent"));

    if (v12)
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __72__EKEventDetailURLCell_textView_primaryActionForTextItem_defaultAction___block_invoke;
      v17[3] = &unk_1E601C330;
      v17[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3428], "actionWithHandler:", v17);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = v7;
      if (+[SwappableViewControllerImplementationFactory shouldUseOutOfProcessUI](SwappableViewControllerImplementationFactory, "shouldUseOutOfProcessUI"))
      {
        v13 = (void *)MEMORY[0x1E0DC3428];
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __72__EKEventDetailURLCell_textView_primaryActionForTextItem_defaultAction___block_invoke_28;
        v15[3] = &unk_1E601C330;
        v16 = v9;
        objc_msgSend(v13, "actionWithHandler:", v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
  }

  return v10;
}

void __72__EKEventDetailURLCell_textView_primaryActionForTextItem_defaultAction___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_SGSuggestionsServiceClass"), "serviceForEvents");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "launchAppForSuggestedEventUsingLaunchInfo:withCompletion:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1152), &__block_literal_global_53);

}

void __72__EKEventDetailURLCell_textView_primaryActionForTextItem_defaultAction___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      v4 = 138412290;
      v5 = v2;
      _os_log_impl(&dword_1AF84D000, v3, OS_LOG_TYPE_ERROR, "Failed to open suggested event: %@", (uint8_t *)&v4, 0xCu);
    }
  }

}

void __72__EKEventDetailURLCell_textView_primaryActionForTextItem_defaultAction___block_invoke_28(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openURL:configuration:completionHandler:", *(_QWORD *)(a1 + 32), 0, &__block_literal_global_32);

}

void __72__EKEventDetailURLCell_textView_primaryActionForTextItem_defaultAction___block_invoke_2_30(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  if (!v4)
  {
    v6 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1AF84D000, v6, OS_LOG_TYPE_ERROR, "Failed to open URL in OOP UI: %@", (uint8_t *)&v7, 0xCu);
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchInfo, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_URLView, 0);
  objc_storeStrong((id *)&self->_URLTitleView, 0);
}

@end
