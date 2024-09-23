@implementation QLImageItemViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("QLImageItemViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("QLImageItemViewController"), CFSTR("loadPreviewControllerWithContents:context:completionHandler:"), "v", "@", "@", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("QLImageItemViewController"), CFSTR("previewDidAppear:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("QLImageItemViewController"), CFSTR("_imageView"), "UIImageView");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("QLImageItemViewController"), CFSTR("QLItemViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("QLItemViewController"), CFSTR("contents"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("QLItemViewController"), CFSTR("context"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("QLPreviewContext"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("QLPreviewContext"), CFSTR("previewTitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("QLPreviewContext"), CFSTR("item"), "@", 0);
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("QLItem"), CFSTR("QLPreviewItem"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("QLItem"), CFSTR("editedFileURL"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("QLAnimatedImage"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("QLAnimatedImage"), CFSTR("frameAtTime:"), "@", "d", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)QLImageItemViewControllerAccessibility;
  -[QLImageItemViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  -[QLImageItemViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("contents"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLImageItemViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("context"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLImageItemViewControllerAccessibility _axPhotoDescriptionFromContents:context:](self, "_axPhotoDescriptionFromContents:context:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLImageItemViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_imageView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIsAccessibilityElement:", 1);
  objc_msgSend(v6, "setAccessibilityLabel:", v5);

}

- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)QLImageItemViewControllerAccessibility;
  -[QLImageItemViewControllerAccessibility loadPreviewControllerWithContents:context:completionHandler:](&v6, sel_loadPreviewControllerWithContents_context_completionHandler_, a3, a4, a5);
  -[QLImageItemViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)previewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)QLImageItemViewControllerAccessibility;
  -[QLImageItemViewControllerAccessibility previewDidAppear:](&v4, sel_previewDidAppear_, a3);
  -[QLImageItemViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (id)_axPhotoDescriptionFromContents:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFURL *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  CGImageSource *v17;
  CGImageRef ImageAtIndex;
  void *v19;
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "accessibilityLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(v6, "safeValueForKey:", CFSTR("previewTitle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  LOBYTE(v22) = 0;
  objc_msgSend(v6, "safeValueForKey:", CFSTR("item"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safeValueForKey:", CFSTR("editedFileURL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v10 = (const __CFURL *)objc_claimAutoreleasedReturnValue();

  MEMORY[0x2348C1FC8](CFSTR("QLAnimatedImage"));
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v17 = CGImageSourceCreateWithURL(v10, 0);
    ImageAtIndex = CGImageSourceCreateImageAtIndex(v17, 0, 0);
    UIAccessibilityMetadataDescriptionForImage();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
      CFRelease(v17);
    if (!ImageAtIndex)
    {
      v16 = 0;
      goto LABEL_13;
    }
    CFAutorelease(ImageAtIndex);
    goto LABEL_11;
  }
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  v27 = 0;
  v21 = v5;
  AXPerformSafeBlock();
  v11 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  LOBYTE(v22) = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_BYTE)v22)
    abort();
  v13 = objc_retainAutorelease(v12);
  v14 = objc_msgSend(v13, "CGImage");

  v15 = 0;
  v16 = 0;
  if (v14)
  {
LABEL_11:
    UIAXPhotoDescriptionString();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_13:
  __UIAXStringForVariables();
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

void __82__QLImageItemViewControllerAccessibility__axPhotoDescriptionFromContents_context___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "frameAtTime:", 0.0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
