@implementation CNContactHeaderDisplayView

+ (id)descriptorForRequiredKeysForContactFormatter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DE8];
  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS___CNContactHeaderDisplayView;
  objc_msgSendSuper2(&v13, sel_descriptorForRequiredKeys);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "descriptorForRequiredKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

  }
  v9 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNContactHeaderDisplayView descriptorForRequiredKeysForContactFormatter:]");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "descriptorWithKeyDescriptors:description:", v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)makePhotoViewWithShouldAllowTakePhotoAction:(BOOL)a3 shouldAllowImageDrops:(BOOL)a4 monogramOnly:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CNContactPhotoView *v13;
  CNContactPhotoView *v14;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "inProcessContactStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v5)
    objc_msgSend(v10, "cachingMonogramRenderer");
  else
    objc_msgSend(v10, "cachingLikenessRenderer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = [CNContactPhotoView alloc];
  v14 = -[CNContactPhotoView initWithFrame:shouldAllowTakePhotoAction:threeDTouchEnabled:contactStore:allowsImageDrops:imageRenderer:](v13, "initWithFrame:shouldAllowTakePhotoAction:threeDTouchEnabled:contactStore:allowsImageDrops:imageRenderer:", v7, 1, v9, v6, v12, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

  return v14;
}

+ (id)contactHeaderViewWithContact:(id)a3 showingNavBar:(BOOL)a4 monogramOnly:(BOOL)a5 delegate:(id)a6
{
  return (id)objc_msgSend(a1, "contactHeaderViewWithContact:allowsPhotoDrops:showingNavBar:monogramOnly:delegate:", a3, 1, a4, a5, a6);
}

+ (id)contactHeaderViewWithContact:(id)a3 allowsPhotoDrops:(BOOL)a4 showingNavBar:(BOOL)a5 monogramOnly:(BOOL)a6 delegate:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v19;
  uint64_t v20;
  void *v21;

  v8 = a6;
  v9 = a5;
  v10 = a4;
  v12 = a3;
  v13 = a7;
  objc_msgSend((id)sDisplayContactHeaderView, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {

LABEL_4:
    v15 = objc_alloc((Class)a1);
    v16 = (id)objc_msgSend(v15, "initWithContact:frame:shouldAllowImageDrops:showingNavBar:monogramOnly:delegate:", v12, v10, v9, v8, v13, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    goto LABEL_5;
  }
  if (objc_msgSend((id)sDisplayContactHeaderView, "showMonogramsOnly") != v8)
    goto LABEL_4;
  if (sDisplayContactHeaderView)
  {
    v17 = (id)sDisplayContactHeaderView;
    objc_msgSend(v17, "setDelegate:", v13);
    objc_msgSend(v17, "prepareForReuse");
    objc_msgSend(v17, "updateForShowingNavBar:", v9);
    objc_msgSend(v17, "updateWithNewContact:", v12);
    goto LABEL_6;
  }
  v19 = objc_alloc((Class)a1);
  v20 = objc_msgSend(v19, "initWithContact:frame:shouldAllowImageDrops:showingNavBar:monogramOnly:delegate:", v12, v10, v9, v8, v13, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v21 = (void *)sDisplayContactHeaderView;
  sDisplayContactHeaderView = v20;

  v16 = (id)sDisplayContactHeaderView;
LABEL_5:
  v17 = v16;
LABEL_6:

  return v17;
}

+ (id)sizeAttributesShowingNavBar:(BOOL)a3
{
  if (a3)
    +[CNContactHeaderViewSizeAttributes displayAttributesWithNavBar](CNContactHeaderViewSizeAttributes, "displayAttributesWithNavBar");
  else
    +[CNContactHeaderViewSizeAttributes displayAttributes](CNContactHeaderViewSizeAttributes, "displayAttributes");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)descriptorForRequiredKeys
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[CNContactHeaderDisplayView contactFormatter](self, "contactFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptorForRequiredKeysForContactFormatter:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CNContactHeaderDisplayView)initWithContact:(id)a3 frame:(CGRect)a4 showingNavBar:(BOOL)a5 monogramOnly:(BOOL)a6 delegate:(id)a7
{
  return -[CNContactHeaderDisplayView initWithContact:frame:shouldAllowImageDrops:showingNavBar:monogramOnly:delegate:](self, "initWithContact:frame:shouldAllowImageDrops:showingNavBar:monogramOnly:delegate:", a3, 1, a5, a6, a7, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (CNContactHeaderDisplayView)initWithContact:(id)a3 frame:(CGRect)a4 shouldAllowImageDrops:(BOOL)a5 showingNavBar:(BOOL)a6 monogramOnly:(BOOL)a7 delegate:(id)a8
{
  CNContactHeaderDisplayView *v8;
  void *v9;
  void *v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  UILabel *taglineLabel;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  UITraitChangeRegistration *traitChangeRegistration;
  CNContactGeminiIconProvider *v37;
  CNContactGeminiIconProvider *geminiIconProvider;
  CNMetricsUIReporter *v39;
  CNMetricsUIReporter *metricsReporter;
  objc_super v42;
  uint64_t v43;
  _QWORD v44[2];
  _QWORD v45[3];

  v45[2] = *MEMORY[0x1E0C80C00];
  v42.receiver = self;
  v42.super_class = (Class)CNContactHeaderDisplayView;
  v8 = -[CNContactHeaderView initWithContact:frame:shouldAllowTakePhotoAction:shouldAllowImageDrops:showingNavBar:monogramOnly:delegate:](&v42, sel_initWithContact_frame_shouldAllowTakePhotoAction_shouldAllowImageDrops_showingNavBar_monogramOnly_delegate_, a3, 0, a5, a6, a7, a8, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  if (v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v8, sel_handleNameLabelTap_);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", v8, sel_handleNameLabelLongPress_);
    v11 = objc_alloc(MEMORY[0x1E0DC3990]);
    v12 = *MEMORY[0x1E0C9D648];
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v15 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v16 = (void *)objc_msgSend(v11, "initWithFrame:", *MEMORY[0x1E0C9D648], v13, v14, v15);
    -[CNContactHeaderView setNameLabel:](v8, "setNameLabel:", v16);

    -[CNContactHeaderView nameLabel](v8, "nameLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[CNContactHeaderView nameLabel](v8, "nameLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTextAlignment:", 1);

    -[CNContactHeaderView nameLabel](v8, "nameLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setNumberOfLines:", 2);

    -[CNContactHeaderView nameLabel](v8, "nameLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setUserInteractionEnabled:", 1);

    -[CNContactHeaderDisplayView tintColor](v8, "tintColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderView nameLabel](v8, "nameLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setHighlightedTextColor:", v21);

    -[CNContactHeaderView nameLabel](v8, "nameLabel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addGestureRecognizer:", v9);

    -[CNContactHeaderView nameLabel](v8, "nameLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addGestureRecognizer:", v10);

    -[CNContactHeaderView nameLabel](v8, "nameLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "_cnui_applyContactStyle");

    -[CNContactHeaderView nameLabel](v8, "nameLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderDisplayView addSubview:](v8, "addSubview:", v26);

    v27 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v12, v13, v14, v15);
    taglineLabel = v8->_taglineLabel;
    v8->_taglineLabel = (UILabel *)v27;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v8->_taglineLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setTextAlignment:](v8->_taglineLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](v8->_taglineLabel, "setNumberOfLines:", 0);
    -[UILabel _cnui_applyContactStyle](v8->_taglineLabel, "_cnui_applyContactStyle");
    -[CNContactHeaderDisplayView addSubview:](v8, "addSubview:", v8->_taglineLabel);
    v45[0] = *MEMORY[0x1E0DC4B10];
    v29 = *MEMORY[0x1E0DC1140];
    v44[0] = CFSTR("ABTextStyleAttributeName");
    v44[1] = v29;
    -[CNContactHeaderView contactStyle](v8, "contactStyle");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "taglineTextColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v45[1] = v31;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderDisplayView setTaglineTextAttributes:](v8, "setTaglineTextAttributes:", v32);

    -[CNContactHeaderDisplayView updateFontSizes](v8, "updateFontSizes");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObserver:selector:name:object:", v8, sel_menuWillHide_, *MEMORY[0x1E0DC5048], 0);

    v8->_allowsPickerActions = 1;
    v43 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderDisplayView registerForTraitChanges:withTarget:action:](v8, "registerForTraitChanges:withTarget:action:", v34, v8, sel_traitEnvironment_didChangeTraitCollection_);
    v35 = objc_claimAutoreleasedReturnValue();
    traitChangeRegistration = v8->_traitChangeRegistration;
    v8->_traitChangeRegistration = (UITraitChangeRegistration *)v35;

    v37 = objc_alloc_init(CNContactGeminiIconProvider);
    geminiIconProvider = v8->_geminiIconProvider;
    v8->_geminiIconProvider = v37;

    v39 = (CNMetricsUIReporter *)objc_alloc_init(MEMORY[0x1E0D13C28]);
    metricsReporter = v8->_metricsReporter;
    v8->_metricsReporter = v39;

  }
  return v8;
}

- (void)didFinishUsing
{
  if ((CNContactHeaderDisplayView *)sDisplayContactHeaderView == self)
  {
    sDisplayContactHeaderView = 0;

  }
}

- (double)minHeight
{
  double v3;
  double v4;
  double v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNContactHeaderDisplayView;
  -[CNContactHeaderView minHeight](&v7, sel_minHeight);
  v4 = v3;
  -[CNContactHeaderDisplayView minLabelsHeight](self, "minLabelsHeight");
  return v4 + v5;
}

- (double)maxHeight
{
  double v3;
  double v4;
  double v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNContactHeaderDisplayView;
  -[CNContactHeaderView maxHeight](&v7, sel_maxHeight);
  v4 = v3;
  -[CNContactHeaderDisplayView maxLabelsHeight](self, "maxLabelsHeight");
  return v4 + v5;
}

- (double)defaultMaxHeight
{
  double v3;
  double v4;
  double v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNContactHeaderDisplayView;
  -[CNContactHeaderView defaultMaxHeight](&v7, sel_defaultMaxHeight);
  v4 = v3;
  -[CNContactHeaderDisplayView maxLabelsHeight](self, "maxLabelsHeight");
  return v4 + v5;
}

- (void)createGeminiViewIfNeeded
{
  CNContactGeminiView *v3;
  CNContactGeminiView *v4;
  CNContactGeminiView *geminiView;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  if (!self->_geminiView)
  {
    v3 = [CNContactGeminiView alloc];
    v4 = -[CNContactGeminiView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    geminiView = self->_geminiView;
    self->_geminiView = v4;

    -[CNContactGeminiView setTranslatesAutoresizingMaskIntoConstraints:](self->_geminiView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CNContactGeminiView setUserInteractionEnabled:](self->_geminiView, "setUserInteractionEnabled:", 1);
    -[CNContactHeaderDisplayView tintColor](self, "tintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactGeminiView setHighlightedColor:](self->_geminiView, "setHighlightedColor:", v6);

    v12[0] = *MEMORY[0x1E0DC4B10];
    v7 = *MEMORY[0x1E0DC1140];
    v11[0] = CFSTR("ABTextStyleAttributeName");
    v11[1] = v7;
    -[CNContactHeaderView contactStyle](self, "contactStyle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "taglineTextColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderDisplayView setGeminiTextAttributes:](self, "setGeminiTextAttributes:", v10);

  }
}

- (void)setShouldShowGemini:(BOOL)a3
{
  void *v5;

  if (self->_shouldShowGemini != a3)
  {
    if (a3)
    {
      -[CNContactHeaderDisplayView createGeminiViewIfNeeded](self, "createGeminiViewIfNeeded");
      -[CNContactHeaderDisplayView geminiView](self, "geminiView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactHeaderDisplayView addSubview:](self, "addSubview:", v5);
    }
    else
    {
      -[CNContactHeaderDisplayView geminiView](self, "geminiView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeFromSuperview");
    }

    -[CNContactHeaderView setNeedsLabelSizeCalculation:](self, "setNeedsLabelSizeCalculation:", 1);
    self->_shouldShowGemini = a3;
    -[CNContactHeaderDisplayView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)setAvatarStyle:(unint64_t)a3
{
  void *v4;
  id v5;

  -[CNContactHeaderView photoView](self, "photoView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "avatarView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStyle:", a3);

}

- (unint64_t)avatarStyle
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[CNContactHeaderView photoView](self, "photoView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "avatarView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "style");

  return v4;
}

- (void)tintColorDidChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNContactHeaderDisplayView;
  -[CNContactHeaderDisplayView tintColorDidChange](&v7, sel_tintColorDidChange);
  -[CNContactHeaderDisplayView tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactHeaderView nameLabel](self, "nameLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHighlightedTextColor:", v3);

  -[CNContactHeaderDisplayView tintColor](self, "tintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactHeaderDisplayView geminiView](self, "geminiView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHighlightedColor:", v5);

}

- (void)updateFontSizes
{
  _BOOL4 v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)CNContactHeaderDisplayView;
  -[CNContactHeaderView updateFontSizes](&v16, sel_updateFontSizes);
  v3 = -[CNContactHeaderView isAXSize](self, "isAXSize");
  -[CNContactHeaderView nameLabel](self, "nameLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAdjustsFontSizeToFitWidth:", !v3);

  if (v3)
    v5 = 0.0;
  else
    v5 = 0.7;
  -[CNContactHeaderView nameLabel](self, "nameLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMinimumScaleFactor:", v5);

  v7 = (void *)sCurrentTaglineFont;
  objc_msgSend((id)sCurrentTaglineFont, "_scaledValueForValue:", 17.0);
  objc_msgSend(v7, "fontWithSize:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = *MEMORY[0x1E0DC1138];
  v9 = v23;
  v24[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject cn_updateDictionaryForKey:withChanges:](self, "cn_updateDictionaryForKey:withChanges:", CFSTR("taglineTextAttributes"), v10);

  v21 = v9;
  v22 = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject cn_updateDictionaryForKey:withChanges:](self, "cn_updateDictionaryForKey:withChanges:", CFSTR("importantTextAttributes"), v11);

  v19 = v9;
  v20 = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject cn_updateDictionaryForKey:withChanges:](self, "cn_updateDictionaryForKey:withChanges:", CFSTR("downtimeTextAttributes"), v12);

  v17 = v9;
  v18 = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject cn_updateDictionaryForKey:withChanges:](self, "cn_updateDictionaryForKey:withChanges:", CFSTR("geminiTextAttributes"), v13);

  -[CNContactHeaderDisplayView geminiIconProvider](self, "geminiIconProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "updateGeminiIcons");

  -[CNContactHeaderDisplayView geminiView](self, "geminiView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setNeedsCalculateLayout");

}

- (void)updateConstraints
{
  void *v3;
  void *v4;
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
  void *v16;
  uint64_t v17;
  id v18;
  void (**v19)(void *, void *);
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  int v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  id (*v42)(uint64_t, void *, void *);
  void *v43;
  CNContactHeaderDisplayView *v44;
  id v45;
  _QWORD aBlock[4];
  id v47;
  CNContactHeaderDisplayView *v48;
  objc_super v49;

  v49.receiver = self;
  v49.super_class = (Class)CNContactHeaderDisplayView;
  -[CNContactHeaderView updateConstraints](&v49, sel_updateConstraints);
  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[CNContactHeaderView activatedConstraints](self, "activatedConstraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactHeaderView photoView](self, "photoView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "centerXAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactHeaderDisplayView centerXAnchor](self, "centerXAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v9);

  -[CNContactHeaderView nameLabel](self, "nameLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "topAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactHeaderView photoView](self, "photoView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactHeaderView sizeAttributes](self, "sizeAttributes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "photoMinBottomMargin");
  objc_msgSend(v11, "constraintEqualToAnchor:constant:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactHeaderDisplayView setAvatarNameSpacingConstraint:](self, "setAvatarNameSpacingConstraint:", v15);

  -[CNContactHeaderDisplayView avatarNameSpacingConstraint](self, "avatarNameSpacingConstraint");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v16);

  v17 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__CNContactHeaderDisplayView_updateConstraints__block_invoke;
  aBlock[3] = &unk_1E2049068;
  v18 = v5;
  v47 = v18;
  v48 = self;
  v19 = (void (**)(void *, void *))_Block_copy(aBlock);
  -[CNContactHeaderView nameLabel](self, "nameLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2](v19, v20);

  -[CNContactHeaderDisplayView taglineLabel](self, "taglineLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2](v19, v21);

  -[CNContactHeaderDisplayView importantLabel](self, "importantLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    -[CNContactHeaderDisplayView importantLabel](self, "importantLabel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isHidden") ^ 1;

  }
  else
  {
    v24 = 0;
  }

  -[CNContactHeaderDisplayView downtimeView](self, "downtimeView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    -[CNContactHeaderDisplayView downtimeView](self, "downtimeView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "isHidden") ^ 1;

  }
  else
  {
    v27 = 0;
  }

  v28 = -[CNContactHeaderDisplayView shouldShowGemini](self, "shouldShowGemini");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v24)
  {
    if (!v27)
      goto LABEL_9;
LABEL_13:
    -[CNContactHeaderDisplayView downtimeView](self, "downtimeView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObject:", v39);

    if (!v28)
      goto LABEL_11;
    goto LABEL_10;
  }
  -[CNContactHeaderDisplayView importantLabel](self, "importantLabel");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addObject:", v38);

  if (v27)
    goto LABEL_13;
LABEL_9:
  if (v28)
  {
LABEL_10:
    -[CNContactHeaderDisplayView geminiView](self, "geminiView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObject:", v30);

  }
LABEL_11:
  -[CNContactHeaderView nameLabel](self, "nameLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "bottomAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = v17;
  v41 = 3221225472;
  v42 = __47__CNContactHeaderDisplayView_updateConstraints__block_invoke_2;
  v43 = &unk_1E2049090;
  v44 = self;
  v45 = v18;
  v33 = v18;
  objc_msgSend(v29, "_cn_reduce:initialValue:", &v40, v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactHeaderDisplayView taglineLabel](self, "taglineLabel", v40, v41, v42, v43, v44);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "topAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObject:", v37);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v33);
  -[CNContactHeaderView setActivatedConstraints:](self, "setActivatedConstraints:", v33);

}

- (void)setMessage:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_message != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_message, a3);
    -[CNContactHeaderView setNeedsReload](self, "setNeedsReload");
    v5 = v6;
  }

}

- (void)setImportantMessage:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_importantMessage != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_importantMessage, a3);
    -[CNContactHeaderView setNeedsReload](self, "setNeedsReload");
    v5 = v6;
  }

}

- (void)setIsEmergencyContact:(BOOL)a3
{
  if (self->_isEmergencyContact != a3)
  {
    self->_isEmergencyContact = a3;
    -[CNContactHeaderView setNeedsReload](self, "setNeedsReload");
  }
}

- (void)setIsRestrictedContact:(BOOL)a3
{
  if (self->_isRestrictedContact != a3)
  {
    self->_isRestrictedContact = a3;
    -[CNContactHeaderView setNeedsReload](self, "setNeedsReload");
  }
}

- (void)setIsDowntimeContact:(BOOL)a3
{
  if (self->_isDowntimeContact != a3)
  {
    self->_isDowntimeContact = a3;
    -[CNContactHeaderView setNeedsReload](self, "setNeedsReload");
  }
}

- (void)disablePhotoTapGesture
{
  id v2;

  -[CNContactHeaderView photoView](self, "photoView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "disablePhotoTapGesture");

}

- (void)calculateLabelSizesIfNeeded
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNContactHeaderDisplayView;
  -[CNContactHeaderView calculateLabelSizesIfNeeded](&v3, sel_calculateLabelSizesIfNeeded);
  -[CNContactHeaderDisplayView calculateLabelSizes](self, "calculateLabelSizes");
}

- (void)calculateLabelSizes
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  int v22;
  uint64_t v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  BOOL v34;
  double v35;
  double v36;
  double v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  uint64_t v50;
  _QWORD v51[2];

  v51[1] = *MEMORY[0x1E0C80C00];
  if (-[CNContactHeaderView needsLabelSizeCalculation](self, "needsLabelSizeCalculation"))
  {
    -[CNContactHeaderDisplayView frame](self, "frame");
    v4 = v3;
    if (v3 == 0.0)
    {
      -[CNContactHeaderDisplayView superview](self, "superview");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        -[CNContactHeaderDisplayView superview](self, "superview");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "frame");
        v4 = v7;

      }
    }
    if (v4 != 0.0)
    {
      -[CNContactHeaderView setNeedsLabelSizeCalculation:](self, "setNeedsLabelSizeCalculation:", 0);
      -[CNContactHeaderDisplayView layoutMargins](self, "layoutMargins");
      v9 = v8;
      -[CNContactHeaderDisplayView layoutMargins](self, "layoutMargins");
      v11 = v4 - (v9 + v10);
      -[CNContactHeaderDisplayView updateFontSizes](self, "updateFontSizes");
      -[CNContactHeaderView nameLabel](self, "nameLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sizeThatFits:", v11, 1000.0);
      v14 = v13;

      -[CNContactHeaderDisplayView taglineLabel](self, "taglineLabel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sizeThatFits:", v11, 1000.0);
      v17 = v16;

      -[CNContactHeaderDisplayView importantLabel](self, "importantLabel");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "sizeThatFits:", v11, 1000.0);
      v20 = v19;

      -[CNContactHeaderDisplayView downtimeView](self, "downtimeView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isHidden");
      v23 = MEMORY[0x1E0C9D820];
      if (v22)
      {
        v24 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      }
      else
      {
        -[CNContactHeaderDisplayView downtimeView](self, "downtimeView");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "sizeThatFits:", v11, 1000.0);
        v24 = v26;

      }
      -[CNContactHeaderDisplayView geminiView](self, "geminiView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "calculateLayoutIfNeeded");

      if (-[CNContactHeaderDisplayView shouldShowGemini](self, "shouldShowGemini"))
      {
        -[CNContactHeaderDisplayView geminiView](self, "geminiView");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "sizeThatFits:", v11, 1000.0);
        v30 = v29;

      }
      else
      {
        v30 = *(double *)(v23 + 8);
      }
      v31 = v14 + v17 + v20 + v24 + v30;
      -[CNContactHeaderDisplayView _screen](self, "_screen");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "scale");
      if (v33 == 0.0)
      {
        if (RoundToScale_onceToken != -1)
          dispatch_once(&RoundToScale_onceToken, &__block_literal_global_22_54747);
        v33 = *(double *)&RoundToScale___s;
      }
      v34 = v33 == 1.0;
      v35 = round(v33 * v31) / v33;
      v36 = round(v31);
      if (v34)
        v37 = v36;
      else
        v37 = v35;

      -[CNContactHeaderDisplayView setMaxLabelsHeight:](self, "setMaxLabelsHeight:", v37);
      v38 = objc_alloc_init(MEMORY[0x1E0DC12A0]);
      objc_msgSend(v38, "setMaximumNumberOfLines:", 2);
      -[CNContactHeaderView nameLabel](self, "nameLabel");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "text");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = *MEMORY[0x1E0DC1138];
      v41 = (void *)sCurrentNameFont;
      objc_msgSend((id)sCurrentNameFont, "_scaledValueForValue:", 16.0);
      objc_msgSend(v41, "fontWithSize:");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v51[0] = v42;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, &v50, 1);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "boundingRectWithSize:options:attributes:context:", 33, v43, v38, v11, 1.79769313e308);
      v45 = v44;

      -[CNContactHeaderDisplayView _screen](self, "_screen");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "scale");
      if (v47 == 0.0)
      {
        if (RoundToScale_onceToken != -1)
          dispatch_once(&RoundToScale_onceToken, &__block_literal_global_22_54747);
        v47 = *(double *)&RoundToScale___s;
      }
      v48 = ceil(v45);
      if (v47 != 1.0)
        v48 = round(v47 * v48) / v47;

      -[CNContactHeaderDisplayView setMinLabelsHeight:](self, "setMinLabelsHeight:", v48);
      -[CNContactHeaderView delegate](self, "delegate");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "headerViewDidUpdateLabelSizes");

    }
  }
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNContactHeaderDisplayView;
  -[CNContactHeaderView layoutSubviews](&v3, sel_layoutSubviews);
  -[CNContactHeaderDisplayView calculateLabelSizes](self, "calculateLabelSizes");
}

