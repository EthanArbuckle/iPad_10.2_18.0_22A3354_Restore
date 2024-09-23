@implementation SUUITextLayoutRequest

- (SUUITextLayoutRequest)init
{
  SUUITextLayoutRequest *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUUITextLayoutRequest;
  result = -[SUUITextLayoutRequest init](&v3, sel_init);
  if (result)
    result->_fontSize = 12.0;
  return result;
}

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSAttributedString copyWithZone:](self->_attributedText, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  *(_QWORD *)(v5 + 24) = self->_fontWeight;
  *(double *)(v5 + 16) = self->_fontSize;
  *(_QWORD *)(v5 + 32) = self->_numberOfLines;
  v8 = -[NSString copyWithZone:](self->_text, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v8;

  *(_BYTE *)(v5 + 48) = self->_textAlignment;
  *(double *)(v5 + 56) = self->_width;
  return (id)v5;
}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (void)setAttributedText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (int64_t)fontWeight
{
  return self->_fontWeight;
}

- (void)setFontWeight:(int64_t)a3
{
  self->_fontWeight = a3;
}

- (int64_t)numberOfLines
{
  return self->_numberOfLines;
}

- (void)setNumberOfLines:(int64_t)a3
{
  self->_numberOfLines = a3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unsigned)textAlignment
{
  return self->_textAlignment;
}

- (void)setTextAlignment:(unsigned __int8)a3
{
  self->_textAlignment = a3;
}

- (double)width
{
  return self->_width;
}

- (void)setWidth:(double)a3
{
  self->_width = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_attributedText, 0);
}

@end
