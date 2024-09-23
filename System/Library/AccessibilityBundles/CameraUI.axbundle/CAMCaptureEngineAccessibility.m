@implementation CAMCaptureEngineAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMCaptureEngine");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMCaptureEngine"), CFSTR("_handleSessionDidStartRunning:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMCaptureEngine"), CFSTR("_handleSessionDidStopRunning:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CAMCaptureEngine"), CFSTR("__captureSession"), "AVCaptureSession");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CAMCaptureEngine"), CFSTR("__captureSessionQueue"), "NSObject<OS_dispatch_queue>");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMCaptureEngine"), CFSTR("captureOutput:didOutputMetadataObjects:forMetadataObjectTypes:fromConnection:"), "v", "@", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMCaptureEngine"), CFSTR("_updateCurrentlyConfiguredObjects"), "v", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMCaptureEngineAccessibility;
  -[CAMCaptureEngineAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[CAMCaptureEngineAccessibility _handleSessionDidStartRunning:](self, "_handleSessionDidStartRunning:", 0);
}

- (void)_accessibilityDetectFaces:(BOOL)a3 completionBlock:(id)a4
{
  _BOOL4 v4;
  void *v6;
  id v7;

  v4 = a3;
  +[AXCameraVisionEngine sharedEngine](AXCameraVisionEngine, "sharedEngine", a3, a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[CAMCaptureEngineAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("__captureSession"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCaptureSession:", v6);

  }
  else
  {
    objc_msgSend(v7, "setCaptureSession:", 0);
  }

}

- (void)_handleSessionDidStartRunning:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  objc_super v12;

  v4 = (void *)*MEMORY[0x24BDF74F8];
  v5 = a3;
  objc_msgSend(v4, "_accessibilitySetCameraIrisOpen:", 1);
  v12.receiver = self;
  v12.super_class = (Class)CAMCaptureEngineAccessibility;
  -[CAMCaptureEngineAccessibility _handleSessionDidStartRunning:](&v12, sel__handleSessionDidStartRunning_, v5);

  UIAccessibilityPostNotification(0xFA2u, &unk_24FEF05F8);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BDF7458];
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __63__CAMCaptureEngineAccessibility__handleSessionDidStartRunning___block_invoke;
  v11[3] = &unk_24FEE0518;
  v11[4] = self;
  objc_msgSend(v6, "addObserverForName:object:queue:usingBlock:", v7, 0, v8, v11);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)VOObserver;
  VOObserver = v9;

  if (UIAccessibilityIsVoiceOverRunning())
    -[CAMCaptureEngineAccessibility _accessibilityDetectFaces:completionBlock:](self, "_accessibilityDetectFaces:completionBlock:", 1, 0);
}

uint64_t __63__CAMCaptureEngineAccessibility__handleSessionDidStartRunning___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_accessibilityDetectFaces:completionBlock:", UIAccessibilityIsVoiceOverRunning(), 0);
}

- (void)_handleSessionDidStopRunning:(id)a3
{
  void *v4;
  id v5;
  objc_super v6;

  v4 = (void *)*MEMORY[0x24BDF74F8];
  v5 = a3;
  objc_msgSend(v4, "_accessibilitySetCameraIrisOpen:", 0);
  v6.receiver = self;
  v6.super_class = (Class)CAMCaptureEngineAccessibility;
  -[CAMCaptureEngineAccessibility _handleSessionDidStopRunning:](&v6, sel__handleSessionDidStopRunning_, v5);

  UIAccessibilityPostNotification(0xFA2u, &unk_24FEF0620);
}

- (void)_updateCurrentlyConfiguredObjects
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CAMCaptureEngineAccessibility;
  -[CAMCaptureEngineAccessibility _updateCurrentlyConfiguredObjects](&v2, sel__updateCurrentlyConfiguredObjects);
  UIAccessibilityIsVoiceOverRunning();
}

- (void)captureOutput:(id)a3 didOutputMetadataObjects:(id)a4 forMetadataObjectTypes:(id)a5 fromConnection:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CAMCaptureEngineAccessibility;
  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  -[CAMCaptureEngineAccessibility captureOutput:didOutputMetadataObjects:forMetadataObjectTypes:fromConnection:](&v14, sel_captureOutput_didOutputMetadataObjects_forMetadataObjectTypes_fromConnection_, v12, v11, v10, v9);
  +[AXCameraVisionEngine sharedEngine](AXCameraVisionEngine, "sharedEngine", v14.receiver, v14.super_class);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "captureOutput:didOutputMetadataObjects:forMetadataObjectTypes:fromConnection:", v12, v11, v10, v9);

}

@end
