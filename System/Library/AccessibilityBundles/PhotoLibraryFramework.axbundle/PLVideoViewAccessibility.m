@implementation PLVideoViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PLVideoView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PLVideoView"), CFSTR("_scrubberBackgroundView"), "UIView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PLVideoView"), CFSTR("_videoCameraImage"), "PLManagedAsset");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLVideoView"), CFSTR("_updateScrubberVisibilityWithDuration:"), "v", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLVideoView"), CFSTR("pathForVideoFile"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PLVideoView"), CFSTR("_trimMessageView"), "PLVideoEditingOverlayView");

}

- (void)_accessibilityClearChildren
{
  -[PLVideoViewAccessibility _accessibilityRemoveValueForKey:](self, "_accessibilityRemoveValueForKey:", *MEMORY[0x24BEBB308]);
}

- (void)_showVideoOverlay
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  objc_super v7;

  -[PLVideoViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_videoOverlayPlayButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)PLVideoViewAccessibility;
  -[PLVideoViewAccessibility _showVideoOverlay](&v7, sel__showVideoOverlay);
  -[PLVideoViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_videoOverlayPlayButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 != v4)
  {
    accessibilityLocalizedString(CFSTR("play.video.button.txt"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAccessibilityLabel:", v5);

  }
  objc_msgSend(v4, "alpha");
  objc_msgSend(v4, "setIsAccessibilityElement:", v6 > 0.0);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);

}

- (void)_videoOverlayFadeOutDidFinish
{
  void *v3;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PLVideoViewAccessibility;
  -[PLVideoViewAccessibility _videoOverlayFadeOutDidFinish](&v5, sel__videoOverlayFadeOutDidFinish);
  -[PLVideoViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_videoOverlayPlayButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alpha");
  objc_msgSend(v3, "setIsAccessibilityElement:", v4 > 0.0);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  -[PLVideoViewAccessibility _accessibilityClearChildren](self, "_accessibilityClearChildren");

}

- (void)viewDidDisappear
{
  void *v3;
  void *v4;
  objc_super v5;

  -[PLVideoViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_scrubber"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5.receiver = self;
  v5.super_class = (Class)PLVideoViewAccessibility;
  -[PLVideoViewAccessibility viewDidDisappear](&v5, sel_viewDidDisappear);
  -[PLVideoViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_scrubber"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 != v4)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  -[PLVideoViewAccessibility _accessibilityClearChildren](self, "_accessibilityClearChildren");

}

- (void)_createScrubberIfNeeded
{
  void *v3;
  void *v4;
  objc_super v5;

  -[PLVideoViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_scrubber"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5.receiver = self;
  v5.super_class = (Class)PLVideoViewAccessibility;
  -[PLVideoViewAccessibility _createScrubberIfNeeded](&v5, sel__createScrubberIfNeeded);
  -[PLVideoViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_scrubber"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 != v4)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  -[PLVideoViewAccessibility _accessibilityClearChildren](self, "_accessibilityClearChildren");

}

- (BOOL)isAccessibilityElement
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[PLVideoViewAccessibility accessibilityElements](self, "accessibilityElements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PLVideoViewAccessibility accessibilityElementCount](self, "accessibilityElementCount"))
  {
    if (objc_msgSend(v3, "count") == 1)
    {
      objc_msgSend(v3, "firstObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLVideoViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_videoOverlayPlayButton"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v4 == v5;

    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[PLVideoViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_videoCameraImage"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityElements
{
  _QWORD *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (_QWORD *)MEMORY[0x24BEBB308];
  -[PLVideoViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", *MEMORY[0x24BEBB308]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
  }
  else
  {
    v6 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCEB8]), "init");
    -[PLVideoViewAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v6, *v3);
    -[PLVideoViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_scrubber"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLVideoViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_scrubberBackgroundView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "_accessibilityViewIsVisible"))
      objc_msgSend(v6, "addObject:", v7);
    -[PLVideoViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_videoOverlayPlayButton"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "_accessibilityViewIsVisible"))
      objc_msgSend(v6, "addObject:", v9);
    -[PLVideoViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_trimMessageView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "_accessibilityViewIsVisible"))
      objc_msgSend(v6, "addObject:", v10);
    -[PLVideoViewAccessibility valueForKey:](self, "valueForKey:", CFSTR("_moviePlayer"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "safeValueForKey:", CFSTR("view"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "safeValueForKey:", CFSTR("_accessibleSubviews"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "count"))
      objc_msgSend(v6, "addObjectsFromArray:", v13);
    v5 = v6;

  }
  return v5;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PLVideoViewAccessibility;
  -[PLVideoViewAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[PLVideoViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_videoOverlayPlayButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("play.video.button.txt"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

}

- (void)_updateScrubberVisibilityWithDuration:(double)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PLVideoViewAccessibility;
  -[PLVideoViewAccessibility _updateScrubberVisibilityWithDuration:](&v4, sel__updateScrubberVisibilityWithDuration_, a3);
  -[PLVideoViewAccessibility _accessibilityClearChildren](self, "_accessibilityClearChildren");
}

- (id)accessibilityURL
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  -[PLVideoViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("pathForVideoFile"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_accessibilityElementStoredUserLabel
{
  void *v2;
  void *v3;

  -[PLVideoViewAccessibility accessibilityURL](self, "accessibilityURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityMetadataDescriptionForVideo();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
