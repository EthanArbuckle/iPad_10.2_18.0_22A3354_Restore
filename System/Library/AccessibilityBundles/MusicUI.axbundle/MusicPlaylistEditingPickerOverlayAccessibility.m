@implementation MusicPlaylistEditingPickerOverlayAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicPlaylistEditingPickerOverlay");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicPlaylistEditingPickerOverlay"), CFSTR("newAccessoryView"), "@", 0);
}

- (id)newAccessoryView
{
  id v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MusicPlaylistEditingPickerOverlayAccessibility;
  v2 = -[MusicPlaylistEditingPickerOverlayAccessibility newAccessoryView](&v5, sel_newAccessoryView);
  objc_msgSend(v2, "setIsAccessibilityElement:", 1);
  objc_msgSend(v2, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
  accessibilityMusicLocalizedString(CFSTR("add.to.playlist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessibilityLabel:", v3);

  return v2;
}

@end
