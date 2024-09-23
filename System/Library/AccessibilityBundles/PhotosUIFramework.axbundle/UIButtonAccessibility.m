@implementation UIButtonAccessibility

uint64_t __61__UIButtonAccessibility__PhotosUI__UIKit_accessibilityTraits__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("PUPhotoEditToolPickerController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
