@implementation PLExpandableImageViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PLExpandableImageView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axMainAssetURL
{
  void *v3;
  void *v4;
  void *v5;

  -[PLExpandableImageViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_photo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "safeValueForKey:", CFSTR("mainFileURL"));
  else
    -[PLExpandableImageViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXAssetURL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_axExifLabel
{
  void *v2;
  void *v3;

  -[PLExpandableImageViewAccessibility _axMainAssetURL](self, "_axMainAssetURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityMetadataDescriptionForImage();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_accessibilityElementStoredUserLabel
{
  void *v2;
  void *v3;
  __CFString *v4;

  -[PLExpandableImageViewAccessibility _axExifLabel](self, "_axExifLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = v2;
  else
    v4 = &stru_24FF00C00;

  return v4;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  id v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double y;
  double x;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  id v36;
  CGPoint v38;
  objc_super v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;
  CGPoint v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  v38 = a3;
  v45 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  -[PLExpandableImageViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXAccessibilityFrame"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rectValue");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  -[PLExpandableImageViewAccessibility accessibilityFrame](self, "accessibilityFrame");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v47.origin.x = v8;
  v47.origin.y = v10;
  v47.size.width = v12;
  v47.size.height = v14;
  v49.origin.x = v16;
  v49.origin.y = v18;
  v49.size.width = v20;
  v49.size.height = v22;
  if (!CGRectEqualToRect(v47, v49))
  {
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithRect:", v16, v18, v20, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLExpandableImageViewAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v23, CFSTR("AXAccessibilityFrame"));

  }
  x = v38.x;
  y = v38.y;
  UIAccessibilityPointForPoint();
  v27 = v26;
  v29 = v28;
  -[PLExpandableImageViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("_faceElements"));
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v30 = (id)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v41;
    while (2)
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v41 != v33)
          objc_enumerationMutation(v30);
        v35 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v35, "accessibilityFrame", *(_QWORD *)&v38.x, *(_QWORD *)&v38.y);
        v46.x = v27;
        v46.y = v29;
        if (CGRectContainsPoint(v48, v46))
        {
          v36 = v35;

          goto LABEL_13;
        }
      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      if (v32)
        continue;
      break;
    }
  }

  v39.receiver = self;
  v39.super_class = (Class)PLExpandableImageViewAccessibility;
  -[PLExpandableImageViewAccessibility _accessibilityHitTest:withEvent:](&v39, sel__accessibilityHitTest_withEvent_, v5, x, y);
  v36 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v36;
}

- (id)_axSourceObject
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  -[PLExpandableImageViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_photo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (!v5)
  {
    -[PLExpandableImageViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_imageView"));
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }
  return v3;
}

- (BOOL)_accessibilityScrollToVisible
{
  return 1;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[PLExpandableImageViewAccessibility _axSourceObject](self, "_axSourceObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[PLExpandableImageViewAccessibility _axSourceObject](self, "_axSourceObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  void *v2;
  unint64_t v3;

  -[PLExpandableImageViewAccessibility _axSourceObject](self, "_axSourceObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "accessibilityTraits");

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
