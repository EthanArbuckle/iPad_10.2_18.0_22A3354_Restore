@implementation InCallControlsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ConversationKit.InCallControlsViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("ConversationKit.InCallControlsViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("ConversationKit.InCallControlsViewController"), CFSTR("delegate"), "Optional<InCallControlsViewControllerDelegate>");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.InCallControlsViewController"), CFSTR("accessibilityHotdog"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.InCallControlsViewController"), CFSTR("accessibilityJoinLeaveButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.InCallControlsViewController"), CFSTR("accessibilityEffectsButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.InCallControlsViewController"), CFSTR("accessibilityCameraButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.InCallControlsViewController"), CFSTR("accessibilityCameraLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.InCallControlsViewController"), CFSTR("accessibilityDisableVideoButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.InCallControlsViewController"), CFSTR("shouldShowLeaveButton"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.InCallControlsViewController"), CFSTR("isExpanded"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MultiwayViewControllerAccessibility"), CFSTR("_accessibilityExpandControls"), "v", 0);

}

- (BOOL)accessibilityPerformEscape
{
  char v3;
  void *v4;
  uint64_t v5;

  if ((-[InCallControlsViewControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isExpanded")) & 1) != 0)
    return 0;
  -[InCallControlsViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityEffectsButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "accessibilityTraits");
  if ((*MEMORY[0x24BDF7400] & ~v5) != 0)
    v3 = 0;
  else
    v3 = objc_msgSend(v4, "accessibilityActivate");

  return v3;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id from;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  id location;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)InCallControlsViewControllerAccessibility;
  -[InCallControlsViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v29, sel__accessibilityLoadAccessibilityInformation);
  objc_initWeak(&location, self);
  -[InCallControlsViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __87__InCallControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v26[3] = &unk_2501E5B80;
  objc_copyWeak(&v27, &location);
  objc_msgSend(v3, "_setAccessibilityViewIsModalBlock:", v26);

  -[InCallControlsViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityHotdog"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsAccessibilityElement:", 1);
  objc_msgSend(v5, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
  accessibilityLocalizedString(CFSTR("controls.grabber"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v6);

  v24[0] = v4;
  v24[1] = 3221225472;
  v24[2] = __87__InCallControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v24[3] = &unk_2501E5BD0;
  objc_copyWeak(&v25, &location);
  objc_msgSend(v5, "_setAccessibilityValueBlock:", v24);
  v22[0] = v4;
  v22[1] = 3221225472;
  v22[2] = __87__InCallControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v22[3] = &unk_2501E5BD0;
  objc_copyWeak(&v23, &location);
  objc_msgSend(v5, "_setAccessibilityHintBlock:", v22);
  v20[0] = v4;
  v20[1] = 3221225472;
  v20[2] = __87__InCallControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4;
  v20[3] = &unk_2501E5B80;
  objc_copyWeak(&v21, &location);
  objc_msgSend(v5, "_setAccessibilityActivateBlock:", v20);
  -[InCallControlsViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityJoinLeaveButton"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v4;
  v18[1] = 3221225472;
  v18[2] = __87__InCallControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_6;
  v18[3] = &unk_2501E5BD0;
  objc_copyWeak(&v19, &location);
  objc_msgSend(v7, "_setAccessibilityLabelBlock:", v18);

  -[InCallControlsViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityCameraButton"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&from, v8);
  v14[0] = v4;
  v14[1] = 3221225472;
  v14[2] = __87__InCallControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_7;
  v14[3] = &unk_2501E5C20;
  objc_copyWeak(&v15, &from);
  objc_copyWeak(&v16, &location);
  objc_msgSend(v8, "_setAccessibilityLabelBlock:", v14);
  -[InCallControlsViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityDisableVideoButton"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&v13, v9);
  accessibilityLocalizedString(CFSTR("camera"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityLabel:", v10);

  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __87__InCallControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_8;
  v11[3] = &unk_2501E5BD0;
  objc_copyWeak(&v12, &v13);
  objc_msgSend(v9, "_setAccessibilityValueBlock:", v11);
  objc_msgSend(v9, "_setAccessibilityTraitsBlock:", &__block_literal_global_3);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&from);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&v25);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

uint64_t __87__InCallControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "safeBoolForKey:", CFSTR("isExpanded"));

  return v2;
}

id __87__InCallControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  __CFString *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "safeBoolForKey:", CFSTR("isExpanded")))
    v2 = CFSTR("grabber.expanded");
  else
    v2 = CFSTR("grabber.minimized");
  accessibilityLocalizedString(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __87__InCallControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  __CFString *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "safeBoolForKey:", CFSTR("isExpanded")))
    v2 = CFSTR("controls.grabber.hide.hint");
  else
    v2 = CFSTR("controls.grabber.expand.hint");
  accessibilityLocalizedString(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __87__InCallControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  id v7;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeSwiftValueForKey:", CFSTR("delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_loadWeakRetained(v1);
  LODWORD(WeakRetained) = objc_msgSend(v4, "safeBoolForKey:", CFSTR("isExpanded"));

  if ((_DWORD)WeakRetained)
  {
    v5 = objc_msgSend(v3, "accessibilityPerformEscape");
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = v3;
    AXPerformSafeBlock();

    v5 = 1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __87__InCallControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_accessibilityExpandControls");
}

id __87__InCallControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_6(uint64_t a1)
{
  id WeakRetained;
  __CFString *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "safeBoolForKey:", CFSTR("shouldShowLeaveButton")))
    v2 = CFSTR("join.call");
  else
    v2 = CFSTR("leave.call");
  accessibilityLocalizedString(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __87__InCallControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_7(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "accessibilityTraits");
  v4 = *MEMORY[0x24BDF73E8] & v3;

  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "safeValueForKey:", CFSTR("accessibilityCameraLabel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accessibilityLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (objc_msgSend(v5, "_axDevicePosition") == 2)
      v9 = CFSTR("camera.show.back");
    else
      v9 = CFSTR("camera.show.front");
    accessibilityLocalizedString(v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

id __87__InCallControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_8(uint64_t a1)
{
  id WeakRetained;
  __CFString *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "safeBoolForKey:", CFSTR("isSelected")))
    v2 = CFSTR("off");
  else
    v2 = CFSTR("on");
  accessibilityLocalizedString(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __87__InCallControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_9()
{
  return *MEMORY[0x24BDF73B0];
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)InCallControlsViewControllerAccessibility;
  -[InCallControlsViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[InCallControlsViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (int64_t)_axDevicePosition
{
  int64_t v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  AXPerformBlockSynchronouslyOnMainThread();
  v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

void __62__InCallControlsViewControllerAccessibility__axDevicePosition__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "videoDeviceController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentInputDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "position");

}

@end
