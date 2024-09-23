@implementation MessagesViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MessagesViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("AVTAvatarListCell"));
  objc_msgSend(v3, "validateClass:", CFSTR("AVTAvatar"));
  objc_msgSend(v3, "validateClass:", CFSTR("AVTAnimoji"));
  objc_msgSend(v3, "validateClass:", CFSTR("AVTMemoji"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MessagesViewController"), CFSTR("MSMessagesAppViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PuppetCollectionViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MessagesViewController"), CFSTR("_confirmSendingMessageButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MessagesViewController"), CFSTR("_cancelSendingMessageButton"), "InsetBackgroundUIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MessagesViewController"), CFSTR("_replayMessageButton"), "ImageLabelButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MessagesViewController"), CFSTR("_editButton"), "InsetBackgroundUIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MessagesViewController"), CFSTR("_recordButton"), "RecordButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MessagesViewController"), CFSTR("_recording"), "BOOL");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MessagesViewController"), CFSTR("_puppetView"), "AVTRecordView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MessagesViewController"), CFSTR("_puppetCollectionViewController"), "PuppetCollectionViewController");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MessagesViewController"), CFSTR("_userInfoView"), "AVTUserInfoView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MessagesViewController"), CFSTR("_avatarListController"), "<AVTRecordingCarouselController>");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MessagesViewController"), CFSTR("_avatarDataSource"), "AVTAvatarRecordDataSource");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MessagesViewController"), CFSTR("_recordingDisplayView"), "RecordingTimeDisplayView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MessagesViewController"), CFSTR("_UIState"), "Q");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MessagesViewController"), CFSTR("_arSessionState"), "Q");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTPuppetView"), CFSTR("mute"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTPuppetView"), CFSTR("faceIsTracked"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MSMessagesAppViewController"), CFSTR("presentationStyle"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessagesViewController"), CFSTR("displaysLaunchScreen"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTMultiAvatarController"), CFSTR("liveCell"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTMultiAvatarController"), CFSTR("addItemView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTMultiAvatarController"), CFSTR("collectionView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTMultiAvatarController"), CFSTR("recordListItems"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTMultiAvatarController"), CFSTR("displayedRecord"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTAvatarListCell"), CFSTR("avatar"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTAvatarListCell"), CFSTR("avtView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTUserInfoView"), CFSTR("text"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RecordingTimeDisplayView"), CFSTR("timerLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTAvatarPuppetRecord"), CFSTR("puppetName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTAvatarRecord"), CFSTR("avatarData"), "@", 0);
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("AVTAvatarRecord"), CFSTR("isEditable"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PuppetCollectionViewController"), CFSTR("selectedRecord"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessagesViewController"), CFSTR("handleRecordTap:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessagesViewController"), CFSTR("viewDidLoad"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessagesViewController"), CFSTR("updateUIState:animated:"), "v", "Q", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessagesViewController"), CFSTR("observeValueForKeyPath:ofObject:change:context:"), "v", "@", "@", "@", "^v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessagesViewController"), CFSTR("handleSceneShortPress:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessagesViewController"), CFSTR("recordingDidFinish:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessagesViewController"), CFSTR("showUserInfoLabelWithText:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessagesViewController"), CFSTR("hideUserInfoLabelWithDuration:"), "v", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessagesViewController"), CFSTR("handleResumeTrackingTap:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessagesViewController"), CFSTR("willTransitionToPresentationStyle:"), "v", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessagesViewController"), CFSTR("dismissAvatarUIControllerAnimated:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessagesViewController"), CFSTR("dismissLaunchScreenIfNecessaryForPresentationStyle:controller:"), "v", "Q", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessagesViewController"), CFSTR("updateEditButtonVisibilityForceHide:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessagesViewController"), CFSTR("shouldPerformSegueWithIdentifier:sender:"), "B", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTAvatarRecordDataSource"), CFSTR("numberOfRecords"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTMultiAvatarController"), CFSTR("indexPathForItemClosestToCenter"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTMultiAvatarController"), CFSTR("loadRecords"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTMultiAvatarController"), CFSTR("displayAvatarForRecord:animated:"), "v", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTMultiAvatarController"), CFSTR("scrollToViewAtIndex:animated:"), "v", "Q", "B", 0);

}

- (id)_axLiveCell
{
  JUMPOUT(0x234905738);
}

- (void)_setAXLiveCell:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (id)_axAvatarCarousel
{
  JUMPOUT(0x234905738);
}

