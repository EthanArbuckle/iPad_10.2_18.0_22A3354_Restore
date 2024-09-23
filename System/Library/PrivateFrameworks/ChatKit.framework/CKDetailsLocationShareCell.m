@implementation CKDetailsLocationShareCell

+ (id)identifier
{
  return CFSTR("offer_time_remaining_cell");
}

- (CKDetailsLocationShareCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CKDetailsLocationShareCell *v4;
  CKDetailsLocationShareCell *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CKStandardButton *v13;
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
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  objc_super v40;
  _QWORD v41[5];

  v41[4] = *MEMORY[0x1E0C80C00];
  v40.receiver = self;
  v40.super_class = (Class)CKDetailsLocationShareCell;
  v4 = -[CKTranscriptDetailsResizableCell initWithStyle:reuseIdentifier:](&v40, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[CKDetailsLocationShareCell detailTextLabel](v4, "detailTextLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsLocationShareCell setTimeRemainingLabel:](v5, "setTimeRemainingLabel:", v6);

    -[CKDetailsLocationShareCell timeRemainingLabel](v5, "timeRemainingLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "theme");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "secondaryLabelColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTextColor:", v10);

    -[CKDetailsLocationShareCell textLabel](v5, "textLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setNumberOfLines:", 0);

    -[CKDetailsLocationShareCell textLabel](v5, "textLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLineBreakMode:", 0);

    v13 = objc_alloc_init(CKStandardButton);
    -[CKDetailsLocationShareCell setButton:](v5, "setButton:", v13);

    -[CKDetailsLocationShareCell button](v5, "button");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[CKDetailsLocationShareCell button](v5, "button");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setContextMenuIsPrimary:", 1);

    -[CKDetailsLocationShareCell menu](v5, "menu");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsLocationShareCell button](v5, "button");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setMenu:", v16);

    -[CKDetailsLocationShareCell menu](v5, "menu");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsLocationShareCell button](v5, "button");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setHidden:", v18 == 0);

    -[CKDetailsLocationShareCell button](v5, "button");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsLocationShareCell addSubview:](v5, "addSubview:", v20);

    v32 = (void *)MEMORY[0x1E0CB3718];
    -[CKDetailsLocationShareCell button](v5, "button");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "leftAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsLocationShareCell leftAnchor](v5, "leftAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v37);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v36;
    -[CKDetailsLocationShareCell button](v5, "button");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "rightAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsLocationShareCell rightAnchor](v5, "rightAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v33);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v41[1] = v31;
    -[CKDetailsLocationShareCell button](v5, "button");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsLocationShareCell topAnchor](v5, "topAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v41[2] = v24;
    -[CKDetailsLocationShareCell button](v5, "button");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "bottomAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsLocationShareCell bottomAnchor](v5, "bottomAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v41[3] = v28;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 4);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "activateConstraints:", v29);

  }
  return v5;
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKDetailsLocationShareCell;
  -[CKDetailsCell layoutSubviews](&v4, sel_layoutSubviews);
  -[CKDetailsLocationShareCell timeRemainingLabel](self, "timeRemainingLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", -[CKDetailsLocationShareCell showOfferTimeRemaining](self, "showOfferTimeRemaining") ^ 1);

}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKDetailsLocationShareCell;
  -[CKDetailsCell prepareForReuse](&v7, sel_prepareForReuse);
  -[CKDetailsLocationShareCell setShowOfferTimeRemaining:](self, "setShowOfferTimeRemaining:", 0);
  -[CKDetailsLocationShareCell timeRemainingLabel](self, "timeRemainingLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", &stru_1E276D870);

  -[CKDetailsLocationShareCell textLabel](self, "textLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", &stru_1E276D870);

  -[CKDetailsLocationShareCell setMenu:](self, "setMenu:", 0);
  -[CKDetailsLocationShareCell menu](self, "menu");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsLocationShareCell button](self, "button");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", v5 == 0);

}

- (void)setMenu:(id)a3
{
  void *v5;
  void *v6;
  UIMenu *v7;

  v7 = (UIMenu *)a3;
  if (self->_menu != v7)
  {
    objc_storeStrong((id *)&self->_menu, a3);
    -[CKDetailsLocationShareCell button](self, "button");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMenu:", v7);

    -[CKDetailsLocationShareCell button](self, "button");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", v7 == 0);

  }
}

- (void)setShowOfferTimeRemaining:(BOOL)a3
{
  if (self->_showOfferTimeRemaining != a3)
  {
    self->_showOfferTimeRemaining = a3;
    -[CKDetailsLocationShareCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setOfferTimeRemaining:(double)a3
{
  void *v5;
  void *v6;

  if (self->_offerTimeRemaining != a3)
  {
    self->_offerTimeRemaining = a3;
    if (-[CKDetailsLocationShareCell showOfferTimeRemaining](self, "showOfferTimeRemaining"))
    {
      -[CKDetailsLocationShareCell timeRemainingLabel](self, "timeRemainingLabel");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsLocationShareCell timeStringForTimeInterval:](self, "timeStringForTimeInterval:", a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setText:", v6);

      -[CKDetailsLocationShareCell setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (id)timeStringForTimeInterval:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __CFString *v15;
  uint64_t v16;
  void *v17;

  v3 = (uint64_t)a3;
  if ((unint64_t)((uint64_t)a3 + 3599) >= 0x1C1F)
  {
    v4 = v3 / 3600;
    v5 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("OFFER_TIME_REMAINING_HOURS");
  }
  else
  {
    v4 = v3 / 60 % 60;
    if (!v4)
    {
      CKFrameworkBundle();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("OFFER_TIME_REMAINING_LESS_THAN_ONE_MINUTE"), &stru_1E276D870, CFSTR("ChatKit"));
      v16 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    v5 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("OFFER_TIME_REMAINING_MINUTES");
  }
  objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_1E276D870, CFSTR("ChatKit"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  CKLocalizedStringForNumber(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "userInterfaceLayoutDirection");

  if (v14 == 1)
    v15 = CFSTR("\u200F");
  else
    v15 = CFSTR("\u200E");
  -[__CFString stringByAppendingString:](v15, "stringByAppendingString:", v12);
  v16 = objc_claimAutoreleasedReturnValue();
LABEL_10:
  v17 = (void *)v16;

  return v17;
}

- (UIMenu)menu
{
  return self->_menu;
}

- (BOOL)showOfferTimeRemaining
{
  return self->_showOfferTimeRemaining;
}

- (double)offerTimeRemaining
{
  return self->_offerTimeRemaining;
}

- (CKStandardButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (UILabel)timeRemainingLabel
{
  return self->_timeRemainingLabel;
}

- (void)setTimeRemainingLabel:(id)a3
{
  objc_storeStrong((id *)&self->_timeRemainingLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeRemainingLabel, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_menu, 0);
}

@end
