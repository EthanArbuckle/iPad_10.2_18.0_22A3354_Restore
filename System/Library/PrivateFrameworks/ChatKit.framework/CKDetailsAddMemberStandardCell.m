@implementation CKDetailsAddMemberStandardCell

+ (double)preferredHeight
{
  return 44.0;
}

- (CKDetailsAddMemberStandardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CKDetailsAddMemberStandardCell *v4;
  id v5;
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
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)CKDetailsAddMemberStandardCell;
  v4 = -[CKDetailsAddMemberCell initWithStyle:reuseIdentifier:](&v36, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0CEA658]);
    v6 = (void *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[CKDetailsAddMemberStandardCell setAddIcon:](v4, "setAddIcon:", v6);

    -[CKDetailsAddMemberStandardCell addIcon](v4, "addIcon");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", 0);

    -[CKDetailsAddMemberStandardCell addIcon](v4, "addIcon");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setContentMode:", 4);

    -[CKDetailsAddMemberStandardCell addIcon](v4, "addIcon");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("plus"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0CEA650];
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "configurationWithFont:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageWithConfiguration:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setImage:", v14);

    -[CKDetailsAddMemberStandardCell addIcon](v4, "addIcon");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "theme");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "detailsTextColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTintColor:", v18);

    -[CKDetailsAddMemberStandardCell addIcon](v4, "addIcon");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "detailsAddButtonDiameter");
    v22 = v21;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "detailsAddButtonDiameter");
    objc_msgSend(v19, "setBounds:", 0.0, 0.0, v22, v24);

    -[CKDetailsAddMemberStandardCell addIcon](v4, "addIcon");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "theme");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "detailsAddButtonBackgroundColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setBackgroundColor:", v28);

    -[CKDetailsAddMemberStandardCell addIcon](v4, "addIcon");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "detailsAddButtonDiameter");
    objc_msgSend(v30, "setCornerRadius:", v32 * 0.5);

    -[CKDetailsAddMemberStandardCell contentView](v4, "contentView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsAddMemberStandardCell addIcon](v4, "addIcon");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addSubview:", v34);

  }
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
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
  void *v52;
  double v53;
  void *v54;
  void *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  double v63;
  double v64;
  void *v65;
  double v66;
  double v67;
  void *v68;
  double v69;
  double v70;
  double v71;
  void *v72;
  double v73;
  void *v74;
  objc_super v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;

  v75.receiver = self;
  v75.super_class = (Class)CKDetailsAddMemberStandardCell;
  -[CKDetailsCell layoutSubviews](&v75, sel_layoutSubviews);
  -[CKDetailsAddMemberStandardCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutMargins");
  v5 = v4;
  v7 = v6;

  v8 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
  -[CKDetailsAddMemberStandardCell addIcon](self, "addIcon");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sizeToFit");

  -[CKDetailsAddMemberStandardCell addIcon](self, "addIcon");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v12 = v11;
  v14 = v13;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "detailsAddButtonDiameter");
  v17 = v16;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "detailsAddButtonDiameter");
  v20 = v19;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "detailsContactAvatarLabelSpacing");
  v23 = v22;

  if (v8)
  {
    -[CKDetailsAddMemberStandardCell contentView](self, "contentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "bounds");
    v26 = v25 - v7;
    v76.origin.x = v12;
    v76.origin.y = v14;
    v76.size.width = v20;
    v76.size.height = v17;
    v27 = v26 - CGRectGetWidth(v76);
    -[CKDetailsAddMemberStandardCell bounds](self, "bounds");
    v29 = v28;
    v77.origin.x = v12;
    v77.origin.y = v14;
    v77.size.width = v20;
    v77.size.height = v17;
    v30 = (v29 - CGRectGetHeight(v77)) * 0.5;
    if (CKMainScreenScale_once_7 != -1)
      dispatch_once(&CKMainScreenScale_once_7, &__block_literal_global_12);
    v31 = *(double *)&CKMainScreenScale_sMainScreenScale_7;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_7 == 0.0)
      v31 = 1.0;
    v32 = floor(v27 * v31) / v31;
    v33 = floor(v30 * v31) / v31;

  }
  else
  {
    v34 = v5 + 0.0;
    -[CKDetailsAddMemberStandardCell bounds](self, "bounds");
    v36 = v35;
    v78.origin.x = v12;
    v78.origin.y = v14;
    v78.size.width = v20;
    v78.size.height = v17;
    v37 = (v36 - CGRectGetHeight(v78)) * 0.5;
    if (CKMainScreenScale_once_7 != -1)
      dispatch_once(&CKMainScreenScale_once_7, &__block_literal_global_12);
    v38 = *(double *)&CKMainScreenScale_sMainScreenScale_7;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_7 == 0.0)
      v38 = 1.0;
    v32 = floor(v34 * v38) / v38;
    v33 = floor(v37 * v38) / v38;
  }
  -[CKDetailsAddMemberStandardCell addIcon](self, "addIcon");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setFrame:", v32, v33, v20, v17);

  -[CKDetailsAddMemberStandardCell contentView](self, "contentView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "bounds");
  v42 = v41;
  v44 = v43;
  v46 = v45;

  v47 = v32;
  v48 = v33;
  v49 = v20;
  v50 = v17;
  if (v8)
  {
    v51 = CGRectGetMinX(*(CGRect *)&v47) - v23;
  }
  else
  {
    v42 = v23 + CGRectGetMaxX(*(CGRect *)&v47);
    -[CKDetailsAddMemberStandardCell contentView](self, "contentView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "bounds");
    v51 = v53 - v42;

  }
  -[CKDetailsAddMemberCell addLabel](self, "addLabel");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setFrame:", v42, v44, v51, v46);

  -[CKDetailsCell topSeperator](self, "topSeperator");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "frame");
  v57 = v56;
  v59 = v58;
  v61 = v60;

  -[CKDetailsAddMemberStandardCell contentView](self, "contentView");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "layoutMargins");
  v64 = v63;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "detailsContactAvatarLabelSpacing");
  v67 = v64 + v66;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "detailsViewContactImageDiameter");
  v70 = v67 + v69;

  v71 = v70;
  if (v8)
  {
    -[CKDetailsAddMemberStandardCell contentView](self, "contentView");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "layoutMargins");
    v71 = v73;

  }
  -[CKDetailsCell topSeperator](self, "topSeperator");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "setFrame:", v71, v57, v59 - v70, v61);

}

- (void)setEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v3 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CKDetailsAddMemberStandardCell;
  -[CKDetailsAddMemberCell setEnabled:](&v14, sel_setEnabled_);
  -[CKDetailsAddMemberStandardCell addIcon](self, "addIcon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("plus"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "theme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v3)
  {
    objc_msgSend(v8, "detailsTextColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_flatImageWithColor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImage:", v11);

  }
  else
  {
    objc_msgSend(v8, "lightGrayColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_flatImageWithColor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImage:", v13);

    -[CKDetailsAddMemberStandardCell addIcon](self, "addIcon");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "theme");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lightGrayColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTintColor:", v9);
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  width = a3.width;
  v4 = objc_alloc(+[CKDetailsContactsTableViewCell cellClass](CKDetailsContactsTableViewCell, "cellClass", a3.width, a3.height));
  v5 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v5, "sizeThatFits:", width, 3.40282347e38);
  v7 = v6;

  v8 = width;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (UIImageView)addIcon
{
  return self->_addIcon;
}

- (void)setAddIcon:(id)a3
{
  objc_storeStrong((id *)&self->_addIcon, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addIcon, 0);
}

@end
