@implementation SCNSceneAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SCNScene");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SCNScene"), CFSTR("rootNode"), "@", 0);
}

+ (BOOL)_isSerializableAccessibilityElement
{
  return 1;
}

- (void)dealloc
{
  objc_super v3;

  -[SCNSceneAccessibility _accessibilityUnregister](self, "_accessibilityUnregister");
  v3.receiver = self;
  v3.super_class = (Class)SCNSceneAccessibility;
  -[SCNSceneAccessibility dealloc](&v3, sel_dealloc);
}

- (id)accessibilityElements
{
  void *v3;
  void *v4;

  -[SCNSceneAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("rootNode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityContainer:", self);
  objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)accessibilityContainerIsSet
{
  void *v2;
  BOOL v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCNSceneAccessibility;
  -[SCNSceneAccessibility accessibilityContainer](&v5, sel_accessibilityContainer);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)accessibilityContainer
{
  void *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SCNSceneAccessibility;
  -[SCNSceneAccessibility accessibilityContainer](&v4, sel_accessibilityContainer);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    _AXAssert();
  return v2;
}

- (CGRect)accessibilityFrame
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[SCNSceneAccessibility accessibilityContainer](self, "accessibilityContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

@end
