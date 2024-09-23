uint64_t sAreNrBandsValid(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v3 = v1;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          if (!v8 || !ctConvertNrBandToMask(objc_msgSend(v8, "unsignedShortValue", (_QWORD)v11)))
          {
            v9 = 0;
            goto LABEL_15;
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        v9 = 1;
        if (v5)
          continue;
        break;
      }
    }
    else
    {
      v9 = 1;
    }
LABEL_15:

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t sAreUmtsBandsValid(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v3 = v1;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          if (!v8 || !ctConvertUmtsBandToMask(objc_msgSend(v8, "unsignedShortValue", (_QWORD)v11)))
          {
            v9 = 0;
            goto LABEL_15;
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        v9 = 1;
        if (v5)
          continue;
        break;
      }
    }
    else
    {
      v9 = 1;
    }
LABEL_15:

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t sAreTdsBandsValid(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v3 = v1;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          if (!v8 || !ctConvertTdsBandToMask(objc_msgSend(v8, "unsignedShortValue", (_QWORD)v11)))
          {
            v9 = 0;
            goto LABEL_15;
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        v9 = 1;
        if (v5)
          continue;
        break;
      }
    }
    else
    {
      v9 = 1;
    }
LABEL_15:

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void sub_1843AE168(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1843AE2C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1843AE37C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1843AE428(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1843AE528(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1843AE634(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1843AE6E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1843AE7E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1843AE890(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1843AE93C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1843AE9AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1843AEA28(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1843AEB04(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1843AEBA0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1843AEC38(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

unint64_t _CTServerConnectionCopyCellularUsageWorkspaceInfo(uint64_t a1, _QWORD *a2)
{
  unint64_t v2;
  unsigned int v3;
  unint64_t v6;
  const object *v7;
  CFTypeRef cf;
  xpc_object_t object[2];
  xpc_object_t v11;
  xpc_object_t v12;
  xpc_object_t v13;

  v2 = 0x1600000000;
  v3 = 1;
  if (a1 && a2)
  {
    *a2 = 0;
    xpc::dict_creator::dict_creator((xpc::dict_creator *)object);
    xpc::dict_creator::operator()<char const*>("kCUGetWorkspaceInfo", object, "kRequest", &v12);
    xpc_release(object[0]);
    v13 = v12;
    v12 = xpc_null_create();
    xpc_release(v12);
    v12 = xpc_null_create();
    v6 = SendXpcMessage(a1, &v13, &v12);
    v3 = v6;
    if (HIDWORD(v6))
    {
      v2 = v6 & 0xFFFFFFFF00000000;
    }
    else if (MEMORY[0x186DBAE5C](v12) == MEMORY[0x1E0C812F8])
    {
      object[0] = &v12;
      object[1] = "kCUWorkspaceInfo";
      v11 = 0;
      xpc::dict::object_proxy::operator xpc::object((uint64_t)object, &v11);
      if (MEMORY[0x186DBAE5C](v11) == MEMORY[0x1E0C81350])
      {
        v2 = 0x200000000;
        v3 = 1;
      }
      else
      {
        object[0] = 0;
        xpc::bridge((xpc *)&v11, v7);
        ctu::cf::CFSharedRef<__CFDictionary const>::CFSharedRef<void const,void>(object, &cf);
        if (cf)
          CFRelease(cf);
        v2 = 0;
        *a2 = object[0];
      }
      xpc_release(v11);
    }
    else
    {
      v2 = 0;
    }
    xpc_release(v12);
    xpc_release(v13);
  }
  return v3 | v2;
}

uint64_t _CTServerConnectionSetCellularUsagePolicy(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 && a2 && a3)
    ctu::cf::assign();
  return 0x1600000001;
}

uint64_t mayBeSetLegacyCellularDataPolicy(xpc_object_t *a1, CFDictionaryRef theDict)
{
  uint64_t result;
  const void *v4;
  CFTypeID v5;
  int v6;
  xpc_object_t v7;
  xpc_object_t v8;

  result = (uint64_t)CFDictionaryGetValue(theDict, CFSTR("kCTCellularUsagePolicyDataAllowed"));
  if (result)
  {
    v4 = (const void *)result;
    v5 = CFGetTypeID((CFTypeRef)result);
    if (v5 == CFBooleanGetTypeID())
    {
      v6 = CFEqual((CFTypeRef)*MEMORY[0x1E0C9AE50], v4);
      v7 = xpc_int64_create(2 * (v6 == 0));
      if (!v7)
        v7 = xpc_null_create();
      xpc_dictionary_set_value(*a1, "kCUPolicyKeyDataAllowed", v7);
      v8 = xpc_null_create();
      xpc_release(v7);
      xpc_release(v8);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

BOOL mayBeSetCellularDataPolicy(xpc_object_t *a1, CFDictionaryRef theDict)
{
  const __CFString *Value;
  const __CFString *v4;
  CFTypeID v5;
  unsigned __int16 EnumForCellularDataUsagePolicy;
  unsigned int v7;
  xpc_object_t v8;
  xpc_object_t v9;

  Value = (const __CFString *)CFDictionaryGetValue(theDict, CFSTR("kCTCellularDataUsagePolicy"));
  if (Value)
  {
    v4 = Value;
    v5 = CFGetTypeID(Value);
    if (v5 == CFStringGetTypeID())
      Value = v4;
    else
      Value = 0;
  }
  EnumForCellularDataUsagePolicy = getEnumForCellularDataUsagePolicy(Value);
  v7 = EnumForCellularDataUsagePolicy;
  if (EnumForCellularDataUsagePolicy >= 0x100u)
  {
    v8 = xpc_int64_create(EnumForCellularDataUsagePolicy);
    if (!v8)
      v8 = xpc_null_create();
    xpc_dictionary_set_value(*a1, "kCUPolicyKeyDataAllowed", v8);
    v9 = xpc_null_create();
    xpc_release(v8);
    xpc_release(v9);
  }
  return v7 > 0xFF;
}

BOOL mayBeSetWiFiDataPolicy(xpc_object_t *a1, CFDictionaryRef theDict)
{
  const __CFString *Value;
  const __CFString *v4;
  CFTypeID v5;
  unsigned __int16 EnumForCellularDataUsagePolicy;
  unsigned int v7;
  xpc_object_t v8;
  xpc_object_t v9;

  Value = (const __CFString *)CFDictionaryGetValue(theDict, CFSTR("kCTWiFiDataUsagePolicy"));
  if (Value)
  {
    v4 = Value;
    v5 = CFGetTypeID(Value);
    if (v5 == CFStringGetTypeID())
      Value = v4;
    else
      Value = 0;
  }
  EnumForCellularDataUsagePolicy = getEnumForCellularDataUsagePolicy(Value);
  v7 = EnumForCellularDataUsagePolicy;
  if (EnumForCellularDataUsagePolicy >= 0x100u)
  {
    v8 = xpc_int64_create(EnumForCellularDataUsagePolicy);
    if (!v8)
      v8 = xpc_null_create();
    xpc_dictionary_set_value(*a1, "kCUPolicyKeyWiFiAllowed", v8);
    v9 = xpc_null_create();
    xpc_release(v8);
    xpc_release(v9);
  }
  return v7 > 0xFF;
}

unint64_t _CTServerConnectionCopyStartDateOfCellularDataUsageRecords(uint64_t a1, CFDateRef *a2)
{
  unint64_t v2;
  const object *v5;
  double v6;
  CFAbsoluteTime v7;
  xpc_object_t object[2];
  xpc_object_t v10;
  xpc_object_t xdict;
  xpc_object_t v12;

  v2 = 0x1600000001;
  if (a1 && a2)
  {
    *a2 = 0;
    xpc::dict_creator::dict_creator((xpc::dict_creator *)object);
    xpc::dict_creator::operator()<char const*>("kCUGetRecordsStartDate", object, "kRequest", &xdict);
    xpc_release(object[0]);
    v12 = xdict;
    xdict = xpc_null_create();
    xpc_release(xdict);
    xdict = xpc_null_create();
    v2 = SendXpcMessage(a1, &v12, &xdict);
    if (!HIDWORD(v2)
      && MEMORY[0x186DBAE5C](xdict) == MEMORY[0x1E0C812F8]
      && xpc_dictionary_get_value(xdict, "kCURecordsStartDate"))
    {
      object[0] = &xdict;
      object[1] = "kCURecordsStartDate";
      xpc::dict::object_proxy::operator xpc::object((uint64_t)object, &v10);
      xpc::dyn_cast_or_default((xpc *)&v10, v5, 0.0);
      v7 = v6;
      xpc_release(v10);
      *a2 = CFDateCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v7);
    }
    xpc_release(xdict);
    xpc_release(v12);
  }
  return v2;
}

uint64_t _CTServerConnectionEraseCellularDataUsageRecords(uint64_t a1)
{
  uint64_t v2;
  xpc_object_t v4;
  xpc_object_t object;

  if (!a1)
    return 0x1600000001;
  xpc::dict_creator::dict_creator((xpc::dict_creator *)&object);
  xpc::dict_creator::operator()<char const*>("kCUEraseRecords", &object, "kRequest", &v4);
  xpc_release(object);
  object = v4;
  v4 = xpc_null_create();
  xpc_release(v4);
  v4 = xpc_null_create();
  v2 = SendXpcMessage(a1, &object, &v4);
  xpc_release(v4);
  xpc_release(object);
  return v2;
}

unint64_t _CTServerConnectionGetShowUsageAlert(uint64_t a1, _QWORD *a2)
{
  unint64_t v2;
  uint64_t v5;
  int v6;
  uint64_t v7;
  xpc_object_t object[2];
  xpc_object_t v10;
  xpc_object_t xdict;
  xpc_object_t v12;

  v2 = 0x1600000001;
  if (a1 && a2)
  {
    v5 = *MEMORY[0x1E0C9AE50];
    *a2 = *MEMORY[0x1E0C9AE50];
    xpc::dict_creator::dict_creator((xpc::dict_creator *)object);
    xpc::dict_creator::operator()<char const*>("kCUGetShowUsageAlert", object, "kRequest", &xdict);
    xpc_release(object[0]);
    v12 = xdict;
    xdict = xpc_null_create();
    xpc_release(xdict);
    xdict = xpc_null_create();
    v2 = SendXpcMessage(a1, &v12, &xdict);
    if (!HIDWORD(v2)
      && MEMORY[0x186DBAE5C](xdict) == MEMORY[0x1E0C812F8]
      && xpc_dictionary_get_value(xdict, "kCUShowUsageAlert"))
    {
      object[0] = &xdict;
      object[1] = "kCUShowUsageAlert";
      xpc::dict::object_proxy::operator xpc::object((uint64_t)object, &v10);
      v6 = xpc::dyn_cast_or_default((xpc *)&v10, 0);
      xpc_release(v10);
      v7 = *MEMORY[0x1E0C9AE40];
      if (v6)
        v7 = v5;
      *a2 = v7;
    }
    xpc_release(xdict);
    xpc_release(v12);
  }
  return v2;
}

uint64_t _CTServerConnectionSetShowUsageAlert(uint64_t a1, const void *a2)
{
  uint64_t v2;
  xpc_object_t v5;
  unsigned int v6;
  xpc_object_t v7;
  xpc_object_t v8;
  xpc_object_t v10;
  xpc_object_t object;

  v2 = 0x1600000001;
  if (a1 && a2)
  {
    xpc::dict_creator::dict_creator((xpc::dict_creator *)&object);
    xpc::dict_creator::operator()<char const*>("kCUSetShowUsageAlert", &object, "kRequest", &v10);
    xpc_release(object);
    v5 = v10;
    object = v10;
    v10 = xpc_null_create();
    xpc_release(v10);
    v6 = CFEqual(a2, (CFTypeRef)*MEMORY[0x1E0C9AE50]);
    v7 = xpc_int64_create(v6);
    if (!v7)
      v7 = xpc_null_create();
    xpc_dictionary_set_value(v5, "kCUShowUsageAlert", v7);
    v8 = xpc_null_create();
    xpc_release(v7);
    xpc_release(v8);
    v10 = xpc_null_create();
    v2 = SendXpcMessage(a1, &object, &v10);
    xpc_release(v10);
    xpc_release(object);
  }
  return v2;
}

uint64_t _CTServerConnectionSetUsageAlertParameters(uint64_t a1, ctu *a2)
{
  uint64_t v2;
  xpc_object_t v5;
  const void *v6;
  void *v7;
  xpc_object_t value;
  xpc_object_t valuea;
  xpc_object_t v11;
  xpc_object_t object;

  v2 = 0x1600000001;
  if (a1 && a2)
  {
    xpc::dict_creator::dict_creator((xpc::dict_creator *)&object);
    xpc::dict_creator::operator()<char const*>("kCUSetAlertParameters", &object, "kRequest", &v11);
    xpc_release(object);
    v5 = v11;
    object = v11;
    v11 = xpc_null_create();
    xpc_release(v11);
    ctu::cf_to_xpc(a2, v6);
    xpc_dictionary_set_value(v5, "kCUAlertParameters", value);
    v7 = value;
    valuea = xpc_null_create();
    xpc_release(v7);
    xpc_release(valuea);
    v11 = xpc_null_create();
    v2 = SendXpcMessage(a1, &object, &v11);
    xpc_release(v11);
    xpc_release(object);
  }
  return v2;
}

unint64_t _CTServerConnectionCopyUsageAlertParameters(uint64_t a1, _QWORD *a2)
{
  unint64_t v2;
  const object *v5;
  xpc_object_t object[2];
  xpc_object_t v8;
  CFTypeRef cf;
  uint64_t v10;
  xpc_object_t xdict;
  xpc_object_t v12;

  v2 = 0x1600000001;
  if (a1 && a2)
  {
    *a2 = 0;
    xpc::dict_creator::dict_creator((xpc::dict_creator *)object);
    xpc::dict_creator::operator()<char const*>("kCUGetAlertParameters", object, "kRequest", &xdict);
    xpc_release(object[0]);
    v12 = xdict;
    xdict = xpc_null_create();
    xpc_release(xdict);
    xdict = xpc_null_create();
    v2 = SendXpcMessage(a1, &v12, &xdict);
    if (!HIDWORD(v2)
      && MEMORY[0x186DBAE5C](xdict) == MEMORY[0x1E0C812F8]
      && xpc_dictionary_get_value(xdict, "kCUAlertParameters"))
    {
      v10 = 0;
      object[0] = &xdict;
      object[1] = "kCUAlertParameters";
      xpc::dict::object_proxy::operator xpc::object((uint64_t)object, &v8);
      xpc::bridge((xpc *)&v8, v5);
      ctu::cf::CFSharedRef<__CFDictionary const>::CFSharedRef<void const,void>(&v10, &cf);
      if (cf)
        CFRelease(cf);
      xpc_release(v8);
      *a2 = v10;
    }
    xpc_release(xdict);
    xpc_release(v12);
  }
  return v2;
}

uint64_t _CTServerConnectionCopyDataUsageForSubscriber(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 && a2 && a3)
    ctu::cf::assign();
  return 0x1600000001;
}

unint64_t _CTServerConnectionCopyReliableNetworkFallbackSettings(uint64_t a1, _QWORD *a2)
{
  unint64_t v2;
  unsigned int v3;
  unint64_t v6;
  const object *v8;
  xpc_object_t object[2];
  xpc_object_t v10;
  CFTypeRef cf;
  uint64_t v12;
  xpc_object_t xdict;
  xpc_object_t v14;

  v2 = 0x1600000000;
  v3 = 1;
  if (a1 && a2)
  {
    xpc::dict_creator::dict_creator((xpc::dict_creator *)object);
    xpc::dict_creator::operator()<char const*>("kCUReliableNetworkFallbackGet", object, "kRequest", &xdict);
    xpc_release(object[0]);
    v14 = xdict;
    xdict = xpc_null_create();
    xpc_release(xdict);
    xdict = xpc_null_create();
    v6 = SendXpcMessage(a1, &v14, &xdict);
    v3 = v6;
    if (HIDWORD(v6))
    {
      v2 = v6 & 0xFFFFFFFF00000000;
    }
    else if (MEMORY[0x186DBAE5C](xdict) == MEMORY[0x1E0C812F8])
    {
      if (xpc_dictionary_get_value(xdict, "kCUReliableNetworkFallbackGet"))
      {
        v12 = 0;
        object[0] = &xdict;
        object[1] = "kCUReliableNetworkFallbackGet";
        xpc::dict::object_proxy::operator xpc::object((uint64_t)object, &v10);
        xpc::bridge((xpc *)&v10, v8);
        ctu::cf::CFSharedRef<__CFDictionary const>::CFSharedRef<void const,void>(&v12, &cf);
        if (cf)
          CFRelease(cf);
        xpc_release(v10);
        v2 = 0;
        *a2 = v12;
      }
      else
      {
        v2 = 0x200000000;
        v3 = 1;
      }
    }
    else
    {
      v2 = 0;
    }
    xpc_release(xdict);
    xpc_release(v14);
  }
  return v3 | v2;
}

uint64_t _CTServerConnectionSetReliableNetworkFallbackToCellular(uint64_t a1, unsigned int a2)
{
  xpc_object_t v4;
  xpc_object_t v5;
  xpc_object_t v6;
  uint64_t v7;
  uint64_t v8;
  xpc_object_t v10;
  xpc_object_t object;

  if (!a1)
    return 0x1600000001;
  xpc::dict_creator::dict_creator((xpc::dict_creator *)&object);
  xpc::dict_creator::operator()<char const*>("kCUReliableNetworkFallbackSet", &object, "kRequest", &v10);
  xpc_release(object);
  v4 = v10;
  object = v10;
  v10 = xpc_null_create();
  xpc_release(v10);
  v5 = xpc_int64_create(a2);
  if (!v5)
    v5 = xpc_null_create();
  xpc_dictionary_set_value(v4, "kCUReliableNetworkFallbackUserSetting", v5);
  v6 = xpc_null_create();
  xpc_release(v5);
  xpc_release(v6);
  v8 = SendXpcMessage(a1, &object, 0, v7);
  xpc_release(object);
  return v8;
}

uint64_t _CTServerConnectionGetCellularUsageWorkspaceInfoEx(uint64_t a1, ctu *a2, NSObject *a3, uint64_t a4)
{
  uint64_t result;
  xpc_object_t v9;
  const void *v10;
  xpc_object_t v11;
  int v12;
  _QWORD v13[5];
  xpc_object_t value;
  xpc_object_t v15;
  xpc_object_t object;

  result = 0x1600000001;
  if (a2 && a1 && a3 && a4)
  {
    xpc::dict_creator::dict_creator((xpc::dict_creator *)&object);
    xpc::dict_creator::operator()<char const*>("kCUGetWorkspaceInfoEx", &object, "kRequest", &v15);
    xpc_release(object);
    v9 = v15;
    object = v15;
    v15 = xpc_null_create();
    xpc_release(v15);
    ctu::cf_to_xpc(a2, v10);
    xpc_dictionary_set_value(v9, "kCUContext", value);
    v11 = value;
    value = xpc_null_create();
    xpc_release(v11);
    xpc_release(value);
    v13[4] = a4;
    value = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 0x40000000;
    v13[2] = ___CTServerConnectionGetCellularUsageWorkspaceInfoEx_block_invoke;
    v13[3] = &unk_1E152D400;
    v12 = SendXpcMessageAsync(a1, &object, a3, v13);
    xpc_release(object);
    if (v12)
      return 0;
    else
      return 0x500000002;
  }
  return result;
}

uint64_t _CTServerConnectionSetCellularUsagePolicyEx(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2 && a1 && a4 && a5 && a6)
    ctu::cf::assign();
  return 0x1600000001;
}

uint64_t _CTServerConnectionGetCellularUsagePolicyEx(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a2 && a1 && a4 && a5)
    ctu::cf::assign();
  return 0x1600000001;
}

uint64_t _CTServerConnectionEraseCellularDataUsageRecordsEx(uint64_t a1, ctu *a2, NSObject *a3, uint64_t a4)
{
  uint64_t result;
  xpc_object_t v9;
  const void *v10;
  xpc_object_t v11;
  int v12;
  _QWORD v13[5];
  xpc_object_t value;
  xpc_object_t v15;
  xpc_object_t object;

  result = 0x1600000001;
  if (a2 && a1 && a3 && a4)
  {
    xpc::dict_creator::dict_creator((xpc::dict_creator *)&object);
    xpc::dict_creator::operator()<char const*>("kCUEraseRecordsEx", &object, "kRequest", &v15);
    xpc_release(object);
    v9 = v15;
    object = v15;
    v15 = xpc_null_create();
    xpc_release(v15);
    ctu::cf_to_xpc(a2, v10);
    xpc_dictionary_set_value(v9, "kCUContext", value);
    v11 = value;
    value = xpc_null_create();
    xpc_release(v11);
    xpc_release(value);
    v13[4] = a4;
    value = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 0x40000000;
    v13[2] = ___CTServerConnectionEraseCellularDataUsageRecordsEx_block_invoke;
    v13[3] = &unk_1E1534E40;
    v12 = SendXpcMessageAsync(a1, &object, a3, v13);
    xpc_release(object);
    if (v12)
      return 0;
    else
      return 0x500000002;
  }
  return result;
}

uint64_t _CTServerConnectionGetCellularUsagePolicyMirroring(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a4)
    return 0x1600000001;
  (*(void (**)(uint64_t, uint64_t, _QWORD))(a4 + 16))(a4, 1, 0);
  return 0;
}

uint64_t _CTServerConnectionSetCellularUsagePolicyOsVersion(uint64_t a1, uint64_t a2)
{
  if (a1 && a2)
    ctu::cf::assign();
  return 0x1600000001;
}

char *std::vector<void const*>::__vallocate[abi:nn180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 61)
    abort();
  result = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<MMSHeaderEncoding const*>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

uint64_t getEnumForCellularDataUsagePolicy(const __CFString *a1)
{
  int v2;
  int v3;

  if (a1)
  {
    if (CFEqual(a1, CFSTR("kCTCellularDataUsagePolicyAlwaysAllow")))
    {
      v2 = 0;
    }
    else
    {
      if (!CFEqual(a1, CFSTR("kCTCellularDataUsagePolicyAllowWhileInHome")))
      {
        v3 = CFEqual(a1, CFSTR("kCTCellularDataUsagePolicyDeny")) != 0;
        v2 = 2 * v3;
        return v2 | (v3 << 8);
      }
      v2 = 1;
    }
    v3 = 1;
  }
  else
  {
    v2 = 0;
    v3 = 0;
  }
  return v2 | (v3 << 8);
}

void _CTServerConnectionPerformMigration_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18425C000, log, OS_LOG_TYPE_ERROR, "Could not create CTServerConnectionRef", v1, 2u);
}

void acknowledgeMessageWithId()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18425C000, v0, v1, "acknowledgeMessage called with no server connection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_18425C000, v0, v1, "couldn't acknowledge message %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void MMSExpiryHeader::decodeValue(unsigned __int8 a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  _QWORD *v4;
  _DWORD v5[2];
  __int16 v6;
  _QWORD *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a2 + 8);
  v4 = (_QWORD *)(v3 + 8);
  if (*(char *)(v3 + 31) < 0)
    v4 = (_QWORD *)*v4;
  v5[0] = 67109378;
  v5[1] = a1;
  v6 = 2080;
  v7 = v4;
  _os_log_error_impl(&dword_18425C000, log, OS_LOG_TYPE_ERROR, "unknown date type 0x%.2x for field %s", (uint8_t *)v5, 0x12u);
}

void handleUnsupportedRequestForCurrentBundle(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 136315394;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_18425C000, log, OS_LOG_TYPE_DEBUG, "Unsupported request '%s' for bundle ID '%@'", (uint8_t *)&v3, 0x16u);
}