- (void)updateSizeDependentAttributes
{
  void *v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v31.receiver = self;
  v31.super_class = (Class)CNContactHeaderDisplayView;
  -[CNContactHeaderView updateSizeDependentAttributes](&v31, sel_updateSizeDependentAttributes);
  objc_msgSend(MEMORY[0x1E0DC39D8], "sharedMenuController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isMenuVisible"))
    objc_msgSend(v3, "hideMenu");
  -[CNContactHeaderDisplayView bounds](self, "bounds");
  if (v4 > 0.0)
  {
    -[CNContactHeaderView currentHeightPercentMaximized](self, "currentHeightPercentMaximized");
    v6 = v5;
    -[CNContactHeaderView sizeAttributes](self, "sizeAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "photoBottomMarginWithPercentMax:", v6);
    v9 = v8;
    -[CNContactHeaderDisplayView avatarNameSpacingConstraint](self, "avatarNameSpacingConstraint");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setConstant:", v9);

    -[CNContactHeaderDisplayView importantLabel](self, "importantLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAlpha:", v6 * v6);

    -[CNContactHeaderDisplayView downtimeView](self, "downtimeView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAlpha:", v6 * v6);

    -[CNContactHeaderDisplayView geminiView](self, "geminiView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAlpha:", v6 * v6);

    -[CNContactHeaderDisplayView taglineLabel](self, "taglineLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAlpha:", v6 * v6);

    objc_msgSend((id)sCurrentNameFont, "_scaledValueForValue:", 30.0);
    v16 = v15;
    objc_msgSend((id)sCurrentNameFont, "_scaledValueForValue:", 16.0);
    v18 = v16 - v17;
    objc_msgSend((id)sCurrentNameFont, "_scaledValueForValue:", 16.0);
    v20 = v19 + v6 * v18;
    objc_msgSend((id)sCurrentTaglineFont, "_scaledValueForValue:", 17.0);
    v22 = v6 * v21;
    objc_msgSend((id)sCurrentNameFont, "fontWithSize:", v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)sCurrentTaglineFont, "fontWithSize:", v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = *MEMORY[0x1E0DC1138];
    v25 = v40;
    v41[0] = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject cn_updateDictionaryForKey:withChanges:](self, "cn_updateDictionaryForKey:withChanges:", CFSTR("nameTextAttributes"), v26);

    v38 = v25;
    v39 = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject cn_updateDictionaryForKey:withChanges:](self, "cn_updateDictionaryForKey:withChanges:", CFSTR("importantTextAttributes"), v27);

    v36 = v25;
    v37 = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject cn_updateDictionaryForKey:withChanges:](self, "cn_updateDictionaryForKey:withChanges:", CFSTR("downtimeTextAttributes"), v28);

    v34 = v25;
    v35 = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject cn_updateDictionaryForKey:withChanges:](self, "cn_updateDictionaryForKey:withChanges:", CFSTR("geminiTextAttributes"), v29);

    v32 = v25;
    v33 = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject cn_updateDictionaryForKey:withChanges:](self, "cn_updateDictionaryForKey:withChanges:", CFSTR("taglineTextAttributes"), v30);

  }
}

