@implementation _UIStackedImageContainerLayerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIStackedImageContainerLayer");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("_UIStackedImageContainerLayer"), CFSTR("_scale"), "d");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("_UIStackedImageContainerLayer"), CFSTR("_imageLayersContainer"), "CALayer");
  objc_storeStrong(location, 0);
}

- (CGRect)accessibilityFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  float v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;
  double v26;
  objc_super v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id location;
  double v39;
  id v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  id v46[2];
  _UIStackedImageContainerLayerAccessibility *v47;
  __int128 v48;
  __int128 v49;
  CGRect result;

  v47 = self;
  v46[1] = (id)a2;
  v46[0] = -[_UIStackedImageContainerLayerAccessibility _accessibilityLayerHostingView](self);
  v48 = 0u;
  v49 = 0u;
  if (v46[0])
  {
    objc_msgSend(v46[0], "accessibilityFrame");
    v42 = v2;
    v43 = v3;
    v44 = v4;
    v45 = v5;
    v25 = (id)-[_UIStackedImageContainerLayerAccessibility safeValueForKey:](v47, "safeValueForKey:", CFSTR("_scale"));
    objc_msgSend(v25, "floatValue");
    v26 = v6;

    v41 = v26;
    v7 = v26;
    if (v26 < 1.0)
    {
      v7 = 1.0;
      v41 = 1.0;
    }
    v40 = (id)objc_msgSend(v46[0], "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_58, 1, v7);
    v39 = 0.0;
    if (v40)
      v24 = 1.0;
    else
      v24 = v41;
    v39 = v24;
    *(double *)&v49 = v44 * v24;
    *((double *)&v49 + 1) = v45 * v41;
    *(double *)&v48 = v42 - (v44 * v24 - v44) / 2.0;
    *((double *)&v48 + 1) = v43 - (v45 * v41 - v45) / 2.0;
    location = (id)-[_UIStackedImageContainerLayerAccessibility valueForKey:](v47, "valueForKey:", CFSTR("_imageLayersContainer"));
    if (location)
    {
      objc_msgSend(location, "frame");
      v34 = v8;
      v35 = v9;
      v36 = v10;
      v37 = v11;
      *(double *)&v48 = *(double *)&v48 + v8;
      objc_msgSend(location, "frame");
      v30 = v12;
      v31 = v13;
      v32 = v14;
      v33 = v15;
      *((double *)&v48 + 1) = *((double *)&v48 + 1) + v13;
    }
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v40, 0);
  }
  else
  {
    v27.receiver = v47;
    v27.super_class = (Class)_UIStackedImageContainerLayerAccessibility;
    -[_UIStackedImageContainerLayerAccessibility accessibilityFrame](&v27, sel_accessibilityFrame);
    *(_QWORD *)&v28 = v16;
    *((_QWORD *)&v28 + 1) = v17;
    *(_QWORD *)&v29 = v18;
    *((_QWORD *)&v29 + 1) = v19;
    v48 = v28;
    v49 = v29;
  }
  objc_storeStrong(v46, 0);
  v21 = *((double *)&v48 + 1);
  v20 = *(double *)&v48;
  v23 = *((double *)&v49 + 1);
  v22 = *(double *)&v49;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (id)_accessibilityLayerHostingView
{
  id v1;
  id v2;
  int v4;
  id obj;
  id v6;
  id v7;
  char v8;
  id v9;
  id v10[2];
  id v11;

  v10[1] = a1;
  if (a1)
  {
    v10[0] = 0;
    v8 = 0;
    objc_opt_class();
    v7 = (id)__UIAccessibilityCastAsClass();
    v6 = v7;
    objc_storeStrong(&v7, 0);
    v9 = v6;
    do
    {
      if (!v9)
        break;
      obj = (id)objc_msgSend(v9, "delegate");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_storeStrong(v10, obj);
        v4 = 3;
      }
      else
      {
        v1 = (id)objc_msgSend(v9, "superlayer");
        v2 = v9;
        v9 = v1;

        v4 = 0;
      }
      objc_storeStrong(&obj, 0);
    }
    while (!v4);
    v11 = v10[0];
    objc_storeStrong(&v9, 0);
    objc_storeStrong(v10, 0);
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

@end
