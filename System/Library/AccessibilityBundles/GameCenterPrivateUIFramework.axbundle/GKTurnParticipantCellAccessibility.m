@implementation GKTurnParticipantCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("GKTurnParticipantCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GKTurnParticipantCell"), CFSTR("topLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GKTurnParticipantCell"), CFSTR("bottomLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GKBaseGameCell"), CFSTR("nameLabel"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;

  -[GKTurnParticipantCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("topLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnParticipantCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("nameLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnParticipantCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("bottomLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessibilityLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
