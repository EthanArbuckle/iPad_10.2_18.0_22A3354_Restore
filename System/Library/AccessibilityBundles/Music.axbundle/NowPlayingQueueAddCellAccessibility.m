@implementation NowPlayingQueueAddCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Music.NowPlayingQueueAddCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityMusicLocalizedString(CFSTR("add.songs.to.queue.button"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NowPlayingQueueAddCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[NowPlayingQueueAddCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
