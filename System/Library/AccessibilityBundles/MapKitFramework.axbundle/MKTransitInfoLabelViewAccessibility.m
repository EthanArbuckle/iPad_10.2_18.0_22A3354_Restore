@implementation MKTransitInfoLabelViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MKTransitInfoLabelView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("GEOPDTransitLabel"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GEOPDTransitLabel"), CFSTR("hasLabelArtwork"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GEOPDTransitLabel"), CFSTR("labelArtwork"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GEOPBTransitArtwork"), CFSTR("hasAccessibilityString"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GEOPBTransitArtwork"), CFSTR("accessibilityString"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)_axLabelFromLabelItems:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v19;
    while (1)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = v9;
          if (objc_msgSend(v10, "dataType") == 1)
          {
            switch(objc_msgSend(v10, "dataValue"))
            {
              case 0u:
                v11 = CFSTR("ACCESS_TYPE_DOOR");
                goto LABEL_25;
              case 1u:
                v11 = CFSTR("ACCESS_TYPE_EASEMENT");
                goto LABEL_25;
              case 2u:
                v11 = CFSTR("ACCESS_TYPE_ELEVATOR");
                goto LABEL_25;
              case 3u:
                v11 = CFSTR("ACCESS_TYPE_ESCALATOR");
                goto LABEL_25;
              case 4u:
                v11 = CFSTR("ACCESS_TYPE_UP_ESCALATOR");
                goto LABEL_25;
              case 5u:
                v11 = CFSTR("ACCESS_TYPE_DOWN_ESCALATOR");
                goto LABEL_25;
              case 6u:
                v11 = CFSTR("ACCESS_TYPE_RAMP");
                goto LABEL_25;
              case 7u:
                v11 = CFSTR("ACCESS_TYPE_STAIR");
LABEL_25:
                AXMapKitLocString(v11);
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                break;
              default:
                _AXAssert();
                v14 = 0;
                break;
            }
            __AXStringForVariables();
            v15 = objc_claimAutoreleasedReturnValue();

            v6 = (void *)v15;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            __AXStringForVariables();
            v12 = objc_claimAutoreleasedReturnValue();

            v6 = (void *)v12;
            continue;
          }
          NSClassFromString(CFSTR("GEOPDTransitLabel"));
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            _AXLogWithFacility();
            continue;
          }
          if (!objc_msgSend(v9, "safeBoolForKey:", CFSTR("hasLabelArtwork")))
            continue;
          objc_msgSend(v9, "safeValueForKey:", CFSTR("labelArtwork"));
          v10 = (id)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "safeBoolForKey:", CFSTR("hasAccessibilityString")))
          {
            objc_msgSend(v10, "safeValueForKey:", CFSTR("accessibilityString"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            __AXStringForVariables();
            v13 = objc_claimAutoreleasedReturnValue();

            v6 = (void *)v13;
          }
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (!v5)
        goto LABEL_32;
    }
  }
  v6 = 0;
LABEL_32:

  return v6;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;

  -[MKTransitInfoLabelViewAccessibility labelItems](self, "labelItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[MKTransitInfoLabelViewAccessibility _axLabelFromLabelItems:](self, "_axLabelFromLabelItems:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _AXAssert();
    v4 = 0;
  }

  return v4;
}

@end
