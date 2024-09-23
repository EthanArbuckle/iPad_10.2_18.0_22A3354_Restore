@implementation AKSegmentedCtrlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AKSegmentedCtrl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKSegmentedCtrl"), CFSTR("setTag: forSegment:"), "v", "q", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKSegmentedCtrl"), CFSTR("segmentAtIndex:"), "@", "Q", 0);

}

- (void)setTag:(int64_t)a3 forSegment:(unint64_t)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AKSegmentedCtrlAccessibility;
  -[AKSegmentedCtrlAccessibility setTag:forSegment:](&v14, sel_setTag_forSegment_);
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  v13 = 0;
  AXPerformSafeBlock();
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  if ((unint64_t)a3 < 4)
  {
    accessibilityLocalizedString(off_25014EE98[a3]);
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      objc_msgSend(v5, "setAccessibilityLabel:", v6);

    }
  }

}

void __50__AKSegmentedCtrlAccessibility_setTag_forSegment___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "segmentAtIndex:", *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
