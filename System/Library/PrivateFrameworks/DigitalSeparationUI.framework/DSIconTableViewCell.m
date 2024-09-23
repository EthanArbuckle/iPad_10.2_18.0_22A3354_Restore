@implementation DSIconTableViewCell

+ (id)iconTableViewCellFromTableView:(id)a3 withText:(id)a4 detail:(id)a5 icon:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("DSCell"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "textLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setText:", v12);

    objc_msgSend(v14, "detailTextLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setText:", v11);

    if (v10)
    {
      objc_msgSend(v14, "imageView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setImage:", v10);

    }
    v18 = v14;
  }
  else
  {
    v18 = (id)objc_msgSend(objc_alloc((Class)a1), "initWithText:detail:icon:", v12, v11, v10);

  }
  return v18;
}

+ (id)iconTableViewCellFromTableView:(id)a3 withRightAlignedLabel:(id)a4 detail:(id)a5 icon:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("DSCellRightAligned"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "textLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setText:", v12);

    objc_msgSend(v14, "detailTextLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setText:", v11);

    if (v10)
    {
      objc_msgSend(v14, "imageView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setImage:", v10);

    }
    v18 = v14;
  }
  else
  {
    v18 = (id)objc_msgSend(objc_alloc((Class)a1), "initWithRightAlignedLabel:detail:icon:", v12, v11, v10);

  }
  return v18;
}

+ (id)iconTableViewCellFromTableView:(id)a3 withContentConfigurationText:(id)a4 detail:(id)a5 icon:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("DSCellWithContentConfiguration"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "defaultContentConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setText:", v12);

    objc_msgSend(v15, "setSecondaryText:", v11);
    if (v10)
      objc_msgSend(v15, "setImage:", v10);
    objc_msgSend(v14, "setContentConfiguration:", v15);
    v16 = v14;
  }
  else
  {
    v16 = (id)objc_msgSend(objc_alloc((Class)a1), "initWithContentConfigurationForText:detail:icon:", v12, v11, v10);

    v15 = v12;
  }

  return v16;
}

- (DSIconTableViewCell)initWithText:(id)a3 detail:(id)a4 icon:(id)a5
{
  id v8;
  id v9;
  id v10;
  DSIconTableViewCell *v11;
  DSIconTableViewCell *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)DSIconTableViewCell;
  v11 = -[DSIconTableViewCell initWithStyle:reuseIdentifier:](&v17, sel_initWithStyle_reuseIdentifier_, 3, CFSTR("DSCell"));
  v12 = v11;
  if (v11)
  {
    -[DSIconTableViewCell textLabel](v11, "textLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setText:", v8);

    -[DSIconTableViewCell detailTextLabel](v12, "detailTextLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setText:", v9);

    -[DSIconTableViewCell imageView](v12, "imageView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setImage:", v10);

    -[DSIconTableViewCell customizeProperties](v12, "customizeProperties");
  }

  return v12;
}

- (DSIconTableViewCell)initWithRightAlignedLabel:(id)a3 detail:(id)a4 icon:(id)a5
{
  id v8;
  id v9;
  id v10;
  DSIconTableViewCell *v11;
  DSIconTableViewCell *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)DSIconTableViewCell;
  v11 = -[DSIconTableViewCell initWithStyle:reuseIdentifier:](&v17, sel_initWithStyle_reuseIdentifier_, 1, CFSTR("DSCellRightAligned"));
  v12 = v11;
  if (v11)
  {
    -[DSIconTableViewCell textLabel](v11, "textLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setText:", v8);

    -[DSIconTableViewCell detailTextLabel](v12, "detailTextLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setText:", v9);

    -[DSIconTableViewCell imageView](v12, "imageView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setImage:", v10);

    -[DSIconTableViewCell customizeProperties](v12, "customizeProperties");
  }

  return v12;
}

