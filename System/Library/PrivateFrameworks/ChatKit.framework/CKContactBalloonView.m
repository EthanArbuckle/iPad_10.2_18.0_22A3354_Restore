@implementation CKContactBalloonView

- (void)configureForMediaObject:(id)a3 previewWidth:(double)a4 orientation:(char)a5
{
  uint64_t v5;
  id v8;
  objc_super v9;

  v5 = a5;
  v9.receiver = self;
  v9.super_class = (Class)CKContactBalloonView;
  v8 = a3;
  -[CKBalloonView configureForMediaObject:previewWidth:orientation:](&v9, sel_configureForMediaObject_previewWidth_orientation_, v8, v5, a4);
  -[CKContactBalloonView setMediaObject:](self, "setMediaObject:", v8, v9.receiver, v9.super_class);

}

- (void)configureForComposition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKContactBalloonView;
  v4 = a3;
  -[CKColoredBalloonView configureForComposition:](&v8, sel_configureForComposition_, v4);
  objc_msgSend(v4, "mediaObjects", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "previewMaxWidth");
  -[CKContactBalloonView configureForMediaObject:previewWidth:orientation:](self, "configureForMediaObject:previewWidth:orientation:", v6, 1);

}

+ (BOOL)canShowChevron
{
  return 1;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)CKContactBalloonView;
  -[CKColoredBalloonView description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKContactBalloonView nameLabel](self, "nameLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKContactBalloonView organizationLabel](self, "organizationLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ name:%@ organization:%@"), v4, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (CKContactBalloonView)initWithFrame:(CGRect)a3
{
  CKContactBalloonView *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CKContactBalloonView;
  v3 = -[CKColoredBalloonView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA658]);
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v9 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
    objc_msgSend(v9, "setContentMode:", 1);
    -[CKContactBalloonView setContactImageView:](v3, "setContactImageView:", v9);
    -[CKContactBalloonView addSubview:](v3, "addSubview:", v9);
    if (objc_msgSend((id)objc_opt_class(), "canShowChevron"))
    {
      v10 = objc_alloc(MEMORY[0x1E0CEA658]);
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "chevronImageForColorType:", 0xFFFFFFFFLL);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v10, "initWithImage:", v12);

      objc_msgSend(v13, "setContentMode:", 4);
      -[CKContactBalloonView setChevron:](v3, "setChevron:", v13);
      -[CKContactBalloonView addSubview:](v3, "addSubview:", v13);

    }
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v5, v6, v7, v8);
    objc_msgSend(MEMORY[0x1E0DC1350], "__ck_emphasizedPreferredFontForTextStyle:", *MEMORY[0x1E0CEB5A0]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFont:", v15);

    -[CKContactBalloonView setNameLabel:](v3, "setNameLabel:", v14);
    -[CKContactBalloonView addSubview:](v3, "addSubview:", v14);
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v5, v6, v7, v8);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB548]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFont:", v17);

    -[CKContactBalloonView setOrganizationLabel:](v3, "setOrganizationLabel:", v16);
    -[CKContactBalloonView addSubview:](v3, "addSubview:", v16);

  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  double MinX;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  double MaxX;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  uint64_t v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  CGFloat v50;
  objc_super v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;

  v51.receiver = self;
  v51.super_class = (Class)CKContactBalloonView;
  -[CKColoredBalloonView layoutSubviews](&v51, sel_layoutSubviews);
  -[CKContactBalloonView bounds](self, "bounds");
  -[CKContactBalloonView alignmentRectForFrame:](self, "alignmentRectForFrame:");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[CKContactBalloonView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  -[CKContactBalloonView contactImageView](self, "contactImageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)objc_opt_class(), "canShowChevron"))
  {
    -[CKContactBalloonView chevron](self, "chevron");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "image");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "size");
    v16 = v15;

    v17 = v4;
    v18 = v6;
    v19 = v8;
    v20 = v10;
    if ((v11 & 1) != 0)
      MinX = CGRectGetMinX(*(CGRect *)&v17);
    else
      MinX = CGRectGetMaxX(*(CGRect *)&v17) - v16;
    objc_msgSend(v13, "setFrame:", MinX, v6, v16, v10);
    if ((v11 & 1) != 0)
    {
      v52.origin.x = MinX;
      v52.origin.y = v6;
      v52.size.width = v16;
      v52.size.height = v10;
      MaxX = CGRectGetMaxX(v52);
      v28 = 5.0;
    }
    else
    {
      MaxX = MinX + -5.0;
      v28 = -38.0;
    }
    v26 = MaxX + v28;

  }
  else
  {
    v22 = v4;
    v23 = v6;
    v24 = v8;
    v25 = v10;
    if ((v11 & 1) != 0)
      v26 = CGRectGetMinX(*(CGRect *)&v22);
    else
      v26 = CGRectGetMaxX(*(CGRect *)&v22) + -38.0;
  }
  objc_msgSend(v12, "setFrame:", v26, v6, 38.0, v10);
  -[CKContactBalloonView nameLabel](self, "nameLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKContactBalloonView organizationLabel](self, "organizationLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v11 & 1) != 0)
  {
    v53.origin.x = v4;
    v53.origin.y = v6;
    v53.size.width = v8;
    v53.size.height = v10;
    v31 = CGRectGetMaxX(v53);
    v54.origin.x = v26;
    v54.origin.y = v6;
    v54.size.width = 38.0;
    v54.size.height = v10;
    v32 = v31 - CGRectGetMaxX(v54) + -10.0;
    v55.origin.x = v4;
    v55.origin.y = v6;
    v55.size.width = v8;
    v55.size.height = v10;
    v33 = CGRectGetMaxX(v55) - v32;
    v56.origin.x = v4;
    v56.origin.y = v6;
    v56.size.width = v8;
    v56.size.height = v10;
    v34 = CGRectGetMaxX(v56);
    v57.origin.x = v33;
    v57.origin.y = v6;
    v57.size.width = v32;
    v57.size.height = v10;
    v35 = v34 - CGRectGetWidth(v57);
  }
  else
  {
    v32 = v26 + -10.0 - v4;
    v33 = v4 + 0.0;
    v35 = v4 + 0.0;
  }
  objc_msgSend(v29, "setFrame:", v35, v6, v32, v10);
  objc_msgSend(v30, "setFrame:", v35, v6, v32, v10);
  objc_msgSend(v30, "text");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "length");

  if (v37)
  {
    objc_msgSend(v30, "font");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "_bodyLeading");
    v40 = v39 * 0.59375;

    objc_msgSend(v29, "font");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "capHeight");
    v43 = v40 + v42;
    objc_msgSend(v30, "font");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "capHeight");
    v46 = v43 + v45;
    if (CKMainScreenScale_once_43 != -1)
      dispatch_once(&CKMainScreenScale_once_43, &__block_literal_global_105);
    v47 = *(double *)&CKMainScreenScale_sMainScreenScale_43;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_43 == 0.0)
      v47 = 1.0;
    v48 = ceil(v46 * v47) / v47;

    if (CKMainScreenScale_once_43 != -1)
      dispatch_once(&CKMainScreenScale_once_43, &__block_literal_global_105);
    v49 = *(double *)&CKMainScreenScale_sMainScreenScale_43;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_43 == 0.0)
      v49 = 1.0;
    v50 = 1.0 / v49 * (v6 * v49 + floor((v10 * v49 - v48 * v49) * 0.5));
    objc_msgSend(v29, "_setFirstLineCapFrameOriginY:", v50);
    v58.origin.x = v33;
    v58.origin.y = v50;
    v58.size.width = v32;
    v58.size.height = v48;
    objc_msgSend(v30, "_setLastLineBaselineFrameOriginY:", CGRectGetMaxY(v58));
  }

}

