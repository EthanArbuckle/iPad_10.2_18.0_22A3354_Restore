@implementation UIButtonAccessibility__PhotosUI__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("PUPhotoEditToolPickerController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUPhotoEditToolPickerController"), CFSTR("selectedToolTag"), "q", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;
  char v11;

  v11 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageForState:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "accessibilityIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hasPrefix:", CFSTR("PUCropTool")))
  {
    v6 = CFSTR("crop.tool");
  }
  else if (objc_msgSend(v5, "hasPrefix:", CFSTR("PUFiltersTool")))
  {
    v6 = CFSTR("filters.tool");
  }
  else if (objc_msgSend(v5, "hasPrefix:", CFSTR("PUAdjustmentsTool")))
  {
    v6 = CFSTR("adjustments.tool");
  }
  else if (objc_msgSend(v5, "hasPrefix:", CFSTR("PULivePhotoTool")))
  {
    v6 = CFSTR("edit.live.photo.tool");
  }
  else if (objc_msgSend(v5, "hasPrefix:", CFSTR("PUVideoTool")))
  {
    v6 = CFSTR("edit.video.tool");
  }
  else if (objc_msgSend(v5, "hasPrefix:", CFSTR("PUPortraitTool")))
  {
    v6 = CFSTR("edit.portrait.tool");
  }
  else if (objc_msgSend(v5, "hasPrefix:", CFSTR("PUAdjustmentsListButton")))
  {
    v6 = CFSTR("adjustments.list");
  }
  else if (objc_msgSend(v5, "hasPrefix:", CFSTR("PUCropRotate")))
  {
    v6 = CFSTR("crop.rotate");
  }
  else if (objc_msgSend(v5, "hasPrefix:", CFSTR("PUCropFlip")))
  {
    v6 = CFSTR("crop.flip");
  }
  else if (objc_msgSend(v5, "hasPrefix:", CFSTR("PUCropAspectRatio")))
  {
    v6 = CFSTR("crop.aspectratio");
  }
  else if (objc_msgSend(v5, "hasPrefix:", CFSTR("PUAdjustmentsModeCollapse")))
  {
    v6 = CFSTR("collapse.adjustments");
  }
  else if (objc_msgSend(v5, "hasPrefix:", CFSTR("PUAdjustmentsModeExpand")))
  {
    v6 = CFSTR("expand.adjustments");
  }
  else if (objc_msgSend(v5, "hasPrefix:", CFSTR("PURedEyeTool")))
  {
    v6 = CFSTR("redeye.tool");
  }
  else if (objc_msgSend(v5, "hasPrefix:", CFSTR("PURedEyeTool-Selected")))
  {
    v6 = CFSTR("redeye.tool.selected");
  }
  else if (objc_msgSend(v5, "hasPrefix:", CFSTR("person.fill")))
  {
    v6 = CFSTR("personal.library");
  }
  else
  {
    if (!objc_msgSend(v5, "hasPrefix:", CFSTR("person.2.fill")))
    {
      v10.receiver = self;
      v10.super_class = (Class)UIButtonAccessibility__PhotosUI__UIKit;
      -[UIButtonAccessibility__PhotosUI__UIKit accessibilityLabel](&v10, sel_accessibilityLabel);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_34;
    }
    v6 = CFSTR("shared.library");
  }
  accessibilityPULocalizedString(v6);
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_34:
  v8 = (void *)v7;

  return v8;
}

- (id)accessibilityHint
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  __CFString *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  objc_super v15;
  char v16;

  v16 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageForState:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "accessibilityIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasPrefix:", CFSTR("PUAdjustmentsListButton"));

  if (v6)
  {
    v7 = CFSTR("adjustments.list.hint");
  }
  else
  {
    objc_msgSend(v4, "accessibilityIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "hasPrefix:", CFSTR("PUCropRotate"));

    if (v9)
    {
      v7 = CFSTR("crop.rotate.hint");
    }
    else
    {
      objc_msgSend(v4, "accessibilityIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "hasPrefix:", CFSTR("PUCropFlip"));

      if (!v11)
      {
        v15.receiver = self;
        v15.super_class = (Class)UIButtonAccessibility__PhotosUI__UIKit;
        -[UIButtonAccessibility__PhotosUI__UIKit accessibilityHint](&v15, sel_accessibilityHint);
        v12 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
      v7 = CFSTR("crop.flip.hint");
    }
  }
  accessibilityPULocalizedString(v7);
  v12 = objc_claimAutoreleasedReturnValue();
LABEL_8:
  v13 = (void *)v12;

  return v13;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UIButtonAccessibility__PhotosUI__UIKit;
  v3 = -[UIButtonAccessibility__PhotosUI__UIKit accessibilityTraits](&v10, sel_accessibilityTraits);
  -[UIButtonAccessibility__PhotosUI__UIKit _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "_accessibilityViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      NSClassFromString(CFSTR("PUPhotoEditToolPickerController"));
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[UIButtonAccessibility__PhotosUI__UIKit safeValueForKey:](self, "safeValueForKey:", CFSTR("tag"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "safeValueForKey:", CFSTR("selectedToolTag"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7 == v8)
          v3 |= *MEMORY[0x24BDF7400];
        else
          v3 &= ~*MEMORY[0x24BDF7400];
      }
    }

  }
  return v3;
}

@end
