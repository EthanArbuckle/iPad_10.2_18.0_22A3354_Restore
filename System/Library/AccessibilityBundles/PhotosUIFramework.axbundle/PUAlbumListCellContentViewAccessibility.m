@implementation PUAlbumListCellContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUAlbumListCellContentView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PUAlbumListCellContentView"), CFSTR("_enabled"), "B");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PUAlbumListCellContentView"), CFSTR("_editing"), "B");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PUAlbumListCellContentView"), CFSTR("_editCapabilities"), "Q");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PUAlbumListCellContentView"), CFSTR("_showsDeleteButtonWhenEditing"), "B");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUAlbumListCellContentView"), CFSTR("setEditing: animated:"), "v", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUAlbumListCellContentView"), CFSTR("_deleteButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUAlbumListCellContentView"), CFSTR("showsDeleteButtonWhenEditing"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUAlbumListCellContentView"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUAlbumListCellContentView"), CFSTR("subtitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUAlbumListCellContentView"), CFSTR("setUsesLabelForTitle:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUAlbumListCellContentView"), CFSTR("showsAvatarView"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUAlbumListCellContentView"), CFSTR("avatarView"), "@", 0);

}

- (id)_axCustomContentType
{
  JUMPOUT(0x2348C1CECLL);
}

