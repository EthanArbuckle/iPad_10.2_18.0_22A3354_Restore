@implementation FUPlaneTrackerAnnotationViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("FUPlaneTrackerAnnotationView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FUPlaneTrackerAnnotationView"), CFSTR("currentProgress"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FUPlaneTrackerAnnotationView"), CFSTR("currentLocation"), "{CLLocationCoordinate2D=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("FUPlaneTrackerAnnotationView"), CFSTR("_showsPlane"), "B");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("FUPlaneTrackerAnnotationView"), CFSTR("MKAnnotationView"));
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("FUPlaneTrackerAnnotationView"), CFSTR("MKAnnotation"));

}

- (id)_accessibilityNearbyLocationDescription
{
  JUMPOUT(0x23490EDC8);
}

- (void)_accessibilitySetNearbyLocationDescription:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("flight.location"));
}

- (BOOL)isAccessibilityElement
{
  return -[FUPlaneTrackerAnnotationViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_showsPlane"));
}

- (id)accessibilityHint
{
  return 0;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FUPlaneTrackerAnnotationViewAccessibility;
  return *MEMORY[0x24BDF7430] | -[FUPlaneTrackerAnnotationViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FUPlaneTrackerAnnotationViewAccessibility;
  -[FUPlaneTrackerAnnotationViewAccessibility setCoordinate:](&v4, sel_setCoordinate_, a3.latitude, a3.longitude);
  -[FUPlaneTrackerAnnotationViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (id)_accessibilityGetGeocodingGroup
{
  JUMPOUT(0x23490EDC8);
}

- (void)_accessibilitySetGeocodingGroup:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (id)_accessibilityGeocodingGroup
{
  void *v3;
  dispatch_group_t v4;

  -[FUPlaneTrackerAnnotationViewAccessibility _accessibilityGetGeocodingGroup](self, "_accessibilityGetGeocodingGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = dispatch_group_create();
    -[FUPlaneTrackerAnnotationViewAccessibility _accessibilitySetGeocodingGroup:](self, "_accessibilitySetGeocodingGroup:", v4);

  }
  return -[FUPlaneTrackerAnnotationViewAccessibility _accessibilityGetGeocodingGroup](self, "_accessibilityGetGeocodingGroup");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v3;
  NSObject *v4;
  _QWORD block[13];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;
  _QWORD v10[6];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)FUPlaneTrackerAnnotationViewAccessibility;
  -[FUPlaneTrackerAnnotationViewAccessibility _accessibilityLoadAccessibilityInformation](&v11, sel__accessibilityLoadAccessibilityInformation);
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3010000000;
  v10[4] = 0;
  v10[5] = 0;
  v10[3] = &unk_23261AC43;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v3 = MEMORY[0x24BDAC760];
  block[6] = MEMORY[0x24BDAC760];
  block[7] = 3221225472;
  block[8] = __87__FUPlaneTrackerAnnotationViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  block[9] = &unk_25020F258;
  block[10] = self;
  block[11] = v10;
  block[12] = &v6;
  AXPerformSafeBlock();
  if (*((_BYTE *)v7 + 24))
  {
    -[FUPlaneTrackerAnnotationViewAccessibility _accessibilityGeocodingGroup](self, "_accessibilityGeocodingGroup");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = v3;
    block[1] = 3221225472;
    block[2] = __87__FUPlaneTrackerAnnotationViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
    block[3] = &unk_25020F2A8;
    block[4] = self;
    block[5] = v10;
    dispatch_group_notify(v4, MEMORY[0x24BDAC9B8], block);

  }
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(v10, 8);
}

void __87__FUPlaneTrackerAnnotationViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  __UIAccessibilityCastAsProtocol();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "coordinate");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_QWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 40) = v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
}

void __87__FUPlaneTrackerAnnotationViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  _QWORD v5[5];

  objc_msgSend(*(id *)(a1 + 32), "_accessibilityGeocodingGroup");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v2);

  v3 = objc_alloc_init(MEMORY[0x24BDBFA68]);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBFA80]), "initWithLatitude:longitude:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __87__FUPlaneTrackerAnnotationViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v5[3] = &unk_25020F280;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "reverseGeocodeLocation:completionHandler:", v4, v5);

}

void __87__FUPlaneTrackerAnnotationViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  const __CFString *v19;
  uint64_t v20;
  NSObject *v21;

  if (!a3)
  {
    objc_msgSend(a2, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locality");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "administrativeArea");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "country");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "inlandWater");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ocean");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v5 && v6 && v7)
    {
      v11 = (void *)MEMORY[0x24BDD17C8];
      accessibilityLocalizedString(CFSTR("flight.location.city.state.country"));
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", v12, v5, v6, v7);
    }
    else
    {
      if (!v5 || !v7)
      {
        v15 = v7;
        if (!v7)
        {
          v15 = v8;
          if (!v8)
          {
            v15 = (void *)v9;
            if (!v9)
            {
              v14 = 0;
              goto LABEL_16;
            }
          }
        }
        v12 = v15;
        v16 = (void *)MEMORY[0x24BDD17C8];
        accessibilityLocalizedString(CFSTR("flight.location.other"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithFormat:", v17, v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_15:
LABEL_16:
        objc_msgSend(*(id *)(a1 + 32), "_accessibilitySetNearbyLocationDescription:", v14);

        goto LABEL_17;
      }
      v13 = (void *)MEMORY[0x24BDD17C8];
      accessibilityLocalizedString(CFSTR("flight.location.city.country"));
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", v12, v5, v7, v20);
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  v19 = CFSTR("could not reverse-geocode flight location: %@");
  v20 = a3;
  LOBYTE(v18) = 1;
  _AXLogWithFacility();
LABEL_17:
  objc_msgSend(*(id *)(a1 + 32), "_accessibilityGeocodingGroup", v18, v19, v20);
  v21 = objc_claimAutoreleasedReturnValue();
  dispatch_group_leave(v21);

}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[FUPlaneTrackerAnnotationViewAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("currentProgress"));
  -[FUPlaneTrackerAnnotationViewAccessibility _accessibilityNearbyLocationDescription](self, "_accessibilityNearbyLocationDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("flight.percent.complete"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  AXFormatFloatWithPercentage();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