- (UIEdgeInsets)alignmentRectInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  UIEdgeInsets result;

  v6.receiver = self;
  v6.super_class = (Class)CKContactBalloonView;
  -[CKColoredBalloonView alignmentRectInsets](&v6, sel_alignmentRectInsets);
  v4 = 0.0;
  v5 = 0.0;
  result.right = v3;
  result.bottom = v5;
  result.left = v2;
  result.top = v4;
  return result;
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKContactBalloonView;
  -[CKColoredBalloonView prepareForReuse](&v5, sel_prepareForReuse);
  -[CKContactBalloonView chevron](self, "chevron");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);

  -[CKContactBalloonView nameLabel](self, "nameLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", 0);

}

- (void)prepareForDisplay
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
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CKContactBalloonView;
  -[CKColoredBalloonView prepareForDisplay](&v18, sel_prepareForDisplay);
  -[CKContactBalloonView mediaObject](self, "mediaObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "theme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "balloonTextColorForColorType:", -[CKBalloonView color](self, "color"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKContactBalloonView chevron](self, "chevron");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "chevronImageForColorType:", -[CKBalloonView color](self, "color"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:", v9);

  -[CKContactBalloonView contactImageView](self, "contactImageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "icon");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setImage:", v11);

  -[CKContactBalloonView nameLabel](self, "nameLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKContactBalloonView _truncateNameIfNeeded:](self, "_truncateNameIfNeeded:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setText:", v14);
  objc_msgSend(v12, "setTextColor:", v6);
  -[CKContactBalloonView organizationLabel](self, "organizationLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subtitle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKContactBalloonView _truncateNameIfNeeded:](self, "_truncateNameIfNeeded:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setText:", v17);
  objc_msgSend(v15, "setTextColor:", v6);

}

- (id)_truncateNameIfNeeded:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "length") < 0xC9)
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(v3, "substringWithRange:", 0, 200);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGSize result;

  width = a3.width;
  -[CKContactBalloonView nameLabel](self, "nameLabel", a4, a3.width, a3.height);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  v8 = v7;
  v10 = v9;

  -[CKContactBalloonView organizationLabel](self, "organizationLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  v13 = v12;
  v15 = v14;

  if (v8 < v13)
    v8 = v13;
  -[CKContactBalloonView alignmentRectInsets](self, "alignmentRectInsets");
  v17 = v8 + v16 + 0.0 + 10.0 + 38.0;
  if (objc_msgSend((id)objc_opt_class(), "canShowChevron"))
  {
    -[CKContactBalloonView chevron](self, "chevron");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "image");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "size");
    v17 = v17 + v20 + 5.0;

  }
  -[CKContactBalloonView alignmentRectInsets](self, "alignmentRectInsets");
  v22 = v21;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "contactBalloonMinWidth");
  v25 = v24;

  if (CKMainScreenScale_once_43 != -1)
    dispatch_once(&CKMainScreenScale_once_43, &__block_literal_global_105);
  v26 = v10 + 12.0 + v15 + 12.0;
  v27 = v17 + v22;
  if (v25 >= v17 + v22)
    v27 = v25;
  if (width < v27)
    v27 = width;
  v28 = *(double *)&CKMainScreenScale_sMainScreenScale_43;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_43 == 0.0)
    v28 = 1.0;
  v29 = ceil(v28 * 58.5) / v28;
  if (v26 < v29)
    v26 = v29;
  result.height = v26;
  result.width = v27;
  return result;
}