void `anonymous namespace'::sCTAssertionDestroy()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18425C000, v0, v1, "invalid assertion upon sCTAssertionDestroy", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18425C000, v0, v1, "no fClientMux", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18425C000, v0, v1, "CTAssertionConnectionDestroy failed. Remote connection down", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void ___ZN12_GLOBAL__N_119sCTAssertionDestroyEPKv_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18425C000, v0, v1, "sCTAssertionDestroy failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void ___ZZ44__CoreTelephonyClientMux_addDelegate_queue__ENK3__0clEv_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1(&dword_18425C000, v0, v1, "Updating selectors after delegate addition failed with: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

void ___ZZ59__CoreTelephonyClientMux_synchronousProxyWithErrorHandler__ENK3__4clEv_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1(&dword_18425C000, v0, v1, "Synchronous remote object proxy returned error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

void MMSPduDecoder::decodeEncodedString(unsigned int *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_16(a1);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_6(&dword_18425C000, v1, v2, "unable to convert from charset %s (%d) to %s (%d)", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_7_0();
}

void MMSPduDecoder::decodeSimpleHeader(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;

  v4 = 136315138;
  v5 = OUTLINED_FUNCTION_13(a1);
  OUTLINED_FUNCTION_4(&dword_18425C000, a2, v3, "couldn't replace simple header '%s' with encoded version", (uint8_t *)&v4);
  OUTLINED_FUNCTION_15();
}

{
  uint64_t v3;
  int v4;
  uint64_t v5;

  v4 = 136315138;
  v5 = OUTLINED_FUNCTION_13(a1);
  OUTLINED_FUNCTION_4(&dword_18425C000, a2, v3, "unable to decode header '%s'", (uint8_t *)&v4);
  OUTLINED_FUNCTION_15();
}

void MMSPduDecoder::decodeSimpleHeader()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18425C000, v0, v1, "failed to decode simple header name", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void MMSPduDecoder::decodeSpecificHeader(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = a1;
  OUTLINED_FUNCTION_4(&dword_18425C000, a2, a3, "No %s header in MMS PDU", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1_1();
}

void MMSPduDecoder::convertMimePartBody(MMSCharsetHeader *a1, unsigned int *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  MMSCharsetHeader::charsetNameForMibEnum(a1);
  MMSCharsetHeader::charsetNameForMibEnum((MMSCharsetHeader *)*a2);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_6(&dword_18425C000, v3, v4, "unable to convert from charset %s (%d) to %s (%d)", v5, v6, v7, v8, v9);
  OUTLINED_FUNCTION_7_0();
}

void MMSPduDecoder::decodeMultipartAlternativePart()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_18425C000, v0, v1, "unable to decode multipart/alternative part %u", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void MMSPduDecoder::decodeMultipartBody()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18425C000, v0, v1, "unable to decode nEntries for multipart message", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void MMSPduDecoder::decodeMimePart()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_18425C000, v0, v1, "Couldn't decode headersLen for part %u", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_18425C000, v0, v1, "Couldn't decode dataLen for part %u", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_18425C000, v0, v1, "out of buffer before Content-Type for part %u", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_10_0(&dword_18425C000, v0, v1, "HeadersLen %u > remaining %u", v2, v3);
  OUTLINED_FUNCTION_1_1();
}

{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_10_0(&dword_18425C000, v0, v1, "DataLen %u > remaining %u", v2, v3);
  OUTLINED_FUNCTION_1_1();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_18425C000, v0, v1, "couldn't find best subpart for multipart/alternative part %u", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_18425C000, v0, v1, "error decoding headers for part %u", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_18425C000, v0, v1, "Couldn't decode Content-Type for part %u", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void MMSPduDecoder::decodeBody()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18425C000, v0, v1, "no Content-Type header, how can I decode the body?", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18425C000, v0, v1, "couldn't find a best part for multipart/alternative message", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void MMSPduDecoder::decodeContentType(char *a1, _QWORD *a2, NSObject *a3)
{
  _QWORD *v3;
  int v4;
  _QWORD *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (*a1 >= 0)
    v3 = a2;
  else
    v3 = (_QWORD *)*a2;
  v4 = 136315138;
  v5 = v3;
  OUTLINED_FUNCTION_4(&dword_18425C000, a3, (uint64_t)a3, "%s is not a valid content type", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1_1();
}

void MMSPduDecoder::decodeContentType()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18425C000, v0, v1, "couldn't decode contentType", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void MMSPduDecoder::printDebugInfo(MMSMessage *a1, NSObject *a2)
{
  uint64_t v3;
  void **v4;
  void *__p[2];
  char v6;
  int v7;
  void **v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  MMSMessage::prettyContentBody(a1, __p);
  if (v6 >= 0)
    v4 = __p;
  else
    v4 = (void **)__p[0];
  v7 = 136642819;
  v8 = v4;
  OUTLINED_FUNCTION_4(&dword_18425C000, a2, v3, "Body: %{sensitive}s", (uint8_t *)&v7);
  if (v6 < 0)
    operator delete(__p[0]);
}

void MMSPduDecoder::printDebugInfo()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  OUTLINED_FUNCTION_11(*MEMORY[0x1E0C80C00]);
  v3 = 136315138;
  v4 = v0;
  OUTLINED_FUNCTION_4(&dword_18425C000, v1, v2, "Next few bytes: %s", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1_1();
}

void MMSPduDecoder::decodeMessage()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_18425C000, v0, v1, "MmsPduDecoder: after decoding message, still have %d bytes remaining.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void ___ZN8dispatch9sync_implIZ27__CTStewieDataClient_start_E3__0EEvPU28objcproto17OS_dispatch_queue8NSObjectOT_NSt3__117integral_constantIbLb1EEE_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18425C000, v0, v1, "Failed to start monitor", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void ___ZN8dispatch9sync_implIZ27__CTStewieDataClient_start_E3__0EEvPU28objcproto17OS_dispatch_queue8NSObjectOT_NSt3__117integral_constantIbLb1EEE_block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18425C000, v0, v1, "Already running", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:nn180100](void **a1)
{
  if (*((char *)a1 + 23) < 0)
    OUTLINED_FUNCTION_0_3(a1);
}

void MMSFromHeader::decodeValue(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18425C000, a1, a3, "value length > remaining buffer", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

{
  OUTLINED_FUNCTION_0(&dword_18425C000, a1, a3, "unable to decode value length", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void MMSFromHeader::decodeValue(unsigned __int8 a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_18425C000, a2, OS_LOG_TYPE_ERROR, "unknown token in From header: %.2x", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_1_0();
}

void _CTServerConnectionGetRegistrationCauseCode_cold_1(int *a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_18425C000, a2, OS_LOG_TYPE_DEBUG, "Registration cause code: %d", (uint8_t *)v3, 8u);
  OUTLINED_FUNCTION_1_0();
}

void _CTServerConnectionGetRegistrationStatus_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_0_1(&dword_18425C000, v0, v1, "Registration status: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

void _CTServerConnectionCopyCurrentOperatorName()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_0_1(&dword_18425C000, v0, v1, "Operator name: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

void _CTServerConnectionCopyNetworkList_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18425C000, a1, a3, "Missing kRegistrationNetworkList key in response", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void _CTServerConnectionSelectNetwork_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18425C000, a1, a3, "Invalid network selected", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void _CTServerConnectionSelectNetwork_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18425C000, a1, a3, "Empty network selected", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void _CTServerConnectionGetNetworkSelectionMode_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_0_1(&dword_18425C000, v0, v1, "Network selection mode: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

void _CTServerConnectionGetNetworkSelectionState_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_0_1(&dword_18425C000, v0, v1, "Network selection state: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

void _CTServerConnectionCopyLastKnownCountryCode_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_0_1(&dword_18425C000, v0, v1, "Last known MCC: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

void convertRatAndPreferred(int a1)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_18425C000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to convert RAT selection mask 0x%02x to string", (uint8_t *)v1, 8u);
}

void MMSPduEncoder::encodeHeaders(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void **v3;
  void *__p[2];
  char v5;
  int v6;
  void **v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  (*(void (**)(void **__return_ptr, uint64_t, _QWORD))(*(_QWORD *)a1 + 48))(__p, a1, 0);
  if (v5 >= 0)
    v3 = __p;
  else
    v3 = (void **)__p[0];
  v6 = 136315138;
  v7 = v3;
  OUTLINED_FUNCTION_1_3(&dword_18425C000, v1, v2, "%s", (uint8_t *)&v6);
  if (v5 < 0)
    operator delete(__p[0]);
}

{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v1 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 64))(a1);
  v4 = 136315138;
  v5 = v1;
  OUTLINED_FUNCTION_1_3(&dword_18425C000, v2, v3, "encoding failed for header '%s'", (uint8_t *)&v4);
}

void MMSPduEncoder::encodeHeaders(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18425C000, a1, a3, "unable to encode MMS version", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

{
  OUTLINED_FUNCTION_0(&dword_18425C000, a1, a3, "unable to encode transactionId", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

{
  OUTLINED_FUNCTION_0(&dword_18425C000, a1, a3, "unable to encode message type", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void CCMonitor::CCMonitor(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_4(&dword_18425C000, a2, a3, "CCMonitor created", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void CCMonitor::~CCMonitor(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_4(&dword_18425C000, a2, a3, "CCMonitor destroyed", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void CTServerState::sendNotification_sync(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_4(&dword_18425C000, MEMORY[0x1E0C81028], a3, "Missing server connection for %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1_1();
}

{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_4(&dword_18425C000, MEMORY[0x1E0C81028], a3, "Dropping notification %@ because a runloop and client queue aren't setup", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1_1();
}

void loadBundle(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18425C000, a1, a3, "Failed to get c-string from the bundle path", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

{
  OUTLINED_FUNCTION_0(&dword_18425C000, a1, a3, "Non bundle type object in bundles dictionary", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void loadBundle(char *a1, _QWORD *a2, NSObject *a3)
{
  _QWORD *v3;
  int v4;
  _QWORD *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (*a1 >= 0)
    v3 = a2;
  else
    v3 = (_QWORD *)*a2;
  v4 = 136446210;
  v5 = v3;
  OUTLINED_FUNCTION_4(&dword_18425C000, a3, (uint64_t)a3, "Not able to load the bundle with URL %{public}s", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1_1();
}

void ___ZL24_CTServerConnectXpc_syncP13CTServerStateP16dispatch_queue_sU13block_pointerFvvE_block_invoke_cold_1(const char *a1, NSObject *a2, uint64_t a3)
{
  const char *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = "<null>";
  if (a1)
    v3 = a1;
  v4 = 136315138;
  v5 = v3;
  OUTLINED_FUNCTION_4(&dword_18425C000, a2, a3, "Got unexpected XPC client message: %s", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1_1();
}

void ___ZL19sHandleNotificationP13CTServerStateN3xpc4dictE_block_invoke_cold_1(xpc::object *a1)
{
  uint64_t v1;
  void *p_p;
  void *__p;
  char v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  xpc::object::to_string(a1);
  if (v4 >= 0)
    p_p = &__p;
  else
    p_p = __p;
  v5 = 136315138;
  v6 = p_p;
  OUTLINED_FUNCTION_4(&dword_18425C000, MEMORY[0x1E0C81028], v1, "CF conversion failed: %s", (uint8_t *)&v5);
  if (v4 < 0)
    operator delete(__p);
}

void _CTServerConnectionSendSafetyAlertCustomCommand_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18425C000, MEMORY[0x1E0C81028], a3, "Invalid reply for Early Geofence Command", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void _CTServerConnectionSelfTestCommand_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18425C000, MEMORY[0x1E0C81028], a3, "Invalid reply for Self Test Command", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void _CTServerConnectionInjectOOSGeofence_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18425C000, MEMORY[0x1E0C81028], a3, "Injecting oos geofence failed", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void _CTServerConnectionGetVoiceMailAvailable_cold_1(int a1, int a2)
{
  _DWORD v2[2];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109376;
  v2[1] = a1;
  v3 = 1024;
  v4 = a2;
  _os_log_error_impl(&dword_18425C000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "_CTServerConnectionGetVoiceMailAvailable error: %d, domain: %d", (uint8_t *)v2, 0xEu);
}

void _CTServerConnectionGetCellularDataIsEnabled_cold_1(int a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109376;
  v3[1] = a1;
  v4 = 1024;
  v5 = a2;
  _os_log_error_impl(&dword_18425C000, log, OS_LOG_TYPE_ERROR, "Could not call _CTServerConnectionGetCellularDataIsEnabled() domain=%d error=%d)", (uint8_t *)v3, 0xEu);
}

void `anonymous namespace'::sMaybeLogMobileEquipmentDictionary(ctu::cf::CFSharedRef<__CFDictionary const>)::$_0::operator()(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 136315394;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_18425C000, log, OS_LOG_TYPE_DEBUG, "%s: %@", (uint8_t *)&v3, 0x16u);
}