- (void)setNameTextAttributes:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNContactHeaderDisplayView;
  v4 = a3;
  -[CNContactHeaderView setNameTextAttributes:](&v6, sel_setNameTextAttributes_, v4);
  -[CNContactHeaderView nameLabel](self, "nameLabel", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAb_textAttributes:", v4);

}

- (void)setTaglineTextAttributes:(id)a3
{
  void *v5;
  NSDictionary *v6;

  v6 = (NSDictionary *)a3;
  if (self->_taglineTextAttributes != v6)
  {
    objc_storeStrong((id *)&self->_taglineTextAttributes, a3);
    -[CNContactHeaderDisplayView taglineLabel](self, "taglineLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAb_textAttributes:", v6);

  }
}

- (NSDictionary)taglineTextAttributes
{
  return self->_taglineTextAttributes;
}

- (void)setImportantTextAttributes:(id)a3
{
  void *v5;
  NSDictionary *v6;

  v6 = (NSDictionary *)a3;
  if (self->_importantTextAttributes != v6)
  {
    objc_storeStrong((id *)&self->_importantTextAttributes, a3);
    -[CNContactHeaderDisplayView importantLabel](self, "importantLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAb_textAttributes:", v6);

  }
}

- (void)setDowntimeTextAttributes:(id)a3
{
  void *v5;
  NSDictionary *v6;

  v6 = (NSDictionary *)a3;
  if (self->_downtimeTextAttributes != v6)
  {
    objc_storeStrong((id *)&self->_downtimeTextAttributes, a3);
    -[CNContactHeaderDisplayView downtimeView](self, "downtimeView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAb_textAttributes:", v6);

  }
}

