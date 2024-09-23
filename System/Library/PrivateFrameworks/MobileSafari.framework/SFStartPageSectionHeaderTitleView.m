@implementation SFStartPageSectionHeaderTitleView

- (void)configureUsingSection:(id)a3 visualStyleProvider:(id)a4
{
  id v6;
  NSString *v7;
  NSString *title;
  UIImage *v9;
  UIImage *image;
  UIFont *v11;
  void *font;
  void *v13;
  UIFont *v14;
  UIFont *v15;
  void *v16;
  UIButton *button;
  void *v18;
  id v19;

  v19 = a3;
  v6 = a4;
  objc_msgSend(v19, "title");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  title = self->_title;
  self->_title = v7;

  objc_msgSend(v19, "icon");
  v9 = (UIImage *)objc_claimAutoreleasedReturnValue();
  image = self->_image;
  self->_image = v9;

  if (objc_msgSend(v19, "usesLargeTitle"))
  {
    objc_msgSend(v6, "sectionHeaderLargeTitleFont");
    v11 = (UIFont *)objc_claimAutoreleasedReturnValue();
    font = self->_font;
    self->_font = v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC39A8], "extraProminentInsetGroupedHeaderConfiguration");
    font = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(font, "textProperties");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "font");
    v14 = (UIFont *)objc_claimAutoreleasedReturnValue();
    v15 = self->_font;
    self->_font = v14;

  }
  objc_msgSend(v19, "titleMenu");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[SFStartPageSectionHeaderTitleView createButtonIfNeeded]((id *)&self->super.super.super.isa);
    button = self->_button;
    v18 = v16;
  }
  else
  {
    button = self->_button;
    v18 = 0;
  }
  -[UIButton setMenu:](button, "setMenu:", v18);
  -[SFStartPageSectionHeaderTitleView update]((uint64_t)self);

}

- (void)update
{
  void *v2;
  int *v3;
  void *v4;
  id v5;
  void *v6;
  int *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[3];

  v41[2] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 416), "menu");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
      v3 = &OBJC_IVAR___SFStartPageSectionHeaderTitleView__button;
    else
      v3 = &OBJC_IVAR___SFStartPageSectionHeaderTitleView__label;
    v4 = *(void **)(a1 + *v3);
    v5 = v4;

    objc_msgSend(v5, "setHidden:", 0);
    objc_msgSend(*(id *)(a1 + 416), "menu");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = &OBJC_IVAR___SFStartPageSectionHeaderTitleView__label;
    else
      v7 = &OBJC_IVAR___SFStartPageSectionHeaderTitleView__button;
    v8 = *(id *)(a1 + *v7);

    objc_msgSend(v8, "setHidden:", 1);
    if (*(id *)(a1 + 432) != v5)
    {
      if (*(_QWORD *)(a1 + 424))
        v9 = *(_QWORD *)(a1 + 424);
      else
        v9 = MEMORY[0x1E0C9AA60];
      objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", v9);
      objc_msgSend(MEMORY[0x1E0CB3718], "safari_constraintsMatchingFrameOfView:withFrameOfView:", v5, a1);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(void **)(a1 + 424);
      *(_QWORD *)(a1 + 424) = v10;

      objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", *(_QWORD *)(a1 + 424));
      objc_storeStrong((id *)(a1 + 432), v4);
    }
    v12 = *(id *)(a1 + 440);
    if (*(_QWORD *)(a1 + 456))
    {
      if (v5 == v12)
      {
        if (*(_QWORD *)(a1 + 464))
        {
          v13 = objc_alloc_init(MEMORY[0x1E0CB3778]);
          objc_msgSend(MEMORY[0x1E0DC12B0], "textAttachmentWithImage:", *(_QWORD *)(a1 + 464));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "appendAttributedString:", v15);

          v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
          objc_msgSend(v13, "appendAttributedString:", v16);

          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", *(_QWORD *)(a1 + 456));
          objc_msgSend(v13, "appendAttributedString:", v17);

          v18 = *(_QWORD *)(a1 + 448);
          v19 = *MEMORY[0x1E0DC1140];
          v40[0] = *MEMORY[0x1E0DC1138];
          v40[1] = v19;
          v41[0] = v18;
          objc_msgSend(MEMORY[0x1E0DC3658], "sf_alternateLabelColor");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v41[1] = v20;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addAttributes:range:", v21, 0, objc_msgSend(v13, "length"));

          v22 = objc_msgSend(v13, "copy");
        }
        else
        {
          v23 = objc_alloc(MEMORY[0x1E0CB3498]);
          v24 = *(_QWORD *)(a1 + 456);
          v39[0] = *(_QWORD *)(a1 + 448);
          v25 = *MEMORY[0x1E0DC1140];
          v38[0] = *MEMORY[0x1E0DC1138];
          v38[1] = v25;
          objc_msgSend(MEMORY[0x1E0DC3658], "sf_alternateLabelColor");
          v13 = (id)objc_claimAutoreleasedReturnValue();
          v39[1] = v13;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v23, "initWithString:attributes:", v24, v14);
        }
        v26 = (void *)v22;
        objc_msgSend(*(id *)(a1 + 440), "setAttributedText:", v22);

      }
      if (v5 == *(id *)(a1 + 416))
      {
        objc_msgSend(v5, "configuration");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          v28 = *(_QWORD *)(a1 + 448);
          v36 = *MEMORY[0x1E0DC1138];
          v37 = v28;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (UIAccessibilityButtonShapesEnabled())
          {
            v34 = *MEMORY[0x1E0DC1248];
            v35 = &unk_1E22458F0;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "safari_dictionaryByMergingWithDictionary:", v30);
            v31 = objc_claimAutoreleasedReturnValue();

            v29 = (void *)v31;
          }
          objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:scale:", *(_QWORD *)(a1 + 448), 1);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setPreferredSymbolConfigurationForImage:", v32);

          v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", *(_QWORD *)(a1 + 456), v29);
          objc_msgSend(v27, "setAttributedTitle:", v33);

          objc_msgSend(*(id *)(a1 + 416), "setConfiguration:", v27);
        }

      }
    }
    else
    {
      objc_msgSend(v12, "setText:", 0);
      objc_msgSend(*(id *)(a1 + 416), "setConfiguration:", 0);
    }

  }
}

