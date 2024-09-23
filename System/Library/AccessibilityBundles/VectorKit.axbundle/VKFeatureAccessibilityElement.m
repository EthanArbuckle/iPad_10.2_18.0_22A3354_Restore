@implementation VKFeatureAccessibilityElement

- (VKFeatureAccessibilityElement)initWithAccessibilityContainer:(id)a3 feature:(id)a4 ignoreMissingName:(BOOL)a5 useLocalizedLabels:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  VKFeatureAccessibilityElement *v16;
  void *v18;
  VKFeatureAccessibilityElement *v19;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = v11;
  if (v11
    && (objc_msgSend(v11, "feature"), (v13 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    && ((objc_msgSend(v12, "feature"),
         v14 = (void *)objc_claimAutoreleasedReturnValue(),
         v15 = objc_msgSend(v14, "name"),
         v14,
         v13,
         v15)
     || v7))
  {
    objc_msgSend(v12, "feature");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      GEOFeatureGetLocalizedLabel();
      GEOFeatureGetLocalizedShield();
    }
    else
    {
      GEOFeatureGetNativeLabel();
      GEOFeatureGetNativeShield();
    }
    if (v7)
    {
      v19 = -[VKFeatureAccessibilityElement initWithAccessibilityContainer:](self, "initWithAccessibilityContainer:", v10, 0);
      if (v19)
      {
        -[VKFeatureAccessibilityElement setAccessibilityLabel:](v19, "setAccessibilityLabel:", 0);
        -[VKFeatureAccessibilityElement setAccessibilityLanguage:](v19, "setAccessibilityLanguage:", 0);
        -[VKFeatureAccessibilityElement addFeature:](v19, "addFeature:", v12);
        objc_storeStrong((id *)&v19->_shieldText, 0);
        v19->_shieldType = 0;
        v19->_style = objc_msgSend(v18, "styleID");
      }
      self = v19;
      v16 = self;
    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)_allowCustomActionHintSpeakOverride
{
  return 0;
}

- (void)_updateElementStatus
{
  id v3;

  -[VKFeatureAccessibilityElement accessibilityContainer](self, "accessibilityContainer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[VKFeatureAccessibilityElement accessibilityActivationPoint](self, "accessibilityActivationPoint");
  -[VKFeatureAccessibilityElement setIsAccessibilityElement:](self, "setIsAccessibilityElement:", objc_msgSend(v3, "accessibilityViewBoundsContainsPathPoint:"));

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v6;
  objc_super v7;
  objc_super v8;

  if (-[VKFeatureAccessibilityElement mapFeatureType](self, "mapFeatureType") == 25)
  {
    AXVectorKitLocString(CFSTR("POI_BUILDING"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8.receiver = self;
    v8.super_class = (Class)VKFeatureAccessibilityElement;
    -[VKFeatureAccessibilityElement accessibilityLabel](&v8, sel_accessibilityLabel);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)VKFeatureAccessibilityElement;
    -[VKFeatureAccessibilityElement accessibilityLabel](&v7, sel_accessibilityLabel);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (void)removeFeatures
{
  -[NSMutableSet removeAllObjects](self->_featureSet, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_paths, "removeAllObjects");
  -[VKFeatureAccessibilityElement setHitTestPaths:](self, "setHitTestPaths:", 0);
}

- (void)addFeature:(id)a3
{
  id v4;
  AXVKMultiSectionFeatureWrapper *v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    v5 = -[AXVKMultiSectionFeatureWrapper initWithFeature:]([AXVKMultiSectionFeatureWrapper alloc], "initWithFeature:", v4);
    -[VKFeatureAccessibilityElement addFeatureWrapper:](self, "addFeatureWrapper:", v5);

    v4 = v6;
  }

}

- (void)addFeatureWrapper:(id)a3
{
  id v4;

  v4 = a3;
  if (v4)
  {
    -[NSMutableSet addObject:](self->_featureSet, "addObject:", v4);
    -[NSMutableArray removeAllObjects](self->_paths, "removeAllObjects");
    -[VKFeatureAccessibilityElement setHitTestPaths:](self, "setHitTestPaths:", 0);
  }

}

- (void)addFeaturesFromElement:(id)a3
{
  VKFeatureAccessibilityElement *v4;
  float v5;
  float v6;
  float v7;
  VKFeatureAccessibilityElement *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = (VKFeatureAccessibilityElement *)a3;
  -[VKFeatureAccessibilityElement strokeWidth](self, "strokeWidth");
  v6 = v5;
  -[VKFeatureAccessibilityElement strokeWidth](v4, "strokeWidth");
  if (v6 <= v7)
    v8 = v4;
  else
    v8 = self;
  -[VKFeatureAccessibilityElement strokeWidth](v8, "strokeWidth");
  -[VKFeatureAccessibilityElement setStrokeWidth:](self, "setStrokeWidth:");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[VKFeatureAccessibilityElement featureSet](v4, "featureSet", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v9);
        -[VKFeatureAccessibilityElement addFeatureWrapper:](self, "addFeatureWrapper:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++));
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (BOOL)pointInside:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;
  CGPoint v17;
  CGPoint v18;
  CGRect v19;

  y = a3.y;
  x = a3.x;
  v16 = *MEMORY[0x24BDAC8D0];
  -[VKFeatureAccessibilityElement accessibilityFrame](self, "accessibilityFrame");
  v18.x = x;
  v18.y = y;
  if (CGRectContainsPoint(v19, v18))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[VKFeatureAccessibilityElement accessibilityPaths](self, "accessibilityPaths", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v6);
          v17.x = x;
          v17.y = y;
          if (CGPathContainsPoint(*(CGPathRef *)(*((_QWORD *)&v11 + 1) + 8 * i), 0, v17, 0))
          {
            LOBYTE(v7) = 1;
            goto LABEL_13;
          }
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_13:

  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (id)pointsFromFeatureWrapper:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t i;

  objc_msgSend(a3, "feature");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "feature");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containingTile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "geoTileKey");

  VKWorldBoundsFromGEOTileKey();
  v7 = objc_msgSend(v4, "sectionCount");
  -[VKFeatureAccessibilityElement accessibilityContainer](self, "accessibilityContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    for (i = 0; i != v7; ++i)
      GEOMultiSectionFeatureGetGEOVectorTilePoints();
  }

  return v9;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[VKFeatureAccessibilityElement _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("CLGeocoder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "cancelGeocode");

  v5.receiver = self;
  v5.super_class = (Class)VKFeatureAccessibilityElement;
  -[VKFeatureAccessibilityElement dealloc](&v5, sel_dealloc);
}

- (VKFeatureAccessibilityElement)initWithAccessibilityContainer:(id)a3
{
  id v4;
  VKFeatureAccessibilityElement *v5;
  NSMutableArray *v6;
  NSMutableArray *paths;
  NSMutableSet *v8;
  NSMutableSet *featureSet;
  NSMutableDictionary *v10;
  NSMutableDictionary *pointToFeatureDict;
  VKFeatureAccessibilityElement *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VKFeatureAccessibilityElement;
  v5 = -[VKFeatureAccessibilityElement initWithAccessibilityContainer:](&v14, sel_initWithAccessibilityContainer_, v4);
  if (v5)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    paths = v5->_paths;
    v5->_paths = v6;

    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    featureSet = v5->_featureSet;
    v5->_featureSet = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    pointToFeatureDict = v5->_pointToFeatureDict;
    v5->_pointToFeatureDict = v10;

    v12 = v5;
  }

  return v5;
}

- (int64_t)_accessibilityMapFeatureType
{
  return 0;
}

- (BOOL)isRoad
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[VKFeatureAccessibilityElement accessibilityLabel](self, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKFeatureAccessibilityElement accessibilityPaths](self, "accessibilityPaths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  -[VKFeatureAccessibilityElement accessibilityLanguage](self, "accessibilityLanguage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%p: %@ - Paths: %ld [%@]"), v4, self, v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_mergePaths
{
  CGMutablePathRef Mutable;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  Mutable = CGPathCreateMutable();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_paths;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        AX_CGPathEnumerateElementsUsingBlock();
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithCGPath:", Mutable);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKFeatureAccessibilityElement setAccessibilityPath:](self, "setAccessibilityPath:", v8);

  if (Mutable)
    CFRelease(Mutable);
}

void __44__VKFeatureAccessibilityElement__mergePaths__block_invoke(uint64_t a1, int a2, CGFloat *a3)
{
  switch(a2)
  {
    case 0:
      CGPathMoveToPoint(*(CGMutablePathRef *)(a1 + 32), 0, *a3, a3[1]);
      break;
    case 1:
      CGPathAddLineToPoint(*(CGMutablePathRef *)(a1 + 32), 0, *a3, a3[1]);
      break;
    case 2:
      CGPathAddQuadCurveToPoint(*(CGMutablePathRef *)(a1 + 32), 0, *a3, a3[1], a3[2], a3[3]);
      break;
    case 3:
      CGPathAddCurveToPoint(*(CGMutablePathRef *)(a1 + 32), 0, *a3, a3[1], a3[2], a3[3], a3[4], a3[5]);
      break;
    case 4:
      CGPathCloseSubpath(*(CGMutablePathRef *)(a1 + 32));
      break;
    default:
      return;
  }
}

- (CGRect)accessibilityFrame
{
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;
  CGRect result;

  v3 = -[NSMutableSet count](self->_featureSet, "count");
  if (v3 != -[NSMutableArray count](self->_paths, "count"))
    -[VKFeatureAccessibilityElement _updatePath](self, "_updatePath");
  v8.receiver = self;
  v8.super_class = (Class)VKFeatureAccessibilityElement;
  -[VKFeatureAccessibilityElement accessibilityFrame](&v8, sel_accessibilityFrame);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (id)accessibilityPaths
{
  uint64_t v3;

  v3 = -[NSMutableSet count](self->_featureSet, "count");
  if (v3 != -[NSMutableArray count](self->_paths, "count"))
    -[VKFeatureAccessibilityElement _updatePath](self, "_updatePath");
  return self->_paths;
}

- (id)_accessibilityShortAddress:(id)a3
{
  -[VKFeatureAccessibilityElement _accessibilityShortAddress:alwaysIncludeLocality:](self, "_accessibilityShortAddress:alwaysIncludeLocality:", a3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_accessibilityShortAddress:(id)a3 alwaysIncludeLocality:(BOOL)a4
{
  AXShortAddressDescriptionForPlacemark(a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)startLocationInformationRequest:(CGPoint)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v18[7];

  -[VKFeatureAccessibilityElement _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPointToPoint();
  v6 = v5;
  v8 = v7;

  -[VKFeatureAccessibilityElement accessibilityContainer](self, "accessibilityContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKFeatureAccessibilityElement accessibilityContainer](self, "accessibilityContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "convertPoint:toCoordinateFromLayer:", v10, v6, v8);
  v12 = v11;
  v14 = v13;

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBFA80]), "initWithLatitude:longitude:", v12, v14);
  v16 = objc_alloc_init(MEMORY[0x24BDBFA68]);
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __65__VKFeatureAccessibilityElement_startLocationInformationRequest___block_invoke;
  v18[3] = &unk_2503C4EF0;
  v18[4] = self;
  *(double *)&v18[5] = v6;
  *(double *)&v18[6] = v8;
  v17 = (void *)MEMORY[0x234923E94](v18);
  objc_msgSend(v16, "reverseGeocodeLocation:completionHandler:", v15, v17);
  -[VKFeatureAccessibilityElement _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v16, CFSTR("CLGeocoder"));

}

void __65__VKFeatureAccessibilityElement_startLocationInformationRequest___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
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
  void *v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);
  if (a3 || !v6)
  {
    objc_msgSend(v7, "_accessibilityRemoveValueForKey:", CFSTR("CLGeocoder"));
  }
  else
  {
    objc_msgSend(v7, "_accessibilityShortAddress:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_distanceAwayString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = *(void **)(a1 + 32);
    v17[0] = CFSTR("Point");
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48), v15, CFSTR("__AXStringForVariablesSentinel"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = CFSTR("String");
    v18[0] = v11;
    v18[1] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_accessibilitySetRetainedValue:forKey:", v12, CFSTR("PointInfo"));

    objc_msgSend(*(id *)(a1 + 32), "_accessibilityRemoveValueForKey:", CFSTR("CLGeocoder"));
    objc_msgSend(*(id *)(a1 + 32), "detailedFeatureElementInfoAtPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    +[VKMapViewOutputManager sharedOutputManager](VKMapViewOutputManager, "sharedOutputManager", v16, CFSTR("__AXStringForVariablesSentinel"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "queueOutput:", v13);

  }
}

- (id)detailedFeatureElementInfoAtPoint:(CGPoint)a3
{
  return 0;
}

- (id)_distanceAwayString
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  float *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;

  if (-[NSMutableSet count](self->_featureSet, "count")
    && (objc_msgSend(MEMORY[0x24BDDB0C0], "sharedLocationManager"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "hasLocation"),
        v3,
        (v4 & 1) != 0))
  {
    -[NSMutableSet anyObject](self->_featureSet, "anyObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "feature");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (float *)GEOMultiSectionFeatureBounds();
    objc_msgSend(v6, "feature");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "containingTile");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "geoTileKey");

    VKWorldBoundsFromGEOTileKey();
    -[VKFeatureAccessibilityElement _distanceStringForPoint:](self, "_distanceStringForPoint:", AXVKPointForTileGLPoint(v10, v11, v12, v13, (float)(*v7 + v7[2]) * 0.5));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (id)_distanceStringForPoint:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  int v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;

  VKLocationCoordinate2DForVKPoint();
  objc_msgSend(MEMORY[0x24BDDB0C0], "sharedLocationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "latLng");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lat");
  objc_msgSend(v4, "latLng");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lng");
  GEOCalculateDistance();
  v8 = v7;

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "_navigation_distanceUsesMetricSystem");

  if (v10)
  {
    AXVectorKitLocString(CFSTR("POI_DISTANCE_KM"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 1000.0;
  }
  else
  {
    AXVectorKitLocString(CFSTR("POI_DISTANCE_M"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 1609.344;
  }
  objc_msgSend(v4, "latLng");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lat");
  objc_msgSend(v4, "latLng");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lng");

  GEOBearingFromCoordinateToCoordinate();
  objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", v11, v8 / v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  AXDescriptionForHeadingInDegrees();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_accessibilityMapDetailedInfoAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v17;

  y = a3.y;
  x = a3.x;
  -[VKFeatureAccessibilityElement _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("PointInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6
    && ((objc_msgSend(v6, "objectForKey:", CFSTR("Point")),
         v8 = (void *)objc_claimAutoreleasedReturnValue(),
         objc_msgSend(v8, "CGPointValue"),
         v10 = v9,
         v12 = v11,
         v8,
         v10 == x)
      ? (v13 = v12 == y)
      : (v13 = 0),
        v13))
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("String"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKFeatureAccessibilityElement detailedFeatureElementInfoAtPoint:](self, "detailedFeatureElementInfoAtPoint:", x, y);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[VKFeatureAccessibilityElement startLocationInformationRequest:](self, "startLocationInformationRequest:", x, y);
    v14 = 0;
  }

  return v14;
}

- (int)style
{
  return self->_style;
}

- (void)setStyle:(int)a3
{
  self->_style = a3;
}

- (unint64_t)shieldType
{
  return self->_shieldType;
}

- (void)setShieldType:(unint64_t)a3
{
  self->_shieldType = a3;
}

- (NSMutableSet)featureSet
{
  return self->_featureSet;
}

- (NSMutableDictionary)pointToFeatureDict
{
  return self->_pointToFeatureDict;
}

- (void)setPointToFeatureDict:(id)a3
{
  objc_storeStrong((id *)&self->_pointToFeatureDict, a3);
}

- (NSMutableArray)paths
{
  return self->_paths;
}

- (void)setPaths:(id)a3
{
  objc_storeStrong((id *)&self->_paths, a3);
}

- (NSMutableArray)hitTestPaths
{
  return self->_hitTestPaths;
}

- (void)setHitTestPaths:(id)a3
{
  objc_storeStrong((id *)&self->_hitTestPaths, a3);
}

- (BOOL)isPOI
{
  return self->_isPOI;
}

- (void)setIsPOI:(BOOL)a3
{
  self->_isPOI = a3;
}

- (BOOL)isTransitStop
{
  return self->_isTransitStop;
}

- (void)setIsTransitStop:(BOOL)a3
{
  self->_isTransitStop = a3;
}

- (BOOL)isTransitLine
{
  return self->_isTransitLine;
}

- (void)setIsTransitLine:(BOOL)a3
{
  self->_isTransitLine = a3;
}

- (BOOL)isRouteEta
{
  return self->_isRouteEta;
}

- (void)setIsRouteEta:(BOOL)a3
{
  self->_isRouteEta = a3;
}

- (float)strokeWidth
{
  return self->_strokeWidth;
}

- (void)setStrokeWidth:(float)a3
{
  self->_strokeWidth = a3;
}

- (NSString)shieldText
{
  return self->_shieldText;
}

- (void)setShieldText:(id)a3
{
  objc_storeStrong((id *)&self->_shieldText, a3);
}

- (int)sortKey
{
  return self->_sortKey;
}

- (void)setSortKey:(int)a3
{
  self->_sortKey = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shieldText, 0);
  objc_storeStrong((id *)&self->_hitTestPaths, 0);
  objc_storeStrong((id *)&self->_pointToFeatureDict, 0);
  objc_storeStrong((id *)&self->_paths, 0);
  objc_storeStrong((id *)&self->_featureSet, 0);
}

@end
