@implementation CKAbstractReviewTableViewCell

- (CKAbstractReviewTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CKAbstractReviewTableViewCell *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  UILabel *nameLabel;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  UILabel *lastModifiedLabel;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  UILabel *sizeLabel;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)CKAbstractReviewTableViewCell;
  v4 = -[CKAbstractReviewTableViewCell initWithStyle:reuseIdentifier:](&v28, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0CEA700]);
    v6 = *MEMORY[0x1E0C9D648];
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v10 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], v7, v8, v9);
    nameLabel = v4->_nameLabel;
    v4->_nameLabel = (UILabel *)v10;

    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 17.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_nameLabel, "setFont:", v12);

    -[UILabel setNumberOfLines:](v4->_nameLabel, "setNumberOfLines:", 1);
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_nameLabel, "setTextColor:", v13);

    -[CKAbstractReviewTableViewCell contentView](v4, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v4->_nameLabel);

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v6, v7, v8, v9);
    lastModifiedLabel = v4->_lastModifiedLabel;
    v4->_lastModifiedLabel = (UILabel *)v15;

    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 14.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_lastModifiedLabel, "setFont:", v17);

    -[UILabel setNumberOfLines:](v4->_lastModifiedLabel, "setNumberOfLines:", 1);
    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_lastModifiedLabel, "setTextColor:", v18);

    -[CKAbstractReviewTableViewCell contentView](v4, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSubview:", v4->_lastModifiedLabel);

    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v6, v7, v8, v9);
    sizeLabel = v4->_sizeLabel;
    v4->_sizeLabel = (UILabel *)v20;

    -[UILabel setTextAlignment:](v4->_sizeLabel, "setTextAlignment:", 2);
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 17.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_sizeLabel, "setFont:", v22);

    -[UILabel setNumberOfLines:](v4->_sizeLabel, "setNumberOfLines:", 1);
    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_sizeLabel, "setTextColor:", v23);

    -[CKAbstractReviewTableViewCell contentView](v4, "contentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addSubview:", v4->_sizeLabel);

    -[CKAbstractReviewTableViewCell contentView](v4, "contentView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAbstractReviewTableViewCell leftHandSideView](v4, "leftHandSideView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addSubview:", v26);

  }
  return v4;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKAbstractReviewTableViewCell;
  -[CKAbstractReviewTableViewCell prepareForReuse](&v3, sel_prepareForReuse);
  -[CKAbstractReviewTableViewCell setModelObject:](self, "setModelObject:", 0);
  -[CKAbstractReviewTableViewCell setSize:](self, "setSize:", 0);
}

- (void)setMainText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKAbstractReviewTableViewCell nameLabel](self, "nameLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (NSString)mainText
{
  void *v2;
  void *v3;

  -[CKAbstractReviewTableViewCell nameLabel](self, "nameLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setSubheadingText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKAbstractReviewTableViewCell lastModifiedLabel](self, "lastModifiedLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (NSString)subheadingText
{
  void *v2;
  void *v3;

  -[CKAbstractReviewTableViewCell lastModifiedLabel](self, "lastModifiedLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setSize:(unint64_t)a3
{
  void *v4;
  id v5;

  self->_size = a3;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", a3, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  -[CKAbstractReviewTableViewCell sizeLabel](self, "sizeLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v5);

  -[CKAbstractReviewTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  uint64_t v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  double v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  CGFloat v59;
  void *v60;
  double v61;
  double v62;
  void *v63;
  objc_super v64;
  CGRect v65;
  CGRect v66;

  v64.receiver = self;
  v64.super_class = (Class)CKAbstractReviewTableViewCell;
  -[CKAbstractReviewTableViewCell layoutSubviews](&v64, sel_layoutSubviews);
  objc_msgSend((id)objc_opt_class(), "leftHandSideViewSize");
  v4 = v3;
  v6 = v5;
  objc_msgSend((id)objc_opt_class(), "requestedHeight");
  v8 = (v7 - v6) * 0.5;
  -[CKAbstractReviewTableViewCell leftHandSideView](self, "leftHandSideView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFrame:", 15.0, v8, v4, v6);

  -[CKAbstractReviewTableViewCell contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v12 = (v11 + -15.0) * 0.5;
  -[CKAbstractReviewTableViewCell contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  v15 = v14;

  -[CKAbstractReviewTableViewCell sizeLabel](self, "sizeLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sizeThatFits:", v12, v15);
  v18 = v17;
  v20 = v19;

  -[CKAbstractReviewTableViewCell contentView](self, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "frame");
  v23 = v22 + -15.0 - v18;
  -[CKAbstractReviewTableViewCell contentView](self, "contentView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "frame");
  v26 = (v25 - v20) * 0.5;
  -[CKAbstractReviewTableViewCell sizeLabel](self, "sizeLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setFrame:", v23, v26, fmin(v18, v12), v20);

  -[CKAbstractReviewTableViewCell contentView](self, "contentView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "frame");
  v30 = v29;
  -[CKAbstractReviewTableViewCell leftHandSideView](self, "leftHandSideView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "frame");
  v33 = v30 - v32 + -15.0 + -20.0 - v18 + -15.0;
  -[CKAbstractReviewTableViewCell contentView](self, "contentView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "frame");
  v36 = v35 * 0.5;

  -[CKAbstractReviewTableViewCell subheadingText](self, "subheadingText");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "length");

  -[CKAbstractReviewTableViewCell nameLabel](self, "nameLabel");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "sizeThatFits:", v33, v36);
  v41 = v40;
  v43 = v42;

  -[CKAbstractReviewTableViewCell leftHandSideView](self, "leftHandSideView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "frame");
  v45 = CGRectGetMaxX(v65) + 10.0;
  -[CKAbstractReviewTableViewCell contentView](self, "contentView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "frame");
  v48 = v47;
  v49 = fmin(v33, v41);
  -[CKAbstractReviewTableViewCell nameLabel](self, "nameLabel");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v50;
  v52 = v48 * 0.5 - v43;
  if (!v38)
    v52 = (v48 - v43) * 0.5;
  objc_msgSend(v50, "setFrame:", v45, v52, v49, v43);

  -[CKAbstractReviewTableViewCell lastModifiedLabel](self, "lastModifiedLabel");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "sizeThatFits:", v33, v36);
  v55 = v54;
  v57 = v56;

  -[CKAbstractReviewTableViewCell leftHandSideView](self, "leftHandSideView");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "frame");
  v59 = CGRectGetMaxX(v66) + 10.0;
  -[CKAbstractReviewTableViewCell contentView](self, "contentView");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "frame");
  v62 = v61 * 0.5;
  -[CKAbstractReviewTableViewCell lastModifiedLabel](self, "lastModifiedLabel");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setFrame:", v59, v62, fmin(v33, v55), v57);

}

- (unint64_t)size
{
  return self->_size;
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_nameLabel, a3);
}

- (UILabel)lastModifiedLabel
{
  return self->_lastModifiedLabel;
}

- (void)setLastModifiedLabel:(id)a3
{
  objc_storeStrong((id *)&self->_lastModifiedLabel, a3);
}

- (UILabel)sizeLabel
{
  return self->_sizeLabel;
}

- (void)setSizeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_sizeLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizeLabel, 0);
  objc_storeStrong((id *)&self->_lastModifiedLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
}

@end
