@implementation GuidanceLaneViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("GuidanceLaneView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GuidanceLaneView"), CFSTR("_updateLanePaths"), "v", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("GEOComposedRouteLaneInfo"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("GuidanceLaneView"), CFSTR("_laneInfo"), "GEOComposedRouteLaneInfo");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GEOComposedRouteLaneInfo"), CFSTR("hasDirections"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GEOComposedRouteLaneInfo"), CFSTR("isPreferredLaneForManeuver"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GEOComposedRouteLaneInfo"), CFSTR("directions"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("GEOComposedRouteLaneInfo"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GEOComposedRouteLaneDirectionInfo"), CFSTR("direction"), "i", 0);

}

- (void)_updateLanePaths
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GuidanceLaneViewAccessibility;
  -[GuidanceLaneViewAccessibility _updateLanePaths](&v3, sel__updateLanePaths);
  -[GuidanceLaneViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  id v4;
  void *v5;
  unint64_t i;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GuidanceLaneViewAccessibility;
  -[GuidanceLaneViewAccessibility _accessibilityLoadAccessibilityInformation](&v10, sel__accessibilityLoadAccessibilityInformation);
  -[GuidanceLaneViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_laneInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    if (objc_msgSend(v3, "safeBoolForKey:", CFSTR("hasDirections")))
    {
      objc_msgSend(v3, "safeValueForKey:", CFSTR("directions"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "count"))
      {
        for (i = 0; i < objc_msgSend(v5, "count"); ++i)
        {
          objc_msgSend(v5, "objectAtIndexedSubscript:", i);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v7, "direction");
          if ((int)v8 <= 15)
          {
            v9 = CFSTR("NO_DIRECTIONS_INDICATED");
            switch((int)v8)
            {
              case 0:
                goto LABEL_23;
              case 1:
                v9 = CFSTR("STRAIGHT");
                break;
              case 2:
                v9 = CFSTR("SLIGHT_RIGHT");
                break;
              case 4:
                v9 = CFSTR("RIGHT");
                break;
              case 8:
                v9 = CFSTR("SHARP_RIGHT");
                break;
              default:
                goto LABEL_22;
            }
            goto LABEL_23;
          }
          if ((int)v8 <= 63)
          {
            if ((_DWORD)v8 == 16)
            {
              v9 = CFSTR("U_TURN_LEFT");
              goto LABEL_23;
            }
            if ((_DWORD)v8 == 32)
            {
              v9 = CFSTR("SHARP_LEFT");
              goto LABEL_23;
            }
          }
          else
          {
            switch((_DWORD)v8)
            {
              case 0x40:
                v9 = CFSTR("LEFT");
                goto LABEL_23;
              case 0x80:
                v9 = CFSTR("SLIGHT_LEFT");
                goto LABEL_23;
              case 0x100:
                v9 = CFSTR("U_TURN_RIGHT");
                goto LABEL_23;
            }
          }
LABEL_22:
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
          v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_23:
          objc_msgSend(v4, "appendString:", v9);

          if (objc_msgSend(v3, "safeBoolForKey:", CFSTR("isPreferredLaneForManeuver")) && !i)
            objc_msgSend(v4, "appendString:", CFSTR(", preferred"));
          objc_msgSend(v4, "appendString:", CFSTR("; "));

        }
      }

    }
    -[GuidanceLaneViewAccessibility setAccessibilityLabel:](self, "setAccessibilityLabel:", v4);

  }
}

@end
