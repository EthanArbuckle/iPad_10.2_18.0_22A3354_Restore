@implementation ARViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("RealityKit.ARView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("RealityKit.ARView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RealityKit.ARView"), CFSTR("entityAccessibilityWrappers"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RealityKit.ARView"), CFSTR("distanceInMetersFromEntityAccessibilityWrapper:"), "f", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RealityKit.ARView"), CFSTR("handleTapForEntityAccessibilityWrapper:"), "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RealityKit.__EntityAccessibilityWrapper"), CFSTR("identifier"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RealityKit.__EntityAccessibilityWrapper"), CFSTR("rootEntityWrapper"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RealityKit.__EntityAccessibilityWrapper"), CFSTR("entityLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RealityKit.__EntityAccessibilityWrapper"), CFSTR("entityDescription"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RealityKit.__EntityAccessibilityWrapper"), CFSTR("isEntityAccessible"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RealityKit.__EntityAccessibilityWrapper"), CFSTR("isEntityActive"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RealityKit.__EntityAccessibilityWrapper"), CFSTR("calculateScreenBoundingRectIn:"), "{CGRect={CGPoint=dd}{CGSize=dd}}", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RealityKit.__EntityAccessibilityWrapper"), CFSTR("entityAccessibilityTraits"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RealityKit.__EntityAccessibilityWrapper"), CFSTR("entityValue"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RealityKit.__EntityAccessibilityWrapper"), CFSTR("entitySupportsAccessibilityActivateAction"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RealityKit.__EntityAccessibilityWrapper"), CFSTR("entityPerformAccessibilityActivate"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RealityKit.__EntityAccessibilityWrapper"), CFSTR("entityAccessibilityCustomContent"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RealityKit.__EntityAccessibilityWrapper"), CFSTR("entityAccessibilityCustomActions"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RealityKit.__EntityAccessibilityWrapper"), CFSTR("entityAccessibilityCustomRotors"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RealityKit.__EntityAccessibilityWrapper"), CFSTR("entityPerformAccessibilityIncrement"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RealityKit.__EntityAccessibilityWrapper"), CFSTR("entityPerformAccessibilityDecrement"), "v", 0);

}

- (id)_axCachedElementsByEntityWrapper
{
  JUMPOUT(0x23491B5D8);
}

- (void)_axSetCachedElementsByEntityWrapper:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ARViewAccessibility;
  -[ARViewAccessibility accessibilityElements](&v8, sel_accessibilityElements);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[ARViewAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("entityAccessibilityWrappers"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARViewAccessibility accessibilityElementsForEntityWrappers:](self, "accessibilityElementsForEntityWrappers:", v6);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)accessibilityElementsForEntityWrappers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  AXARViewElement *v14;
  ARViewAccessibility *v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v16 = self;
  -[ARViewAccessibility _axCachedElementsByEntityWrapper](self, "_axCachedElementsByEntityWrapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v4;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v12, "safeValueForKey:", CFSTR("identifier"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", v13);
        v14 = (AXARViewElement *)objc_claimAutoreleasedReturnValue();
        if (!v14)
          v14 = -[AXARViewElement initWithAccessibilityContainer:entityWrapper:]([AXARViewElement alloc], "initWithAccessibilityContainer:entityWrapper:", v16, v12);
        objc_msgSend(v7, "addObject:", v14);
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, v13);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  -[ARViewAccessibility _axSetCachedElementsByEntityWrapper:](v16, "_axSetCachedElementsByEntityWrapper:", v6);
  return v7;
}

@end
