@implementation CNContactDowntimeView

- (CNContactDowntimeView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CNContactDowntimeView *v7;
  uint64_t v8;
  UILabel *downtimeLabel;
  uint64_t v10;
  NSTextAttachment *imageAttachment;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  CNContactDowntimeView *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;
  _QWORD v28[5];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v28[4] = *MEMORY[0x1E0C80C00];
  v27.receiver = self;
  v27.super_class = (Class)CNContactDowntimeView;
  v7 = -[CNContactDowntimeView initWithFrame:](&v27, sel_initWithFrame_);
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", x, y, width, height);
    downtimeLabel = v7->_downtimeLabel;
    v7->_downtimeLabel = (UILabel *)v8;

    -[UILabel setTextAlignment:](v7->_downtimeLabel, "setTextAlignment:", 1);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v7->_downtimeLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v7->_downtimeLabel, "setNumberOfLines:", 0);
    objc_msgSend((id)objc_opt_class(), "lockImageAttachment");
    v10 = objc_claimAutoreleasedReturnValue();
    imageAttachment = v7->_imageAttachment;
    v7->_imageAttachment = (NSTextAttachment *)v10;

    -[CNContactDowntimeView addSubview:](v7, "addSubview:", v7->_downtimeLabel);
    -[UILabel topAnchor](v7->_downtimeLabel, "topAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactDowntimeView topAnchor](v7, "topAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v24;
    -[UILabel bottomAnchor](v7->_downtimeLabel, "bottomAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactDowntimeView bottomAnchor](v7, "bottomAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v13;
    -[UILabel leftAnchor](v7->_downtimeLabel, "leftAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactDowntimeView leftAnchor](v7, "leftAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v28[2] = v16;
    -[UILabel rightAnchor](v7->_downtimeLabel, "rightAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactDowntimeView rightAnchor](v7, "rightAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v28[3] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactDowntimeView addConstraints:](v7, "addConstraints:", v20);

    v21 = v7;
  }

  return v7;
}

- (void)setElements:(int64_t)a3
{
  if (self->_elements != a3)
  {
    self->_elements = a3;
    -[CNContactDowntimeView updateAttributedText](self, "updateAttributedText");
    -[CNContactDowntimeView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (void)updateAttributedText
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  if ((-[CNContactDowntimeView elements](self, "elements") & 2) != 0)
  {
    v3 = objc_alloc(MEMORY[0x1E0CB3498]);
    CNContactsUIBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("DOWNTIME_CONTACT"), &stru_1E20507A8, CFSTR("Localized"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v3, "initWithString:", v5);
    objc_msgSend(v9, "appendAttributedString:", v6);

  }
  if ((-[CNContactDowntimeView elements](self, "elements") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", self->_imageAttachment);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendAttributedString:", v7);

  }
  -[CNContactDowntimeView downtimeLabel](self, "downtimeLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAttributedText:", v9);

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[UILabel intrinsicContentSize](self->_downtimeLabel, "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[UILabel sizeThatFits:](self->_downtimeLabel, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)invalidateIntrinsicContentSize
{
  objc_super v3;

  -[UILabel invalidateIntrinsicContentSize](self->_downtimeLabel, "invalidateIntrinsicContentSize");
  v3.receiver = self;
  v3.super_class = (Class)CNContactDowntimeView;
  -[CNContactDowntimeView invalidateIntrinsicContentSize](&v3, sel_invalidateIntrinsicContentSize);
}

- (void)setAb_textAttributes:(id)a3
{
  void *v5;
  double v6;
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
  void *v17;
  double v18;
  double v19;
  id v20;

  v20 = a3;
  objc_storeStrong((id *)&self->_ab_textAttributes, a3);
  -[UILabel setAb_textAttributes:](self->_downtimeLabel, "setAb_textAttributes:", v20);
  -[UILabel font](self->_downtimeLabel, "font");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lineHeight");
  v7 = v6 * 0.8;

  -[NSTextAttachment bounds](self->_imageAttachment, "bounds");
  if (v9 != v7)
  {
    v10 = v8;
    -[NSTextAttachment image](self->_imageAttachment, "image");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "size");
    v13 = v12;
    v15 = v14;

    v16 = v13 / v15;
    -[NSTextAttachment image](self->_imageAttachment, "image");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "baselineOffsetFromBottom");
    v19 = -(v18 * (v7 / v15));

    -[NSTextAttachment setBounds:](self->_imageAttachment, "setBounds:", v10, v19, v7 * v16, v7);
    -[CNContactDowntimeView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }

}

- (NSDictionary)ab_textAttributes
{
  return self->_ab_textAttributes;
}

- (int64_t)elements
{
  return self->_elements;
}

- (UILabel)downtimeLabel
{
  return self->_downtimeLabel;
}

- (NSTextAttachment)imageAttachment
{
  return self->_imageAttachment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageAttachment, 0);
  objc_storeStrong((id *)&self->_downtimeLabel, 0);
  objc_storeStrong((id *)&self->_ab_textAttributes, 0);
}

+ (id)lockImageAttachment
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(MEMORY[0x1E0DC12B0]);
  objc_msgSend(v2, "setAdjustsImageSizeForAccessibilityContentSizeCategory:", 1);
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", *MEMORY[0x1E0DC4B08], 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("lock.fill"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageWithRenderingMode:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImage:", v5);

  return v2;
}

@end
