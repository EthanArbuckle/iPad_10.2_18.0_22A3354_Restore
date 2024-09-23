@implementation PUWallpaperPosterEditorControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUWallpaperPosterEditorController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUWallpaperPosterEditorController"), CFSTR("posterConfiguration"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUWallpaperPosterEditorController"), CFSTR("_photoPickerAction"), "@", 0);

}

- (id)_photoPickerAction
{
  void *v3;
  _QWORD v5[4];
  id v6;
  id location;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PUWallpaperPosterEditorControllerAccessibility;
  -[PUWallpaperPosterEditorControllerAccessibility _photoPickerAction](&v8, sel__photoPickerAction);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __68__PUWallpaperPosterEditorControllerAccessibility__photoPickerAction__block_invoke;
  v5[3] = &unk_24FF15050;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v3, "setAccessibilityLabelBlock:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

id __68__PUWallpaperPosterEditorControllerAccessibility__photoPickerAction__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;

  objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("posterConfiguration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "configurationType") == 1)
    v5 = CFSTR("wallpaper.poster.album.picker.label");
  else
    v5 = CFSTR("wallpaper.poster.photo.picker.label");
  accessibilityPULocalizedString(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
