@implementation ETGLSketchViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ETGLSketchView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("ETGLSketchView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ETGLSketchView"), CFSTR("setPaused:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ETGLSketchView"), CFSTR("animateOutWithCompletion:"), "v", "@?", 0);

}

- (void)setPaused:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;
  uint64_t v6;
  uint64_t v7;
  id (*v8)(uint64_t);
  void *v9;
  ETGLSketchViewAccessibility *v10;
  BOOL v11;

  v3 = a3;
  if (a3 || !UIAccessibilityIsVoiceOverRunning())
  {
    v5.receiver = self;
    v5.super_class = (Class)ETGLSketchViewAccessibility;
    -[ETGLSketchViewAccessibility setPaused:](&v5, sel_setPaused_, v3);
  }
  else
  {
    v6 = MEMORY[0x24BDAC760];
    v7 = 3221225472;
    v8 = __41__ETGLSketchViewAccessibility_setPaused___block_invoke;
    v9 = &unk_2501F5F28;
    v11 = v3;
    v10 = self;
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

id __41__ETGLSketchViewAccessibility_setPaused___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)ETGLSketchViewAccessibility;
  return objc_msgSendSuper2(&v3, sel_setPaused_, v1);
}

- (void)animateOutWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  objc_super v5;

  v4 = (void (**)(_QWORD))a3;
  if (UIAccessibilityIsVoiceOverRunning())
  {
    if (v4)
      v4[2](v4);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)ETGLSketchViewAccessibility;
    -[ETGLSketchViewAccessibility animateOutWithCompletion:](&v5, sel_animateOutWithCompletion_, v4);
  }

}

@end
