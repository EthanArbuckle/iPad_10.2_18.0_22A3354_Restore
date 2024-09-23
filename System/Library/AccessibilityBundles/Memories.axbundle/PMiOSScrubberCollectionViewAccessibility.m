@implementation PMiOSScrubberCollectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PMiOSScrubberCollectionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PMiOSScrubberCollectionView"), CFSTR("collectionViewDelegate"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("PMiOSScrubberViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PMiOSScrubberViewController"), CFSTR("provider"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("PMScrubberProvider"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PMScrubberProvider"), CFSTR("currentDuration"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PMScrubberProvider"), CFSTR("currentProgress"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PMScrubberProvider"), CFSTR("isPlayingCurrent"), "B", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityMemoriesLocalizedString(CFSTR("scrubber.description"));
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  objc_super v14;

  -[PMiOSScrubberCollectionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("collectionViewDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2348C07D8](CFSTR("PMiOSScrubberViewController"));
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_8;
  objc_msgSend(v3, "safeValueForKey:", CFSTR("provider"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2348C07D8](CFSTR("PMScrubberProvider"));
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_8:
    v14.receiver = self;
    v14.super_class = (Class)PMiOSScrubberCollectionViewAccessibility;
    -[PMiOSScrubberCollectionViewAccessibility accessibilityValue](&v14, sel_accessibilityValue);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_msgSend(v4, "safeTimeIntervalForKey:", CFSTR("currentDuration"));
  AXDurationStringForDuration();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeCGFloatForKey:", CFSTR("currentProgress"));
  AXDurationStringForDuration();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "safeBoolForKey:", CFSTR("isPlayingCurrent")))
    v7 = CFSTR("scrubber.playing");
  else
    v7 = CFSTR("scrubber.paused");
  accessibilityMemoriesLocalizedString(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDD17C8];
  accessibilityMemoriesLocalizedString(CFSTR("scrubber.value"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", v10, v6, v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v11;
}

@end
