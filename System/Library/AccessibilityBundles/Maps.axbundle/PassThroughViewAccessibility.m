@implementation PassThroughViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PassThroughView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  id v9;
  objc_super v11;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[PassThroughViewAccessibility hitTest:withEvent:](self, "hitTest:withEvent:", v7, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isAccessibilityElement"))
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __64__PassThroughViewAccessibility__accessibilityHitTest_withEvent___block_invoke;
    v12[3] = &unk_250259158;
    v12[4] = self;
    v12[5] = &v13;
    objc_msgSend(v8, "accessibilityEnumerateAncestorsUsingBlock:", v12);
    if (!*((_BYTE *)v14 + 24))
    {
      v9 = v8;
      _Block_object_dispose(&v13, 8);
      goto LABEL_5;
    }
    _Block_object_dispose(&v13, 8);
  }
  v11.receiver = self;
  v11.super_class = (Class)PassThroughViewAccessibility;
  -[PassThroughViewAccessibility _accessibilityHitTest:withEvent:](&v11, sel__accessibilityHitTest_withEvent_, v7, x, y);
  v9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:

  return v9;
}

void __64__PassThroughViewAccessibility__accessibilityHitTest_withEvent___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "isAccessibilityElement") && *(id *)(a1 + 32) != v5)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }

}

@end
