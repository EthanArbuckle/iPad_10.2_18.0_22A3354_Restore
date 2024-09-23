id AXMapsStringForContaineeLayout(uint64_t a1)
{
  const __CFString *v1;
  __CFString *v2;

  v1 = CFSTR("CARD_SIZE_FULL");
  if (a1 == 2)
    v1 = CFSTR("CARD_SIZE_MEDIUM");
  if (a1 == 1)
    v2 = CFSTR("CARD_SIZE_SMALL");
  else
    v2 = (__CFString *)v1;
  AXMapsLocString(v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

id AXMapsStringForManeuverType(int a1)
{
  void *v1;
  __CFString *v3;

  v1 = 0;
  v3 = CFSTR("GEOManeuverType_NO_TURN");
  switch(a1)
  {
    case 0:
      goto LABEL_3;
    case 1:
      v3 = CFSTR("GEOManeuverType_LEFT_TURN");
      goto LABEL_3;
    case 2:
      v3 = CFSTR("GEOManeuverType_RIGHT_TURN");
      goto LABEL_3;
    case 3:
      v3 = CFSTR("GEOManeuverType_STRAIGHT_AHEAD");
      goto LABEL_3;
    case 4:
      v3 = CFSTR("GEOManeuverType_U_TURN");
      goto LABEL_3;
    case 5:
      v3 = CFSTR("GEOManeuverType_FOLLOW_ROAD");
      goto LABEL_3;
    case 6:
      v3 = CFSTR("GEOManeuverType_ENTER_ROUNDABOUT");
      goto LABEL_3;
    case 7:
      v3 = CFSTR("GEOManeuverType_EXIT_ROUNDABOUT");
      goto LABEL_3;
    case 11:
      v3 = CFSTR("GEOManeuverType_OFF_RAMP");
      goto LABEL_3;
    case 12:
      v3 = CFSTR("GEOManeuverType_ON_RAMP");
      goto LABEL_3;
    case 16:
      v3 = CFSTR("GEOManeuverType_ARRIVE_END_OF_NAVIGATION");
      goto LABEL_3;
    case 17:
      v3 = CFSTR("GEOManeuverType_START_ROUTE");
      goto LABEL_3;
    case 18:
      v3 = CFSTR("GEOManeuverType_ARRIVE_AT_DESTINATION");
      goto LABEL_3;
    case 20:
      v3 = CFSTR("GEOManeuverType_KEEP_LEFT");
      goto LABEL_3;
    case 21:
      v3 = CFSTR("GEOManeuverType_KEEP_RIGHT");
      goto LABEL_3;
    case 22:
      v3 = CFSTR("GEOManeuverType_ENTER_FERRY");
      goto LABEL_3;
    case 23:
      v3 = CFSTR("GEOManeuverType_EXIT_FERRY");
      goto LABEL_3;
    case 24:
      v3 = CFSTR("GEOManeuverType_CHANGE_FERRY");
      goto LABEL_3;
    case 25:
      v3 = CFSTR("GEOManeuverType_START_ROUTE_WITH_U_TURN");
      goto LABEL_3;
    case 26:
      v3 = CFSTR("GEOManeuverType_U_TURN_AT_ROUNDABOUT");
      goto LABEL_3;
    case 27:
      v3 = CFSTR("GEOManeuverType_LEFT_TURN_AT_END");
      goto LABEL_3;
    case 28:
      v3 = CFSTR("GEOManeuverType_RIGHT_TURN_AT_END");
      goto LABEL_3;
    case 29:
      v3 = CFSTR("GEOManeuverType_HIGHWAY_OFF_RAMP_LEFT");
      goto LABEL_3;
    case 30:
      v3 = CFSTR("GEOManeuverType_HIGHWAY_OFF_RAMP_RIGHT");
      goto LABEL_3;
    case 33:
      v3 = CFSTR("GEOManeuverType_ARRIVE_AT_DESTINATION_LEFT");
      goto LABEL_3;
    case 34:
      v3 = CFSTR("GEOManeuverType_ARRIVE_AT_DESTINATION_RIGHT");
      goto LABEL_3;
    case 35:
      v3 = CFSTR("GEOManeuverType_U_TURN_WHEN_POSSIBLE");
      goto LABEL_3;
    case 39:
      v3 = CFSTR("GEOManeuverType_ARRIVE_END_OF_DIRECTIONS");
      goto LABEL_3;
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 52:
    case 53:
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
      v3 = CFSTR("GEOManeuverType_ROUNDABOUT_EXIT");
      goto LABEL_3;
    case 60:
      v3 = CFSTR("GEOManeuverType_SHARP_LEFT_TURN");
      goto LABEL_3;
    case 61:
      v3 = CFSTR("GEOManeuverType_SHARP_RIGHT_TURN");
      goto LABEL_3;
    case 62:
      v3 = CFSTR("GEOManeuverType_SLIGHT_LEFT_TURN");
      goto LABEL_3;
    case 63:
      v3 = CFSTR("GEOManeuverType_SLIGHT_RIGHT_TURN");
      goto LABEL_3;
    case 64:
      v3 = CFSTR("GEOManeuverType_CHANGE_HIGHWAY");
      goto LABEL_3;
    case 65:
      v3 = CFSTR("GEOManeuverType_CHANGE_HIGHWAY_LEFT");
      goto LABEL_3;
    case 66:
      v3 = CFSTR("GEOManeuverType_CHANGE_HIGHWAY_RIGHT");
LABEL_3:
      AXMapsLocString(v3);
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return v1;
  }
  return v1;
}

id AXMapsStringForVehicleColor(void *a1)
{
  id v1;
  __CFString *v2;
  uint64_t v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = a1;
  if (AXMapsStringForVehicleColor_onceToken != -1)
    dispatch_once(&AXMapsStringForVehicleColor_onceToken, &__block_literal_global);
  v7 = 0;
  v8 = 0;
  v6 = 0;
  objc_msgSend(v1, "getRed:green:blue:alpha:", &v8, &v7, &v6, 0);
  if (AXColorsProbablyEqual())
  {
    v2 = CFSTR("VEHICLE_DARK_GRAY");
  }
  else if ((AXColorsProbablyEqual() & 1) != 0 || AXColorsProbablyEqual())
  {
    v2 = CFSTR("VEHICLE_NAVY_BLUE");
  }
  else if ((AXColorsProbablyEqual() & 1) != 0 || AXColorsProbablyEqual())
  {
    v2 = CFSTR("VEHICLE_LIGHT_BLUE");
  }
  else if ((AXColorsProbablyEqual() & 1) != 0 || AXColorsProbablyEqual())
  {
    v2 = CFSTR("VEHICLE_BLUE");
  }
  else if ((AXColorsProbablyEqual() & 1) != 0 || AXColorsProbablyEqual())
  {
    v2 = CFSTR("VEHICLE_BEIGE");
  }
  else
  {
    if (!AXColorsProbablyEqual())
    {
      AXColorStringForColor();
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    v2 = CFSTR("VEHICLE_WHITE");
  }
  AXMapsLocString(v2);
  v3 = objc_claimAutoreleasedReturnValue();
LABEL_9:
  v4 = (void *)v3;

  return v4;
}

void sub_2327069D8(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 80));
  objc_destroyWeak((id *)(v4 - 72));
  _Unwind_Resume(a1);
}

void sub_232706E78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_2327087F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_232709038(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23270A2C0(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void sub_23270B070(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23270B220(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23270B7E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23270BA50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id AXVectorKitLocString(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  if (AXVectorKitLocString_onceToken != -1)
    dispatch_once(&AXVectorKitLocString_onceToken, &__block_literal_global_5);
  if (AXVectorKitLocString_bundle)
  {
    objc_msgSend((id)AXVectorKitLocString_bundle, "localizedStringForKey:value:table:", v1, &stru_25025B660, CFSTR("Accessibility"));
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
    objc_msgSend((id)AXMapKitLocString_bundle, "localizedStringForKey:value:table:", v1, &stru_25025B660, CFSTR("Accessibility"));
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
    objc_msgSend((id)AXMapsLocString_bundle, "localizedStringForKey:value:table:", v1, &stru_25025B660, CFSTR("Accessibility-Maps"));
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

void sub_23270DCD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23271174C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_232711A24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_232711F8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void sub_232712380(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_232712E88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_232712F50(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_232713518(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  _Block_object_dispose(&a34, 8);
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

void sub_232716A18(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

uint64_t AXColorStringForColor()
{
  return MEMORY[0x24BDFF9B8]();
}

uint64_t AXColorsProbablyEqual()
{
  return MEMORY[0x24BDFF9C0]();
}

uint64_t AXDescriptionForHeadingInDegrees()
{
  return MEMORY[0x24BDFDFB8]();
}

uint64_t AXDeviceIsPad()
{
  return MEMORY[0x24BDFE000]();
}

uint64_t AXLocalizedString()
{
  return MEMORY[0x24BE001D8]();
}

uint64_t AXLogAppAccessibility()
{
  return MEMORY[0x24BDFE0B0]();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return MEMORY[0x24BDFE260]();
}

uint64_t AXPerformSafeBlock()
{
  return MEMORY[0x24BDFE278]();
}

uint64_t AXPerformValidationChecks()
{
  return MEMORY[0x24BDFE280]();
}

uint64_t AXSafeClassFromString()
{
  return MEMORY[0x24BDFE380]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

uint64_t UIAXArrayForString()
{
  return MEMORY[0x24BEBAE20]();
}

uint64_t UIAXFormatInteger()
{
  return MEMORY[0x24BEBAE38]();
}

uint64_t UIAXLabelForElements()
{
  return MEMORY[0x24BEBAE50]();
}

uint64_t UIAXPriceRangeDescription()
{
  return MEMORY[0x24BEBAE68]();
}

uint64_t UIAXStarRatingStringForRating()
{
  return MEMORY[0x24BEBAE78]();
}

uint64_t UIAXStringForAllChildren()
{
  return MEMORY[0x24BEBAE90]();
}

BOOL UIAccessibilityIsSwitchControlRunning(void)
{
  return MEMORY[0x24BDF72B0]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x24BDF72C0]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
  MEMORY[0x24BDF72F8](*(_QWORD *)&notification, argument);
}

uint64_t UIAccessibilitySpeakAndDoNotBeInterrupted()
{
  return MEMORY[0x24BEBB0C0]();
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

uint64_t _AXTraitsRemoveTrait()
{
  return MEMORY[0x24BDFED30]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _UIAccessibilityBlockPostingOfNotification()
{
  return MEMORY[0x24BEBB260]();
}

uint64_t _UIAccessibilityUnblockPostingOfNotification()
{
  return MEMORY[0x24BEBB2C0]();
}

uint64_t _UIImageIsSystemSymbol()
{
  return MEMORY[0x24BDF8140]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
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
  return MEMORY[0x24BDFE550]();
}

uint64_t __UIAccessibilityCastAsSafeCategory()
{
  return MEMORY[0x24BDFE560]();
}

uint64_t __UIAccessibilitySafeClass()
{
  return MEMORY[0x24BDFE5C0]();
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

