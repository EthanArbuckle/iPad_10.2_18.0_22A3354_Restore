@implementation LPCollaborationFooterView

- (LPCollaborationFooterView)initWithHost:(id)a3
{

  return 0;
}

- (id)_resolvedGlyphAttachmentImageFromImage:(id)a3
{
  return a3;
}

- (LPCollaborationFooterView)initWithHost:(id)a3 properties:(id)a4 style:(id)a5
{
  id v8;
  id v9;
  id v10;
  LPCollaborationFooterView *v11;
  LPCollaborationFooterView *v12;
  id *p_style;
  uint64_t v14;
  id action;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  LPGlyphStyle *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  LPImage *v32;
  void *v33;
  LPTextView *v34;
  LPTextView *optionsView;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  LPCollaborationFooterView *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  LPTextView *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  LPTextView *subtitleView;
  LPTextView *v51;
  UIImageView *v52;
  UIImageView *indicatorView;
  UIImageView *v54;
  void *v55;
  void *v56;
  LPBackgroundColorView *v57;
  UIView *separatorView;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  _QWORD v70[4];
  id v71;
  id v72;
  objc_super v73;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v73.receiver = self;
  v73.super_class = (Class)LPCollaborationFooterView;
  v11 = -[LPComponentView initWithHost:](&v73, sel_initWithHost_, v8);
  v12 = v11;
  if (v11)
  {
    p_style = (id *)&v11->_style;
    objc_storeStrong((id *)&v11->_style, a5);
    objc_msgSend(v9, "action");
    v14 = objc_claimAutoreleasedReturnValue();
    action = v12->_action;
    v12->_action = (id)v14;

    v67 = v8;
    v68 = v10;
    objc_msgSend(v9, "title");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = v16;
    if (v16)
    {
      v17 = objc_alloc_init(MEMORY[0x1E0CB3778]);
      objc_msgSend(v9, "glyphAttachmentImage");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        v19 = objc_alloc_init(MEMORY[0x1E0DC33D0]);
        objc_msgSend(v9, "glyphAttachmentImage");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCollaborationFooterView _resolvedGlyphAttachmentImageFromImage:](v12, "_resolvedGlyphAttachmentImageFromImage:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setImage:", v21);

        objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v19);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "appendAttributedString:", v22);

        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
        objc_msgSend(v17, "appendAttributedString:", v23);

        v16 = v69;
      }
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v16);
      objc_msgSend(v17, "appendAttributedString:", v24);

      objc_msgSend(v10, "options");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "useInlineIndicator") && v12->_action)
      {
        v26 = objc_msgSend(v25, "copy");

        v66 = (void *)v26;
        v27 = objc_alloc_init(LPGlyphStyle);
        objc_msgSend(MEMORY[0x1E0DC3888], "_lp_configurationWithTextStyle:weight:scale:", *MEMORY[0x1E0DC4AB8], 7, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        +[LPResources chevron](LPResources, "chevron");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "platformImage");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "_lp_imageByApplyingSymbolConfiguration:", v28);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        v25 = v66;
        v32 = -[LPImage initWithPlatformImage:]([LPImage alloc], "initWithPlatformImage:", v31);
        -[LPGlyphStyle setImage:](v27, "setImage:", v32);

        objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPGlyphStyle setColor:](v27, "setColor:", v33);

        objc_msgSend(v66, "setTrailingGlyph:", v27);
        v8 = v67;
        v10 = v68;
      }
      v34 = -[LPTextView initWithHost:text:style:]([LPTextView alloc], "initWithHost:text:style:", v8, v17, v25);
      optionsView = v12->_optionsView;
      v12->_optionsView = v34;

      -[LPCollaborationFooterView addSubview:](v12, "addSubview:", v12->_optionsView);
      v16 = v69;
    }
    objc_msgSend(v9, "subtitle");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36
      || (objc_msgSend(v9, "initiatorNameComponents"), (v36 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {

    }
    else
    {
      objc_msgSend(v9, "initiatorName");
      v65 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v65)
        goto LABEL_19;
    }
    objc_msgSend(v9, "subtitle");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v37;
    if (v37)
    {
      v39 = v37;
    }
    else
    {
      objc_msgSend(v9, "initiatorName");
      v39 = (id)objc_claimAutoreleasedReturnValue();
    }
    v41 = v39;

    objc_msgSend(v9, "initiatorNameComponents");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v70[0] = MEMORY[0x1E0C809B0];
    v70[1] = 3221225472;
    v70[2] = __59__LPCollaborationFooterView_initWithHost_properties_style___block_invoke;
    v70[3] = &unk_1E44A8248;
    v43 = v42;
    v71 = v43;
    v44 = v41;
    v72 = v44;
    __59__LPCollaborationFooterView_initWithHost_properties_style___block_invoke((uint64_t)v70);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (v45)
    {
      v46 = [LPTextView alloc];
      v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v45);
      objc_msgSend(v68, "handle");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = -[LPTextView initWithHost:text:style:](v46, "initWithHost:text:style:", v67, v47, v48);
      subtitleView = v12->_subtitleView;
      v12->_subtitleView = (LPTextView *)v49;

      -[LPCollaborationFooterView addSubview:](v12, "addSubview:", v12->_subtitleView);
    }

    v8 = v67;
    v10 = v68;
    v16 = v69;
