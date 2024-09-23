@implementation CKConversationListNewMessageCell

+ (id)identifier
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)identifier___identifier;
  if (!identifier___identifier)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@Identifier"), objc_opt_class());
    v4 = (void *)identifier___identifier;
    identifier___identifier = v3;

    v2 = (void *)identifier___identifier;
  }
  return v2;
}

- (CKConversationListNewMessageCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CKConversationListNewMessageCell *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  UIButton *closeButton;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)CKConversationListNewMessageCell;
  v4 = -[CKConversationListNewMessageCell initWithStyle:reuseIdentifier:](&v24, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "theme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    CKFrameworkBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("NEW_MESSAGE"), &stru_1E276D870, CFSTR("ChatKit"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListNewMessageCell textLabel](v4, "textLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v8);

    -[CKConversationListNewMessageCell textLabel](v4, "textLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "conversationListSenderColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTextColor:", v11);

    -[CKConversationListNewMessageCell textLabel](v4, "textLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHighlightedTextColor:", 0);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = objc_msgSend(v13, "showsHoverToDeleteButtonForNewCompose");

    if ((_DWORD)v11)
    {
      objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:", CFSTR("SidebarCloseImage"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:", CFSTR("SidebarCloseAlternate"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
      v16 = objc_claimAutoreleasedReturnValue();
      closeButton = v4->_closeButton;
      v4->_closeButton = (UIButton *)v16;

      -[UIButton setImage:forState:](v4->_closeButton, "setImage:forState:", v14, 0);
      -[UIButton setImage:forState:](v4->_closeButton, "setImage:forState:", v15, 1);
      -[UIButton addTarget:action:forEvents:](v4->_closeButton, "addTarget:action:forEvents:", v4, sel_deleteButtonTapped, 64);
      -[UIButton imageView](v4->_closeButton, "imageView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "theme");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "conversationListSummaryColor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setTintColor:", v21);

      -[CKConversationListNewMessageCell contentView](v4, "contentView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addSubview:", v4->_closeButton);

      -[UIButton setHidden:](v4->_closeButton, "setHidden:", 1);
    }
    -[CKConversationListNewMessageCell updateFontSize](v4, "updateFontSize");

  }
  return v4;
}

- (void)updateWithForwardedConfigurationState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListNewMessageCell traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "useSelectedAppearanceForConversationCellState:traitCollection:", v4, v6);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "theme");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((v7 & 1) != 0)
    objc_msgSend(v9, "conversationListCellSelectedTextColor");
  else
    objc_msgSend(v9, "conversationListSenderColor");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  -[CKConversationListNewMessageCell textLabel](self, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textColor");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12 != v16)
  {
    -[CKConversationListNewMessageCell textLabel](self, "textLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTextColor:", v16);

  }
  objc_msgSend(MEMORY[0x1E0CEA370], "listPlainCellConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBackgroundColor:", v15);

  -[CKConversationListNewMessageCell setBackgroundConfiguration:](self, "setBackgroundConfiguration:", v14);
}