- (id)downtimeTextAttributes
{
  return self->_downtimeTextAttributes;
}

- (void)setGeminiTextAttributes:(id)a3
{
  void *v5;
  NSDictionary *v6;

  v6 = (NSDictionary *)a3;
  if (self->_geminiTextAttributes != v6)
  {
    objc_storeStrong((id *)&self->_geminiTextAttributes, a3);
    -[CNContactHeaderDisplayView geminiView](self, "geminiView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAb_textAttributes:", v6);

  }
}

- (id)geminiTextAttributes
{
  return self->_geminiTextAttributes;
}

- (void)_updatePhotoView
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  -[CNContactHeaderView photoView](self, "photoView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v8, "isHidden");
  -[CNContactHeaderView contacts](self, "contacts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v4, "count") > 1)
  {
    objc_msgSend(v8, "setHidden:", 0);
  }
  else
  {
    -[CNContactHeaderView contacts](self, "contacts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "imageDataAvailable") & 1) != 0)
      v7 = 0;
    else
      v7 = -[CNContactHeaderView alwaysShowsMonogram](self, "alwaysShowsMonogram") ^ 1;
    objc_msgSend(v8, "setHidden:", v7);

  }
  if (v3 != objc_msgSend(v8, "isHidden"))
    -[CNContactHeaderDisplayView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");

}

- (void)_updateImportantLabel
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  -[CNContactHeaderDisplayView importantLabel](self, "importantLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CNContactHeaderDisplayView importantLabel](self, "importantLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isHidden");

  }
  else
  {
    v5 = 1;
  }

  -[CNContactHeaderDisplayView _importantString](self, "_importantString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[CNContactHeaderDisplayView importantLabel](self, "importantLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v8 = *MEMORY[0x1E0DC4B10];
      v9 = *MEMORY[0x1E0DC1140];
      v22[0] = CFSTR("ABTextStyleAttributeName");
      v22[1] = v9;
      v23[0] = v8;
      +[CNUIColorRepository contactListEmergencyContactGlyphColor](CNUIColorRepository, "contactListEmergencyContactGlyphColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v23[1] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactHeaderDisplayView setImportantTextAttributes:](self, "setImportantTextAttributes:", v11);

      v12 = objc_alloc(MEMORY[0x1E0DC3990]);
      v13 = (void *)objc_msgSend(v12, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      -[CNContactHeaderDisplayView setImportantLabel:](self, "setImportantLabel:", v13);

      -[CNContactHeaderDisplayView importantLabel](self, "importantLabel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[CNContactHeaderDisplayView importantLabel](self, "importantLabel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setTextAlignment:", 1);

      -[CNContactHeaderDisplayView importantLabel](self, "importantLabel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setNumberOfLines:", 0);

      -[CNContactHeaderDisplayView importantLabel](self, "importantLabel");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "_setUseShortcutIntrinsicContentSize:", 1);

      -[CNContactHeaderDisplayView importantLabel](self, "importantLabel");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "_cnui_applyContactStyle");

      -[CNContactHeaderDisplayView importantLabel](self, "importantLabel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactHeaderDisplayView addSubview:](self, "addSubview:", v19);

    }
  }
  -[CNContactHeaderDisplayView importantLabel](self, "importantLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setHidden:", v6 == 0);

  -[CNContactHeaderDisplayView importantLabel](self, "importantLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v20) = objc_msgSend(v21, "isHidden");

  if (v5 != (_DWORD)v20)
    -[CNContactHeaderDisplayView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");

}

- (void)_updateDowntimeView
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  _BOOL4 v7;
  uint64_t v8;
  CNContactDowntimeView *v9;
  CNContactDowntimeView *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  -[CNContactHeaderDisplayView downtimeView](self, "downtimeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CNContactHeaderDisplayView downtimeView](self, "downtimeView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isHidden");

  }
  else
  {
    v5 = 1;
  }

  if (-[CNContactHeaderDisplayView isDowntimeContact](self, "isDowntimeContact")
    || -[CNContactHeaderDisplayView isRestrictedContact](self, "isRestrictedContact"))
  {
    -[CNContactHeaderDisplayView downtimeView](self, "downtimeView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 == 0;

  }
  else
  {
    v7 = 0;
  }
  if (!-[CNContactHeaderDisplayView isDowntimeContact](self, "isDowntimeContact"))
  {
    v8 = -[CNContactHeaderDisplayView isRestrictedContact](self, "isRestrictedContact") ^ 1;
    if (!v7)
      goto LABEL_13;
    goto LABEL_12;
  }
  v8 = 0;
  if (v7)
  {
LABEL_12:
    v9 = [CNContactDowntimeView alloc];
    v10 = -[CNContactDowntimeView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[CNContactHeaderDisplayView setDowntimeView:](self, "setDowntimeView:", v10);

    -[CNContactHeaderDisplayView downtimeView](self, "downtimeView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v22[0] = *MEMORY[0x1E0DC4B10];
    v12 = *MEMORY[0x1E0DC1140];
    v21[0] = CFSTR("ABTextStyleAttributeName");
    v21[1] = v12;
    -[CNContactHeaderView contactStyle](self, "contactStyle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "taglineTextColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderDisplayView setDowntimeTextAttributes:](self, "setDowntimeTextAttributes:", v15);

    -[CNContactHeaderDisplayView downtimeView](self, "downtimeView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderDisplayView addSubview:](self, "addSubview:", v16);

  }
LABEL_13:
  if (-[CNContactHeaderDisplayView isDowntimeContact](self, "isDowntimeContact"))
    v17 = 2;
  else
    v17 = 0;
  v18 = v17 | -[CNContactHeaderDisplayView isRestrictedContact](self, "isRestrictedContact");
  -[CNContactHeaderDisplayView downtimeView](self, "downtimeView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setElements:", v18);

  -[CNContactHeaderDisplayView downtimeView](self, "downtimeView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setHidden:", v8);

  if (v5)
    -[CNContactHeaderDisplayView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)updateGeminiResult:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  _BOOL8 v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "featureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "isFeatureEnabled:", 7);

  v7 = -[CNContactHeaderDisplayView allowsPickerActions](self, "allowsPickerActions");
  v8 = v7;
  if ((_DWORD)v6)
  {
    -[CNContactHeaderDisplayView geminiView](self, "geminiView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsPickerActions:", v8);
LABEL_8:

    goto LABEL_9;
  }
  if (v7)
  {
    -[CNContactHeaderView contacts](self, "contacts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "hasBeenPersisted");
  }
  else
  {
    v9 = 0;
  }
  -[CNContactHeaderDisplayView geminiView](self, "geminiView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAllowsPickerActions:", v9);

  if (v8)
  {

    goto LABEL_8;
  }
LABEL_9:
  -[CNContactHeaderDisplayView setGeminiResult:](self, "setGeminiResult:", v17);
  -[CNContactHeaderDisplayView geminiView](self, "geminiView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setGeminiResult:", v17);

  -[CNContactHeaderView setNeedsLabelSizeCalculation:](self, "setNeedsLabelSizeCalculation:", 1);
  -[CNContactHeaderView contacts](self, "contacts");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hasBeenPersisted");

  if (v14)
  {
    -[CNContactHeaderDisplayView geminiPicker](self, "geminiPicker");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setGeminiResult:", v17);

  }
  else
  {
    -[CNContactHeaderDisplayView geminiIconProvider](self, "geminiIconProvider");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setGeminiResult:", v17);

    -[CNContactHeaderDisplayView _geminiViewBehaviorForUnknownContact](self, "_geminiViewBehaviorForUnknownContact");
  }

}

- (void)setUsesBrandedCallFormat:(BOOL)a3
{
  if (self->_usesBrandedCallFormat != a3)
  {
    self->_usesBrandedCallFormat = a3;
    -[CNContactHeaderView setNeedsReload](self, "setNeedsReload");
  }
}

- (void)reloadDataPreservingChanges:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)CNContactHeaderDisplayView;
  -[CNContactHeaderView reloadDataPreservingChanges:](&v25, sel_reloadDataPreservingChanges_, a3);
  -[CNContactHeaderDisplayView _assignActionToGeminiView](self, "_assignActionToGeminiView");
  -[CNContactHeaderView contacts](self, "contacts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactHeaderDisplayView _headerStringForContacts:](self, "_headerStringForContacts:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactHeaderView contacts](self, "contacts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactHeaderDisplayView _taglinesForContacts:](self, "_taglinesForContacts:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "componentsJoinedByString:", CFSTR("\n"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactHeaderDisplayView _importantString](self, "_importantString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactHeaderDisplayView _updateImportantLabel](self, "_updateImportantLabel");
  -[CNContactHeaderDisplayView _updateDowntimeView](self, "_updateDowntimeView");
  -[CNContactHeaderDisplayView message](self, "message");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", v10))
  {
    v11 = objc_msgSend(v5, "length");

    if (v11)
      goto LABEL_5;
    v10 = v5;
    v5 = v8;
    v8 = 0;
  }

LABEL_5:
  if (!objc_msgSend(v8, "length"))
  {

    v8 = 0;
  }
  -[CNContactHeaderView nameLabel](self, "nameLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "text");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v5)
  {
    if (!v13)
      goto LABEL_17;
  }
  else if (v13)
  {
    goto LABEL_16;
  }
  -[CNContactHeaderDisplayView taglineLabel](self, "taglineLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "text");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (!v8)
  {
    if (!v16)
    {
LABEL_18:
      v24 = v7;
      -[CNContactHeaderDisplayView importantLabel](self, "importantLabel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "text");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        if (v20)
        {

          v18 = 0;
        }
        else
        {

          v18 = 1;
        }
      }
      else
      {
        v18 = v20 != 0;

      }
      v7 = v24;
      if (!v8)
        goto LABEL_25;
      goto LABEL_24;
    }

    if (!v5)
    {
LABEL_17:

LABEL_28:
      -[CNContactHeaderDisplayView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
      goto LABEL_29;
    }
LABEL_16:

    goto LABEL_17;
  }
  if (v16)
    goto LABEL_18;
  v18 = 1;
LABEL_24:

LABEL_25:
  if (v5)

  if (v18)
    goto LABEL_28;
LABEL_29:
  -[CNContactHeaderView nameLabel](self, "nameLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setAb_text:", v5);

  -[CNContactHeaderDisplayView taglineLabel](self, "taglineLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAb_text:", v8);

  -[CNContactHeaderDisplayView importantLabel](self, "importantLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setAb_text:", v9);

  -[CNContactHeaderDisplayView _updatePhotoView](self, "_updatePhotoView");
  -[CNContactHeaderView setNeedsLabelSizeCalculation:](self, "setNeedsLabelSizeCalculation:", 1);
  -[CNContactHeaderDisplayView calculateLabelSizes](self, "calculateLabelSizes");
  -[CNContactHeaderDisplayView setNeedsLayout](self, "setNeedsLayout");

}

- (void)copy:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[CNContactHeaderView nameLabel](self, "nameLabel", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setString:", v6);

}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  return sel_copy_ == a3;
}

- (id)_headerStringForContacts:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;

  v4 = a3;
  if (objc_msgSend(v4, "count") == 1)
  {
    if (-[CNContactHeaderDisplayView usesBrandedCallFormat](self, "usesBrandedCallFormat"))
    {
      v5 = *MEMORY[0x1E0D137F8];
      objc_msgSend(v4, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "phoneNumbers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v5) = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v7);

      if ((v5 & 1) == 0)
      {
        objc_msgSend(v4, "firstObject");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "phoneNumbers");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "firstObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "value");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "formattedStringValue");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13850] + 16))())
        {
          v13 = v12;

          goto LABEL_12;
        }

      }
    }
    -[CNContactHeaderDisplayView contactFormatter](self, "contactFormatter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringFromContact:", v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }
  if (!objc_msgSend(v14, "length"))
  {
    -[CNContactHeaderDisplayView alternateName](self, "alternateName");
    v17 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v17;
  }
  v13 = v14;
LABEL_12:

  return v13;
}

- (id)_taglinesForContacts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  if (objc_msgSend(v4, "count") != 1)
  {
    v7 = objc_msgSend(v4, "count");

    +[CNNumberFormatting localizedStringWithInteger:](CNNumberFormatting, "localizedStringWithInteger:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB3940];
    CNContactsUIBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("CARD_NAME_GROUP_MEMBERS_COUNT-%@"), &stru_1E20507A8, CFSTR("Localized"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", v11, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v12);

    v13 = *MEMORY[0x1E0D13850];
    goto LABEL_39;
  }
  objc_msgSend(v4, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "contactType") == 1)
  {
    if (-[CNContactHeaderDisplayView usesBrandedCallFormat](self, "usesBrandedCallFormat"))
      objc_msgSend(v6, "organizationName");
    else
      objc_msgSend(v6, "personName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x1E0D13850];
    if (!(*(unsigned int (**)(_QWORD, void *))(*MEMORY[0x1E0D13850] + 16))(*MEMORY[0x1E0D13850], v17))
      goto LABEL_38;
    goto LABEL_11;
  }
  v13 = *MEMORY[0x1E0D13850];
  objc_msgSend(v6, "personName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (((*(uint64_t (**)(uint64_t, void *))(v13 + 16))(v13, v14) & 1) == 0)
  {

LABEL_13:
    objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v6, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(unsigned int (**)(uint64_t, void *))(v13 + 16))(v13, v17))
      objc_msgSend(v5, "addObject:", v17);
    objc_msgSend(v6, "nickname");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(unsigned int (**)(uint64_t, void *))(v13 + 16))(v13, v18))
    {
      -[CNContactHeaderView delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isNicknameProhibited");

      if ((v20 & 1) != 0)
        goto LABEL_19;
      v21 = (void *)MEMORY[0x1E0CB3940];
      CNContactsUIBundle();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("CARD_NAME_NICKNAME_FORMAT-%@"), &stru_1E20507A8, CFSTR("Localized"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "nickname");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringWithFormat:", v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v24);

    }
LABEL_19:
    objc_msgSend(v6, "previousFamilyName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (*(uint64_t (**)(uint64_t, void *))(v13 + 16))(v13, v25);

    if (v26)
    {
      objc_msgSend(v6, "previousFamilyName");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v27);

    }
    objc_msgSend(v6, "jobTitle");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (*(uint64_t (**)(uint64_t, void *))(v13 + 16))(v13, v28);

    objc_msgSend(v6, "departmentName");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (*(uint64_t (**)(uint64_t, void *))(v13 + 16))(v13, v30);

    if (v29)
    {
      if (v31)
      {
        v32 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v6, "jobTitle");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        CNContactsUIBundle();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("CARD_NAME_JOB_TITLE_DEPARMENT_SEPARATOR"), &stru_1E20507A8, CFSTR("Localized"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "departmentName");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "stringWithFormat:", CFSTR("%@%@%@"), v33, v35, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v37);

LABEL_28:
LABEL_29:
        objc_msgSend(v6, "organizationName");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = (*(uint64_t (**)(uint64_t, void *))(v13 + 16))(v13, v39);

        if (v40)
        {
          objc_msgSend(v6, "organizationName");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v41);

        }
        objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "featureFlags");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v43, "isFeatureEnabled:", 12)
          && (objc_msgSend(v6, "isKeyAvailable:", *MEMORY[0x1E0C96668]) & 1) != 0)
        {
          v44 = *MEMORY[0x1E0D137F8];
          objc_msgSend(v6, "termsOfAddress");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v44) = (*(uint64_t (**)(uint64_t, void *))(v44 + 16))(v44, v45);

          if ((v44 & 1) != 0)
            goto LABEL_38;
          v46 = (void *)MEMORY[0x1E0CB3960];
          objc_msgSend(v6, "termsOfAddress");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "localizedDescriptionForAddressingGrammars:", v47);
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          if ((*(unsigned int (**)(uint64_t, void *))(v13 + 16))(v13, v42))
            objc_msgSend(v5, "addObject:", v42);
        }
        else
        {

        }
        goto LABEL_38;
      }
      objc_msgSend(v6, "jobTitle");
      v38 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v31)
        goto LABEL_29;
      objc_msgSend(v6, "departmentName");
      v38 = objc_claimAutoreleasedReturnValue();
    }
    v33 = (void *)v38;
    objc_msgSend(v5, "addObject:", v38);
    goto LABEL_28;
  }
  -[CNContactHeaderDisplayView alternateName](self, "alternateName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (*(uint64_t (**)(uint64_t, void *))(v13 + 16))(v13, v15);

  if (!v16)
    goto LABEL_13;
  -[CNContactHeaderDisplayView alternateName](self, "alternateName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
  objc_msgSend(v5, "addObject:", v17);
LABEL_38:

LABEL_39:
  -[CNContactHeaderDisplayView message](self, "message");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (*(uint64_t (**)(uint64_t, void *))(v13 + 16))(v13, v48);

  if (v49)
  {
    -[CNContactHeaderDisplayView message](self, "message");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v50);

  }
  return v5;
}

- (id)_importantString
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  -[CNContactHeaderDisplayView importantMessage](self, "importantMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNContactHeaderDisplayView isEmergencyContact](self, "isEmergencyContact"))
  {
    CNContactsUIBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("CARD_NAME_EMERGENCY_CONTACT"), &stru_1E20507A8, CFSTR("Localized"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13850] + 16))())
    {
      objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("\n%@"), v5);
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = v5;
    }
    v7 = v6;

    v3 = v7;
  }
  return v3;
}