void _CTServerConnectionCopyPhoneNumber_cold_1(int a1)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_debug_impl(&dword_18425C000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Phone number index %d not found", (uint8_t *)v1, 8u);
}

uint64_t Lazuli::MessageGroupFileTransferPush::MessageGroupFileTransferPush(uint64_t a1, uint64_t a2)
{
  if (*(char *)(a1 + 511) < 0)
    operator delete(*(void **)(a1 + 488));
  if (*(char *)(a1 + 487) < 0)
    operator delete(*(void **)(a1 + 464));
  if (*(char *)(a1 + 463) < 0)
    operator delete(*(void **)(a1 + 440));
  if (*(char *)(a1 + 439) < 0)
    operator delete(*(void **)(a1 + 416));
  return std::__optional_destruct_base<Lazuli::FileThumbnailInformation,false>::~__optional_destruct_base[abi:nn180100](a2);
}

void Lazuli::MessageChatBotCard::MessageChatBotCard(uint64_t a1, uint64_t a2)
{
  if (*(_BYTE *)(a1 + 288) && *(char *)(a1 + 287) < 0)
    operator delete(*(void **)(a1 + 264));
  if (*(_BYTE *)(a1 + 256) && *(char *)(a1 + 255) < 0)
    operator delete(*(void **)(a1 + 232));
  std::__optional_destruct_base<Lazuli::ChatBotCardMedia,false>::~__optional_destruct_base[abi:nn180100](a2);
  if (*(_BYTE *)(a1 + 40))
  {
    if (*(char *)(a1 + 39) < 0)
      operator delete(*(void **)(a1 + 16));
  }
}