- (void)_setAXAvatarCarousel:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  AX_AvatarCarousel *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id location;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)MessagesViewControllerAccessibility;
  -[MessagesViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v25, sel__accessibilityLoadAccessibilityInformation);
  -[MessagesViewControllerAccessibility _accessibilityUpdateRecordButtonLabel](self, "_accessibilityUpdateRecordButtonLabel");
  LOBYTE(location) = 0;
  objc_opt_class();
  -[MessagesViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_recordButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BDF7408] | *MEMORY[0x24BDF73B0]);
  accessibilityJellyfishLocalizedString(CFSTR("button.record.hint"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityHint:", v5);

  -[MessagesViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_confirmSendingMessageButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityJellyfishLocalizedString(CFSTR("button.send"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityLabel:", v7);

  -[MessagesViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_cancelSendingMessageButton"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityJellyfishLocalizedString(CFSTR("button.cancel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityLabel:", v9);

  -[MessagesViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_replayMessageButton"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityJellyfishLocalizedString(CFSTR("button.replay"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccessibilityLabel:", v11);

  -[MessagesViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_editButton"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityJellyfishLocalizedString(CFSTR("button.edit"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAccessibilityLabel:", v13);

  LOBYTE(location) = 0;
  objc_opt_class();
  -[MessagesViewControllerAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("_recordingDisplayView.timerLabel"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, v15);
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __81__MessagesViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v22[3] = &unk_25014D1F8;
  objc_copyWeak(&v23, &location);
  objc_msgSend(v15, "_setAccessibilityLabelBlock:", v22);
  -[MessagesViewControllerAccessibility _accessibilityUpdateCollectionViewAccessibilityForPresentationStyle:](self, "_accessibilityUpdateCollectionViewAccessibilityForPresentationStyle:", -[MessagesViewControllerAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("presentationStyle")));
  -[MessagesViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_avatarListController"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "safeUIViewForKey:", CFSTR("view"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_accessibilityLoadAccessibilityInformation");
  objc_opt_class();
  objc_msgSend(v16, "safeValueForKeyPath:", CFSTR("multiAvatarController.liveCell"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[MessagesViewControllerAccessibility _setAXLiveCell:](self, "_setAXLiveCell:", v19);
  -[MessagesViewControllerAccessibility _axAvatarCarousel](self, "_axAvatarCarousel");
  v20 = (AX_AvatarCarousel *)objc_claimAutoreleasedReturnValue();
  if (!v20 && v17)
  {
    v20 = -[AX_AvatarCarousel initWithMessagesController:accessibilityContainer:]([AX_AvatarCarousel alloc], "initWithMessagesController:accessibilityContainer:", self, v17);
    -[MessagesViewControllerAccessibility _setAXAvatarCarousel:](self, "_setAXAvatarCarousel:", v20);
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 1, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAccessibilityElements:", v21);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

}

id __81__MessagesViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;
  void *v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x24BDFEA60]);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithString:", v4);

  objc_msgSend(v5, "setAttribute:forKey:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDFEB00]);
  return v5;
}

- (void)_accessibilityUpdateRecordButtonLabel
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;

  objc_opt_class();
  -[MessagesViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_recordButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[MessagesViewControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_recording")))v5 = CFSTR("button.record.stop");
  else
    v5 = CFSTR("button.record.start");
  accessibilityJellyfishLocalizedString(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v6);

}

- (void)_accessibilityUpdateCollectionViewAccessibilityForPresentationStyle:(unint64_t)a3
{
  void *v5;
  unsigned int v6;
  uint64_t v7;
  id v8;

  -[MessagesViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_puppetCollectionViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("view"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v6 = -[MessagesViewControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("displaysLaunchScreen"));
  if (a3 == 1)
    v7 = v6;
  else
    v7 = 1;
  objc_msgSend(v8, "setAccessibilityElementsHidden:", v7);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MessagesViewControllerAccessibility;
  -[MessagesViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[MessagesViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)handleRecordTap:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MessagesViewControllerAccessibility;
  -[MessagesViewControllerAccessibility handleRecordTap:](&v4, sel_handleRecordTap_, a3);
  -[MessagesViewControllerAccessibility _accessibilityUpdateRecordButtonLabel](self, "_accessibilityUpdateRecordButtonLabel");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  __CFString *v19;
  void *v20;
  objc_super v21;
  char v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("faceIsTracked")))
  {
    v22 = 0;
    objc_opt_class();
    -[MessagesViewControllerAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("_avatarListController.multiAvatarController.liveCell"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[MessagesViewControllerAccessibility _axLiveCell](self, "_axLiveCell");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (v16)
    {
      -[MessagesViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_puppetView"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "safeBoolForKey:", CFSTR("faceIsTracked"));

      if (v18)
        v19 = CFSTR("face.tracking.enabled");
      else
        v19 = CFSTR("face.tracking.disabled");
      accessibilityJellyfishLocalizedString(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      UIAccessibilitySpeak();

    }
    else
    {
      -[MessagesViewControllerAccessibility _setAXLiveCell:](self, "_setAXLiveCell:", v14);
    }

  }
  v21.receiver = self;
  v21.super_class = (Class)MessagesViewControllerAccessibility;
  -[MessagesViewControllerAccessibility observeValueForKeyPath:ofObject:change:context:](&v21, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);

}

- (void)recordingDidFinish:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MessagesViewControllerAccessibility;
  -[MessagesViewControllerAccessibility recordingDidFinish:](&v4, sel_recordingDidFinish_, a3);
  -[MessagesViewControllerAccessibility _accessibilityUpdateRecordButtonLabel](self, "_accessibilityUpdateRecordButtonLabel");
}

- (id)_axLastUserInfoString
{
  JUMPOUT(0x234905738);
}

- (void)_setAXLastUserInfoString:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (void)showUserInfoLabelWithText:(id)a3
{
  id v4;
  void *v5;
  char v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MessagesViewControllerAccessibility;
  -[MessagesViewControllerAccessibility showUserInfoLabelWithText:](&v7, sel_showUserInfoLabelWithText_, v4);
  -[MessagesViewControllerAccessibility _axLastUserInfoString](self, "_axLastUserInfoString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    -[MessagesViewControllerAccessibility _setAXLastUserInfoString:](self, "_setAXLastUserInfoString:", v4);
    UIAccessibilitySpeakOrQueueIfNeeded();
  }

}

- (void)hideUserInfoLabelWithDuration:(double)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MessagesViewControllerAccessibility;
  -[MessagesViewControllerAccessibility hideUserInfoLabelWithDuration:](&v4, sel_hideUserInfoLabelWithDuration_, a3);
  -[MessagesViewControllerAccessibility _setAXLastUserInfoString:](self, "_setAXLastUserInfoString:", 0);
}

- (void)willTransitionToPresentationStyle:(unint64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MessagesViewControllerAccessibility;
  -[MessagesViewControllerAccessibility willTransitionToPresentationStyle:](&v5, sel_willTransitionToPresentationStyle_);
  -[MessagesViewControllerAccessibility _accessibilityUpdateCollectionViewAccessibilityForPresentationStyle:](self, "_accessibilityUpdateCollectionViewAccessibilityForPresentationStyle:", a3);
}

- (void)dismissLaunchScreenIfNecessaryForPresentationStyle:(unint64_t)a3 controller:(id)a4
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MessagesViewControllerAccessibility;
  -[MessagesViewControllerAccessibility dismissLaunchScreenIfNecessaryForPresentationStyle:controller:](&v6, sel_dismissLaunchScreenIfNecessaryForPresentationStyle_controller_, a3, a4);
  -[MessagesViewControllerAccessibility _accessibilityUpdateCollectionViewAccessibilityForPresentationStyle:](self, "_accessibilityUpdateCollectionViewAccessibilityForPresentationStyle:", a3);
}

- (void)updateEditButtonVisibilityForceHide:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MessagesViewControllerAccessibility;
  -[MessagesViewControllerAccessibility updateEditButtonVisibilityForceHide:](&v3, sel_updateEditButtonVisibilityForceHide_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (BOOL)shouldPerformSegueWithIdentifier:(id)a3 sender:(id)a4
{
  BOOL v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MessagesViewControllerAccessibility;
  v5 = -[MessagesViewControllerAccessibility shouldPerformSegueWithIdentifier:sender:](&v7, sel_shouldPerformSegueWithIdentifier_sender_, a3, a4);
  -[MessagesViewControllerAccessibility _accessibilityUpdateCollectionViewAccessibilityForPresentationStyle:](self, "_accessibilityUpdateCollectionViewAccessibilityForPresentationStyle:", -[MessagesViewControllerAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("presentationStyle")));
  return v5;
}

@end
