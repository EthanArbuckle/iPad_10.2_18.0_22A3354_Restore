id AXVectorKitLocString(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  if (AXVectorKitLocString_onceToken != -1)
    dispatch_once(&AXVectorKitLocString_onceToken, &__block_literal_global);
  if (AXVectorKitLocString_bundle)
  {
    objc_msgSend((id)AXVectorKitLocString_bundle, "localizedStringForKey:value:table:", v1, &stru_2503C5610, CFSTR("Accessibility"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

id AXMapKitLocString(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  if (AXMapKitLocString_onceToken != -1)
    dispatch_once(&AXMapKitLocString_onceToken, &__block_literal_global_182);
  if (AXMapKitLocString_bundle)
  {
    objc_msgSend((id)AXMapKitLocString_bundle, "localizedStringForKey:value:table:", v1, &stru_2503C5610, CFSTR("Accessibility"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

id AXMapsLocString(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  if (AXMapsLocString_onceToken != -1)
    dispatch_once(&AXMapsLocString_onceToken, &__block_literal_global_185);
  if (AXMapsLocString_bundle)
  {
    objc_msgSend((id)AXMapsLocString_bundle, "localizedStringForKey:value:table:", v1, &stru_2503C5610, CFSTR("Accessibility-Maps"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

id AXStringByReplacingMiddleDots(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v1 = AXStringByReplacingMiddleDots_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&AXStringByReplacingMiddleDots_onceToken, &__block_literal_global_190);
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByTrimmingCharactersInSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", AXStringByReplacingMiddleDots_MiddleDotCharacterSet);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "componentsSeparatedByCharactersInSet:", AXStringByReplacingMiddleDots_MiddleDotCharacterSet);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ax_flatMappedArrayUsingBlock:", &__block_literal_global_195);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id AXShortAddressDescriptionForPlacemark(void *a1, int a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  _BOOL4 v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  void *v22;

  v3 = a1;
  v4 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend(v3, "subThoroughfare");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");
  v7 = v6 != 0;
  if (!v6)
    goto LABEL_4;
  if (objc_msgSend(v5, "rangeOfString:", CFSTR("-")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v4, "appendString:", v5);
LABEL_4:
    v8 = 0;
    goto LABEL_6;
  }
  v9 = (void *)MEMORY[0x24BDD17C8];
  AXVectorKitLocString(CFSTR("BETWEEN_ADDRESS_RANGE"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringWithFormat:", v10, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v11);

  v8 = 1;
LABEL_6:
  objc_msgSend(v3, "thoroughfare");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "length"))
  {
    if (v6)
      objc_msgSend(v4, "appendString:", CFSTR(" "));
    if (v8)
    {
      v13 = (void *)MEMORY[0x24BDD17C8];
      AXVectorKitLocString(CFSTR("ON_ROAD"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringWithFormat:", v14, v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendString:", v15);

    }
    else
    {
      objc_msgSend(v4, "appendString:", v12);
    }
    v7 = 1;
  }
  if (!v7 || a2)
  {
    objc_msgSend(v3, "subLocality");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v16, "length"))
    {
      if (v7)
        objc_msgSend(v4, "appendString:", CFSTR(", "));
      objc_msgSend(v4, "appendString:", v16);
      v7 = 1;
    }
    objc_msgSend(v3, "locality");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v17, "length"))
    {
      if (v7)
        objc_msgSend(v4, "appendString:", CFSTR(", "));
      objc_msgSend(v4, "appendString:", v17);
      v7 = 1;
    }
    objc_msgSend(v3, "subAdministrativeArea");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v18, "length"))
    {
      objc_msgSend(v3, "locality");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "isEqualToString:", v19);

      if ((v20 & 1) == 0)
      {
        if (v7)
          objc_msgSend(v4, "appendString:", CFSTR(", "));
        objc_msgSend(v4, "appendString:", v18);
        v7 = 1;
      }
    }
    objc_msgSend(v3, "administrativeArea");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "length"))
    {
      if (v7)
        objc_msgSend(v4, "appendString:", CFSTR(", "));
      objc_msgSend(v4, "appendString:", v12);
    }
  }
  if (objc_msgSend(v4, "length"))
  {
    v21 = v4;
  }
  else
  {
    objc_msgSend(v3, "formattedAddressLines");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
    v21 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v21;
}

BOOL AXRequiresMapAccessibilityForAccessibilityTechnology()
{
  return UIAccessibilityIsVoiceOverRunning()
      || UIAccessibilityIsSwitchControlRunning()
      || _AXSCommandAndControlEnabled()
      || _AXSFullKeyboardAccessEnabled() != 0;
}

id AXNotificationsForMapAccessibilityClients()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD v3[5];

  v3[4] = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BED26F8];
  v3[0] = *MEMORY[0x24BED2970];
  v3[1] = v0;
  v1 = *MEMORY[0x24BED2770];
  v3[2] = *MEMORY[0x24BED2730];
  v3[3] = v1;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t AXRequiresMapAccessibility()
{
  return 1;
}

uint64_t AXRequiresMapAccessibilityPurelyForAutomation()
{
  uint64_t result;

  result = _AXSAutomationEnabled();
  if ((_DWORD)result)
    return !AXRequiresMapAccessibilityForAccessibilityTechnology();
  return result;
}

BOOL AXRequiresLongerTimeouts()
{
  return UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsSwitchControlRunning();
}

uint64_t AXPublisherDescriptionForAttribution(void *a1, const char *a2)
{
  return objc_msgSend(a1, "safeStringForKey:", CFSTR("displayName"));
}

id AXPublisherDescriptionForCollection(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "safeValueForKey:", CFSTR("publisherAttribution"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "safeStringForKey:", CFSTR("displayName"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void sub_232B375FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20)
{
  id *v20;
  uint64_t v21;

  objc_destroyWeak(v20);
  _Block_object_dispose(&a16, 8);
  _Block_object_dispose(&a20, 8);
  objc_destroyWeak((id *)(v21 - 40));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_232B3830C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

id AXVKAccessibilityPaths(void *a1, uint64_t a2, uint64_t a3)
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  const CGPath *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
        if ((objc_opt_isKindOfClass() & 1) != 0 && (!a3 || objc_msgSend(v10, "mapFeatureType", (_QWORD)v14) == a3))
        {
          objc_msgSend(v10, "accessibilityPath", (_QWORD)v14);
          v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v12 = (const CGPath *)objc_msgSend(v11, "CGPath");

          if (!CGPathIsEmpty(v12))
            objc_msgSend(v5, "addObject:", v12);
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v5;
}

void sub_232B38F70(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id AXVKAccessibilityPoints(void *a1, uint64_t a2, uint64_t a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v22;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(obj);
        v9 = *(id **)(*((_QWORD *)&v21 + 1) + 8 * v8);
        if ((objc_opt_isKindOfClass() & 1) != 0 && (!a3 || objc_msgSend(v9, "mapFeatureType") == a3))
        {
          v10 = v9[19];
          v17 = 0u;
          v18 = 0u;
          v19 = 0u;
          v20 = 0u;
          v11 = v10;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          if (v12)
          {
            v13 = *(_QWORD *)v18;
            do
            {
              v14 = 0;
              do
              {
                if (*(_QWORD *)v18 != v13)
                  objc_enumerationMutation(v11);
                objc_msgSend(v5, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14++));
              }
              while (v12 != v14);
              v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
            }
            while (v12);
          }

        }
        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v6);
  }

  return v5;
}

void sub_232B391A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

BOOL AXVKBuildingShouldBeVisible(void *a1, void *a2)
{
  id v3;
  id v4;
  float v5;
  float v6;
  _BOOL4 v7;
  _BOOL8 v8;

  v3 = a1;
  v4 = a2;
  objc_msgSend(v4, "accessibilityZoomLevel");
  v6 = v5;
  v7 = AXVKFeatureMaxVisibleLength(v3, v4) > 30.0;
  v8 = v6 >= 17.0 && v7;

  return v8;
}

void sub_232B39264(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

double AXVKFeatureMaxVisibleLength(void *a1, void *a2)
{
  id v3;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  _BOOL4 v14;
  float v15;
  float v16;
  double v17;
  double v18;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  v3 = a2;
  v20.origin.x = AXVKFeatureScreenBounds(a1, v3);
  x = v20.origin.x;
  y = v20.origin.y;
  width = v20.size.width;
  height = v20.size.height;
  v8 = CGRectGetWidth(v20);
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  v9 = CGRectGetHeight(v21);
  objc_msgSend(v3, "bounds");
  v23.origin.x = v10;
  v23.origin.y = v11;
  v23.size.width = v12;
  v23.size.height = v13;
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  v14 = CGRectIntersectsRect(v22, v23);
  v15 = v8;
  v16 = v9;
  v17 = sqrtf((float)(v15 * v15) + (float)(v16 * v16));
  if (v14)
    v18 = v17;
  else
    v18 = 0.0;

  return v18;
}

void sub_232B3934C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

double AXVKFeatureScreenBounds(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;

  v3 = a1;
  v4 = a2;
  GEOMultiSectionFeatureBounds();
  objc_msgSend(v3, "feature");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containingTile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "geoTileKey");

  VKWorldBoundsFromGEOTileKey();
  VKLocationCoordinate2DForVKPoint();
  v8 = v7;
  v10 = v9;
  VKLocationCoordinate2DForVKPoint();
  v12 = v11;
  v14 = v13;
  objc_msgSend(v4, "accessibilityConvertCoordinateToWindow:", v8, v10);
  v16 = v15;
  objc_msgSend(v4, "accessibilityConvertCoordinateToWindow:", v12, v14);
  if (v16 >= v17)
    v18 = v17;
  else
    v18 = v16;

  return v18;
}

void sub_232B394C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

double AXVKPointForTileGLPoint(double a1, double a2, double a3, double a4, float a5)
{
  return a1 + a5 * (a2 - a1);
}

BOOL AXVKIsInvalidLocationDegrees(double a1)
{
  return a1 == 0.0;
}

BOOL AXVKLabelMarkerIsPointOfInterest(void *a1)
{
  return objc_msgSend(a1, "featureType") == 3;
}

BOOL AXVKLocationDegreesEqualToLocationDegrees(double a1, double a2)
{
  return vabdd_f64(a1, a2) < 1.0;
}

BOOL AXVKFeatureEqualToFeature(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  float v17;
  float v18;
  float v19;
  uint64_t v20;
  int v21;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  v6 = 0;
  if (v3 && v4)
  {
    objc_msgSend(v3, "containingTile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "containingTile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

    if ((v9 & 1) == 0)
      goto LABEL_16;
    v10 = objc_msgSend(v3, "labelOffset");
    if (v10 != objc_msgSend(v5, "labelOffset"))
      goto LABEL_16;
    v11 = objc_msgSend(v3, "labelCount");
    if (v11 != objc_msgSend(v5, "labelCount"))
      goto LABEL_16;
    v12 = objc_msgSend(v3, "shieldOffset");
    if (v12 != objc_msgSend(v5, "shieldOffset"))
      goto LABEL_16;
    v13 = objc_msgSend(v3, "shieldCount");
    if (v13 != objc_msgSend(v5, "shieldCount"))
      goto LABEL_16;
    v14 = objc_msgSend(v3, "styleID");
    if (v14 != objc_msgSend(v5, "styleID"))
      goto LABEL_16;
    v15 = objc_msgSend(v3, "featureID");
    if (v15 != objc_msgSend(v5, "featureID"))
      goto LABEL_16;
    if (objc_msgSend(v3, "hasBusinessID"))
    {
      if (objc_msgSend(v5, "hasBusinessID"))
      {
        v16 = objc_msgSend(v3, "businessID");
        if (v16 != objc_msgSend(v5, "businessID"))
          goto LABEL_16;
      }
    }
    objc_msgSend(v3, "minZoomRank");
    v18 = v17;
    objc_msgSend(v5, "minZoomRank");
    if (v18 == v19 && (v20 = objc_msgSend(v3, "flyoverAnimationID"), v20 == objc_msgSend(v5, "flyoverAnimationID")))
    {
      v21 = objc_msgSend(v3, "type");
      v6 = v21 == objc_msgSend(v5, "type");
    }
    else
    {
LABEL_16:
      v6 = 0;
    }
  }

  return v6;
}

void sub_232B39740(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

unint64_t AXVKFeatureHash(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  float v7;
  float v8;
  uint64_t v9;
  unint64_t v10;

  v1 = a1;
  objc_msgSend(v1, "containingTile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  v4 = AXVKFeatureLabelsAndShieldsHash(v1);
  v5 = objc_msgSend(v1, "styleID");
  v6 = objc_msgSend(v1, "featureID") + 53 * (53 * (v4 + 53 * v3 + 2809) + v5);
  if (objc_msgSend(v1, "hasBusinessID"))
    v6 = objc_msgSend(v1, "businessID") + 53 * v6;
  objc_msgSend(v1, "minZoomRank");
  v8 = v7;
  v9 = objc_msgSend(v1, "flyoverAnimationID");
  v10 = 53 * (v9 + 53 * (unint64_t)(float)(v8 + (float)(unint64_t)(53 * v6)))
      + (int)objc_msgSend(v1, "type");

  return v10;
}

void sub_232B39860(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t AXVKFeatureLabelsAndShieldsHash(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = a1;
  v2 = objc_msgSend(v1, "labelOffset");
  v3 = objc_msgSend(v1, "labelCount");
  v4 = objc_msgSend(v1, "shieldOffset");
  v5 = objc_msgSend(v1, "shieldCount") + 53 * (v4 + 53 * (v3 + 53 * v2 + 2809));

  return v5;
}

void sub_232B398E8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

BOOL AXVKMultiSectionFeatureEqualToMultiSectionFeature(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  int v16;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  v6 = 0;
  if (v3 && v4)
  {
    objc_msgSend(v3, "feature");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "feature");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = AXVKFeatureEqualToFeature(v7, v8);

    if (v9
      && (v10 = objc_msgSend(v3, "sectionOffset"), v10 == objc_msgSend(v5, "sectionOffset"))
      && (v11 = objc_msgSend(v3, "sectionCount"), v11 == objc_msgSend(v5, "sectionCount"))
      && (v12 = objc_msgSend(v3, "roadPointIndex"), v12 == objc_msgSend(v5, "roadPointIndex"))
      && (v13 = objc_msgSend(v3, "roadPointCount"), v13 == objc_msgSend(v5, "roadPointCount"))
      && (v14 = objc_msgSend(v3, "roadClass"), v14 == objc_msgSend(v5, "roadClass"))
      && (v15 = objc_msgSend(v3, "formOfWay"), v15 == objc_msgSend(v5, "formOfWay")))
    {
      v16 = objc_msgSend(v3, "travelDirection");
      v6 = v16 == objc_msgSend(v5, "travelDirection");
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

void sub_232B39A54(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

uint64_t AXVKMultiSectionFeatureHash(void *a1)
{
  id v1;
  void *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t v10;

  v1 = a1;
  objc_msgSend(v1, "feature");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = AXVKFeatureHash(v2);

  v4 = objc_msgSend(v1, "sectionOffset");
  v5 = objc_msgSend(v1, "sectionCount");
  v6 = objc_msgSend(v1, "roadPointIndex");
  v7 = objc_msgSend(v1, "roadPointCount");
  v8 = objc_msgSend(v1, "roadClass");
  v9 = objc_msgSend(v1, "formOfWay");
  v10 = 53 * (53 * (53 * (v7 + 53 * (v6 + 53 * (v5 + 53 * (v4 + 53 * v3 + 2809)))) + v8) + v9)
      + (int)objc_msgSend(v1, "travelDirection");

  return v10;
}

void sub_232B39B5C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id AXVKMapElementComparator()
{
  if (AXVKMapElementComparator::_MapElementComparatorOnceToken != -1)
    dispatch_once(&AXVKMapElementComparator::_MapElementComparatorOnceToken, &__block_literal_global_1);
  return (id)MEMORY[0x234923E94](AXVKMapElementComparator::_MapElementComparator);
}

void sub_232B39C68(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id AXVKTransitRouteElementComparator()
{
  if (AXVKTransitRouteElementComparator::onceToken != -1)
    dispatch_once(&AXVKTransitRouteElementComparator::onceToken, &__block_literal_global_182_0);
  return (id)MEMORY[0x234923E94](AXVKTransitRouteElementComparator::_TransitRouteElementComparator);
}

void sub_232B39D38(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t AXVKRectDescription(double a1, double a2, double a3, double a4)
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", CFSTR("Minimum point: (%f, %f), Maximum point: (%f, %f)"), *(_QWORD *)&a1, *(_QWORD *)&a3, *(_QWORD *)&a2, *(_QWORD *)&a4);
}

BOOL AXVKRectEqualToRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  return vabdd_f64(a1, a5) < 0.000001
      && vabdd_f64(a3, a7) < 0.000001
      && vabdd_f64(a2, a6) < 0.000001
      && vabdd_f64(a4, a8) < 0.000001;
}

uint64_t AXVKRoadShouldBeVisible(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a1;
  v4 = a2;
  objc_msgSend(v3, "feature");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  GEOFeatureGetLocalizedLabel();

  if ((objc_msgSend(v4, "containsObject:", 0) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v3, "feature");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFeatureGetNativeLabel();

    v6 = objc_msgSend(v4, "containsObject:", 0);
  }

  return v6;
}

void sub_232B39EE4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

float AXVKStrokeWidthForRoad(void *a1, void *a2)
{
  id v3;
  id v4;
  float v5;
  float v6;
  float v7;
  unsigned int v8;
  float v9;
  float *v10;

  v3 = a1;
  v4 = a2;
  objc_msgSend(v4, "accessibilityZoomLevel");
  v6 = v5;
  v7 = 1.5;
  if (v5 > 14.0)
  {
    if (objc_msgSend(v3, "travelDirection"))
    {
      v8 = objc_msgSend(v3, "roadClass");
      v9 = 2.0;
      if (v8 < 4)
      {
        v10 = (float *)&unk_232B5BC40;
LABEL_7:
        v9 = v10[v8];
      }
    }
    else
    {
      v8 = objc_msgSend(v3, "roadClass");
      v9 = 2.0;
      if (v8 < 8)
      {
        v10 = (float *)&unk_232B5BC20;
        goto LABEL_7;
      }
    }
    v7 = (float)((float)((float)(v6 + -14.0) / 10.0) + 1.0) * v9;
  }

  return v7;
}

void sub_232B39FE8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_232B3A07C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_232B3A1F0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B3A24C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B3A2D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void AXVKMathGetVectorAndDistanceForPoints(double *a1, long double *a2, CGPoint a3, CGPoint a4)
{
  double y;
  double v5;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  y = a4.y;
  v5 = a3.y;
  v7 = a3.x - a4.x;
  v8 = vabdd_f64(a3.x, a4.x);
  v9 = vabdd_f64(a3.y, a4.y);
  *a2 = hypot(v8, v9);
  if (v7 == 0.0)
    v10 = 90.0;
  else
    v10 = atan(v9 / v8) * 57.2957795;
  v11 = v5 - y;
  if (v7 >= 0.0)
  {
    if (v11 >= 0.0)
      goto LABEL_11;
    v10 = 90.0 - v10;
    v12 = 270.0;
  }
  else if (v11 <= 0.0)
  {
    v12 = 180.0;
  }
  else
  {
    v12 = 90.0;
    v10 = 90.0 - v10;
  }
  v10 = v10 + v12;
LABEL_11:
  v13 = *a1;
  v14 = v10 + floor(*a1 / 360.0) * 360.0;
  *a1 = v14;
  if (v10 <= 270.0)
  {
    if (v10 >= 90.0)
      return;
    if (v13 <= 180.0 || v13 >= 360.0)
    {
      if (v13 > 0.0)
        return;
    }
    else
    {
      v10 = v14 + 360.0;
    }
    goto LABEL_23;
  }
  if (v13 > 0.0 && v13 < 180.0)
  {
    v10 = v10 + -360.0;
LABEL_23:
    *a1 = v10;
    return;
  }
  if (v13 > 360.0 || v13 == 0.0)
    goto LABEL_23;
}

double AXVKMathGetDistanceBetweenPoints(CGPoint a1, CGPoint a2)
{
  return fabs(hypot(a1.x - a2.x, a1.y - a2.y));
}

double AXVKGetWalkingDirectionBetweenVertices(AXVKExplorationVertexElement *a1, AXVKExplorationVertexElement *a2)
{
  AXVKExplorationVertexElement *v3;
  AXVKExplorationVertexElement *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  uint64_t v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  float v41;
  float v42;
  uint64_t v43;
  double v44;
  AXVKExplorationVertexElement *v46;
  id obj;
  uint64_t v48;
  uint64_t v49;
  AXVKExplorationVertexElement *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  long double v59;
  double v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;
  CGPoint v64;
  CGPoint v65;

  v63 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  v46 = v3;
  -[AXVKExplorationVertexElement getScreenPoint](v3, "getScreenPoint");
  v6 = v5;
  v8 = v7;
  -[AXVKExplorationVertexElement getScreenPoint](v4, "getScreenPoint");
  v10 = v9;
  v12 = v11;
  v60 = 0.0;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  -[AXVKExplorationVertexElement roads](v3, "roads");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
  if (v13)
  {
    v48 = *(_QWORD *)v56;
    v50 = v4;
    do
    {
      v49 = v13;
      for (i = 0; i != v49; ++i)
      {
        if (*(_QWORD *)v56 != v48)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        -[AXVKExplorationVertexElement roads](v4, "roads");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "containsObject:", v15);

        if (v17)
        {
          objc_msgSend(v15, "consolidatedAndOrderedFeatures");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = 0u;
          v54 = 0u;
          v51 = 0u;
          v52 = 0u;
          v19 = v18;
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
          if (v20)
          {
            v21 = *(_QWORD *)v52;
            while (2)
            {
              for (j = 0; j != v20; ++j)
              {
                if (*(_QWORD *)v52 != v21)
                  objc_enumerationMutation(v19);
                v23 = 0;
                v24 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * j);
                v25 = 0x7FFFFFFFFFFFFFFFLL;
                v26 = 0x7FFFFFFFFFFFFFFFLL;
                while (v23 < objc_msgSend(v24, "count"))
                {
                  objc_msgSend(v24, "objectAtIndexedSubscript:", v23);
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v27, "pointValue");
                  v29 = v28;
                  v31 = v30;

                  if (vabdd_f64(v29, v6) + vabdd_f64(v31, v8) < 1.0)
                    v26 = v23;
                  if (vabdd_f64(v29, v10) + vabdd_f64(v31, v12) < 1.0)
                    v25 = v23;
                  ++v23;
                }
                if (v26 != 0x7FFFFFFFFFFFFFFFLL && v25 != 0x7FFFFFFFFFFFFFFFLL && v26 != v25)
                {
                  objc_msgSend(v24, "objectAtIndexedSubscript:", v26);
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v32, "pointValue");
                  v6 = v33;
                  v8 = v34;

                  if (v25 < v26)
                    v35 = -1;
                  else
                    v35 = 1;
                  if (v26 + v35 >= 0)
                  {
                    v36 = 0.0;
                    do
                    {
                      if (v35 + v26 >= (unint64_t)objc_msgSend(v24, "count"))
                        break;
                      objc_msgSend(v24, "objectAtIndexedSubscript:");
                      v37 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v37, "pointValue");
                      v10 = v38;
                      v12 = v39;

                      -[AXVKExplorationVertexElement mapView](v50, "mapView");
                      v40 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v40, "accessibilityRealDistanceBetweenPoint:screenPoint2:", v6, v8, v10, v12);
                      v42 = v41;

                      v36 = v36 + v42;
                      if (v36 >= 50.0)
                        break;
                      v43 = 2 * v35 + v26;
                      v26 += v35;
                    }
                    while ((v43 & 0x8000000000000000) == 0);
                  }
                  goto LABEL_33;
                }
              }
              v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
              if (v20)
                continue;
              break;
            }
          }
LABEL_33:

        }
        v4 = v50;
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
    }
    while (v13);
  }

  v64.x = v6;
  v64.y = v8;
  v65.x = v10;
  v65.y = v12;
  AXVKMathGetVectorAndDistanceForPoints(&v60, &v59, v64, v65);
  v44 = v60;

  return v44;
}

void sub_232B3A818(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  void *v11;

  _Unwind_Resume(a1);
}

void sub_232B3A9A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{

  _Unwind_Resume(a1);
}

void sub_232B3AA54(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_232B3AB18(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_232B3ABB4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B3AC24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;

  a9.super_class = (Class)VKWalkAssistStatus;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_232B3AD08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_232B3AF4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

void sub_232B3B0A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B3B144(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_232B3B524(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_232B3B64C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_232B3B954(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B3BA74(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B3BB24(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B3BBAC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_232B3BD94(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_232B3BE20(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B3BE90(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B3C064(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_232B3C100(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B3C298(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B3C48C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_232B3C7C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_232B3C8C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_232B3CA08(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_232B3CA68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)AXVKMultiSectionFeatureWrapper;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_232B3CAFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_232B3CB70(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B3CBF4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B3CCB8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_232B3CDD4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B3CE64(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_232B3CF00(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B3D000(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_232B3D0A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B3D374(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (v5)

  _Unwind_Resume(a1);
}

void sub_232B3D414(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_232B3D4E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_232B3D5A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_232B3D628(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_232B3D774(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_232B3D8E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B3DA7C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_232B3DB44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;

  a9.super_class = (Class)VKFeatureAccessibilityElement;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_232B3DC5C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_232B3DD6C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_232B3DF14(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B3E224(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B3E41C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_232B3E5B4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_232B3E7D0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B3E940(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v2;

  _Unwind_Resume(a1);
}

void sub_232B3EE14(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_232B3F004(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9, ...)
{
  void *v9;
  void *v10;
  va_list va;

  va_start(va, a9);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_232B3F0FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__0(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = a2[3];
  a1[3] = result;
  return result;
}

void sub_232B3F248(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_232B3F780(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id a13)
{

  _Unwind_Resume(a1);
}

uint64_t _areSetsBasicallyDuplicates(NSArray *a1, NSArray *a2)
{
  NSArray *v3;
  NSArray *v4;
  uint64_t v5;
  char v6;
  unint64_t i;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  uint64_t v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  float DistanceBetweenPoints;
  uint64_t v20;
  CGPoint v22;
  CGPoint v23;

  v3 = a1;
  v4 = a2;
  v5 = 0;
  v6 = 0;
  for (i = 1; i < -[NSArray count](v3, "count"); ++i)
  {
    -[NSArray objectAtIndex:](v3, "objectAtIndex:", i);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "CGPointValue");
    v10 = v9;
    v12 = v11;

    v13 = -[NSArray count](v4, "count");
    if (v13 - 1 < 0)
    {
LABEL_8:
      v20 = v5;
      goto LABEL_10;
    }
    while (1)
    {
      -[NSArray objectAtIndex:](v4, "objectAtIndex:", --v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "CGPointValue");
      v16 = v15;
      v18 = v17;

      v22.x = v10;
      v22.y = v12;
      v23.x = v16;
      v23.y = v18;
      DistanceBetweenPoints = AXVKMathGetDistanceBetweenPoints(v22, v23);
      if (DistanceBetweenPoints < 1.0)
        break;
LABEL_7:
      if (v13 <= 0)
        goto LABEL_8;
    }
    v20 = v5 + 1;
    if (v5 <= 1)
    {
      ++v5;
      goto LABEL_7;
    }
    v6 = 1;
LABEL_10:
    v5 = v20;
  }

  return v6 & 1;
}

void sub_232B3F95C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_232B403E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__450(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = a2[3];
  a1[3] = result;
  return result;
}

void sub_232B40B40(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_232B40C08(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B40CC4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B40D60(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_232B40DE4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B40E40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_232B410B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{

  _Unwind_Resume(a1);
}

void sub_232B414A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_232B41714(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B417B8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B4187C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B41988(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_232B41C7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_232B41D60(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B41F5C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B421C0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B422BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_232B42440(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B42650(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_232B429CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  va_list va;

  va_start(va, a9);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_232B42A88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__470(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)(a2 + 48);
  v3 = *(_OWORD *)(a2 + 64);
  *(__n128 *)(a1 + 48) = result;
  *(_OWORD *)(a1 + 64) = v3;
  return result;
}

void sub_232B42D30(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B42F14(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_232B43098(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_232B431AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_232B432E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B43498(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_232B43604(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B43758(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  v11 = v10;

  _Unwind_Resume(a1);
}

void sub_232B438B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_232B439EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_232B43D28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{

  _Unwind_Resume(a1);
}

void sub_232B43F48(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_232B44070(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_232B4414C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_232B44D90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_232B44E44(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B44EA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_232B45024(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B450B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_232B4511C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_232B45190(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_232B4528C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B452EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_232B45480(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_232B45524(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;

  a9.super_class = (Class)VKMapDebugView;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_232B456C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_232B46294(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t geo::_retain_ptr<VKCamera * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::~_retain_ptr(uint64_t a1)
{
  *(_QWORD *)a1 = &unk_2503C4AF8;

  return a1;
}

void sub_232B46CE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id a16)
{

  _Unwind_Resume(a1);
}

void sub_232B46D7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_232B471E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_232B47380(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B474DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B475E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_232B476EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_232B47BCC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_232B47C60()
{
  void *v0;

  JUMPOUT(0x232B47C58);
}

void sub_232B47CEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_232B48028(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{

  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__1(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = a2[3];
  a1[3] = result;
  return result;
}

void sub_232B4812C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_232B4818C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_232B481D8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B48220(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B4826C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B482B8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B48300(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B48348(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B4838C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_232B48874(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  _Unwind_Resume(a1);
}

void sub_232B48ADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_232B490A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_232B49280(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_232B4940C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B49490(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B49624(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_232B496B0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B49768(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_232B49868(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B498AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B49960(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B49D14(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_232B49E04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_232B49E8C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B49ED8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B49F8C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B4A0EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  void *v26;
  void *v27;

  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__468(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__469(uint64_t a1)
{

}

void sub_232B4A29C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_232B4A55C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 176), 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__476(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)(a2 + 48);
  v3 = *(_OWORD *)(a2 + 64);
  *(__n128 *)(a1 + 48) = result;
  *(_OWORD *)(a1 + 64) = v3;
  return result;
}

__n128 __Block_byref_object_copy__479(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = a2[3];
  a1[3] = result;
  return result;
}

void sub_232B4A734(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__484(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = a2[3];
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a1[3] = result;
  return result;
}

void sub_232B4A7F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_232B4A8B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_232B4A99C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_232B4AA48(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B4AC04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  void *v10;
  void *v11;
  va_list va;

  va_start(va, a10);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__499(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = a2[3];
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a1[3] = result;
  return result;
}

void sub_232B4B194(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  _Unwind_Resume(a1);
}

void sub_232B4B3A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  void *v14;
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_232B4B3F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_232B4B4EC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B4B5C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_232B4B670(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_232B4B7A8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_232B4B880(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B4B934(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B4B9D8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B4BA58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_232B4BAD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_232B4BC10(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B4BC94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_232B4BD70(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_232B4BE34(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B4BEDC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B4BF48(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B4BFE4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B4C04C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B4C0C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_232B4C1C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_232B4C2EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_232B4C3DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_232B4C450(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B4C558(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_232B4C6F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  void *v14;
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_232B4C74C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_232B4C844(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void geo::_retain_ptr<VKCamera * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::~_retain_ptr(uint64_t a1)
{
  *(_QWORD *)a1 = &unk_2503C4AF8;

  JUMPOUT(0x234923BD0);
}

void sub_232B4C8FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;

  a9.super_class = (Class)VKMapViewOutputManager;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_232B4C9F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_232B4CAE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_232B4CB40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_232B4CB88(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B4CC28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_232B4CD14(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B4CE00(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_232B4D084(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_232B4D254(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id a32)
{
  void *v32;
  uint64_t v33;

  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);

  _Block_object_dispose((const void *)(v33 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_232B4D428(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_232B4D57C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  void *v24;
  void *v25;

  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

void sub_232B4D65C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_232B4D714(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_232B4D8E4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B4DABC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_232B4E120(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,void *a23,void *a24,void *a25)
{
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  _Unwind_Resume(a1);
}

void sub_232B4E300(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_232B4E3C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_232B4E46C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_232B4E51C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_232B4E5AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_232B4E640(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_232B4E6C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_232B4E79C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_232B4E80C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)VKMapViewTourGuideManager;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_232B4E914(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_232B4EA1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  v12 = v11;

  _Unwind_Resume(a1);
}

void sub_232B4ED6C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_232B4EF4C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_232B4F0F4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B4F28C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_232B4F3F4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B4F548(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_232B4F604(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_232B4F6E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_232B4F75C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_232B4FF1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_232B502D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_232B50BC8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B50C10(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B50D48(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B50D90(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B50E20(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B50F50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  void *v20;

  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void sub_232B512BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

void sub_232B5155C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_232B51848(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_232B51D14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *a32,void *a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,void *a51,uint64_t a52,void *a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,char a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  id a65;
  void *v65;

  _Block_object_dispose(&a60, 8);
  _Unwind_Resume(a1);
}

void sub_232B52A4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, uint64_t a17, void *a18)
{
  void *v18;
  void *v19;
  void *v20;

  _Unwind_Resume(a1);
}

void sub_232B52EF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_232B52FD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_232B53118(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_232B53234(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_232B53308(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_232B53740(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

uint64_t _maximumVisiblePOIs(float a1)
{
  void *v1;
  uint64_t v2;

  if (a1 >= 16.0)
    return -1;
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "userInterfaceIdiom");

  if (v2 == 1)
    return 56;
  else
    return 42;
}

void sub_232B53898(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B539C8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t _maximumVisibleRoads(float a1)
{
  void *v1;
  uint64_t v2;

  if (a1 >= 16.0)
    return -1;
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "userInterfaceIdiom");

  if (v2 == 1)
    return 28;
  else
    return 21;
}

void sub_232B53A40(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B53B70(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B53D58(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_232B53E74(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_232B53F70(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B5402C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B540E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_232B54564(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{

  _Unwind_Resume(a1);
}

void sub_232B54948(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_232B54C18(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_232B54D60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_232B54E78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  v12 = v10;

  _Unwind_Resume(a1);
}

void sub_232B54F68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_232B55100(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_232B551E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_232B556D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{

  _Unwind_Resume(a1);
}

void sub_232B55908(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_232B55974(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_232B55B9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

void sub_232B55D34(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_232B56174(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_232B56464(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v3;

  _Unwind_Resume(a1);
}

void sub_232B56674(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_232B56828(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_232B56D28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24)
{

  _Unwind_Resume(a1);
}

void sub_232B570A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  _Unwind_Resume(a1);
}

void sub_232B57248(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B57464(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_232B57598(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_232B576B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__305(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)(a2 + 48);
  v3 = *(_OWORD *)(a2 + 64);
  *(__n128 *)(a1 + 48) = result;
  *(_OWORD *)(a1 + 64) = v3;
  return result;
}

__n128 __Block_byref_object_copy__308(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = a2[3];
  a1[3] = result;
  return result;
}

void sub_232B57B58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  void *v17;

  _Unwind_Resume(a1);
}

void sub_232B57F98(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  _Block_object_dispose((const void *)(v5 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_232B58184(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_232B58B48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

uint64_t AXAccessibilityBundlesDirectory()
{
  return MEMORY[0x24BDFFC50]();
}

uint64_t AXCArrayCreate()
{
  return MEMORY[0x24BDFFE98]();
}

uint64_t AXCArrayGetCount()
{
  return MEMORY[0x24BDFFEA0]();
}

uint64_t AXCFormattedString()
{
  return MEMORY[0x24BDFFEA8]();
}

uint64_t AXColorizeFormatLog()
{
  return MEMORY[0x24BDFFED0]();
}

uint64_t AXDescriptionForHeadingInDegrees()
{
  return MEMORY[0x24BDFFF10]();
}

uint64_t AXDeviceIsPad()
{
  return MEMORY[0x24BDFFF90]();
}

uint64_t AXDoesRequestingClientDeserveAutomation()
{
  return MEMORY[0x24BDFE8E8]();
}

uint64_t AXFormatAndListWithElements()
{
  return MEMORY[0x24BE000B8]();
}

uint64_t AXFormatInteger()
{
  return MEMORY[0x24BE000D8]();
}

uint64_t AXLabelForElements()
{
  return MEMORY[0x24BDFE8F8]();
}

uint64_t AXLogCommon()
{
  return MEMORY[0x24BE00200]();
}

uint64_t AXLogTemp()
{
  return MEMORY[0x24BE00240]();
}

uint64_t AXLoggerForFacility()
{
  return MEMORY[0x24BE00260]();
}

uint64_t AXOSLogLevelFromAXLogLevel()
{
  return MEMORY[0x24BE00280]();
}

uint64_t AXPerformBlockAsynchronouslyOnMainThread()
{
  return MEMORY[0x24BE00290]();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return MEMORY[0x24BE002A0]();
}

uint64_t AXPerformSafeBlock()
{
  return MEMORY[0x24BE002B0]();
}

uint64_t AXPerformValidationChecks()
{
  return MEMORY[0x24BE002B8]();
}

uint64_t AXSafeClassFromString()
{
  return MEMORY[0x24BE00360]();
}

uint64_t AX_CGPathEnumerateElementsUsingBlock()
{
  return MEMORY[0x24BE004A8]();
}

uint64_t AX_CGPathGetIntersectionPointWithRect()
{
  return MEMORY[0x24BE004B0]();
}

uint64_t AX_CGPathGetStartingAndEndingPoints()
{
  return MEMORY[0x24BE004B8]();
}

uint64_t AX_CGRectGetCenter()
{
  return MEMORY[0x24BE00500]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

uint64_t CGFloatIsValid()
{
  return MEMORY[0x24BDBE298]();
}

void CGPathAddCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cp1x, CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBEDB8](path, m, cp1x, cp1y, cp2x, cp2y, x, y);
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBEDC8](path, m, x, y);
}

void CGPathAddQuadCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cpx, CGFloat cpy, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBEDE0](path, m, cpx, cpy, x, y);
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
  MEMORY[0x24BDBEE20](path);
}

BOOL CGPathContainsPoint(CGPathRef path, const CGAffineTransform *m, CGPoint point, BOOL eoFill)
{
  return MEMORY[0x24BDBEE28](path, m, eoFill, (__n128)point, *(__n128 *)&point.y);
}

CGPathRef CGPathCreateCopyByStrokingPath(CGPathRef path, const CGAffineTransform *transform, CGFloat lineWidth, CGLineCap lineCap, CGLineJoin lineJoin, CGFloat miterLimit)
{
  return (CGPathRef)MEMORY[0x24BDBEE48](path, transform, *(_QWORD *)&lineCap, *(_QWORD *)&lineJoin, lineWidth, miterLimit);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x24BDBEE80]();
}

CGRect CGPathGetBoundingBox(CGPathRef path)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x24BDBEEC0](path);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGPathGetPathBoundingBox(CGPathRef path)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x24BDBEEE0](path);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

BOOL CGPathIsEmpty(CGPathRef path)
{
  return MEMORY[0x24BDBEF10](path);
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBEF40](path, m, x, y);
}

void CGPathRelease(CGPathRef path)
{
  MEMORY[0x24BDBEF48](path);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x24BDBEFC0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFC8]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFE0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF000]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF030]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBF048]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x24BDBF050]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x24BDBF058]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x24BDBF060]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF088]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t GEOBearingFromCoordinateToCoordinate()
{
  return MEMORY[0x24BE3C928]();
}

uint64_t GEOCalculateDistance()
{
  return MEMORY[0x24BE3C930]();
}

uint64_t GEOFeatureGetLocalizedLabel()
{
  return MEMORY[0x24BE3CA00]();
}

uint64_t GEOFeatureGetLocalizedShield()
{
  return MEMORY[0x24BE3CA08]();
}

uint64_t GEOFeatureGetNativeLabel()
{
  return MEMORY[0x24BE3CA10]();
}

uint64_t GEOFeatureGetNativeShield()
{
  return MEMORY[0x24BE3CA18]();
}

uint64_t GEOMultiSectionFeatureBounds()
{
  return MEMORY[0x24BE3CA58]();
}

uint64_t GEOMultiSectionFeatureGetGEOVectorTilePoints()
{
  return MEMORY[0x24BE3CA60]();
}

uint64_t GEOMultiSectionFeatureGetSectionData()
{
  return MEMORY[0x24BE3CA68]();
}

uint64_t GEOMultiSectionFeatureIsSameRoad()
{
  return MEMORY[0x24BE3CA70]();
}

uint64_t GEOMultiSectionFeatureRelease()
{
  return MEMORY[0x24BE3CA78]();
}

uint64_t GEOMultiSectionFeatureRetain()
{
  return MEMORY[0x24BE3CA80]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

uint64_t UIAXFormatInteger()
{
  return MEMORY[0x24BEBAE38]();
}

uint64_t UIAccessibilityCreateEventForSceneReferencePoint()
{
  return MEMORY[0x24BEBAF18]();
}

uint64_t UIAccessibilityFrameForBounds()
{
  return MEMORY[0x24BEBAFC0]();
}

BOOL UIAccessibilityIsSwitchControlRunning(void)
{
  return MEMORY[0x24BDF72B0]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x24BDF72C0]();
}

uint64_t UIAccessibilityPointForPoint()
{
  return MEMORY[0x24BEBB050]();
}

uint64_t UIAccessibilityPointToPoint()
{
  return MEMORY[0x24BEBB058]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
  MEMORY[0x24BDF72F8](*(_QWORD *)&notification, argument);
}

uint64_t UIKitAccessibilityLocalizedString()
{
  return MEMORY[0x24BEBB208]();
}

uint64_t VKLocationCoordinate2DForVKPoint()
{
  return MEMORY[0x24BEBFBE8]();
}

uint64_t VKLocationCoordinate2DMake()
{
  return MEMORY[0x24BEBFBF0]();
}

uint64_t VKLocationCoordinate3DMake()
{
  return MEMORY[0x24BEBFBF8]();
}

uint64_t VKPointForVKLocationCoordinate2D()
{
  return MEMORY[0x24BEBFC00]();
}

uint64_t VKRectContainsPoint()
{
  return MEMORY[0x24BEBFC08]();
}

uint64_t VKWorldBoundsFromGEOTileKey()
{
  return MEMORY[0x24BEBFC10]();
}

uint64_t _AXAssert()
{
  return MEMORY[0x24BE007F0]();
}

uint64_t _AXCArrayGetUnderlyingArray()
{
  return MEMORY[0x24BE007F8]();
}

uint64_t _AXCArrayPrepareForInsertingElementAtIndex()
{
  return MEMORY[0x24BE00800]();
}

uint64_t _AXLogWithFacility()
{
  return MEMORY[0x24BE00810]();
}

uint64_t _AXSAutomationEnabled()
{
  return MEMORY[0x24BED20C0]();
}

uint64_t _AXSCommandAndControlEnabled()
{
  return MEMORY[0x24BED2170]();
}

uint64_t _AXSFullKeyboardAccessEnabled()
{
  return MEMORY[0x24BED21F0]();
}

uint64_t _AXStringForArgs()
{
  return MEMORY[0x24BE00818]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _UIAccessibilityIsEnabled()
{
  return MEMORY[0x24BDF8060]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

uint64_t operator delete()
{
  return off_2503C47D8();
}

uint64_t __AXStringForVariables()
{
  return MEMORY[0x24BDFEDA0]();
}

uint64_t __UIAXStringForVariables()
{
  return MEMORY[0x24BEBB2D0]();
}

uint64_t __UIAccessibilityCastAsClass()
{
  return MEMORY[0x24BE00820]();
}

uint64_t __UIAccessibilityGetAssociatedObject()
{
  return MEMORY[0x24BE00868]();
}

uint64_t __UIAccessibilitySafeClass()
{
  return MEMORY[0x24BE00880]();
}

uint64_t __UIAccessibilitySetAssociatedObject()
{
  return MEMORY[0x24BE008B8]();
}

uint64_t __ax_verbose_encode_with_type_encoding_group_class()
{
  return MEMORY[0x24BE008D0]();
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

__float2 __sincosf_stret(float a1)
{
  float v1;
  float v2;
  __float2 result;

  MEMORY[0x24BDAC898](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

long double atan(long double __x)
{
  long double result;

  MEMORY[0x24BDAD218](__x);
  return result;
}

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x24BDAD220](__y, __x);
  return result;
}

float atan2f(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAD228](a1, a2);
  return result;
}

long double cos(long double __x)
{
  long double result;

  MEMORY[0x24BDADBE0](__x);
  return result;
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

long double hypot(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE838](__x, __y);
  return result;
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x24BEDD3C0](object, key, value, policy);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

long double sin(long double __x)
{
  long double result;

  MEMORY[0x24BDAFE18](__x);
  return result;
}

time_t time(time_t *a1)
{
  return MEMORY[0x24BDB0240](a1);
}