void Lazuli::FileTransferDescriptor::FileTransferDescriptor(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  if (*(char *)(a1 + 167) < 0)
    operator delete(*(void **)(a1 + 144));
  if (*(char *)(a1 + 143) < 0)
    operator delete(*(void **)(a1 + 120));
  if (*(char *)(a1 + 119) < 0)
    operator delete(*(void **)(a1 + 96));
  *(_QWORD *)a4 = a2;
  *(_DWORD *)(a4 + 8) = a3;
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x1E0C97C98](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
  MEMORY[0x1E0C97CB0](allocator, ptr);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1E0C97D20](allocator, values, numValues, callBacks);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x1E0C97D30](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D50](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1E0C97D78](theArray, range.location, range.length, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1E0C97D90]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
  MEMORY[0x1E0C97DB8](theArray);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
  MEMORY[0x1E0C97DC0](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x1E0C980D0](allocator, bundleURL);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1E0C98120](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x1E0C98150]();
}

CFTypeID CFBundleGetTypeID(void)
{
  return MEMORY[0x1E0C98170]();
}

uint64_t CFCopyHomeDirectoryURLForUser()
{
  return MEMORY[0x1E0C98368]();
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1E0C983A0](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1E0C98418]();
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x1E0C98448](allocator, at);
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x1E0C98460](allocator, locale, dateStyle, timeStyle);
}