LABEL_19:
    v51 = v12->_optionsView;
    if (v12->_subtitleView)
    {
      if (!v51)
      {
LABEL_26:
        if (objc_msgSend(*p_style, "showSeparator"))
        {
          objc_msgSend(MEMORY[0x1E0DC3658], "_lp_colorWithDynamicProvider:name:", &__block_literal_global_5, CFSTR("LPCollaborationFooterSeparatorColor"));
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = -[LPBackgroundColorView initWithColor:]([LPBackgroundColorView alloc], "initWithColor:", v56);
          separatorView = v12->_separatorView;
          v12->_separatorView = &v57->super;

          -[LPCollaborationFooterView addSubview:](v12, "addSubview:", v12->_separatorView);
        }
        if (v12->_optionsView)
        {
          v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v12, sel__footerTapRecognized_);
          -[LPCollaborationFooterView addGestureRecognizer:](v12, "addGestureRecognizer:", v59);
          -[UIView _lp_setHoverEffectEnabled:](v12, "_lp_setHoverEffectEnabled:", 1);

        }
        objc_msgSend(*p_style, "cornerRadius");
        v60 = (void *)objc_claimAutoreleasedReturnValue();

        if (v60)
        {
          objc_msgSend(*p_style, "cornerRadius");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "value");
          -[UIView _lp_setCornerRadius:](v12, "_lp_setCornerRadius:");

        }
        objc_msgSend(*p_style, "backgroundColor");
        v62 = (void *)objc_claimAutoreleasedReturnValue();

        if (v62)
        {
          objc_msgSend(*p_style, "backgroundColor");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView _lp_setBackgroundColor:](v12, "_lp_setBackgroundColor:", v63);

        }
        v40 = v12;
        goto LABEL_35;
      }
    }
    else if (!v51)
    {
      v40 = 0;
LABEL_35:

      goto LABEL_36;
    }
    if ((objc_msgSend(v10, "useInlineIndicator") & 1) == 0 && v12->_action)
    {
      v52 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
      indicatorView = v12->_indicatorView;
      v12->_indicatorView = v52;

      -[LPCollaborationFooterView updateIndicator](v12, "updateIndicator");
      v54 = v12->_indicatorView;
      objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView _lp_setTintColor:](v54, "_lp_setTintColor:", v55);

      -[UIImageView setContentMode:](v12->_indicatorView, "setContentMode:", 4);
      -[LPCollaborationFooterView addSubview:](v12, "addSubview:", v12->_indicatorView);
    }
    goto LABEL_26;
  }
  v40 = 0;
LABEL_36:

  return v40;
}

id __59__LPCollaborationFooterView_initWithHost_properties_style___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0CB3858]);
    objc_msgSend(v2, "stringFromPersonNameComponents:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (*(_QWORD *)(a1 + 40))
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      LPLocalizedString(CFSTR("Share as %@ (%@)"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", v6, v4, *(_QWORD *)(a1 + 40));
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = v3;
    }

  }
  else
  {
    v7 = *(id *)(a1 + 40);
  }
  return v7;
}

id __59__LPCollaborationFooterView_initWithHost_properties_style___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (objc_msgSend(v2, "userInterfaceIdiom") == 6)
    objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "opaqueSeparatorColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setAdditionalPadding:(UIEdgeInsets)a3
{
  self->_additionalPadding = a3;
  -[UIView _lp_setNeedsLayout](self, "_lp_setNeedsLayout");
}

