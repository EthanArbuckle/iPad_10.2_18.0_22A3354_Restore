@implementation NUTextAndGlyph

- (NUTextAndGlyph)initWithAttributedText:(id)a3 text:(id)a4 glyph:(id)a5
{
  id v9;
  id v10;
  id v11;
  NUTextAndGlyph *v12;
  NUTextAndGlyph *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)NUTextAndGlyph;
  v12 = -[NUTextAndGlyph init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_attributedText, a3);
    objc_storeStrong((id *)&v13->_text, a4);
    objc_storeStrong((id *)&v13->_glyph, a5);
    v13->_alignment = 0;
  }

  return v13;
}

- (NUTextAndGlyph)initWithAttributedText:(id)a3 glyph:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NUTextAndGlyph *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[NUTextAndGlyph initWithAttributedText:text:glyph:](self, "initWithAttributedText:text:glyph:", v7, v8, v6);

  return v9;
}

- (NUTextAndGlyph)initWithText:(id)a3 glyph:(id)a4
{
  return -[NUTextAndGlyph initWithAttributedText:text:glyph:](self, "initWithAttributedText:text:glyph:", 0, a3, a4);
}

- (NUTextAndGlyph)init
{
  return -[NUTextAndGlyph initWithAttributedText:text:glyph:](self, "initWithAttributedText:text:glyph:", 0, 0, 0);
}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (NSString)text
{
  return self->_text;
}

- (UIImage)glyph
{
  return self->_glyph;
}

- (unint64_t)alignment
{
  return self->_alignment;
}

- (void)setAlignment:(unint64_t)a3
{
  self->_alignment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyph, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_attributedText, 0);
}

@end
