@implementation _UIInterfaceActionCustomViewRepresentationViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIInterfaceActionCustomViewRepresentationView");
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
  objc_storeStrong(location, 0);
}

- (id)accessibilityPath
{
  uint64_t v2;
  double v3;
  double v4;
  void *v6;
  id v7;
  uint64_t (**v8)(__n128, __n128, __n128, __n128);
  id v9;
  id location;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t (*v16)(CGRect *, double, double, double, double);
  void *v17;
  __int128 v18;
  __int128 v19;
  id v20;
  CGRect v21;
  __int128 v22;
  __int128 v23;
  SEL v24;
  _UIInterfaceActionCustomViewRepresentationViewAccessibility *v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  v25 = self;
  v24 = a2;
  v22 = 0u;
  v23 = 0u;
  -[_UIInterfaceActionCustomViewRepresentationViewAccessibility accessibilityFrame](self, "accessibilityFrame");
  v21 = v26;
  v27 = CGRectIntegral(v26);
  *(CGFloat *)&v22 = v27.origin.x;
  *((_QWORD *)&v22 + 1) = *(_QWORD *)&v27.origin.y;
  *(CGFloat *)&v23 = v27.size.width;
  *((_QWORD *)&v23 + 1) = *(_QWORD *)&v27.size.height;
  v13 = MEMORY[0x24BDAC760];
  v14 = -1073741824;
  v15 = 0;
  v16 = __80___UIInterfaceActionCustomViewRepresentationViewAccessibility_accessibilityPath__block_invoke;
  v17 = &__block_descriptor_64_e39_Q40__0_CGRect__CGPoint_dd__CGSize_dd__8l;
  v18 = v22;
  v19 = v23;
  v20 = (id)MEMORY[0x2348C3D88](&v13);
  v12 = 0;
  v11 = 0;
  location = (id)-[_UIInterfaceActionCustomViewRepresentationViewAccessibility _accessibilityFindViewAncestor:startWithSelf:](v25, "_accessibilityFindViewAncestor:startWithSelf:", &__block_literal_global_53, 0);
  if (location)
  {
    v8 = (uint64_t (**)(__n128, __n128, __n128, __n128))v20;
    objc_msgSend(location, "accessibilityFrame");
    v29 = CGRectIntegral(v28);
    v12 = v8[2]((__n128)v29.origin, *(__n128 *)&v29.origin.y, (__n128)v29.size, *(__n128 *)&v29.size.height);
    v9 = (id)objc_msgSend(location, "layer");
    objc_msgSend(v9, "cornerRadius");
    v11 = v2;

  }
  v6 = (void *)MEMORY[0x24BDF6870];
  CGSizeMake_4();
  v7 = (id)objc_msgSend(v6, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", v12, v22, v23, v3, v4);
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v20, 0);
  return v7;
}

@end
