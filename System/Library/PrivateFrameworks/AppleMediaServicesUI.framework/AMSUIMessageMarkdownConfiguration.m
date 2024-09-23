@implementation AMSUIMessageMarkdownConfiguration

- (AMSUIMessageMarkdownConfiguration)initWithColor:(id)a3 font:(id)a4
{
  id v7;
  id v8;
  AMSUIMessageMarkdownConfiguration *v9;
  AMSUIMessageMarkdownConfiguration *v10;
  NSParagraphStyle *v11;
  NSParagraphStyle *paragraphStyle;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AMSUIMessageMarkdownConfiguration;
  v9 = -[AMSUIMessageMarkdownConfiguration init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_color, a3);
    objc_storeStrong((id *)&v10->_font, a4);
    v11 = (NSParagraphStyle *)objc_alloc_init(MEMORY[0x24BEBB498]);
    paragraphStyle = v10->_paragraphStyle;
    v10->_paragraphStyle = v11;

  }
  return v10;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (UIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
  objc_storeStrong((id *)&self->_font, a3);
}

- (NSParagraphStyle)paragraphStyle
{
  return self->_paragraphStyle;
}

- (void)setParagraphStyle:(id)a3
{
  objc_storeStrong((id *)&self->_paragraphStyle, a3);
}

- (UIColor)strikeThroughColor
{
  return self->_strikeThroughColor;
}

- (void)setStrikeThroughColor:(id)a3
{
  objc_storeStrong((id *)&self->_strikeThroughColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strikeThroughColor, 0);
  objc_storeStrong((id *)&self->_paragraphStyle, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end
