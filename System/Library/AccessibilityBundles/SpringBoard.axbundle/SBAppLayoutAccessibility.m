@implementation SBAppLayoutAccessibility

- (SBAppLayoutAccessibility)initWithItems:(id)a3 centerItem:(id)a4 floatingItem:(id)a5 configuration:(int64_t)a6 itemsToLayoutAttributes:(id)a7 centerConfiguration:(int64_t)a8 environment:(int64_t)a9 hidden:(BOOL)a10 preferredDisplayOrdinal:(int64_t)a11
{
  SBAppLayoutAccessibility *v11;
  SBAppLayoutAccessibility *v12;
  void *v13;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SBAppLayoutAccessibility;
  v11 = -[SBAppLayoutAccessibility initWithItems:centerItem:floatingItem:configuration:itemsToLayoutAttributes:centerConfiguration:environment:hidden:preferredDisplayOrdinal:](&v16, sel_initWithItems_centerItem_floatingItem_configuration_itemsToLayoutAttributes_centerConfiguration_environment_hidden_preferredDisplayOrdinal_, a3, a4, a5, a6, a7, a8, a9, a10, a11);
  v12 = v11;
  if (v11)
  {
    -[SBAppLayoutAccessibility _axBundleIdentifier](v11, "_axBundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x24BDFE078]))
      -[SBAppLayoutAccessibility _axLoadFirstDestinationIfNecessary](v12, "_axLoadFirstDestinationIfNecessary");

  }
  return v12;
}

- (id)_axBundleIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[SBAppLayoutAccessibility _axDisplayItems](self, "_axDisplayItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "safeValueForKey:", CFSTR("bundleIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_axDisplayItems
{
  return (id)-[SBAppLayoutAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("allItems"));
}

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBAppLayout");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBAppLayout"), CFSTR("allItems"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBAppLayout"), CFSTR("type"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBAppLayout"), CFSTR("initWithItems:centerItem:floatingItem:configuration:itemsToLayoutAttributes:centerConfiguration:environment:hidden:preferredDisplayOrdinal:"), "@", "@", "@", "@", "q", "@", "q", "q", "B", "q", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBDisplayItem"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBDisplayItem"), CFSTR("bundleIdentifier"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBContinuityDisplayItem"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBContinuityDisplayItem"), CFSTR("appSuggestion"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBBestAppSuggestion"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBBestAppSuggestion"), CFSTR("originatingDeviceType"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBBestAppSuggestion"), CFSTR("isLocallyGeneratedSuggestion"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBApplicationController"), CFSTR("applicationWithBundleIdentifier:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBApplication"), CFSTR("displayName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("CNPhoneNumber"), CFSTR("phoneNumberWithDigits:countryCode:"), "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBAppLayout"), CFSTR("layoutAttributesForItem:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("SBDisplayItemLayoutAttributes"), CFSTR("sizingPolicy"), "q");

}