- (void)handleNameLabelTap:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v4 = a3;
  objc_opt_class();
  v10 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v10;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    if (objc_msgSend(v6, "state") == 3)
    {
      -[CNContactHeaderView delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_opt_respondsToSelector();

      if ((v8 & 1) != 0)
      {
        -[CNContactHeaderView delegate](self, "delegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "headerViewDidTapNameLabel:", self);

      }
    }
  }

}

- (void)handleNameLabelLongPress:(id)a3
{
  id v4;
  void *v5;
  id v6;
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
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  id v29;

  v4 = a3;
  objc_opt_class();
  v29 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v29;
  else
    v5 = 0;
  v6 = v5;

  if (v6
    && objc_msgSend(v6, "state") == 1
    && -[CNContactHeaderDisplayView becomeFirstResponder](self, "becomeFirstResponder"))
  {
    objc_msgSend(MEMORY[0x1E0DC39D8], "sharedMenuController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderView nameLabel](self, "nameLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderView nameLabel](self, "nameLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    -[CNContactHeaderView nameLabel](self, "nameLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textRectForBounds:limitedToNumberOfLines:", objc_msgSend(v18, "numberOfLines"), v11, v13, v15, v17);
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;

    -[CNContactHeaderView nameLabel](self, "nameLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "showMenuFromView:rect:", v27, v20, v22, v24, v26);

    -[CNContactHeaderView nameLabel](self, "nameLabel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setHighlighted:", 1);

  }
}

- (void)menuWillHide:(id)a3
{
  id v3;

  -[CNContactHeaderView nameLabel](self, "nameLabel", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHighlighted:", 0);

}

- (void)_assignActionToGeminiView
{
  void *v3;
  void *v4;
  int v5;

  -[CNContactHeaderView contacts](self, "contacts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasBeenPersisted");

  if (v5)
    -[CNContactHeaderDisplayView _geminiViewBehaviorForSavedContact](self, "_geminiViewBehaviorForSavedContact");
  else
    -[CNContactHeaderDisplayView _geminiViewBehaviorForUnknownContact](self, "_geminiViewBehaviorForUnknownContact");
}

- (void)_geminiViewBehaviorForSavedContact
{
  void *v3;
  void *v4;
  id v5;

  -[CNContactHeaderDisplayView geminiView](self, "geminiView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMenu:", 0);

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", self, sel_handleGeminiViewTouch_);
  objc_msgSend(v5, "setMinimumPressDuration:", 0.001);
  -[CNContactHeaderDisplayView geminiView](self, "geminiView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addGestureRecognizer:", v5);

}

- (void)_geminiViewBehaviorForUnknownContact
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "featureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFeatureEnabled:", 7);

  if (v5)
  {
    -[CNContactHeaderDisplayView _unknownContactActionForGeminiView](self, "_unknownContactActionForGeminiView");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:children:", &stru_1E20507A8, v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderDisplayView geminiView](self, "geminiView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMenu:", v6);

    -[CNContactHeaderDisplayView geminiView](self, "geminiView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setShowsMenuAsPrimaryAction:", 1);

  }
}

- (id)_unknownContactActionForGeminiView
{
  void *v3;
  void *v4;
  uint64_t v5;
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
  void *v16;
  void *v17;
  void *v18;
  id obj;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  _QWORD aBlock[5];
  id v25;
  id location;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[CNContactHeaderDisplayView geminiResult](self, "geminiResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "availableChannels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v4;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v23)
  {
    v21 = *(_QWORD *)v28;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v28 != v21)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v5);
        objc_initWeak(&location, self);
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __64__CNContactHeaderDisplayView__unknownContactActionForGeminiView__block_invoke;
        aBlock[3] = &unk_1E20490B8;
        objc_copyWeak(&v25, &location);
        aBlock[4] = v6;
        v7 = _Block_copy(aBlock);
        v8 = (void *)MEMORY[0x1E0DC3428];
        objc_msgSend(v6, "localizedLabel");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "actionWithTitle:image:identifier:handler:", v9, 0, 0, v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "senderIdentity");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactHeaderDisplayView geminiResult](self, "geminiResult");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "channel");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "senderIdentity");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setState:", v11 == v14);

        -[CNContactHeaderDisplayView geminiIconProvider](self, "geminiIconProvider");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "channelIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "geminiIconForGeminiChannelIdentifier:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setImage:", v17);

        objc_msgSend(v22, "addObject:", v10);
        objc_destroyWeak(&v25);
        objc_destroyWeak(&location);
        ++v5;
      }
      while (v23 != v5);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v23);
  }

  v18 = (void *)objc_msgSend(v22, "copy");
  return v18;
}

