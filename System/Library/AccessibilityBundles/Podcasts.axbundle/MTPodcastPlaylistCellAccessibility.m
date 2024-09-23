@implementation MTPodcastPlaylistCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MTPodcastPlaylistCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTPodcastPlaylistCellAccessibility;
  v3 = -[MTPodcastPlaylistCellAccessibility accessibilityTraits](&v8, sel_accessibilityTraits);
  -[MTPodcastPlaylistCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("isAdded"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  v6 = *MEMORY[0x24BDF7400];
  if (!v5)
    v6 = 0;
  return v6 | v3;
}

@end
