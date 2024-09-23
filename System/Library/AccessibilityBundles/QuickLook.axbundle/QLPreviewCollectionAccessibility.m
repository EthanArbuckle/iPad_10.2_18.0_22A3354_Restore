@implementation QLPreviewCollectionAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("QLPreviewCollection");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("QLMovieItemViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("QLMovieItemViewController"), CFSTR("isEditing"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("QLPreviewCollection"), CFSTR("previewItemViewController:wantsFullScreen:"), "v", "@", "B", 0);

}

- (void)previewItemViewController:(id)a3 wantsFullScreen:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  objc_super v7;

  v4 = a4;
  v6 = a3;
  if (!UIAccessibilityIsVoiceOverRunning()
    || (MEMORY[0x2348C1FC8](CFSTR("QLMovieItemViewController")), (objc_opt_isKindOfClass() & 1) == 0)
    || objc_msgSend(v6, "safeBoolForKey:", CFSTR("isEditing")))
  {
    v7.receiver = self;
    v7.super_class = (Class)QLPreviewCollectionAccessibility;
    -[QLPreviewCollectionAccessibility previewItemViewController:wantsFullScreen:](&v7, sel_previewItemViewController_wantsFullScreen_, v6, v4);
  }

}

@end
