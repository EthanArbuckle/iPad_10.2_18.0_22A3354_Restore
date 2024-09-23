@implementation AXCKMentionSubelement

- (unint64_t)accessibilityTraits
{
  void *v3;
  void *v4;
  char v5;
  unint64_t *v6;
  unint64_t v7;

  objc_opt_class();
  -[AXCKMentionSubelement accessibilityContainer](self, "accessibilityContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_msgSend(v4, "isSelectable");
    v6 = (unint64_t *)MEMORY[0x24BDF73B0];
    if ((v5 & 1) == 0 && !objc_msgSend(v4, "isEditable"))
      v6 = (unint64_t *)MEMORY[0x24BDF73E0];
  }
  else
  {
    v6 = (unint64_t *)MEMORY[0x24BDF73B0];
  }
  v7 = *v6;

  return v7;
}

- (AXCKMentionSubelement)initWithTextView:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AXCKMentionSubelement;
  return -[AXCKMentionSubelement initWithAccessibilityContainer:](&v4, sel_initWithAccessibilityContainer_, a3);
}

- (id)_textRangeForTextView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "beginningOfDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "positionFromPosition:offset:", v5, -[AXCKMentionSubelement range](self, "range"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AXCKMentionSubelement range](self, "range");
  -[AXCKMentionSubelement range](self, "range");
  objc_msgSend(v4, "positionFromPosition:offset:", v5, v8 + v7);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = 0;
  if (v6 && v9)
  {
    objc_msgSend(v4, "textRangeFromPosition:toPosition:", v6, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (CGRect)accessibilityFrame
{
  UIView *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect v18;
  CGRect result;

  -[AXCKMentionSubelement accessibilityContainer](self, "accessibilityContainer");
  v3 = (UIView *)objc_claimAutoreleasedReturnValue();
  -[AXCKMentionSubelement _textRangeForTextView:](self, "_textRangeForTextView:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (!v3)
  {
    v6 = *MEMORY[0x24BDBF090];
    v7 = *(_QWORD *)(MEMORY[0x24BDBF090] + 8);
    v8 = *(_QWORD *)(MEMORY[0x24BDBF090] + 16);
    v9 = *(_QWORD *)(MEMORY[0x24BDBF090] + 24);
    if (!v4)
      goto LABEL_4;
    goto LABEL_3;
  }
  -[UIView bounds](v3, "bounds");
  if (v5)
LABEL_3:
    -[UIView firstRectForRange:](v3, "firstRectForRange:", v5);
LABEL_4:
  v18 = UIAccessibilityConvertFrameToScreenCoordinates(*(CGRect *)&v6, v3);
  x = v18.origin.x;
  y = v18.origin.y;
  width = v18.size.width;
  height = v18.size.height;

  v14 = x;
  v15 = y;
  v16 = width;
  v17 = height;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (UITextView)accessibilityContainerTextView
{
  return (UITextView *)objc_loadWeakRetained((id *)&self->_accessibilityContainerTextView);
}

- (void)setAccessibilityContainerTextView:(id)a3
{
  objc_storeWeak((id *)&self->_accessibilityContainerTextView, a3);
}

- (_NSRange)range
{
  _NSRange *p_range;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_range = &self->_range;
  location = self->_range.location;
  length = p_range->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_accessibilityContainerTextView);
}

@end
