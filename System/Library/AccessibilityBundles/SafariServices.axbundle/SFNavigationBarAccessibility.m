@implementation SFNavigationBarAccessibility

void __64___SFNavigationBarAccessibility__accessibilityAutoReaderAction___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("delegate"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationBarReaderButtonWasTapped:", *(_QWORD *)(a1 + 32));

}

id __75___SFNavigationBarAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  int v12;
  __CFString *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  MEMORY[0x23491BE1C](CFSTR("BrowserController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("isShowingReader"));
    objc_msgSend(v3, "safeValueForKey:", CFSTR("_tabController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeValueForKey:", CFSTR("activeTabDocument"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilitySafeClass();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (id)objc_msgSend(v7, "safeValueForKey:", CFSTR("prepareToUseReader"));
    v9 = CFSTR("readerContext");
    v10 = v7;
  }
  else
  {
    MEMORY[0x23491BE1C](CFSTR("_SFBrowserContentViewController"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_11;
    v4 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("_showingReader"));
    objc_msgSend(v3, "safeValueForKey:", CFSTR("webViewController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v10;
    v9 = CFSTR("readerController");
  }
  objc_msgSend(v10, "safeValueForKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "safeBoolForKey:", CFSTR("isReaderAvailable"));

  if ((v4 & 1) != 0)
  {
    v13 = CFSTR("hide.reader.action");
    goto LABEL_9;
  }
  if (!v12)
  {
LABEL_11:
    v17 = 0;
    goto LABEL_12;
  }
  v13 = CFSTR("show.reader.action");
LABEL_9:
  accessibilitySafariServicesLocalizedString(v13);
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
    goto LABEL_11;
  v15 = (void *)v14;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6788]), "initWithName:target:selector:", v14, *(_QWORD *)(a1 + 32), sel__accessibilityAutoReaderAction_);
  v19[0] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  return v17;
}

id __50___SFNavigationBarAccessibility__axUpdateURLValue__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v18;
  void *v19;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("_lockView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "accessibilityLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  v6 = objc_loadWeakRetained(v1);
  objc_msgSend(v6, "safeValueForKey:", CFSTR("_URLLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_loadWeakRetained(v1);
  objc_msgSend(v10, "safeUIViewForKey:", CFSTR("_securityAnnotationLabel"), v5, CFSTR("__AXStringForVariablesSentinel"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v11, "_accessibilityViewIsVisible");

  if ((_DWORD)v8)
  {
    v12 = objc_loadWeakRetained(v1);
    objc_msgSend(v12, "safeUIViewForKey:", CFSTR("_securityAnnotationLabel"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "accessibilityLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_loadWeakRetained(v1);
    objc_msgSend(v15, "safeValueForKey:", CFSTR("item"), v18, CFSTR("__AXStringForVariablesSentinel"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = objc_msgSend(v16, "safeBoolForKey:", CFSTR("showsSecurityAnnotation"));

    if ((_DWORD)v12)
    {
      accessibilitySafariServicesLocalizedString(CFSTR("sensitive.field.in.insecure.page"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAXStringForVariables();
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = v14;
    }
  }

  return v9;
}

@end
