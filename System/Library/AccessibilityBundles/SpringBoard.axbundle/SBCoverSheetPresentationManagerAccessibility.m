@implementation SBCoverSheetPresentationManagerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBCoverSheetPresentationManager");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBCoverSheetPresentationManager"), CFSTR("setCoverSheetPresented:animated:options:withCompletion:"), "v", "B", "B", "Q", "@?", 0);
}

- (void)setCoverSheetPresented:(BOOL)a3 animated:(BOOL)a4 options:(unint64_t)a5 withCompletion:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  objc_super v11;
  _QWORD v12[4];
  id v13;

  v7 = a4;
  v8 = a3;
  v12[1] = 3221225472;
  v12[2] = __103__SBCoverSheetPresentationManagerAccessibility_setCoverSheetPresented_animated_options_withCompletion___block_invoke;
  v12[3] = &unk_250367E68;
  v13 = a6;
  v11.receiver = self;
  v11.super_class = (Class)SBCoverSheetPresentationManagerAccessibility;
  v12[0] = MEMORY[0x24BDAC760];
  v10 = v13;
  -[SBCoverSheetPresentationManagerAccessibility setCoverSheetPresented:animated:options:withCompletion:](&v11, sel_setCoverSheetPresented_animated_options_withCompletion_, v8, v7, a5, v12);

}

uint64_t __103__SBCoverSheetPresentationManagerAccessibility_setCoverSheetPresented_animated_options_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
