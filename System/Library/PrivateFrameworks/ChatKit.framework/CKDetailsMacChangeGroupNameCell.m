@implementation CKDetailsMacChangeGroupNameCell

+ (id)identifier
{
  return CFSTR("mac_change_groupName");
}

- (CKDetailsMacChangeGroupNameCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CKDetailsMacChangeGroupNameCell *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  objc_super v49;

  v49.receiver = self;
  v49.super_class = (Class)CKDetailsMacChangeGroupNameCell;
  v4 = -[CKDetailsCell initWithStyle:reuseIdentifier:](&v49, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0CEA700]);
    v6 = *MEMORY[0x1E0C9D648];
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v10 = (void *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], v7, v8, v9);
    -[CKDetailsMacChangeGroupNameCell setChangeNameLabel:](v4, "setChangeNameLabel:", v10);

    -[CKDetailsMacChangeGroupNameCell changeNameLabel](v4, "changeNameLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    CKFrameworkBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("CHANGE_GROUP_NAME_AND_PHOTO"), &stru_1E276D870, CFSTR("ChatKit"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setText:", v13);

    LODWORD(v12) = CKIsRunningInMacCatalyst();
    -[CKDetailsMacChangeGroupNameCell changeNameLabel](v4, "changeNameLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v12)
    {
      -[CKDetailsMacChangeGroupNameCell tintColor](v4, "tintColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setTextColor:", v15);
    }
    else
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "theme");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "appTintColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setTextColor:", v17);

    }
    -[CKDetailsMacChangeGroupNameCell changeNameLabel](v4, "changeNameLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setEnabled:", 1);

    -[CKDetailsMacChangeGroupNameCell changeNameLabel](v4, "changeNameLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "sizeToFit");

    -[CKDetailsMacChangeGroupNameCell contentView](v4, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsMacChangeGroupNameCell changeNameLabel](v4, "changeNameLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addSubview:", v21);

    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithFrame:", v6, v7, v8, v9);
    -[CKDetailsMacChangeGroupNameCell setCellGlpyh:](v4, "setCellGlpyh:", v22);

    -[CKDetailsMacChangeGroupNameCell cellGlpyh](v4, "cellGlpyh");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setBackgroundColor:", 0);

    -[CKDetailsMacChangeGroupNameCell cellGlpyh](v4, "cellGlpyh");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setContentMode:", 4);

    -[CKDetailsMacChangeGroupNameCell cellGlpyh](v4, "cellGlpyh");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("person.2.fill"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)MEMORY[0x1E0CEA650];
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "configurationWithFont:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "imageWithConfiguration:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setImage:", v30);

    -[CKDetailsMacChangeGroupNameCell cellGlpyh](v4, "cellGlpyh");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsMacChangeGroupNameCell tintColor](v4, "tintColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setTintColor:", v32);

    -[CKDetailsMacChangeGroupNameCell cellGlpyh](v4, "cellGlpyh");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "transcriptDrawerContactImageDiameter");
    v36 = v35;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "transcriptDrawerContactImageDiameter");
    objc_msgSend(v33, "setBounds:", 0.0, 0.0, v36, v38);

    -[CKDetailsMacChangeGroupNameCell cellGlpyh](v4, "cellGlpyh");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "quaternaryLabelColor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setBackgroundColor:", v40);

    -[CKDetailsMacChangeGroupNameCell cellGlpyh](v4, "cellGlpyh");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "layer");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "transcriptDrawerContactImageDiameter");
    objc_msgSend(v42, "setCornerRadius:", v44 * 0.5);

    -[CKDetailsMacChangeGroupNameCell contentView](v4, "contentView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsMacChangeGroupNameCell cellGlpyh](v4, "cellGlpyh");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "addSubview:", v46);

    -[CKDetailsMacChangeGroupNameCell contentView](v4, "contentView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setBackgroundColor:", 0);

  }
  return v4;
}