- (void)layoutComponentView
{
  double v3;
  double v4;

  -[LPCollaborationFooterView bounds](self, "bounds");
  -[LPCollaborationFooterView _layoutFooterForSize:applyingLayout:](self, "_layoutFooterForSize:applyingLayout:", 1, v3, v4);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[LPCollaborationFooterView _layoutFooterForSize:applyingLayout:](self, "_layoutFooterForSize:applyingLayout:", 0, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutFooterForSize:(CGSize)a3 applyingLayout:(BOOL)a4
{
  _BOOL4 v4;
  CGFloat height;
  double width;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double left;
  double bottom;
  double right;
  void *v18;
  double v19;
  double v20;
  UIImageView *indicatorView;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double MaxY;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double top;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  CGSize result;
  CGRect v57;
  CGRect v58;

  v4 = a4;
  height = a3.height;
  width = a3.width;
  -[LPCollaborationFooterStyle padding](self->_style, "padding");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "asInsetsForLTR:", -[UIView _lp_isLTR](self, "_lp_isLTR"));
  v10 = v9;
  v12 = v11;
  v49 = v14;
  v50 = v13;
  left = self->_additionalPadding.left;
  top = self->_additionalPadding.top;
  bottom = self->_additionalPadding.bottom;
  right = self->_additionalPadding.right;

  v47 = height;
  if (self->_indicatorView)
  {
    -[LPCollaborationFooterStyle indicatorSpacing](self->_style, "indicatorSpacing");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "value");
    v20 = v19;

    indicatorView = self->_indicatorView;
  }
  else
  {
    indicatorView = 0;
    v20 = 0.0;
  }
  -[UIImageView image](indicatorView, "image");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "size");
  v24 = v23;
  v25 = v10 + left;
  v26 = v12 + right;

  v52 = v20;
  v27 = width - (v26 + v25 + v20 + v24);
  -[LPTextView sizeThatFits:](self->_optionsView, "sizeThatFits:", v27, 1.79769313e308);
  v54 = v28;
  v55 = v29;
  -[LPTextView sizeThatFits:](self->_subtitleView, "sizeThatFits:", v27, 1.79769313e308);
  v31 = v30;
  v53 = v32;
  v33 = 0.0;
  if (-[LPCollaborationFooterStyle showSeparator](self->_style, "showSeparator"))
  {
    -[LPCollaborationFooterStyle separatorMargin](self->_style, "separatorMargin");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "bottom");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "value");
    v33 = v36;

  }
  v37 = v49 + bottom;
  v38 = v50 + top + v33;
  if (v4)
  {
    v51 = v37;
    v39 = v47 - v38 - v37;
    if (-[UIView _lp_isLTR](self, "_lp_isLTR"))
    {
      -[UIImageView setFrame:](self->_indicatorView, "setFrame:", width - v24 - v26, v38, v24, v39);
      -[LPTextView setFrame:](self->_optionsView, "setFrame:", v25, v38, v54, v55);
      -[LPTextView frame](self->_optionsView, "frame");
      MaxY = CGRectGetMaxY(v57);
      if (MaxY == 0.0)
        v41 = v38;
      else
        v41 = MaxY;
      v42 = v25;
    }
    else
    {
      -[UIImageView setFrame:](self->_indicatorView, "setFrame:", v25, v38, v24, v39);
      v43 = v52 + v25 + v24;
      -[LPTextView setFrame:](self->_optionsView, "setFrame:", v43 + v27 - v54, v38, v54, v55);
      v42 = v43 + v27 - v31;
      -[LPTextView frame](self->_optionsView, "frame");
      v44 = CGRectGetMaxY(v58);
      if (v44 == 0.0)
        v41 = v38;
      else
        v41 = v44;
    }
    -[LPTextView setFrame:](self->_subtitleView, "setFrame:", v42, v41, v31, v53);
    -[UIView setFrame:](self->_separatorView, "setFrame:", v25, 0.0, width - v25 - v26, 0.5);
    v37 = v51;
  }
  v45 = v37 + v53 + v55 + v38;
  v46 = v24 + v52 + fmax(v54, v31);
  result.height = v45;
  result.width = v46;
  return result;
}

- (void)updateIndicator
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];

  if (self->_indicatorView)
  {
    v8 = (id)*MEMORY[0x1E0DC4AB8];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __44__LPCollaborationFooterView_updateIndicator__block_invoke;
    v9[3] = &unk_1E44A8290;
    v9[4] = self;
    __44__LPCollaborationFooterView_updateIndicator__block_invoke((uint64_t)v9);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "_lp_systemImageNamed:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3888], "_lp_configurationWithTextStyle:weight:scale:", v8, 7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_lp_imageByApplyingSymbolConfiguration:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_indicatorView, "setImage:", v6);

    -[LPCollaborationFooterView window](self, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      -[UIView _lp_setNeedsLayout](self, "_lp_setNeedsLayout");

  }
}

const __CFString *__44__LPCollaborationFooterView_updateIndicator__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;

  objc_msgSend(*(id *)(a1 + 32), "host");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showingDisclosureViewForComponentView:", *(_QWORD *)(a1 + 32));

  if ((v3 & 1) != 0)
    return CFSTR("chevron.down");
  if (objc_msgSend(*(id *)(a1 + 32), "_lp_isLTR"))
    return CFSTR("chevron.right");
  return CFSTR("chevron.left");
}

- (void)_footerTapRecognized:(id)a3
{
  void (**action)(void);

  action = (void (**)(void))self->_action;
  if (action)
    action[2]();
}

- (UIEdgeInsets)additionalPadding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_additionalPadding.top;
  left = self->_additionalPadding.left;
  bottom = self->_additionalPadding.bottom;
  right = self->_additionalPadding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_indicatorView, 0);
  objc_storeStrong((id *)&self->_subtitleView, 0);
  objc_storeStrong((id *)&self->_optionsView, 0);
}

@end
