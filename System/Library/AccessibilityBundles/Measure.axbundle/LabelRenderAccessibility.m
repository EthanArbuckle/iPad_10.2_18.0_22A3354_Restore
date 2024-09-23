@implementation LabelRenderAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Measure.LabelRender");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("Measure.SpatialGenericPlatter"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Measure.LabelRender"), CFSTR("selectAnimationComplete"), "v", 0);

}

- (void)selectAnimationComplete
{
  uint64_t v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LabelRenderAccessibility;
  -[LabelRenderAccessibility selectAnimationComplete](&v3, sel_selectAnimationComplete);
  v2 = MEMORY[0x234913CC4](CFSTR("Measure.SpatialGenericPlatter"));
  AXMeasureDidPotentiallyShowCardViewWithAncestorClass(v2);
}

@end
