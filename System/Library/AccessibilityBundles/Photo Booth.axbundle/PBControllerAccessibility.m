@implementation PBControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PBController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PBController"), CFSTR("_reloadTiles"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PBController"), CFSTR("_addTilesForPhotos: animated:"), "@", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PBController"), CFSTR("setCurrentMode: animated:"), "v", "i", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PBController"), CFSTR("toggleCamera:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PBController"), CFSTR("_effectsController"), "PBEffectsController");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PBController"), CFSTR("_flipButton"), "@", 0);

}

- (id)_addTilesForPhotos:(id)a3 animated:(BOOL)a4
{
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PBControllerAccessibility;
  -[PBControllerAccessibility _addTilesForPhotos:animated:](&v6, sel__addTilesForPhotos_animated_, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  return v4;
}

- (void)_reloadTiles
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PBControllerAccessibility;
  -[PBControllerAccessibility _reloadTiles](&v2, sel__reloadTiles);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (void)_accessibilityApplyLabels:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a3, "items", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "tag") - 1;
        if (v9 <= 5 && ((0x2Fu >> v9) & 1) != 0)
        {
          axLocalizedString(off_2502FA3E0[v9]);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setAccessibilityLabel:", v10);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (id)_reviewModeFooter
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PBControllerAccessibility;
  -[PBControllerAccessibility _reviewModeFooter](&v5, sel__reviewModeFooter);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[PBControllerAccessibility _accessibilityApplyLabels:](self, "_accessibilityApplyLabels:", v3);
  else
    _AXAssert();
  return v3;
}

- (void)setCurrentMode:(int)a3 animated:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PBControllerAccessibility;
  -[PBControllerAccessibility setCurrentMode:animated:](&v4, sel_setCurrentMode_animated_, *(_QWORD *)&a3, a4);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (void)toggleCamera:(id)a3
{
  UIAccessibilityNotifications v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PBControllerAccessibility;
  -[PBControllerAccessibility toggleCamera:](&v6, sel_toggleCamera_, a3);
  v4 = *MEMORY[0x24BDF7328];
  -[PBControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_flipButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v4, v5);

}

@end
