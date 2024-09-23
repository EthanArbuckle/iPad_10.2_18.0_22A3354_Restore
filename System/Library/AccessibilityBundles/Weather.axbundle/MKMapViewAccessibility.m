@implementation MKMapViewAccessibility

Class __68__MKMapViewAccessibility__Weather__MapKit_accessibilityCustomRotors__block_invoke()
{
  Class result;

  result = NSClassFromString(CFSTR("WeatherMaps.WeatherMapAnnotationView"));
  accessibilityCustomRotors__WeatherMapAnnotationView = (uint64_t)result;
  return result;
}

id __68__MKMapViewAccessibility__Weather__MapKit_accessibilityCustomRotors__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v5 = (void *)objc_opt_new();
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("_annotationContainer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessibilityElements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __68__MKMapViewAccessibility__Weather__MapKit_accessibilityCustomRotors__block_invoke_3;
  v11[3] = &unk_2503E5CC0;
  v12 = v5;
  v8 = v5;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);

  objc_msgSend(WeakRetained, "_accessibilityCustomRotorResultHelper:array:", v3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __68__MKMapViewAccessibility__Weather__MapKit_accessibilityCustomRotors__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v3, "safeBoolForKey:", CFSTR("hidden")) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __88__MKMapViewAccessibility__Weather__MapKit__axApplyModelToVKFeatureAccessibilityElement___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_axUpdateLocation:withModel:", v6, v5);

  objc_msgSend(WeakRetained, "_axSetRequestIsInFlight:forLocation:", 0, v6);
}

Class __80__MKMapViewAccessibility__Weather__MapKit__axVKFeatureAccessibilityElementClass__block_invoke()
{
  Class result;

  result = NSClassFromString(CFSTR("VKFeatureAccessibilityElement"));
  _axVKFeatureAccessibilityElementClass__VKFeatureAccessibilityElementClass = (uint64_t)result;
  return result;
}

Class __69__MKMapViewAccessibility__Weather__MapKit__axMKAttributionLabelClass__block_invoke()
{
  Class result;

  result = NSClassFromString(CFSTR("MKAttributionLabel"));
  _axMKAttributionLabelClass__MKAttributionLabelClass = (uint64_t)result;
  return result;
}

@end
