@implementation CNPhotoPickerGlyphProviderItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNPhotoPickerGlyphProviderItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasProperty:withType:", CFSTR("CNPhotoPickerGlyphProviderItem"), CFSTR("symbolImageName"), "@");
}

- (NSString)_axSymbolName
{
  void *v2;
  void *v3;
  __CFString *v4;
  void *v5;

  -[CNPhotoPickerGlyphProviderItemAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("symbolImageName"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    goto LABEL_13;
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("camera")) & 1) == 0)
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("photo.on.rectangle")) & 1) != 0)
    {
      v4 = CFSTR("photo.gallery.button");
      goto LABEL_12;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("face.grinning")) & 1) != 0)
    {
      v4 = CFSTR("new.emoji.button");
      goto LABEL_12;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("pencil")) & 1) != 0)
    {
      v4 = CFSTR("edit.monogram.button");
      goto LABEL_12;
    }
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("plus")))
    {
      v4 = CFSTR("contact.image.add.button.label");
      goto LABEL_12;
    }
LABEL_13:
    v5 = 0;
    goto LABEL_14;
  }
  v4 = CFSTR("take.photo.button");
LABEL_12:
  accessibilityLocalizedString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

  return (NSString *)v5;
}

@end
