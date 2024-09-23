@implementation HKDisplayTypeContextItemAttributedLabelOverride

+ (HKDisplayTypeContextItemAttributedLabelOverride)attributedLabelOverrideWithText:(id)a3 selectedText:(id)a4
{
  NSAttributedString *v5;
  NSAttributedString *v6;
  HKDisplayTypeContextItemAttributedLabelOverride *v7;
  NSAttributedString *attributedLabelText;
  NSAttributedString *v9;
  NSAttributedString *selectedAttributedLabelText;

  v5 = (NSAttributedString *)a3;
  v6 = (NSAttributedString *)a4;
  v7 = objc_alloc_init(HKDisplayTypeContextItemAttributedLabelOverride);
  attributedLabelText = v7->_attributedLabelText;
  v7->_attributedLabelText = v5;
  v9 = v5;

  selectedAttributedLabelText = v7->_selectedAttributedLabelText;
  v7->_selectedAttributedLabelText = v6;

  return v7;
}

- (id)attributedLabelTextWithSelectionState:(BOOL)a3
{
  if (a3)
    -[HKDisplayTypeContextItemAttributedLabelOverride selectedAttributedLabelText](self, "selectedAttributedLabelText");
  else
    -[HKDisplayTypeContextItemAttributedLabelOverride attributedLabelText](self, "attributedLabelText");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSAttributedString hash](self->_attributedLabelText, "hash");
  return -[NSAttributedString hash](self->_selectedAttributedLabelText, "hash") & v3;
}

- (BOOL)isEqual:(id)a3
{
  HKDisplayTypeContextItemAttributedLabelOverride *v4;
  BOOL v5;

  v4 = (HKDisplayTypeContextItemAttributedLabelOverride *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[HKDisplayTypeContextItemAttributedLabelOverride _isEqualToAttributedLabelOverride:](self, "_isEqualToAttributedLabelOverride:", v4);
  }

  return v5;
}

- (BOOL)_isEqualToAttributedLabelOverride:(id)a3
{
  id v4;
  NSAttributedString *attributedLabelText;
  void *v6;
  NSAttributedString *selectedAttributedLabelText;
  void *v8;
  BOOL v9;

  v4 = a3;
  attributedLabelText = self->_attributedLabelText;
  objc_msgSend(v4, "attributedLabelText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSAttributedString isEqualToAttributedString:](attributedLabelText, "isEqualToAttributedString:", v6))
  {
    selectedAttributedLabelText = self->_selectedAttributedLabelText;
    objc_msgSend(v4, "selectedAttributedLabelText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[NSAttributedString isEqualToAttributedString:](selectedAttributedLabelText, "isEqualToAttributedString:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[HKDisplayTypeContextItemAttributedLabelOverride attributedLabelText](self, "attributedLabelText");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v4[1];
  v4[1] = v5;

  -[HKDisplayTypeContextItemAttributedLabelOverride selectedAttributedLabelText](self, "selectedAttributedLabelText");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v4[2];
  v4[2] = v7;

  return v4;
}

- (NSAttributedString)attributedLabelText
{
  return self->_attributedLabelText;
}

- (NSAttributedString)selectedAttributedLabelText
{
  return self->_selectedAttributedLabelText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedAttributedLabelText, 0);
  objc_storeStrong((id *)&self->_attributedLabelText, 0);
}

@end