- (id)_axLabelWithFirstIconTitle:(id)a3 secondIconTitle:(id)a4
{
  id v6;
  int64_t v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  char v25;
  void *v26;
  void *v27;
  __CFString *v28;
  BOOL v29;
  void *v30;
  uint64_t v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v34 = a3;
  v6 = a4;
  v7 = -[SBAppLayoutAccessibility _axAppLayoutType](self, "_axAppLayoutType");
  if (v7 == 2)
  {
    -[SBAppLayoutAccessibility _axBundleIdentifier](self, "_axBundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BDFE078]))
    {
      -[SBAppLayoutAccessibility _axLabelForInCallService](self, "_axLabelForInCallService");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }

    goto LABEL_54;
  }
  v8 = v7;
  if (v7 == 1)
  {
    accessibilityLocalizedString(CFSTR("home"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_54;
  }
  v33 = v6;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[SBAppLayoutAccessibility _axDisplayItems](self, "_axDisplayItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (!v12)
  {
    v9 = 0;
    goto LABEL_25;
  }
  v13 = v12;
  v14 = 0;
  v9 = 0;
  v15 = *(_QWORD *)v36;
  while (2)
  {
    v16 = 0;
    v32 = v14 + v13;
    do
    {
      v17 = v9;
      if (*(_QWORD *)v36 != v15)
        objc_enumerationMutation(v11);
      v18 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v16);
      if (v8 == 4)
      {
        objc_msgSend(v18, "safeValueForKey:", CFSTR("appSuggestion"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "safeValueForKey:", CFSTR("originatingDeviceType"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v22;
        v25 = objc_msgSend(v24, "safeBoolForKey:", CFSTR("isLocallyGeneratedSuggestion"));
        objc_msgSend(v24, "safeValueForKey:", CFSTR("originatingDeviceType"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if ((v25 & 1) != 0)
        {
          v27 = 0;
          v6 = v33;
LABEL_47:

          if (v23)
            v29 = v27 == 0;
          else
            v29 = 1;
          if (v29)
          {
            v30 = 0;
          }
          else
          {
            __UIAXStringForVariables();
            v30 = (void *)objc_claimAutoreleasedReturnValue();
          }
          __AXStringForVariables();
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_54;
        }
        v6 = v33;
        if (objc_msgSend(v26, "length"))
        {
          if ((objc_msgSend(v26, "isEqualToString:", CFSTR("com.apple.macbookair")) & 1) != 0)
          {
            v28 = CFSTR("continuity.device.macbook-air");
LABEL_45:
            accessibilityLocalizedString(v28);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_47;
          }
          if ((objc_msgSend(v26, "isEqualToString:", CFSTR("com.apple.mac.laptop")) & 1) != 0)
          {
            v28 = CFSTR("continuity.device.macbook-pro");
            goto LABEL_45;
          }
          if ((objc_msgSend(v26, "isEqualToString:", CFSTR("com.apple.macmini")) & 1) != 0)
          {
            v28 = CFSTR("continuity.device.mac-mini");
            goto LABEL_45;
          }
          if ((objc_msgSend(v26, "isEqualToString:", CFSTR("com.apple.mac")) & 1) != 0)
          {
            v28 = CFSTR("continuity.device.mac");
            goto LABEL_45;
          }
          if ((objc_msgSend(v26, "isEqualToString:", CFSTR("com.apple.watch")) & 1) != 0)
          {
            v28 = CFSTR("continuity.device.watch");
            goto LABEL_45;
          }
          if ((objc_msgSend(v26, "isEqualToString:", CFSTR("com.apple.iphone")) & 1) != 0)
          {
            v28 = CFSTR("continuity.device.iphone");
            goto LABEL_45;
          }
          if ((objc_msgSend(v26, "isEqualToString:", CFSTR("com.apple.ipad")) & 1) != 0)
          {
            v28 = CFSTR("continuity.device.ipad");
            goto LABEL_45;
          }
          if ((objc_msgSend(v26, "isEqualToString:", CFSTR("com.apple.ipod")) & 1) != 0)
          {
            v28 = CFSTR("continuity.device.ipod");
            goto LABEL_45;
          }
          if (objc_msgSend(v26, "isEqualToString:", CFSTR("com.apple.apple-tv")))
          {
            v28 = CFSTR("continuity.device.tv");
            goto LABEL_45;
          }
        }
        v27 = 0;
        goto LABEL_47;
      }
      objc_msgSend(v18, "accessibilityLabel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "length"))
        goto LABEL_17;
      v20 = v34;
      if (v14 + v16)
      {
        if (v14 + v16 != 1)
          goto LABEL_17;
        v20 = v33;
      }
      v21 = v20;

      v19 = v21;
LABEL_17:
      __UIAXStringForVariables();
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      ++v16;
    }
    while (v13 != v16);
    v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v39, 16, v19, CFSTR("__AXStringForVariablesSentinel"));
    v14 = v32;
    if (v13)
      continue;
    break;
  }
LABEL_25:

  v6 = v33;
LABEL_54:

  return v9;
}

- (id)_axDisplayName
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[SBAppLayoutAccessibility _axDisplayItems](self, "_axDisplayItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[SBAppLayoutAccessibility _axDisplayItems](self, "_axDisplayItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    AXSBApplicationControllerSharedInstance();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeStringForKey:", CFSTR("bundleIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "applicationWithBundleIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "safeStringForKey:", CFSTR("displayName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (int64_t)_axDisplaySizingPolicy
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  int64_t v8;
  id v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  -[SBAppLayoutAccessibility _axDisplayItems](self, "_axDisplayItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return 0;
  -[SBAppLayoutAccessibility _axDisplayItems](self, "_axDisplayItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1;
  v15 = __Block_byref_object_dispose__1;
  v16 = 0;
  v10 = v6;
  AXPerformSafeBlock();
  v7 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  v8 = objc_msgSend(v7, "safeIntegerForKey:", CFSTR("sizingPolicy"));

  return v8;
}

void __50__SBAppLayoutAccessibility__axDisplaySizingPolicy__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "layoutAttributesForItem:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (int64_t)_axAppLayoutType
{
  return -[SBAppLayoutAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("type"));
}

- (id)_axGetFirstDestinationHandleValue
{
  JUMPOUT(0x23491F7D4);
}

- (void)_axSetFirstDestinationHandleValue:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (id)_axGetFirstDestination
{
  JUMPOUT(0x23491F7D4);
}

- (void)_axSetFirstDestination:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (id)_axLabelForInCallService
{
  void *v2;
  void *v4;
  void *v5;
  uint64_t v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  -[SBAppLayoutAccessibility _axGetFirstCall](self, "_axGetFirstCall");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAppLayoutAccessibility _axGetHandlesAndLoadFirstDestinationInCall:](self, "_axGetHandlesAndLoadFirstDestinationInCall:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  v7 = objc_msgSend(v4, "service");
  if (v7 <= 3)
  {
    accessibilityLocalizedString(off_250367D28[v7]);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[SBAppLayoutAccessibility _axGetFirstDestination](self, "_axGetFirstDestination");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (v6 == 2)
    {
      v12 = (void *)MEMORY[0x24BDD17C8];
      accessibilityLocalizedString(CFSTR("in.call.service.title.format.multiple.single"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      AXFormatInteger();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", v10, v2, v8, v13);
      v11 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (v6 != 1)
      {
        v14 = (void *)MEMORY[0x24BDD17C8];
        accessibilityLocalizedString(CFSTR("in.call.service.title.format.multiple.plural"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        AXFormatInteger();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", v15, v2, v8, v16);
        v11 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_11;
      }
      v9 = (void *)MEMORY[0x24BDD17C8];
      accessibilityLocalizedString(CFSTR("in.call.service.title.format.single"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", v10, v2, v8);
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v11 = v2;
  }
LABEL_11:

  return v11;
}

- (void)_axLoadFirstDestinationIfNecessary
{
  id v3;
  id v4;

  -[SBAppLayoutAccessibility _axGetFirstCall](self, "_axGetFirstCall");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[SBAppLayoutAccessibility _axGetHandlesAndLoadFirstDestinationInCall:](self, "_axGetHandlesAndLoadFirstDestinationInCall:", v4);

}

- (id)_axGetHandlesAndLoadFirstDestinationInCall:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t i;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  _QWORD block[4];
  id v20;
  id v21;
  id location;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  -[SBAppLayoutAccessibility _axAllHandlesInCall:](self, "_axAllHandlesInCall:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAppLayoutAccessibility _axGetFirstDestinationHandleValue](self, "_axGetFirstDestinationHandleValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (!v7)
  {

LABEL_11:
    if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(v6, "anyObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "value");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBAppLayoutAccessibility _axSetFirstDestinationHandleValue:](self, "_axSetFirstDestinationHandleValue:", v15);

      objc_initWeak(&location, self);
      dispatch_get_global_queue(0, 0);
      v16 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __71__SBAppLayoutAccessibility__axGetHandlesAndLoadFirstDestinationInCall___block_invoke;
      block[3] = &unk_250367CB8;
      objc_copyWeak(&v21, &location);
      v20 = v14;
      v17 = v14;
      dispatch_async(v16, block);

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }
    goto LABEL_13;
  }
  v8 = v7;
  v9 = *(_QWORD *)v24;
  v10 = 1;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v24 != v9)
        objc_enumerationMutation(v6);
      objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "value");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", v5);

      v10 &= v13 ^ 1;
    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  }
  while (v8);

  if ((v10 & 1) != 0)
    goto LABEL_11;
LABEL_13:

  return v6;
}

void __71__SBAppLayoutAccessibility__axGetHandlesAndLoadFirstDestinationInCall___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  id v6;
  id v7;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_axContactForHandle:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_copyWeak(&v7, v2);
  v5 = v4;
  v6 = *(id *)(a1 + 32);
  AXPerformBlockOnMainThread();

  objc_destroyWeak(&v7);
}

void __71__SBAppLayoutAccessibility__axGetHandlesAndLoadFirstDestinationInCall___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = *(void **)(a1 + 32);
  if (v2)
    objc_msgSend(v2, "givenName");
  else
    objc_msgSend(*(id *)(a1 + 40), "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_axSetFirstDestination:", v3);

}

- (id)_axGetFirstCall
{
  void *v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__1;
  v8 = __Block_byref_object_dispose__1;
  v9 = 0;
  AXPerformBlockSynchronouslyOnMainThread();
  objc_msgSend((id)v5[5], "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __43__SBAppLayoutAccessibility__axGetFirstCall__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentAudioAndVideoCalls");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_axAllHandlesInCall:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "handle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v6 = v5;
  if (v4)
    objc_msgSend(v5, "addObject:", v4);
  objc_opt_class();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("remoteParticipantHandles"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v6, "unionSet:", v8);

  return v6;
}

- (id)_axContactForHandle:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  _QWORD v22[4];

  v22[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__1;
  v20 = __Block_byref_object_dispose__1;
  v21 = 0;
  -[SBAppLayoutAccessibility _axPredicateForHandle:](self, "_axPredicateForHandle:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x24BDBACB8]);
    objc_msgSend(MEMORY[0x24BDBACC0], "descriptorForRequiredKeysForStyle:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x24BDBA288];
    v22[0] = v7;
    v22[1] = v8;
    v22[2] = *MEMORY[0x24BDBA348];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v6, "initWithKeysToFetch:", v9);

    objc_msgSend(v10, "setPredicate:", v5);
    v11 = objc_alloc_init(MEMORY[0x24BDBACF8]);
    v15 = 0;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __48__SBAppLayoutAccessibility__axContactForHandle___block_invoke;
    v14[3] = &unk_250367D08;
    v14[4] = &v16;
    objc_msgSend(v11, "enumerateContactsWithFetchRequest:error:usingBlock:", v10, &v15, v14);

  }
  v12 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v12;
}

void __48__SBAppLayoutAccessibility__axContactForHandle___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a3 = 1;
}

- (id)_axPredicateForHandle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "type") == 3)
    {
      v5 = (void *)MEMORY[0x24BDBACA0];
      objc_msgSend(v4, "value");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "predicateForContactsMatchingEmailAddress:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = (void *)MEMORY[0x24BDBAD88];
      objc_msgSend(v4, "value");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "phoneNumberWithDigits:countryCode:", v10, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        v8 = 0;
        goto LABEL_9;
      }
      objc_msgSend(MEMORY[0x24BDBACA0], "predicateForContactsMatchingPhoneNumber:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (void *)v7;
LABEL_9:

    goto LABEL_10;
  }
  v8 = 0;
LABEL_10:

  return v8;
}

@end