- (void)picker:(id)a3 didPickItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a4;
  v7 = a3;
  -[CNContactHeaderDisplayView geminiView](self, "geminiView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNeedsCalculateLayout");

  -[CNContactHeaderDisplayView geminiView](self, "geminiView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "calculateLayoutIfNeeded");

  -[CNContactHeaderView setNeedsLabelSizeCalculation:](self, "setNeedsLabelSizeCalculation:", 1);
  -[CNContactHeaderDisplayView setNeedsLayout](self, "setNeedsLayout");
  objc_msgSend(MEMORY[0x1E0C97310], "channelStringFromSenderIdentity:", v6);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[CNContactHeaderView delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "headerViewDidPickPreferredChannel:", v13);

  -[CNContactHeaderView presenterDelegate](self, "presenterDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sender:dismissViewController:", self, v7);

  -[CNContactHeaderDisplayView geminiView](self, "geminiView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHighlighted:", 0);

  -[CNContactHeaderDisplayView setGeminiPicker:](self, "setGeminiPicker:", 0);
}

- (void)pickerDidCancel:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CNContactHeaderView presenterDelegate](self, "presenterDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sender:dismissViewController:", self, v4);

  -[CNContactHeaderDisplayView geminiView](self, "geminiView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHighlighted:", 0);

  -[CNContactHeaderDisplayView setGeminiPicker:](self, "setGeminiPicker:", 0);
}

