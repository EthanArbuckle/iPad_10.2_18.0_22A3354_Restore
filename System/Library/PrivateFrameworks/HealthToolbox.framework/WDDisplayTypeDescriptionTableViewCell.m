@implementation WDDisplayTypeDescriptionTableViewCell

+ (NSString)defaultReuseIdentifier
{
  return (NSString *)CFSTR("WDDisplayTypeDescriptionTableViewCell");
}

- (WDDisplayTypeDescriptionTableViewCell)initWithDisplayType:(id)a3 showAttributionText:(BOOL)a4 reuseIdentifier:(id)a5
{
  id v8;
  WDDisplayTypeDescriptionTableViewCell *v9;
  WDDisplayTypeDescriptionTableViewCell *v10;
  objc_super v12;

  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WDDisplayTypeDescriptionTableViewCell;
  v9 = -[WDDisplayTypeDescriptionTableViewCell initWithStyle:reuseIdentifier:](&v12, sel_initWithStyle_reuseIdentifier_, 0, a5);
  v10 = v9;
  if (v9)
  {
    v9->_showAttributionText = a4;
    -[WDDisplayTypeDescriptionTableViewCell setDisplayType:](v9, "setDisplayType:", v8);
  }

  return v10;
}

- (WDDisplayTypeDescriptionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return -[WDDisplayTypeDescriptionTableViewCell initWithDisplayType:showAttributionText:reuseIdentifier:](self, "initWithDisplayType:showAttributionText:reuseIdentifier:", 0, 1, a4);
}

- (WDDisplayTypeDescriptionTableViewCell)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WDDisplayTypeDescriptionTableViewCell;
  return -[WDDisplayTypeDescriptionTableViewCell initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)setDisplayType:(id)a3
{
  objc_storeStrong((id *)&self->_displayType, a3);
  -[WDDisplayTypeDescriptionTableViewCell setupSubviews](self, "setupSubviews");
}

- (void)setupSubviews
{
  WDDisplayTypeDescriptionView *v3;
  void *v4;
  WDDisplayTypeDescriptionView *v5;
  WDDisplayTypeDescriptionView *descriptionView;
  void *v7;
  WDDisplayTypeDescriptionView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v3 = [WDDisplayTypeDescriptionView alloc];
  -[WDDisplayTypeDescriptionTableViewCell displayType](self, "displayType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WDDisplayTypeDescriptionView initWithDisplayType:showAttributionText:style:](v3, "initWithDisplayType:showAttributionText:style:", v4, -[WDDisplayTypeDescriptionTableViewCell showAttributionText](self, "showAttributionText"), 0);
  descriptionView = self->_descriptionView;
  self->_descriptionView = v5;

  -[WDDisplayTypeDescriptionView setTranslatesAutoresizingMaskIntoConstraints:](self->_descriptionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[WDDisplayTypeDescriptionTableViewCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", self->_descriptionView);

  v8 = self->_descriptionView;
  v14 = CFSTR("descriptionView");
  v15[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDDisplayTypeDescriptionTableViewCell contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|-M-[descriptionView]-M-|"), 0, &unk_24D3A6418, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addConstraints:", v11);

  -[WDDisplayTypeDescriptionTableViewCell contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[descriptionView]|"), 0, &unk_24D3A6418, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addConstraints:", v13);

}

+ (double)minimumHeight
{
  double result;

  +[WDDisplayTypeDescriptionView minimumHeightForStyle:](WDDisplayTypeDescriptionView, "minimumHeightForStyle:", 0);
  return result;
}

- (HKDisplayType)displayType
{
  return self->_displayType;
}

- (BOOL)showAttributionText
{
  return self->_showAttributionText;
}

- (void)setShowAttributionText:(BOOL)a3
{
  self->_showAttributionText = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayType, 0);
  objc_storeStrong((id *)&self->_descriptionView, 0);
}

@end