- (void)_setAXCustomContentType:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (BOOL)_axShowsDeleteButton
{
  void *v3;
  char v4;

  -[PUAlbumListCellContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_editCapabilities"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  if ((v4 & 1) != 0)
    return -[PUAlbumListCellContentViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_editing"));
  else
    return 0;
}

- (BOOL)isAccessibilityElement
{
  void *v3;

  -[PUAlbumListCellContentViewAccessibility _accessibilityViewAncestorIsKindOf:](self, "_accessibilityViewAncestorIsKindOf:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return !-[PUAlbumListCellContentViewAccessibility _axShowsDeleteButton](self, "_axShowsDeleteButton");
  else
    return 1;
}

- (id)_deleteButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PUAlbumListCellContentViewAccessibility;
  -[PUAlbumListCellContentViewAccessibility _deleteButton](&v8, sel__deleteButton);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityPULocalizedString(CFSTR("delete.button"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAlbumListCellContentViewAccessibility accessibilityLabel](self, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v6, v5, CFSTR("__AXStringForVariablesSentinel"));

  return v3;
}

- (BOOL)accessibilityElementsHidden
{
  void *v2;

  -[PUAlbumListCellContentViewAccessibility _accessibilityViewAncestorIsKindOf:](self, "_accessibilityViewAncestorIsKindOf:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2 == 0;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUAlbumListCellContentViewAccessibility;
  -[PUAlbumListCellContentViewAccessibility setEditing:animated:](&v7, sel_setEditing_animated_, a3, a4);
  -[PUAlbumListCellContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleTextField"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityPULocalizedString(CFSTR("album.name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v6);

  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PUAlbumListCellContentViewAccessibility;
  -[PUAlbumListCellContentViewAccessibility _accessibilityLoadAccessibilityInformation](&v9, sel__accessibilityLoadAccessibilityInformation);
  -[PUAlbumListCellContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_subtitleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);

  -[PUAlbumListCellContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleTextField"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityElementsHidden:", 1);

  -[PUAlbumListCellContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleTextField"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityPULocalizedString(CFSTR("album.name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v6);

  -[PUAlbumListCellContentViewAccessibility _accessibilityViewAncestorIsKindOf:](self, "_accessibilityViewAncestorIsKindOf:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "safeValueForKey:", CFSTR("_accessibilityClearChildren"));

}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 1;
}

- (BOOL)_accessibilityHitTestReverseOrder
{
  return 1;
}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PUAlbumListCellContentViewAccessibility _accessibilityViewAncestorIsKindOf:](self, "_accessibilityViewAncestorIsKindOf:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && -[PUAlbumListCellContentViewAccessibility _axShowsDeleteButton](self, "_axShowsDeleteButton"))
  {
    -[PUAlbumListCellContentViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("DeleteElement"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67A0]), "initWithAccessibilityContainer:", self);
      objc_msgSend(v4, "setAccessibilityDelegate:", self);
      -[PUAlbumListCellContentViewAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v4, CFSTR("DeleteElement"));
    }
    -[PUAlbumListCellContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleTextField"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "axSafelyAddObject:", v4);
    objc_msgSend(v6, "axSafelyAddObject:", v5);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (PUAlbumListCellContentViewAccessibility)initWithFrame:(CGRect)a3
{
  PUAlbumListCellContentViewAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUAlbumListCellContentViewAccessibility;
  v3 = -[PUAlbumListCellContentViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[PUAlbumListCellContentViewAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");

  return v3;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v13;
  const __CFString *v14;
  objc_super v15;
  uint64_t v16;

  -[PUAlbumListCellContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("subtitle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PUAlbumListCellContentViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("showsAvatarView")))
  {
    -[PUAlbumListCellContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("avatarView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessibilityLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = CFSTR("__AXStringForVariablesSentinel");
    __UIAXStringForVariables();
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  if (objc_msgSend(v3, "length", v13, v14))
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDBCB10]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", v7, &stru_24FF166E0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17A8], "localizedScannerWithString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    if (objc_msgSend(v9, "scanInteger:", &v16))
    {
      -[PUAlbumListCellContentViewAccessibility _axTypeStringWithCount:](self, "_axTypeStringWithCount:", v16);
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = v8;
    }
    v11 = v10;

  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)PUAlbumListCellContentViewAccessibility;
    -[PUAlbumListCellContentViewAccessibility accessibilityValue](&v15, sel_accessibilityValue);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v3;
  }

  return v11;
}

- (id)accessibilityCustomActions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  if (!-[PUAlbumListCellContentViewAccessibility _axShowsDeleteButton](self, "_axShowsDeleteButton"))
    return 0;
  v3 = objc_alloc(MEMORY[0x24BDF6788]);
  accessibilityPULocalizedString(CFSTR("rename.action"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:target:selector:", v4, self, sel__axRenameAlbumAction);

  v8[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)accessibilityPerformEscape
{
  _BOOL4 v3;
  void *v4;
  void *v5;

  v3 = -[PUAlbumListCellContentViewAccessibility _axShowsDeleteButton](self, "_axShowsDeleteButton");
  if (v3)
  {
    objc_opt_class();
    -[PUAlbumListCellContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleTextField"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    AXPerformSafeBlock();
    objc_msgSend(v5, "setAccessibilityElementsHidden:", 1);
    objc_msgSend(v5, "resignFirstResponder");

  }
  return v3;
}

uint64_t __69__PUAlbumListCellContentViewAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setUsesLabelForTitle:", 1);
}

- (unint64_t)accessibilityTraits
{
  int v3;
  unint64_t v4;
  unint64_t v5;
  int v6;
  unint64_t result;
  _BOOL4 v8;

  v3 = -[PUAlbumListCellContentViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_enabled"));
  v4 = *MEMORY[0x24BDF73E8];
  if (v3)
    v5 = 0;
  else
    v5 = *MEMORY[0x24BDF73E8];
  v6 = -[PUAlbumListCellContentViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_editing"));
  result = v5;
  if (v6)
  {
    v8 = -[PUAlbumListCellContentViewAccessibility _axShowsDeleteButton](self, "_axShowsDeleteButton");
    result = v4;
    if (v8)
      return *MEMORY[0x24BEBB128] | v5;
  }
  return result;
}

- (CGPoint)accessibilityActivationPoint
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;
  CGPoint result;

  if (-[PUAlbumListCellContentViewAccessibility _axShowsDeleteButton](self, "_axShowsDeleteButton"))
  {
    -[PUAlbumListCellContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_deleteButton"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessibilityActivationPoint");
    v5 = v4;
    v7 = v6;

    v8 = v5;
    v9 = v7;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)PUAlbumListCellContentViewAccessibility;
    -[PUAlbumListCellContentViewAccessibility accessibilityActivationPoint](&v10, sel_accessibilityActivationPoint);
  }
  result.y = v9;
  result.x = v8;
  return result;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v13;
  const __CFString *v14;

  -[PUAlbumListCellContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleTextField"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "string");
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  if (!objc_msgSend(v4, "length"))
  {
    -[PUAlbumListCellContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("title"));
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  -[PUAlbumListCellContentViewAccessibility _axCustomContentType](self, "_axCustomContentType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("AXAlbumContentTypeFolder")))
  {
    accessibilityPULocalizedString(CFSTR("folder"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = CFSTR("__AXStringForVariablesSentinel");
    __UIAXStringForVariables();
    v8 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v8;
  }
  if (-[PUAlbumListCellContentViewAccessibility _axShowsDeleteButton](self, "_axShowsDeleteButton", v13, v14))
  {
    -[PUAlbumListCellContentViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      accessibilityPULocalizedString(CFSTR("delete.button"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAXStringForVariables();
      v11 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v11;
    }
  }

  return v4;
}

- (id)automationElements
{
  void *v3;
  void *v4;
  void *v5;

  if (-[PUAlbumListCellContentViewAccessibility _axShowsDeleteButton](self, "_axShowsDeleteButton"))
  {
    -[PUAlbumListCellContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_deleteButton"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAlbumListCellContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleTextField"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
      _AXAssert();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "axSafelyAddObject:", v3);
    objc_msgSend(v5, "axSafelyAddObject:", v4);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  PUAlbumListCellContentViewAccessibility *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  y = a3.y;
  x = a3.x;
  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  if (UIAccessibilityIsVoiceOverRunning())
  {
    v22.receiver = self;
    v22.super_class = (Class)PUAlbumListCellContentViewAccessibility;
    -[PUAlbumListCellContentViewAccessibility _accessibilityHitTest:withEvent:](&v22, sel__accessibilityHitTest_withEvent_, v7, x, y);
    v8 = (PUAlbumListCellContentViewAccessibility *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[PUAlbumListCellContentViewAccessibility automationElements](self, "automationElements", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          -[PUAlbumListCellContentViewAccessibility convertPoint:toView:](self, "convertPoint:toView:", v14, x, y);
          objc_msgSend(v14, "_accessibilityHitTest:withEvent:", v7);
          v15 = objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            v16 = (void *)v15;

            goto LABEL_14;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        if (v11)
          continue;
        break;
      }
    }

    v8 = self;
  }
  v16 = v8;
LABEL_14:

  return v16;
}

- (BOOL)_accessibilitySupportsContentSizeCategory:(id)a3
{
  return *MEMORY[0x24BDF76A0] <= (unint64_t)a3;
}

- (id)_axTypeStringWithCount:(int64_t)a3
{
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;

  -[PUAlbumListCellContentViewAccessibility _axCustomContentType](self, "_axCustomContentType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("AXAlbumContentTypePeople")) & 1) != 0)
    {
      v6 = CFSTR("album.contenttype.people");
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("AXAlbumContentTypePlaces")) & 1) != 0)
    {
      v6 = CFSTR("album.contenttype.places");
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("AXAlbumContentTypeVideos")) & 1) != 0
           || (objc_msgSend(v5, "isEqualToString:", CFSTR("AXAlbumContentTypeSloMo")) & 1) != 0)
    {
      v6 = CFSTR("video.count");
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("AXAlbumContentTypeFavorites")) & 1) != 0)
    {
      v6 = CFSTR("album.contenttype.favorites");
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("AXAlbumContentTypeScreenshots")) & 1) != 0)
    {
      v6 = CFSTR("album.contenttype.screenshots");
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("AXAlbumContentTypeSelfies")) & 1) != 0)
    {
      v6 = CFSTR("album.contenttype.selfies");
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("AXAlbumContentTypeFolder")))
    {
      v6 = CFSTR("album.contenttype.folderitems");
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = CFSTR("photo.count");
  }
  v7 = (void *)MEMORY[0x24BDD17C8];
  accessibilityPULocalizedString(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringWithFormat:", v8, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)_axRenameAlbumAction
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[PUAlbumListCellContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleTextField"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  AXPerformSafeBlock();
  objc_msgSend(v4, "setAccessibilityElementsHidden:", 0);
  objc_msgSend(v4, "becomeFirstResponder");

  return 1;
}

uint64_t __63__PUAlbumListCellContentViewAccessibility__axRenameAlbumAction__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setUsesLabelForTitle:", 0);
}

@end