- (void)layoutSubviews
{
  uint64_t v4;
  int v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  _BOOL4 v53;
  void *v54;
  int v55;
  void *v56;
  double v57;
  double v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  void *v69;
  double v70;
  double v71;
  void *v72;
  double v73;
  double v74;
  double v75;
  double v76;
  void *v77;
  double v78;
  void *v79;
  double v80;
  double v81;
  void *v82;
  double v83;
  double v84;
  void *v85;
  double v86;
  double v87;
  void *v88;
  double v89;
  double v90;
  void *v91;
  void *v92;
  void *v93;
  objc_class *v94;
  void *v95;
  objc_super v96;

  v96.receiver = self;
  v96.super_class = (Class)CKConversationListNewMessageCell;
  -[CKConversationListNewMessageCell layoutSubviews](&v96, sel_layoutSubviews);
  v4 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
  if (CKIsRunningInMacCatalyst())
  {
    v5 = 1;
  }
  else
  {
    -[CKConversationListNewMessageCell bounds](self, "bounds");
    v7 = v6;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "conversationListMinimumWidthForHiddenContactImage");
    if (v7 <= v9)
    {
      v5 = 0;
    }
    else
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v10, "canShowContactPhotosInConversationList");

    }
  }
  -[CKConversationListNewMessageCell traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayScale");
  v13 = v12;

  -[CKConversationListNewMessageCell textLabel](self, "textLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "frame");
  v16 = v15;
  objc_msgSend(v14, "sizeToFit");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "conversationListCellLeftMargin");
  v19 = v18;

  if (v5)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "conversationListContactImageDiameter");
    v22 = v19 + v21;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "conversationListContactImageTrailingSpace");
    v19 = v22 + v24;

  }
  v25 = v19;
  if (v4)
  {
    -[CKConversationListNewMessageCell contentView](self, "contentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "bounds");
    v28 = v27;
    objc_msgSend(v14, "frame");
    v30 = v28 - v29 - v19;
    -[CKConversationListNewMessageCell safeAreaInsets](self, "safeAreaInsets");
    v25 = v30 - v31;

  }
  objc_msgSend(v14, "bounds");
  v33 = v32;
  v35 = v34;
  if (CKIsRunningInMacCatalyst())
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "conversationListCellRightMargin");
    v19 = v19 + v37;

  }
  -[CKConversationListNewMessageCell contentView](self, "contentView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "bounds");
  v40 = v39 - v19;

  if (v33 > v40)
  {
    -[CKConversationListNewMessageCell contentView](self, "contentView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "bounds");
    v43 = v42 - v19;

    v44 = v33 - v43;
    if (!v4)
      v44 = -0.0;
    v25 = v25 + v44;
    v33 = v43;
  }
  -[CKConversationListNewMessageCell contentView](self, "contentView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "bounds");
  v47 = v46;

  if (v35 > v47)
  {
    -[CKConversationListNewMessageCell contentView](self, "contentView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "bounds");
    v35 = v49;

  }
  objc_msgSend(v14, "setFrame:", v25, v16, v33, v35);
  -[CKConversationListNewMessageCell cellLayout](self, "cellLayout");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListNewMessageCell cellLayout](self, "cellLayout");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v51)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = (objc_class *)objc_opt_class();
    NSStringFromClass(v94);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CKConversationListNewMessageCell.m"), 141, CFSTR("%@ needs a cell layout."), v95);

  }
  if (CKIsRunningInMacCatalyst())
  {
    -[CKConversationListNewMessageCell contentView](self, "contentView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "bounds");
    v53 = -[CKConversationListNewMessageCell _boundsShouldCollapseContent:](self, "_boundsShouldCollapseContent:");

  }
  else
  {
    v53 = 0;
  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v54, "showsHoverToDeleteButtonForNewCompose");

  if (v55)
  {
    -[CKConversationListNewMessageCell contentView](self, "contentView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "frame");
    v58 = v57;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "conversationListCellCloseButtonWidth");
    v61 = v60 * 0.5;

    if (v4)
    {
      objc_msgSend(v50, "trailingLayoutMarginSize");
      v63 = v62;
      if (v53)
      {
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "conversationListContactImageTrailingSpace");
        v66 = (v63 + v65) * 0.5;

        v63 = v66 - v61;
      }
    }
    else if (v53)
    {
      objc_msgSend(v50, "trailingLayoutMarginSize");
      v68 = v67;
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "conversationListContactImageTrailingSpace");
      v71 = (v68 + v70) * -0.5;

      v63 = v58 + v71 - v61;
    }
    else
    {
      -[CKConversationListNewMessageCell contentView](self, "contentView");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "frame");
      v74 = v73;
      objc_msgSend(v50, "trailingLayoutMarginSize");
      v76 = v74 - v75;
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "conversationListCellCloseButtonWidth");
      v63 = v76 - v78;

    }
    -[CKConversationListNewMessageCell contentView](self, "contentView");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "frame");
    v81 = v80 * 0.5;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "conversationListCellCloseButtonHeight");
    v84 = v81 - v83 * 0.5;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "conversationListCellCloseButtonWidth");
    v87 = v86;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "conversationListCellCloseButtonHeight");
    v90 = v89;

    -[UIButton setFrame:](self->_closeButton, "setFrame:", round(v13 * v63) / v13, round(v13 * v84) / v13, round(v13 * v87) / v13, round(v13 * v90) / v13);
    -[CKConversationListNewMessageCell contentView](self, "contentView");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "bringSubviewToFront:", self->_closeButton);

  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "topConversationListSpace");
  objc_msgSend(v14, "_setFirstLineCapFrameOriginY:");

  -[CKConversationListNewMessageCell _updateLabelVisibility](self, "_updateLabelVisibility");
}

