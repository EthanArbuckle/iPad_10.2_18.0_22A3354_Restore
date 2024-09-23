@implementation PKMathContextMenuPreviewView

- (PKMathContextMenuPreviewView)initWithImage:(id)a3 label:(id)a4 attributionImage:(id)a5 lastRefreshDate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  PKMathContextMenuPreviewView *v14;
  void *v15;
  id *p_imageView;
  id *p_label;
  UILabel *v18;
  UILabel *dateLabel;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  double v29;
  uint64_t v30;
  UIImageView *attrImageView;
  double v32;
  double v33;
  objc_super v35;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v35.receiver = self;
  v35.super_class = (Class)PKMathContextMenuPreviewView;
  v14 = -[PKMathContextMenuPreviewView initWithFrame:](&v35, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v14)
  {
    if (v10)
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v10);
    else
      v15 = 0;
    p_imageView = (id *)&v14->_imageView;
    objc_storeStrong((id *)&v14->_imageView, v15);
    if (v10)

    p_label = (id *)&v14->_label;
    objc_storeStrong((id *)&v14->_label, a4);
    if (v13)
    {
      v18 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
      dateLabel = v14->_dateLabel;
      v14->_dateLabel = v18;

      objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v14->_dateLabel, "setFont:", v20);

      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v14->_dateLabel, "setTextColor:", v21);

      -[UILabel setTextAlignment:](v14->_dateLabel, "setTextAlignment:", 1);
      -[UILabel setNumberOfLines:](v14->_dateLabel, "setNumberOfLines:", 1);
      v22 = objc_alloc_init(MEMORY[0x1E0CB38F0]);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v23 = v11;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "localizedStringForDate:relativeToDate:", v13, v24);
      v25 = v10;
      v26 = v12;
      v27 = v13;
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](v14->_dateLabel, "setText:", v28);

      v13 = v27;
      v12 = v26;
      v10 = v25;

      v11 = v23;
      p_imageView = (id *)&v14->_imageView;
      -[UILabel sizeToFit](v14->_dateLabel, "sizeToFit");

    }
    if (v12)
    {
      objc_msgSend(v12, "size");
      if (v29 > 0.0)
      {
        v30 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v12);
        attrImageView = v14->_attrImageView;
        v14->_attrImageView = (UIImageView *)v30;

        -[UIImageView setContentMode:](v14->_attrImageView, "setContentMode:", 0);
      }
    }
    -[PKMathContextMenuPreviewView setTranslatesAutoresizingMaskIntoConstraints:](v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(*p_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(*p_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v14->_attrImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v14->_dateLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    if (*p_imageView)
      -[PKMathContextMenuPreviewView addSubview:](v14, "addSubview:");
    if (*p_label)
      -[PKMathContextMenuPreviewView addSubview:](v14, "addSubview:");
    if (v14->_attrImageView)
      -[PKMathContextMenuPreviewView addSubview:](v14, "addSubview:");
    if (v14->_dateLabel)
      -[PKMathContextMenuPreviewView addSubview:](v14, "addSubview:");
    v32 = -[PKMathContextMenuPreviewView p_layoutSubviews]((id *)&v14->super.super.super.isa);
    -[PKMathContextMenuPreviewView setFrame:](v14, "setFrame:", 0.0, 0.0, v32, v33);
  }

  return v14;
}

- (double)p_layoutSubviews
{
  void *v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double *v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  id v23;
  id v24;
  double v25;
  double v26;
  double v27;
  int *v28;
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
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  id v49;
  double v50;
  double v51;
  double v52;
  double v53;
  id v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v62;
  double v63;

  if (!a1)
    return 0.0;
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pointSize");
  v4 = v3;

  v5 = v4 * 0.5;
  objc_msgSend(a1[52], "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "size");
  v8 = v7;
  v10 = v9;

  v11 = (double *)MEMORY[0x1E0C9D538];
  objc_msgSend(a1[53], "sizeToFit");
  objc_msgSend(a1[55], "sizeToFit");
  v12 = a1[54];
  if (v12)
  {
    objc_msgSend(v12, "image");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "size");
    v15 = v14;
    v17 = v16;

    v18 = -[PKMathContextMenuPreviewView p_attributionImageHeight]();
    objc_msgSend(a1[54], "setFrame:", 0.0, 0.0, v18 * (v15 / v17), v18);
  }
  v19 = v5 + 2.0;
  v21 = *v11;
  v20 = v11[1];
  v22 = a1[52];
  if (v22)
  {
    v23 = a1[54];
    if (v23)
    {
      v63 = v11[1];
      v24 = a1[55];
      objc_msgSend(v23, "bounds");
      v27 = v26;
      if (v24)
      {
        v28 = &OBJC_IVAR___PKMathContextMenuPreviewView__dateLabel;
        objc_msgSend(a1[55], "bounds");
        if (v27 >= v29)
          v30 = v27;
        else
          v30 = v29;
        objc_msgSend(a1[54], "bounds");
        v32 = v31;
        objc_msgSend(a1[55], "bounds");
        v34 = v32 + v33 + 48.0;
        v62 = v10 + v30 + 4.0;
        v35 = 0.0;
        if (v10 > v19 + v19)
          v35 = v19 + -2.0;
        v36 = v10 - v35;
        if (v34 <= v8)
        {
          v37 = v8;
        }
        else
        {
          v21 = (v34 - v8) * 0.5;
          v37 = v34;
        }
        v38 = v36 + 4.0;
        objc_msgSend(a1[54], "bounds", *(_QWORD *)&v62);
        v40 = v39;
        objc_msgSend(a1[54], "bounds");
        objc_msgSend(a1[54], "setFrame:", 12.0, v38, v40);
        objc_msgSend(a1[55], "bounds");
        v42 = v41;
        v44 = v43;
        v45 = -[PKMathContextMenuPreviewView p_attributionImageHeight]() * -0.15;
        v48 = v37 - v42 + -12.0;
      }
      else
      {
        v57 = v25 + 24.0;
        v58 = 0.0;
        if (v10 > v19 + v19)
          v58 = v19 + -2.0;
        v38 = v10 - v58;
        if (v57 > v8)
          v48 = 12.0;
        else
          v48 = (v8 - v57) * 0.5 + 12.0;
        if (v57 <= v8)
        {
          v37 = v8;
        }
        else
        {
          v21 = (v57 - v8) * 0.5;
          v37 = v57;
        }
        v28 = &OBJC_IVAR___PKMathContextMenuPreviewView__attrImageView;
        objc_msgSend(a1[54], "bounds", v10 + v26 + 8.0);
        v42 = v59;
        v44 = v60;
        v45 = 4.0;
      }
      v56 = v38 + v45;
LABEL_45:
      objc_msgSend(*(id *)((char *)a1 + *v28), "setFrame:", v48, v56, v42, v44, v46, v47);
      v22 = a1[52];
      v20 = v63;
      goto LABEL_46;
    }
  }
  v49 = a1[53];
  if (v49)
  {
    v63 = v11[1];
    objc_msgSend(v49, "bounds");
    v42 = v50 + 24.0;
    v51 = v19 + -2.0;
    v44 = v19 + -2.0 + v52;
    if (v10 <= v19 + v19)
      v51 = 0.0;
    v53 = v10 - v51;
    v54 = a1[52];
    v46 = (v8 - v42) * 0.5;
    v47 = (v42 - v8) * 0.5;
    if (v42 <= v8)
      v47 = v21;
    else
      v46 = 0.0;
    if (v42 > v8)
      v55 = v50 + 24.0;
    else
      v55 = v8;
    v28 = &OBJC_IVAR___PKMathContextMenuPreviewView__label;
    if (v54)
      v48 = v46;
    else
      v48 = 0.0;
    if (v54)
      v56 = v53;
    else
      v56 = v19;
    if (v54)
    {
      v21 = v47;
      v37 = v55;
    }
    else
    {
      v37 = v50 + 24.0;
    }
    goto LABEL_45;
  }
  v37 = v8;
LABEL_46:
  objc_msgSend(v22, "setFrame:", v21, v20, v8, v10);
  return v37;
}

+ (UIFont)footnoteBoldFont
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v2, "fontDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fontDescriptorWithSymbolicTraits:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pointSize");
  objc_msgSend(v3, "fontWithDescriptor:size:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v6;
}

- (double)p_attributionImageHeight
{
  void *v0;
  double v1;
  double v2;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pointSize");
  v2 = v1;

  return v2;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKMathContextMenuPreviewView;
  -[PKMathContextMenuPreviewView layoutSubviews](&v3, sel_layoutSubviews);
  -[PKMathContextMenuPreviewView p_layoutSubviews]((id *)&self->super.super.super.isa);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateLabel, 0);
  objc_storeStrong((id *)&self->_attrImageView, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
