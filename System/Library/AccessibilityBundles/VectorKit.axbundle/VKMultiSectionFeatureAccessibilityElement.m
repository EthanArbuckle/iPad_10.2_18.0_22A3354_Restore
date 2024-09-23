@implementation VKMultiSectionFeatureAccessibilityElement

- (VKMultiSectionFeatureAccessibilityElement)initWithAccessibilityContainer:(id)a3 feature:(id)a4 ignoreMissingName:(BOOL)a5 useLocalizedLabels:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  id v11;
  VKMultiSectionFeatureAccessibilityElement *v12;
  objc_super v14;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v11 = a4;
  v14.receiver = self;
  v14.super_class = (Class)VKMultiSectionFeatureAccessibilityElement;
  v12 = -[VKFeatureAccessibilityElement initWithAccessibilityContainer:feature:ignoreMissingName:useLocalizedLabels:](&v14, sel_initWithAccessibilityContainer_feature_ignoreMissingName_useLocalizedLabels_, v10, v11, v7, v6);
  -[VKMultiSectionFeatureAccessibilityElement _startUpdatingDescriptionForBuilding:](v12, "_startUpdatingDescriptionForBuilding:", v11);

  return v12;
}

- (int64_t)_accessibilityMapFeatureType
{
  return 3;
}

- (void)_updatePath
{
  void *v3;
  CGRect *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  const CGPath *v22;
  void *v23;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id obj;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;
  CGRect PathBoundingBox;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;

  v40 = *MEMORY[0x24BDAC8D0];
  -[VKFeatureAccessibilityElement paths](self, "paths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[VKFeatureAccessibilityElement setHitTestPaths:](self, "setHitTestPaths:", 0);
  v4 = (CGRect *)MEMORY[0x24BDBF090];
  v5 = *MEMORY[0x24BDBF090];
  v6 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v7 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v8 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  -[VKFeatureAccessibilityElement featureSet](self, "featureSet");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v9)
  {
    v29 = *(_QWORD *)v35;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v35 != v29)
          objc_enumerationMutation(obj);
        -[VKFeatureAccessibilityElement pointsFromFeatureWrapper:](self, "pointsFromFeatureWrapper:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 0u;
        v33 = 0u;
        v30 = 0u;
        v31 = 0u;
        v12 = v11;
        v13 = 0;
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
        if (v14)
        {
          v15 = *(_QWORD *)v31;
          do
          {
            v16 = 0;
            do
            {
              if (*(_QWORD *)v31 != v15)
                objc_enumerationMutation(v12);
              objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v16), "CGPointValue");
              v19 = v17;
              v20 = v18;
              if (v13)
              {
                objc_msgSend(v13, "addLineToPoint:", v17, v18);
              }
              else
              {
                v13 = (void *)objc_opt_new();
                objc_msgSend(v13, "moveToPoint:", v19, v20);
              }
              ++v16;
            }
            while (v14 != v16);
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
          }
          while (v14);
        }

        objc_msgSend(v13, "closePath");
        v21 = objc_retainAutorelease(v13);
        v22 = (const CGPath *)objc_msgSend(v21, "CGPath");
        if (v22)
        {
          -[VKFeatureAccessibilityElement paths](self, "paths");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addObject:", v22);

          PathBoundingBox = CGPathGetPathBoundingBox(v22);
          x = PathBoundingBox.origin.x;
          y = PathBoundingBox.origin.y;
          width = PathBoundingBox.size.width;
          height = PathBoundingBox.size.height;
          v44.origin.x = v5;
          v44.origin.y = v6;
          v44.size.width = v7;
          v44.size.height = v8;
          if (CGRectEqualToRect(*v4, v44))
          {
            v5 = x;
            v6 = y;
            v7 = width;
            v8 = height;
          }
          else
          {
            v42.origin.x = v5;
            v42.origin.y = v6;
            v42.size.width = v7;
            v42.size.height = v8;
            v45.origin.x = x;
            v45.origin.y = y;
            v45.size.width = width;
            v45.size.height = height;
            v43 = CGRectUnion(v42, v45);
            v5 = v43.origin.x;
            v6 = v43.origin.y;
            v7 = v43.size.width;
            v8 = v43.size.height;
          }
        }

        ++v10;
      }
      while (v10 != v9);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v9);
  }

  -[VKFeatureAccessibilityElement _mergePaths](self, "_mergePaths");
  -[VKMultiSectionFeatureAccessibilityElement setAccessibilityFrame:](self, "setAccessibilityFrame:", v5, v6, v7, v8);
  -[VKFeatureAccessibilityElement _updateElementStatus](self, "_updateElementStatus");
}

- (void)_startUpdatingDescriptionForBuilding:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  float *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  void *v17;
  _QWORD v18[5];
  objc_super v19;

  v4 = a3;
  -[VKFeatureAccessibilityElement featureSet](self, "featureSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
    goto LABEL_4;
  v19.receiver = self;
  v19.super_class = (Class)VKMultiSectionFeatureAccessibilityElement;
  -[VKFeatureAccessibilityElement accessibilityLabel](&v19, sel_accessibilityLabel);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = (float *)GEOMultiSectionFeatureBounds();
    objc_msgSend(v4, "feature");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "containingTile");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "geoTileKey");

    VKWorldBoundsFromGEOTileKey();
    AXVKPointForTileGLPoint(v10, v11, v12, v13, (float)(*v7 + v7[2]) * 0.5);
    VKLocationCoordinate2DForVKPoint();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBFA80]), "initWithLatitude:longitude:", v14, v15);
    v16 = objc_alloc_init(MEMORY[0x24BDBFA68]);
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __82__VKMultiSectionFeatureAccessibilityElement__startUpdatingDescriptionForBuilding___block_invoke;
    v18[3] = &unk_2503C5008;
    v18[4] = self;
    v17 = (void *)MEMORY[0x234923E94](v18);
    objc_msgSend(v16, "reverseGeocodeLocation:completionHandler:", v5, v17);
    -[VKMultiSectionFeatureAccessibilityElement _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v16, CFSTR("CLGeocoder"));

LABEL_4:
  }

}

void __82__VKMultiSectionFeatureAccessibilityElement__startUpdatingDescriptionForBuilding___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  objc_msgSend(a2, "firstObject");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  v11 = (id)v5;
  if (a3 || !v5)
  {
    objc_msgSend(v6, "_accessibilityRemoveValueForKey:", CFSTR("CLGeocoder"));
  }
  else
  {
    objc_msgSend(v6, "_accessibilityShortAddress:alwaysIncludeLocality:", v5, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7 || !objc_msgSend(v7, "length"))
    {
      objc_msgSend(v11, "formattedAddressLines");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "componentsJoinedByString:", CFSTR("\n"));
      v10 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v10;
    }
    objc_msgSend(*(id *)(a1 + 32), "setAccessibilityLabel:", v8);

  }
}

@end
