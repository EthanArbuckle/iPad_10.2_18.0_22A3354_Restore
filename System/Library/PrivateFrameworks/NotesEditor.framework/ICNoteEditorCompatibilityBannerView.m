@implementation ICNoteEditorCompatibilityBannerView

+ (void)checkShouldShowCompatibilityBannerViewForNote:(id)a3 parentViewController:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(v7, "hasVisibleInlineAttachments");
  objc_msgSend(v7, "folder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "account");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && v12)
  {
    objc_initWeak(&location, v8);
    v13 = (void *)MEMORY[0x1E0D64BD8];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __117__ICNoteEditorCompatibilityBannerView_checkShouldShowCompatibilityBannerViewForNote_parentViewController_completion___block_invoke;
    v14[3] = &unk_1EA7E1140;
    objc_copyWeak(&v16, &location);
    v15 = v9;
    objc_msgSend(v13, "showCompatibilityAlertForInlineAttachmentsInAccountIfNeeded:parentViewController:completion:", v12, v8, v14);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else if (v9)
  {
    (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
  }

}

- (ICNoteEditorCompatibilityBannerView)initWithFrame:(CGRect)a3 parentViewController:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  ICNoteEditorCompatibilityBannerView *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v27;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v27.receiver = self;
  v27.super_class = (Class)ICNoteEditorCompatibilityBannerView;
  v10 = -[ICNoteEditorCompatibilityBannerView initWithFrame:](&v27, sel_initWithFrame_, x, y, width, height);
  if (v10)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D64C50]), "initWithFrame:", x, y, width, height);
    -[ICNoteEditorCompatibilityBannerView setLearnMoreTextView:](v10, "setLearnMoreTextView:", v11);

    -[ICNoteEditorCompatibilityBannerView learnMoreTextView](v10, "learnMoreTextView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setParentViewController:", v9);

    -[ICNoteEditorCompatibilityBannerView learnMoreTextView](v10, "learnMoreTextView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setContentInsetAdjustmentBehavior:", 2);

    v14 = *MEMORY[0x1E0DC49E8];
    v15 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v16 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v17 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    -[ICNoteEditorCompatibilityBannerView learnMoreTextView](v10, "learnMoreTextView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTextContainerInset:", v14, v15, v16, v17);

    -[ICNoteEditorCompatibilityBannerView learnMoreTextView](v10, "learnMoreTextView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "textContainer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setLineFragmentPadding:", 0.0);

    -[ICNoteEditorCompatibilityBannerView learnMoreTextView](v10, "learnMoreTextView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorCompatibilityBannerView addSubview:](v10, "addSubview:", v21);

    v22 = *MEMORY[0x1E0D64988];
    -[ICNoteEditorCompatibilityBannerView learnMoreTextView](v10, "learnMoreTextView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setHelpTopic:", v22);

    -[ICNoteEditorCompatibilityBannerView learnMoreTextView](v10, "learnMoreTextView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "compatibilityAttributedString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setAttributedText:addLearnMore:", v25, 1);

  }
  return v10;
}

+ (id)compatibilityAttributedString
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC1350], "ic_preferredFontForCompatibilityBannerText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0DC1140];
  v11[0] = *MEMORY[0x1E0DC1138];
  v11[1] = v3;
  v12[0] = v2;
  objc_msgSend(MEMORY[0x1E0DC3658], "ic_noteEditorSecondaryLabelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("This note is not supported on some of your devices."), &stru_1EA7E9860, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v7, v5);
  v9 = objc_alloc_init(MEMORY[0x1E0DC1288]);
  objc_msgSend(v9, "setAlignment:", 1);
  objc_msgSend(v8, "addAttribute:value:range:", *MEMORY[0x1E0DC1178], v9, 0, objc_msgSend(v8, "length"));

  return v8;
}

- (void)updateConstraints
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICNoteEditorCompatibilityBannerView;
  -[ICNoteEditorCompatibilityBannerView updateConstraints](&v4, sel_updateConstraints);
  -[ICNoteEditorCompatibilityBannerView learnMoreTextView](self, "learnMoreTextView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_addAnchorsToFillSuperview");

}

