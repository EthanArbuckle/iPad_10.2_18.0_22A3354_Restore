@implementation NCDigestSummaryPlatterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NCDigestSummaryPlatterView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCDigestSummaryPlatterView"), CFSTR("heading"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCDigestSummaryPlatterView"), CFSTR("date"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCDigestSummaryPlatterView"), CFSTR("count"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCDigestSummaryPlatterView"), CFSTR("featuredNotificationContentProviders"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCDigestFeaturedNotificationContentProvider"), CFSTR("defaultActionBlock"), "@?", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("NCDigestFeaturedNotificationContentProvider"), CFSTR("NCNotificationRequestContentProvider"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationRequestContentProvider"), CFSTR("notificationRequest"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationRequest"), CFSTR("content"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationRequest"), CFSTR("options"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationContent"), CFSTR("defaultHeader"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationContent"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationContent"), CFSTR("message"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationContent"), CFSTR("attachmentImage"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NCDigestSummaryPlatterView"), CFSTR("_summaryView"), "NCDigestSummaryView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NCDigestSummaryView"), CFSTR("_timeStampLabel"), "UILabel<BSUIDateLabel>");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NCDigestSummaryView"), CFSTR("_headingLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationOptions"), CFSTR("suppressesTitleWhenLocked"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationOptions"), CFSTR("suppressesSubtitleWhenLocked"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationOptions"), CFSTR("suppressesBodyWhenLocked"), "B", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  -[NCDigestSummaryPlatterViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("heading"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCDigestSummaryPlatterViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("_summaryView._timeStampLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NCDigestSummaryPlatterViewAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("count")))
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("digest.notification.count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringWithFormat:", v6, -[NCDigestSummaryPlatterViewAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("count")));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[NCDigestSummaryPlatterViewAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("featuredNotificationContentProviders"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      v23 = v7;
      objc_msgSend(v8, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "safeValueForKeyPath:", CFSTR("notificationRequest.content"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "safeStringForKey:", CFSTR("defaultHeader"));
      v11 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "safeStringForKey:", CFSTR("title"));
      v12 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "safeStringForKey:", CFSTR("subtitle"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "safeStringForKey:", CFSTR("message"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "safeValueForKey:", CFSTR("attachmentImage"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        accessibilityLocalizedString(CFSTR("attachment.label"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = 0;
      }

      v22 = (void *)v11;
      objc_msgSend(MEMORY[0x24BDBCEB8], "axArrayByIgnoringNilElementsWithCount:", 3, v3, v4, v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "safeValueForKeyPath:", CFSTR("notificationRequest.options"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!_isDevicePasscodeLocked()
        || (objc_msgSend(v18, "safeBoolForKey:", CFSTR("suppressesTitleWhenLocked")) & 1) == 0)
      {
        objc_msgSend(v17, "axSafelyAddObject:", v12);
      }
      v21 = v9;
      if (!_isDevicePasscodeLocked()
        || (objc_msgSend(v18, "safeBoolForKey:", CFSTR("suppressesSubtitleWhenLocked")) & 1) == 0)
      {
        objc_msgSend(v17, "axSafelyAddObject:", v13);
      }
      v19 = (void *)v12;
      if (!_isDevicePasscodeLocked()
        || (objc_msgSend(v18, "safeBoolForKey:", CFSTR("suppressesBodyWhenLocked")) & 1) == 0)
      {
        objc_msgSend(v17, "axSafelyAddObject:", v24);
        objc_msgSend(v17, "axSafelyAddObject:", v15);
      }
      MEMORY[0x234923410](v17);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = v23;
    }
    else
    {
      __UIAXStringForVariables();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    __UIAXStringForVariables();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(CFSTR("notification.cell.collapsed.hint"));
}

- (CGPoint)accessibilityActivationPoint
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[NCDigestSummaryPlatterViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("_summaryView._headingLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityActivationPoint");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (id)accessibilityCustomActions
{
  void *v2;
  uint64_t i;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id obj;
  uint64_t v18;
  id v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  id location;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  -[NCDigestSummaryPlatterViewAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("featuredNotificationContentProviders"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v2;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v20)
  {
    v18 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v4, "safeValueForKeyPath:", CFSTR("notificationRequest.content"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "safeStringForKey:", CFSTR("defaultHeader"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "safeStringForKey:", CFSTR("title"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "safeStringForKey:", CFSTR("message"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "safeValueForKey:", CFSTR("attachmentImage"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          accessibilityLocalizedString(CFSTR("attachment.label"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v10 = 0;
        }

        objc_msgSend(MEMORY[0x24BDBCEB8], "axArrayByIgnoringNilElementsWithCount:", 1, v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "safeValueForKeyPath:", CFSTR("notificationRequest.options"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!_isDevicePasscodeLocked()
          || (objc_msgSend(v12, "safeBoolForKey:", CFSTR("suppressesTitleWhenLocked")) & 1) == 0)
        {
          objc_msgSend(v11, "axSafelyAddObject:", v7);
        }
        if (!_isDevicePasscodeLocked()
          || (objc_msgSend(v12, "safeBoolForKey:", CFSTR("suppressesBodyWhenLocked")) & 1) == 0)
        {
          objc_msgSend(v11, "axSafelyAddObject:", v8);
          objc_msgSend(v11, "axSafelyAddObject:", v10);
        }
        MEMORY[0x234923410](v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_initWeak(&location, v4);
        v14 = objc_alloc(MEMORY[0x24BDF6788]);
        v21[0] = MEMORY[0x24BDAC760];
        v21[1] = 3221225472;
        v21[2] = __69__NCDigestSummaryPlatterViewAccessibility_accessibilityCustomActions__block_invoke;
        v21[3] = &unk_2503BDE88;
        objc_copyWeak(&v22, &location);
        v15 = (void *)objc_msgSend(v14, "initWithName:actionHandler:", v13, v21);
        objc_msgSend(v19, "axSafelyAddObject:", v15);

        objc_destroyWeak(&v22);
        objc_destroyWeak(&location);

      }
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v20);
  }

  return v19;
}

uint64_t __69__NCDigestSummaryPlatterViewAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void (**v2)(_QWORD);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("defaultActionBlock"));
  v2 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();

  if (v2)
    v2[2](v2);

  return 1;
}

@end