- (void)geminiViewDidPickPreferredChannel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CNContactHeaderDisplayView geminiView](self, "geminiView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsCalculateLayout");

  -[CNContactHeaderDisplayView geminiView](self, "geminiView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "calculateLayoutIfNeeded");

  -[CNContactHeaderView setNeedsLabelSizeCalculation:](self, "setNeedsLabelSizeCalculation:", 1);
  -[CNContactHeaderDisplayView setNeedsLayout](self, "setNeedsLayout");
  -[CNContactHeaderView delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "headerViewDidPickPreferredChannel:", v4);

}

- (void)handleGeminiViewTouch:(id)a3
{
  id v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  id v20;
  CGPoint v21;
  CGRect v22;

  v4 = a3;
  -[CNContactHeaderDisplayView geminiView](self, "geminiView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  -[CNContactHeaderDisplayView geminiView](self, "geminiView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v21.x = v7;
  v21.y = v9;
  v11 = CGRectContainsPoint(v22, v21);

  v12 = objc_msgSend(v4, "state");
  switch(v12)
  {
    case 4:
LABEL_12:
      -[CNContactHeaderDisplayView geminiView](self, "geminiView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v16;
      v17 = 0;
      goto LABEL_13;
    case 3:
      if ((_DWORD)v11)
      {
        -[CNContactHeaderDisplayView geminiView](self, "geminiView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "allowsPickerActions");

        if (v19)
          -[CNContactHeaderDisplayView _presentViewControllerForGemini](self, "_presentViewControllerForGemini");
      }
      goto LABEL_12;
    case 2:
      if ((_DWORD)v11)
      {
        -[CNContactHeaderDisplayView geminiView](self, "geminiView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v13, "allowsPickerActions");

      }
      -[CNContactHeaderDisplayView geminiView](self, "geminiView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isHighlighted");

      if ((_DWORD)v11 != v15)
      {
        -[CNContactHeaderDisplayView geminiView](self, "geminiView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v16;
        v17 = v11;
LABEL_13:
        objc_msgSend(v16, "setHighlighted:", v17);

      }
      break;
  }
}

- (void)_presentViewControllerForGemini
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  CNGeminiPickerController *v9;
  void *v10;
  void *v11;
  CNGeminiPickerController *v12;

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "featureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFeatureEnabled:", 7);

  if (!v5
    || (-[CNContactHeaderView contacts](self, "contacts"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "firstObject"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "hasBeenPersisted"),
        v7,
        v6,
        v8))
  {
    v9 = [CNGeminiPickerController alloc];
    -[CNContactHeaderDisplayView geminiResult](self, "geminiResult");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[CNGeminiPickerController initWithGeminiResult:](v9, "initWithGeminiResult:", v10);

    -[CNContactHeaderDisplayView setGeminiPicker:](self, "setGeminiPicker:", v12);
    -[CNGeminiPickerController setDelegate:](v12, "setDelegate:", self);
    -[CNContactHeaderView presenterDelegate](self, "presenterDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sender:presentViewController:", self, v12);

  }
}

- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a4;
  -[CNContactHeaderDisplayView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceStyle");
  v8 = objc_msgSend(v5, "userInterfaceStyle");

  if (v7 != v8)
  {
    -[CNContactHeaderView contacts](self, "contacts");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "hasBeenPersisted");

    if ((v11 & 1) == 0)
    {
      -[CNContactHeaderDisplayView geminiView](self, "geminiView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "contextMenuInteraction");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "dismissMenu");

      -[CNContactHeaderDisplayView geminiIconProvider](self, "geminiIconProvider");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "updateGeminiIcons");

      -[CNContactHeaderDisplayView _geminiViewBehaviorForUnknownContact](self, "_geminiViewBehaviorForUnknownContact");
    }
  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CNContactHeaderDisplayView traitChangeRegistration](self, "traitChangeRegistration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactHeaderDisplayView unregisterForTraitChanges:](self, "unregisterForTraitChanges:", v3);

  v4.receiver = self;
  v4.super_class = (Class)CNContactHeaderDisplayView;
  -[CNContactHeaderView dealloc](&v4, sel_dealloc);
}

- (BOOL)shouldShowGemini
{
  return self->_shouldShowGemini;
}

- (CNContactFormatter)contactFormatter
{
  return self->_contactFormatter;
}

- (void)setContactFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_contactFormatter, a3);
}

- (NSDictionary)importantTextAttributes
{
  return self->_importantTextAttributes;
}

- (NSString)alternateName
{
  return self->_alternateName;
}

- (void)setAlternateName:(id)a3
{
  objc_storeStrong((id *)&self->_alternateName, a3);
}

- (NSString)message
{
  return self->_message;
}

- (NSString)importantMessage
{
  return self->_importantMessage;
}

- (BOOL)isEmergencyContact
{
  return self->_isEmergencyContact;
}

- (BOOL)isRestrictedContact
{
  return self->_isRestrictedContact;
}

- (BOOL)isDowntimeContact
{
  return self->_isDowntimeContact;
}

- (BOOL)allowsPickerActions
{
  return self->_allowsPickerActions;
}

- (void)setAllowsPickerActions:(BOOL)a3
{
  self->_allowsPickerActions = a3;
}

- (BOOL)usesBrandedCallFormat
{
  return self->_usesBrandedCallFormat;
}

- (UIView)personHeaderView
{
  return self->_personHeaderView;
}

- (void)setPersonHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_personHeaderView, a3);
}

