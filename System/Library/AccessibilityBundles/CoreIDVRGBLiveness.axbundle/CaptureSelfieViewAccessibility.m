@implementation CaptureSelfieViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CoreIDVRGBLiveness.CaptureSelfieView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CoreIDVRGBLiveness.CaptureSelfieView"), CFSTR("setCoachingPromptText:"), "v", "@", 0);
}

- (void)setCoachingPromptText:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CaptureSelfieViewAccessibility;
  -[CaptureSelfieViewAccessibility setCoachingPromptText:](&v4, sel_setCoachingPromptText_, a3);
  -[CaptureSelfieViewAccessibility _axHandleNonInterruptableCoachingAnnouncement](self, "_axHandleNonInterruptableCoachingAnnouncement");
}

- (void)_axHandleNonInterruptableCoachingAnnouncement
{
  id v3;

  -[CaptureSelfieViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("coachingPrompt"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CaptureSelfieViewAccessibility _axHandleAnnouncementMachine:polite:moveToView:](self, "_axHandleAnnouncementMachine:polite:moveToView:", v3, 0, 0);

}

- (void)_axHandleAnnouncementMachine:(id)a3 polite:(BOOL)a4 moveToView:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  UIAccessibilityNotifications *v14;
  uint64_t v15;
  _QWORD v16[2];

  v5 = a5;
  v6 = a4;
  v16[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (objc_msgSend(v7, "_accessibilityViewIsVisible"))
  {
    objc_msgSend(v7, "accessibilityLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqualToString:", _axHandleAnnouncementMachine_polite_moveToView__LastPrompt) & 1) == 0
      && objc_msgSend(v8, "length"))
    {
      v9 = (id)*MEMORY[0x24BDF7300];
      if (v6)
      {
        v10 = (id)*MEMORY[0x24BDF7308];

        v9 = v10;
      }
      v11 = objc_alloc(MEMORY[0x24BDD1458]);
      v15 = *MEMORY[0x24BDF7348];
      v16[0] = v9;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v11, "initWithString:attributes:", v8, v12);

      v14 = (UIAccessibilityNotifications *)MEMORY[0x24BDF72C8];
      if (!v5)
        v14 = (UIAccessibilityNotifications *)MEMORY[0x24BDF71E8];
      UIAccessibilityPostNotification(*v14, v13);
      objc_storeStrong((id *)&_axHandleAnnouncementMachine_polite_moveToView__LastPrompt, v8);

    }
  }

}

@end
