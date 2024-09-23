@implementation EKDayOccurrenceView_QSExtras

+ (id)safeCategoryTargetClassName
{
  return CFSTR("EKDayOccurrenceView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKDayOccurrenceView"), CFSTR("occurrence"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKEvent"), CFSTR("title"), "@", 0);

}

- (id)_accessibilityQuickSpeakContent
{
  void *v2;
  void *v3;

  -[EKDayOccurrenceView_QSExtras safeValueForKey:](self, "safeValueForKey:", CFSTR("occurrence"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeStringForKey:", CFSTR("title"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
