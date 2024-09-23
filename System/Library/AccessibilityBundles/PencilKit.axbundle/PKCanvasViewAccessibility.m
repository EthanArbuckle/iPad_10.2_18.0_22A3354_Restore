@implementation PKCanvasViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKCanvasView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKCanvasView"), CFSTR("drawing"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKDrawing"), CFSTR("strokes"), "@", 0);

}

- (id)accessibilityElements
{
  void *v2;
  void *v3;

  -[PKCanvasViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("drawing"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeArrayForKey:", CFSTR("strokes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