- (void)layoutSubviews
{
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
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
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  void *v47;
  objc_super v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  v48.receiver = self;
  v48.super_class = (Class)CKDetailsMacChangeGroupNameCell;
  -[CKDetailsCell layoutSubviews](&v48, sel_layoutSubviews);
  v3 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
  -[CKDetailsMacChangeGroupNameCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutMargins");
  v6 = v5;
  v8 = v7;

  -[CKDetailsMacChangeGroupNameCell cellGlpyh](self, "cellGlpyh");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  if (v3)
  {
    -[CKDetailsMacChangeGroupNameCell contentView](self, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bounds");
    v20 = v19 - v8;
    v49.origin.x = v11;
    v49.origin.y = v13;
    v49.size.width = v15;
    v49.size.height = v17;
    v21 = v20 - CGRectGetWidth(v49);
    -[CKDetailsMacChangeGroupNameCell bounds](self, "bounds");
    v23 = v22;
    v50.origin.x = v11;
    v50.origin.y = v13;
    v50.size.width = v15;
    v50.size.height = v17;
    v24 = (v23 - CGRectGetHeight(v50)) * 0.5;
    if (CKMainScreenScale_once_107 != -1)
      dispatch_once(&CKMainScreenScale_once_107, &__block_literal_global_277);
    v25 = *(double *)&CKMainScreenScale_sMainScreenScale_107;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_107 == 0.0)
      v25 = 1.0;
    v26 = floor(v21 * v25) / v25;
    v27 = floor(v24 * v25) / v25;

  }
  else
  {
    -[CKDetailsMacChangeGroupNameCell bounds](self, "bounds");
    v29 = v28;
    v51.origin.x = v11;
    v51.origin.y = v13;
    v51.size.width = v15;
    v51.size.height = v17;
    v30 = (v29 - CGRectGetHeight(v51)) * 0.5 + 6.0;
    if (CKMainScreenScale_once_107 != -1)
      dispatch_once(&CKMainScreenScale_once_107, &__block_literal_global_277);
    v31 = *(double *)&CKMainScreenScale_sMainScreenScale_107;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_107 == 0.0)
      v31 = 1.0;
    v26 = floor(v6 * v31) / v31;
    v27 = floor(v30 * v31) / v31;
  }
  -[CKDetailsMacChangeGroupNameCell cellGlpyh](self, "cellGlpyh");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setFrame:", v26, v27, v15, v17);

  -[CKDetailsMacChangeGroupNameCell contentView](self, "contentView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "bounds");
  v35 = v34;
  v37 = v36;
  v39 = v38;

  v40 = v26;
  v41 = v27;
  v42 = v15;
  v43 = v17;
  if (v3)
  {
    v44 = CGRectGetMinX(*(CGRect *)&v40) + -10.0;
  }
  else
  {
    v35 = CGRectGetMaxX(*(CGRect *)&v40) + 10.0;
    v37 = v37 + 6.0;
    -[CKDetailsMacChangeGroupNameCell contentView](self, "contentView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "bounds");
    v44 = v46 - v35;

  }
  -[CKDetailsMacChangeGroupNameCell changeNameLabel](self, "changeNameLabel");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setFrame:", v35, v37, v44, v39);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  objc_super v9;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (CKIsRunningInMacCatalyst())
  {
    v6 = 60.0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CKDetailsMacChangeGroupNameCell;
    -[CKDetailsMacChangeGroupNameCell sizeThatFits:](&v9, sel_sizeThatFits_, width, height);
    width = v7;
  }
  v8 = width;
  result.height = v6;
  result.width = v8;
  return result;
}

- (UIImageView)cellGlpyh
{
  return self->_cellGlpyh;
}

- (void)setCellGlpyh:(id)a3
{
  objc_storeStrong((id *)&self->_cellGlpyh, a3);
}

- (UILabel)changeNameLabel
{
  return self->_changeNameLabel;
}

- (void)setChangeNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_changeNameLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeNameLabel, 0);
  objc_storeStrong((id *)&self->_cellGlpyh, 0);
}

@end
