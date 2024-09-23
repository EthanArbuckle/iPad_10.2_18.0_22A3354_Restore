@implementation CustomRoomAlbumCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicApplication.CustomRoomAlbumCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.CustomRoomAlbumCell"), CFSTR("headlineText"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.CustomRoomAlbumCell"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.CustomRoomAlbumCell"), CFSTR("subtitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.CustomRoomAlbumCell"), CFSTR("descriptionText"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[CustomRoomAlbumCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("headlineText, title, subtitle, descriptionText"));
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

@end
