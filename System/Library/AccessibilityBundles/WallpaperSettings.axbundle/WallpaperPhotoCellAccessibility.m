@implementation WallpaperPhotoCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WallpaperPhotoCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("WallpaperGridViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WallpaperGridViewController"), CFSTR("_bundleCollection"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WKWallpaperBundleCollection"), CFSTR("wallpaperType"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WKWallpaperBundleCollection"), CFSTR("wallpaperBundleAtIndex:"), "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WKWallpaperBundleCollection"), CFSTR("numberOfItems"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WKWallpaperBundle"), CFSTR("name"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WKWallpaperBundle"), CFSTR("_wallpaperAssetLookup"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WKDynamicWallpaper"), CFSTR("_dynamicDictionary"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
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
  objc_super v15;
  char v16;

  if (!accessibilityLabel_Labels)
  {
    accessibilityLabel_Labels = (uint64_t)&unk_2503E5960;

  }
  -[WallpaperPhotoCellAccessibility _axWallpaperBundle](self, "_axWallpaperBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[WallpaperPhotoCellAccessibility _axWallpaperType](self, "_axWallpaperType") != 2)
    goto LABEL_10;
  objc_msgSend(v3, "safeDictionaryForKey:", CFSTR("_wallpaperAssetLookup"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("WKWallpaperLocationHomeScreen"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", CFSTR("default"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeDictionaryForKey:", CFSTR("_dynamicDictionary"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", CFSTR("kSBUIMagicWallpaperThumbnailNameKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend((id)accessibilityLabel_Labels, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!v10)
      v10 = v9;
    accessibilityLocalizedString(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  if (!v12)
  {
LABEL_10:
    objc_msgSend(v3, "safeStringForKey:", CFSTR("name"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    AXWallpaperLabel(v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      v15.receiver = self;
      v15.super_class = (Class)WallpaperPhotoCellAccessibility;
      -[WallpaperPhotoCellAccessibility accessibilityLabel](&v15, sel_accessibilityLabel);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v12;
}

- (id)_axWallpaperBundle
{
  WallpaperPhotoCellAccessibility *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v2 = self;
  -[WallpaperPhotoCellAccessibility _accessibilityIndexPath](v2, "_accessibilityIndexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WallpaperPhotoCellAccessibility _accessibilityAncestorIsKindOf:](v2, "_accessibilityAncestorIsKindOf:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("_bundleCollection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "item") < 0
    || (v7 = objc_msgSend(v3, "item"), v7 >= objc_msgSend(v6, "safeIntegerForKey:", CFSTR("numberOfItems"))))
  {
    v8 = 0;
  }
  else
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy_;
    v17 = __Block_byref_object_dispose_;
    v18 = 0;
    v11 = v6;
    v12 = v3;
    AXPerformSafeBlock();
    v8 = (id)v14[5];

    _Block_object_dispose(&v13, 8);
  }
  v9 = v8;

  return v9;
}

void __53__WallpaperPhotoCellAccessibility__axWallpaperBundle__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "wallpaperBundleAtIndex:", objc_msgSend(*(id *)(a1 + 40), "item"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (unint64_t)_axWallpaperType
{
  WallpaperPhotoCellAccessibility *v2;
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  v2 = self;
  -[WallpaperPhotoCellAccessibility _accessibilityAncestorIsKindOf:](v2, "_accessibilityAncestorIsKindOf:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "safeValueForKey:", CFSTR("delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("_bundleCollection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "safeUnsignedIntegerForKey:", CFSTR("wallpaperType"));

  return v6;
}

@end