- (void)addOverlaySubview:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKContactBalloonView contactImageView](self, "contactImageView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CKContactBalloonView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v4, v5);

}

- (void)setMediaObject:(id)a3
{
  CKMediaObject *v5;
  CKMediaObject *v6;

  v5 = (CKMediaObject *)a3;
  if (self->_mediaObject != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_mediaObject, a3);
    -[CKBalloonView setNeedsPrepareForDisplay](self, "setNeedsPrepareForDisplay");
    -[CKContactBalloonView setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (CKMediaObject)mediaObject
{
  return self->_mediaObject;
}

- (UIImageView)chevron
{
  return self->_chevron;
}

- (void)setChevron:(id)a3
{
  objc_storeStrong((id *)&self->_chevron, a3);
}

- (UIImageView)contactImageView
{
  return self->_contactImageView;
}

- (void)setContactImageView:(id)a3
{
  objc_storeStrong((id *)&self->_contactImageView, a3);
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_nameLabel, a3);
}

- (UILabel)organizationLabel
{
  return self->_organizationLabel;
}

- (void)setOrganizationLabel:(id)a3
{
  objc_storeStrong((id *)&self->_organizationLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_organizationLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_contactImageView, 0);
  objc_storeStrong((id *)&self->_chevron, 0);
  objc_storeStrong((id *)&self->_mediaObject, 0);
}

- (void)configureForMessagePart:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CKContactBalloonView;
  v4 = a3;
  -[CKColoredBalloonView configureForMessagePart:](&v10, sel_configureForMessagePart_, v4);
  objc_msgSend(v4, "mediaObject", v10.receiver, v10.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "previewMaxWidth");
  v8 = v7;
  v9 = objc_msgSend(v4, "balloonOrientation");

  -[CKContactBalloonView configureForMediaObject:previewWidth:orientation:](self, "configureForMediaObject:previewWidth:orientation:", v5, v9, v8);
}

@end
