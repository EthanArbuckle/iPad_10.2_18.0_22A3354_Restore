@implementation PHBottomBarButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PHBottomBarButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  objc_super v8;

  -[PHBottomBarButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("action"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  switch(v4)
  {
    case 1:
      v5 = CFSTR("answer.call");
      goto LABEL_11;
    case 3:
      v5 = CFSTR("answer.video.call");
      goto LABEL_11;
    case 7:
    case 8:
      v5 = CFSTR("decline.call");
      goto LABEL_11;
    case 14:
    case 15:
      v5 = CFSTR("end.call");
      goto LABEL_11;
    case 19:
      v5 = CFSTR("camera.flip");
      goto LABEL_11;
    case 20:
      v5 = CFSTR("mute.button");
      goto LABEL_11;
    case 21:
      v5 = CFSTR("audio.route");
      goto LABEL_11;
    case 25:
      v5 = CFSTR("call.text");
LABEL_11:
      accessibilityMobilePhoneLocalizedString(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v8.receiver = self;
      v8.super_class = (Class)PHBottomBarButtonAccessibility;
      -[PHBottomBarButtonAccessibility accessibilityLabel](&v8, sel_accessibilityLabel);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v6;
}

- (id)accessibilityUserInputLabels
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v9.receiver = self;
  v9.super_class = (Class)PHBottomBarButtonAccessibility;
  -[PHBottomBarButtonAccessibility accessibilityUserInputLabels](&v9, sel_accessibilityUserInputLabels);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v4);

  -[PHBottomBarButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("action"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  if ((v6 | 2) == 3)
  {
    accessibilityMobilePhoneLocalizedString(CFSTR("answer"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  return v3;
}

@end
