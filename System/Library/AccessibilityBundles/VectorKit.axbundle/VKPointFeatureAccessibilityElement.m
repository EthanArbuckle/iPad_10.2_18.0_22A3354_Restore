@implementation VKPointFeatureAccessibilityElement

- (VKPointFeatureAccessibilityElement)initWithAccessibilityContainer:(id)a3
{
  id v4;
  VKPointFeatureAccessibilityElement *v5;
  NSMutableArray *v6;
  NSMutableArray *featureIds;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VKPointFeatureAccessibilityElement;
  v5 = -[VKFeatureAccessibilityElement initWithAccessibilityContainer:](&v9, sel_initWithAccessibilityContainer_, v4);
  if (v5)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    featureIds = v5->_featureIds;
    v5->_featureIds = v6;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  VKPointFeatureAccessibilityElement *v4;
  VKPointFeatureAccessibilityElement *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  int v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  char v21;

  v4 = (VKPointFeatureAccessibilityElement *)a3;
  if (self == v4)
  {
    v21 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[VKPointFeatureAccessibilityElement location](self, "location");
      v7 = v6;
      -[VKPointFeatureAccessibilityElement location](v5, "location");
      if (v7 != v8)
        goto LABEL_11;
      -[VKPointFeatureAccessibilityElement location](self, "location");
      v10 = v9;
      -[VKPointFeatureAccessibilityElement location](v5, "location");
      if (v10 != v11)
        goto LABEL_11;
      -[VKPointFeatureAccessibilityElement location](self, "location");
      v13 = v12;
      -[VKPointFeatureAccessibilityElement location](v5, "location");
      if (v13 != v14)
        goto LABEL_11;
      v15 = -[VKFeatureAccessibilityElement style](self, "style");
      if (v15 != -[VKFeatureAccessibilityElement style](v5, "style"))
        goto LABEL_11;
      -[VKPointFeatureAccessibilityElement featureIds](self, "featureIds");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[VKPointFeatureAccessibilityElement featureIds](v5, "featureIds");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqualToArray:", v17);

      if ((v18 & 1) != 0)
      {
        -[VKPointFeatureAccessibilityElement accessibilityLabel](self, "accessibilityLabel");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[VKPointFeatureAccessibilityElement accessibilityLabel](v5, "accessibilityLabel");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v19, "isEqualToString:", v20);

      }
      else
      {
LABEL_11:
        v21 = 0;
      }

    }
    else
    {
      v21 = 0;
    }
  }

  return v21;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (int64_t)_accessibilityMapFeatureType
{
  if (-[VKFeatureAccessibilityElement isPOI](self, "isPOI"))
    return 3;
  else
    return 2;
}

- (double)_radius
{
  int64_t v2;
  double result;

  v2 = -[VKPointFeatureAccessibilityElement _accessibilityMapFeatureType](self, "_accessibilityMapFeatureType");
  result = 40.0;
  if ((unint64_t)(v2 - 9) >= 4)
    return 20.0;
  return result;
}

- (id)accessibilityPath
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDF6870];
  -[VKPointFeatureAccessibilityElement accessibilityPaths](self, "accessibilityPaths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bezierPathWithCGPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)accessibilityPaths
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  void *v13;
  double MidX;
  id v15;
  void *v16;
  _QWORD v18[2];
  CGRect v19;
  CGRect v20;

  v18[1] = *MEMORY[0x24BDAC8D0];
  -[VKPointFeatureAccessibilityElement accessibilityFrame](self, "accessibilityFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[VKPointFeatureAccessibilityElement _radius](self, "_radius");
  v12 = v11;
  v13 = (void *)MEMORY[0x24BDF6870];
  v19.origin.x = v4;
  v19.origin.y = v6;
  v19.size.width = v8;
  v19.size.height = v10;
  MidX = CGRectGetMidX(v19);
  v20.origin.x = v4;
  v20.origin.y = v6;
  v20.size.width = v8;
  v20.size.height = v10;
  objc_msgSend(v13, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, MidX, CGRectGetMidY(v20), v12, 0.0, 6.28318531);
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v18[0] = objc_msgSend(v15, "CGPath");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)trueLabel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VKPointFeatureAccessibilityElement;
  -[VKFeatureAccessibilityElement accessibilityLabel](&v3, sel_accessibilityLabel);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_poiTypeSuffix
{
  unint64_t v2;

  v2 = -[VKPointFeatureAccessibilityElement _accessibilityMapFeatureType](self, "_accessibilityMapFeatureType") - 4;
  if (v2 > 0x17 || ((0xDFFFFFu >> v2) & 1) == 0)
    return 0;
  AXVectorKitLocString(off_2503C5050[v2]);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)accessibilityLabel
{
  void *v3;
  id *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v10;
  const __CFString *v11;
  objc_super v12;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%p-_accessibilityLabel"), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id *)MEMORY[0x24BEBAD70];
  objc_msgSend((id)*MEMORY[0x24BEBAD70], "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*v4, "objectForKeyedSubscript:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)VKPointFeatureAccessibilityElement;
    -[VKFeatureAccessibilityElement accessibilityLabel](&v12, sel_accessibilityLabel);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKPointFeatureAccessibilityElement _poiTypeSuffix](self, "_poiTypeSuffix");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 && objc_msgSend(v6, "rangeOfString:", v7) == 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = v7;
      v11 = CFSTR("__AXStringForVariablesSentinel");
      __UIAXStringForVariables();
      v8 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v8;
    }
    objc_msgSend(*v4, "setObject:forKeyedSubscript:", v6, v3, v10, v11);

  }
  return v6;
}

