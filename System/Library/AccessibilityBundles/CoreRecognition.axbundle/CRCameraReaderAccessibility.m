@implementation CRCameraReaderAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CRCameraReader");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CALayer"), CFSTR("superlayer"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CRCameraReader"), CFSTR("sessionManager"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CRDefaultCaptureSessionManager"), CFSTR("previewLayer"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CRCameraReader"), CFSTR("alignmentLayer"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CRAlignmentLayer"), CFSTR("outlineLayer"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CRCameraReader"), CFSTR("sendDidFindTarget:frameTime:"), "v", "@", "{?=qiIq}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CRCameraReader"), CFSTR("sendDidRecognizeNewObjects:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CRCameraReader"), CFSTR("startSession"), "v", 0);

}

- (void)sendDidFindTarget:(id)a3 frameTime:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t i;
  NSString *v25;
  CGPoint v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v36;
  double v37;
  id obj;
  CGFloat v39;
  CGFloat v40;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  objc_super v49;
  _BYTE v50[128];
  uint64_t v51;
  CGPoint v52;
  CGRect v53;

  v51 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v49.receiver = self;
  v49.super_class = (Class)CRCameraReaderAccessibility;
  v41 = *a4;
  -[CRCameraReaderAccessibility sendDidFindTarget:frameTime:](&v49, sel_sendDidFindTarget_frameTime_, v6, &v41);
  -[CRCameraReaderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("sessionManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeValueForKey:", CFSTR("previewLayer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safeValueForKey:", CFSTR("bounds"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "CGRectValue");
  v39 = v12;
  v40 = v11;
  v14 = v13;
  v16 = v15;

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v6;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v46;
    v19 = 1;
    v20 = 2.22507386e-308;
    v21 = 1.79769313e308;
    v36 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    v37 = *MEMORY[0x24BDBEFB0];
    v22 = 1.79769313e308;
    v23 = 2.22507386e-308;
    while (1)
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v46 != v18)
          objc_enumerationMutation(obj);
        v25 = *(NSString **)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v26 = CGPointFromString(v25);
          objc_msgSend(v7, "convertCameraPoint:toLayer:", v8, v26.x, v26.y);
        }
        else
        {
          objc_opt_class();
          v29 = v36;
          v30 = v37;
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_11;
          -[NSString CGPointValue](v25, "CGPointValue");
          objc_msgSend(v7, "convertCameraPoint:toLayer:", v8);
        }
        v30 = v27;
        v29 = v28;
LABEL_11:
        objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v30, v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v31);

        v53.origin.y = v39;
        v53.origin.x = v40;
        v53.size.width = v14;
        v53.size.height = v16;
        v52.x = v30;
        v52.y = v29;
        v19 &= CGRectContainsPoint(v53, v52);
        if (v30 < v22)
          v22 = v30;
        if (v29 < v21)
          v21 = v29;
        if (v30 > v23)
          v23 = v30;
        if (v29 > v20)
          v20 = v29;
      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      if (!v17)
      {

        if (!v19)
          goto LABEL_30;
        goto LABEL_24;
      }
    }
  }

  v22 = 1.79769313e308;
  v23 = 2.22507386e-308;
  v20 = 2.22507386e-308;
  v21 = 1.79769313e308;
LABEL_24:
  v41.var0 = 0;
  *(_QWORD *)&v41.var1 = &v41;
  v41.var3 = 0x4010000000;
  v42 = &unk_23259E6B5;
  v43 = 0u;
  v44 = 0u;
  AXPerformSafeBlock();
  v32 = (v23 - v22) * (v20 - v21);
  v33 = *(double *)(*(_QWORD *)&v41.var1 + 48);
  v34 = *(double *)(*(_QWORD *)&v41.var1 + 56);
  _Block_object_dispose(&v41, 8);
  if (v32 > v33 * v34 * 0.5 && v32 < v33 * v34 * 1.2)
    UIAccessibilityPostNotification(0x40Bu, 0);
