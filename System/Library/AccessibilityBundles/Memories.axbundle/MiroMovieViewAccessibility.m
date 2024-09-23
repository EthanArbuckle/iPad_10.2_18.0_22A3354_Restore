@implementation MiroMovieViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MiroMovieView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MiroMovieView"), CFSTR("player"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityMemoriesLocalizedString(CFSTR("memory.movie.description"));
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  float v5;
  void *v6;
  void *v7;
  void *v8;
  CMTime v10;
  char v11;

  v11 = 0;
  objc_opt_class();
  -[MiroMovieViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("player"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "rate");
  if (v5 <= 0.0)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v4, "currentItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      objc_msgSend(v6, "currentTime");
    else
      memset(&v10, 0, sizeof(v10));
    CMTimeGetSeconds(&v10);
    AXDurationStringForDuration();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

@end
