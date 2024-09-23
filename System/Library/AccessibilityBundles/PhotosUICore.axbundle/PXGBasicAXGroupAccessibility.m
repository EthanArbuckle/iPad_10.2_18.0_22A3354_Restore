@implementation PXGBasicAXGroupAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXGBasicAXGroup");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXGBasicAXGroup"), CFSTR("axFrame"), "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXGBasicAXGroup"), CFSTR("axScrollParent"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXGBasicAXGroup"), CFSTR("axParent"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXGBasicAXGroup"), CFSTR("axGroupSource"), "@", 0);
  objc_msgSend(v3, "validateProtocol:hasMethod:isInstanceMethod:isRequired:", CFSTR("PXGAXGroupSource"), CFSTR("axConvertRect:fromDescendantGroup:"), 1, 1);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXGBasicAXGroup"), CFSTR("axNextResponder"), "@", 0);
  objc_msgSend(v3, "validateProtocol:hasMethod:isInstanceMethod:isRequired:", CFSTR("PXGAXResponder"), CFSTR("axContainingScrollViewForAXGroup:"), 1, 1);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("_PXUIScrollView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXGBasicAXGroup"), CFSTR("_updateLayoutIfNeeded"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXGBasicAXGroup"), CFSTR("needsUpdate"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXGBasicAXGroup"), CFSTR("updateSubgroupsWithChangeDetails:"), "v", "@", 0);

}

- (id)_axPXGScrollView
{
  void *v3;
  void *v4;
  void *v5;

  -[PXGBasicAXGroupAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("axScrollParent"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("axNextResponder"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "axContainingScrollViewForAXGroup:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CGRect)accessibilityFrame
{
  void *v3;
  void *v4;
  void *v5;
  __int128 v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  double *v19;
  uint64_t v20;
  const char *v21;
  __int128 v22;
  __int128 v23;
  CGRect result;

  -[PXGBasicAXGroupAccessibility safeCGRectForKey:](self, "safeCGRectForKey:", CFSTR("axFrame"));
  -[PXGBasicAXGroupAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("axScrollParent"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGBasicAXGroupAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("axParent"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGBasicAXGroupAccessibility _axPXGScrollView](self, "_axPXGScrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v19 = (double *)&v18;
  v20 = 0x4010000000;
  v21 = "";
  v6 = *(_OWORD *)(MEMORY[0x24BDBF070] + 16);
  v22 = *MEMORY[0x24BDBF070];
  v23 = v6;
  v15 = v4;
  v16 = v3;
  v17 = v5;
  AXPerformSafeBlock();
  v7 = v19[4];
  v8 = v19[5];
  v9 = v19[6];
  v10 = v19[7];

  _Block_object_dispose(&v18, 8);
  v11 = v7;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

void __50__PXGBasicAXGroupAccessibility_accessibilityFrame__block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "safeValueForKey:", CFSTR("axGroupSource"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "axConvertRect:fromDescendantGroup:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;

  }
  else
  {
    v4 = *(double *)(a1 + 64);
    v6 = *(double *)(a1 + 72);
    v8 = *(double *)(a1 + 80);
    v10 = *(double *)(a1 + 88);
  }
  objc_msgSend(*(id *)(a1 + 48), "safeValueForKey:", CFSTR("window"));
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "convertRect:fromView:", *(_QWORD *)(a1 + 48), v4, v6, v8, v10);
  v11 = *(_QWORD **)(*(_QWORD *)(a1 + 56) + 8);
  v11[4] = v12;
  v11[5] = v13;
  v11[6] = v14;
  v11[7] = v15;

}

- (void)_updateLayoutIfNeeded
{
  int v3;
  void *v4;
  void *v5;
  objc_super v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v3 = -[PXGBasicAXGroupAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("needsUpdate"));
  v6.receiver = self;
  v6.super_class = (Class)PXGBasicAXGroupAccessibility;
  -[PXGBasicAXGroupAccessibility _updateLayoutIfNeeded](&v6, sel__updateLayoutIfNeeded);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = CFSTR("AXPhotosGridGroupKey");
    v7[1] = CFSTR("AXPhotosGridUpdateKey");
    v8[0] = self;
    v8[1] = &unk_24FF146E8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("AXPhotosGridGroupDataChanged"), self, v5);

  }
}

- (void)updateSubgroupsWithChangeDetails:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  objc_super v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v8.receiver = self;
  v8.super_class = (Class)PXGBasicAXGroupAccessibility;
  v4 = a3;
  -[PXGBasicAXGroupAccessibility updateSubgroupsWithChangeDetails:](&v8, sel_updateSubgroupsWithChangeDetails_, v4);
  v5 = objc_msgSend(v4, "hasAnyInsertionsRemovalsOrMoves");

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = CFSTR("AXPhotosGridGroupKey");
    v9[1] = CFSTR("AXPhotosGridUpdateKey");
    v10[0] = self;
    v10[1] = &unk_24FF146E8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("AXPhotosGridGroupDataChanged"), self, v7);

  }
}

@end
