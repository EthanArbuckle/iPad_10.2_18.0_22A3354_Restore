@implementation CAMMotionControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMMotionController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMMotionController"), CFSTR("_attitudeAlignmentMotionManager"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMMotionController"), CFSTR("captureOrientation"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMMotionController"), CFSTR("_handleLevelMotionUpdate:error:"), "v", "@", "@", 0);

}

- (void)_handleLevelMotionUpdate:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)CAMMotionControllerAccessibility;
  -[CAMMotionControllerAccessibility _handleLevelMotionUpdate:error:](&v10, sel__handleLevelMotionUpdate_error_, v6, v7);
  objc_opt_class();
  -[CAMMotionControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_attitudeAlignmentMotionManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    -[CAMMotionControllerAccessibility _axDoMotionUpdate:](self, "_axDoMotionUpdate:", v9);

}

- (id)_axInternalMotionManagerQueue
{
  JUMPOUT(0x2348BFD28);
}

- (void)_axSetInternalMotionManagerQueue:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (id)_axInternalMotionManager
{
  JUMPOUT(0x2348BFD28);
}

- (void)_axSetInternalMotionManager:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (void)axStartInternalMotionManagerIfNecessary
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  LOBYTE(location) = 0;
  objc_opt_class();
  -[CAMMotionControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_attitudeAlignmentMotionManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isDeviceMotionActive") & 1) == 0)
  {
    -[CAMMotionControllerAccessibility _axInternalMotionManagerQueue](self, "_axInternalMotionManagerQueue");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v5 = objc_alloc_init(MEMORY[0x24BDD1710]);
      -[CAMMotionControllerAccessibility _axSetInternalMotionManagerQueue:](self, "_axSetInternalMotionManagerQueue:", v5);
    }
    -[CAMMotionControllerAccessibility _axInternalMotionManager](self, "_axInternalMotionManager");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v6 = objc_alloc_init(MEMORY[0x24BDC1400]);
      objc_msgSend(v6, "setDeviceMotionUpdateInterval:", 0.1);
      -[CAMMotionControllerAccessibility _axSetInternalMotionManager:](self, "_axSetInternalMotionManager:", v6);
    }
    if (objc_msgSend(v6, "isDeviceMotionAvailable")
      && (objc_msgSend(v6, "isDeviceMotionActive") & 1) == 0)
    {
      objc_initWeak(&location, self);
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = __75__CAMMotionControllerAccessibility_axStartInternalMotionManagerIfNecessary__block_invoke;
      v7[3] = &unk_24FEE0B10;
      objc_copyWeak(&v9, &location);
      v8 = v6;
      objc_msgSend(v8, "startDeviceMotionUpdatesToQueue:withHandler:", v5, v7);

      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }

  }
}

void __75__CAMMotionControllerAccessibility_axStartInternalMotionManagerIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_axDoMotionUpdate:", *(_QWORD *)(a1 + 32));

}

- (void)axStopInternalMotionManager
{
  id v2;

  -[CAMMotionControllerAccessibility _axInternalMotionManager](self, "_axInternalMotionManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopDeviceMotionUpdates");

}

- (void)_axDoMotionUpdate:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v10 = v4;
    v6 = objc_msgSend(v4, "isDeviceMotionAvailable");
    v5 = v10;
    if (v6)
    {
      objc_msgSend(v10, "deviceMotion");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[CAMMotionControllerAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("captureOrientation"));
      +[AXCameraVisionEngine sharedEngine](AXCameraVisionEngine, "sharedEngine");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "motionManagerDidUpdateDeviceMotion:captureOrientation:", v7, v8);

      v5 = v10;
    }
  }

}

@end
