@implementation CPSMultilineLabelConfig

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  NSString *v5;
  UIFont *v6;
  id v7;
  id v8[3];
  CPSMultilineLabelConfig *v9;

  v9 = self;
  v8[2] = (id)a2;
  v8[1] = a3;
  v8[0] = (id)objc_opt_new();
  v5 = -[CPSMultilineLabelConfig text](v9, "text");
  objc_msgSend(v8[0], "setText:");

  v6 = -[CPSMultilineLabelConfig font](v9, "font");
  objc_msgSend(v8[0], "setFont:");

  v3 = -[CPSMultilineLabelConfig lineCount](v9, "lineCount");
  objc_msgSend(v8[0], "setLineCount:", v3);
  v7 = v8[0];
  objc_storeStrong(v8, 0);
  return v7;
}

- (BOOL)isEqualToLabelConfig:(id)a3
{
  id v4;
  UIFont *v5;
  char v6;
  uint64_t v7;
  id location[2];
  CPSMultilineLabelConfig *v9;
  BOOL v10;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = -[CPSMultilineLabelConfig lineCount](v9, "lineCount");
  if (v7 == objc_msgSend(location[0], "lineCount"))
  {
    v5 = -[CPSMultilineLabelConfig font](v9, "font");
    v4 = (id)objc_msgSend(location[0], "font");
    v6 = -[UIFont isEqual:](v5, "isEqual:");

    v10 = (v6 & 1) != 0;
  }
  else
  {
    v10 = 0;
  }
  objc_storeStrong(location, 0);
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4;
  int v5;
  id location[2];
  CPSMultilineLabelConfig *v7;
  char v8;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0] == v7)
  {
    v8 = 1;
    v5 = 1;
  }
  else
  {
    v4.receiver = v7;
    v4.super_class = (Class)CPSMultilineLabelConfig;
    if (-[CPSMultilineLabelConfig isEqual:](&v4, sel_isEqual_, location[0]))
      v8 = -[CPSMultilineLabelConfig isEqualToLabelConfig:](v7, "isEqualToLabelConfig:", location[0]);
    else
      v8 = 0;
    v5 = 1;
  }
  objc_storeStrong(location, 0);
  return v8 & 1;
}

- (id)description
{
  uint64_t v2;
  const __CFString *v3;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  void *v9;
  NSString *v10;
  NSAttributedString *v11;
  UIFont *v12;
  id v13;

  v9 = (void *)MEMORY[0x24BDD17C8];
  v5 = objc_opt_class();
  v6 = -[CPSMultilineLabelConfig lineCount](self, "lineCount");
  v12 = -[CPSMultilineLabelConfig font](self, "font");
  -[UIFont pointSize](v12, "pointSize");
  v7 = v2;
  v11 = -[CPSMultilineLabelConfig attributedText](self, "attributedText");
  v3 = CFSTR("YES");
  if (!v11)
    v3 = CFSTR("NO");
  v8 = v3;
  v10 = -[CPSMultilineLabelConfig text](self, "text");
  v13 = (id)objc_msgSend(v9, "stringWithFormat:", CFSTR("<%@: %p lineCount=%ld fontSize=%f %@ - %@>"), v5, self, v6, v7, v8, v10);

  return v13;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (UIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
  objc_storeStrong((id *)&self->_font, a3);
}

- (unint64_t)lineCount
{
  return self->_lineCount;
}

- (void)setLineCount:(unint64_t)a3
{
  self->_lineCount = a3;
}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (void)setAttributedText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedText, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
