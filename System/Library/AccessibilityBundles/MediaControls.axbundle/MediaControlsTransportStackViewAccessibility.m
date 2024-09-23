@implementation MediaControlsTransportStackViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MediaControlsTransportStackView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MediaControlsTransportStackView"), CFSTR("_updateButtonVisualStyling:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MediaControlsTransportStackView"), CFSTR("leftButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MediaControlsTransportStackView"), CFSTR("middleButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MediaControlsTransportStackView"), CFSTR("rightButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MediaControlsTransportButton"), CFSTR("touchUpInsideCommandRequest"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MediaControlsTransportStackView"), CFSTR("tvRemoteButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MediaControlsTransportStackView"), CFSTR("languageOptionsButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MediaControlsTransportStackView"), CFSTR("initWithFrame:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MediaControlsTransportStackView"), CFSTR("setResponse:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MediaControlsTransportStackView"), CFSTR("setStyle:"), "v", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MediaControlsTransportStackView"), CFSTR("style"), "q", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("MPCPlayerCommandRequest"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPCPlayerCommandRequest"), CFSTR("options"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPCPlayerCommandRequest"), CFSTR("command"), "I", 0);

}

- (id)_accessibilityDescriptionForCommandRequest:(id)a3
{
  id v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  double v10;
  __CFString *v11;
  double v12;
  void *v13;
  __CFString *v14;
  void *v15;

  v3 = a3;
  if (_accessibilityDescriptionForCommandRequest__onceToken != -1)
    dispatch_once(&_accessibilityDescriptionForCommandRequest__onceToken, &__block_literal_global_6);
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = objc_msgSend(v3, "safeUnsignedIntegerForKey:", CFSTR("command"));
    objc_opt_class();
    objc_msgSend(v3, "safeValueForKey:", CFSTR("options"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = 0;
    switch(v4)
    {
      case 0:
        v8 = CFSTR("play.button.label");
        goto LABEL_18;
      case 1:
        v8 = CFSTR("pause.button.label");
        goto LABEL_18;
      case 2:
        break;
      case 3:
        v8 = CFSTR("stop.button.label");
        goto LABEL_18;
      case 4:
        v8 = CFSTR("next.track.button.label");
        goto LABEL_18;
      case 5:
        v8 = CFSTR("previous.track.button.label");
LABEL_18:
        accessibilityLocalizedString(v8);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      default:
        if ((v4 - 17) < 2)
        {
          objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BE659C0]);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v9, "doubleValue"), v10 > 0.0))
          {
            v12 = v10;
            v13 = (void *)MEMORY[0x24BDD17C8];
            if (v4 == 18)
              v14 = CFSTR("rewind.button.label.with.seconds");
            else
              v14 = CFSTR("fast.forward.button.label.with.seconds");
            accessibilityLocalizedString(v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "stringWithFormat:", v15, (uint64_t)v12);
            v7 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            if (v4 == 18)
              v11 = CFSTR("rewind.button.label");
            else
              v11 = CFSTR("fast.forward.button.label");
            accessibilityLocalizedString(v11);
            v7 = (void *)objc_claimAutoreleasedReturnValue();
          }

        }
        break;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

