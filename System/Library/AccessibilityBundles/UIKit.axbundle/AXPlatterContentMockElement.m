@implementation AXPlatterContentMockElement

- (id)accessibilityLabel
{
  id v3;
  id v4;

  v3 = (id)-[AXPlatterContentMockElement sourceElement]((uint64_t)self);
  v4 = (id)objc_msgSend(v3, "accessibilityLabel");

  return v4;
}

- (uint64_t)sourceElement
{
  if (a1)
    return *(_QWORD *)(a1 + 56);
  else
    return 0;
}

- (id)accessibilityValue
{
  id v3;
  id v4;

  v3 = (id)-[AXPlatterContentMockElement sourceElement]((uint64_t)self);
  v4 = (id)objc_msgSend(v3, "accessibilityValue");

  return v4;
}

- (CGRect)accessibilityFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  id v11;
  id v12;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  v11 = (id)-[AXPlatterContentMockElement sourceView]((uint64_t)self);
  v10 = (id)-[AXPlatterContentMockElement sourceElement]((uint64_t)self);
  objc_msgSend(v10, "accessibilityFrame");
  UIAccessibilityFrameToBounds();

  v12 = (id)-[AXPlatterContentMockElement accessibilityContainer](self, "accessibilityContainer");
  UIAccessibilityFrameForBounds();
  v14 = v2;
  v15 = v3;
  v16 = v4;
  v17 = v5;

  v6 = v14;
  v7 = v15;
  v8 = v16;
  v9 = v17;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (uint64_t)sourceView
{
  if (a1)
    return *(_QWORD *)(a1 + 64);
  else
    return 0;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73E0];
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 0;
}

- (id)description
{
  id v3;
  id v4;
  id v5;
  objc_super v6;
  SEL v7;
  AXPlatterContentMockElement *v8;

  v8 = self;
  v7 = a2;
  v6.receiver = self;
  v6.super_class = (Class)AXPlatterContentMockElement;
  v4 = -[AXPlatterContentMockElement description](&v6, sel_description);
  v3 = (id)-[AXPlatterContentMockElement sourceElement]((uint64_t)v8);
  v5 = (id)objc_msgSend(v4, "stringByAppendingFormat:", CFSTR(" - sourceElement: %@"), v3);

  return v5;
}

- (void)setSourceElement:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 56), a2);
}

- (void)setSourceView:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 64), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_storeStrong(&self->_sourceElement, 0);
}

@end