- (DSIconTableViewCell)initWithContentConfigurationForText:(id)a3 detail:(id)a4 icon:(id)a5
{
  id v8;
  id v9;
  id v10;
  DSIconTableViewCell *v11;
  DSIconTableViewCell *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)DSIconTableViewCell;
  v11 = -[DSIconTableViewCell initWithStyle:reuseIdentifier:](&v16, sel_initWithStyle_reuseIdentifier_, 3, CFSTR("DSCellWithContentConfiguration"));
  v12 = v11;
  if (v11)
  {
    -[DSIconTableViewCell contentConfigurationWithText:secondaryText:icon:](v11, "contentConfigurationWithText:secondaryText:icon:", v8, v9, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSIconTableViewCell setContentConfiguration:](v12, "setContentConfiguration:", v13);

    objc_msgSend(MEMORY[0x24BEBD4B8], "tertiarySystemFillColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSIconTableViewCell setBackgroundColor:](v12, "setBackgroundColor:", v14);

    -[DSIconTableViewCell setIsAccessibilityElement:](v12, "setIsAccessibilityElement:", 1);
  }

  return v12;
}

- (void)customizeProperties
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

  -[DSIconTableViewCell textLabel](self, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNumberOfLines:", 0);

  -[DSIconTableViewCell textLabel](self, "textLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLineBreakMode:", 0);

  -[DSIconTableViewCell detailTextLabel](self, "detailTextLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSIconTableViewCell subtitleFont](self, "subtitleFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v6);

  -[DSIconTableViewCell detailTextLabel](self, "detailTextLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextColor:", v8);

  -[DSIconTableViewCell detailTextLabel](self, "detailTextLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNumberOfLines:", 0);

  -[DSIconTableViewCell detailTextLabel](self, "detailTextLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLineBreakMode:", 0);

  objc_msgSend(MEMORY[0x24BEBD4B8], "tertiarySystemFillColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSIconTableViewCell setBackgroundColor:](self, "setBackgroundColor:", v11);

  -[DSIconTableViewCell setIsAccessibilityElement:](self, "setIsAccessibilityElement:", 1);
}

- (void)willTransitionToState:(unint64_t)a3
{
  char v3;
  id v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)DSIconTableViewCell;
  -[DSIconTableViewCell willTransitionToState:](&v7, sel_willTransitionToState_);
  if ((v3 & 1) != 0)
  {
    v5 = objc_alloc_init(MEMORY[0x24BEBDB00]);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v6);

    -[DSIconTableViewCell setSelectedBackgroundView:](self, "setSelectedBackgroundView:", v5);
  }
}

- (id)subtitleFont
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BEBD5E8], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x24BEBE220]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontDescriptorWithSymbolicTraits:", 0x8000);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD5E0], "fontWithDescriptor:size:", v3, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)contentConfigurationWithText:(id)a3 secondaryText:(id)a4 icon:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
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

  v8 = (void *)MEMORY[0x24BEBD728];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "subtitleCellConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v11);

  objc_msgSend(v12, "textProperties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setNumberOfLines:", 1);

  objc_msgSend(v12, "textProperties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAdjustsFontSizeToFitWidth:", 1);

  objc_msgSend(v12, "setSecondaryText:", v10);
  objc_msgSend(v12, "secondaryTextProperties");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setNumberOfLines:", 1);

  objc_msgSend(v12, "secondaryTextProperties");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAdjustsFontSizeToFitWidth:", 1);

  -[DSIconTableViewCell subtitleFont](self, "subtitleFont");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "secondaryTextProperties");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFont:", v17);

  objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "secondaryTextProperties");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setColor:", v19);

  objc_msgSend(v12, "setImage:", v9);
  objc_msgSend(v12, "imageProperties");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setMaximumSize:", 48.0, 48.0);

  objc_msgSend(v12, "setImageToTextPadding:", 8.0);
  objc_msgSend(v12, "directionalLayoutMargins");
  objc_msgSend(v12, "setDirectionalLayoutMargins:");
  return v12;
}

@end
