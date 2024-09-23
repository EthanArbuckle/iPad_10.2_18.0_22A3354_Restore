@implementation AXVKCImageTextSelectionViewAccessibilityElement

- (AXVKCImageTextSelectionViewAccessibilityElement)initWithAccessibilityContainer:(id)a3 textRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  AXVKCImageTextSelectionViewAccessibilityElement *v8;
  AXVKCImageTextSelectionViewAccessibilityElement *v9;
  unint64_t v10;
  int v11;
  uint64_t v12;
  objc_super v14;
  objc_super v15;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AXVKCImageTextSelectionViewAccessibilityElement;
  v8 = -[AXVKCImageTextSelectionViewAccessibilityElement initWithAccessibilityContainer:](&v15, sel_initWithAccessibilityContainer_, v7);
  v9 = v8;
  if (v8)
  {
    v8->_textRange.location = location;
    v8->_textRange.length = length;
    v14.receiver = v8;
    v14.super_class = (Class)AXVKCImageTextSelectionViewAccessibilityElement;
    v10 = *MEMORY[0x24BDF7410] | (unint64_t)-[AXVKCImageTextSelectionViewAccessibilityElement accessibilityTraits](&v14, sel_accessibilityTraits);
    v11 = objc_msgSend(v7, "safeBoolForKey:", CFSTR("selectable"));
    v12 = *MEMORY[0x24BDFF000];
    if (!v11)
      v12 = 0;
    -[AXVKCImageTextSelectionViewAccessibilityElement setAccessibilityTraits:](v9, "setAccessibilityTraits:", v10 | v12);
  }

  return v9;
}

- (CGRect)accessibilityFrame
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  objc_super v19;
  char v20;
  CGRect result;

  v20 = 0;
  objc_opt_class();
  -[AXVKCImageTextSelectionViewAccessibilityElement accessibilityContainer](self, "accessibilityContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsSafeCategory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = -[AXVKCImageTextSelectionViewAccessibilityElement textRange](self, "textRange");
    objc_msgSend(v4, "_accessibilityBoundsForRange:", v5, v6);
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)AXVKCImageTextSelectionViewAccessibilityElement;
    -[AXVKCImageTextSelectionViewAccessibilityElement accessibilityFrame](&v19, sel_accessibilityFrame);
  }
  v11 = v7;
  v12 = v8;
  v13 = v9;
  v14 = v10;

  v15 = v11;
  v16 = v12;
  v17 = v13;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (_NSRange)_accessibilitySelectedTextRange
{
  void *v3;
  unint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  void *v7;
  BOOL v8;
  NSUInteger location;
  id v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  objc_super v14;
  _NSRange result;

  -[AXVKCImageTextSelectionViewAccessibilityElement accessibilityContainer](self, "accessibilityContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_accessibilitySelectedTextRange");
  v6 = v5;
  if ((objc_msgSend(v3, "safeBoolForKey:", CFSTR("isEditable")) & 1) == 0)
  {
    objc_msgSend(v3, "safeStringForKey:", CFSTR("text"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v4 == objc_msgSend(v7, "length");

    if (v8)
      v4 = 0;
  }
  location = self->_textRange.location;
  v10 = (id)(v4 - location);
  if (v4 < location || v4 > self->_textRange.length + location)
  {
    v14.receiver = self;
    v14.super_class = (Class)AXVKCImageTextSelectionViewAccessibilityElement;
    v10 = -[AXVKCImageTextSelectionViewAccessibilityElement _accessibilitySelectedTextRange](&v14, sel__accessibilitySelectedTextRange);
    v6 = v11;
  }

  v12 = (NSUInteger)v10;
  v13 = v6;
  result.length = v13;
  result.location = v12;
  return result;
}

- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger v4;
  id v5;

  length = a3.length;
  v4 = self->_textRange.location + a3.location;
  -[AXVKCImageTextSelectionViewAccessibilityElement accessibilityContainer](self, "accessibilityContainer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_accessibilitySetSelectedTextRange:", v4, length);

}

- (_NSRange)textRange
{
  _NSRange *p_textRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_textRange = &self->_textRange;
  location = self->_textRange.location;
  length = p_textRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (NSString)_accessibilityContent
{
  return self->__accessibilityContent;
}

- (void)set_accessibilityContent:(id)a3
{
  objc_storeStrong((id *)&self->__accessibilityContent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__accessibilityContent, 0);
}

@end
