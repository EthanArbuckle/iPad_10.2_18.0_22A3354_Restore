@implementation _UIPlatterTransformViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIPlatterTransformView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (uint64_t)_accessibilityIsExpandedTransformView
{
  char v2;

  if (a1)
    v2 = __UIAccessibilityGetAssociatedBool() & 1;
  else
    v2 = 0;
  return v2 & 1;
}

- (uint64_t)_accessibilitySetIsExpandedTransformView:(uint64_t)result
{
  if (result)
    return __UIAccessibilitySetAssociatedBool();
  return result;
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  id obj;
  id *v5;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v5 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = CFSTR("_UIPlatterTransformView");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("shouldTakeOwnershipOfSourceView"), "B", 0);
  objc_storeStrong(v5, obj);
}

- (id)_axCachedPlatterElements
{
  if (a1)
    return objc_getAssociatedObject(a1, &___UIPlatterTransformViewAccessibility___axCachedPlatterElements);
  else
    return 0;
}

- (void)_axSetCachedPlatterElements:(uint64_t)a1
{
  id location;
  uint64_t v3;

  v3 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v3)
    __UIAccessibilitySetAssociatedObject();
  objc_storeStrong(&location, 0);
}

- (int64_t)accessibilityContainerType
{
  objc_super v3;
  SEL v4;
  _UIPlatterTransformViewAccessibility *v5;

  v5 = self;
  v4 = a2;
  if ((-[_UIPlatterTransformViewAccessibility _accessibilityIsExpandedTransformView]((uint64_t)self) & 1) != 0)
    return 4;
  v3.receiver = v5;
  v3.super_class = (Class)_UIPlatterTransformViewAccessibility;
  return -[_UIPlatterTransformViewAccessibility accessibilityContainerType](&v3, sel_accessibilityContainerType);
}

- (uint64_t)_axShowsSourceViewDirectly
{
  char v2;

  if (a1)
    v2 = objc_msgSend(a1, "safeBoolForKey:", CFSTR("shouldTakeOwnershipOfSourceView")) & 1;
  else
    v2 = 0;
  return v2 & 1;
}

- (BOOL)isAccessibilityElement
{
  int v3;
  objc_super v4;
  char v5;
  id v6;
  SEL v7;
  _UIPlatterTransformViewAccessibility *v8;

  v8 = self;
  v7 = a2;
  v5 = 0;
  LOBYTE(v3) = 0;
  if (AXRequestingClient() == 4)
  {
    v6 = (id)objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v5 = 1;
    LOBYTE(v3) = 0;
    if ((objc_msgSend(v6, "assistiveTouchScannerSpeechEnabled") & 1) == 0)
    {
      LOBYTE(v3) = 0;
      if ((-[_UIPlatterTransformViewAccessibility _accessibilityIsExpandedTransformView]((uint64_t)v8) & 1) != 0)
        v3 = -[_UIPlatterTransformViewAccessibility _axShowsSourceViewDirectly](v8) ^ 1;
    }
  }
  if ((v5 & 1) != 0)

  if ((v3 & 1) != 0)
    return 1;
  v4.receiver = v8;
  v4.super_class = (Class)_UIPlatterTransformViewAccessibility;
  return -[_UIPlatterTransformViewAccessibility isAccessibilityElement](&v4, sel_isAccessibilityElement);
}

- (id)accessibilityLabel
{
  objc_super v3;
  SEL v4;
  _UIPlatterTransformViewAccessibility *v5;
  id v6;

  v5 = self;
  v4 = a2;
  if ((-[_UIPlatterTransformViewAccessibility _accessibilityIsExpandedTransformView]((uint64_t)self) & 1) != 0)
  {
    v6 = accessibilityLocalizedString(CFSTR("context.menu.preview"));
  }
  else
  {
    v3.receiver = v5;
    v3.super_class = (Class)_UIPlatterTransformViewAccessibility;
    v6 = -[_UIPlatterTransformViewAccessibility accessibilityLabel](&v3, sel_accessibilityLabel);
  }
  return v6;
}

