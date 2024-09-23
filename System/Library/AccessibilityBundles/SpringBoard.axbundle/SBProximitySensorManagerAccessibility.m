@implementation SBProximitySensorManagerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBProximitySensorManager");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBProximitySensorManager"), CFSTR("_objectInProximity"), "B");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBProximitySensorManager"), CFSTR("_setObjectInProximity:detectionMode:"), "v", "B", "i", 0);

}

- (void)_setObjectInProximity:(BOOL)a3 detectionMode:(int)a4
{
  uint64_t v4;
  _BOOL8 v5;
  char v7;
  objc_super v8;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v7 = -[SBProximitySensorManagerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_objectInProximity"));
  v8.receiver = self;
  v8.super_class = (Class)SBProximitySensorManagerAccessibility;
  -[SBProximitySensorManagerAccessibility _setObjectInProximity:detectionMode:](&v8, sel__setObjectInProximity_detectionMode_, v5, v4);
  if ((v7 & 1) == 0 && v5)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], (id)*MEMORY[0x24BDFEE30]);
}

@end
