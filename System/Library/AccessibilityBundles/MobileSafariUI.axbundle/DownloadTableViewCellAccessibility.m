@implementation DownloadTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("DownloadTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("DownloadTableViewCell"), CFSTR("_cancelButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("DownloadTableViewCell"), CFSTR("_resumeButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("DownloadTableViewCell"), CFSTR("_revealButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("DownloadTableViewCell"), CFSTR("_progressView"), "UIProgressView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("DownloadTableViewCell"), CFSTR("_nameLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("DownloadTableViewCell"), CFSTR("_statusLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("DownloadTableViewCell"), CFSTR("_download"), "_SFDownload");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DownloadTableViewCell"), CFSTR("_updateCellContents"), "v", 0);

}

- (DownloadTableViewCellAccessibility)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  DownloadTableViewCellAccessibility *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DownloadTableViewCellAccessibility;
  v4 = -[DownloadTableViewCellAccessibility initWithStyle:reuseIdentifier:](&v6, sel_initWithStyle_reuseIdentifier_, a3, a4);
  -[DownloadTableViewCellAccessibility _accessibilityLoadAccessibilityInformation](v4, "_accessibilityLoadAccessibilityInformation");

  return v4;
}

- (void)_updateCellContents
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DownloadTableViewCellAccessibility;
  -[DownloadTableViewCellAccessibility _updateCellContents](&v3, sel__updateCellContents);
  -[DownloadTableViewCellAccessibility _accessibilityClearChildren](self, "_accessibilityClearChildren");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DownloadTableViewCellAccessibility;
  -[DownloadTableViewCellAccessibility _accessibilityLoadAccessibilityInformation](&v9, sel__accessibilityLoadAccessibilityInformation);
  accessibilityLocalizedString(CFSTR("cancel.download.button"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DownloadTableViewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_cancelButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v3);

  accessibilityLocalizedString(CFSTR("resume.download.button"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DownloadTableViewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_resumeButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityLabel:", v5);

  accessibilityLocalizedString(CFSTR("reveal.download.button"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DownloadTableViewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_revealButton"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityLabel:", v7);

}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DownloadTableViewCellAccessibility;
  return *MEMORY[0x24BDF7430] | -[DownloadTableViewCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (BOOL)isAccessibilityElement
{
  return AXRequestingClient() == 3 || AXRequestingClient() == 4;
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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;

  -[DownloadTableViewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_progressView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "_accessibilityViewIsVisible"))
  {
    -[DownloadTableViewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_progressView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessibilityLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[DownloadTableViewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_progressView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessibilityValue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  -[DownloadTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_download"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "uti");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  UIAXFileTypeDescriptionForUTI();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[DownloadTableViewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_nameLabel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "accessibilityLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[DownloadTableViewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_statusLabel"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "accessibilityLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v28[5];
  _QWORD v29[5];
  _QWORD v30[5];
  _QWORD v31[4];
  id v32;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DownloadTableViewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_cancelButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_accessibilityViewIsVisible");

  v6 = MEMORY[0x24BDAC760];
  if (v5)
  {
    -[DownloadTableViewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_cancelButton"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accessibilityLabel");
    v8 = objc_claimAutoreleasedReturnValue();

    -[DownloadTableViewCellAccessibility _privateAccessibilityCustomActions](self, "_privateAccessibilityCustomActions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v6;
    v31[1] = 3221225472;
    v31[2] = __64__DownloadTableViewCellAccessibility_accessibilityCustomActions__block_invoke;
    v31[3] = &unk_25029F2E8;
    v10 = (id)v8;
    v32 = v10;
    LOBYTE(v8) = objc_msgSend(v9, "ax_containsObjectUsingBlock:", v31);

    if ((v8 & 1) == 0)
    {
      v11 = objc_alloc(MEMORY[0x24BDF6788]);
      -[DownloadTableViewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_cancelButton"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "accessibilityLabel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = v6;
      v30[1] = 3221225472;
      v30[2] = __64__DownloadTableViewCellAccessibility_accessibilityCustomActions__block_invoke_2;
      v30[3] = &unk_25029F2E8;
      v30[4] = self;
      v14 = (void *)objc_msgSend(v11, "initWithName:actionHandler:", v13, v30);
      objc_msgSend(v3, "addObject:", v14);

    }
  }
  -[DownloadTableViewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_resumeButton"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "_accessibilityViewIsVisible");

  if (v16)
  {
    v17 = objc_alloc(MEMORY[0x24BDF6788]);
    -[DownloadTableViewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_resumeButton"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "accessibilityLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v6;
    v29[1] = 3221225472;
    v29[2] = __64__DownloadTableViewCellAccessibility_accessibilityCustomActions__block_invoke_3;
    v29[3] = &unk_25029F2E8;
    v29[4] = self;
    v20 = (void *)objc_msgSend(v17, "initWithName:actionHandler:", v19, v29);
    objc_msgSend(v3, "addObject:", v20);

  }
  -[DownloadTableViewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_revealButton"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "_accessibilityViewIsVisible");

  if (v22)
  {
    v23 = objc_alloc(MEMORY[0x24BDF6788]);
    -[DownloadTableViewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_revealButton"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "accessibilityLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v6;
    v28[1] = 3221225472;
    v28[2] = __64__DownloadTableViewCellAccessibility_accessibilityCustomActions__block_invoke_4;
    v28[3] = &unk_25029F2E8;
    v28[4] = self;
    v26 = (void *)objc_msgSend(v23, "initWithName:actionHandler:", v25, v28);
    objc_msgSend(v3, "addObject:", v26);

  }
  return v3;
}

uint64_t __64__DownloadTableViewCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __64__DownloadTableViewCellAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "safeUIViewForKey:", CFSTR("_cancelButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "sendActionsForControlEvents:", 64);
  return 1;
}

uint64_t __64__DownloadTableViewCellAccessibility_accessibilityCustomActions__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "safeUIViewForKey:", CFSTR("_resumeButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "sendActionsForControlEvents:", 64);
  return 1;
}

uint64_t __64__DownloadTableViewCellAccessibility_accessibilityCustomActions__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "safeUIViewForKey:", CFSTR("_revealButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "sendActionsForControlEvents:", 64);
  return 1;
}

@end
