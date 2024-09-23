@implementation _NowPlayingArtViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_NowPlayingArtView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_NowPlayingArtView"), CFSTR("setArtworkView:"), "v", "@", 0);
}

- (void)setArtworkView:(id)a3
{
  id v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_NowPlayingArtViewAccessibility;
  v3 = a3;
  -[_NowPlayingArtViewAccessibility setArtworkView:](&v5, sel_setArtworkView_, v3);
  objc_msgSend(v3, "setIsAccessibilityElement:", 1, v5.receiver, v5.super_class);
  accessibilityLocalizedString(CFSTR("album.art.no.artist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

}

@end
