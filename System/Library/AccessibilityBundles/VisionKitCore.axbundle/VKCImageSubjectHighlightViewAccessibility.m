@implementation VKCImageSubjectHighlightViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VKCImageSubjectHighlightView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[VKCImageSubjectHighlightViewAccessibility _axDraggableView](self, "_axDraggableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    accessibilityLocalizedString(CFSTR("detected.subject.element"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VKCImageSubjectHighlightViewAccessibility;
  return *MEMORY[0x24BDF73C8] | -[VKCImageSubjectHighlightViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)_axDraggableView
{
  return (id)-[VKCImageSubjectHighlightViewAccessibility _accessibilityFindViewAncestor:startWithSelf:](self, "_accessibilityFindViewAncestor:startWithSelf:", &__block_literal_global_0, 1);
}

uint64_t __61__VKCImageSubjectHighlightViewAccessibility__axDraggableView__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_accessibilityCanDrag");
}

- (id)accessibilityDragSourceDescriptors
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  -[VKCImageSubjectHighlightViewAccessibility _axDraggableView](self, "_axDraggableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDF67B0]);
    accessibilityLocalizedString(CFSTR("lift.subject.from.background"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCImageSubjectHighlightViewAccessibility accessibilityActivationPoint](self, "accessibilityActivationPoint");
    UIAccessibilityPointToPoint();
    v6 = (void *)objc_msgSend(v4, "initWithName:point:inView:", v5, v3);
    v10[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)VKCImageSubjectHighlightViewAccessibility;
    -[VKCImageSubjectHighlightViewAccessibility accessibilityDragSourceDescriptors](&v9, sel_accessibilityDragSourceDescriptors);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

@end