- (UILabel)taglineLabel
{
  return (UILabel *)objc_getProperty(self, a2, 664, 1);
}

- (void)setTaglineLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 664);
}

- (UILabel)importantLabel
{
  return self->_importantLabel;
}

- (void)setImportantLabel:(id)a3
{
  objc_storeStrong((id *)&self->_importantLabel, a3);
}

- (CNContactDowntimeView)downtimeView
{
  return self->_downtimeView;
}

- (void)setDowntimeView:(id)a3
{
  objc_storeStrong((id *)&self->_downtimeView, a3);
}

- (double)minLabelsHeight
{
  return self->_minLabelsHeight;
}

- (void)setMinLabelsHeight:(double)a3
{
  self->_minLabelsHeight = a3;
}

- (double)maxLabelsHeight
{
  return self->_maxLabelsHeight;
}

- (void)setMaxLabelsHeight:(double)a3
{
  self->_maxLabelsHeight = a3;
}

- (NSLayoutConstraint)avatarNameSpacingConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 704, 1);
}

- (void)setAvatarNameSpacingConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 704);
}

- (UITraitChangeRegistration)traitChangeRegistration
{
  return (UITraitChangeRegistration *)objc_getProperty(self, a2, 712, 1);
}

- (void)setTraitChangeRegistration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 712);
}

- (CNContactGeminiView)geminiView
{
  return (CNContactGeminiView *)objc_getProperty(self, a2, 720, 1);
}

- (void)setGeminiView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 720);
}

- (CNGeminiResult)geminiResult
{
  return (CNGeminiResult *)objc_getProperty(self, a2, 728, 1);
}

- (void)setGeminiResult:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 728);
}

- (CNGeminiPickerController)geminiPicker
{
  return self->_geminiPicker;
}

- (void)setGeminiPicker:(id)a3
{
  objc_storeStrong((id *)&self->_geminiPicker, a3);
}

- (CNContactGeminiIconProvider)geminiIconProvider
{
  return self->_geminiIconProvider;
}

- (CNMetricsUIReporter)metricsReporter
{
  return self->_metricsReporter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsReporter, 0);
  objc_storeStrong((id *)&self->_geminiIconProvider, 0);
  objc_storeStrong((id *)&self->_geminiPicker, 0);
  objc_storeStrong((id *)&self->_geminiResult, 0);
  objc_storeStrong((id *)&self->_geminiView, 0);
  objc_storeStrong((id *)&self->_traitChangeRegistration, 0);
  objc_storeStrong((id *)&self->_avatarNameSpacingConstraint, 0);
  objc_storeStrong((id *)&self->_downtimeView, 0);
  objc_storeStrong((id *)&self->_importantLabel, 0);
  objc_storeStrong((id *)&self->_taglineLabel, 0);
  objc_storeStrong((id *)&self->_personHeaderView, 0);
  objc_storeStrong((id *)&self->_importantMessage, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_alternateName, 0);
  objc_storeStrong((id *)&self->_importantTextAttributes, 0);
  objc_storeStrong((id *)&self->_contactFormatter, 0);
  objc_storeStrong((id *)&self->_geminiTextAttributes, 0);
  objc_storeStrong((id *)&self->_downtimeTextAttributes, 0);
  objc_storeStrong((id *)&self->_taglineTextAttributes, 0);
}

void __64__CNContactHeaderDisplayView__unknownContactActionForGeminiView__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "metricsReporter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "geminiResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "channel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logUnknownContactGeminiViewDifferentChannelSelected:", objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32)) ^ 1);

  objc_msgSend(*(id *)(a1 + 32), "senderIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97310], "channelStringFromSenderIdentity:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "geminiViewDidPickPreferredChannel:", v6);

}

void __47__CNContactHeaderDisplayView_updateConstraints__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  id v18;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "centerXAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "centerXAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  objc_msgSend(v4, "leadingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "layoutMarginsGuide");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "leadingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v10);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  LODWORD(v11) = 1148829696;
  objc_msgSend(v18, "setPriority:", v11);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v18);
  objc_msgSend(v4, "trailingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "layoutMarginsGuide");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v16) = 1148829696;
  objc_msgSend(v15, "setPriority:", v16);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v15);
  LODWORD(v17) = 1112014848;
  objc_msgSend(v4, "setContentHuggingPriority:forAxis:", 0, v17);

}

id __47__CNContactHeaderDisplayView_updateConstraints__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  objc_msgSend(v5, "leadingAnchor");
  v18 = a1;
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "layoutMarginsGuide");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "leadingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v8;
  objc_msgSend(v5, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "layoutMarginsGuide");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v12;
  objc_msgSend(v5, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v21[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(v18 + 40), "addObjectsFromArray:", v15);
  objc_msgSend(v5, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

@end
