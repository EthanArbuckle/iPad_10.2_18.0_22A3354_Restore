@implementation ETTranscriptDetailCanvasViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ETTranscriptDetailCanvasViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("DTSCanvasViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("DTSCanvasViewController"), CFSTR("_cancelButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DTSCanvasViewController"), CFSTR("_cancelButton"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("ETTranscriptDetailCanvasViewController"), CFSTR("DTSCanvasViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ETTranscriptDetailCanvasViewController"), CFSTR("_videoOnButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ETTranscriptDetailCanvasViewController"), CFSTR("_videoRecordButton"), "ETVideoRecordButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ETTranscriptDetailCanvasViewController"), CFSTR("_cameraFlipButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ETTranscriptDetailCanvasViewController"), CFSTR("_sendButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ETTranscriptDetailCanvasViewController"), CFSTR("_videoController"), "ETVideoController");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ETTranscriptDetailCanvasViewController"), CFSTR("_photoCaptureButton"), "ETVideoRecordButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ETTranscriptDetailCanvasViewController"), CFSTR("_expandColorPickerButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ETTranscriptDetailCanvasViewController"), CFSTR("_expandToCameraButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ETTranscriptDetailCanvasViewController"), CFSTR("_gestureInstructionButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ETTranscriptDetailCanvasViewController"), CFSTR("_gestureInstructionView"), "GestureInstructionView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ETTranscriptDetailCanvasViewController"), CFSTR("_showingCompositionControls"), "B");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ETTranscriptDetailCanvasViewController"), CFSTR("_expandToGestureInstructionView"), "B");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ETTranscriptDetailCanvasViewController"), CFSTR("colorPicker"), "@", 0);
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("ETTranscriptDetailCanvasViewController"), CFSTR("canvasView"), "@");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ETTranscriptDetailCanvasViewController"), CFSTR("presentationDelegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ETTranscriptDetailCanvasViewController"), CFSTR("viewDidLoad"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ETTranscriptDetailCanvasViewController"), CFSTR("updateVideoUI"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ETTranscriptDetailCanvasViewController"), CFSTR("_cameraFlipButtonTapped"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ETTranscriptDetailCanvasViewController"), CFSTR("_setShowingGestureInstructionView:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ETTranscriptDetailCanvasViewController"), CFSTR("_startShowCompositionControlsTimer"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ETTranscriptDetailCanvasViewController"), CFSTR("expandUI"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ETTranscriptDetailCanvasViewController"), CFSTR("_expandColorPickerButtonTapped"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ETTranscriptDetailCanvasViewController"), CFSTR("_sendButtonTapped"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ETTranscriptDetailCanvasViewController"), CFSTR("videoControllerDidStartPreview:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ETTranscriptDetailCanvasViewController"), CFSTR("videoControllerDidStopPreview:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ETTranscriptDetailCanvasViewController"), CFSTR("colorPicker: requestsPresentColorWheel:"), "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ETTranscriptDetailCanvasViewController"), CFSTR("colorPicker: requestsDismissColorWheel:"), "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("DTSColorPicker"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DTSColorPicker"), CFSTR("paletteCircles"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DTSColorPicker"), CFSTR("selectedCircle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ETTranscriptDetailCanvasViewController"), CFSTR("_showCompositionControlsTimer"), "NSTimer");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ETVideoController"), CFSTR("videoDevice"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVCaptureDevice"), CFSTR("position"), "q", 0);
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("ETTranscriptDetailCanvasViewControllerPresentationDelegate"), CFSTR("canvasViewController: requestsPresentationStyleExpanded:"));

}

