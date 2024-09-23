@implementation SwiftUIAccessibilityNode__WallpaperSettings__SwiftUI

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SwiftUI.AccessibilityNode");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axWallpaperDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  objc_super v14;
  objc_super v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[SwiftUIAccessibilityNode__WallpaperSettings__SwiftUI accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("WALLPAPER_")) & 1) != 0
    || (objc_msgSend(v3, "hasPrefix:", CFSTR("WALLPAPER_HOME_SCREEN_")) & 1) != 0
    || objc_msgSend(v3, "hasPrefix:", CFSTR("WALLPAPER_LOCK_SCREEN_")))
  {
    objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("WALLPAPER_HOME_SCREEN_"), &stru_2503E48B8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("WALLPAPER_LOCK_SCREEN_"), &stru_2503E48B8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("WALLPAPER_"), &stru_2503E48B8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    AXWallpaperLabel(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", v6))
    {
      v15.receiver = self;
      v15.super_class = (Class)SwiftUIAccessibilityNode__WallpaperSettings__SwiftUI;
      -[SwiftUIAccessibilityNode__WallpaperSettings__SwiftUI accessibilityLabel](&v15, sel_accessibilityLabel);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("Dynamic"));

      if (v9)
      {
        AXWallpaperLabel(v3);
        v10 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14.receiver = self;
        v14.super_class = (Class)SwiftUIAccessibilityNode__WallpaperSettings__SwiftUI;
        -[SwiftUIAccessibilityNode__WallpaperSettings__SwiftUI accessibilityLabel](&v14, sel_accessibilityLabel);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        AXWallpaperLabel(v11);
        v10 = objc_claimAutoreleasedReturnValue();

        v7 = v11;
      }

      v7 = (void *)v10;
    }
    AXLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v17 = v6;
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_232BB0000, v12, OS_LOG_TYPE_INFO, "Wallpaper: %@/%@", buf, 0x16u);
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SwiftUIAccessibilityNode__WallpaperSettings__SwiftUI;
  v3 = -[SwiftUIAccessibilityNode__WallpaperSettings__SwiftUI accessibilityTraits](&v8, sel_accessibilityTraits);
  -[SwiftUIAccessibilityNode__WallpaperSettings__SwiftUI _axWallpaperDescription](self, "_axWallpaperDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  v6 = *MEMORY[0x24BDF73C8];
  if (!v5)
    v6 = 0;
  return v6 | v3;
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  void *v3;
  uint64_t v4;
  objc_super v6;

  -[SwiftUIAccessibilityNode__WallpaperSettings__SwiftUI _axWallpaperDescription](self, "_axWallpaperDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)SwiftUIAccessibilityNode__WallpaperSettings__SwiftUI;
  return -[SwiftUIAccessibilityNode__WallpaperSettings__SwiftUI _accessibilityMediaAnalysisOptions](&v6, sel__accessibilityMediaAnalysisOptions);
}

- (id)_iosAccessibilityAttributeValue:(int64_t)a3
{
  void *v5;
  objc_super v7;

  if (a3 == 2701)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[SwiftUIAccessibilityNode__WallpaperSettings__SwiftUI _accessibilityMediaAnalysisOptions](self, "_accessibilityMediaAnalysisOptions"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
LABEL_6:
      v7.receiver = self;
      v7.super_class = (Class)SwiftUIAccessibilityNode__WallpaperSettings__SwiftUI;
      -[SwiftUIAccessibilityNode__WallpaperSettings__SwiftUI _iosAccessibilityAttributeValue:](&v7, sel__iosAccessibilityAttributeValue_, a3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    if (a3 != 2001)
      goto LABEL_6;
    -[SwiftUIAccessibilityNode__WallpaperSettings__SwiftUI accessibilityLabel](self, "accessibilityLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
      goto LABEL_6;
  }
  return v5;
}

- (id)accessibilityLabel
{
  void *v3;
  __CFString *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  objc_super v12;
  uint8_t buf[4];
  SwiftUIAccessibilityNode__WallpaperSettings__SwiftUI *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[SwiftUIAccessibilityNode__WallpaperSettings__SwiftUI accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("Dynamic")))
  {
    v4 = CFSTR("dynamic.wallpapers");
LABEL_5:
    accessibilityLocalizedString(v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("Still")))
  {
    v4 = CFSTR("still.wallpapers");
    goto LABEL_5;
  }
  v12.receiver = self;
  v12.super_class = (Class)SwiftUIAccessibilityNode__WallpaperSettings__SwiftUI;
  -[SwiftUIAccessibilityNode__WallpaperSettings__SwiftUI accessibilityLabel](&v12, sel_accessibilityLabel);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SwiftUIAccessibilityNode__WallpaperSettings__SwiftUI _axWallpaperDescription](self, "_axWallpaperDescription");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (void *)v7;
  else
    v9 = v6;
  v5 = v9;
  AXLogCommon();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v14 = self;
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_232BB0000, v10, OS_LOG_TYPE_INFO, "%@ Wallpaper swift UI label: %@", buf, 0x16u);
  }

LABEL_12:
  return v5;
}

@end