CFDateRef CFDateFormatterCreateDateFromString(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFStringRef string, CFRange *rangep)
{
  return (CFDateRef)MEMORY[0x1E0C98478](allocator, formatter, string, rangep);
}

void CFDateFormatterSetFormat(CFDateFormatterRef formatter, CFStringRef formatString)
{
  MEMORY[0x1E0C984C0](formatter, formatString);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98500](theDict, key, value);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x1E0C98508](theDict, applier, context);
}

Boolean CFDictionaryContainsValue(CFDictionaryRef theDict, const void *value)
{
  return MEMORY[0x1E0C98520](theDict, value);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98530](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98558](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1E0C98570](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
  MEMORY[0x1E0C985A0](theDict, keys, values);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1E0C985A8]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x1E0C985C8](theDict, key, value);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x1E0C985E8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFTypeID CFErrorGetTypeID(void)
{
  return MEMORY[0x1E0C98678]();
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x1E0C98718](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1E0C98758](cf);
}

CFMachPortRef CFMachPortCreateWithPort(CFAllocatorRef allocator, mach_port_t portNum, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMachPortRef)MEMORY[0x1E0C98820](allocator, *(_QWORD *)&portNum, callout, context, shouldFreeInfo);
}

void CFMachPortInvalidate(CFMachPortRef port)
{
  MEMORY[0x1E0C98840](port);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988D0]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x1E0C988E0](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
  MEMORY[0x1E0C988F0](center, observer);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

CFNumberFormatterRef CFNumberFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFNumberFormatterStyle style)
{
  return (CFNumberFormatterRef)MEMORY[0x1E0C98938](allocator, locale, style);
}

