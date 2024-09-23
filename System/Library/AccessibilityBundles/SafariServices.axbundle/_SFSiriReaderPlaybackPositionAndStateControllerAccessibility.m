@implementation _SFSiriReaderPlaybackPositionAndStateControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_SFSiriReaderPlaybackPositionAndStateController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_SFSiriReaderPlaybackPositionAndStateController"), CFSTR("_stepper"), "<_SFSettingsAlertStepperConfiguration>");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_SFSiriReaderPlaybackPositionAndStateController"), CFSTR("prepareStepper:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_SFSiriReaderPlaybackPositionAndStateController"), CFSTR("_isPlaying"), "BOOL");

}

- (void)prepareStepper:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[5];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_SFSiriReaderPlaybackPositionAndStateControllerAccessibility;
  -[_SFSiriReaderPlaybackPositionAndStateControllerAccessibility prepareStepper:](&v11, sel_prepareStepper_, a3);
  accessibilitySafariServicesLocalizedString(CFSTR("reader.playback"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFSiriReaderPlaybackPositionAndStateControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_stepper"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v4);

  -[_SFSiriReaderPlaybackPositionAndStateControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_stepper"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __79___SFSiriReaderPlaybackPositionAndStateControllerAccessibility_prepareStepper___block_invoke;
  v10[3] = &unk_25032D550;
  v10[4] = self;
  objc_msgSend(v6, "setAccessibilityValueBlock:", v10);

  -[_SFSiriReaderPlaybackPositionAndStateControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_stepper"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __79___SFSiriReaderPlaybackPositionAndStateControllerAccessibility_prepareStepper___block_invoke_2;
  v9[3] = &unk_25032D5C8;
  v9[4] = self;
  objc_msgSend(v8, "_setAccessibilityCustomActionsBlock:", v9);

}

@end
