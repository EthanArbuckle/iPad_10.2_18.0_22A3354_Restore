@implementation UIAccessibilityTextLineElement

- (id)accessibilityValue
{
  NSUInteger length;
  id v4;
  id location[2];
  UIAccessibilityTextLineElement *v6;
  id v7;
  NSUInteger v8;
  NSUInteger v9;

  v6 = self;
  location[1] = (id)a2;
  v4 = (id)-[UIAccessibilityTextLineElement accessibilityContainer](self, "accessibilityContainer");
  location[0] = (id)objc_msgSend(v4, "_accessibilityAXAttributedValue");

  length = v6->_range.length;
  v8 = v6->_range.location;
  v9 = length;
  if (v8 + length > objc_msgSend(location[0], "length"))
    v7 = 0;
  else
    v7 = (id)objc_msgSend(location[0], "substringWithRange:", v6->_range.location, v6->_range.length);
  objc_storeStrong(location, 0);
  return v7;
}

- (unint64_t)accessibilityTraits
{
  id v3;
  unint64_t v4;

  v3 = (id)-[UIAccessibilityTextLineElement accessibilityContainer](self, "accessibilityContainer");
  v4 = objc_msgSend(v3, "accessibilityTraits");

  return v4;
}

- (id)accessibilityHint
{
  id v3;
  id v4;

  v3 = (id)-[UIAccessibilityTextLineElement accessibilityContainer](self, "accessibilityContainer");
  v4 = (id)objc_msgSend(v3, "_accessibilityAXAttributedHint");

  return v4;
}

- (_NSRange)_accessibilitySelectedTextRange
{
  NSUInteger v2;
  NSUInteger v3;
  NSUInteger v4;
  id v5;
  uint64_t v6;
  NSUInteger v7;
  _NSRange result;

  v5 = (id)-[UIAccessibilityTextLineElement accessibilityContainer](self, "accessibilityContainer");
  v6 = objc_msgSend(v5, "_accessibilitySelectedTextRange");
  v7 = v2;

  v3 = v6;
  v4 = v7;
  result.length = v4;
  result.location = v3;
  return result;
}

- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3
{
  id v3;
  _NSRange range;

  range = self->_range;
  if ((uint64_t)a3.location <= (uint64_t)range.length)
    range.location += a3.location;
  v3 = (id)-[UIAccessibilityTextLineElement accessibilityContainer](self, "accessibilityContainer");
  objc_msgSend(v3, "_accessibilitySetSelectedTextRange:", range);

}

@end
