@implementation PUTiltWheelControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUTiltWheelControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUTiltWheelControl"), CFSTR("tiltAngle"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUTiltWheelControl"), CFSTR("maxTiltAngle"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUTiltWheelControl"), CFSTR("minTiltAngle"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUTiltWheelControl"), CFSTR("_setTiltAngleFromUserInteraction:"), "v", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUTiltWheelControl"), CFSTR("_transformForTiltAngle:"), "{CGAffineTransform=dddddd}", "d", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73A0];
}

- (id)accessibilityLabel
{
  return accessibilityPhotosEditUILocalizedString(CFSTR("tilt.wheel.control"));
}

- (id)accessibilityValue
{
  void *v3;
  float v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[PUTiltWheelControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("tiltAngle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  -[PUTiltWheelControlAccessibility _axRadiansToDegrees:](self, "_axRadiansToDegrees:", v4);

  v5 = (void *)MEMORY[0x24BDD17C8];
  accessibilityPhotosEditUILocalizedString(CFSTR("tilt.degrees"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  AXFormatFloat();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)accessibilityIncrement
{
  void *v3;
  void *v4;

  -[PUTiltWheelControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("tiltAngle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");

  -[PUTiltWheelControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("maxTiltAngle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");

  AXPerformSafeBlock();
}

uint64_t __57__PUTiltWheelControlAccessibility_accessibilityIncrement__block_invoke(uint64_t result)
{
  double v1;

  v1 = *(double *)(result + 40);
  if (v1 < *(double *)(result + 48))
    return objc_msgSend(*(id *)(result + 32), "_setTiltAngleFromUserInteraction:", v1 + 0.0174532925);
  return result;
}

- (void)accessibilityDecrement
{
  void *v3;
  void *v4;

  -[PUTiltWheelControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("tiltAngle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");

  -[PUTiltWheelControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("minTiltAngle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");

  AXPerformSafeBlock();
}

uint64_t __57__PUTiltWheelControlAccessibility_accessibilityDecrement__block_invoke(uint64_t result)
{
  double v1;

  v1 = *(double *)(result + 40);
  if (v1 > *(double *)(result + 48))
    return objc_msgSend(*(id *)(result + 32), "_setTiltAngleFromUserInteraction:", v1 + -0.0174532925);
  return result;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  void *v4;
  float v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  float v10;
  double v11;
  uint64_t v12;
  void *v14;
  float v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  float v20;
  double v21;
  uint64_t v22;
  objc_super v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  PUTiltWheelControlAccessibility *v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t);
  void *v35;
  PUTiltWheelControlAccessibility *v36;
  uint64_t v37;
  uint64_t v38;
  double v39;

  if ((unint64_t)(a3 - 3) > 1)
  {
    v23.receiver = self;
    v23.super_class = (Class)PUTiltWheelControlAccessibility;
    return -[PUTiltWheelControlAccessibility accessibilityScroll:](&v23, sel_accessibilityScroll_);
  }
  if (a3 == 3)
  {
    -[PUTiltWheelControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("tiltAngle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "floatValue");
    v16 = v15;

    -[PUTiltWheelControlAccessibility _axRadiansToDegrees:](self, "_axRadiansToDegrees:", v16);
    v18 = v17;
    -[PUTiltWheelControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("minTiltAngle"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "floatValue");
    v21 = v20;

    -[PUTiltWheelControlAccessibility _axRadiansToDegrees:](self, "_axRadiansToDegrees:", v21);
    v24 = MEMORY[0x24BDAC760];
    v25 = 3221225472;
    v26 = __55__PUTiltWheelControlAccessibility_accessibilityScroll___block_invoke_2;
    v27 = &unk_24FF04318;
    v29 = v18;
    v30 = v22;
    v31 = v16;
    v28 = self;
    goto LABEL_7;
  }
  if (a3 == 4)
  {
    -[PUTiltWheelControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("tiltAngle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "floatValue");
    v6 = v5;

    -[PUTiltWheelControlAccessibility _axRadiansToDegrees:](self, "_axRadiansToDegrees:", v6);
    v8 = v7;
    -[PUTiltWheelControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("maxTiltAngle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "floatValue");
    v11 = v10;

    -[PUTiltWheelControlAccessibility _axRadiansToDegrees:](self, "_axRadiansToDegrees:", v11);
    v32 = MEMORY[0x24BDAC760];
    v33 = 3221225472;
    v34 = __55__PUTiltWheelControlAccessibility_accessibilityScroll___block_invoke;
    v35 = &unk_24FF04318;
    v37 = v8;
    v38 = v12;
    v39 = v6;
    v36 = self;
LABEL_7:
    AXPerformSafeBlock();
  }
  return 1;
}

void __55__PUTiltWheelControlAccessibility_accessibilityScroll___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  id argument;

  if ((int)*(double *)(a1 + 40) < (int)*(double *)(a1 + 48))
  {
    v2 = *(double *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "_axDegreesToRadians:", 5.0);
    v4 = v2 + v3;
    objc_msgSend(*(id *)(a1 + 32), "_axRadiansToDegrees:", *(double *)(a1 + 56));
    v6 = v5 + 5.0;
    objc_msgSend(*(id *)(a1 + 32), "_setTiltAngleFromUserInteraction:", v4);
    if ((int)v6 <= (int)*(double *)(a1 + 48))
    {
      v7 = (void *)MEMORY[0x24BDD17C8];
      accessibilityPhotosEditUILocalizedString(CFSTR("tilt.degrees"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      AXFormatFloat();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", v8, v9);
      argument = (id)objc_claimAutoreleasedReturnValue();

      UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], argument);
    }
  }
}

void __55__PUTiltWheelControlAccessibility_accessibilityScroll___block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  id argument;

  if ((int)*(double *)(a1 + 40) > (int)*(double *)(a1 + 48))
  {
    v2 = *(double *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "_axDegreesToRadians:", 5.0);
    v4 = v2 - v3;
    objc_msgSend(*(id *)(a1 + 32), "_axRadiansToDegrees:", *(double *)(a1 + 56));
    v6 = v5 + -5.0;
    objc_msgSend(*(id *)(a1 + 32), "_setTiltAngleFromUserInteraction:", v4);
    if ((int)v6 >= (int)*(double *)(a1 + 48))
    {
      v7 = (void *)MEMORY[0x24BDD17C8];
      accessibilityPhotosEditUILocalizedString(CFSTR("tilt.degrees"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      AXFormatFloat();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", v8, v9);
      argument = (id)objc_claimAutoreleasedReturnValue();

      UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], argument);
    }
  }
}

- (CGAffineTransform)_transformForTiltAngle:(SEL)a3
{
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  CGAffineTransform *result;
  objc_super v15;

  -[PUTiltWheelControlAccessibility _axRadiansToDegrees:](self, "_axRadiansToDegrees:");
  v7 = v6;
  v8 = (void *)MEMORY[0x24BDD17C8];
  accessibilityPhotosEditUILocalizedString(CFSTR("tilt.degrees"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  AXFormatFloat();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAttribute:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDFEC18]);
  v13 = v12;
  if ((-286331153 * (int)v7 + 143165576) <= 0x11111110)
  {
    if (CFAbsoluteTimeGetCurrent() - *(double *)&_transformForTiltAngle__LastSend > 0.5)
      UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v13);
    _transformForTiltAngle__LastSend = CFAbsoluteTimeGetCurrent();
  }
  v15.receiver = self;
  v15.super_class = (Class)PUTiltWheelControlAccessibility;
  -[CGAffineTransform _transformForTiltAngle:](&v15, sel__transformForTiltAngle_, a4);

  return result;
}

- (double)_axRadiansToDegrees:(double)a3
{
  return a3 * 180.0 / 3.14159265;
}

- (double)_axDegreesToRadians:(double)a3
{
  return a3 * 3.14159265 / 180.0;
}

@end
