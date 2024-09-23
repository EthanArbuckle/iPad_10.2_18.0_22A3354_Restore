@implementation PUCollectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUCollectionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_scrollViewAnimationEnded:(id)a3 finished:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  objc_super v6;

  v4 = a4;
  v6.receiver = self;
  v6.super_class = (Class)PUCollectionViewAccessibility;
  -[PUCollectionViewAccessibility _scrollViewAnimationEnded:finished:](&v6, sel__scrollViewAnimationEnded_finished_, a3);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:", CFSTR("AXPhotoCollectionViewScrolled"), 0);

  }
}

- (BOOL)_accessibilityShouldSpeakScrollStatusOnEntry
{
  return 1;
}

@end