- (double)preferredHeight
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  double v11;
  float v12;

  v3 = 0.0;
  if ((-[ICNoteEditorCompatibilityBannerView isHidden](self, "isHidden") & 1) == 0)
  {
    -[ICNoteEditorCompatibilityBannerView availableWidth](self, "availableWidth");
    if (v4 != 0.0)
    {
      -[ICNoteEditorCompatibilityBannerView learnMoreTextView](self, "learnMoreTextView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "attributedText");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC1320]), "initWithAttributedString:", v6);
      v8 = objc_alloc(MEMORY[0x1E0DC12C0]);
      -[ICNoteEditorCompatibilityBannerView availableWidth](self, "availableWidth");
      v9 = (void *)objc_msgSend(v8, "initWithSize:");
      v10 = objc_alloc_init(MEMORY[0x1E0DC1280]);
      objc_msgSend(v10, "addTextContainer:", v9);
      objc_msgSend(v7, "addLayoutManager:", v10);
      objc_msgSend(v9, "setLineFragmentPadding:", 0.0);
      objc_msgSend(v10, "glyphRangeForTextContainer:", v9);
      objc_msgSend(v10, "usedRectForTextContainer:", v9);
      v12 = v11;
      v3 = ceilf(v12);

    }
  }
  return v3;
}

uint64_t __117__ICNoteEditorCompatibilityBannerView_checkShouldShowCompatibilityBannerViewForNote_parentViewController_completion___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  id WeakRetained;
  uint64_t result;

  if (a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
      objc_msgSend(MEMORY[0x1E0D64C10], "presentWithTopic:presentingViewController:", *MEMORY[0x1E0D64988], WeakRetained);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (void)contentSizeCategoryDidChange
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0DC1350], "ic_preferredFontForCompatibilityBannerText");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorCompatibilityBannerView learnMoreTextView](self, "learnMoreTextView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v4);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[ICNoteEditorCompatibilityBannerView learnMoreTextView](self, "learnMoreTextView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityHint
{
  void *v2;
  void *v3;

  -[ICNoteEditorCompatibilityBannerView learnMoreTextView](self, "learnMoreTextView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityHint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityUserInputLabels
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Learn More"), &stru_1EA7E9860, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  v9.receiver = self;
  v9.super_class = (Class)ICNoteEditorCompatibilityBannerView;
  -[ICNoteEditorCompatibilityBannerView accessibilityUserInputLabels](&v9, sel_accessibilityUserInputLabels);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v3, "addObjectsFromArray:", v6);
  v7 = (void *)objc_msgSend(v3, "copy");

  return v7;
}

- (BOOL)accessibilityActivate
{
  void *v2;

  -[ICNoteEditorCompatibilityBannerView learnMoreTextView](self, "learnMoreTextView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didTapLearnMore");

  return 1;
}

- (id)accessibilityContainer
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICNoteEditorCompatibilityBannerView;
  -[ICNoteEditorCompatibilityBannerView accessibilityContainer](&v7, sel_accessibilityContainer);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    while (!objc_msgSend(v4, "conformsToProtocol:", &unk_1F04A7230))
    {
      objc_msgSend(v4, "accessibilityContainer");
      v5 = objc_claimAutoreleasedReturnValue();

      v4 = (id)v5;
      if (!v5)
        goto LABEL_8;
    }
    v4 = v4;

    v3 = v4;
  }
  else
  {
    v4 = 0;
  }
LABEL_8:

  return v3;
}

- (void)accessibilityElementDidBecomeFocused
{
  id v3;
  uint64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICNoteEditorCompatibilityBannerView;
  -[ICNoteEditorCompatibilityBannerView accessibilityElementDidBecomeFocused](&v5, sel_accessibilityElementDidBecomeFocused);
  if (UIAccessibilityIsVoiceOverRunning())
  {
    -[ICNoteEditorCompatibilityBannerView nextResponder](self, "nextResponder");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      while (1)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        objc_msgSend(v3, "nextResponder");
        v4 = objc_claimAutoreleasedReturnValue();

        v3 = (id)v4;
        if (!v4)
          goto LABEL_7;
      }
      v3 = v3;
    }
LABEL_7:
    objc_msgSend(v3, "showOverscrollContentAndScrollToTop");

  }
}

- (double)availableWidth
{
  return self->_availableWidth;
}

- (void)setAvailableWidth:(double)a3
{
  self->_availableWidth = a3;
}

- (ICLearnMoreTextView)learnMoreTextView
{
  return self->_learnMoreTextView;
}

- (void)setLearnMoreTextView:(id)a3
{
  objc_storeStrong((id *)&self->_learnMoreTextView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_learnMoreTextView, 0);
}

@end
