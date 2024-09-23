@implementation PUVideoEditViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUVideoEditViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PUVideoEditViewController"), CFSTR("_playButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUVideoEditViewController"), CFSTR("_updateButtonsIfNeeded"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUVideoEditViewController"), CFSTR("_playerIsPlaying"), "B", 0);

}

- (void)_updateButtonsIfNeeded
{
  int v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PUVideoEditViewControllerAccessibility;
  -[PUVideoEditViewControllerAccessibility _updateButtonsIfNeeded](&v13, sel__updateButtonsIfNeeded);
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v8 = MEMORY[0x24BDAC760];
  AXPerformSafeBlock();
  v3 = *((unsigned __int8 *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  v4 = CFSTR("video.edit.pause");
  if (!v3)
    v4 = CFSTR("video.edit.play");
  v5 = v4;
  -[PUVideoEditViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_playButton"), v8, 3221225472, __64__PUVideoEditViewControllerAccessibility__updateButtonsIfNeeded__block_invoke, &unk_24FF04340, self, &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityPhotosEditUILocalizedString(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setAccessibilityLabel:", v7);
}

uint64_t __64__PUVideoEditViewControllerAccessibility__updateButtonsIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_playerIsPlaying");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end