- (BOOL)accessibilityPerformEscape
{
  void *v2;
  BOOL v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  -[ETTranscriptDetailCanvasViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("canvasView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "_accessibilityBoolValueForKey:", CFSTR("_axExpanded")))
  {
    objc_msgSend(v2, "_accessibilitySetRetainedValue:forKey:", MEMORY[0x24BDBD1C0], CFSTR("_axExpanded"));
    v5 = 0;
    v6 = &v5;
    v7 = 0x2020000000;
    v8 = 0;
    AXPerformSafeBlock();
    v3 = *((_BYTE *)v6 + 24) != 0;
    _Block_object_dispose(&v5, 8);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void __81__ETTranscriptDetailCanvasViewControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_presentationDelegate"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "canvasViewController:requestsPresentationStyleExpanded:", *(_QWORD *)(a1 + 32), 0);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

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
  void *v20;
  void *v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)ETTranscriptDetailCanvasViewControllerAccessibility;
  -[ETTranscriptDetailCanvasViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v22, sel__accessibilityLoadAccessibilityInformation);
  -[ETTranscriptDetailCanvasViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_videoOnButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("video.on.button.label"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  -[ETTranscriptDetailCanvasViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_cameraFlipButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("camera.chooser.button.hint"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityHint:", v6);

  objc_opt_class();
  -[ETTranscriptDetailCanvasViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_expandColorPickerButton"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  accessibilityLocalizedString(CFSTR("expand.color.picker.button"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityLabel:", v9);

  objc_msgSend(v8, "setAccessibilityIdentifier:", CFSTR("ETCompositionExpandColorPickerButton"));
  objc_opt_class();
  -[ETTranscriptDetailCanvasViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_expandToCameraButton"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  accessibilityLocalizedString(CFSTR("expand.camera.button"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAccessibilityLabel:", v12);

  objc_msgSend(v11, "setAccessibilityIdentifier:", CFSTR("ETCompositionExpandToCameraButton"));
  objc_opt_class();
  -[ETTranscriptDetailCanvasViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_cancelButton"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  accessibilityLocalizedString(CFSTR("cancel.button"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAccessibilityLabel:", v15);

  objc_opt_class();
  -[ETTranscriptDetailCanvasViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_gestureInstructionButton"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  accessibilityLocalizedString(CFSTR("gesture.instruction.button"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAccessibilityLabel:", v18);

  objc_opt_class();
  -[ETTranscriptDetailCanvasViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_sendButton"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  accessibilityLocalizedString(CFSTR("send.button"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAccessibilityLabel:", v21);

}

- (id)_accessibilityCameraFlipButtonLabelForCurrentCamera
{
  void *v3;
  void *v4;
  void *v6;

  accessibilityLocalizedString(CFSTR("camera.chooser.button.label"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ETTranscriptDetailCanvasViewControllerAccessibility _accessibilityStringForCurrentCameraPosition](self, "_accessibilityStringForCurrentCameraPosition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_accessibilityStringForCurrentCameraPosition
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  void *v9;

  -[ETTranscriptDetailCanvasViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_videoController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("videoDevice"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "safeValueForKey:", CFSTR("position"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "integerValue");

    if (v5 == 1)
    {
      v6 = CFSTR("camera.chooser.back.facing");
      goto LABEL_7;
    }
    if (v5 == 2)
    {
      v6 = CFSTR("camera.chooser.front.facing");
LABEL_7:
      accessibilityLocalizedString(v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAXStringForVariables();
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_8;
    }
  }
  v7 = 0;
LABEL_8:

  return v7;
}

- (ETTranscriptDetailCanvasViewControllerAccessibility)init
{
  ETTranscriptDetailCanvasViewControllerAccessibility *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ETTranscriptDetailCanvasViewControllerAccessibility;
  v2 = -[ETTranscriptDetailCanvasViewControllerAccessibility init](&v5, sel_init);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__axFocusChanged_, *MEMORY[0x24BDF7238], 0);

  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF7238], 0);

  v4.receiver = self;
  v4.super_class = (Class)ETTranscriptDetailCanvasViewControllerAccessibility;
  -[ETTranscriptDetailCanvasViewControllerAccessibility dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ETTranscriptDetailCanvasViewControllerAccessibility;
  -[ETTranscriptDetailCanvasViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[ETTranscriptDetailCanvasViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)updateVideoUI
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ETTranscriptDetailCanvasViewControllerAccessibility;
  -[ETTranscriptDetailCanvasViewControllerAccessibility updateVideoUI](&v9, sel_updateVideoUI);
  -[ETTranscriptDetailCanvasViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_photoCaptureButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("take.picture.button.label"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  -[ETTranscriptDetailCanvasViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_videoRecordButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("record.video.button.label"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v6);

  -[ETTranscriptDetailCanvasViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_cameraFlipButton"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ETTranscriptDetailCanvasViewControllerAccessibility _accessibilityCameraFlipButtonLabelForCurrentCamera](self, "_accessibilityCameraFlipButtonLabelForCurrentCamera");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityLabel:", v8);

}

- (void)_cameraFlipButtonTapped
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ETTranscriptDetailCanvasViewControllerAccessibility;
  -[ETTranscriptDetailCanvasViewControllerAccessibility _cameraFlipButtonTapped](&v5, sel__cameraFlipButtonTapped);
  -[ETTranscriptDetailCanvasViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_cameraFlipButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ETTranscriptDetailCanvasViewControllerAccessibility _accessibilityCameraFlipButtonLabelForCurrentCamera](self, "_accessibilityCameraFlipButtonLabelForCurrentCamera");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (void)_setShowingGestureInstructionView:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  _BOOL8 v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ETTranscriptDetailCanvasViewControllerAccessibility;
  -[ETTranscriptDetailCanvasViewControllerAccessibility _setShowingGestureInstructionView:](&v8, sel__setShowingGestureInstructionView_);
  -[ETTranscriptDetailCanvasViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("canvasView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = !v3;
  objc_msgSend(v5, "setIsAccessibilityElement:", v6);
  if (!v6)
  {
    -[ETTranscriptDetailCanvasViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_gestureInstructionView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], v7);

  }
}

- (void)_expandColorPickerButtonTapped
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ETTranscriptDetailCanvasViewControllerAccessibility;
  -[ETTranscriptDetailCanvasViewControllerAccessibility _expandColorPickerButtonTapped](&v7, sel__expandColorPickerButtonTapped);
  -[ETTranscriptDetailCanvasViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("colorPicker"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("selectedCircle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_opt_class();
    objc_msgSend(v3, "safeValueForKey:", CFSTR("paletteCircles"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(v6, "objectAtIndex:", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], v4);

}

- (void)expandUI
{
  void *v3;
  objc_super v4;

  -[ETTranscriptDetailCanvasViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("canvasView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilitySetRetainedValue:forKey:", MEMORY[0x24BDBD1C8], CFSTR("_axExpanded"));
  v4.receiver = self;
  v4.super_class = (Class)ETTranscriptDetailCanvasViewControllerAccessibility;
  -[ETTranscriptDetailCanvasViewControllerAccessibility expandUI](&v4, sel_expandUI);

}

- (void)_sendButtonTapped
{
  void *v3;
  objc_super v4;

  -[ETTranscriptDetailCanvasViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("canvasView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilitySetRetainedValue:forKey:", MEMORY[0x24BDBD1C0], CFSTR("_axExpanded"));
  v4.receiver = self;
  v4.super_class = (Class)ETTranscriptDetailCanvasViewControllerAccessibility;
  -[ETTranscriptDetailCanvasViewControllerAccessibility _sendButtonTapped](&v4, sel__sendButtonTapped);

}

- (void)videoControllerDidStartPreview:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ETTranscriptDetailCanvasViewControllerAccessibility;
  -[ETTranscriptDetailCanvasViewControllerAccessibility videoControllerDidStartPreview:](&v10, sel_videoControllerDidStartPreview_, a3);
  accessibilityLocalizedString(CFSTR("camera.activated"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ETTranscriptDetailCanvasViewControllerAccessibility _accessibilityStringForCurrentCameraPosition](self, "_accessibilityStringForCurrentCameraPosition");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilitySpeakAndDoNotBeInterrupted();

  -[ETTranscriptDetailCanvasViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_videoController"), v9, CFSTR("__AXStringForVariablesSentinel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setIsAccessibilityElement:", 0);
  -[ETTranscriptDetailCanvasViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("canvasView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], v8);

}

- (void)videoControllerDidStopPreview:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ETTranscriptDetailCanvasViewControllerAccessibility;
  -[ETTranscriptDetailCanvasViewControllerAccessibility videoControllerDidStopPreview:](&v5, sel_videoControllerDidStopPreview_, a3);
  -[ETTranscriptDetailCanvasViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("canvasView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsAccessibilityElement:", 1);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], v4);

}

- (void)colorPicker:(id)a3 requestsPresentColorWheel:(id)a4
{
  id v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ETTranscriptDetailCanvasViewControllerAccessibility;
  v6 = a4;
  -[ETTranscriptDetailCanvasViewControllerAccessibility colorPicker:requestsPresentColorWheel:](&v8, sel_colorPicker_requestsPresentColorWheel_, a3, v6);
  -[ETTranscriptDetailCanvasViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("canvasView"), v8.receiver, v8.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIsAccessibilityElement:", 0);

  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], v6);
}

- (void)colorPicker:(id)a3 requestsDismissColorWheel:(id)a4
{
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ETTranscriptDetailCanvasViewControllerAccessibility;
  -[ETTranscriptDetailCanvasViewControllerAccessibility colorPicker:requestsDismissColorWheel:](&v7, sel_colorPicker_requestsDismissColorWheel_, a3, a4);
  -[ETTranscriptDetailCanvasViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("canvasView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsAccessibilityElement:", 1);

  LODWORD(v5) = *MEMORY[0x24BDF72C8];
  -[ETTranscriptDetailCanvasViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("canvasView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification((UIAccessibilityNotifications)v5, v6);

}

- (void)_startShowCompositionControlsTimer
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  objc_super v7;
  _QWORD v8[5];
  char v9;

  if (UIAccessibilityIsSwitchControlRunning() || UIAccessibilityIsVoiceOverRunning())
  {
    -[ETTranscriptDetailCanvasViewControllerAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("ShowControlsTimer"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = objc_alloc(MEMORY[0x24BE005F0]);
      v3 = (void *)objc_msgSend(v4, "initWithTargetSerialQueue:", MEMORY[0x24BDAC9B8]);
      -[ETTranscriptDetailCanvasViewControllerAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v3, CFSTR("ShowControlsTimer"));
    }
    objc_msgSend(v3, "cancel");
    v9 = 0;
    objc_opt_class();
    -[ETTranscriptDetailCanvasViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_showCompositionControlsTimer"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "invalidate");
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __89__ETTranscriptDetailCanvasViewControllerAccessibility__startShowCompositionControlsTimer__block_invoke;
    v8[3] = &unk_2501F4440;
    v8[4] = self;
    objc_msgSend(v3, "afterDelay:processBlock:", v8, 20.0);

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)ETTranscriptDetailCanvasViewControllerAccessibility;
    -[ETTranscriptDetailCanvasViewControllerAccessibility _startShowCompositionControlsTimer](&v7, sel__startShowCompositionControlsTimer);
  }
}

id __89__ETTranscriptDetailCanvasViewControllerAccessibility__startShowCompositionControlsTimer__block_invoke(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)ETTranscriptDetailCanvasViewControllerAccessibility;
  return objc_msgSendSuper2(&v2, sel__startShowCompositionControlsTimer);
}

- (void)_axFocusChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BDF7248]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDF7438]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[ETTranscriptDetailCanvasViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("colorPicker"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v9, "safeValueForKey:", CFSTR("paletteCircles"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v11, "containsObject:", v6) & 1) != 0 || objc_msgSend(v11, "containsObject:", v8))
    AXPerformSafeBlock();

}

uint64_t __71__ETTranscriptDetailCanvasViewControllerAccessibility__axFocusChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startShowCompositionControlsTimer");
}

@end