LABEL_30:
  ++sendDidFindTarget_frameTime__counter;

}

void __59__CRCameraReaderAccessibility_sendDidFindTarget_frameTime___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("alignmentLayer"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safeValueForKey:", CFSTR("outlineLayer"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v3 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;

}

- (void)loadView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRCameraReaderAccessibility;
  -[CRCameraReaderAccessibility loadView](&v3, sel_loadView);
  -[CRCameraReaderAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)startSession
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRCameraReaderAccessibility;
  -[CRCameraReaderAccessibility startSession](&v4, sel_startSession);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRCameraReaderAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v3, CFSTR("AnnouncedStatusActions"));

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRCameraReaderAccessibility;
  -[CRCameraReaderAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  -[CRCameraReaderAccessibility _accessibilityCameraView](self, "_accessibilityCameraView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("CardCaptureViewFinder"));
  accessibilityLocalizedString(CFSTR("camera.viewfinder"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  -[CRCameraReaderAccessibility accessibilityHint](self, "accessibilityHint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    accessibilityLocalizedString(CFSTR("camera.scan.card.hint"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "setAccessibilityHint:", v5);
  objc_msgSend(v3, "_setAccessibilityServesAsFirstElement:", 1);

}

- (id)_accessibilityCameraView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  -[CRCameraReaderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("sessionManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("previewLayer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("superlayer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRCameraReaderAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __55__CRCameraReaderAccessibility__accessibilityCameraView__block_invoke;
  v10[3] = &unk_2501ECED8;
  v11 = v5;
  v7 = v5;
  objc_msgSend(v6, "_accessibilityFindSubviewDescendant:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

BOOL __55__CRCameraReaderAccessibility__accessibilityCameraView__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)sendDidRecognizeNewObjects:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIAccessibilityNotifications v9;
  void *v10;
  void *v11;
  UIAccessibilityNotifications v12;
  void *v13;
  void *v14;
  UIAccessibilityNotifications v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  UIAccessibilityNotifications v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("code"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("cardholderName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("expirationDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRCameraReaderAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AnnouncedStatusActions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24.receiver = self;
  v24.super_class = (Class)CRCameraReaderAccessibility;
  -[CRCameraReaderAccessibility sendDidRecognizeNewObjects:](&v24, sel_sendDidRecognizeNewObjects_, v4);

  if (v5 && v6 && v7)
  {
    v9 = *MEMORY[0x24BDF71E8];
    accessibilityLocalizedString(CFSTR("camera.creditcard.allinfo.found"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v9, v10);

  }
  else
  {
    if (objc_msgSend(v5, "length"))
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("code"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        v12 = *MEMORY[0x24BDF71E8];
        accessibilityLocalizedString(CFSTR("camera.card.number.found"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        UIAccessibilityPostNotification(v12, v13);

        objc_msgSend(v8, "setValue:forKey:", MEMORY[0x24BDBD1C8], CFSTR("code"));
      }
    }
    if (objc_msgSend(v6, "length"))
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("cardholderName"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        v15 = *MEMORY[0x24BDF71E8];
        v16 = (void *)MEMORY[0x24BDD17C8];
        accessibilityLocalizedString(CFSTR("camera.card.holder.found"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithFormat:", v17, v6);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        UIAccessibilityPostNotification(v15, v18);

        objc_msgSend(v8, "setValue:forKey:", MEMORY[0x24BDBD1C8], CFSTR("cardholderName"));
      }
    }
    if (objc_msgSend(v7, "length"))
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("expirationDate"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
      {
        v20 = *MEMORY[0x24BDF71E8];
        v21 = (void *)MEMORY[0x24BDD17C8];
        accessibilityLocalizedString(CFSTR("camera.card.expiration.found"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringWithFormat:", v22, v7);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        UIAccessibilityPostNotification(v20, v23);

        objc_msgSend(v8, "setValue:forKey:", MEMORY[0x24BDBD1C8], CFSTR("expirationDate"));
      }
    }
  }

}

@end