Class __91__MediaControlsTransportStackViewAccessibility__accessibilityDescriptionForCommandRequest___block_invoke()
{
  Class result;

  result = NSClassFromString(CFSTR("MPCPlayerCommandRequest"));
  _accessibilityDescriptionForCommandRequest__MPCPlayerCommandRequestClass = (uint64_t)result;
  return result;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  char v12;
  _QWORD v13[4];
  char v14;
  _QWORD v15[4];
  char v16;
  _QWORD v17[4];
  char v18;
  _QWORD v19[4];
  char v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id from;
  id location;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)MediaControlsTransportStackViewAccessibility;
  -[MediaControlsTransportStackViewAccessibility _accessibilityLoadAccessibilityInformation](&v34, sel__accessibilityLoadAccessibilityInformation);
  -[MediaControlsTransportStackViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("leftButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MediaControlsTransportStackViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("middleButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MediaControlsTransportStackViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("rightButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MediaControlsTransportStackViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("tvRemoteButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MediaControlsTransportStackViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("languageOptionsButton"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilitySetIdentification:", CFSTR("rewind"));
  objc_msgSend(v5, "accessibilitySetIdentification:", CFSTR("fastforward"));
  objc_initWeak(&location, self);
  objc_initWeak(&from, v4);
  v8 = MEMORY[0x24BDAC760];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __90__MediaControlsTransportStackViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v29[3] = &unk_2502727E8;
  objc_copyWeak(&v30, &from);
  objc_copyWeak(&v31, &location);
  objc_msgSend(v4, "_setAccessibilityLabelBlock:", v29);
  objc_initWeak(&v28, v3);
  v25[0] = v8;
  v25[1] = 3221225472;
  v25[2] = __90__MediaControlsTransportStackViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v25[3] = &unk_2502727E8;
  objc_copyWeak(&v26, &v28);
  objc_copyWeak(&v27, &location);
  objc_msgSend(v3, "_setAccessibilityLabelBlock:", v25);
  objc_initWeak(&v24, v5);
  v21[0] = v8;
  v21[1] = 3221225472;
  v21[2] = __90__MediaControlsTransportStackViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v21[3] = &unk_2502727E8;
  objc_copyWeak(&v22, &v24);
  objc_copyWeak(&v23, &location);
  objc_msgSend(v5, "_setAccessibilityLabelBlock:", v21);
  accessibilityLocalizedString(CFSTR("tv.remote.button.label"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityLabel:", v9);

  accessibilityLocalizedString(CFSTR("language.options.button.label"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityLabel:", v10);

  LOBYTE(v10) = -[MediaControlsTransportStackViewAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("style")) == 0;
  v19[0] = v8;
  v19[1] = 3221225472;
  v19[2] = __90__MediaControlsTransportStackViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4;
  v19[3] = &__block_descriptor_33_e15___NSString_8__0l;
  v20 = (char)v10;
  objc_msgSend(v3, "_setAccessibilityHintBlock:", v19);
  v17[0] = v8;
  v17[1] = 3221225472;
  v17[2] = __90__MediaControlsTransportStackViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_5;
  v17[3] = &__block_descriptor_33_e15___NSString_8__0l;
  v18 = (char)v10;
  objc_msgSend(v5, "_setAccessibilityHintBlock:", v17);
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __90__MediaControlsTransportStackViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_6;
  v15[3] = &__block_descriptor_33_e15___NSString_8__0l;
  v16 = (char)v10;
  objc_msgSend(v4, "_setAccessibilityHintBlock:", v15);
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __90__MediaControlsTransportStackViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_7;
  v13[3] = &__block_descriptor_33_e15___NSString_8__0l;
  v14 = (char)v10;
  objc_msgSend(v6, "_setAccessibilityHintBlock:", v13);
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __90__MediaControlsTransportStackViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_8;
  v11[3] = &__block_descriptor_33_e15___NSString_8__0l;
  v12 = (char)v10;
  objc_msgSend(v7, "_setAccessibilityHintBlock:", v11);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&v31);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

id __90__MediaControlsTransportStackViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("touchUpInsideCommandRequest"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v4, "_accessibilityDescriptionForCommandRequest:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __90__MediaControlsTransportStackViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("touchUpInsideCommandRequest"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v4, "_accessibilityDescriptionForCommandRequest:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    accessibilityLocalizedString(CFSTR("previous.track.button.label"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

id __90__MediaControlsTransportStackViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("touchUpInsideCommandRequest"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v4, "_accessibilityDescriptionForCommandRequest:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    accessibilityLocalizedString(CFSTR("next.track.button.label"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

id __90__MediaControlsTransportStackViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 32))
    return 0;
  UIAccessibilityControlCenterModuleExpandPlatterHint();
  return (id)objc_claimAutoreleasedReturnValue();
}

id __90__MediaControlsTransportStackViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_5(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 32))
    return 0;
  UIAccessibilityControlCenterModuleExpandPlatterHint();
  return (id)objc_claimAutoreleasedReturnValue();
}

id __90__MediaControlsTransportStackViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_6(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 32))
    return 0;
  UIAccessibilityControlCenterModuleExpandPlatterHint();
  return (id)objc_claimAutoreleasedReturnValue();
}

id __90__MediaControlsTransportStackViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_7(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 32))
    return 0;
  UIAccessibilityControlCenterModuleExpandPlatterHint();
  return (id)objc_claimAutoreleasedReturnValue();
}

id __90__MediaControlsTransportStackViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_8(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 32))
    return 0;
  UIAccessibilityControlCenterModuleExpandPlatterHint();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;

  -[MediaControlsTransportStackViewAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("subviews"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[MediaControlsTransportStackViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("leftButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MediaControlsTransportStackViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("middleButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MediaControlsTransportStackViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("rightButton"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "indexOfObject:", v5);
  v9 = objc_msgSend(v4, "indexOfObject:", v6);
  v10 = objc_msgSend(v4, "indexOfObject:", v7);
  if (v8 != 0x7FFFFFFFFFFFFFFFLL && v9 != 0x7FFFFFFFFFFFFFFFLL && v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v8 >= v9)
      v11 = v9;
    else
      v11 = v8;
    if (v11 >= v10)
      v12 = v10;
    else
      v12 = v11;
    objc_msgSend(v4, "exchangeObjectAtIndex:withObjectAtIndex:", v12, v8);
  }
  v13 = objc_msgSend(v4, "indexOfObject:", v5);
  v14 = objc_msgSend(v4, "indexOfObject:", v6);
  v15 = objc_msgSend(v4, "indexOfObject:", v7);
  if (v13 != 0x7FFFFFFFFFFFFFFFLL && v14 != 0x7FFFFFFFFFFFFFFFLL && v15 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v13 <= v14)
      v16 = v14;
    else
      v16 = v13;
    if (v16 <= v15)
      v17 = v15;
    else
      v17 = v16;
    objc_msgSend(v4, "exchangeObjectAtIndex:withObjectAtIndex:", v17, v15);
  }

  return v4;
}

- (void)_updateButtonVisualStyling:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MediaControlsTransportStackViewAccessibility;
  -[MediaControlsTransportStackViewAccessibility _updateButtonVisualStyling:](&v9, sel__updateButtonVisualStyling_, v4);
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageForState:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "_accessibilityValueForKey:", CFSTR("AXInterval"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  objc_msgSend(v4, "_accessibilitySetIntegerValue:forKey:", v8, CFSTR("AXInterval"));
}

- (MediaControlsTransportStackViewAccessibility)initWithFrame:(CGRect)a3
{
  MediaControlsTransportStackViewAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MediaControlsTransportStackViewAccessibility;
  v3 = -[MediaControlsTransportStackViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[MediaControlsTransportStackViewAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");

  return v3;
}

- (void)setResponse:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MediaControlsTransportStackViewAccessibility;
  -[MediaControlsTransportStackViewAccessibility setResponse:](&v4, sel_setResponse_, a3);
  -[MediaControlsTransportStackViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)setStyle:(int64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MediaControlsTransportStackViewAccessibility;
  -[MediaControlsTransportStackViewAccessibility setStyle:](&v4, sel_setStyle_, a3);
  -[MediaControlsTransportStackViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