CFNumberRef CFNumberFormatterCreateNumberFromString(CFAllocatorRef allocator, CFNumberFormatterRef formatter, CFStringRef string, CFRange *rangep, CFOptionFlags options)
{
  return (CFNumberRef)MEMORY[0x1E0C98940](allocator, formatter, string, rangep, options);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AD0](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C30]();
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
  MEMORY[0x1E0C98C80](rl, mode, block);
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
  MEMORY[0x1E0C98D68](rl);
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x1E0C98D80](theSet, value);
}

CFSetRef CFSetCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFSetCallBacks *callBacks)
{
  return (CFSetRef)MEMORY[0x1E0C98D88](allocator, values, numValues, callBacks);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x1E0C98ED8](theString, appendedString);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  MEMORY[0x1E0C98EF0](theString, formatOptions, format);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFComparisonResult CFStringCompareWithOptions(CFStringRef theString1, CFStringRef theString2, CFRange rangeToCompare, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F18](theString1, theString2, rangeToCompare.location, rangeToCompare.length, compareOptions);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1E0C98F78](alloc, theString);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F98](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1E0C98FB8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x1E0C99030](alloc, str, range.location, range.length);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3;
  CFIndex v4;
  CFRange result;

  v3 = MEMORY[0x1E0C99050](theString, stringToFind, compareOptions);
  result.length = v4;
  result.location = v3;
  return result;
}

Boolean CFStringFindWithOptions(CFStringRef theString, CFStringRef stringToFind, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x1E0C99068](theString, stringToFind, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1E0C99080](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x1E0C990F0](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x1E0C992D8](anURL, pathStyle);
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1E0C993C8](allocator, buffer, bufLen, isDirectory);
}

CFURLRef CFURLCreateWithBytes(CFAllocatorRef allocator, const UInt8 *URLBytes, CFIndex length, CFStringEncoding encoding, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1E0C99418](allocator, URLBytes, length, *(_QWORD *)&encoding, baseURL);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1E0C99448](allocator, URLString, baseURL);
}

CFUUIDRef CFUUIDCreateFromString(CFAllocatorRef alloc, CFStringRef uuidStr)
{
  return (CFUUIDRef)MEMORY[0x1E0C99520](alloc, uuidStr);
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x1E0C99530](alloc, *(_QWORD *)&bytes.byte0, *(_QWORD *)&bytes.byte8);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1E0C99538](alloc, uuid);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1;
  uint64_t v2;
  CFUUIDBytes result;

  v1 = MEMORY[0x1E0C99568](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

uint64_t CUTWeakLinkClass()
{
  return MEMORY[0x1E0D131E0]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x1E0C80940](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

const char *__cdecl _Block_signature(void *aBlock)
{
  return (const char *)MEMORY[0x1E0C80960](aBlock);
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1E0C9A498]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1E0C9A4B0]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x1E0C9A800]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x1E0C9A818]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t ctu::OsLogLogger::OsLogLogger(ctu::OsLogLogger *this, const char *a2, const char *a3)
{
  return MEMORY[0x1E0DE3730](this, a2, a3);
}

