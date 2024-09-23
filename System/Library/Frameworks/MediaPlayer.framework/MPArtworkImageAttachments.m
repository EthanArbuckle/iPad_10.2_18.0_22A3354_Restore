@implementation MPArtworkImageAttachments

- (MPArtworkImageAttachments)initWithTextColor:(id)a3 gradientInfo:(id)a4 hasTitle:(BOOL)a5
{
  id v9;
  id v10;
  MPArtworkImageAttachments *v11;
  MPArtworkImageAttachments *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MPArtworkImageAttachments;
  v11 = -[MPArtworkImageAttachments init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_textColor, a3);
    v12->_hasTitle = a5;
    objc_storeStrong((id *)&v12->_gradient, a4);
  }

  return v12;
}

- (MPArtworkImageAttachments)initWithTextColor:(id)a3 hasTitle:(BOOL)a4
{
  id v7;
  MPArtworkImageAttachments *v8;
  MPArtworkImageAttachments *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MPArtworkImageAttachments;
  v8 = -[MPArtworkImageAttachments init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_textColor, a3);
    v9->_hasTitle = a4;
  }

  return v9;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  _BOOL4 v6;
  const __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MPArtworkImageAttachments textColor](self, "textColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MPArtworkImageAttachments hasTitle](self, "hasTitle");
  v7 = CFSTR("NO");
  if (v6)
    v7 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> (\n  textColor: %@\n  hasTitle: %@\n)"), v4, self, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (MPArtworkImageAttachments)initWithCoder:(id)a3
{
  id v4;
  MPArtworkImageAttachments *v5;
  uint64_t v6;
  UIColor *textColor;

  v4 = a3;
  v5 = -[MPArtworkImageAttachments init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("textColor"));
    v6 = objc_claimAutoreleasedReturnValue();
    textColor = v5->_textColor;
    v5->_textColor = (UIColor *)v6;

    v5->_hasTitle = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasTitle"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MPArtworkImageAttachments textColor](self, "textColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("textColor"));

  objc_msgSend(v5, "encodeBool:forKey:", -[MPArtworkImageAttachments hasTitle](self, "hasTitle"), CFSTR("hasTitle"));
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (BOOL)hasTitle
{
  return self->_hasTitle;
}

- (MPArtworkGradientInfo)gradient
{
  return self->_gradient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradient, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
