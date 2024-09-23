@implementation AVPictureInPicturePlatformAdapterAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVPictureInPicturePlatformAdapter");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_axIsPictureInPictureActive
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_axSetIsPictureInPictureActive:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("AVPictureInPicturePlatformAdapter"), CFSTR("AVPictureInPictureViewControllerDelegate"));
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("AVPictureInPictureViewControllerDelegate"), CFSTR("pictureInPictureViewControllerViewDidAppear:"));
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("AVPictureInPictureViewControllerDelegate"), CFSTR("pictureInPictureViewControllerViewWillDisappear:"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVPictureInPicturePlatformAdapter"), CFSTR("pictureInPictureViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("AVPictureInPicturePlatformAdapter"), CFSTR("playerController"), "@");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVPlayerController"), CFSTR("metadata"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AVPictureInPicturePlatformAdapterAccessibility;
  -[AVPictureInPicturePlatformAdapterAccessibility _accessibilityLoadAccessibilityInformation](&v11, sel__accessibilityLoadAccessibilityInformation);
  -[AVPictureInPicturePlatformAdapterAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("pictureInPictureViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("PIPUIView"));
  -[AVPictureInPicturePlatformAdapterAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("playerController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("WebAVPlayerController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    accessibilityLocalizedString(CFSTR("pip.safari.video.background.view.label"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    if (!v6)
      goto LABEL_9;
    goto LABEL_8;
  }
  objc_msgSend(v5, "safeValueForKey:", CFSTR("metadata"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BDB1DA0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    v9 = v7;
  }
  else
  {
    accessibilityLocalizedString(CFSTR("pip.video.background.view.label"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v9;

  if (v6)
LABEL_8:
    objc_msgSend(v4, "setAccessibilityLabel:", v6);
LABEL_9:
  objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BDFEFC8]);
  objc_msgSend(v4, "setIsAccessibilityElement:", 1);
  accessibilityLocalizedString(CFSTR("media.background.ios.view.hint"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityHint:", v10);

}

- (void)_axPostPIPStoppedNotification
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", AXPIPStoppedNotification, self);

}

- (AVPictureInPicturePlatformAdapterAccessibility)init
{
  AVPictureInPicturePlatformAdapterAccessibility *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVPictureInPicturePlatformAdapterAccessibility;
  v2 = -[AVPictureInPicturePlatformAdapterAccessibility init](&v4, sel_init);
  -[AVPictureInPicturePlatformAdapterAccessibility _accessibilityLoadAccessibilityInformation](v2, "_accessibilityLoadAccessibilityInformation");
  return v2;
}

- (void)startPictureInPicture
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AVPictureInPicturePlatformAdapterAccessibility;
  -[AVPictureInPicturePlatformAdapterAccessibility startPictureInPicture](&v2, sel_startPictureInPicture);
}

- (void)pictureInPictureViewControllerViewDidAppear:(id)a3
{
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVPictureInPicturePlatformAdapterAccessibility;
  -[AVPictureInPicturePlatformAdapterAccessibility pictureInPictureViewControllerViewDidAppear:](&v8, sel_pictureInPictureViewControllerViewDidAppear_, a3);
  -[AVPictureInPicturePlatformAdapterAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
  -[AVPictureInPicturePlatformAdapterAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("pictureInPictureViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], v5);
  if (-[AVPictureInPicturePlatformAdapterAccessibility _axIsPictureInPictureActive](self, "_axIsPictureInPictureActive"))
  {
    v6 = CFSTR("pip.swapped.announcement");
  }
  else
  {
    v6 = CFSTR("pip.displayed.announcement");
  }
  accessibilityLocalizedString(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilitySpeakAndDoNotBeInterrupted();

}

- (void)pictureInPictureViewControllerViewWillDisappear:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVPictureInPicturePlatformAdapterAccessibility;
  -[AVPictureInPicturePlatformAdapterAccessibility pictureInPictureViewControllerViewWillDisappear:](&v4, sel_pictureInPictureViewControllerViewWillDisappear_, a3);
  -[AVPictureInPicturePlatformAdapterAccessibility _axPostPIPStoppedNotification](self, "_axPostPIPStoppedNotification");
}

@end