- (SFStartPageSectionHeaderTitleView)initWithFrame:(CGRect)a3
{
  SFStartPageSectionHeaderTitleView *v3;
  SFStartPageSectionHeaderTitleView *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  UILabel *v15;
  UILabel *label;
  double v17;
  void *v18;
  SFStartPageSectionHeaderTitleView *v19;
  objc_super v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)SFStartPageSectionHeaderTitleView;
  v3 = -[SFStartPageSectionHeaderTitleView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)MEMORY[0x1E0CB3718];
    -[SFStartPageSectionHeaderTitleView widthAnchor](v3, "widthAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintEqualToConstant:", 0.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = 1131413504;
    objc_msgSend(v7, "sf_withPriority:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v9;
    -[SFStartPageSectionHeaderTitleView heightAnchor](v4, "heightAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToConstant:", 0.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = 1131413504;
    objc_msgSend(v11, "sf_withPriority:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activateConstraints:", v14);

    v15 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    label = v4->_label;
    v4->_label = v15;

    -[UILabel setNumberOfLines:](v4->_label, "setNumberOfLines:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAdjustsFontForContentSizeCategory:](v4->_label, "setAdjustsFontForContentSizeCategory:", 1);
    LODWORD(v17) = 1144586240;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v4->_label, "setContentCompressionResistancePriority:forAxis:", 0, v17);
    -[SFStartPageSectionHeaderTitleView addSubview:](v4, "addSubview:", v4->_label);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v4, sel_buttonShapesEnabledStatusDidChange_, *MEMORY[0x1E0DC44E0], 0);

    v19 = v4;
  }

  return v4;
}

- (SFStartPageSectionHeaderTitleView)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFStartPageSectionHeaderTitleView;
  return -[SFStartPageSectionHeaderTitleView initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC44E0], 0);

  v4.receiver = self;
  v4.super_class = (Class)SFStartPageSectionHeaderTitleView;
  -[SFStartPageSectionHeaderTitleView dealloc](&v4, sel_dealloc);
}

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *title;
  id v6;

  v6 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    title = self->_title;
    self->_title = v4;

    -[SFStartPageSectionHeaderTitleView update]((uint64_t)self);
  }

}

- (void)setImage:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_image != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_image, a3);
    -[SFStartPageSectionHeaderTitleView update]((uint64_t)self);
    v5 = v6;
  }

}

- (void)setMenu:(id)a3
{
  UIButton *button;
  id v5;
  id v6;

  v6 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    if (v6)
    {
      -[SFStartPageSectionHeaderTitleView createButtonIfNeeded]((id *)&self->super.super.super.isa);
      button = self->_button;
      v5 = v6;
    }
    else
    {
      button = self->_button;
      v5 = 0;
    }
    -[UIButton setMenu:](button, "setMenu:", v5);
    -[SFStartPageSectionHeaderTitleView update]((uint64_t)self);
  }

}

- (void)createButtonIfNeeded
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  double v8;
  id v9;

  if (a1)
  {
    if (!a1[52])
    {
      objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "sf_alternateLabelColor");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setBaseForegroundColor:", v2);

      objc_msgSend(v9, "setContentInsets:", *MEMORY[0x1E0DC3298], *(double *)(MEMORY[0x1E0DC3298] + 8), *(double *)(MEMORY[0x1E0DC3298] + 16), *(double *)(MEMORY[0x1E0DC3298] + 24));
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("chevron.up.chevron.down"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setImage:", v3);

      objc_msgSend(v9, "setImageColorTransformer:", &__block_literal_global_60);
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "background");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setBackgroundColor:", v4);

      objc_msgSend(v9, "setImagePadding:", 5.0);
      objc_msgSend(v9, "setImagePlacement:", 8);
      objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v9, 0);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = a1[52];
      a1[52] = (id)v6;

      objc_msgSend(a1[52], "setAdjustsImageSizeForAccessibilityContentSizeCategory:", 1);
      objc_msgSend(a1[52], "setShowsMenuAsPrimaryAction:", 1);
      objc_msgSend(a1[52], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      LODWORD(v8) = 1144586240;
      objc_msgSend(a1[52], "setContentCompressionResistancePriority:forAxis:", 0, v8);
      objc_msgSend(a1, "addSubview:", a1[52]);

    }
  }
}

uint64_t __57__SFStartPageSectionHeaderTitleView_createButtonIfNeeded__block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "sf_alternateSecondaryLabelColor");
}

- (NSString)title
{
  return self->_title;
}

- (UIImage)image
{
  return self->_image;
}

- (UIMenu)menu
{
  return self->_menu;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menu, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_currentConstraintsSubview, 0);
  objc_storeStrong((id *)&self->_currentConstraints, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end