- (id)accessibilityIdentifier
{
  return CFSTR("VKPointFeature");
}

- (void)setLocation:(id)a3
{
  self->_location = ($83A9B0F16167884A9BDC45564D3E7367)a3;
  -[VKFeatureAccessibilityElement _updateElementStatus](self, "_updateElementStatus");
}

- (id)_distanceAwayString
{
  return -[VKFeatureAccessibilityElement _distanceStringForPoint:](self, "_distanceStringForPoint:", self->_location.x, self->_location.y, self->_location.z);
}

- (CGRect)accessibilityFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  VKLocationCoordinate2DForVKPoint();
  v4 = v3;
  v6 = v5;
  -[VKPointFeatureAccessibilityElement accessibilityContainer](self, "accessibilityContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKPointFeatureAccessibilityElement accessibilityContainer](self, "accessibilityContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "convertCoordinate:toPointToLayer:", v8, v4, v6);

  -[VKPointFeatureAccessibilityElement accessibilityContainer](self, "accessibilityContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessibilityLayerHostingView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  UIAccessibilityFrameForBounds();
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v19 = v12;
  v20 = v14;
  v21 = v16;
  v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (BOOL)accessibilityActivate
{
  objc_super v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  VKPointFeatureAccessibilityElement *v9;

  v5 = MEMORY[0x24BDAC760];
  v6 = 3221225472;
  v7 = __59__VKPointFeatureAccessibilityElement_accessibilityActivate__block_invoke;
  v8 = &unk_2503C4FE0;
  v9 = self;
  AXPerformBlockOnMainThreadAfterDelay();
  v4.receiver = self;
  v4.super_class = (Class)VKPointFeatureAccessibilityElement;
  return -[VKPointFeatureAccessibilityElement accessibilityActivate](&v4, sel_accessibilityActivate);
}

void __59__VKPointFeatureAccessibilityElement_accessibilityActivate__block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  id v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "accessibilityContainer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v4, "safeBoolForKey:", CFSTR("accessibilityIsShowingCalloutAnnotationView"));

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "accessibilityContainer");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeValueForKey:", CFSTR("accessibilityCalloutAnnotationView"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], v3);

  }
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

- (id)accessibilityDragSourceDescriptors
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  -[VKPointFeatureAccessibilityElement _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BDF67B0]);
  v5 = (void *)MEMORY[0x24BDD17C8];
  AXVectorKitLocString(CFSTR("DRAG_POI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKPointFeatureAccessibilityElement accessibilityLabel](self, "accessibilityLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKPointFeatureAccessibilityElement accessibilityActivationPoint](self, "accessibilityActivationPoint");
  UIAccessibilityPointToPoint();
  v9 = (void *)objc_msgSend(v4, "initWithName:point:inView:", v8, v3);
  v12[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- ($1AB5FA073B851C12C2339EC22442E995)location
{
  double x;
  double y;
  double z;
  $1AB5FA073B851C12C2339EC22442E995 result;

  x = self->_location.x;
  y = self->_location.y;
  z = self->_location.z;
  result.var2 = z;
  result.var1 = y;
  result.var0 = x;
  return result;
}

- (NSMutableArray)featureIds
{
  return self->_featureIds;
}

- (void)setFeatureIds:(id)a3
{
  objc_storeStrong((id *)&self->_featureIds, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureIds, 0);
}

@end
