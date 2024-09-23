@implementation TransitDirectionsInstructionsCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TransitDirectionsInstructionsCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("TransitDirectionsInstructionsCell"), CFSTR("TransitDirectionsCell"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("TransitDirectionsCell"), CFSTR("_stepView"), "TransitDirectionsStepView");

}

- (id)accessibilityElements
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  -[TransitDirectionsInstructionsCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_stepView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && objc_msgSend(v2, "isAccessibilityElement"))
  {
    v6[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v4;
}

@end