- (void)_updateLabelVisibility
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  __CFString *v23;
  void *v24;
  id v25;

  if (CKIsRunningInMacCatalyst())
  {
    v3 = -[CKConversationListNewMessageCell _isCollapsed](self, "_isCollapsed");
    -[CKConversationListNewMessageCell textLabel](self, "textLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", v3);

    -[CKConversationListNewMessageCell conversation](self, "conversation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      goto LABEL_12;
    -[CKConversationListNewMessageCell conversation](self, "conversation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hasDisplayName");

    -[CKConversationListNewMessageCell conversation](self, "conversation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7)
    {
      objc_msgSend(v8, "displayName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v8, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[CKConversationListNewMessageCell conversation](self, "conversation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "fetchSuggestedNameIfNecessary");
    }

    if (v10)
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      CKFrameworkBundle();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("NEW_MESSAGE_TO"), &stru_1E276D870, CFSTR("ChatKit"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", v13, v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "userInterfaceLayoutDirection");

      if (v16 == 1)
        v17 = CFSTR("\u200F");
      else
        v17 = CFSTR("\u200E");
      -[__CFString stringByAppendingString:](v17, "stringByAppendingString:", v14);
      v25 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
LABEL_12:
      v18 = (void *)MEMORY[0x1E0CB3940];
      CKFrameworkBundle();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("NEW_MESSAGE"), &stru_1E276D870, CFSTR("ChatKit"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", v20);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "userInterfaceLayoutDirection");

      if (v22 == 1)
        v23 = CFSTR("\u200F");
      else
        v23 = CFSTR("\u200E");
      -[__CFString stringByAppendingString:](v23, "stringByAppendingString:", v10);
      v25 = (id)objc_claimAutoreleasedReturnValue();
    }

    -[CKConversationListNewMessageCell textLabel](self, "textLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setText:", v25);

  }
}

- (BOOL)_isCollapsed
{
  CKConversationListNewMessageCell *v2;
  void *v3;

  v2 = self;
  -[CKConversationListNewMessageCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  LOBYTE(v2) = -[CKConversationListNewMessageCell _boundsShouldCollapseContent:](v2, "_boundsShouldCollapseContent:");

  return (char)v2;
}

- (BOOL)_boundsShouldCollapseContent:(CGRect)a3
{
  double width;
  void *v4;
  double v5;
  BOOL v6;

  width = a3.size.width;
  if (!CKIsRunningInMacCatalyst())
    return 0;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "snapToMinConversationListCellWidth");
  v6 = width < v5;

  return v6;
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKConversationListNewMessageCell;
  -[CKConversationListNewMessageCell setSelected:animated:](&v11, sel_setSelected_animated_, a3, a4);
  -[UIButton imageView](self->_closeButton, "imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "theme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v4)
    objc_msgSend(v8, "conversationListCellSelectedSummaryColor");
  else
    objc_msgSend(v8, "conversationListSummaryColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTintColor:", v10);

}

- (void)updateFontSize
{
  void *v3;
  void *v4;
  void *v5;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "conversationListSenderFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListNewMessageCell textLabel](self, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  -[CKConversationListNewMessageCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)deleteButtonTapped
{
  id v3;

  -[CKConversationListNewMessageCell delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedDeleteButtonForConversation:inCell:", 0, self);

}

- (double)leadingLayoutMargin
{
  double v2;
  void *v3;
  double v4;

  v2 = 16.0;
  if (!-[CKConversationListNewMessageCell showingEditControl](self, "showingEditControl"))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "conversationListCellLeftMargin");
    *(float *)&v4 = v4;
    v2 = *(float *)&v4;

  }
  return v2;
}

- (BOOL)showingEditControl
{
  return -[CKConversationListNewMessageCell currentStateMask](self, "currentStateMask") & 1;
}

- (void)updateContentsForConversation:(id)a3
{
  -[CKConversationListNewMessageCell setConversation:](self, "setConversation:", a3);
  -[CKConversationListNewMessageCell _updateLabelVisibility](self, "_updateLabelVisibility");
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
  objc_storeStrong((id *)&self->_conversation, a3);
}

- (CKConversationListCellLayout)cellLayout
{
  return self->_cellLayout;
}

- (void)setCellLayout:(id)a3
{
  objc_storeStrong((id *)&self->_cellLayout, a3);
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (CKConversationListCellDelegate)delegate
{
  return (CKConversationListCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CKAvatarView)avatarView
{
  return self->_avatarView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_cellLayout, 0);
  objc_storeStrong((id *)&self->_conversation, 0);
}

@end
