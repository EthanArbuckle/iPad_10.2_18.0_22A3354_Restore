@implementation SVSBaseViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SVSBaseViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SVSBaseViewController"), CFSTR("viewDidAppear:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SharingViewService.B389DoneViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SharingViewService.B389DoneViewController"), CFSTR("SVSBaseViewController"));
  objc_msgSend(v3, "validateClass:", CFSTR("SVSCurrentLocationIndicator"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SVSBaseViewController"), CFSTR("containerView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SVSBaseViewController"), CFSTR("mainController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SharingViewService.B389SetupMainViewController"), CFSTR("accessibilitySession"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SPPairingSession"), CFSTR("pairingLocation"), "@", 0);

}

- (void)viewDidAppear:(BOOL)a3
{
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
  id v15;
  uint64_t v16;
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];
  id v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)SVSBaseViewControllerAccessibility;
  -[SVSBaseViewControllerAccessibility viewDidAppear:](&v21, sel_viewDidAppear_, a3);
  -[SVSBaseViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityContainerType:", 10);

  -[SVSBaseViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setAccessibilityAutomationType:", 6);

  MEMORY[0x23491DAC4](CFSTR("SharingViewService.B389DoneViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SVSBaseViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("containerView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setAccessibilityViewIsModalBlock:", &__block_literal_global_0);
    objc_msgSend(v6, "_accessibilityFindDescendant:", &__block_literal_global_206);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    accessibilityLocalizedString(CFSTR("ax.current.location"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    UIAXStringForAllChildren();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAccessibilityLabel:", v10, v9, CFSTR("__AXStringForVariablesSentinel"));

    objc_msgSend(v7, "setIsAccessibilityElement:", 1);
    objc_msgSend(v6, "_accessibilityFindDescendant:", &__block_literal_global_215);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x3032000000;
    v19[3] = __Block_byref_object_copy_;
    v19[4] = __Block_byref_object_dispose_;
    v20 = 0;
    -[SVSBaseViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("mainController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "safeValueForKey:", CFSTR("accessibilitySession"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "safeValueForKey:", CFSTR("pairingLocation"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc_init(MEMORY[0x24BDBFA68]);
    v16 = MEMORY[0x24BDAC760];
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __52__SVSBaseViewControllerAccessibility_viewDidAppear___block_invoke_221;
    v18[3] = &unk_250355348;
    v18[4] = v19;
    objc_msgSend(v15, "reverseGeocodeLocation:completionHandler:", v14, v18);
    objc_msgSend(v11, "_setIsAccessibilityElementBlock:", &__block_literal_global_226);
    v17[0] = v16;
    v17[1] = 3221225472;
    v17[2] = __52__SVSBaseViewControllerAccessibility_viewDidAppear___block_invoke_3_227;
    v17[3] = &unk_250355390;
    v17[4] = v19;
    objc_msgSend(v11, "_setAccessibilityLabelBlock:", v17);

    _Block_object_dispose(v19, 8);
  }
}

uint64_t __52__SVSBaseViewControllerAccessibility_viewDidAppear___block_invoke()
{
  return 1;
}

BOOL __52__SVSBaseViewControllerAccessibility_viewDidAppear___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  v2 = a2;
  MEMORY[0x23491DAC4](CFSTR("UIStackView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "subviews");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ax_filteredArrayUsingBlock:", &__block_literal_global_210);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __52__SVSBaseViewControllerAccessibility_viewDidAppear___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  MEMORY[0x23491DAC4](CFSTR("SVSCurrentLocationIndicator"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __52__SVSBaseViewControllerAccessibility_viewDidAppear___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  char v4;

  v2 = a2;
  MEMORY[0x23491DAC4](CFSTR("UIImageView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "superview");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x23491DAC4](CFSTR("UIButton"));
    v4 = objc_opt_isKindOfClass() ^ 1;

  }
  else
  {
    v4 = 0;
  }

  return v4 & 1;
}

void __52__SVSBaseViewControllerAccessibility_viewDidAppear___block_invoke_221(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  if (a3)
  {
    _AXLogWithFacility();
  }
  else
  {
    objc_msgSend(a2, "firstObject");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "thoroughfare");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "locality");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "administrativeArea");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "postalCode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "country");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "inlandWater");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "ocean");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    {
      v15 = v9;
      if (v9 || (v15 = v10) != 0 || (v15 = v11) != 0)
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v15);

      }
    }

  }
}

uint64_t __52__SVSBaseViewControllerAccessibility_viewDidAppear___block_invoke_2_225()
{
  return 1;
}

id __52__SVSBaseViewControllerAccessibility_viewDidAppear___block_invoke_3_227(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
}

@end