- (id)accessibilityElements
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  AXPlatterContentMockElement *v13;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  id *v20;
  id obj;
  uint64_t v22;
  objc_super v23;
  id v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  id location;
  id v34;
  _QWORD __b[8];
  void *v36;
  id v37;
  id v38;
  id v39;
  char v40;
  id v41;
  uint64_t v42;
  int v43;
  int v44;
  BOOL (*v45)(id *, void *);
  void *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52[2];
  _UIPlatterTransformViewAccessibility *v53;
  id v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v53 = self;
  v52[1] = (id)a2;
  if ((-[_UIPlatterTransformViewAccessibility _accessibilityIsExpandedTransformView]((uint64_t)self) & 1) == 0
    || (-[_UIPlatterTransformViewAccessibility _axShowsSourceViewDirectly](v53) & 1) != 0)
  {
    v23.receiver = v53;
    v23.super_class = (Class)_UIPlatterTransformViewAccessibility;
    v54 = -[_UIPlatterTransformViewAccessibility accessibilityElements](&v23, sel_accessibilityElements);
  }
  else
  {
    v52[0] = (id)-[_UIPlatterTransformViewAccessibility safeUIViewForKey:](v53, "safeUIViewForKey:", CFSTR("sourceView"));
    v51 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%p-sourceViewElements"), v53);
    v50 = (id)objc_msgSend((id)*MEMORY[0x24BEBAD70], "objectForKeyedSubscript:", v51);
    if (!v50)
    {
      v49 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v48 = (id)objc_msgSend(MEMORY[0x24BEBADC8], "options");
      v42 = MEMORY[0x24BDAC760];
      v43 = -1073741824;
      v44 = 0;
      v45 = __61___UIPlatterTransformViewAccessibility_accessibilityElements__block_invoke;
      v46 = &unk_24FF3E2D0;
      v47 = v52[0];
      objc_msgSend(v48, "setLeafNodePredicate:", &v42);
      v20 = (id *)MEMORY[0x24BDF74F8];
      v41 = (id)objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilityContainerToStopVisibilityCheck");
      v40 = 0;
      v40 = objc_msgSend(*v20, "_accessibilityShouldIgnoreOpaqueElementProviders") & 1;
      objc_msgSend(*v20, "_accessibilitySetShouldIgnoreOpaqueElementProviders:", 1);
      objc_msgSend(*v20, "_accessibilitySetContainerToStopVisibilityCheck:", v52[0]);
      v39 = (id)objc_msgSend(v52[0], "_accessibilityLeafDescendantsWithOptions:", v48);
      objc_msgSend(*v20, "_accessibilitySetShouldIgnoreOpaqueElementProviders:", v40 & 1);
      objc_msgSend(*v20, "_accessibilitySetContainerToStopVisibilityCheck:", v41);
      v38 = -[_UIPlatterTransformViewAccessibility _axCachedPlatterElements](v53);
      v37 = (id)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      memset(__b, 0, sizeof(__b));
      obj = v39;
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v55, 16);
      if (v22)
      {
        v17 = *(_QWORD *)__b[2];
        v18 = 0;
        v19 = v22;
        while (1)
        {
          v16 = v18;
          if (*(_QWORD *)__b[2] != v17)
            objc_enumerationMutation(obj);
          v36 = *(void **)(__b[1] + 8 * v18);
          v34 = (id)objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", v36);
          location = (id)objc_msgSend(v38, "objectForKeyedSubscript:", v34);
          if (!location)
          {
            if ((objc_msgSend(v36, "_accessibilityIsRemoteElement") & 1) != 0)
            {
              v2 = objc_alloc(MEMORY[0x24BDF67A0]);
              v3 = (void *)objc_msgSend(v2, "initWithAccessibilityContainer:", v53);
              v4 = location;
              location = v3;

              objc_msgSend(v36, "accessibilityFrame");
              v27 = v5;
              v28 = v6;
              v29 = v7;
              v30 = v8;
              UIAccessibilityFrameToBounds();
              *(double *)&v31 = v9;
              *((double *)&v31 + 1) = v10;
              *(double *)&v32 = v11;
              *((double *)&v32 + 1) = v12;
              v25 = v31;
              v26 = v32;
              objc_msgSend(location, "setAccessibilityFrameInContainerSpace:", v9, v10, v11, v12);
              objc_msgSend(location, "setAccessibilityTraits:", *MEMORY[0x24BDF73C8]);
              v15 = accessibilityLocalizedString(CFSTR("context.menu.preview"));
              objc_msgSend(location, "setAccessibilityLabel:");

            }
            else
            {
              v13 = [AXPlatterContentMockElement alloc];
              v24 = -[AXPlatterContentMockElement initWithAccessibilityContainer:](v13, "initWithAccessibilityContainer:", v53);
              -[AXPlatterContentMockElement setSourceElement:]((uint64_t)v24, v36);
              -[AXPlatterContentMockElement setSourceView:]((uint64_t)v24, v52[0]);
              objc_storeStrong(&location, v24);
              objc_storeStrong(&v24, 0);
            }
          }
          objc_msgSend(v49, "addObject:", location);
          objc_msgSend(v37, "setObject:forKeyedSubscript:", location, v34);
          objc_storeStrong(&location, 0);
          objc_storeStrong(&v34, 0);
          ++v18;
          if (v16 + 1 >= v19)
          {
            v18 = 0;
            v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v55, 16);
            if (!v19)
              break;
          }
        }
      }

      -[_UIPlatterTransformViewAccessibility _axSetCachedPlatterElements:]((uint64_t)v53, v37);
      objc_storeStrong(&v50, v49);
      objc_msgSend((id)*MEMORY[0x24BEBAD70], "setObject:forKeyedSubscript:", v50, v51);
      objc_storeStrong(&v37, 0);
      objc_storeStrong(&v38, 0);
      objc_storeStrong(&v39, 0);
      objc_storeStrong(&v41, 0);
      objc_storeStrong(&v47, 0);
      objc_storeStrong(&v48, 0);
      objc_storeStrong(&v49, 0);
    }
    v54 = v50;
    objc_storeStrong(&v50, 0);
    objc_storeStrong(&v51, 0);
    objc_storeStrong(v52, 0);
  }
  return v54;
}

@end