uint64_t ctu::OsLogLogger::OsLogLogger(ctu::OsLogLogger *this, const ctu::OsLogLogger *a2)
{
  return MEMORY[0x1E0DE3740](this, a2);
}

void ctu::OsLogLogger::~OsLogLogger(ctu::OsLogLogger *this)
{
  MEMORY[0x1E0DE3748](this);
}

uint64_t ctu::cf::convert_copy()
{
  return MEMORY[0x1E0DE3870]();
}

uint64_t ctu::cf::assign()
{
  return MEMORY[0x1E0DE38B8]();
}

{
  return MEMORY[0x1E0DE38C0]();
}

uint64_t ctu::cf::assign(ctu::cf *this, BOOL *a2, const __CFBoolean *a3)
{
  return MEMORY[0x1E0DE38D8](this, a2, a3);
}

uint64_t ctu::cf::assign(ctu::cf *this, uint64_t *a2, const __CFNumber *a3)
{
  return MEMORY[0x1E0DE3918](this, a2, a3);
}

uint64_t ctu::hex(ctu *this, const void *a2)
{
  return MEMORY[0x1E0DE3980](this, a2);
}

uint64_t ctu::hex()
{
  return MEMORY[0x1E0DE3988]();
}

uint64_t ctu::cf_to_xpc(ctu *this, const void *a2)
{
  return MEMORY[0x1E0DE3A40](this, a2);
}

uint64_t ctu::xpc_to_cf(ctu *this, void *a2)
{
  return MEMORY[0x1E0DE3A48](this, a2);
}

uint64_t xpc::dyn_cast_or_default()
{
  return MEMORY[0x1E0DE3A80]();
}

uint64_t xpc::dyn_cast_or_default(xpc *this, const object *a2)
{
  return MEMORY[0x1E0DE3A90](this, a2);
}

{
  return MEMORY[0x1E0DE3AA0](this, a2);
}

{
  return MEMORY[0x1E0DE3AA8](this, a2);
}

{
  return MEMORY[0x1E0DE3AB0](this, a2);
}

{
  return MEMORY[0x1E0DE3AB8](this, a2);
}

{
  return MEMORY[0x1E0DE3AC0](this, a2);
}

uint64_t xpc::dyn_cast_or_default(xpc *this, const object *a2, double a3)
{
  return MEMORY[0x1E0DE3A98](this, a2, a3);
}

uint64_t xpc::bridge(xpc *this, const object *a2)
{
  return MEMORY[0x1E0DE3AC8](this, a2);
}

uint64_t xpc::object::to_string(xpc::object *this)
{
  return MEMORY[0x1E0DE3B48](this);
}

std::string::size_type std::string::find(const std::string *this, std::string::value_type __c, std::string::size_type __pos)
{
  return MEMORY[0x1E0DE41C8](this, __c, __pos);
}

int std::string::compare(const std::string *this, const std::string::value_type *__s)
{
  return MEMORY[0x1E0DE41D8](this, __s);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1E0DE4248](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1E0DE4258](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1E0DE43E8](__n);
}

void std::string::__grow_by_and_replace(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add, const std::string::value_type *__p_new_stuff)
{
  MEMORY[0x1E0DE43F8](this, __old_cap, __delta_cap, __old_sz, __n_copy, __n_del, __n_add, __p_new_stuff);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4428](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4470](this, __pos, __s, __n);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  MEMORY[0x1E0DE4480](this, __n, __c);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x1E0DE44B8](this, __c);
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x1E0DE44C8](this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1E0DE44D8](this, __str);
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x1E0DE4608]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x1E0DE4628]();
}

uint64_t std::istream::operator>>()
{
  return MEMORY[0x1E0DE4638]();
}

{
  return MEMORY[0x1E0DE4668]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1E0DE46B0]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1E0DE46B8]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x1E0DE46C8]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1E0DE4708]();
}

{
  return MEMORY[0x1E0DE4710]();
}

{
  return MEMORY[0x1E0DE4728]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1E0DE47E0]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1E0DE47E8]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE48F0](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE4900](this);
}

void std::__libcpp_verbose_abort(const char *__format, ...)
{
  MEMORY[0x1E0DE4930](__format);
}

void std::mutex::~mutex(std::mutex *this)
{
  MEMORY[0x1E0DE4AB8](this);
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x1E0DE4B98](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x1E0DE4C68](this, __sb);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x1E0DE4C80](this, *(_QWORD *)&__state);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x1E0DE4D28]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, uint64_t __val)
{
  return (std::string *)MEMORY[0x1E0DE4D68](retstr, __val);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

uint64_t operator delete[]()
{
  return off_1E152B6E8();
}

void operator delete(void *__p)
{
  off_1E152B6F0(__p);
}

uint64_t operator delete()
{
  return off_1E152B6F8();
}

uint64_t operator new[]()
{
  return off_1E152B700();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E152B708(__sz);
}

uint64_t operator new()
{
  return off_1E152B710();
}

uint64_t __NSMakeSpecialForwardingCaptureBlock()
{
  return MEMORY[0x1E0C9AA78]();
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1E0C80B50](*(_QWORD *)&a1, a2);
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1E0C80C70](*(_QWORD *)&a1);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1E0C80C78](*(_QWORD *)&a1);
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1E0C80FC0](dso, description, activity, *(_QWORD *)&flags);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _os_nospin_lock_lock()
{
  return MEMORY[0x1E0C81080]();
}

uint64_t _os_nospin_lock_unlock()
{
  return MEMORY[0x1E0C81090]();
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x1E0C82C18](queue, context, work);
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x1E0C82CB0](buffer, size, queue, destructor);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
  MEMORY[0x1E0C82E10](predicate, context, function);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1E0C82E58](queue);
}

dispatch_qos_class_t dispatch_queue_get_qos_class(dispatch_queue_t queue, int *relative_priority_ptr)
{
  return MEMORY[0x1E0C82E60](queue, relative_priority_ptr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA8](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_set_context(dispatch_object_t object, void *context)
{
  MEMORY[0x1E0C82EE0](object, context);
}

void dispatch_set_finalizer_f(dispatch_object_t object, dispatch_function_t finalizer)
{
  MEMORY[0x1E0C82EE8](object, finalizer);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1E0C83370](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1E0C83778]();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x1E0C83790](a1);
}

tm *__cdecl gmtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1E0C83860](a1, a2);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1E0C83CF8](*(_QWORD *)&task, *(_QWORD *)&name);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x1E0C83D58](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&right, *(_QWORD *)&delta);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C84070](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

uint64_t network_usage_policy_create_client()
{
  return MEMORY[0x1E0DE55E8]();
}

uint64_t network_usage_policy_destroy_client()
{
  return MEMORY[0x1E0DE55F8]();
}

uint64_t network_usage_policy_set_changed_handler()
{
  return MEMORY[0x1E0DE5628]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x1E0C843F0](*(_QWORD *)&val);
}

void nw_connection_cancel(nw_connection_t connection)
{
  MEMORY[0x1E0CCEFB8](connection);
}

nw_connection_t nw_connection_create(nw_endpoint_t endpoint, nw_parameters_t parameters)
{
  return (nw_connection_t)MEMORY[0x1E0CCF030](endpoint, parameters);
}

void nw_connection_receive_message(nw_connection_t connection, nw_connection_receive_completion_t completion)
{
  MEMORY[0x1E0CCF130](connection, completion);
}

void nw_connection_send(nw_connection_t connection, dispatch_data_t content, nw_content_context_t context, BOOL is_complete, nw_connection_send_completion_t completion)
{
  MEMORY[0x1E0CCF168](connection, content, context, is_complete, completion);
}

