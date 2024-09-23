@implementation MKPlaceDirectionsCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MKPlaceDirectionsCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MKPlaceDirectionsCell"), CFSTR("updateETAFor: button: label:"), "v", "Q", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_MKRouteETA"), CFSTR("travelTime"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_MKQuickRouteManager"), CFSTR("routeETAForTransportType:"), "@", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MKPlaceDirectionsCell"), CFSTR("_quickRouteManager"), "_MKQuickRouteManager");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MKPlaceDirectionsCell"), CFSTR("_directionsButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MKPlaceDirectionsCell"), CFSTR("_walkButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MKPlaceDirectionsCell"), CFSTR("_transitButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MKPlaceDirectionsCell"), CFSTR("_driveButton"), "UIButton");

}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (void)_axUpdateElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[MKPlaceDirectionsCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_directionsButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceDirectionsCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_driveButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceDirectionsCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_walkButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceDirectionsCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_transitButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "axSafelyAddObject:", v3);
  if ((objc_msgSend(v4, "isHidden") & 1) == 0)
    objc_msgSend(v7, "axSafelyAddObject:", v4);
  if ((objc_msgSend(v5, "isHidden") & 1) == 0)
    objc_msgSend(v7, "axSafelyAddObject:", v5);
  if ((objc_msgSend(v6, "isHidden") & 1) == 0)
    objc_msgSend(v7, "axSafelyAddObject:", v6);
  -[MKPlaceDirectionsCellAccessibility setAccessibilityElements:](self, "setAccessibilityElements:", v7);

}

- (id)_axSpokenStringForDuration:(double)a3
{
  id v3;
  void *v4;

  MNGetHoursAndMinutesForTimeInterval();
  v3 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  objc_msgSend(v3, "setHour:", 0);
  objc_msgSend(v3, "setMinute:", 0);
  objc_msgSend(MEMORY[0x24BDD14F8], "localizedStringFromDateComponents:unitsStyle:", v3, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)updateETAFor:(unint64_t)a3 button:(id)a4 label:(id)a5
{
  id v8;
  id v9;
  __CFString *v10;
  __CFString *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  double *v19;
  uint64_t v20;
  uint64_t v21;
  objc_super v22;

  v8 = a4;
  v9 = a5;
  v22.receiver = self;
  v22.super_class = (Class)MKPlaceDirectionsCellAccessibility;
  -[MKPlaceDirectionsCellAccessibility updateETAFor:button:label:](&v22, sel_updateETAFor_button_label_, a3, v8, v9);
  if ((objc_msgSend(v8, "isHidden") & 1) == 0)
  {
    switch(a3)
    {
      case 4uLL:
        v10 = CFSTR("TRANSIT_TIME_FORMAT");
        break;
      case 2uLL:
        v10 = CFSTR("WALKING_TIME_FORMAT");
        break;
      case 1uLL:
        v10 = CFSTR("DRIVING_TIME_FORMAT");
        break;
      default:
        _AXAssert();
        v11 = &stru_2502511F8;
        goto LABEL_10;
    }
    AXMapKitLocString(v10);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_10:
    v18 = 0;
    v19 = (double *)&v18;
    v20 = 0x2020000000;
    v21 = 0;
    v16 = MEMORY[0x24BDAC760];
    v17 = a3;
    AXPerformSafeBlock();
    v12 = v19[3];
    _Block_object_dispose(&v18, 8);
    v13 = (void *)MEMORY[0x24BDD17C8];
    -[MKPlaceDirectionsCellAccessibility _axSpokenStringForDuration:](self, "_axSpokenStringForDuration:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringWithFormat:", v11, v14, v16, 3221225472, __64__MKPlaceDirectionsCellAccessibility_updateETAFor_button_label___block_invoke, &unk_2502508A0, self, &v18, v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setAccessibilityLabel:", v15);
  }
  -[MKPlaceDirectionsCellAccessibility _axUpdateElements](self, "_axUpdateElements");

}

void __64__MKPlaceDirectionsCellAccessibility_updateETAFor_button_label___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_quickRouteManager"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "routeETAForTransportType:", *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeDoubleForKey:", CFSTR("travelTime"));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;

}

@end
