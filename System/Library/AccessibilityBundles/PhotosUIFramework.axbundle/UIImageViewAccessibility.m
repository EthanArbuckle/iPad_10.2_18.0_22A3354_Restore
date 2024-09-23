@implementation UIImageViewAccessibility

BOOL __78__UIImageViewAccessibility__PhotosUI__UIKit__accessibilityZoomAtPoint_zoomIn___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  double v3;
  double v4;
  _BOOL8 v5;

  v2 = a2;
  NSClassFromString(CFSTR("PUUserTransformView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "frame");
    v5 = v4 == *(double *)(MEMORY[0x24BDBEFB0] + 8) && v3 == *MEMORY[0x24BDBEFB0];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __78__UIImageViewAccessibility__PhotosUI__UIKit__accessibilityZoomAtPoint_zoomIn___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  char v5;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __78__UIImageViewAccessibility__PhotosUI__UIKit__accessibilityZoomAtPoint_zoomIn___block_invoke_3;
  v3[3] = &unk_24FF15730;
  v4 = v2;
  v5 = *(_BYTE *)(a1 + 40);
  objc_msgSend(v4, "_performZoomAndScrollChanges:", v3);

}

void __78__UIImageViewAccessibility__PhotosUI__UIKit__accessibilityZoomAtPoint_zoomIn___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UIAccessibilityNotifications v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_scrollView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "zoomScale");
  v5 = v4;
  objc_msgSend(v3, "maximumZoomScale");
  v7 = v6;
  objc_msgSend(v3, "minimumZoomScale");
  v9 = (v7 - v8) / 10.0;
  if (!*(_BYTE *)(a1 + 40))
    v9 = -v9;
  objc_msgSend(v3, "setZoomScale:animated:", 1, v5 + v9);
  objc_msgSend(v3, "zoomScale");
  v15 = MEMORY[0x24BDAC760];
  v16 = *(id *)(a1 + 32);
  AXPerformSafeBlock();
  v10 = *MEMORY[0x24BDF71E8];
  v11 = (void *)MEMORY[0x24BDD17C8];
  UIKitAccessibilityLocalizedString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  AXFormatFloat();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", v12, v13, v15, 3221225472, __78__UIImageViewAccessibility__PhotosUI__UIKit__accessibilityZoomAtPoint_zoomIn___block_invoke_4, &unk_24FF15708);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v10, v14);

}

uint64_t __78__UIImageViewAccessibility__PhotosUI__UIKit__accessibilityZoomAtPoint_zoomIn___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setDesiredZoomScale:", *(double *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_setEnabledInteractions:", 7);
}

uint64_t __65__UIImageViewAccessibility__PhotosUI__UIKit__liftableSubjectView__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  NSClassFromString(CFSTR("VKCImageSubjectHighlightView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
