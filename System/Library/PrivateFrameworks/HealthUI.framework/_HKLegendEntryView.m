@implementation _HKLegendEntryView

- (_HKLegendEntryView)initWithLegendEntry:(id)a3
{
  id v4;
  _HKLegendEntryView *v5;
  _HKLegendEntryView *v6;
  double v7;
  double v8;
  _HKLegendDot *v9;
  _HKLegendDot *legendDot;
  uint64_t v11;
  UIImageView *legendIcon;
  UILabel *v13;
  UILabel *legendLabel;
  void *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_HKLegendEntryView;
  v5 = -[_HKLegendEntryView initWithArrangedSubviews:](&v17, sel_initWithArrangedSubviews_, MEMORY[0x1E0C9AA60]);
  v6 = v5;
  if (v5)
  {
    -[_HKLegendEntryView setAlignment:](v5, "setAlignment:", 3);
    -[_HKLegendEntryView setDistribution:](v6, "setDistribution:", 0);
    -[_HKLegendEntryView setAxis:](v6, "setAxis:", 0);
    -[_HKLegendEntryView setSpacing:](v6, "setSpacing:", 5.0);
    LODWORD(v7) = 1144750080;
    -[_HKLegendEntryView setContentHuggingPriority:forAxis:](v6, "setContentHuggingPriority:forAxis:", 0, v7);
    LODWORD(v8) = 1144750080;
    -[_HKLegendEntryView setContentHuggingPriority:forAxis:](v6, "setContentHuggingPriority:forAxis:", 1, v8);
    v9 = objc_alloc_init(_HKLegendDot);
    legendDot = v6->_legendDot;
    v6->_legendDot = v9;

    -[_HKLegendEntryView addArrangedSubview:](v6, "addArrangedSubview:", v6->_legendDot);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", 0);
    legendIcon = v6->_legendIcon;
    v6->_legendIcon = (UIImageView *)v11;

    -[_HKLegendEntryView addArrangedSubview:](v6, "addArrangedSubview:", v6->_legendIcon);
    v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    legendLabel = v6->_legendLabel;
    v6->_legendLabel = v13;

    objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartAxisLabelFont");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v6->_legendLabel, "setFont:", v15);

    -[_HKLegendEntryView addArrangedSubview:](v6, "addArrangedSubview:", v6->_legendLabel);
    -[_HKLegendEntryView setLegendEntry:](v6, "setLegendEntry:", v4);
  }

  return v6;
}

- (void)setLegendEntry:(id)a3
{
  HKLegendEntry **p_currentLegendEntry;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  UIImageView *legendIcon;
  void *v21;
  void *v22;
  UIImageView *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  id v37;

  p_currentLegendEntry = &self->_currentLegendEntry;
  v37 = a3;
  if (-[HKLegendEntry isEqual:](*p_currentLegendEntry, "isEqual:"))
    goto LABEL_22;
  -[HKLegendEntry title](*p_currentLegendEntry, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", v7) & 1) != 0)
  {
    -[HKLegendEntry labelColor](*p_currentLegendEntry, "labelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "labelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if (v10)
      goto LABEL_10;
  }
  else
  {

  }
  objc_msgSend(v37, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_legendLabel, "setText:", v11);

  objc_msgSend(v37, "labelColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[UILabel setTextColor:](self->_legendLabel, "setTextColor:", v12);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_legendLabel, "setTextColor:", v13);

  }
  -[UILabel sizeToFit](self->_legendLabel, "sizeToFit");
LABEL_10:
  -[UILabel text](self->_legendLabel, "text");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setHidden:](self->_legendLabel, "setHidden:", objc_msgSend(v14, "length") == 0);

  -[HKLegendEntry icon](*p_currentLegendEntry, "icon");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "icon");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15 != v16)
  {

    v17 = v37;
LABEL_13:
    legendIcon = self->_legendIcon;
    objc_msgSend(v17, "iconTint");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](legendIcon, "setTintColor:", v21);

    objc_msgSend(v37, "iconTint");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = self->_legendIcon;
    objc_msgSend(v37, "icon");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v22)
    {
      objc_msgSend(v24, "imageWithRenderingMode:", 2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setImage:](v23, "setImage:", v26);

    }
    else
    {
      -[UIImageView setImage:](v23, "setImage:", v24);
    }

    v17 = v37;
    goto LABEL_17;
  }
  -[HKLegendEntry iconTint](*p_currentLegendEntry, "iconTint");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "iconTint");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = v37;
  if (v18 != v19)
    goto LABEL_13;
LABEL_17:
  objc_msgSend(v17, "icon");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setHidden:](self->_legendIcon, "setHidden:", v27 == 0);

  -[HKLegendEntry dotColor](*p_currentLegendEntry, "dotColor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "dotColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v28, "isEqual:", v29);

  if ((v30 & 1) == 0)
  {
    objc_msgSend(v37, "dotColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKLegendDot setDotColor:](self->_legendDot, "setDotColor:", v31);

  }
  -[HKLegendEntry innerDotColor](*p_currentLegendEntry, "innerDotColor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "innerDotColor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v32, "isEqual:", v33);

  if ((v34 & 1) == 0)
  {
    objc_msgSend(v37, "innerDotColor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKLegendDot setInnerDotColor:](self->_legendDot, "setInnerDotColor:", v35);

  }
  objc_msgSend(v37, "dotColor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKLegendDot setHidden:](self->_legendDot, "setHidden:", v36 == 0);

  objc_storeStrong((id *)&self->_currentLegendEntry, a3);
LABEL_22:

}

- (HKLegendEntry)legendEntry
{
  return self->_legendEntry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legendEntry, 0);
  objc_storeStrong((id *)&self->_legendIcon, 0);
  objc_storeStrong((id *)&self->_legendDot, 0);
  objc_storeStrong((id *)&self->_legendLabel, 0);
  objc_storeStrong((id *)&self->_currentLegendEntry, 0);
}

@end
