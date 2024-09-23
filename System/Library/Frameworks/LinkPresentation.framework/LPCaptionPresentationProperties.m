@implementation LPCaptionPresentationProperties

- (LPCaptionPresentationProperties)init
{
  LPCaptionPresentationProperties *v2;
  LPCaptionPresentationProperties *v3;
  LPCaptionPresentationProperties *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LPCaptionPresentationProperties;
  v2 = -[LPCaptionPresentationProperties init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_textScale = 1.0;
    v4 = v2;
  }

  return v3;
}

- (void)setTextScale:(double)a3
{
  self->_textScale = fmax(fmin(a3, 2.0), 0.0);
}

- (void)setText:(id)a3
{
  NSString *v4;
  NSString *text;
  NSAttributedString *v6;
  NSAttributedString *attributedText;
  NSAttributedString **p_attributedText;
  uint64_t v9;
  id v10;

  v10 = a3;
  v4 = (NSString *)objc_msgSend(v10, "copy");
  text = self->_text;
  self->_text = v4;

  if (v10)
  {
    v6 = (NSAttributedString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v10);
    p_attributedText = &self->_attributedText;
    attributedText = self->_attributedText;
    self->_attributedText = v6;
  }
  else
  {
    p_attributedText = &self->_attributedText;
    attributedText = self->_attributedText;
    self->_attributedText = 0;
  }

  v9 = objc_msgSend(v10, "_lp_stringType");
  if (v9)
  {
    -[NSString _lp_setStringType:](self->_text, "_lp_setStringType:", v9);
    -[NSAttributedString _lp_setStringType:](*p_attributedText, "_lp_setStringType:", v9);
  }

}

- (void)setAttributedText:(id)a3
{
  NSAttributedString *v4;
  NSAttributedString *attributedText;
  NSString *v6;
  NSString *text;
  uint64_t v8;
  id v9;

  v9 = a3;
  v4 = (NSAttributedString *)objc_msgSend(v9, "copy");
  attributedText = self->_attributedText;
  self->_attributedText = v4;

  objc_msgSend(v9, "string");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  text = self->_text;
  self->_text = v6;

  v8 = objc_msgSend(v9, "_lp_stringType");
  if (v8)
  {
    -[NSString _lp_setStringType:](self->_text, "_lp_setStringType:", v8);
    -[NSAttributedString _lp_setStringType:](self->_attributedText, "_lp_setStringType:", v8);
  }

}

- (NSString)text
{
  return self->_text;
}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (double)textScale
{
  return self->_textScale;
}

- (NSNumber)maximumNumberOfLines
{
  return self->_maximumNumberOfLines;
}

- (void)setMaximumNumberOfLines:(id)a3
{
  objc_storeStrong((id *)&self->_maximumNumberOfLines, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumNumberOfLines, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_attributedText, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