void nw_connection_set_queue(nw_connection_t connection, dispatch_queue_t queue)
{
  MEMORY[0x1E0CCF1B0](connection, queue);
}

void nw_connection_set_state_changed_handler(nw_connection_t connection, nw_connection_state_changed_handler_t handler)
{
  MEMORY[0x1E0CCF1C0](connection, handler);
}

void nw_connection_start(nw_connection_t connection)
{
  MEMORY[0x1E0CCF1D8](connection);
}

nw_endpoint_t nw_endpoint_create_host(const char *hostname, const char *port)
{
  return (nw_endpoint_t)MEMORY[0x1E0CCF3B0](hostname, port);
}

nw_protocol_definition_t nw_framer_create_definition(const char *identifier, uint32_t flags, nw_framer_start_handler_t start_handler)
{
  return (nw_protocol_definition_t)MEMORY[0x1E0CCF5E8](identifier, *(_QWORD *)&flags, start_handler);
}

nw_protocol_options_t nw_framer_create_options(nw_protocol_definition_t framer_definition)
{
  return (nw_protocol_options_t)MEMORY[0x1E0CCF5F0](framer_definition);
}

void nw_framer_mark_failed_with_error(nw_framer_t framer, int error_code)
{
  MEMORY[0x1E0CCF600](framer, *(_QWORD *)&error_code);
}

void nw_framer_mark_ready(nw_framer_t framer)
{
  MEMORY[0x1E0CCF608](framer);
}

BOOL nw_framer_parse_input(nw_framer_t framer, size_t minimum_incomplete_length, size_t maximum_length, uint8_t *temp_buffer, nw_framer_parse_completion_t parse)
{
  return MEMORY[0x1E0CCF628](framer, minimum_incomplete_length, maximum_length, temp_buffer, parse);
}

void nw_framer_pass_through_input(nw_framer_t framer)
{
  MEMORY[0x1E0CCF630](framer);
}

void nw_framer_pass_through_output(nw_framer_t framer)
{
  MEMORY[0x1E0CCF638](framer);
}

void nw_framer_set_input_handler(nw_framer_t framer, nw_framer_input_handler_t input_handler)
{
  MEMORY[0x1E0CCF650](framer, input_handler);
}

void nw_framer_set_output_handler(nw_framer_t framer, nw_framer_output_handler_t output_handler)
{
  MEMORY[0x1E0CCF658](framer, output_handler);
}

nw_protocol_stack_t nw_parameters_copy_default_protocol_stack(nw_parameters_t parameters)
{
  return (nw_protocol_stack_t)MEMORY[0x1E0CCF8C8](parameters);
}

nw_parameters_t nw_parameters_create_secure_udp(nw_parameters_configure_protocol_block_t configure_dtls, nw_parameters_configure_protocol_block_t configure_udp)
{
  return (nw_parameters_t)MEMORY[0x1E0CCF990](configure_dtls, configure_udp);
}

uint64_t nw_parameters_set_allow_ultra_constrained()
{
  return MEMORY[0x1E0CCFA60]();
}

uint64_t nw_parameters_set_required_netagent_classes()
{
  return MEMORY[0x1E0CCFC00]();
}

uint64_t nw_path_copy_netagent_dictionary()
{
  return MEMORY[0x1E0CCFCE0]();
}

uint64_t nw_path_create_evaluator_for_endpoint()
{
  return MEMORY[0x1E0CCFD10]();
}

uint64_t nw_path_evaluator_cancel()
{
  return MEMORY[0x1E0CCFD20]();
}

uint64_t nw_path_evaluator_copy_path()
{
  return MEMORY[0x1E0CCFD38]();
}

uint64_t nw_path_evaluator_set_update_handler()
{
  return MEMORY[0x1E0CCFD58]();
}

void nw_protocol_stack_prepend_application_protocol(nw_protocol_stack_t stack, nw_protocol_options_t protocol)
{
  MEMORY[0x1E0CCFFF8](stack, protocol);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyCppObjectAtomic(void *dest, const void *src, void (__cdecl *copyHelper)(void *, const void *))
{
  MEMORY[0x1E0DE7C20](dest, src, copyHelper);
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

void objc_moveWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7D18](to, from);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84510](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84518](state);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_release(void *object)
{
  MEMORY[0x1E0C84910](object);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x1E0C84940]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x1E0C84948]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

objc_method_description *__cdecl protocol_copyMethodDescriptionList(Protocol *p, BOOL isRequiredMethod, BOOL isInstanceMethod, unsigned int *outCount)
{
  return (objc_method_description *)MEMORY[0x1E0DE8088](p, isRequiredMethod, isInstanceMethod, outCount);
}

Protocol **__cdecl protocol_copyProtocolList(Protocol *proto, unsigned int *outCount)
{
  return (Protocol **)MEMORY[0x1E0DE80A0](proto, outCount);
}

objc_method_description protocol_getMethodDescription(Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  const char *v4;
  char *v5;
  objc_method_description result;

  v4 = (const char *)MEMORY[0x1E0DE80A8](p, aSel, isRequiredMethod, isInstanceMethod);
  result.types = v5;
  result.name = v4;
  return result;
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1E0C84E68](a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C85498](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1E0C85500](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C85518](__s, *(_QWORD *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x1E0C85558](a1, a2, a3, a4);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1E0C85570](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

char *__cdecl strptime(const char *a1, const char *a2, tm *a3)
{
  return (char *)MEMORY[0x1E0C855D8](a1, a2, a3);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C855E8](__s, *(_QWORD *)&__c);
}

char *__cdecl strtok_r(char *__str, const char *__sep, char **__lasts)
{
  return (char *)MEMORY[0x1E0C85650](__str, __sep, __lasts);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85698](__str, __endptr, *(_QWORD *)&__base);
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x1E0C857D0](*(_QWORD *)&a1, a2);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1E0C85950](a1);
}

time_t timegm(tm *const a1)
{
  return MEMORY[0x1E0C85958](a1);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C85E00](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1E0C85E30](xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1E0C85E90](xarray, index);
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
  MEMORY[0x1E0C85ED0](xarray, index, string);
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return (xpc_object_t)MEMORY[0x1E0C85EF0](value);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F68](connection);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x1E0C86018](connection);
}

void xpc_connection_send_barrier(xpc_connection_t connection, dispatch_block_t barrier)
{
  MEMORY[0x1E0C86020](connection, barrier);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x1E0C86030](connection, message);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x1E0C86038](connection, message, replyq, handler);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1E0C86048](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1E0C86108](object);
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x1E0C86178](bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1E0C86198](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1E0C861A8](xdata);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1E0C861F0](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1E0C86228](original);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x1E0C86270](xdict);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1E0C86278](xdict, key, length);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x1E0C862B0](xdict);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

xpc_object_t xpc_double_create(double value)
{
  return (xpc_object_t)MEMORY[0x1E0C863D0](value);
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x1E0C86420](object1, object2);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x1E0C86568](value);
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x1E0C86628]();
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x1E0C86658](object);
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1E0C86660](object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1E0C86720](string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1E0C86758](xstring);
}

xpc_object_t xpc_uint64_create(uint64_t value)
{
  return (xpc_object_t)MEMORY[0x1E0C867B0](value);
}

const uint8_t *__cdecl xpc_uuid_get_bytes(xpc_object_t xuuid)
{
  return (const uint8_t *)MEMORY[0x1E0C867F8](xuuid);
}

