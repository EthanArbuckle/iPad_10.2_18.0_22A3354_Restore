double MKIntegralCenterForViewWithScale(void *a1, double a2, double a3, double a4)
{
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  objc_msgSend(a1, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleBounds");
  v8 = v7;
  v10 = v9;
  objc_msgSend(v6, "anchorPoint");
  v12 = floor((v8 + a2 - (v8 + v10 * v11)) * a4 + 0.00000011920929) / a4 + v10 * v11;

  return v12;
}

double MKTilePointForCoordinate(double a1, double a2, double a3)
{
  double v4;
  double v5;
  long double v6;

  if (a2 == -180.0 && a1 == -180.0 || a2 < -180.0 || a2 > 180.0 || a1 < -90.0)
    return -1.0;
  v4 = -1.0;
  if (a1 <= 90.0)
  {
    v4 = (a2 + 180.0) * 0.0174532925 * (ldexp(1.0, (int)a3) / 6.28318531) * 128.0;
    v5 = fmax(fmin(a1, 85.0), -85.0);
    if (v5 > 90.0)
      v5 = v5 + -180.0;
    if (v5 < -90.0)
      v5 = v5 + 180.0;
    v6 = sin(v5 * 0.0174532925);
    log((v6 + 1.0) / (1.0 - v6));
  }
  return v4;
}

double MKCompassViewDiameterForSize(uint64_t a1)
{
  void *v1;
  double v2;
  double v3;

  +[MKCompassView _parameterForSize:](MKCompassView, "_parameterForSize:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "diameter");
  v3 = v2;

  return v3;
}

void sub_18B0B46EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

uint64_t __depthFirstApply(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  __int128 *v5;
  __int128 v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  v11 = 0u;
  v12 = 0u;
  v5 = *(__int128 **)(a1 + 40);
  if (v5)
  {
    v6 = v5[1];
    v11 = *v5;
    v12 = v6;
  }
  v7 = (*((uint64_t (**)(id, uint64_t))v3 + 2))(v3, a1);
  if (v7)
  {
    if (v7 == 2)
      v8 = 2;
    else
      v8 = 0;
  }
  else if (v5)
  {
    v9 = 0;
    while (__depthFirstApply(*(_QWORD *)((char *)&v11 + v9), v4) != 2)
    {
      v9 += 8;
      if (v9 == 32)
        goto LABEL_11;
    }
    v8 = 2;
  }
  else
  {
LABEL_11:
    v8 = 0;
  }

  return v8;
}

void sub_18B0B4800(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18B0B4920(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18B0B4ABC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18B0B4B8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id MKGetAnnotationsLog()
{
  if (MKGetAnnotationsLog_onceToken != -1)
    dispatch_once(&MKGetAnnotationsLog_onceToken, &__block_literal_global_21);
  return (id)MKGetAnnotationsLog_log;
}

uint64_t _MKUserLocationViewBaseShadowColor()
{
  return objc_msgSend(MEMORY[0x1E0CEA478], "_mapkit_colorNamed:", CFSTR("PuckShadowColor"));
}

id _MKPuckAnnotationViewBaseColor(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  char v8;

  if ((unint64_t)(a1 - 1) < 4 || a1 == 107)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (a2)
    {
      objc_msgSend(v3, "colorWithAlphaComponent:", 0.699999988);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      return v5;
    }
  }
  else
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = ___MKPuckAnnotationViewBaseColor_block_invoke;
    v7[3] = &__block_descriptor_33_e36___UIColor_16__0__UITraitCollection_8l;
    v8 = a2;
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithDynamicProvider:", v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

void sub_18B0B5D80(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

BOOL MKMapRectIntersectsRect(MKMapRect rect1, MKMapRect rect2)
{
  if (rect1.origin.x == INFINITY && rect1.origin.y == INFINITY)
    return 0;
  if (rect2.origin.x == INFINITY && rect2.origin.y == INFINITY)
    return 0;
  if (rect1.origin.x >= rect2.origin.x)
  {
    if (rect2.origin.x + rect2.size.width <= rect1.origin.x)
      return 0;
  }
  else if (rect1.origin.x + rect1.size.width <= rect2.origin.x)
  {
    return 0;
  }
  if (rect1.origin.y >= rect2.origin.y)
  {
    if (rect2.origin.y + rect2.size.height <= rect1.origin.y)
      return 0;
  }
  else if (rect1.origin.y + rect1.size.height <= rect2.origin.y)
  {
    return 0;
  }
  return 1;
}

BOOL MKMapRectContainsRect(MKMapRect rect1, MKMapRect rect2)
{
  BOOL v4;
  BOOL v5;
  BOOL result;

  if (rect2.origin.x == INFINITY && rect2.origin.y == INFINITY)
    return 1;
  v4 = rect1.origin.y == INFINITY && rect1.origin.x == INFINITY || rect1.origin.x > rect2.origin.x;
  result = !v4
        && (rect1.origin.x + rect1.size.width >= rect2.origin.x + rect2.size.width
          ? (v5 = rect1.origin.y > rect2.origin.y)
          : (v5 = 1),
            !v5)
        && rect1.origin.y + rect1.size.height >= rect2.origin.y + rect2.size.height;
  return result;
}

MKMapPoint MKMapPointForCoordinate(CLLocationCoordinate2D coordinate)
{
  double v1;
  double v2;
  MKMapPoint result;

  v1 = MKTilePointForCoordinate(coordinate.latitude, coordinate.longitude, 21.0);
  result.y = v2;
  result.x = v1;
  return result;
}

BOOL ___notifyOnSizeChange_block_invoke()
{
  _BOOL8 result;

  result = _MKLinkedOnOrAfterReleaseSet(3081);
  _MergedGlobals_9 = result;
  return result;
}

double MKIntegralCenterForView(void *a1, double a2)
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  objc_msgSend(a1, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_currentScreenScale");
  v6 = v5;
  objc_msgSend(v4, "doubleBounds");
  v8 = v7;
  v10 = v9;
  objc_msgSend(v4, "anchorPoint");
  v12 = floor((v8 + a2 - (v8 + v10 * v11)) * v6 + 0.00000011920929) / v6 + v10 * v11;

  return v12;
}

void sub_18B0B78D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _MKModernPuckDesignEnabled()
{
  uint64_t result;

  result = _MKLinkedOnOrAfterReleaseSet(2824);
  if ((_DWORD)result)
    return GEOConfigGetBOOL();
  return result;
}

BOOL _MKLinkedOnOrAfterReleaseSet(__int16 a1)
{
  __int16 v2;
  uint64_t v3;
  int v4;
  unsigned int v5;

  if (qword_1ECE2DBD8 != -1)
    dispatch_once(&qword_1ECE2DBD8, &__block_literal_global_99);
  v2 = (a1 & 0xFF00) + 256;
  if (HIBYTE(v2) > 0x10u)
  {
    v4 = 0;
    v5 = -268435456;
  }
  else
  {
    v3 = SHIBYTE(v2);
    v4 = dword_18B2A9F70[SHIBYTE(v2)];
    v5 = dword_18B2A9FB4[v3];
  }
  return dword_1ECE2DB70 == v4 && *(_DWORD *)algn_1ECE2DB74 >= v5;
}

BOOL MapKitIdiomIsMacCatalyst()
{
  void *v0;
  _BOOL8 v1;

  +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom") == 2;

  return v1;
}

id _MKLocalizedStringFromThisBundle(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0CB34D0];
  v2 = a1;
  objc_msgSend(v1, "_mapkitBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_mapkit_localizedStringForKey:value:table:", v2, CFSTR("<unlocalized>"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void sub_18B0BA674(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

uint64_t _MKCartographicConfigurationForMapType@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_QWORD *)(a2 + 48) = 0;
  *(_OWORD *)(a2 + 16) = 0u;
  v2 = (_QWORD *)(a2 + 16);
  *(_QWORD *)(a2 + 8) = 1;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = 1;
  *(_QWORD *)(a2 + 16) = 0;
  switch(result)
  {
    case 'f':
      v3 = 3;
      goto LABEL_11;
    case 'g':
      return result;
    case 'h':
      v3 = 4;
      goto LABEL_11;
    case 'i':
      *(_BYTE *)(a2 + 48) = 1;
      return result;
    case 'j':
      *(_QWORD *)a2 = 1;
      *(_BYTE *)(a2 + 48) = 1;
      return result;
    case 'k':
      v4 = 2;
LABEL_15:
      *(_QWORD *)a2 = v4;
      return result;
    case 'l':
      v3 = 2;
LABEL_11:
      *(_QWORD *)(a2 + 8) = v3;
      break;
    case 'm':
      *(_QWORD *)(a2 + 8) = 0;
      *(_QWORD *)(a2 + 32) = 2;
      break;
    case 'n':
      *(_QWORD *)(a2 + 8) = 0;
      *(_OWORD *)(a2 + 32) = xmmword_18B2A9890;
      break;
    default:
      switch(result)
      {
        case 0:
          result = GEOConfigGetBOOL();
          if ((_DWORD)result)
            *v2 = 1;
          break;
        case 1:
          *(_OWORD *)a2 = xmmword_18B2A9880;
          break;
        case 2:
          v4 = 1;
          goto LABEL_15;
        case 3:
          *(_OWORD *)a2 = xmmword_18B2A9880;
          *(int64x2_t *)(a2 + 16) = vdupq_n_s64(1uLL);
          break;
        case 4:
          *(_QWORD *)a2 = 1;
          *(int64x2_t *)(a2 + 16) = vdupq_n_s64(1uLL);
          break;
        case 5:
          *(_QWORD *)(a2 + 8) = 0;
          break;
        default:
          return result;
      }
      break;
  }
  return result;
}

BOOL ___filterLabelMarkersPredicate_block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

void __Block_byref_object_dispose__9(uint64_t a1)
{

}

void __Block_byref_object_dispose__10(uint64_t a1)
{

}

void __Block_byref_object_dispose__11(uint64_t a1)
{

}

void __Block_byref_object_dispose__12(uint64_t a1)
{

}

void __Block_byref_object_dispose__14(uint64_t a1)
{

}

void __Block_byref_object_dispose__15(uint64_t a1)
{

}

void __Block_byref_object_dispose__16(uint64_t a1)
{

}

void __Block_byref_object_dispose__17(uint64_t a1)
{

}

void __Block_byref_object_dispose__18(uint64_t a1)
{

}

void __Block_byref_object_dispose__19(uint64_t a1)
{

}

void __Block_byref_object_dispose__20(uint64_t a1)
{

}

void __Block_byref_object_dispose__21(uint64_t a1)
{

}

void __Block_byref_object_dispose__22(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(_QWORD *)(a1 + 56) = v2;
    operator delete(v2);
  }
}

void __Block_byref_object_dispose__23(uint64_t a1)
{

}

void __Block_byref_object_dispose__24(uint64_t a1)
{

}

{

}

void __Block_byref_object_dispose__25(uint64_t a1)
{

}

void __Block_byref_object_dispose__26(uint64_t a1)
{

}

void sub_18B0BE384(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id MKGetMKDefaultLog()
{
  if (MKGetMKDefaultLog_onceToken != -1)
    dispatch_once(&MKGetMKDefaultLog_onceToken, &__block_literal_global_35);
  return (id)MKGetMKDefaultLog_log;
}

void sub_18B0BF518(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_18B0C005C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id MKGetApplicationStateMonitorLog()
{
  if (qword_1ECE2DD50 != -1)
    dispatch_once(&qword_1ECE2DD50, &__block_literal_global_79);
  return (id)qword_1ECE2DD48;
}

double MKDefaultCoordinateRegion()
{
  void *v0;
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  double v6;
  _QWORD block[4];
  void *v9;

  objc_msgSend(MEMORY[0x1E0D27008], "sharedConfiguration");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "countryCode");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __MKDefaultCoordinateRegion_block_invoke;
  block[3] = &unk_1E20D7D98;
  v9 = v1;
  v2 = _MergedGlobals_168;
  v3 = v1;
  v4 = v3;
  if (v2 == -1)
  {
    v5 = v3;
  }
  else
  {
    dispatch_once(&_MergedGlobals_168, block);
    v5 = v9;
  }
  v6 = *(double *)&xmmword_1ECE2DDA0;

  return v6;
}

void sub_18B0C2B18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id MKGetMKMapViewLog()
{
  if (qword_1EDFB79F0 != -1)
    dispatch_once(&qword_1EDFB79F0, &__block_literal_global_1785);
  return (id)qword_1EDFB79E8;
}

uint64_t _MKMapTypeForCartographicConfiguration(uint64_t *a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint8_t v5[16];

  if (!a1)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_fault_impl(&dword_18B0B0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: configuration != ((void *)0)", v5, 2u);
    }
    return 0;
  }
  v2 = *a1;
  if (*a1 == 2)
    return 107;
  if (v2 == 1)
  {
    if (*((_BYTE *)a1 + 48))
      return 106;
    v4 = a1[1];
    if ((unint64_t)(v4 - 1) >= 4)
    {
      if (v4)
      {
        return 2;
      }
      else if (a1[2] == 1)
      {
        return 3;
      }
      else
      {
        return 1;
      }
    }
    else if (a1[2] == 1)
    {
      return 4;
    }
    else
    {
      return 2;
    }
  }
  if (v2)
    return 0;
  if (*((_BYTE *)a1 + 48))
    return 105;
  result = 0;
  switch(a1[1])
  {
    case 0:
      if (a1[4] == 2)
      {
        if (a1[5] == 1)
          result = 110;
        else
          result = 109;
      }
      else
      {
        result = 5;
      }
      break;
    case 2:
      result = 108;
      break;
    case 3:
      result = 102;
      break;
    case 4:
      result = 104;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t _VKMapTypeForMKCartographicConfiguration(uint64_t *a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  unsigned int v4;
  uint64_t v5;
  unint64_t v6;
  unsigned int v7;
  int v8;
  unsigned int v9;
  uint8_t v10[16];

  if (!a1)
  {
    result = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
    if (!(_DWORD)result)
      return result;
    *(_WORD *)v10 = 0;
    _os_log_fault_impl(&dword_18B0B0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: configuration != ((void *)0)", v10, 2u);
    return 0;
  }
  v1 = *a1;
  if (*a1 == 2)
    return 11;
  if (v1 != 1)
  {
    if (!v1)
    {
      if (*((_BYTE *)a1 + 48))
        return 6;
      v3 = a1[1];
      if (v3 == 3)
        v4 = 5;
      else
        v4 = 0;
      if (v3 == 4)
        return 8;
      else
        return v4;
    }
    return 0;
  }
  if (*((_BYTE *)a1 + 48))
    return 7;
  v5 = a1[1];
  v6 = v5 - 1;
  if (a1[2] == 1)
    v7 = 4;
  else
    v7 = 2;
  if (a1[2] == 1)
    v8 = 3;
  else
    v8 = 1;
  if (v5)
    v9 = 1;
  else
    v9 = v8;
  if (v6 >= 4)
    return v9;
  else
    return v7;
}

uint64_t _VKTerrainModeForMKCartographicConfiguration(uint64_t a1)
{
  uint8_t v2[16];

  if (a1)
  {
    if ((unint64_t)(*(_QWORD *)(a1 + 24) - 1) >= 3)
      return 0;
    else
      return *(_QWORD *)(a1 + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v2 = 0;
      _os_log_fault_impl(&dword_18B0B0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: configuration != ((void *)0)", v2, 2u);
    }
    return 0;
  }
}

uint64_t _VKMapKitUsageForMKCartographicConfiguration(uint64_t a1)
{
  unint64_t v1;
  uint8_t v3[16];

  if (a1)
  {
    v1 = *(_QWORD *)(a1 + 32);
    if (v1 >= 3)
      LOBYTE(v1) = 1;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_fault_impl(&dword_18B0B0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: configuration != ((void *)0)", v3, 2u);
    }
    LOBYTE(v1) = 1;
  }
  return v1;
}

BOOL _VKMapKitClientModeForMKCartographicConfiguration(uint64_t a1)
{
  _BOOL8 result;
  uint8_t v2[16];

  if (a1)
    return *(_QWORD *)(a1 + 40) == 1;
  result = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
  if (result)
  {
    *(_WORD *)v2 = 0;
    _os_log_fault_impl(&dword_18B0B0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: configuration != ((void *)0)", v2, 2u);
    return 0;
  }
  return result;
}

uint64_t _VKEmphasisForMKCartographicConfiguration(_QWORD *a1)
{
  unsigned __int8 v1;
  uint8_t v3[16];

  if (!a1)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_fault_impl(&dword_18B0B0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: configuration != ((void *)0)", v3, 2u);
    }
    return 1;
  }
  if ((unint64_t)(*a1 - 1) < 2)
    return 2;
  if (*a1)
    return 1;
  v1 = 0;
  switch(a1[1])
  {
    case 0:
    case 4:
      return v1;
    case 1:
      if (MapsFeature_IsAvailable_Maps298())
        v1 = 2;
      else
        v1 = 1;
      break;
    default:
      return 1;
  }
  return v1;
}

BOOL _MKCartographicConfigurationEquals(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)a1 == *(_QWORD *)a2
      && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8)
      && *(_QWORD *)(a1 + 16) == *(_QWORD *)(a2 + 16)
      && *(_QWORD *)(a1 + 24) == *(_QWORD *)(a2 + 24)
      && *(_QWORD *)(a1 + 32) == *(_QWORD *)(a2 + 32)
      && *(_QWORD *)(a1 + 40) == *(_QWORD *)(a2 + 40)
      && *(unsigned __int8 *)(a1 + 48) == *(unsigned __int8 *)(a2 + 48);
}

uint64_t MKCompassPointNEWSForHeading(double a1)
{
  uint64_t result;
  unint64_t v2;
  unint64_t v3;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  if (a1 < 0.0 || a1 >= 360.0)
  {
    a1 = fmod(a1, 360.0);
    if (a1 < 0.0)
      a1 = a1 + 360.0;
  }
  result = 0;
  if (a1 >= 0.0 && a1 < 360.0)
  {
    v2 = llround(a1 / 360.0 * 4.0);
    v3 = v2 & 3;
    v5 = -(uint64_t)v2;
    v4 = v5 < 0;
    v6 = v5 & 3;
    if (v4)
      v7 = v3;
    else
      v7 = -v6;
    if ((v7 & 0x8000000000000000) != 0)
      return 0;
    else
      return __const_MKCompassPointNEWSFromLocationDirection_quad[v7];
  }
  return result;
}

id MKLocalizedAbbreviationForCompassPointNEWS(int a1)
{
  if ((a1 - 1) > 3)
    return 0;
  _MKLocalizedStringFromThisBundle(off_1E20DB250[a1 - 1]);
  return (id)objc_claimAutoreleasedReturnValue();
}

id MKGetMKLocationManagerLog()
{
  if (qword_1ECE2D8D0 != -1)
    dispatch_once(&qword_1ECE2D8D0, &__block_literal_global_475);
  return (id)qword_1ECE2D8C8;
}

void sub_18B0CC574(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v5;

  _Unwind_Resume(a1);
}

void sub_18B0CC620(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18B0CCE38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18B0CDE2C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id _filterLabelMarkersPredicate()
{
  if (qword_1EDFB7A00 != -1)
    dispatch_once(&qword_1EDFB7A00, &__block_literal_global_1794);
  return (id)qword_1EDFB7A08;
}

void sub_18B0CE968(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18B0CEAE4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18B0CEBE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

MKMapRect MKMapRectIntersection(MKMapRect rect1, MKMapRect rect2)
{
  double width;
  double x;
  double v4;
  double v5;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  MKMapRect result;

  width = rect1.size.width;
  x = rect1.origin.x;
  v4 = 0.0;
  v5 = INFINITY;
  if (x != INFINITY || rect1.origin.y != INFINITY)
  {
    v5 = INFINITY;
    if (rect2.origin.x != INFINITY || rect2.origin.y != INFINITY)
    {
      if (x <= rect2.origin.x)
        v5 = rect2.origin.x;
      else
        v5 = x;
      v8 = x + width;
      v9 = rect2.origin.x + rect2.size.width;
      if (v8 >= v9)
        v10 = v9;
      else
        v10 = v8;
      if (v5 <= v10)
      {
        v11 = rect1.origin.y <= rect2.origin.y ? rect2.origin.y : rect1.origin.y;
        v12 = rect1.origin.y + rect1.size.height;
        if (v12 >= rect2.origin.y + rect2.size.height)
          v12 = rect2.origin.y + rect2.size.height;
        if (v11 <= v12)
        {
          v4 = v10 - v5;
          v13 = v12 - v11;
          goto LABEL_24;
        }
      }
      v5 = INFINITY;
    }
  }
  v11 = INFINITY;
  v13 = 0.0;
LABEL_24:
  v14 = v11;
  result.size.height = v13;
  result.size.width = v4;
  result.origin.y = v14;
  result.origin.x = v5;
  return result;
}

void ___filterLabelMarkersPredicate_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_1797);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1EDFB7A08;
  qword_1EDFB7A08 = v0;

}

uint64_t std::__introsort<std::_ClassicAlgPolicy,_MKSpatialHorzComp &,MKAnnotationView **,false>(uint64_t result, uint64_t *a2, uint64_t a3, char a4)
{
  uint64_t *v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  double v18;
  uint64_t j;
  uint64_t v20;
  double v21;
  uint64_t *v23;
  unint64_t v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  double v28;
  uint64_t *v30;
  unint64_t v31;
  double v32;
  uint64_t v34;
  unint64_t v35;
  uint64_t *v36;
  double v37;
  double v38;
  uint64_t *v40;
  double v41;
  BOOL v43;
  uint64_t v44;
  double v45;
  uint64_t *v46;
  uint64_t v47;
  double v48;
  uint64_t *i;
  BOOL v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  double v55;
  uint64_t *v56;
  double v57;
  uint64_t v59;
  double v60;
  uint64_t *v62;
  uint64_t *v63;
  uint64_t v64;
  double v65;
  uint64_t v67;
  double v68;
  uint64_t v69;
  double v70;
  BOOL v71;
  uint64_t *v72;
  BOOL v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t v79;
  double v80;
  double v81;
  BOOL v82;
  uint64_t *v83;
  uint64_t v84;
  double v85;
  uint64_t v86;
  double v87;
  int64_t v89;
  int64_t v90;
  int64_t v91;
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  double v95;
  double v96;
  BOOL v97;
  uint64_t *v98;
  uint64_t v99;
  double v100;
  uint64_t v101;
  double v102;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  double v107;
  double v108;
  BOOL v109;
  double v110;
  double v111;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t *v118;
  uint64_t *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  double v123;
  double v124;
  BOOL v125;
  uint64_t v126;
  unint64_t v127;
  unint64_t v128;
  uint64_t *v129;
  uint64_t v130;
  double v131;
  double v132;
  unint64_t v134;
  uint64_t v135;
  double v136;
  double v137;
  uint64_t *v139;
  uint64_t v140;
  uint64_t v141;
  double v142;
  double v143;
  BOOL v144;
  uint64_t *v145;
  uint64_t v146;
  uint64_t v147;
  double v148;
  double v149;

  v7 = (uint64_t *)result;
LABEL_2:
  v8 = a2 - 1;
  v9 = v7;
  while (2)
  {
    v7 = v9;
    v10 = (char *)a2 - (char *)v9;
    v11 = a2 - v9;
    switch(v11)
    {
      case 0uLL:
      case 1uLL:
        return result;
      case 2uLL:
        v67 = *(a2 - 1);
        v68 = *(double *)(v67 + 664);
        v69 = *v9;
        v70 = *(double *)(*v9 + 664);
        if (v68 < v70 || (v67 < v69 ? (v71 = v68 == v70) : (v71 = 0), v71))
        {
          *v9 = v67;
          *(a2 - 1) = v69;
        }
        return result;
      case 3uLL:
        return (uint64_t)std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialHorzComp &,MKAnnotationView **>(v9, v9 + 1, a2 - 1);
      case 4uLL:
        return (uint64_t)std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialHorzComp &,MKAnnotationView **>(v9, v9 + 1, v9 + 2, a2 - 1);
      case 5uLL:
        return (uint64_t)std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialHorzComp &,MKAnnotationView **>(v9, v9 + 1, v9 + 2, v9 + 3, a2 - 1);
      default:
        if (v10 <= 191)
        {
          v72 = v9 + 1;
          v74 = v9 == a2 || v72 == a2;
          if ((a4 & 1) != 0)
          {
            if (!v74)
            {
              v75 = 0;
              v76 = v9;
              do
              {
                v77 = v72;
                v79 = *v76;
                v78 = v76[1];
                v80 = *(double *)(v78 + 664);
                v81 = *(double *)(*v76 + 664);
                if (v80 < v81 || (v78 < v79 ? (v82 = v80 == v81) : (v82 = 0), v82))
                {
                  v76[1] = v79;
                  v83 = v9;
                  if (v76 != v9)
                  {
                    v84 = v75;
                    do
                    {
                      v85 = *(double *)(v78 + 664);
                      v86 = *(uint64_t *)((char *)v9 + v84 - 8);
                      v87 = *(double *)(v86 + 664);
                      if (v85 >= v87 && (v78 >= v86 || v85 != v87))
                      {
                        v83 = (uint64_t *)((char *)v9 + v84);
                        goto LABEL_148;
                      }
                      *(uint64_t *)((char *)v9 + v84) = v86;
                      v84 -= 8;
                    }
                    while (v84);
                    v83 = v9;
                  }
LABEL_148:
                  *v83 = v78;
                }
                v72 = v77 + 1;
                v75 += 8;
                v76 = v77;
              }
              while (v77 + 1 != a2);
            }
          }
          else if (!v74)
          {
            do
            {
              v139 = v72;
              v141 = *v7;
              v140 = v7[1];
              v142 = *(double *)(v140 + 664);
              v143 = *(double *)(*v7 + 664);
              if (v142 < v143 || (v140 < v141 ? (v144 = v142 == v143) : (v144 = 0), v144))
              {
                do
                {
                  do
                  {
                    v145 = v7;
                    v146 = v141;
                    v147 = *--v7;
                    v141 = v147;
                    v7[2] = v146;
                    v148 = *(double *)(v140 + 664);
                    v149 = *(double *)(v147 + 664);
                  }
                  while (v148 < v149);
                }
                while (v140 < v141 && v148 == v149);
                *v145 = v140;
              }
              v72 = v139 + 1;
              v7 = v139;
            }
            while (v139 + 1 != a2);
          }
          return result;
        }
        if (!a3)
        {
          if (v9 == a2)
            return result;
          v89 = (v11 - 2) >> 1;
          v90 = v89;
          do
          {
            v91 = v90;
            if (v89 >= v90)
            {
              v92 = (2 * v90) | 1;
              v93 = &v9[v92];
              if (2 * v90 + 2 < (uint64_t)v11)
              {
                v94 = v93[1];
                result = *v93;
                v95 = *(double *)(*v93 + 664);
                v96 = *(double *)(v94 + 664);
                if (v95 < v96 || (result < v94 ? (v97 = v95 == v96) : (v97 = 0), v97))
                {
                  ++v93;
                  v92 = 2 * v90 + 2;
                }
              }
              v98 = &v9[v90];
              v99 = *v93;
              v100 = *(double *)(*v93 + 664);
              v101 = *v98;
              v102 = *(double *)(*v98 + 664);
              if (v100 >= v102 && (v99 >= v101 || v100 != v102))
              {
                do
                {
                  *v98 = v99;
                  v98 = v93;
                  if (v89 < v92)
                    break;
                  v104 = 2 * v92;
                  v92 = (2 * v92) | 1;
                  v93 = &v9[v92];
                  v105 = v104 + 2;
                  if (v105 < (uint64_t)v11)
                  {
                    result = (uint64_t)(v93 + 1);
                    v106 = v93[1];
                    v107 = *(double *)(*v93 + 664);
                    v108 = *(double *)(v106 + 664);
                    if (v107 < v108 || (*v93 < v106 ? (v109 = v107 == v108) : (v109 = 0), v109))
                    {
                      ++v93;
                      v92 = v105;
                    }
                  }
                  v99 = *v93;
                  v110 = *(double *)(*v93 + 664);
                  v111 = *(double *)(v101 + 664);
                  if (v110 < v111)
                    break;
                }
                while (v99 >= v101 || v110 != v111);
                *v98 = v101;
              }
            }
            --v90;
          }
          while (v91);
          v113 = (unint64_t)v10 >> 3;
          while (2)
          {
            v114 = 0;
            v115 = *v9;
            v116 = v113 - 2;
            if (v113 < 2)
              v116 = v113 - 1;
            v117 = v116 >> 1;
            v118 = v9;
            do
            {
              v119 = v118;
              v118 += v114 + 1;
              v120 = 2 * v114;
              v114 = (2 * v114) | 1;
              v121 = v120 + 2;
              if (v121 < v113)
              {
                v122 = v118[1];
                result = *v118;
                v123 = *(double *)(*v118 + 664);
                v124 = *(double *)(v122 + 664);
                if (v123 < v124 || (result < v122 ? (v125 = v123 == v124) : (v125 = 0), v125))
                {
                  ++v118;
                  v114 = v121;
                }
              }
              *v119 = *v118;
            }
            while (v114 <= v117);
            if (v118 != --a2)
            {
              *v118 = *a2;
              *a2 = v115;
              v126 = (char *)v118 - (char *)v9 + 8;
              if (v126 < 9)
                goto LABEL_215;
              v127 = ((unint64_t)v126 >> 3) - 2;
              v128 = v127 >> 1;
              v129 = &v9[v127 >> 1];
              v130 = *v129;
              v131 = *(double *)(*v129 + 664);
              v115 = *v118;
              v132 = *(double *)(*v118 + 664);
              if (v131 >= v132 && (v130 >= v115 || v131 != v132))
              {
LABEL_215:
                v51 = v113-- <= 2;
                if (v51)
                  return result;
                continue;
              }
              *v118 = v130;
              if (v127 >= 2)
              {
                while (1)
                {
                  v134 = v128 - 1;
                  v128 = (v128 - 1) >> 1;
                  v118 = &v9[v128];
                  v135 = *v118;
                  v136 = *(double *)(*v118 + 664);
                  v137 = *(double *)(v115 + 664);
                  if (v136 >= v137 && (v135 >= v115 || v136 != v137))
                    break;
                  *v129 = v135;
                  v129 = &v9[v128];
                  if (v134 <= 1)
                    goto LABEL_214;
                }
              }
              v118 = v129;
            }
            break;
          }
LABEL_214:
          *v118 = v115;
          goto LABEL_215;
        }
        v12 = v11 >> 1;
        v13 = &v9[v11 >> 1];
        if ((unint64_t)v10 < 0x401)
        {
          result = (uint64_t)std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialHorzComp &,MKAnnotationView **>(&v7[v11 >> 1], v7, a2 - 1);
        }
        else
        {
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialHorzComp &,MKAnnotationView **>(v7, &v7[v11 >> 1], a2 - 1);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialHorzComp &,MKAnnotationView **>(v7 + 1, v13 - 1, a2 - 2);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialHorzComp &,MKAnnotationView **>(v7 + 2, &v7[v12 + 1], a2 - 3);
          result = (uint64_t)std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialHorzComp &,MKAnnotationView **>(v13 - 1, v13, &v7[v12 + 1]);
          v14 = *v7;
          *v7 = *v13;
          *v13 = v14;
        }
        --a3;
        v15 = *v7;
        if ((a4 & 1) == 0)
        {
          v17 = *(v7 - 1);
          v18 = *(double *)(v17 + 664);
          v16 = *(double *)(v15 + 664);
          if (v18 < v16 || v17 < v15 && v18 == v16)
            goto LABEL_14;
          v44 = *v8;
          v45 = *(double *)(*v8 + 664);
          if (v16 < v45 || v15 < v44 && v16 == v45)
          {
            v46 = v7 + 1;
            do
            {
              v9 = v46;
              v47 = *v46;
              v48 = *(double *)(*v46 + 664);
              if (v16 < v48)
                break;
              ++v46;
            }
            while (v15 >= v47 || v16 != v48);
          }
          else
          {
            v63 = v7 + 1;
            do
            {
              v9 = v63;
              if (v63 >= a2)
                break;
              v64 = *v63;
              v65 = *(double *)(*v63 + 664);
              if (v16 < v65)
                break;
              ++v63;
            }
            while (v15 >= v64 || v16 != v65);
          }
          i = a2;
          if (v9 < a2)
          {
            for (i = a2 - 1; ; --i)
            {
              if (v16 >= v45)
              {
                v51 = v16 == v45 && v15 < v44;
                if (!v51)
                  break;
              }
              v52 = *(i - 1);
              v44 = v52;
              v45 = *(double *)(v52 + 664);
            }
          }
          if (v9 < i)
          {
            v53 = *v9;
            v54 = *i;
            do
            {
              *v9 = v54;
              *i = v53;
              v55 = *(double *)(v15 + 664);
              v56 = v9 + 1;
              do
              {
                v9 = v56;
                v53 = *v56;
                v57 = *(double *)(*v56 + 664);
                if (v55 < v57)
                  break;
                ++v56;
              }
              while (v15 >= v53 || v55 != v57);
              do
              {
                do
                {
                  v59 = *--i;
                  v54 = v59;
                  v60 = *(double *)(v59 + 664);
                }
                while (v55 < v60);
              }
              while (v15 < v54 && v55 == v60);
            }
            while (v9 < i);
          }
          v62 = v9 - 1;
          if (v9 - 1 != v7)
            *v7 = *v62;
          a4 = 0;
          *v62 = v15;
          continue;
        }
        v16 = *(double *)(v15 + 664);
LABEL_14:
        for (j = 0; ; ++j)
        {
          v20 = v7[j + 1];
          v21 = *(double *)(v20 + 664);
          if (v21 >= v16 && (v20 >= v15 || v21 != v16))
            break;
        }
        v23 = &v7[j];
        v24 = (unint64_t)&v7[j + 1];
        v25 = a2 - 1;
        if (j * 8)
        {
          do
          {
            v26 = v25;
            v27 = *v25;
            v28 = *(double *)(*v25 + 664);
            if (v28 < v16)
              break;
            --v25;
          }
          while (v27 >= v15 || v28 != v16);
        }
        else
        {
          v30 = a2 - 1;
          while (1)
          {
            v26 = v30;
            v31 = (unint64_t)(v30 + 1);
            if (v24 >= v31)
              break;
            v32 = *(double *)(*v26 + 664);
            if (v32 >= v16)
            {
              v30 = v26 - 1;
              if (*v26 >= v15 || v32 != v16)
                continue;
            }
            goto LABEL_40;
          }
          v26 = (uint64_t *)v31;
        }
LABEL_40:
        if (v24 < (unint64_t)v26)
        {
          v34 = *v26;
          v35 = v24;
          v36 = v26;
          do
          {
            *(_QWORD *)v35 = v34;
            v35 += 8;
            *v36 = v20;
            v37 = *(double *)(v15 + 664);
            while (1)
            {
              v20 = *(_QWORD *)v35;
              v38 = *(double *)(*(_QWORD *)v35 + 664);
              if (v38 >= v37 && (v20 >= v15 || v38 != v37))
                break;
              v35 += 8;
            }
            v40 = v36 - 1;
            do
            {
              v36 = v40;
              v34 = *v40;
              v41 = *(double *)(*v40 + 664);
              if (v41 < v37)
                break;
              --v40;
            }
            while (v34 >= v15 || v41 != v37);
          }
          while (v35 < (unint64_t)v36);
          v23 = (uint64_t *)(v35 - 8);
        }
        if (v23 != v7)
          *v7 = *v23;
        *v23 = v15;
        if (v24 < (unint64_t)v26)
        {
LABEL_63:
          result = std::__introsort<std::_ClassicAlgPolicy,_MKSpatialHorzComp &,MKAnnotationView **,false>(v7, v23, a3, a4 & 1);
          a4 = 0;
          v9 = v23 + 1;
          continue;
        }
        v43 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialHorzComp &,MKAnnotationView **>(v7, v23);
        v9 = v23 + 1;
        result = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialHorzComp &,MKAnnotationView **>(v23 + 1, a2);
        if (!(_DWORD)result)
        {
          if (v43)
            continue;
          goto LABEL_63;
        }
        a2 = v23;
        if (!v43)
          goto LABEL_2;
        return result;
    }
  }
}

void std::__hash_table<_MKAnnotationViewPair,std::hash<_MKAnnotationViewPair>,std::equal_to<_MKAnnotationViewPair>,std::allocator<_MKAnnotationViewPair>>::__rehash<true>(uint64_t a1, size_t __n)
{
  size_t prime;
  int8x8_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  size_t v9;
  uint8x8_t v10;
  unint64_t v11;
  uint8x8_t v12;
  uint64_t v13;
  _QWORD *v14;
  size_t v15;
  void *v16;

  if (__n == 1)
  {
    prime = 2;
  }
  else
  {
    prime = __n;
    if ((__n & (__n - 1)) != 0)
      prime = std::__next_prime(__n);
  }
  v4 = *(int8x8_t *)(a1 + 8);
  if (prime <= *(_QWORD *)&v4)
  {
    if (prime >= *(_QWORD *)&v4)
      return;
    v11 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(_QWORD *)&v4 < 3uLL || (v12 = (uint8x8_t)vcnt_s8(v4), v12.i16[0] = vaddlv_u8(v12), v12.u32[0] > 1uLL))
    {
      v11 = std::__next_prime(v11);
    }
    else
    {
      v13 = 1 << -(char)__clz(v11 - 1);
      if (v11 >= 2)
        v11 = v13;
    }
    if (prime <= v11)
      prime = v11;
    if (prime >= *(_QWORD *)&v4)
      return;
    if (!prime)
    {
      v16 = *(void **)a1;
      *(_QWORD *)a1 = 0;
      if (v16)
        operator delete(v16);
      *(_QWORD *)(a1 + 8) = 0;
      return;
    }
  }
  if (prime >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  v5 = operator new(8 * prime);
  v6 = *(void **)a1;
  *(_QWORD *)a1 = v5;
  if (v6)
    operator delete(v6);
  v7 = 0;
  *(_QWORD *)(a1 + 8) = prime;
  do
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v7++) = 0;
  while (prime != v7);
  v8 = *(_QWORD **)(a1 + 16);
  if (v8)
  {
    v9 = v8[1];
    v10 = (uint8x8_t)vcnt_s8((int8x8_t)prime);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      if (v9 >= prime)
        v9 %= prime;
    }
    else
    {
      v9 &= prime - 1;
    }
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v9) = a1 + 16;
    v14 = (_QWORD *)*v8;
    if (*v8)
    {
      do
      {
        v15 = v14[1];
        if (v10.u32[0] > 1uLL)
        {
          if (v15 >= prime)
            v15 %= prime;
        }
        else
        {
          v15 &= prime - 1;
        }
        if (v15 != v9)
        {
          if (!*(_QWORD *)(*(_QWORD *)a1 + 8 * v15))
          {
            *(_QWORD *)(*(_QWORD *)a1 + 8 * v15) = v8;
            goto LABEL_31;
          }
          *v8 = *v14;
          *v14 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v15);
          **(_QWORD **)(*(_QWORD *)a1 + 8 * v15) = v14;
          v14 = v8;
        }
        v15 = v9;
LABEL_31:
        v8 = v14;
        v14 = (_QWORD *)*v14;
        v9 = v15;
      }
      while (v14);
    }
  }
}

void sub_18B0D0BEC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t labelScaleFactorForContentSizeCategory(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  _QWORD v6[17];

  v6[16] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v6[0] = (id)*MEMORY[0x1E0CEB408];
  v6[1] = 2;
  v6[2] = (id)*MEMORY[0x1E0CEB400];
  v6[3] = 3;
  v6[4] = (id)*MEMORY[0x1E0CEB3F8];
  v6[5] = 4;
  v6[6] = (id)*MEMORY[0x1E0CEB3E0];
  v6[7] = 4;
  v6[8] = (id)*MEMORY[0x1E0CEB3D8];
  v6[9] = 4;
  v6[10] = (id)*MEMORY[0x1E0CEB3D0];
  v6[11] = 4;
  v6[12] = (id)*MEMORY[0x1E0CEB3C8];
  v6[13] = 4;
  v2 = 0;
  v6[14] = (id)*MEMORY[0x1E0CEB3C0];
  v6[15] = 4;
  v3 = 1;
  while (!objc_msgSend(v1, "isEqualToString:", v6[v2]))
  {
    v2 += 2;
    if (v2 == 16)
      goto LABEL_6;
  }
  v3 = v6[v2 + 1];
LABEL_6:
  for (i = 14; i != -2; i -= 2)

  return v3;
}

void sub_18B0D0E88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  uint64_t i;

  for (i = 112; i != -16; i -= 16)

  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy_(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = a2[3];
  a1[3] = result;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__9(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x18D778DB8](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

__n128 __Block_byref_object_copy__13(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = a2[3];
  a1[3] = result;
  return result;
}

uint64_t __Block_byref_object_copy__14(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__15(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__16(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x18D778DB8](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

uint64_t __Block_byref_object_copy__17(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x18D778DB8](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

uint64_t __Block_byref_object_copy__18(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__19(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__20(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__21(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

__n128 __Block_byref_object_copy__22(__n128 *a1, __n128 *a2)
{
  __n128 result;

  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

uint64_t __Block_byref_object_copy__23(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__24(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__25(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__26(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

double MKMapRectMakeWithRadialDistance(double a1, double a2, double a3)
{
  double v4;
  double v5;

  v4 = MKTilePointForCoordinate(a1, a2, 21.0);
  GEOMapPointsPerMeterAtLatitude();
  return v4 - v5 * a3;
}

uint64_t ___shouldUseUIApplicationState_block_invoke()
{
  uint64_t result;

  result = _UIApplicationIsExtension();
  _shouldUseUIApplicationState_value = result ^ 1;
  return result;
}

uint64_t ___registerStateCaptureCallbacks_block_invoke()
{
  _stateCaptureCallbackRegistration = 1;
  return _GEOConfigRegisterStateCaptureFunctions();
}

id _attributionImagesForType(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  if (a2 == 1)
    v5 = 6;
  else
    v5 = 5;
  v16 = 0uLL;
  v17 = 0uLL;
  objc_msgSend(v3, "resources", (_QWORD)v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v11, "resourceType") == v5)
        {
          objc_msgSend(v11, "filename");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v12);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v4;
}

void sub_18B0D4964(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_18B0D5588(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_18B0D5800(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18B0D7D98(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 224), 8);
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void _registerStateCaptureCallbacks()
{
  if (_registerStateCaptureCallbacks_onceToken != -1)
    dispatch_once(&_registerStateCaptureCallbacks_onceToken, &__block_literal_global_4_0);
}

id MKGetUserLocationViewLog()
{
  if (qword_1ECE2D7F0 != -1)
    dispatch_once(&qword_1ECE2D7F0, &__block_literal_global_84);
  return (id)_MergedGlobals_7_0;
}

void sub_18B0D9C14(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  id *v4;
  uint64_t v5;

  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 128));
  _Unwind_Resume(a1);
}

uint64_t ___get_platform_and_version_block_invoke_2(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t result;

  result = dyld_get_base_platform();
  dword_1ECE2DB70 = result;
  *(_DWORD *)algn_1ECE2DB74 = a3;
  return result;
}

void sub_18B0DDA10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

MKCoordinateRegion MKCoordinateRegionForMapRect(MKMapRect rect)
{
  double x;
  double height;
  double width;
  double y;
  CLLocationCoordinate2D v6;
  CLLocationDegrees latitude;
  double longitude;
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
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  MKMapPoint v39;
  MKMapPoint v40;
  MKMapPoint v41;
  MKMapPoint v42;
  MKMapPoint v43;
  MKMapPoint v44;
  MKMapPoint v45;
  MKMapPoint v46;
  MKMapRect v47;
  MKMapRect v48;
  MKCoordinateRegion result;
  MKMapRect v50;

  x = rect.origin.x;
  if (rect.origin.x == INFINITY && rect.origin.y == INFINITY)
  {
    latitude = *MEMORY[0x1E0C9E500];
    longitude = *(double *)(MEMORY[0x1E0C9E500] + 8);
    v9 = 0.0;
    v10 = 0.0;
  }
  else
  {
    height = rect.size.height;
    width = rect.size.width;
    y = rect.origin.y;
    v39.x = rect.origin.x + rect.size.width * 0.5;
    v39.y = rect.origin.y + rect.size.height * 0.5;
    v6 = MKCoordinateForMapPoint(v39);
    latitude = v6.latitude;
    longitude = v6.longitude;
    if (v6.longitude < -180.0 || v6.longitude > 180.0)
    {
      if (v6.longitude <= 180.0)
        longitude = fmod(v6.longitude + -180.0, 360.0) + 180.0;
      else
        longitude = fmod(v6.longitude + 180.0, 360.0) + -180.0;
    }
    v11 = x + width;
    v38 = y + height;
    if ((x >= 0.0 || v11 <= 0.0) && (x >= 268435456.0 || v11 <= 268435456.0))
    {
      v43.x = x;
      v43.y = y;
      v30 = MKCoordinateForMapPoint(v43).longitude;
      v44.x = x + width;
      v29 = y + height;
      v44.y = y + height;
      v28 = vabdd_f64(v30, MKCoordinateForMapPoint(v44).longitude);
    }
    else
    {
      v50.size.width = 268435456.0;
      v50.origin.x = 0.0;
      v50.origin.y = 0.0;
      v47.origin.x = x;
      v47.origin.y = y;
      v47.size.width = width;
      v47.size.height = height;
      v50.size.height = 268435456.0;
      v48 = MKMapRectIntersection(v47, v50);
      v12 = INFINITY;
      v13 = v11 + -268435456.0;
      if (v11 > 268435456.0)
        v14 = 0.0;
      else
        v14 = INFINITY;
      if (v11 <= 268435456.0)
        v13 = 0.0;
      else
        v12 = y;
      if (v11 > 268435456.0)
        v15 = height;
      else
        v15 = 0.0;
      v16 = fabs(x);
      if (x < 0.0)
        v17 = x + 268435456.0;
      else
        v17 = v14;
      v37 = longitude;
      if (x < 0.0)
        v18 = y;
      else
        v18 = v12;
      if (x < 0.0)
        v19 = v16;
      else
        v19 = v13;
      if (x < 0.0)
        v20 = height;
      else
        v20 = v15;
      v34 = v20;
      v35 = v19;
      v21 = v48.origin.x + v48.size.width;
      v22 = v48.origin.y + v48.size.height;
      v36 = v11;
      v23 = MKCoordinateForMapPoint(*(MKMapPoint *)&v48).longitude;
      v40.x = v21;
      v40.y = v22;
      v24 = vabdd_f64(v23, MKCoordinateForMapPoint(v40).longitude);
      v25 = v18 + v34;
      v41.x = v17;
      v41.y = v18;
      longitude = v37;
      v26 = MKCoordinateForMapPoint(v41).longitude;
      v42.x = v17 + v35;
      v42.y = v25;
      v27 = vabdd_f64(v26, MKCoordinateForMapPoint(v42).longitude);
      v11 = v36;
      v28 = v24 + v27;
      latitude = v6.latitude;
      v29 = v38;
    }
    v45.x = x;
    v45.y = y;
    v31 = MKCoordinateForMapPoint(v45).latitude;
    v46.x = v11;
    v46.y = v29;
    v9 = fmin(v31 - MKCoordinateForMapPoint(v46).latitude, 180.0);
    v10 = fmin(v28, 360.0);
  }
  v32 = latitude;
  v33 = longitude;
  result.span.longitudeDelta = v10;
  result.span.latitudeDelta = v9;
  result.center.longitude = v33;
  result.center.latitude = v32;
  return result;
}

CLLocationDistance MKMetersBetweenMapPoints(MKMapPoint a, MKMapPoint b)
{
  double y;
  double x;
  CLLocationDistance result;
  MKMapPoint v5;

  y = b.y;
  x = b.x;
  MKCoordinateForMapPoint(a);
  v5.x = x;
  v5.y = y;
  MKCoordinateForMapPoint(v5);
  GEOCalculateDistanceHighPrecision();
  return result;
}

CLLocationCoordinate2D MKCoordinateForMapPoint(MKMapPoint mapPoint)
{
  double x;
  double v2;
  double v3;
  long double v4;
  double v5;
  CLLocationCoordinate2D result;

  x = mapPoint.x + 268435456.0;
  if (mapPoint.x >= 0.0)
    x = mapPoint.x;
  if (mapPoint.x > 268435456.0)
    v2 = mapPoint.x + -268435456.0;
  else
    v2 = x;
  v4 = MKCoordinateForTilePoint(v2, mapPoint.y, 21.0);
  if (v3 < -180.0 || v3 > 180.0)
  {
    if (v3 <= 180.0)
      v3 = fmod(v3 + -180.0, 360.0) + 180.0;
    else
      v3 = fmod(v3 + 180.0, 360.0) + -180.0;
  }
  v5 = v4;
  result.longitude = v3;
  result.latitude = v5;
  return result;
}

long double MKCoordinateForTilePoint(double a1, double a2, double a3)
{
  double v3;
  long double v4;
  long double v5;

  v3 = a2 * 0.0078125;
  v4 = ldexp(1.0, (int)a3);
  v5 = exp((v3 + v4 * -0.5) / (v4 / 6.28318531));
  return (atan(v5) * -2.0 + 1.57079633) * 57.2957795;
}

void sub_18B0DE180(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18B0DE320(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18B0DE4D4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18B0DE7BC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void _scaleForMapRect(double *a1, double *a2, double *a3, int a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12, double a13, double a14, double a15, double a16, double a17, double a18)
{
  double v26;
  double v27;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MaxX;
  double MaxY;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  long double v39;
  long double v40;
  double v41;
  long double v42;
  double v43;
  double v44;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  v26 = a9 + a11 - a9;
  v27 = a10 + a12 - a10;
  v49.origin.x = a5 + a14;
  x = v49.origin.x;
  v49.origin.y = a6 + a13;
  y = v49.origin.y;
  v49.size.width = a7 - (a14 + a16);
  width = v49.size.width;
  v49.size.height = a8 - (a13 + a15);
  height = v49.size.height;
  MaxX = CGRectGetMaxX(v49);
  v50.origin.x = x;
  v50.origin.y = y;
  v50.size.width = width;
  v50.size.height = height;
  *a3 = MaxX - CGRectGetMinX(v50);
  v51.origin.x = x;
  v51.origin.y = y;
  v51.size.width = width;
  v51.size.height = height;
  MaxY = CGRectGetMaxY(v51);
  v52.origin.x = x;
  v52.origin.y = y;
  v52.size.width = width;
  v52.size.height = height;
  v34 = MaxY - CGRectGetMinY(v52);
  a3[1] = v34;
  v35 = v34 / v27;
  if (*a3 / v26 >= v35)
    v36 = v35;
  else
    v36 = *a3 / v26;
  v37 = log2(v36) + 21.0;
  v38 = 0.0;
  if (v37 >= 0.0)
    v38 = v37;
  if (a18 != -1.0 && v38 > a18)
  {
    v39 = exp2(21.0 - a18);
    v38 = a18;
    v36 = 1.0 / v39;
  }
  if (a17 != -1.0 && v38 < a17)
  {
    v40 = exp2(21.0 - a17);
    v38 = a17;
    v36 = 1.0 / v40;
  }
  if (a4)
  {
    v41 = floor(v38);
    v42 = exp2((double)(uint64_t)(21 - vcvtmd_u64_f64(v38)));
    v38 = v41;
    v36 = 1.0 / v42;
  }
  *a2 = v38;
  v43 = a9 + a11 * 0.5;
  v44 = a10 + a12 * 0.5;
  if (v36 > 0.0)
  {
    v43 = v43 + (a16 - a14) * 0.5 / v36;
    v44 = v44 + (a15 - a13) * 0.5 / v36;
  }
  *a1 = v43;
  a1[1] = v44;
}

MKMapRect MKMapRectUnion(MKMapRect rect1, MKMapRect rect2)
{
  double v4;
  double v5;
  double v6;
  double v7;
  double x;
  double width;
  double height;

  if (rect1.origin.x == INFINITY && rect1.origin.y == INFINITY)
  {
    rect1.origin.y = rect2.origin.y;
  }
  else if (rect2.origin.x == INFINITY && rect2.origin.y == INFINITY)
  {
    rect2.origin.x = rect1.origin.x;
    rect2.size.width = rect1.size.width;
    rect2.size.height = rect1.size.height;
  }
  else
  {
    v4 = rect2.origin.x + rect2.size.width;
    if (rect1.origin.x < rect2.origin.x)
      rect2.origin.x = rect1.origin.x;
    v5 = rect1.origin.y + rect1.size.height;
    if (rect1.origin.y >= rect2.origin.y)
      rect1.origin.y = rect2.origin.y;
    v6 = rect1.origin.x + rect1.size.width;
    if (v6 <= v4)
      v6 = v4;
    rect2.size.width = v6 - rect2.origin.x;
    v7 = rect2.origin.y + rect2.size.height;
    if (v5 > rect2.origin.y + rect2.size.height)
      v7 = v5;
    rect2.size.height = v7 - rect1.origin.y;
  }
  x = rect2.origin.x;
  width = rect2.size.width;
  height = rect2.size.height;
  rect1.size.height = height;
  rect1.size.width = width;
  rect1.origin.x = x;
  return rect1;
}

void MKRegisterGEOMultitaskingNotifications()
{
  if (MKRegisterGEOMultitaskingNotifications__once != -1)
    dispatch_once(&MKRegisterGEOMultitaskingNotifications__once, &__block_literal_global_89);
}

uint64_t _shouldUseSnapshotService(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (!GEOConfigGetBOOL())
    goto LABEL_4;
  objc_msgSend(v1, "_routeOverlay");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    goto LABEL_4;
  objc_msgSend(v1, "_routeContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    goto LABEL_4;
  objc_msgSend(v1, "_allOverlayRenderers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v1, "_allOverlayRenderers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          if (!objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "conformsToProtocol:", &unk_1EDFCF118))
          {

            goto LABEL_4;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v10)
          continue;
        break;
      }
    }

  }
  if (!objc_msgSend(v1, "_useSnapshotService")
    || v1 && (objc_msgSend(v1, "_cartographicConfiguration"), v18 == 2)
    || _MKLinkedOnOrAfterReleaseSet(2310)
    && (_UIApplicationIsExtension() & 1) == 0
    && (objc_msgSend(v1, "mapType") == 4
     || objc_msgSend(v1, "mapType") == 3
     || (objc_msgSend(v1, "scale"),
         v14 = v13,
         objc_msgSend(v1, "size"),
         v16 = v14 * v15,
         objc_msgSend(v1, "size"),
         GEOConfigGetInteger() < (uint64_t)llround(v16 * v17))))
  {
LABEL_4:
    v4 = 0;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

id MKGetSnapshotLog()
{
  if (MKGetSnapshotLog_onceToken != -1)
    dispatch_once(&MKGetSnapshotLog_onceToken, &__block_literal_global_13);
  return (id)MKGetSnapshotLog_log;
}

void sub_18B0E24A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18B0E2894(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *__p)
{
  void *v30;

  _Unwind_Resume(a1);
}

void sub_18B0E2A54(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t _insertionNodeForItem(void *a1, uint64_t a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  MKMapPoint v12;

  v3 = a1;
  objc_msgSend(v3, "coordinate");
  v6 = MKTilePointForCoordinate(v4, v5, 21.0);
  v8 = v7;

  while (1)
  {
    v9 = *(_QWORD *)(a2 + 40);
    if (!v9)
      break;
    v10 = 0;
    while (1)
    {
      a2 = *(_QWORD *)(v9 + v10);
      v12.x = v6;
      v12.y = v8;
      if (MKMapRectContainsPoint(*(MKMapRect *)a2, v12))
        break;
      v10 += 8;
      if (v10 == 32)
      {
        a2 = 0;
        goto LABEL_7;
      }
    }
  }
LABEL_7:

  return a2;
}

void sub_18B0E2AFC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18B0E2B9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

BOOL MKMapRectContainsPoint(MKMapRect rect, MKMapPoint point)
{
  double x;
  double y;
  double v5;
  BOOL result;
  BOOL v8;
  double v9;
  double v10;
  double v11;
  double height;
  BOOL v13;
  MKMapRect v16;
  MKMapRect v17;

  x = point.x;
  if (rect.origin.x == INFINITY && rect.origin.y == INFINITY)
    return 0;
  y = point.y;
  v5 = rect.origin.x + rect.size.width;
  if ((rect.origin.x >= 0.0 || v5 <= 0.0) && (rect.origin.x >= 268435456.0 || v5 <= 268435456.0))
  {
    result = 0;
    if (x < rect.origin.x)
      return result;
    v8 = x > v5;
    goto LABEL_32;
  }
  if (rect.origin.x >= 0.0)
  {
    if (v5 <= 268435456.0)
    {
      v10 = 0.0;
      v9 = INFINITY;
      v11 = INFINITY;
      height = 0.0;
      goto LABEL_21;
    }
    v10 = v5 + -268435456.0;
    v9 = 0.0;
  }
  else
  {
    v9 = rect.origin.x + 268435456.0;
    v10 = fabs(rect.origin.x);
  }
  v11 = rect.origin.y;
  height = rect.size.height;
LABEL_21:
  v17.size.width = 268435456.0;
  v17.origin.x = 0.0;
  v17.origin.y = 0.0;
  v17.size.height = 268435456.0;
  rect = MKMapRectIntersection(rect, v17);
  if (x >= v9)
  {
    v13 = x > v9 + v10 || y < v11;
    if (!v13 && y <= v11 + height)
      return 1;
  }
  result = 0;
  if (x >= v16.origin.x)
  {
    v8 = x > v16.origin.x + v16.size.width;
LABEL_32:
    if (!v8 && y >= rect.origin.y)
      return y <= rect.origin.y + rect.size.height;
  }
  return result;
}

void _insert(void *a1, uint64_t a2, void *a3)
{
  unsigned int *v5;
  uint64_t v6;
  uint64_t v7;
  char **v8;
  BOOL v9;
  unsigned int *v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  double *v15;
  double v16;
  double v17;
  uint64_t v18;
  double v19;
  double v20;
  double *v21;
  double v22;
  double v23;
  double v24;
  double *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double *v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  id v38;
  id v39;
  id v40;
  unint64_t v41;
  char *v42;
  char *v43;
  char *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char *v49;
  char *v50;
  char *v51;
  uint64_t v52;
  char *v53;
  void *v54;
  id v55;
  void **v56;

  v55 = a1;
  v5 = a3;
  v6 = _insertionNodeForItem(v55, a2);
  v7 = v6;
  v8 = *(char ***)(v6 + 32);
  if (v5[2] <= (unint64_t)((v8[1] - *v8) >> 3)
    && (*(double *)(v6 + 16) <= *((double *)v5 + 2) ? (v9 = *(double *)(v6 + 24) > *((double *)v5 + 3)) : (v9 = 1), v9))
  {
    v10 = v5;
    *(_QWORD *)(v7 + 40) = malloc_type_calloc(4uLL, 8uLL, 0x2004093837F09uLL);
    v11 = *(double *)(v7 + 16);
    v12 = *(double *)(v7 + 24);
    v13 = *(double *)v7;
    v14 = *(_QWORD *)(v7 + 8);
    v15 = (double *)malloc_type_calloc(1uLL, 0x30uLL, 0x10A00405CA67C4CuLL);
    v16 = v11 * 0.5;
    v17 = v12 * 0.5;
    *v15 = v13;
    *((_QWORD *)v15 + 1) = v14;
    v15[2] = v16;
    v15[3] = v17;
    **(_QWORD **)(v7 + 40) = v15;
    v19 = *(double *)v7;
    v18 = *(_QWORD *)(v7 + 8);
    v20 = *(double *)(v7 + 16);
    v21 = (double *)malloc_type_calloc(1uLL, 0x30uLL, 0x10A00405CA67C4CuLL);
    *v21 = v16 + v19;
    *((_QWORD *)v21 + 1) = v18;
    v21[2] = v20 - v16;
    v21[3] = v17;
    *(_QWORD *)(*(_QWORD *)(v7 + 40) + 8) = v21;
    v22 = *(double *)v7;
    v23 = *(double *)(v7 + 8);
    v24 = *(double *)(v7 + 24);
    v25 = (double *)malloc_type_calloc(1uLL, 0x30uLL, 0x10A00405CA67C4CuLL);
    *v25 = v22;
    v25[1] = v17 + v23;
    v25[2] = v16;
    v25[3] = v24 - v17;
    *(_QWORD *)(*(_QWORD *)(v7 + 40) + 16) = v25;
    v26 = *(double *)v7;
    v27 = *(double *)(v7 + 8);
    v28 = *(double *)(v7 + 16);
    v29 = *(double *)(v7 + 24);
    v30 = (double *)malloc_type_calloc(1uLL, 0x30uLL, 0x10A00405CA67C4CuLL);
    v31 = 0;
    *v30 = v16 + v26;
    v30[1] = v17 + v27;
    v30[2] = v28 - v16;
    v30[3] = v29 - v17;
    *(_QWORD *)(*(_QWORD *)(v7 + 40) + 24) = v30;
    do
    {
      v32 = (_QWORD *)operator new();
      *v32 = 0;
      v32[1] = 0;
      v32[2] = 0;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v7 + 40) + v31) + 32) = v32;
      v31 += 8;
    }
    while (v31 != 32);
    v33 = *(_QWORD *)(v7 + 32);
    v34 = *(_QWORD *)(v33 + 8) - *(_QWORD *)v33;
    if (!v34)
      goto LABEL_15;
    v35 = 0;
    v36 = v34 >> 3;
    v37 = v36 <= 1 ? 1 : v36;
    do
    {
      v38 = *(id *)(**(_QWORD **)(v7 + 32) + 8 * v35);
      ((void (*)(void))_insert)();

      ++v35;
    }
    while (v37 != v35);
    v33 = *(_QWORD *)(v7 + 32);
    if (v33)
    {
LABEL_15:
      v56 = (void **)v33;
      std::vector<VKRouteInfo * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v56);
      MEMORY[0x18D7787AC](v33, 0x80C40D6874129);
    }
    *(_QWORD *)(v7 + 32) = 0;

    _insert(v55, v7, v10);
  }
  else
  {
    v39 = v55;
    v40 = v39;
    v42 = v8[1];
    v41 = (unint64_t)v8[2];
    if ((unint64_t)v42 >= v41)
    {
      v44 = *v8;
      v45 = (v42 - *v8) >> 3;
      v46 = v45 + 1;
      if ((unint64_t)(v45 + 1) >> 61)
        std::vector<VKRouteInfo * {__strong}>::__throw_length_error[abi:ne180100]();
      v47 = v41 - (_QWORD)v44;
      if (v47 >> 2 > v46)
        v46 = v47 >> 2;
      if ((unint64_t)v47 >= 0x7FFFFFFFFFFFFFF8)
        v48 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v48 = v46;
      if (v48)
      {
        if (v48 >> 61)
          std::__throw_bad_array_new_length[abi:ne180100]();
        v49 = (char *)operator new(8 * v48);
      }
      else
      {
        v49 = 0;
      }
      v50 = &v49[8 * v45];
      v51 = &v49[8 * v48];
      *(_QWORD *)v50 = v40;
      v43 = v50 + 8;
      if (v42 == v44)
      {
        *v8 = v50;
        v8[1] = v43;
        v8[2] = v51;
      }
      else
      {
        do
        {
          v52 = *((_QWORD *)v42 - 1);
          v42 -= 8;
          *(_QWORD *)v42 = 0;
          *((_QWORD *)v50 - 1) = v52;
          v50 -= 8;
        }
        while (v42 != v44);
        v42 = *v8;
        v53 = v8[1];
        *v8 = v50;
        v8[1] = v43;
        v8[2] = v51;
        while (v53 != v42)
        {
          v54 = (void *)*((_QWORD *)v53 - 1);
          v53 -= 8;

        }
      }
      if (v42)
        operator delete(v42);
    }
    else
    {
      *(_QWORD *)v42 = v39;
      v43 = v42 + 8;
    }
    v8[1] = v43;
  }

}

void sub_18B0E3098(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
  void *v9;
  void *v10;

  _Unwind_Resume(a1);
}

void std::vector<GEOPosition2d>::reserve(void **a1, unint64_t a2)
{
  int64_t v3;
  char *v4;
  char *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  char *v9;
  char *v10;

  if (a2 > ((_BYTE *)a1[2] - (_BYTE *)*a1) >> 4)
  {
    if (a2 >> 60)
      std::vector<VKRouteInfo * {__strong}>::__throw_length_error[abi:ne180100]();
    v3 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v4 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CLLocationCoordinate2D>>(a2);
    v5 = &v4[v3 & 0xFFFFFFFFFFFFFFF0];
    v7 = &v4[16 * v6];
    v9 = (char *)*a1;
    v8 = (char *)a1[1];
    v10 = v5;
    if (v8 != *a1)
    {
      do
      {
        *((_OWORD *)v10 - 1) = *((_OWORD *)v8 - 1);
        v10 -= 16;
        v8 -= 16;
      }
      while (v8 != v9);
      v8 = (char *)*a1;
    }
    *a1 = v10;
    a1[1] = v5;
    a1[2] = v7;
    if (v8)
      operator delete(v8);
  }
}

void PartitionAnnotations(void *a1, _QWORD *a2, _QWORD *a3)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  _QWORD *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v12 = a2;
  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = a1;
  v4 = 0;
  v5 = 0;
  v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "feature", v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isGlobalFeature");

        if (v11)
        {
          if (!v4)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
            v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            *a3 = v4;
          }
          objc_msgSend(v4, "addObject:", v9);
        }
        else
        {
          if (!v5)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(0, "count"));
            v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            *v12 = v5;
          }
          objc_msgSend(v5, "addObject:", v9);
        }
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

}

void sub_18B0E3324(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18B0E3490(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id _snapshotQueue()
{
  if (qword_1ECE2DE58 != -1)
    dispatch_once(&qword_1ECE2DE58, &__block_literal_global_144);
  return (id)qword_1ECE2DE50;
}

void sub_18B0E3F64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18B0E3FF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

uint64_t ___get_platform_and_version_block_invoke()
{
  uint64_t result;
  __int16 v1;
  uint64_t v2;
  int v3;
  int v4;

  _dyld_get_prog_image_header();
  dyld_get_image_versions();
  result = _GEOConfigHasValue();
  if ((_DWORD)result)
  {
    result = GEOConfigGetUInteger();
    v1 = (result & 0xFF00) + 256;
    if (HIBYTE(v1) > 0x10u)
    {
      v3 = 0;
      v4 = -268435456;
    }
    else
    {
      v2 = SHIBYTE(v1);
      v3 = dword_18B2A9F70[SHIBYTE(v1)];
      v4 = dword_18B2A9FB4[v2];
    }
    dword_1ECE2DB70 = v3;
    *(_DWORD *)algn_1ECE2DB74 = v4;
  }
  return result;
}

id getCNMonogrammerClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getCNMonogrammerClass_softClass;
  v7 = getCNMonogrammerClass_softClass;
  if (!getCNMonogrammerClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getCNMonogrammerClass_block_invoke;
    v3[3] = &unk_1E20D8078;
    v3[4] = &v4;
    __getCNMonogrammerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_18B0E598C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCNMonogrammerClass_block_invoke(uint64_t a1)
{
  Class result;

  ContactsUILibrary();
  result = objc_getClass("CNMonogrammer");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCNMonogrammerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    return (Class)ContactsUILibrary();
  }
  return result;
}

uint64_t ContactsUILibrary()
{
  uint64_t v0;
  void *v2;

  v0 = ContactsUILibraryCore();
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

uint64_t ContactsUILibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = ContactsUILibraryCore_frameworkLibrary;
  v6 = ContactsUILibraryCore_frameworkLibrary;
  if (!ContactsUILibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E20DCD98;
    v8 = *(_OWORD *)&off_1E20DCDA8;
    v1 = _sl_dlopen();
    v4[3] = v1;
    ContactsUILibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18B0E5B18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_18B0E6320(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void ___snapshotQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.maps.snapshotter", v2);
  v1 = (void *)qword_1ECE2DE50;
  qword_1ECE2DE50 = (uint64_t)v0;

}

void sub_18B0E750C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void _breadthFirstApply(const void *a1, void *a2)
{
  __CFArray *Mutable;
  _QWORD *ValueAtIndex;
  __int128 *v5;
  __int128 v6;
  int v7;
  uint64_t i;
  uint64_t (**v9)(id, const void *);
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  Mutable = CFArrayCreateMutable(0, 0, 0);
  CFArrayAppendValue(Mutable, a1);
  while (CFArrayGetCount(Mutable) >= 1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(Mutable, 0);
    CFArrayRemoveValueAtIndex(Mutable, 0);
    v10 = 0u;
    v11 = 0u;
    v5 = (__int128 *)ValueAtIndex[5];
    if (v5)
    {
      v6 = v5[1];
      v10 = *v5;
      v11 = v6;
    }
    v7 = v9[2](v9, ValueAtIndex);
    if (!v5 || v7)
    {
      if (v7 == 2)
        break;
    }
    else
    {
      for (i = 0; i != 32; i += 8)
        CFArrayAppendValue(Mutable, *(const void **)((char *)&v10 + i));
    }
  }
  CFRelease(Mutable);

}

void sub_18B0E7638(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18B0E76F8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18B0E7758(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MKQuadTrie;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void MKQuadTrieNodeFree(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void **v4;

  if (a1)
  {
    v2 = (void *)a1[5];
    if (v2)
      free(v2);
    v3 = a1[4];
    if (v3)
    {
      v4 = (void **)a1[4];
      std::vector<VKRouteInfo * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v4);
      MEMORY[0x18D7787AC](v3, 0x80C40D6874129);
    }
    free(a1);
  }
}

CGPathRef _MKCGPathCreateCopyByStrokingPath(CGPathRef path, CGLineCap lineCap, CGLineCap a3, CGLineJoin a4, CGFloat a5, CGFloat a6)
{
  const CGPath *CopyByStrokingPath;
  CGPath *Mutable;
  _QWORD v13[9];
  CGLineCap v14;
  CGLineCap v15;
  uint64_t v16;
  CGPoint *v17;
  uint64_t v18;
  __n128 (*v19)(__n128 *, __n128 *);
  uint64_t (*v20)();
  const char *v21;
  __int128 v22;
  uint64_t v23;
  CGPoint *v24;
  uint64_t v25;
  __n128 (*v26)(__n128 *, __n128 *);
  uint64_t (*v27)();
  const char *v28;
  __int128 v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;

  if (lineCap == a3)
    return CGPathCreateCopyByStrokingPath(path, 0, a5, lineCap, a4, a6);
  CopyByStrokingPath = CGPathCreateCopyByStrokingPath(path, 0, a5, kCGLineCapButt, a4, a6);
  Mutable = CGPathCreateMutable();
  CGPathAddPath(Mutable, 0, CopyByStrokingPath);
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v23 = 0;
  v24 = (CGPoint *)&v23;
  v25 = 0x4012000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  v28 = "";
  v29 = *MEMORY[0x1E0C9D538];
  v16 = 0;
  v17 = (CGPoint *)&v16;
  v18 = 0x4012000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v21 = "";
  v22 = *MEMORY[0x1E0C9D538];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = ___MKCGPathCreateCopyByStrokingPath_block_invoke;
  v13[3] = &unk_1E20D7D70;
  v13[4] = &v30;
  v13[5] = &v16;
  *(CGFloat *)&v13[8] = a5;
  v13[6] = &v23;
  v13[7] = Mutable;
  v14 = a3;
  v15 = lineCap;
  CGPathApplyWithBlock(path, v13);
  if (v31[3])
    _MKCGPathAddLineCap(Mutable, v24[3], v17[3], a5, a3, 0);
  CGPathRelease(CopyByStrokingPath);
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v30, 8);
  return Mutable;
}

void sub_18B0E90BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 96), 8);
  _Unwind_Resume(a1);
}

void _MKCGPathAddLineCap(CGMutablePathRef path, CGPoint a2, CGPoint a3, double a4, CGLineCap a5, _BOOL4 a6)
{
  BOOL v6;
  double v9;
  double v10;
  double v11;
  double v12;
  double x;
  double y;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;

  if (a5)
  {
    v6 = a6;
    v9 = a3.y - a2.y;
    v10 = 1.0 / sqrt((a3.x - a2.x) * (a3.x - a2.x) + 0.0 + v9 * v9);
    v11 = (a3.x - a2.x) * v10;
    v12 = (a3.y - a2.y) * v10;
    if (a6)
      x = a2.x;
    else
      x = a3.x;
    if (a6)
      y = a2.y;
    else
      y = a3.y;
    if (a5 == kCGLineCapRound)
    {
      v18 = acos(fmax(fmin(v11 + 0.0 + v12 * 0.0, 1.0), -1.0));
      if (v9 >= 0.0)
        v19 = v18;
      else
        v19 = -v18;
      CGPathMoveToPoint(path, 0, x, y);
      CGPathAddArc(path, 0, x, y, a4 * 0.5, v19 + -1.57079633, v19 + 1.57079633, v6);
      goto LABEL_22;
    }
    if (a5 == kCGLineCapSquare)
    {
      if (a6)
        v15 = -v11;
      else
        v15 = (a3.x - a2.x) * v10;
      if (a6)
        v16 = -v12;
      else
        v16 = (a3.y - a2.y) * v10;
      v17 = a4 * 0.5;
      CGPathMoveToPoint(path, 0, x + v17 * (v15 - v16), y + v17 * (v16 + v15));
      CGPathAddLineToPoint(path, 0, x + v17 * (v16 + v15), y + v17 * (v16 - v15));
      CGPathAddLineToPoint(path, 0, x + v17 * v16, y - v17 * v15);
      CGPathAddLineToPoint(path, 0, x - v17 * v16, y + v17 * v15);
LABEL_22:
      CGPathCloseSubpath(path);
    }
  }
}

id makeAnimation(uint64_t a1, void *a2, void *a3, double a4, double a5)
{
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v9 = (void *)MEMORY[0x1E0CD2710];
  v10 = a3;
  v11 = a2;
  objc_msgSend(v9, "animationWithKeyPath:", a1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFromValue:", v11);

  objc_msgSend(v12, "setToValue:", v10);
  objc_msgSend(v12, "setBeginTime:", a4);
  objc_msgSend(v12, "setDuration:", a5);
  objc_msgSend(v12, "setFillMode:", *MEMORY[0x1E0CD2B68]);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3038]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTimingFunction:", v13);

  return v12;
}

id MKGetCuratedCollectionsBatchControllerLog()
{
  if (qword_1ECE2D810 != -1)
    dispatch_once(&qword_1ECE2D810, &__block_literal_global);
  return (id)_MergedGlobals_123;
}

void sub_18B0E9C54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id MKGetMKRemoteUILog()
{
  if (qword_1EDFB7AA0 != -1)
    dispatch_once(&qword_1EDFB7AA0, &__block_literal_global_0);
  return (id)_MergedGlobals_1_1;
}

id MKGetAppImageManagerLog()
{
  if (qword_1ECE2D840 != -1)
    dispatch_once(&qword_1ECE2D840, &__block_literal_global_176);
  return (id)qword_1ECE2D838;
}

void sub_18B0ED9C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  uint64_t v36;

  _Block_object_dispose(&a36, 8);
  _Block_object_dispose((const void *)(v36 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_18B0EE19C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

id _errorWithReason(void *a1)
{
  void *v1;
  NSString *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CB35C8];
  v2 = MKErrorDomain;
  v8 = *MEMORY[0x1E0C9AFA8];
  v9[0] = a1;
  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = a1;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "errorWithDomain:code:userInfo:", v2, 6, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t _geoJSONObjectType(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(&unk_1E2159BF0, "objectForKeyedSubscript:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "integerValue");
  else
    v3 = 0;

  return v3;
}

uint64_t _geoJSONGeometryType(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(&unk_1E2159C18, "objectForKeyedSubscript:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "integerValue");
  else
    v3 = 0;

  return v3;
}

id MKGetMKGeoJSONSerializationLog()
{
  if (qword_1ECE2D850 != -1)
    dispatch_once(&qword_1ECE2D850, &__block_literal_global_2);
  return (id)_MergedGlobals_125;
}

char *_createVerticesFromGeoJSON(void *a1, _QWORD *a2)
{
  id v3;
  char *v4;
  char *v5;
  unint64_t v6;
  char *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  double v12;
  CLLocationDegrees v13;
  CLLocationDegrees v14;
  CLLocationCoordinate2D v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[16];

  v3 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!a2)
      goto LABEL_36;
    v16 = CFSTR("coordinates value is not an array");
LABEL_22:
    _errorWithReason(v16);
    v5 = 0;
    *a2 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }
  if (!objc_msgSend(v3, "count"))
    goto LABEL_36;
  v4 = (char *)malloc_type_malloc(16 * objc_msgSend(v3, "count"), 0x1000040451B5BE8uLL);
  if (!v4)
  {
    if (!a2)
      goto LABEL_36;
    v16 = CFSTR("Failed to allocate buffer");
    goto LABEL_22;
  }
  v5 = v4;
  if (!objc_msgSend(v3, "count"))
    goto LABEL_37;
  v6 = 0;
  v7 = v5 + 8;
  while (1)
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a2)
        goto LABEL_35;
      v17 = CFSTR("coordinate value is not an array");
LABEL_31:
      _errorWithReason(v17);
      *a2 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_35;
    }
    if ((unint64_t)objc_msgSend(v8, "count") <= 1)
    {
      if (!a2)
        goto LABEL_35;
      v17 = CFSTR("GeoJSON positions must have at least two values");
      goto LABEL_31;
    }
    if ((unint64_t)objc_msgSend(v8, "count") >= 4)
    {
      MKGetMKGeoJSONSerializationLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18B0B0000, v9, OS_LOG_TYPE_INFO, "GeoJSON positions SHOULD NOT extend positions beyond three elements", buf, 2u);
      }

    }
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      if (a2)
      {
        _errorWithReason(CFSTR("GeoJSON positions must be an array of numbers"));
        *a2 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_34;
    }
    objc_msgSend(v11, "doubleValue");
    v13 = v12;
    objc_msgSend(v10, "doubleValue");
    v15 = CLLocationCoordinate2DMake(v13, v14);
    if (v15.longitude < -180.0 || v15.longitude > 180.0 || v15.latitude < -90.0 || v15.latitude > 90.0)
      break;

    *(MKMapPoint *)(v7 - 8) = MKMapPointForCoordinate(v15);
    ++v6;
    v7 += 16;
    if (v6 >= objc_msgSend(v3, "count"))
      goto LABEL_37;
  }
  if (a2)
  {
    v18 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%+.8f, %+.8f"), *(_QWORD *)&v15.latitude, *(_QWORD *)&v15.longitude);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("Invalid coordinate position: %@"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    _errorWithReason(v20);
    *a2 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_34:

LABEL_35:
  free(v5);

LABEL_36:
  v5 = 0;
LABEL_37:

  return v5;
}

void sub_18B0F0BC4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

id getAMSMediaTaskClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getAMSMediaTaskClass_softClass;
  v7 = getAMSMediaTaskClass_softClass;
  if (!getAMSMediaTaskClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getAMSMediaTaskClass_block_invoke;
    v3[3] = &unk_1E20D8078;
    v3[4] = &v4;
    __getAMSMediaTaskClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_18B0F0C7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id MKGetAppleMediaServicesServerLog()
{
  if (qword_1ECE2D870 != -1)
    dispatch_once(&qword_1ECE2D870, &__block_literal_global_3);
  return (id)qword_1ECE2D868;
}

void __getAMSMediaTaskClass_block_invoke(uint64_t a1)
{
  AppleMediaServicesLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AMSMediaTask");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAMSMediaTaskClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    AppleMediaServicesLibrary();
  }
}

void AppleMediaServicesLibrary()
{
  void *v0;

  if (!AppleMediaServicesLibraryCore_frameworkLibrary)
  {
    AppleMediaServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!AppleMediaServicesLibraryCore_frameworkLibrary)
    {
      v0 = (void *)abort_report_np();
      free(v0);
    }
  }
}

Class __getAMSBagClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  AppleMediaServicesLibrary();
  result = objc_getClass("AMSBag");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAMSBagClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = abort_report_np();
    return (Class)__MKGetAppleMediaServicesServerLog_block_invoke(v3);
  }
  return result;
}

void ClipServicesLibrary()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = ClipServicesLibraryCore_frameworkLibrary;
  v6 = ClipServicesLibraryCore_frameworkLibrary;
  if (!ClipServicesLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E20D81A0;
    v8 = *(_OWORD *)&off_1E20D81B0;
    v1 = _sl_dlopen();
    v4[3] = v1;
    ClipServicesLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    __break(1u);
    free(v2);
  }
}

void sub_18B0F1478(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCPSClipMetadataRequestClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  ClipServicesLibrary();
  result = objc_getClass("CPSClipMetadataRequest");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCPSClipMetadataRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = abort_report_np();
    return (Class)__getCPSClipRequestClass_block_invoke(v3);
  }
  return result;
}

Class __getCPSClipRequestClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  ClipServicesLibrary();
  result = objc_getClass("CPSClipRequest");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCPSClipRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = abort_report_np();
    return __getCPSValidationRequestClass_block_invoke(v3);
  }
  return result;
}

Class __getCPSValidationRequestClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  SEL v4;

  ClipServicesLibrary();
  result = objc_getClass("CPSValidationRequest");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCPSValidationRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (void *)abort_report_np();
    return (Class)+[MKClipServices sharedInstance](v3, v4);
  }
  return result;
}

void sub_18B0F2394(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a39, 8);
  _Unwind_Resume(a1);
}

void sub_18B0F27C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_18B0F2B3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18B0F5684(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a20);
  _Unwind_Resume(a1);
}

void sub_18B0F5B10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18B0F6C9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18B0F70AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18B0F95C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18B0FAFF0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18B102C80(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_18B10320C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_18B1033D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18B103598(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18B103A10(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_18B104848(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18B104A24(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_18B104D18(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_18B105228(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_18B10532C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_18B105430(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_18B105C64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18B106E48(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18B107028(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _MKMapViewUseModernControls()
{
  if (qword_1EDFB79E0 != -1)
    dispatch_once(&qword_1EDFB79E0, &__block_literal_global_1784);
  return byte_1EDFB7993;
}

double MKNormalizedPointForLayer(void *a1, double a2)
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v8;
  CGRect v10;
  CGRect v11;

  objc_msgSend(a1, "bounds");
  x = v10.origin.x;
  y = v10.origin.y;
  width = v10.size.width;
  height = v10.size.height;
  v8 = CGRectGetWidth(v10);
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  CGRectGetHeight(v11);
  objc_msgSend(a1, "contentsAreFlipped");
  return a2 / v8;
}

double MKIntegralPoint(double a1, double a2, double a3)
{
  double v3;
  void *v5;
  double v6;

  v3 = a3;
  if (a3 == 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scale");
    v3 = v6;

  }
  return round(a1 * v3) / v3;
}

void MKSetLayoutPriorityOnConstraints(void *a1, float a2)
{
  id v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v3);
        *(float *)&v5 = a2;
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setPriority:", v5);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

void _setAlphaForViews(void *a1, int a2, double a3, double a4, double a5)
{
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[4];
  id v21;
  double v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v9 = a1;
  v10 = v9;
  if (a2)
  {
    v11 = (void *)MEMORY[0x1E0CEABB0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = ___setAlphaForViews_block_invoke;
    v20[3] = &unk_1E20D7DC0;
    v21 = v9;
    v22 = a3;
    objc_msgSend(v11, "animateWithDuration:delay:options:animations:completion:", 4, v20, 0, a4, a5);

  }
  else
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v23, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v17;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v17 != v14)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v15++), "setAlpha:", a3);
        }
        while (v13 != v15);
        v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v23, 16);
      }
      while (v13);
    }
  }

}

void _setViewTransform(void *a1, _OWORD *a2, double a3)
{
  id v5;
  void *v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  _OWORD v10[3];
  _QWORD v11[4];
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  v5 = a1;
  v6 = v5;
  if (a3 <= 0.0)
  {
    v9 = a2[1];
    v10[0] = *a2;
    v10[1] = v9;
    v10[2] = a2[2];
    objc_msgSend(v5, "setTransform:", v10);
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CEABB0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = ___setViewTransform_block_invoke;
    v11[3] = &unk_1E20D8B70;
    v12 = v5;
    v8 = a2[1];
    v13 = *a2;
    v14 = v8;
    v15 = a2[2];
    objc_msgSend(v7, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, v11, 0, a3, 0.0, 0.666666687, 0.0);

  }
}

uint64_t _MKMarkerAnnotationViewSelectionShouldSway()
{
  void *v0;
  uint64_t v1;

  if (!MapsFeature_IsEnabled_ShelbyvilleMapKit() || !_MKLinkedOnOrAfterReleaseSet(3081))
    return 0;
  +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "reduceMotionEnabled") ^ 1;

  return v1;
}

id _MKMarkerAnnotationViewSelectionSwayAnimation()
{
  float v0;
  float v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v0 = (float)arc4random() * 2.3283e-10;
  if (v0 >= 0.5)
    v1 = (float)(v0 * 0.05) + 0.05;
  else
    v1 = -(float)((float)(v0 * 0.05) + 0.05);
  _createSpringAnimationForSwaying(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD2700], "animation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v2;
  _createSpringAnimationForSwaying(0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v4;
  _createSpringAnimationForSwaying(-v1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAnimations:", v6, v9, v10);

  objc_msgSend(v2, "settlingDuration");
  objc_msgSend(v3, "setDuration:");
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3040]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimingFunction:", v7);

  return v3;
}

id _createSpringAnimationForSwaying(float a1)
{
  void *v2;
  double v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform.rotation.z"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setStiffness:", 127.152748);
  objc_msgSend(v2, "setDamping:", 5.0);
  objc_msgSend(v2, "setMass:", 1.0);
  objc_msgSend(v2, "setInitialVelocity:", 0.0);
  *(float *)&v3 = a1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setToValue:", v4);

  objc_msgSend(v2, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  objc_msgSend(v2, "setAdditive:", 1);
  return v2;
}

void ___setAlphaForViews_block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "setAlpha:", *(double *)(a1 + 40), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

uint64_t ___setViewTransform_block_invoke(uint64_t a1)
{
  __int128 v1;
  _OWORD v3[3];

  v1 = *(_OWORD *)(a1 + 56);
  v3[0] = *(_OWORD *)(a1 + 40);
  v3[1] = v1;
  v3[2] = *(_OWORD *)(a1 + 72);
  return objc_msgSend(*(id *)(a1 + 32), "setTransform:", v3);
}

id ImageForArtworkDataSource(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  double v22;
  void *v23;

  v3 = a2;
  v4 = a1;
  objc_msgSend(v4, "iconDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "styleAttributes");
  v6 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "shieldDataSource");
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = 0;
  if (v3 && v6 | v7)
  {
    v9 = objc_msgSend(v3, "userInterfaceStyle");
    objc_msgSend(v3, "displayScale");
    if (v10 == 0.0)
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "scale");
      v13 = v12;

    }
    else
    {
      objc_msgSend(v3, "displayScale");
      v13 = v14;
    }
    v15 = v9 == 2;
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D270A8]), "initWithGEOStyleAttributes:", v6);
    +[MKIconManager imageForStyle:size:forScale:format:nightMode:](MKIconManager, "imageForStyle:size:forScale:format:nightMode:", v16, 4, 0, v15, v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      v8 = v17;
    }
    else if (v7)
    {
      objc_msgSend(MEMORY[0x1E0DC6500], "sharedManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend((id)v7, "shieldType");
      objc_msgSend((id)v7, "shieldText");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v22 = v13;
      objc_msgSend(v19, "imageForDataID:text:contentScale:sizeGroup:modifiers:", v20, v21, 4, 0, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:scale:orientation:", objc_msgSend(v23, "image"), 0, v13);
        v8 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

id DetailTextsForAdvisoryItem(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(v1, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "count");

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v20 = v1;
    objc_msgSend(v1, "details");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v22 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v10, "titleString");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "stringWithDefaultOptions");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
            objc_msgSend(v4, "addObject:", v12);
          v13 = v10;
          objc_msgSend(v13, "detailStrings");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "count");

          if (v15)
          {
            objc_msgSend(v13, "detailStrings");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "_geo_map:", &__block_literal_global_6);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (v18)
              objc_msgSend(v4, "addObject:", v18);
          }
          else
          {

            v18 = 0;
          }

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v7);
    }

    v3 = (void *)objc_msgSend(v4, "copy");
    v1 = v20;
  }

  return v3;
}

void sub_18B10E040(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18B10E44C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18B10F1E4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

id _MKBestWalletHeroPhotoForGEOMapItem(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v1 = a1;
  objc_msgSend(v1, "businessAssets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "coverPhoto");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 || (_isValidWalletHeroImage(v3) & 1) == 0)
  {
    objc_msgSend(v1, "_photos");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5 || !_isValidWalletHeroImage(v5))
    {
      v6 = 0;
      goto LABEL_7;
    }
    v3 = v5;
  }
  v6 = v3;
  v5 = v6;
LABEL_7:

  return v6;
}

uint64_t _isValidWalletHeroImage(void *a1)
{
  id v1;
  int BOOL;
  int v3;
  int v4;
  uint64_t v5;

  v1 = a1;
  BOOL = GEOConfigGetBOOL();
  v3 = GEOConfigGetBOOL();
  v4 = v3;
  if (BOOL)
  {
    v5 = objc_msgSend(v1, "highQuality");
    if ((v5 & v4 & 1) == 0)
      goto LABEL_7;
  }
  else if (!v3)
  {
    v5 = 1;
    goto LABEL_7;
  }
  v5 = objc_msgSend(v1, "businessProvided");
LABEL_7:

  return v5;
}

uint64_t defaultGenerator_block_invoke()
{
  return 0;
}

void sub_18B1101B0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

id MKGetMKPlaceInlineMapVCLog()
{
  if (qword_1ECE2D6A8 != -1)
    dispatch_once(&qword_1ECE2D6A8, &__block_literal_global_241);
  return (id)_MergedGlobals_3;
}

void sub_18B111F88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id a21)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18B117558(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18B118258(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18B118B9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18B118CB8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_18B118DF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18B118F10(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_18B11903C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18B119178(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_18B119278(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18B11936C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_18B119458(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18B11954C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_18B11962C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18B119720(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_18B119804(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18B1198F8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_18B1199DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18B11AEB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18B11B388(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18B11B568(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _transformAnim(__int128 *a1, __int128 *a2)
{
  void *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = a1[5];
  v20 = a1[4];
  v21 = v5;
  v6 = a1[7];
  v22 = a1[6];
  v23 = v6;
  v7 = a1[1];
  v16 = *a1;
  v17 = v7;
  v8 = a1[3];
  v18 = a1[2];
  v19 = v8;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFromValue:", v9);

  v10 = a2[5];
  v20 = a2[4];
  v21 = v10;
  v11 = a2[7];
  v22 = a2[6];
  v23 = v11;
  v12 = a2[1];
  v16 = *a2;
  v17 = v12;
  v13 = a2[3];
  v18 = a2[2];
  v19 = v13;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setToValue:", v14);

  return v4;
}

id _positionAnim(double a1, double a2, double a3, double a4)
{
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("position"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "_mapkit_valueWithCGPoint:", a1, a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFromValue:", v9);

  objc_msgSend(MEMORY[0x1E0CB3B18], "_mapkit_valueWithCGPoint:", a3, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setToValue:", v10);

  return v8;
}

void sub_18B121A6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void MKMapsSuggestionsLogPredictedTransportMode(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  __CFString *v11;
  int v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  __CFString *v22;
  __int16 v23;
  __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  GEOFindOrCreateLog();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((_DWORD)a1 == (_DWORD)a2)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v12 = a1;
      v11 = CFSTR("AUTOMOBILE");
      v13 = CFSTR("AUTOMOBILE");
      switch(v12)
      {
        case 0:
          break;
        case 1:
          v11 = CFSTR("TRANSIT");
          goto LABEL_19;
        case 2:
          v11 = CFSTR("WALKING");
          goto LABEL_19;
        case 3:
          v11 = CFSTR("BICYCLE");
          goto LABEL_19;
        case 4:
          v11 = CFSTR("UNKNOWN_TRANSPORT_TYPE");
          goto LABEL_19;
        case 5:
          v11 = CFSTR("FERRY");
          goto LABEL_19;
        case 6:
          v11 = CFSTR("RIDESHARE");
LABEL_19:
          v13 = v11;
          break;
        default:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), CFSTR("AUTOMOBILE"));
          v11 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), CFSTR("AUTOMOBILE"));
          v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
          break;
      }
      *(_DWORD *)buf = 138413058;
      v18 = v8;
      v19 = 2112;
      v20 = v7;
      v21 = 2112;
      v22 = v11;
      v23 = 2112;
      v24 = v13;
      _os_log_impl(&dword_18B0B0000, v10, OS_LOG_TYPE_DEBUG, "PTM in %@, %@, Predicted: %@, Actual: %@", buf, 0x2Au);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    if (a1 >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), a1);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = off_1E20D92C8[(int)a1];
    }
    v15 = v14;
    if (a2 >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), a2);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = off_1E20D92C8[(int)a2];
    }
    *(_DWORD *)buf = 138413058;
    v18 = v8;
    v19 = 2112;
    v20 = v7;
    v21 = 2112;
    v22 = v15;
    v23 = 2112;
    v24 = v16;
    _os_log_impl(&dword_18B0B0000, v10, OS_LOG_TYPE_ERROR, "PTM difference in %@, %@, Predicted: %@, Actual: %@", buf, 0x2Au);

  }
}

void MKMapsSuggestionsTransportModeForOriginAndDestination(void *a1, CLLocationDegrees a2, CLLocationDegrees a3, CLLocationDegrees a4, CLLocationDegrees a5)
{
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  const char *v19;
  _QWORD v20[4];
  id v21;
  _QWORD *v22;
  _QWORD v23[3];
  int v24;
  CLLocationCoordinate2D v25;
  CLLocationCoordinate2D v26;

  v9 = a1;
  if (!v9)
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v20[0]) = 0;
      _os_log_impl(&dword_18B0B0000, v10, OS_LOG_TYPE_ERROR, "Need a non-nil handler", (uint8_t *)v20, 2u);
    }
    goto LABEL_27;
  }
  if ((GEOConfigGetBOOL() & 1) == 0)
  {
    GEOFindOrCreateLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    LOWORD(v20[0]) = 0;
    v17 = "MapsSuggestions Feeler Pipeline is disabled";
LABEL_18:
    _os_log_impl(&dword_18B0B0000, v16, OS_LOG_TYPE_ERROR, v17, (uint8_t *)v20, 2u);
    goto LABEL_19;
  }
  v25.latitude = a4;
  v25.longitude = a5;
  if (!CLLocationCoordinate2DIsValid(v25))
  {
    GEOFindOrCreateLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    LOWORD(v20[0]) = 0;
    v17 = "Need a valid destination coordinate";
    goto LABEL_18;
  }
  v26.latitude = a2;
  v26.longitude = a3;
  if (CLLocationCoordinate2DIsValid(v26))
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0D27330]), "initWithLatitude:longitude:", a4, a5);
    objc_msgSend(MEMORY[0x1E0D271E8], "mapItemStorageForPlace:", v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v12 = v9;
    if ((GEOConfigGetBOOL() & 1) != 0)
    {
      if (v11)
      {
        v23[0] = 0;
        v23[1] = v23;
        v23[2] = 0x2020000000;
        v24 = 4;
        if (MKMapsSuggestionsTransportModeForOriginAndDestinationMapItem_s_onceToken != -1)
          dispatch_once(&MKMapsSuggestionsTransportModeForOriginAndDestinationMapItem_s_onceToken, &__block_literal_global_15);
        +[MKMapsSuggestionsPredictor sharedPredictor](MKMapsSuggestionsPredictor, "sharedPredictor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "data");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        NSDataFromCLLocationCoordinates(a2, a3);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __MKMapsSuggestionsTransportModeForOriginAndDestinationMapItem_block_invoke_2;
        v20[3] = &unk_1E20D92A8;
        v21 = v12;
        v22 = v23;
        objc_msgSend(v13, "transportModeForDestinationMapItemData:originCoordinateData:handler:", v14, v15, v20);

        _Block_object_dispose(v23, 8);
        goto LABEL_26;
      }
      GEOFindOrCreateLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v20[0]) = 0;
        v19 = "Need a non-nil MapItem for the destination";
        goto LABEL_24;
      }
    }
    else
    {
      GEOFindOrCreateLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v20[0]) = 0;
        v19 = "MapsSuggestions Feeler Pipeline is disabled";
LABEL_24:
        _os_log_impl(&dword_18B0B0000, v18, OS_LOG_TYPE_ERROR, v19, (uint8_t *)v20, 2u);
      }
    }

    (*((void (**)(id, uint64_t))v12 + 2))(v12, 4);
LABEL_26:

LABEL_27:
    goto LABEL_28;
  }
  GEOFindOrCreateLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v20[0]) = 0;
    v17 = "Need a valid origin coordinate";
    goto LABEL_18;
  }
LABEL_19:

  (*((void (**)(id, uint64_t))v9 + 2))(v9, 4);
LABEL_28:

}

void sub_18B123940(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18B12A21C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18B12A3C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18B12A928(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18B12AA8C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18B12ABF8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v5;

  _Unwind_Resume(a1);
}

void sub_18B12ACCC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18B12AEE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_18B12BD1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,void *a27)
{
  void *v27;
  void *v28;

  _Unwind_Resume(a1);
}

CGPathRef _createClipPath(MKMapPoint *a1, unint64_t a2, CGFloat a3, CGLineCap a4, CGLineJoin a5, CGFloat a6, MKMapPoint a7, double a8, double a9, double a10, double a11)
{
  double y;
  double x;
  CGPath *Mutable;
  CGLineCap v24;
  CGLineCap v25;
  CGPathRef CopyByStrokingPath;

  y = a7.y;
  x = a7.x;
  Mutable = CGPathCreateMutable();
  _MKPolylineAddToPath(Mutable, &a1->x, a2, x, y, a8, a9, a10, a11);
  if (a9 <= 0.0)
    v24 = a4;
  else
    v24 = kCGLineCapButt;
  if (a10 >= 1.0)
    v25 = a4;
  else
    v25 = kCGLineCapButt;
  CopyByStrokingPath = _MKCGPathCreateCopyByStrokingPath(Mutable, v24, v25, a5, a3, a6);
  CGPathRelease(Mutable);
  return CopyByStrokingPath;
}

CGPathRef _createDashedClipPath(double *a1, unint64_t a2, CGLineCap a3, CGLineJoin a4, void *a5, CGFloat a6, CGFloat a7, double a8, double a9, double a10, CGFloat a11, double a12)
{
  CGPath *Mutable;
  size_t v24;
  CGFloat *v25;
  CGLineJoin v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  const CGPath *CopyByDashingPath;
  CGPathRef CopyByStrokingPath;
  CGLineCap lineCap;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v37 = a5;
  Mutable = CGPathCreateMutable();
  _MKPolylineAddToPath(Mutable, a1, a2, a8, a9, a10, 0.0, 1.0, -1.0);
  v24 = objc_msgSend(v37, "count");
  v25 = (CGFloat *)malloc_type_malloc(8 * v24, 0x100004000313F17uLL);
  lineCap = a3;
  v26 = a4;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v27 = v37;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v28)
  {
    v29 = 0;
    v30 = *(_QWORD *)v39;
    do
    {
      v31 = 0;
      do
      {
        if (*(_QWORD *)v39 != v30)
          objc_enumerationMutation(v27);
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v31), "cgFloatValue");
        v25[v29 + v31++] = v32 / a10 * a12;
      }
      while (v28 != v31);
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      v29 += v31;
    }
    while (v28);
  }

  CopyByDashingPath = CGPathCreateCopyByDashingPath(Mutable, 0, a11, v25, v24);
  CopyByStrokingPath = CGPathCreateCopyByStrokingPath(CopyByDashingPath, 0, a6, lineCap, v26, a7);
  CGPathRelease(CopyByDashingPath);
  CGPathRelease(Mutable);
  free(v25);

  return CopyByStrokingPath;
}

void sub_18B12C170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

uint64_t _nextSimplifiedPointIndex(MKMapPoint *a1, unint64_t a2, uint64_t a3, double a4, MKMapPoint a5, double *a6)
{
  uint64_t result;
  double v8;
  MKMapPoint *v9;
  double y;
  double x;
  double v12;
  double v13;
  double *p_y;
  BOOL v15;
  double v16;
  double v17;
  double v18;

  result = a3 + 1;
  if (a3 + 1 >= a2)
    return a2 - 1;
  v8 = 5.0 / a4 * (5.0 / a4);
  v9 = &a1[a3];
  x = v9->x;
  y = v9->y;
  v12 = v9->x - a5.x;
  v13 = y - a5.y;
  p_y = &v9[1].y;
  v15 = 1;
  v16 = 0.0;
  while (1)
  {
    v17 = x;
    v18 = y;
    x = *(p_y - 1);
    y = *p_y;
    v16 = v16 + sqrt((x - v17) * (x - v17) + 0.0 + (*p_y - v18) * (*p_y - v18));
    if ((x - a5.x - v12) * (x - a5.x - v12) + (*p_y - a5.y - v13) * (*p_y - a5.y - v13) >= v8)
      break;
    v15 = ++result < a2;
    p_y += 2;
    if (a2 == result)
      return a2 - 1;
  }
  if (a6)
  {
    *a6 = v16;
    if (v15)
      return result;
    return a2 - 1;
  }
  if (!v15)
    return a2 - 1;
  return result;
}

void _addMiterJoin(CGPath *a1, int a2, double a3, double a4, long double a5, long double a6, long double a7, long double a8, double a9)
{
  double v18;
  double v19;
  double v20;
  double v21;
  long double v22;
  long double v23;
  long double v24;
  double v25;
  double v26;
  double v27;

  v18 = atan2(a8, a7);
  v19 = v18 - atan2(a6, a5);
  if (v19 <= 3.14159265)
  {
    if (v19 >= -3.14159265)
      goto LABEL_6;
    v20 = 6.28318531;
  }
  else
  {
    v20 = -6.28318531;
  }
  v19 = v19 + v20;
LABEL_6:
  v21 = 1.0 / sqrt((a5 + a7) * (a5 + a7) + 0.0 + (a6 + a8) * (a6 + a8));
  v22 = (a5 + a7) * v21;
  v23 = -((a6 + a8) * v21);
  v24 = 1.0 / cos(v19 * 0.5);
  v25 = v23 * v24;
  v26 = v22 * v24;
  if (a2)
  {
    CGPathMoveToPoint(a1, 0, a3 - v25 * a9, a4 - v26 * a9);
    v27 = a3 + v25 * a9;
  }
  else
  {
    CGPathAddLineToPoint(a1, 0, a3 + v25 * a9, a4 + v26 * a9);
    v27 = a3 - v25 * a9;
    v26 = -v26;
  }
  CGPathAddLineToPoint(a1, 0, v27, a4 + v26 * a9);
}

void sub_18B130A48(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 224), 8);
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_18B138A90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  id *v24;

  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id MKKeyForTransitArtwork(void *a1, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int a5, double a6, double a7)
{
  id v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;

  v10 = a1;
  v11 = objc_msgSend(v10, "artworkSourceType");
  objc_msgSend(v10, "shieldDataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "shieldText");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "shieldColorString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v12, "shieldType");
  objc_msgSend(v10, "iconDataSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v17 = objc_msgSend(v16, "cartoID");
  else
    v17 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v18 = objc_msgSend(v16, "defaultTransitType");
  else
    v18 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v19 = objc_msgSend(v16, "iconAttributeKey");
  else
    v19 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v20 = objc_msgSend(v16, "iconAttributeValue");
  else
    v20 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("source:%ld_text:%@_color:%@_shield:%ld_id:%ld_transit:%ld_size:%ld_feature:%ld_padding:%.2f_iconKey:%ld_iconValue:%ld_flipped:%d_nightMode:%d_scale:%.2f"), v11, v13, v14, v15, v17, v18, a2, a3, *(_QWORD *)&a6, v19, v20, a4, a5, *(_QWORD *)&a7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

void PlaceCardLayoutChanged(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  _QWORD block[4];
  id v5;

  v2 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __PlaceCardLayoutChanged_block_invoke;
  block[3] = &unk_1E20D7D98;
  v5 = v2;
  v3 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

BOOL ImageForShieldDataSourceTypeShouldBeFlipped(uint64_t a1)
{
  void *v2;
  void *v3;

  if (qword_1ECE2D930 != -1)
    dispatch_once(&qword_1ECE2D930, &__block_literal_global_25);
  v2 = (void *)_MergedGlobals_136;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "containsObject:", v3);

  return (_DWORD)v2 && (MKApplicationLayoutDirectionIsRightToLeft() & 1) != 0;
}

void checkLevel(unint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  if (a1 >= 2)
  {
    v1 = (void *)MEMORY[0x1E0C99DA0];
    v2 = *MEMORY[0x1E0C99778];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld is not a valid MKOverlayLevel"), a1);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "exceptionWithName:reason:userInfo:", v2, v4, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "raise");

  }
}

void sub_18B1456B0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18B1457C4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18B1458BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_18B1459AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_18B145A94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_18B145B84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_18B145C7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_18B145D9C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18B145E18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_18B145F38(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18B146400(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id MKMapItemIdentifiersArrayFromGEOMapItemIdentifiersArray(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  MKMapItemIdentifier *v9;
  MKMapItemIdentifier *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v1, "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v7);
        v9 = [MKMapItemIdentifier alloc];
        v10 = -[MKMapItemIdentifier initWithGEOMapItemIdentifier:](v9, "initWithGEOMapItemIdentifier:", v8, (_QWORD)v12);
        objc_msgSend(v2, "addObject:", v10);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  return v2;
}

id MKMapItemIdentifiersArrayToGEOMapItemIdentifiersArray(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v1, "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "geoMapItemIdentifier", (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return v2;
}

MKMapItemIdentifier *MKMapItemIdentifierFromGEOTransitLine(void *a1)
{
  id v1;
  MKMapItemIdentifier *v2;
  void *v3;
  MKMapItemIdentifier *v4;

  v1 = a1;
  v2 = [MKMapItemIdentifier alloc];
  objc_msgSend(v1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = -[MKMapItemIdentifier initWithGEOMapItemIdentifier:](v2, "initWithGEOMapItemIdentifier:", v3);
  return v4;
}

MKMapItemIdentifier *MKMapItemIdentifierFromGEOPBTransitLine(void *a1)
{
  id v1;
  MKMapItemIdentifier *v2;
  uint64_t v3;

  v1 = a1;
  v2 = [MKMapItemIdentifier alloc];
  v3 = objc_msgSend(v1, "muid");

  return -[MKMapItemIdentifier initWithMUID:](v2, "initWithMUID:", v3);
}

void sub_18B147A1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18B147C54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

CGPath *CreatePathForPolygon(void *a1, double a2, double a3)
{
  id v5;
  unint64_t v6;
  id v7;
  uint64_t v8;
  CGPath *Mutable;
  double *v10;
  double *v11;
  double v12;
  double v13;
  unint64_t v14;

  v5 = a1;
  v6 = objc_msgSend(v5, "pointCount");
  v7 = objc_retainAutorelease(v5);
  v8 = objc_msgSend(v7, "points");
  if (v6 >= 3)
  {
    v10 = (double *)v8;
    Mutable = CGPathCreateMutable();
    v12 = *v10;
    v13 = v10[1];
    v11 = v10 + 3;
    CGPathMoveToPoint(Mutable, 0, v12 - a2, v13 - a3);
    v14 = v6 - 1;
    do
    {
      CGPathAddLineToPoint(Mutable, 0, *(v11 - 1) - a2, *v11 - a3);
      v11 += 2;
      --v14;
    }
    while (v14);
    CGPathCloseSubpath(Mutable);
  }
  else
  {
    Mutable = 0;
  }

  return Mutable;
}

void sub_18B14A3F0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18B14A9F8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_18B14AC48(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_18B14AD48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18B14B15C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

void sub_18B14B39C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double _MKCartographicConfigurationDefault@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_OWORD *)a1 = xmmword_18B2A9800;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)&result = 1;
  *(_OWORD *)(a1 + 32) = xmmword_18B2A9880;
  *(_BYTE *)(a1 + 48) = 0;
  return result;
}

void _MKCartographicConfigurationDecodeWithCoder(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  *(_QWORD *)(a3 + 48) = 0;
  *(_OWORD *)(a3 + 16) = 0u;
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)a3 = 0u;
  v5 = a2;
  v6 = a1;
  objc_msgSend(v5, "stringByAppendingString:", CFSTR("MKCartographicConfigurationStyle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)a3 = objc_msgSend(v6, "decodeIntegerForKey:", v7);

  objc_msgSend(v5, "stringByAppendingString:", CFSTR("MKCartographicConfigurationEmphasis"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(a3 + 8) = objc_msgSend(v6, "decodeIntegerForKey:", v8);

  objc_msgSend(v5, "stringByAppendingString:", CFSTR("MKCartographicConfigurationProjection"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(a3 + 16) = objc_msgSend(v6, "decodeIntegerForKey:", v9);

  objc_msgSend(v5, "stringByAppendingString:", CFSTR("MKCartographicConfigurationTerrainMode"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(a3 + 24) = objc_msgSend(v6, "decodeIntegerForKey:", v10);

  objc_msgSend(v5, "stringByAppendingString:", CFSTR("MKCartographicConfigurationMapKitUsage"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(a3 + 32) = objc_msgSend(v6, "decodeIntegerForKey:", v11);

  objc_msgSend(v5, "stringByAppendingString:", CFSTR("MKCartographicConfigurationMapKitClientMode"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(a3 + 40) = objc_msgSend(v6, "decodeIntegerForKey:", v12);

  objc_msgSend(v5, "stringByAppendingString:", CFSTR("MKCartographicConfigurationGridOnly"));
  v13 = (id)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v6, "decodeBoolForKey:", v13);
  *(_BYTE *)(a3 + 48) = (_BYTE)v5;

}

void _MKCartographicConfigurationEncodeWithCoder(uint64_t *a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;

  v5 = *a1;
  v6 = a3;
  v7 = a2;
  objc_msgSend(v6, "stringByAppendingString:", CFSTR("MKCartographicConfigurationStyle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeInteger:forKey:", v5, v8);

  v9 = a1[1];
  objc_msgSend(v6, "stringByAppendingString:", CFSTR("MKCartographicConfigurationEmphasis"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeInteger:forKey:", v9, v10);

  v11 = a1[2];
  objc_msgSend(v6, "stringByAppendingString:", CFSTR("MKCartographicConfigurationProjection"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeInteger:forKey:", v11, v12);

  v13 = a1[3];
  objc_msgSend(v6, "stringByAppendingString:", CFSTR("MKCartographicConfigurationTerrainMode"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeInteger:forKey:", v13, v14);

  v15 = a1[4];
  objc_msgSend(v6, "stringByAppendingString:", CFSTR("MKCartographicConfigurationMapKitUsage"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeInteger:forKey:", v15, v16);

  v17 = a1[5];
  objc_msgSend(v6, "stringByAppendingString:", CFSTR("MKCartographicConfigurationMapKitClientMode"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeInteger:forKey:", v17, v18);

  v19 = *((unsigned __int8 *)a1 + 48);
  objc_msgSend(v6, "stringByAppendingString:", CFSTR("MKCartographicConfigurationGridOnly"));
  v20 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "encodeBool:forKey:", v19, v20);
}

id GEOPOICategoriesForPointOfInterestCategories(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id *v7;
  id *v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  void *v12;
  char v13;
  id *v14;
  char v15;
  char v16;
  char v17;
  char v18;
  char v19;
  char v20;
  char v21;
  char v22;
  char v23;
  char v24;
  char v25;
  char v26;
  char v27;
  char v28;
  char v29;
  char v30;
  char v31;
  char v32;
  char v33;
  char v34;
  char v35;
  char v36;
  char v37;
  char v38;
  char v39;
  char v40;
  char v41;
  char v42;
  char v43;
  char v44;
  char v45;
  char v46;
  char v47;
  char v48;
  char v49;
  char v50;
  char v51;
  char v52;
  char v53;
  char v54;
  char v55;
  char v56;
  char v57;
  char v58;
  char v59;
  char v60;
  char v61;
  char v62;
  char v63;
  char v64;
  char v65;
  char v66;
  char v67;
  char v68;
  char v69;
  char v70;
  char v71;
  char v72;
  char v73;
  char v74;
  char v75;
  char v76;
  char v77;
  char v78;
  char v79;
  char v80;
  char v81;
  char v82;
  char v83;
  char v84;
  char v85;
  char v86;
  char v87;
  char v88;
  id v89;
  void *v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  _BYTE v96[128];
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = v1;
  if (v1)
  {
    if (objc_msgSend(v1, "count"))
    {
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v2, "count"));
      v92 = 0u;
      v93 = 0u;
      v94 = 0u;
      v95 = 0u;
      v91 = v2;
      v4 = v2;
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v92, v96, 16);
      if (v5)
      {
        v6 = v5;
        v7 = (id *)MEMORY[0x1E0D26798];
        v8 = (id *)MEMORY[0x1E0D267B0];
        v9 = *(_QWORD *)v93;
        do
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v93 != v9)
              objc_enumerationMutation(v4);
            v11 = *(id *)(*((_QWORD *)&v92 + 1) + 8 * i);
            v12 = v11;
            if (!v11)
              goto LABEL_86;
            v13 = objc_msgSend(v11, "isEqual:", CFSTR("MKPOICategoryAirport"));
            v14 = v7;
            if ((v13 & 1) != 0)
              goto LABEL_84;
            v15 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryAmusementPark"));
            v14 = v8;
            if ((v15 & 1) != 0)
              goto LABEL_84;
            v16 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryAnimalService"));
            v14 = (id *)MEMORY[0x1E0D267B8];
            if ((v16 & 1) != 0)
              goto LABEL_84;
            v17 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryAquarium"));
            v14 = (id *)MEMORY[0x1E0D267C0];
            if ((v17 & 1) != 0)
              goto LABEL_84;
            v18 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryATM"));
            v14 = (id *)MEMORY[0x1E0D26790];
            if ((v18 & 1) != 0)
              goto LABEL_84;
            v19 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryAutomotiveRepair"));
            v14 = (id *)MEMORY[0x1E0D267C8];
            if ((v19 & 1) != 0)
              goto LABEL_84;
            v20 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryBakery"));
            v14 = (id *)MEMORY[0x1E0D267D0];
            if ((v20 & 1) != 0)
              goto LABEL_84;
            v21 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryBank"));
            v14 = (id *)MEMORY[0x1E0D267D8];
            if ((v21 & 1) != 0)
              goto LABEL_84;
            v22 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryBaseball"));
            v14 = (id *)MEMORY[0x1E0D267E0];
            if ((v22 & 1) != 0)
              goto LABEL_84;
            v23 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryBasketball"));
            v14 = (id *)MEMORY[0x1E0D267E8];
            if ((v23 & 1) != 0)
              goto LABEL_84;
            v24 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryBeach"));
            v14 = (id *)MEMORY[0x1E0D267F0];
            if ((v24 & 1) != 0)
              goto LABEL_84;
            v25 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryBeauty"));
            v14 = (id *)MEMORY[0x1E0D267F8];
            if ((v25 & 1) != 0)
              goto LABEL_84;
            v26 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryBowling"));
            v14 = (id *)MEMORY[0x1E0D26800];
            if ((v26 & 1) != 0)
              goto LABEL_84;
            v27 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryBrewery"));
            v14 = (id *)MEMORY[0x1E0D26808];
            if ((v27 & 1) != 0)
              goto LABEL_84;
            v28 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryCafe"));
            v14 = (id *)MEMORY[0x1E0D26810];
            if ((v28 & 1) != 0)
              goto LABEL_84;
            v29 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryCampground"));
            v14 = (id *)MEMORY[0x1E0D26818];
            if ((v29 & 1) != 0)
              goto LABEL_84;
            v30 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryCarRental"));
            v14 = (id *)MEMORY[0x1E0D26820];
            if ((v30 & 1) != 0)
              goto LABEL_84;
            v31 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryCastle"));
            v14 = (id *)MEMORY[0x1E0D26828];
            if ((v31 & 1) != 0)
              goto LABEL_84;
            v32 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryConventionCenter"));
            v14 = (id *)MEMORY[0x1E0D26830];
            if ((v32 & 1) != 0)
              goto LABEL_84;
            v33 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryDistillery"));
            v14 = (id *)MEMORY[0x1E0D26838];
            if ((v33 & 1) != 0)
              goto LABEL_84;
            v34 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryEVCharger"));
            v14 = (id *)MEMORY[0x1E0D26840];
            if ((v34 & 1) != 0)
              goto LABEL_84;
            v35 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryFairground"));
            v14 = (id *)MEMORY[0x1E0D26848];
            if ((v35 & 1) != 0)
              goto LABEL_84;
            v36 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryFireStation"));
            v14 = (id *)MEMORY[0x1E0D26850];
            if ((v36 & 1) != 0)
              goto LABEL_84;
            v37 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryFishing"));
            v14 = (id *)MEMORY[0x1E0D26858];
            if ((v37 & 1) != 0)
              goto LABEL_84;
            v38 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryFitnessCenter"));
            v14 = (id *)MEMORY[0x1E0D26860];
            if ((v38 & 1) != 0)
              goto LABEL_84;
            v39 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryFoodMarket"));
            v14 = (id *)MEMORY[0x1E0D26868];
            if ((v39 & 1) != 0)
              goto LABEL_84;
            v40 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryFortress"));
            v14 = (id *)MEMORY[0x1E0D26870];
            if ((v40 & 1) != 0)
              goto LABEL_84;
            v41 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryGasStation"));
            v14 = (id *)MEMORY[0x1E0D26878];
            if ((v41 & 1) != 0)
              goto LABEL_84;
            v42 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryGolf"));
            v14 = (id *)MEMORY[0x1E0D26888];
            if ((v42 & 1) != 0)
              goto LABEL_84;
            v43 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryGoKart"));
            v14 = (id *)MEMORY[0x1E0D26880];
            if ((v43 & 1) != 0)
              goto LABEL_84;
            v44 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryHiking"));
            v14 = (id *)MEMORY[0x1E0D26890];
            if ((v44 & 1) != 0)
              goto LABEL_84;
            v45 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryHospital"));
            v14 = (id *)MEMORY[0x1E0D26898];
            if ((v45 & 1) != 0)
              goto LABEL_84;
            v46 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryHotel"));
            v14 = (id *)MEMORY[0x1E0D268A0];
            if ((v46 & 1) != 0)
              goto LABEL_84;
            v47 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryKayaking"));
            v14 = (id *)MEMORY[0x1E0D268A8];
            if ((v47 & 1) != 0)
              goto LABEL_84;
            v48 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryLandmark"));
            v14 = (id *)MEMORY[0x1E0D268B0];
            if ((v48 & 1) != 0)
              goto LABEL_84;
            v49 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryLaundry"));
            v14 = (id *)MEMORY[0x1E0D268B8];
            if ((v49 & 1) != 0)
              goto LABEL_84;
            v50 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryLibrary"));
            v14 = (id *)MEMORY[0x1E0D268C0];
            if ((v50 & 1) != 0)
              goto LABEL_84;
            v51 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryMailbox"));
            v14 = (id *)MEMORY[0x1E0D268C8];
            if ((v51 & 1) != 0)
              goto LABEL_84;
            v52 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryMarina"));
            v14 = (id *)MEMORY[0x1E0D268D0];
            if ((v52 & 1) != 0)
              goto LABEL_84;
            v53 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryMiniGolf"));
            v14 = (id *)MEMORY[0x1E0D268D8];
            if ((v53 & 1) != 0)
              goto LABEL_84;
            v54 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryMovieTheater"));
            v14 = (id *)MEMORY[0x1E0D268E0];
            if ((v54 & 1) != 0)
              goto LABEL_84;
            v55 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryMuseum"));
            v14 = (id *)MEMORY[0x1E0D268E8];
            if ((v55 & 1) != 0)
              goto LABEL_84;
            v56 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryMusicVenue"));
            v14 = (id *)MEMORY[0x1E0D268F0];
            if ((v56 & 1) != 0)
              goto LABEL_84;
            v57 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryNationalMonument"));
            v14 = (id *)MEMORY[0x1E0D268F8];
            if ((v57 & 1) != 0)
              goto LABEL_84;
            v58 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryNationalPark"));
            v14 = (id *)MEMORY[0x1E0D26900];
            if ((v58 & 1) != 0)
              goto LABEL_84;
            v59 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryNightlife"));
            v14 = (id *)MEMORY[0x1E0D26908];
            if ((v59 & 1) != 0)
              goto LABEL_84;
            v60 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryPark"));
            v14 = (id *)MEMORY[0x1E0D26910];
            if ((v60 & 1) != 0)
              goto LABEL_84;
            v61 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryParking"));
            v14 = (id *)MEMORY[0x1E0D26918];
            if ((v61 & 1) != 0)
              goto LABEL_84;
            v62 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryPharmacy"));
            v14 = (id *)MEMORY[0x1E0D26920];
            if ((v62 & 1) != 0)
              goto LABEL_84;
            v63 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryPlanetarium"));
            v14 = (id *)MEMORY[0x1E0D26928];
            if ((v63 & 1) != 0)
              goto LABEL_84;
            v64 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryPlayground"));
            v14 = (id *)MEMORY[0x1E0D26930];
            if ((v64 & 1) != 0)
              goto LABEL_84;
            v65 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryPolice"));
            v14 = (id *)MEMORY[0x1E0D26938];
            if ((v65 & 1) != 0)
              goto LABEL_84;
            v66 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryPostOffice"));
            v14 = (id *)MEMORY[0x1E0D26940];
            if ((v66 & 1) != 0)
              goto LABEL_84;
            v67 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryPublicTransport"));
            v14 = (id *)MEMORY[0x1E0D26948];
            if ((v67 & 1) != 0)
              goto LABEL_84;
            v68 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryReligiousSite"));
            v14 = (id *)MEMORY[0x1E0D26958];
            if ((v68 & 1) != 0)
              goto LABEL_84;
            v69 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryRestaurant"));
            v14 = (id *)MEMORY[0x1E0D26960];
            if ((v69 & 1) != 0)
              goto LABEL_84;
            v70 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryRestroom"));
            v14 = (id *)MEMORY[0x1E0D26968];
            if ((v70 & 1) != 0)
              goto LABEL_84;
            v71 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryRockClimbing"));
            v14 = (id *)MEMORY[0x1E0D26970];
            if ((v71 & 1) != 0)
              goto LABEL_84;
            v72 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryRVPark"));
            v14 = (id *)MEMORY[0x1E0D26950];
            if ((v72 & 1) != 0)
              goto LABEL_84;
            v73 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategorySchool"));
            v14 = (id *)MEMORY[0x1E0D26978];
            if ((v73 & 1) != 0)
              goto LABEL_84;
            v74 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategorySkatePark"));
            v14 = (id *)MEMORY[0x1E0D26980];
            if ((v74 & 1) != 0)
              goto LABEL_84;
            v75 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategorySkating"));
            v14 = (id *)MEMORY[0x1E0D26988];
            if ((v75 & 1) != 0)
              goto LABEL_84;
            v76 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategorySkiing"));
            v14 = (id *)MEMORY[0x1E0D26990];
            if ((v76 & 1) != 0)
              goto LABEL_84;
            v77 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategorySoccer"));
            v14 = (id *)MEMORY[0x1E0D26998];
            if ((v77 & 1) != 0)
              goto LABEL_84;
            v78 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategorySpa"));
            v14 = (id *)MEMORY[0x1E0D269A0];
            if ((v78 & 1) != 0)
              goto LABEL_84;
            v79 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryStadium"));
            v14 = (id *)MEMORY[0x1E0D269A8];
            if ((v79 & 1) != 0)
              goto LABEL_84;
            v80 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryStore"));
            v14 = (id *)MEMORY[0x1E0D269B0];
            if ((v80 & 1) != 0)
              goto LABEL_84;
            v81 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategorySurfing"));
            v14 = (id *)MEMORY[0x1E0D269B8];
            if ((v81 & 1) != 0)
              goto LABEL_84;
            v82 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategorySwimming"));
            v14 = (id *)MEMORY[0x1E0D269C0];
            if ((v82 & 1) != 0)
              goto LABEL_84;
            v83 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryTennis"));
            v14 = (id *)MEMORY[0x1E0D269C8];
            if ((v83 & 1) != 0)
              goto LABEL_84;
            v84 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryTheater"));
            v14 = (id *)MEMORY[0x1E0D269D0];
            if ((v84 & 1) != 0)
              goto LABEL_84;
            v85 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryUniversity"));
            v14 = (id *)MEMORY[0x1E0D269D8];
            if ((v85 & 1) != 0
              || (v86 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryVolleyball")),
                  v14 = (id *)MEMORY[0x1E0D269E0],
                  (v86 & 1) != 0)
              || (v87 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryWinery")),
                  v14 = (id *)MEMORY[0x1E0D269E8],
                  (v87 & 1) != 0)
              || (v88 = objc_msgSend(v12, "isEqual:", CFSTR("MKPOICategoryZoo")),
                  v14 = (id *)MEMORY[0x1E0D269F0],
                  (v88 & 1) != 0))
            {
LABEL_84:
              v89 = *v14;

              if (v89)
                objc_msgSend(v3, "addObject:", v89);
            }
            else
            {
LABEL_86:

              v89 = 0;
            }

          }
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v92, v96, 16);
        }
        while (v6);
      }

      v2 = v91;
    }
    else
    {
      v3 = (void *)MEMORY[0x1E0C9AA60];
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

const __CFString *MKPointOfInterestCategoryForGEOPOICategory(void *a1)
{
  id v1;
  void *v2;
  const __CFString *v3;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    if ((objc_msgSend(v1, "isEqual:", *MEMORY[0x1E0D26798]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryAirport");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D267B0]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryAmusementPark");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D267B8]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryAnimalService");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D267C0]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryAquarium");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D26790]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryATM");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D267C8]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryAutomotiveRepair");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D267D0]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryBakery");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D267D8]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryBank");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D267E0]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryBaseball");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D267E8]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryBasketball");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D267F0]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryBeach");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D267F8]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryBeauty");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D26800]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryBowling");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D26808]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryBrewery");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D26810]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryCafe");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D26818]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryCampground");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D26820]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryCarRental");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D26828]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryCastle");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D26830]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryConventionCenter");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D26838]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryDistillery");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D26840]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryEVCharger");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D26848]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryFairground");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D26850]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryFireStation");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D26858]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryFishing");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D26860]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryFitnessCenter");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D26868]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryFoodMarket");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D26870]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryFortress");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D26878]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryGasStation");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D26888]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryGolf");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D26880]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryGoKart");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D26890]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryHiking");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D26898]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryHospital");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D268A0]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryHotel");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D268A8]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryKayaking");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D268B0]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryLandmark");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D268B8]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryLaundry");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D268C0]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryLibrary");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D268C8]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryMailbox");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D268D0]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryMarina");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D268D8]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryMiniGolf");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D268E0]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryMovieTheater");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D268E8]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryMuseum");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D268F0]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryMusicVenue");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D268F8]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryNationalMonument");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D26900]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryNationalPark");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D26908]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryNightlife");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D26910]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryPark");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D26918]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryParking");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D26920]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryPharmacy");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D26928]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryPlanetarium");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D26930]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryPlayground");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D26938]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryPolice");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D26940]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryPostOffice");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D26948]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryPublicTransport");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D26958]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryReligiousSite");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D26960]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryRestaurant");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D26968]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryRestroom");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D26970]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryRockClimbing");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D26950]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryRVPark");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D26978]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategorySchool");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D26980]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategorySkatePark");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D26988]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategorySkating");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D26990]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategorySkiing");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D26998]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategorySoccer");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D269A0]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategorySpa");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D269A8]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryStadium");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D269B0]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryStore");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D269B8]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategorySurfing");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D269C0]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategorySwimming");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D269C8]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryTennis");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D269D0]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryTheater");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D269D8]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryUniversity");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D269E0]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryVolleyball");
    }
    else if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D269E8]) & 1) != 0)
    {
      v3 = CFSTR("MKPOICategoryWinery");
    }
    else if (objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0D269F0]))
    {
      v3 = CFSTR("MKPOICategoryZoo");
    }
    else
    {
      v3 = 0;
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void sub_18B153270(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18B15B22C(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x210], 8);
  _Block_object_dispose(&STACK[0x240], 8);
  _Unwind_Resume(a1);
}

uint64_t _MKRouteContextBuilderCacheEntryKey(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v1 = a1;
  v2 = 0;
  v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v13 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v6, "uniqueRouteID", (_QWORD)v12);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7 == 0;

        if (!v8)
        {
          objc_msgSend(v6, "uniqueRouteID");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "hash");

          v2 = v10 ^ (v2 << 6);
        }
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v3);
  }

  return v2;
}

void sub_18B15C3B4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18B15C46C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18B15CF58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, void *a13, uint64_t a14, void *a15, void *a16, void *a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  uint64_t v28;

  *(_QWORD *)(v28 - 128) = &a28;
  std::vector<VKRouteInfo * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)(v28 - 128));

  _Unwind_Resume(a1);
}

id MKGetMKRouteContextBuilderLog(void)
{
  if (qword_1ECE2D970 != -1)
    dispatch_once(&qword_1ECE2D970, &__block_literal_global_54);
  return (id)_MergedGlobals_140;
}

void sub_18B15D2DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void ___ZL29MKGetMKRouteContextBuilderLogv_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MapKit", "MKRouteContextBuilder");
  v1 = (void *)_MergedGlobals_140;
  _MergedGlobals_140 = (uint64_t)v0;

}

void std::vector<VKRouteInfo * {__strong}>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E20D5C70, MEMORY[0x1E0DE42D0]);
}

void sub_18B15D3D8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5020] + 16);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E0DE4E98], MEMORY[0x1E0DE4390]);
}

void std::vector<VKRouteInfo * {__strong}>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  char *v2;
  char *v4;
  void *v5;
  void *v6;

  v1 = *a1;
  v2 = (char *)**a1;
  if (v2)
  {
    v4 = (char *)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v6 = (void *)*((_QWORD *)v4 - 1);
        v4 -= 8;

      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

char **std::vector<RouteSection>::vector(char **a1, unint64_t a2)
{
  char *v4;
  char *v5;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    if (a2 >= 0xAAAAAAAAAAAAAABLL)
      std::vector<VKRouteInfo * {__strong}>::__throw_length_error[abi:ne180100]();
    v4 = (char *)operator new(24 * a2);
    *a1 = v4;
    a1[1] = v4;
    v5 = &v4[24 * a2];
    a1[2] = v5;
    do
    {
      *(_QWORD *)v4 = 0;
      *((_QWORD *)v4 + 1) = 0;
      *((_DWORD *)v4 + 3) = -1082130432;
      *((_QWORD *)v4 + 2) = 0xBF80000000000000;
      v4 += 24;
    }
    while (v4 != v5);
    a1[1] = v5;
  }
  return a1;
}

void sub_18B15D530(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

id MKGetMKLookAroundLog()
{
  if (MKGetMKLookAroundLog_onceToken != -1)
    dispatch_once(&MKGetMKLookAroundLog_onceToken, &__block_literal_global_3);
  return (id)MKGetMKLookAroundLog_log;
}

id MKGetPlaceCardLog()
{
  if (MKGetPlaceCardLog_onceToken != -1)
    dispatch_once(&MKGetPlaceCardLog_onceToken, &__block_literal_global_5);
  return (id)MKGetPlaceCardLog_log;
}

id MKGetTransitItemUpdaterLog()
{
  if (MKGetTransitItemUpdaterLog_onceToken != -1)
    dispatch_once(&MKGetTransitItemUpdaterLog_onceToken, &__block_literal_global_9);
  return (id)MKGetTransitItemUpdaterLog_log;
}

id MKGetGesturesLog()
{
  if (MKGetGesturesLog_onceToken != -1)
    dispatch_once(&MKGetGesturesLog_onceToken, &__block_literal_global_15);
  return (id)MKGetGesturesLog_log;
}

id MKGetCuratedCollectionsLog()
{
  if (MKGetCuratedCollectionsLog_onceToken != -1)
    dispatch_once(&MKGetCuratedCollectionsLog_onceToken, &__block_literal_global_17);
  return (id)MKGetCuratedCollectionsLog_log;
}

id MKGetClipServicesLog()
{
  if (MKGetClipServicesLog_onceToken != -1)
    dispatch_once(&MKGetClipServicesLog_onceToken, &__block_literal_global_19);
  return (id)MKGetClipServicesLog_log;
}

id MKGetPuckTrackingLog()
{
  if (MKGetPuckTrackingLog_onceToken != -1)
    dispatch_once(&MKGetPuckTrackingLog_onceToken, &__block_literal_global_25);
  return (id)MKGetPuckTrackingLog_log;
}

id MKGetMapItemRequestLog()
{
  if (MKGetMapItemRequestLog_onceToken != -1)
    dispatch_once(&MKGetMapItemRequestLog_onceToken, &__block_literal_global_27);
  return (id)MKGetMapItemRequestLog_log;
}

uint64_t CoreImageLibrary()
{
  uint64_t v0;
  uint64_t v1;
  void *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = CoreImageLibraryCore_frameworkLibrary;
  v7 = CoreImageLibraryCore_frameworkLibrary;
  if (!CoreImageLibraryCore_frameworkLibrary)
  {
    v8 = xmmword_1E20DA200;
    v9 = *(_OWORD *)&off_1E20DA210;
    v1 = _sl_dlopen();
    v5[3] = v1;
    CoreImageLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (void *)abort_report_np();
    __break(1u);
    free(v3);
  }
  return v0;
}

void sub_18B15D9A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCIFilterClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getCIFilterClass_softClass;
  v7 = getCIFilterClass_softClass;
  if (!getCIFilterClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getCIFilterClass_block_invoke;
    v3[3] = &unk_1E20D8078;
    v3[4] = &v4;
    __getCIFilterClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_18B15DA68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCIFilterClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  CoreImageLibrary();
  result = objc_getClass("CIFilter");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCIFilterClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = abort_report_np();
    return (Class)__getCIContextClass_block_invoke(v3);
  }
  return result;
}

_MKZoomSliderView *__getCIContextClass_block_invoke(uint64_t a1)
{
  _MKZoomSliderView *result;
  _MKZoomSliderView *v3;
  SEL v4;
  CGRect v5;

  CoreImageLibrary();
  result = (_MKZoomSliderView *)objc_getClass("CIContext");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    _MergedGlobals_1_4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (_MKZoomSliderView *)abort_report_np();
    return -[_MKZoomSliderView initWithFrame:](v3, v4, v5);
  }
  return result;
}

id _trackShadowImage(CGFloat a1)
{
  void *v2;
  CGContext *CurrentContext;
  id v4;
  id v5;
  CGColor *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id *v11;
  void *v12;
  id v13;
  void *v14;
  CGImage *v15;
  void *v16;
  void *v17;
  _Unwind_Exception *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  CGSize v24;
  CGRect ClipBoundingBox;
  CGRect v26;
  CGRect v27;

  v24.width = 162.0;
  v24.height = 750.0;
  UIGraphicsBeginImageContextWithOptions(v24, 0, a1);
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRoundedRect:cornerRadius:", 75.0, 75.0, 12.0, 600.0, 6.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  ClipBoundingBox = CGContextGetClipBoundingBox(CurrentContext);
  CGContextAddRect(CurrentContext, ClipBoundingBox);
  v4 = objc_retainAutorelease(v2);
  CGContextAddPath(CurrentContext, (CGPathRef)objc_msgSend(v4, "CGPath"));
  CGContextEOClip(CurrentContext);
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = (CGColor *)objc_msgSend(v5, "CGColor");
  CGContextSetShadowWithColor(CurrentContext, *MEMORY[0x1E0C9D820], 75.0, v6);
  objc_msgSend(v5, "setFill");
  UIRectInset();
  UIRectFill(v26);
  if (qword_1EDFB7AE8 != -1)
    dispatch_once(&qword_1EDFB7AE8, &__block_literal_global_36);
  objc_msgSend(getCIFilterClass(), "filterWithName:", CFSTR("CIRandomGenerator"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getCIFilterClass(), "filterWithName:", CFSTR("CIColorMonochrome"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForKey:", CFSTR("outputImage"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v9, CFSTR("inputImage"));

  v10 = (void *)qword_1EDFB7AE0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v11 = (id *)qword_1EDFB7AD8;
  v23 = qword_1EDFB7AD8;
  if (!qword_1EDFB7AD8)
  {
    v12 = (void *)CoreImageLibrary();
    v11 = (id *)dlsym(v12, "kCIOutputImageKey");
    v21[3] = (uint64_t)v11;
    qword_1EDFB7AD8 = (uint64_t)v11;
  }
  _Block_object_dispose(&v20, 8);
  if (!v11)
  {
    dlerror();
    v19 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v20, 8);
    _Unwind_Resume(v19);
  }
  v13 = *v11;
  objc_msgSend(v8, "valueForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (CGImage *)objc_msgSend(v10, "createCGImage:fromRect:", v14, 0.0, 0.0, 162.0, 750.0);

  if (v15)
  {
    CGContextSetAlpha(CurrentContext, 0.25);
    CGContextSetBlendMode(CurrentContext, kCGBlendModeSourceAtop);
    v27.origin.x = 0.0;
    v27.origin.y = 0.0;
    v27.size.width = 162.0;
    v27.size.height = 750.0;
    CGContextDrawImage(CurrentContext, v27, v15);
  }
  CGImageRelease(v15);

  CGContextRestoreGState(CurrentContext);
  UIGraphicsGetImageFromCurrentImageContext();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  objc_msgSend(v16, "resizableImageWithCapInsets:", 115.0, 0.0, 115.0, 0.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

void ___trackShadowImage_block_invoke()
{
  void *v0;
  id v1;
  id v2;
  id *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v0 = (void *)_MergedGlobals_1_4;
  v18 = _MergedGlobals_1_4;
  if (!_MergedGlobals_1_4)
  {
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = (uint64_t)__getCIContextClass_block_invoke;
    v13 = &unk_1E20D8078;
    v14 = &v15;
    __getCIContextClass_block_invoke((uint64_t)&v10);
    v0 = (void *)v16[3];
  }
  v1 = v0;
  _Block_object_dispose(&v15, 8);
  v2 = v1;
  v10 = 0;
  v11 = (uint64_t)&v10;
  v12 = 0x2020000000;
  v3 = (id *)qword_1EDFB7AD0;
  v13 = (void *)qword_1EDFB7AD0;
  if (!qword_1EDFB7AD0)
  {
    v4 = (void *)CoreImageLibrary();
    v3 = (id *)dlsym(v4, "kCIContextWorkingColorSpace");
    *(_QWORD *)(v11 + 24) = v3;
    qword_1EDFB7AD0 = (uint64_t)v3;
  }
  _Block_object_dispose(&v10, 8);
  if (!v3)
  {
    dlerror();
    abort_report_np();
  }
  v5 = *v3;
  v19 = v5;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contextWithOptions:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)qword_1EDFB7AE0;
  qword_1EDFB7AE0 = v8;

}

void sub_18B15F010(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id GEOGetMKIconManagerLog()
{
  if (qword_1ECE2D990 != -1)
    dispatch_once(&qword_1ECE2D990, &__block_literal_global_38);
  return (id)qword_1ECE2D988;
}

void sub_18B160DD8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18B160E98(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18B160F58(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18B161114(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_18B1612A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18B161344(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18B161470(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18B1615A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18B161D44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  void *v27;
  void *v28;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a22, 8);

  _Unwind_Resume(a1);
}

void sub_18B161F4C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18B1620F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20)
{
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  _Unwind_Resume(a1);
}

void sub_18B1621D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18B16236C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18B162574(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_18B162608(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;

  a9.super_class = (Class)_MKIconDiskCache;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_18B1629A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_18B162E54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_18B16319C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void ___ZL10_diskCachev_block_invoke()
{
  NSObject *v0;
  NSObject *v1;
  _MKIconDiskCache *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)qword_1ECE2D998, "URLByAppendingPathComponent:", CFSTR("MapsIcons"));
  v0 = objc_claimAutoreleasedReturnValue();
  if (v0)
    goto LABEL_2;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.Spotlight"));

  if (!v6)
    goto LABEL_8;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLsForDirectory:inDomains:", 13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingPathExtension:", CFSTR("mapsiconcache"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "URLByAppendingPathComponent:", v12);
  v0 = objc_claimAutoreleasedReturnValue();

  if (v0)
  {
LABEL_2:
    GEOGetMKIconManagerLog();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
    {
      v13 = 138412290;
      v14 = v0;
      _os_log_impl(&dword_18B0B0000, v1, OS_LOG_TYPE_DEBUG, "Init cache at %@", (uint8_t *)&v13, 0xCu);
    }

    v2 = -[_MKIconDiskCache initWithDirectoryURL:]([_MKIconDiskCache alloc], "initWithDirectoryURL:", v0);
    v3 = (void *)qword_1ECE2D9A0;
    qword_1ECE2D9A0 = (uint64_t)v2;

  }
  else
  {
LABEL_8:
    GEOGetMKIconManagerLog();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_18B0B0000, v0, OS_LOG_TYPE_DEBUG, "Not using cache, url not defined", (uint8_t *)&v13, 2u);
    }
  }

}

void sub_18B16343C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

id _pairStringsForStyleAttributes(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 33))
  {
    v3 = 0;
    v4 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u_%i"), *(unsigned int *)(*(_QWORD *)a1 + v3), *(unsigned int *)(*(_QWORD *)a1 + v3 + 4));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v5);

      ++v4;
      v3 += 8;
    }
    while (v4 < *(unsigned __int8 *)(a1 + 33));
  }
  if (*(_QWORD *)(a1 + 8))
  {
    _pairStringsForStyleAttributes();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "unionSet:", v6);

  }
  return v2;
}

void sub_18B163584(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t MKGetHasUserConsentedToAddingContributions()
{
  return GEOConfigGetInteger();
}

uint64_t MKSetHasUserConsentedToAddingContributions()
{
  return GEOConfigSetInteger();
}

void sub_18B163EDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)MKMapGestureController;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_18B1640A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_18B16413C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_18B1641B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18B164284(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18B164708(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30)
{
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  _Unwind_Resume(a1);
}

void sub_18B164874(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18B16493C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18B164B18(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18B164EB8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18B164FBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18B165094(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_18B165218(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18B165294(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18B1653C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18B16543C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18B1654F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18B1656A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18B165864(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18B165CB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_18B165DC4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18B165E7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18B165F64(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_18B166500(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,id location)
{
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id *v27;
  id *v28;
  uint64_t v29;

  objc_destroyWeak(v28);
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);

  _Block_object_dispose((const void *)(v29 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_18B1666B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18B166760(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_18B166844(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18B166960(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_18B166AA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18B166D9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18B166E4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18B167060(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18B167110(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18B167648(_Unwind_Exception *a1)
{
  void *v1;
  id *v2;
  id *v3;
  void *v4;
  uint64_t v5;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v5 - 168));

  _Unwind_Resume(a1);
}

void sub_18B167898(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18B167974(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18B167A2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18B167AC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18B167FDC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18B168120(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18B1681D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18B1682B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18B16839C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18B16845C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18B16850C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18B168A64(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;

  objc_destroyWeak((id *)(v2 - 152));

  _Unwind_Resume(a1);
}

void sub_18B168C2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18B168D34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  v11 = v10;

  _Unwind_Resume(a1);
}

void sub_18B168E64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18B168F20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18B168FC8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18B1690D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_18B1691E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_18B1693CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_18B1696AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18B169768(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18B169824(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18B1698E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18B169A30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18B169AE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18B16A8E0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18B16AF34(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18B16B564(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 88));
  _Unwind_Resume(a1);
}

id NSDataFromCLLocationCoordinates(double a1, double a2)
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  if (CLLocationCoordinate2DIsValid(*(CLLocationCoordinate2D *)&a1))
  {
    v17[0] = CFSTR("latitude");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = CFSTR("longitude");
    v18[0] = v4;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
    v6 = objc_claimAutoreleasedReturnValue();

    v12 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v12;
    if (!v7)
    {
      GEOFindOrCreateLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%+.8f, %+.8f"), *(_QWORD *)&a1, *(_QWORD *)&a2);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v14 = v10;
        v15 = 2112;
        v16 = v8;
        _os_log_impl(&dword_18B0B0000, v9, OS_LOG_TYPE_ERROR, "Error archiving coordinate %@: %@", buf, 0x16u);

      }
    }

  }
  else
  {
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18B0B0000, v6, OS_LOG_TYPE_ERROR, "This is not a valid coordinate", buf, 2u);
    }
    v7 = 0;
  }

  return v7;
}

double CLLocationCoordinatesFromNSData(void *a1)
{
  id v1;
  void *v2;
  id v3;
  NSObject *v4;
  double latitude;
  NSObject *v6;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  CLLocationDegrees v13;
  void *v14;
  CLLocationDegrees v15;
  CLLocationCoordinate2D v16;
  NSObject *v17;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (v1)
  {
    v18 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v1, &v18);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v18;
    if (v3)
    {
      GEOFindOrCreateLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v3;
        _os_log_impl(&dword_18B0B0000, v4, OS_LOG_TYPE_ERROR, "Error decoding CoordinateData - %@", buf, 0xCu);
      }

      latitude = *MEMORY[0x1E0C9E500];
    }
    else
    {
      latitude = *MEMORY[0x1E0C9E500];
      objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("latitude"));
      v8 = objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = (void *)v8;
        objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("longitude"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("latitude"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "doubleValue");
          v13 = v12;
          objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("longitude"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "doubleValue");
          v16 = CLLocationCoordinate2DMake(v13, v15);

          if (CLLocationCoordinate2DIsValid(v16))
          {
            latitude = v16.latitude;
          }
          else
          {
            GEOFindOrCreateLog();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v20 = v2;
              _os_log_impl(&dword_18B0B0000, v17, OS_LOG_TYPE_ERROR, "Unarchived an NSDictionary but it doesn't contain valid coordinates. Dictionary: %@", buf, 0xCu);
            }

          }
        }
      }
    }

  }
  else
  {
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18B0B0000, v6, OS_LOG_TYPE_ERROR, "coordinateData should not be nil", buf, 2u);
    }

    latitude = *MEMORY[0x1E0C9E500];
  }

  return latitude;
}

id _MKSlightTurnArrow(uint64_t a1, uint64_t a2, double *a3)
{
  void *v6;
  double v7;
  double *v8;
  uint64_t v9;
  __int128 v10;
  double v11;
  double v12;
  __int128 v14[3];
  double __dst[62];

  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  a3[9] = a3[30];
  if (a2 == 2)
  {
    v8 = a3 + 50;
    goto LABEL_7;
  }
  if (a2 == 1)
  {
    v8 = a3 + 49;
    goto LABEL_7;
  }
  v7 = 0.0;
  if (!a2)
  {
    v8 = a3 + 48;
LABEL_7:
    v7 = *v8;
  }
  v9 = *((_QWORD *)a3 + 51);
  a3[28] = v7;
  *((_QWORD *)a3 + 29) = v9;
  v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v14[0] = *MEMORY[0x1E0C9BAA8];
  v14[1] = v10;
  v14[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  memcpy(__dst, a3, sizeof(__dst));
  MKArrowAppendInitialSegmentToPathInvertingCorners(v6, (uint64_t)__dst, v14, 0, v7);
  v11 = dbl_18B2A9C30[a1 == 0];
  memcpy(__dst, a3, sizeof(__dst));
  MKArrowAppendCurveToPathWithOptions(v6, 0, __dst, v14, 0, v11);
  v12 = a3[51];
  memcpy(__dst, a3, sizeof(__dst));
  MKArrowAppendSegmentToPath(v6, (uint64_t)__dst, v14, v12);
  memcpy(__dst, a3, sizeof(__dst));
  MKArrowAppendArrowheadToPathAndReturnMetricsWithStemAdjustment(v6, (uint64_t)__dst, 0, v14, 0.0);
  return v6;
}

id _MKTurnArrow(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  void *v8;
  double v9;
  double v10;
  __int128 v11;
  double v12;
  double v13;
  __int128 v15[3];
  double __dst[62];

  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(a3 + 72) = *(_QWORD *)(a3 + 376);
  v9 = *(double *)(a3 + 448);
  if (a2 == 2)
  {
    v10 = *(double *)(a3 + 368) - *(double *)(a3 + 360) + *(double *)(a3 + 48) * -0.5 + *(double *)(a3 + 24) * 0.5;
  }
  else
  {
    if (a2 != 1)
      goto LABEL_7;
    v10 = *(double *)(a3 + 368) + (a4 + a4) / -3.0;
  }
  v9 = v9 - v10;
  if (v9 < 0.0)
    v9 = 0.0;
LABEL_7:
  v11 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v15[0] = *MEMORY[0x1E0C9BAA8];
  v15[1] = v11;
  v15[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  memcpy(__dst, (const void *)a3, sizeof(__dst));
  MKArrowAppendInitialSegmentToPathInvertingCorners(v8, (uint64_t)__dst, v15, 0, v9);
  if (a1)
    v12 = -3.14159265;
  else
    v12 = 0.0;
  memcpy(__dst, (const void *)a3, sizeof(__dst));
  MKArrowAppendCurveToPathWithOptions(v8, 0, __dst, v15, 0, v12);
  v13 = *(double *)(a3 + 456);
  memcpy(__dst, (const void *)a3, sizeof(__dst));
  MKArrowAppendSegmentToPath(v8, (uint64_t)__dst, v15, v13);
  memcpy(__dst, (const void *)a3, sizeof(__dst));
  MKArrowAppendArrowheadToPathAndReturnMetricsWithStemAdjustment(v8, (uint64_t)__dst, 0, v15, 0.0);
  return v8;
}

id _MKSharpTurnArrow(uint64_t a1, uint64_t a2, double *a3)
{
  void *v6;
  uint64_t v7;
  double *v8;
  double *v9;
  double v10;
  double v11;
  __int128 v12;
  double v13;
  __int128 v15[3];
  double __dst[62];

  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  a3[9] = a3[26];
  if (a2 == 2)
  {
    v7 = *((_QWORD *)a3 + 27);
    *((_QWORD *)a3 + 9) = v7;
    *((_QWORD *)a3 + 26) = v7;
    v8 = a3 + 54;
    v9 = a3 + 55;
  }
  else
  {
    v8 = a3 + 52;
    v9 = a3 + 53;
  }
  v10 = *v9;
  v11 = *v8;
  v12 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v15[0] = *MEMORY[0x1E0C9BAA8];
  v15[1] = v12;
  v15[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  memcpy(__dst, a3, sizeof(__dst));
  MKArrowAppendInitialSegmentToPathInvertingCorners(v6, (uint64_t)__dst, v15, 0, v11);
  v13 = dbl_18B2A9C40[a1 == 0];
  memcpy(__dst, a3, sizeof(__dst));
  MKArrowAppendCurveToPathWithOptions(v6, 0, __dst, v15, 0, v13);
  memcpy(__dst, a3, sizeof(__dst));
  MKArrowAppendSegmentToPath(v6, (uint64_t)__dst, v15, v10);
  memcpy(__dst, a3, sizeof(__dst));
  MKArrowAppendArrowheadToPathAndReturnMetricsWithStemAdjustment(v6, (uint64_t)__dst, 0, v15, 0.0);
  return v6;
}

id _MKUTurnArrow(uint64_t a1, uint64_t a2, double *a3)
{
  void *v6;
  uint64_t v7;
  double *v8;
  double v9;
  __int128 v10;
  double v11;
  double v12;
  CGFloat v13;
  void *v14;
  double v15;
  __int128 v17[3];
  _BYTE __dst[496];

  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  a3[9] = a3[26];
  if (a2 == 2)
  {
    v7 = *((_QWORD *)a3 + 11);
    *((_QWORD *)a3 + 9) = v7;
    *((_QWORD *)a3 + 10) = v7;
    v8 = a3 + 60;
  }
  else
  {
    v8 = a3 + 58;
  }
  v9 = *v8;
  v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v17[0] = *MEMORY[0x1E0C9BAA8];
  v17[1] = v10;
  v17[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  memcpy(__dst, a3, sizeof(__dst));
  MKArrowAppendInitialSegmentToPathInvertingCorners(v6, (uint64_t)__dst, v17, 0, v9);
  if (a1)
    v11 = -a3[10];
  else
    v11 = a3[10];
  memcpy(__dst, a3, sizeof(__dst));
  MKArrowAppendUTurnCurveToPath(v6, (uint64_t)__dst, v17, v11);
  if (a2 == 2)
  {
    v12 = a3[61];
    memcpy(__dst, a3, sizeof(__dst));
    MKArrowAppendSegmentToPath(v6, (uint64_t)__dst, v17, v12);
    memcpy(__dst, a3, sizeof(__dst));
    v13 = 0.0;
    v14 = v6;
  }
  else
  {
    v15 = a3[59];
    memcpy(__dst, a3, sizeof(__dst));
    v14 = v6;
    v13 = v15;
  }
  MKArrowAppendArrowheadToPathAndReturnMetricsWithStemAdjustment(v14, (uint64_t)__dst, 0, v17, v13);
  return v6;
}

uint64_t MKLaneDirectionIsToTheLeft(unsigned int a1)
{
  uint64_t result;

  result = 1;
  if (a1 <= 8 && ((1 << a1) & 0x117) != 0 || a1 == 256)
    return 0;
  return result;
}

id MKCreateImageForLane(void *a1, int a2, uint64_t a3, double *a4, void *a5, CGFloat *a6)
{
  id v11;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  void *v15;
  double v16;
  CGFloat v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  double __dst[62];
  _BYTE v30[128];
  uint64_t v31;
  CGSize v32;

  v31 = *MEMORY[0x1E0C80C00];
  v11 = a5;
  memcpy(__dst, a6, sizeof(__dst));
  MKCreateBezierPathsForLane(a1, a2, a3, a4, __dst);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = a6[1];
  v14 = a6[2];
  +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "screenScale");
  v17 = v16;
  v32.width = v13;
  v32.height = v14;
  UIGraphicsBeginImageContextWithOptions(v32, 0, v17);

  objc_msgSend(v11, "set");
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v18 = v12;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v26;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v26 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v22++), "fill", (_QWORD)v25);
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v20);
  }

  UIGraphicsGetImageFromCurrentImageContext();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v23;
}

id MKCreateBezierPathsForLane(void *a1, int a2, uint64_t a3, double *a4, double *a5)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  id v21;
  void *v22;
  MKLaneDirectionCollisionCalculator *v23;
  unint64_t v24;
  void *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  uint64_t v36;
  void *v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  void *v47;
  void *v48;
  void *v49;
  unsigned int v50;
  int v51;
  int v52;
  _BOOL4 v53;
  int v54;
  _BOOL4 v55;
  BOOL v56;
  int v57;
  int v58;
  uint64_t v59;
  _BOOL4 v60;
  unsigned int v61;
  double *v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  double v67;
  double v68;
  double v69;
  double v70;
  uint64_t v71;
  void *v72;
  int v73;
  int v74;
  uint64_t v75;
  double v76;
  double v77;
  void *v78;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v83;
  double v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  CGFloat v100;
  CGFloat v101;
  double v102;
  CGFloat v103;
  CGFloat v104;
  double v105;
  CGFloat MaxY;
  CGFloat v107;
  CGFloat v108;
  CGFloat v109;
  CGFloat v110;
  double MinX;
  double MaxX;
  double MinY;
  double v114;
  id v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t k;
  void *v120;
  void *v121;
  int v123;
  BOOL v124;
  BOOL v125;
  uint64_t v126;
  uint64_t v128;
  MKLaneDirectionCollisionCalculator *v129;
  void *v130;
  void *v131;
  void *v132;
  int v133;
  int v135;
  int v136;
  uint64_t v137;
  int v138;
  uint64_t v139;
  int v140;
  uint64_t v141;
  int v142;
  double v143;
  int v144;
  double v145;
  int v146;
  double v147;
  int __src;
  void *v149;
  double v150;
  id v151;
  double v152;
  id obj;
  double obja;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  CGAffineTransform v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  _QWORD v172[4];
  id v173;
  _BYTE v174[128];
  _BYTE v175[128];
  _OWORD v176[8];
  _BYTE __dst[496];
  uint64_t v178;
  CGRect v179;
  CGRect v180;
  CGRect v181;
  CGRect v182;
  CGRect v183;
  CGRect v184;

  v178 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = v7;
  v133 = a2;
  if (a2)
  {
    objc_msgSend(v7, "directions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  if (!objc_msgSend(v10, "direction", a3))
  {

    v10 = 0;
  }
  v132 = v8;
  objc_msgSend(v8, "directions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v172[0] = MEMORY[0x1E0C809B0];
  v172[1] = 3221225472;
  v172[2] = ___MKDirectionsToDrawForLane_block_invoke;
  v172[3] = &unk_1E20DA748;
  v12 = v10;
  v173 = v12;
  objc_msgSend(v11, "sortedArrayUsingComparator:", v172);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v13, "count"));
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v13, "count"));
  v168 = 0u;
  v169 = 0u;
  v170 = 0u;
  v171 = 0u;
  obj = v13;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v168, __dst, 16);
  if (v16)
  {
    v17 = v16;
    LODWORD(v18) = 0;
    v19 = *(_QWORD *)v169;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v169 != v19)
          objc_enumerationMutation(obj);
        v21 = *(id *)(*((_QWORD *)&v168 + 1) + 8 * i);
        if (objc_msgSend(v21, "direction") != (_DWORD)v18)
        {
          if (objc_msgSend(v21, "direction"))
          {
            objc_msgSend(v14, "addObject:", v21);
            v18 = objc_msgSend(v21, "direction");
            if (v21 != v12)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v18);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "addObject:", v22);

            }
          }
        }
      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v168, __dst, 16);
    }
    while (v17);
  }

  v23 = -[MKLaneDirectionCollisionCalculator initWithDirections:]([MKLaneDirectionCollisionCalculator alloc], "initWithDirections:", v15);
  v24 = 0;
  while (v12)
  {
    if (!-[MKLaneDirectionCollisionCalculator hasCollisions](v23, "hasCollisions") || v24 > 8)
      goto LABEL_30;
    if (!-[MKLaneDirectionCollisionCalculator hasDirectionWithMaxCollisions](v23, "hasDirectionWithMaxCollisions"))
    {
      -[MKLaneDirectionCollisionCalculator removeDirectionWithCollisionsLeastSimilarToDirection:](v23, "removeDirectionWithCollisionsLeastSimilarToDirection:", objc_msgSend(v12, "direction"));
      goto LABEL_28;
    }
LABEL_27:
    -[MKLaneDirectionCollisionCalculator removeNextDirectionWithCollisions](v23, "removeNextDirectionWithCollisions");
LABEL_28:
    ++v24;
  }
  -[MKLaneDirectionCollisionCalculator directions](v23, "directions");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v25, "count") > 2)
  {
    v26 = -[MKLaneDirectionCollisionCalculator hasCollisions](v23, "hasCollisions");

    if (!v26 || v24 > 8)
      goto LABEL_30;
    -[MKLaneDirectionCollisionCalculator hasDirectionWithMaxCollisions](v23, "hasDirectionWithMaxCollisions");
    goto LABEL_27;
  }

LABEL_30:
  v149 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v14, "count"));
  v129 = v23;
  -[MKLaneDirectionCollisionCalculator directions](v23, "directions");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v12, "direction"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "arrayByAddingObject:", v28);
    v29 = objc_claimAutoreleasedReturnValue();

    v27 = (void *)v29;
  }
  v130 = v15;
  v131 = v12;
  v166 = 0u;
  v167 = 0u;
  v164 = 0u;
  v165 = 0u;
  v151 = v14;
  v30 = objc_msgSend(v151, "countByEnumeratingWithState:objects:count:", &v164, v176, 16);
  if (v30)
  {
    v31 = v30;
    v138 = 0;
    v146 = 0;
    v140 = 0;
    __src = 0;
    v135 = 0;
    v136 = 0;
    v144 = 0;
    v32 = 0;
    v142 = 0;
    v33 = *(_QWORD *)v165;
    do
    {
      for (j = 0; j != v31; ++j)
      {
        if (*(_QWORD *)v165 != v33)
          objc_enumerationMutation(v151);
        v35 = *(void **)(*((_QWORD *)&v164 + 1) + 8 * j);
        v36 = objc_msgSend(v35, "direction");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v27, "containsObject:", v37);

        if (v38)
        {
          if ((int)v36 > 31)
          {
            if ((_DWORD)v36 == 256)
              v39 = 1;
            else
              v39 = v32;
            v40 = v146;
            if ((_DWORD)v36 == 128)
              v41 = 1;
            else
              v41 = v146;
            if ((_DWORD)v36 == 128)
              v39 = v32;
            v42 = __src;
            if ((_DWORD)v36 == 64)
              v43 = 1;
            else
              v43 = __src;
            if ((_DWORD)v36 == 32)
              v43 = __src;
            v44 = v144;
            if ((_DWORD)v36 == 32)
              v45 = 1;
            else
              v45 = v144;
            if ((int)v36 > 127)
              v40 = v41;
            v146 = v40;
            if ((int)v36 <= 127)
              v42 = v43;
            __src = v42;
            if ((int)v36 <= 127)
              v44 = v45;
            v144 = v44;
            if ((int)v36 > 127)
              v32 = v39;
          }
          else
          {
            switch((int)v36)
            {
              case 1:
                v138 = 1;
                break;
              case 2:
                v140 = 1;
                break;
              case 3:
              case 5:
              case 6:
              case 7:
                break;
              case 4:
                v136 = 1;
                break;
              case 8:
                v135 = 1;
                break;
              default:
                if ((_DWORD)v36 == 16)
                  v46 = 1;
                else
                  v46 = v142;
                v142 = v46;
                break;
            }
          }
          objc_msgSend(v149, "addObject:", v35);
        }
      }
      v31 = objc_msgSend(v151, "countByEnumeratingWithState:objects:count:", &v164, v176, 16);
    }
    while (v31);
  }
  else
  {
    v138 = 0;
    v146 = 0;
    v140 = 0;
    __src = 0;
    v135 = 0;
    v136 = 0;
    v144 = 0;
    v32 = 0;
    v142 = 0;
  }

  if (v131)
  {
    objc_msgSend(v149, "removeObject:", v131);
    objc_msgSend(v149, "insertObject:atIndex:", v131, 0);
  }
  v47 = (void *)objc_msgSend(v149, "copy");

  v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v47, "count"));
  if (v133)
  {
    objc_msgSend(v47, "firstObject");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "direction");

  }
  else
  {
    v50 = 0;
  }
  v51 = v140;
  v52 = v138;
  if (!v138)
  {
    v60 = v146 == 0;
    if (!v140 || !v146)
    {
      v59 = 0;
      v58 = __src;
      if (!(v140 | v146))
      {
        v60 = 1;
        v139 = 0;
        v141 = 0;
        goto LABEL_121;
      }
      v139 = 0;
      v54 = v142;
      if (__src)
        goto LABEL_111;
      goto LABEL_112;
    }
    if (objc_msgSend(v47, "count") == 2)
    {
      if (v50)
      {
        v61 = MKLaneDirectionIsToTheLeft(v50);
        v139 = v61;
        v59 = v61 ^ 1;
      }
      else
      {
        v59 = v128 != 0;
        v139 = v128 == 0;
      }
      goto LABEL_109;
    }
LABEL_108:
    v139 = 0;
    v59 = 0;
LABEL_109:
    v58 = __src;
    v54 = v142;
    goto LABEL_110;
  }
  if (v140 && v32)
    goto LABEL_108;
  v139 = 0;
  v53 = v146 == 0;
  v54 = v142;
  if (v142)
    v55 = v146 == 0;
  else
    v55 = 1;
  if (v140)
    v56 = v136 == 0;
  else
    v56 = 1;
  v57 = v56;
  v58 = __src;
  if (!__src)
    v53 = 1;
  if (v55 && v57)
  {
    v59 = 0;
    if (v53)
    {
      if (v140 && v135)
      {
        v139 = 2;
        v59 = 2;
      }
      else
      {
        if (v144)
          v125 = v146 == 0;
        else
          v125 = 1;
        v126 = 1;
        if (!v125)
          v126 = 2;
        v139 = v126;
        v59 = v126;
      }
    }
  }
  else
  {
    v59 = 0;
  }
LABEL_110:
  v60 = v146 == 0;
  if (!v58)
  {
LABEL_112:
    if (v136 && v32)
      goto LABEL_114;
    if (!v52)
    {
      if (v58)
        v123 = v60;
      else
        v123 = 1;
      if (v136)
        v124 = v140 == 0;
      else
        v124 = 1;
      if (!v124)
        v123 = 0;
      v141 = v123 ^ 1u;
      if (!v60)
        goto LABEL_123;
LABEL_122:
      v143 = 0.0;
      if (v51)
        goto LABEL_123;
      goto LABEL_125;
    }
    v141 = 1;
LABEL_118:
    v62 = a5 + 43;
    goto LABEL_124;
  }
LABEL_111:
  if (!v54)
    goto LABEL_112;
LABEL_114:
  v141 = 2;
  if (v52)
    goto LABEL_118;
LABEL_121:
  if (v60)
    goto LABEL_122;
LABEL_123:
  v62 = a5 + 44;
LABEL_124:
  v143 = *v62;
LABEL_125:
  v162 = 0u;
  v163 = 0u;
  v160 = 0u;
  v161 = 0u;
  v63 = v47;
  v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v160, v175, 16);
  if (!v64)
  {
    v67 = 1.79769313e308;
    v68 = 2.22507386e-308;
    v69 = 2.22507386e-308;
    v70 = 1.79769313e308;
    goto LABEL_170;
  }
  v65 = v64;
  v137 = v59;
  v66 = *(_QWORD *)v161;
  v145 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v147 = *MEMORY[0x1E0C9D538];
  v67 = 1.79769313e308;
  v68 = 2.22507386e-308;
  v69 = 2.22507386e-308;
  v70 = 1.79769313e308;
  while (2)
  {
    v71 = 0;
    while (2)
    {
      if (*(_QWORD *)v161 != v66)
        objc_enumerationMutation(v63);
      v72 = *(void **)(*((_QWORD *)&v160 + 1) + 8 * v71);
      v73 = MKLaneDirectionIsToTheLeft(objc_msgSend(v72, "direction"));
      v74 = objc_msgSend(v72, "direction");
      if (v74 <= 15)
      {
        switch(v74)
        {
          case 0:
          case 1:
            v75 = *(_QWORD *)a5;
            v76 = a5[1];
            v77 = a5[2];
            memcpy(&__dst[24], a5 + 3, 0x1D8uLL);
            objc_msgSend(MEMORY[0x1E0CEA390], "bezierPath");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            *(_QWORD *)__dst = v75;
            *(double *)&__dst[8] = v76;
            *(double *)&__dst[16] = v77;
            MKArrowAppendStraightArrowToPathInRect(v78, (double *)__dst, 0, v147, v145, v76, v77);
            if (!v78)
              goto LABEL_166;
            v150 = v70;
            v152 = v68;
            obja = v67;
            objc_msgSend(v78, "bounds");
            x = v179.origin.x;
            y = v179.origin.y;
            width = v179.size.width;
            height = v179.size.height;
            v83 = a5[1];
            v84 = -(CGRectGetMidX(v179) - v83 * 0.5);
            break;
          case 2:
            memcpy(__dst, a5, sizeof(__dst));
            v89 = 0;
            v90 = v139;
            goto LABEL_151;
          case 4:
            memcpy(__dst, a5, sizeof(__dst));
            v91 = 0;
            goto LABEL_149;
          case 8:
            v87 = 2 * (objc_msgSend(v63, "count") == 1);
            memcpy(__dst, a5, sizeof(__dst));
            v88 = 0;
            goto LABEL_145;
          default:
            goto LABEL_166;
        }
LABEL_157:
        v105 = a5[2];
        v180.origin.x = x;
        v180.origin.y = y;
        v180.size.width = width;
        v180.size.height = height;
        MaxY = CGRectGetMaxY(v180);
        CGAffineTransformMakeTranslation(&v159, v84, v105 - MaxY);
        objc_msgSend(v78, "applyTransform:", &v159);
        objc_msgSend(v78, "bounds");
        v107 = v181.origin.x;
        v108 = v181.origin.y;
        v109 = v181.size.width;
        v110 = v181.size.height;
        MinX = CGRectGetMinX(v181);
        v182.origin.x = v107;
        v182.origin.y = v108;
        v182.size.width = v109;
        v182.size.height = v110;
        MaxX = CGRectGetMaxX(v182);
        v183.origin.x = v107;
        v183.origin.y = v108;
        v183.size.width = v109;
        v183.size.height = v110;
        MinY = CGRectGetMinY(v183);
        v184.origin.x = v107;
        v184.origin.y = v108;
        v184.size.width = v109;
        v184.size.height = v110;
        v114 = CGRectGetMaxY(v184);
        v70 = v150;
        v68 = v152;
        if (MinX < v150)
          v70 = MinX;
        if (MaxX > v152)
          v68 = MaxX;
        v67 = obja;
        if (MinY < obja)
          v67 = MinY;
        if (v114 > v69)
          v69 = v114;
        objc_msgSend(v48, "addObject:", v78);

        goto LABEL_166;
      }
      if (v74 <= 63)
      {
        if (v74 == 16)
        {
          v85 = 2 * (objc_msgSend(v63, "count") == 1);
          memcpy(__dst, a5, sizeof(__dst));
          v86 = 1;
          goto LABEL_147;
        }
        if (v74 != 32)
          goto LABEL_166;
        v87 = 2 * (objc_msgSend(v63, "count") == 1);
        memcpy(__dst, a5, sizeof(__dst));
        v88 = 1;
LABEL_145:
        _MKSharpTurnArrow(v88, v87, (double *)__dst);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        switch(v74)
        {
          case 64:
            memcpy(__dst, a5, sizeof(__dst));
            v91 = 1;
LABEL_149:
            _MKTurnArrow(v91, v141, (uint64_t)__dst, v143);
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            break;
          case 128:
            memcpy(__dst, a5, sizeof(__dst));
            v89 = 1;
            v90 = v137;
LABEL_151:
            _MKSlightTurnArrow(v89, v90, (double *)__dst);
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            break;
          case 256:
            v85 = 2 * (objc_msgSend(v63, "count") == 1);
            memcpy(__dst, a5, sizeof(__dst));
            v86 = 0;
LABEL_147:
            _MKUTurnArrow(v86, v85, (double *)__dst);
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            break;
          default:
            goto LABEL_166;
        }
      }
      v78 = v92;
      if (v92)
      {
        v150 = v70;
        v152 = v68;
        obja = v67;
        objc_msgSend(v92, "bounds");
        x = v95;
        y = v96;
        width = v93;
        height = v94;
        v97 = a5[1];
        v98 = a5[3];
        if (v73)
        {
          v99 = v98 * 0.5 + v97 * 0.5;
          v100 = x;
          v101 = y;
          v102 = CGRectGetMaxX(*(CGRect *)(&v93 - 2));
        }
        else
        {
          v99 = v98 * -0.5 + v97 * 0.5;
          v103 = x;
          v104 = y;
          v102 = CGRectGetMinX(*(CGRect *)(&v93 - 2));
        }
        v84 = v99 - v102;
        goto LABEL_157;
      }
LABEL_166:
      if (v65 != ++v71)
        continue;
      break;
    }
    v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v160, v175, 16);
    if (v65)
      continue;
    break;
  }
LABEL_170:

  memset(__dst, 0, 48);
  CGAffineTransformMakeTranslation((CGAffineTransform *)__dst, -v70, -v67);
  v157 = 0u;
  v158 = 0u;
  v155 = 0u;
  v156 = 0u;
  v115 = v48;
  v116 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v155, v174, 16);
  if (v116)
  {
    v117 = v116;
    v118 = *(_QWORD *)v156;
    do
    {
      for (k = 0; k != v117; ++k)
      {
        if (*(_QWORD *)v156 != v118)
          objc_enumerationMutation(v115);
        v120 = *(void **)(*((_QWORD *)&v155 + 1) + 8 * k);
        v176[0] = *(_OWORD *)__dst;
        v176[1] = *(_OWORD *)&__dst[16];
        v176[2] = *(_OWORD *)&__dst[32];
        objc_msgSend(v120, "applyTransform:", v176);
      }
      v117 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v155, v174, 16);
    }
    while (v117);
  }

  if (a4)
  {
    *a4 = v68 - v70;
    a4[1] = v69 - v67;
  }
  v121 = (void *)objc_msgSend(v115, "copy");

  return v121;
}

uint64_t _MKBlurEffectStyleForTraitCollection()
{
  return 1100;
}

uint64_t _MKPlaceCardUseSmallerFont()
{
  if (qword_1ECE2D9D8 != -1)
    dispatch_once(&qword_1ECE2D9D8, &__block_literal_global_42);
  return _MergedGlobals_144;
}

void sub_18B1756D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id MKServiceGapDescription(void *a1, void *a2, void *a3, int a4)
{
  id v7;
  id v8;
  id v9;
  __CFString *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v18;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  if (!a4)
  {
    if (!v7)
    {
      v10 = CFSTR("No upcoming service");
      goto LABEL_9;
    }
    objc_msgSend(v7, "timeIntervalSinceDate:", v8);
    if (v11 >= 43200.0)
    {
      v18 = 0;
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "_navigation_transitRelativeDateStringForDate:context:inTimeZone:outUsedFormat:", v7, 5, v9, &v18);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = 0;
      if (v18 > 2)
      {
LABEL_13:

        goto LABEL_14;
      }
      _MKLocalizedStringFromThisBundle(off_1E20DA930[v18]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v14, v12);
    }
    else
    {
      if (qword_1ECE2DA08 != -1)
        dispatch_once(&qword_1ECE2DA08, &__block_literal_global_43);
      objc_msgSend((id)_MergedGlobals_145, "setTimeZone:", v9);
      _MKLocalizedStringFromThisBundle(CFSTR("ServiceResume_AbsoluteTime"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend((id)_MergedGlobals_145, "stringFromDate:", v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringWithFormat:", v12, v14);
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_13;
  }
  v10 = CFSTR("Service interrupted");
LABEL_9:
  _MKLocalizedStringFromThisBundle(v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

  return v15;
}

void sub_18B176B00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  char a69;

  _Block_object_dispose(&a57, 8);
  _Block_object_dispose(&a63, 8);
  _Block_object_dispose(&a69, 8);
  _Block_object_dispose(&STACK[0x210], 8);
  _Block_object_dispose(&STACK[0x230], 8);
  _Unwind_Resume(a1);
}

Class __getTUCallCapabilitiesClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  TelephonyUtilitiesLibrary();
  result = objc_getClass("TUCallCapabilities");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    _MergedGlobals_146 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = abort_report_np();
    return (Class)getTUDialRequestClass(v3);
  }
  return result;
}

id getTUDialRequestClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getTUDialRequestClass_softClass;
  v7 = getTUDialRequestClass_softClass;
  if (!getTUDialRequestClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getTUDialRequestClass_block_invoke;
    v3[3] = &unk_1E20D8078;
    v3[4] = &v4;
    __getTUDialRequestClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_18B17B22C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getTUDialRequestClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  TelephonyUtilitiesLibrary();
  result = objc_getClass("TUDialRequest");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getTUDialRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = abort_report_np();
    return __getTUCallProviderManagerClass_block_invoke(v3);
  }
  return result;
}

Class __getTUCallProviderManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  TelephonyUtilitiesLibrary();
  result = objc_getClass("TUCallProviderManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_1ECE2DA18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = abort_report_np();
    return (Class)getTUHandleClass(v3);
  }
  return result;
}

id getTUHandleClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getTUHandleClass_softClass;
  v7 = getTUHandleClass_softClass;
  if (!getTUHandleClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getTUHandleClass_block_invoke;
    v3[3] = &unk_1E20D8078;
    v3[4] = &v4;
    __getTUHandleClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_18B17B3BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getTUHandleClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  TelephonyUtilitiesLibrary();
  result = objc_getClass("TUHandle");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getTUHandleClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = abort_report_np();
    return (Class)mk_TUConvertDestinationIDToLatinNumbers(v3);
  }
  return result;
}

id mk_TUConvertDestinationIDToLatinNumbers(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  _Unwind_Exception *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;

  v1 = a1;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v2 = getTUConvertDestinationIDToLatinNumbersSymbolLoc_ptr;
  v10 = getTUConvertDestinationIDToLatinNumbersSymbolLoc_ptr;
  if (!getTUConvertDestinationIDToLatinNumbersSymbolLoc_ptr)
  {
    v3 = (void *)TelephonyUtilitiesLibrary();
    v2 = dlsym(v3, "TUConvertDestinationIDToLatinNumbers");
    v8[3] = (uint64_t)v2;
    getTUConvertDestinationIDToLatinNumbersSymbolLoc_ptr = v2;
  }
  _Block_object_dispose(&v7, 8);
  if (!v2)
  {
    dlerror();
    v6 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(v6);
  }
  ((void (*)(id))v2)(v1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void sub_18B17B95C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18B17DAE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _mapItemsForGeoMapItemsWithHandler(void *a1, void *a2)
{
  id v3;
  void (**v4)(id, void *, void *);
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (v4)
  {
    v5 = objc_msgSend(v3, "count");
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v7 = v3;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v17;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v17 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
            if (objc_msgSend(v12, "conformsToProtocol:", &unk_1EE014C58, (_QWORD)v16)
              && objc_msgSend(v12, "isValid"))
            {
              +[MKMapItem _itemWithGeoMapItem:](MKMapItem, "_itemWithGeoMapItem:", v12);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "addObject:", v13);

            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v9);
      }

      if (v6 && objc_msgSend(v6, "count"))
      {
        v14 = 0;
LABEL_18:
        v4[2](v4, v6, v14);

        goto LABEL_19;
      }
    }
    else
    {
      v6 = 0;
    }
    v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v14 = (void *)objc_msgSend(v15, "initWithDomain:code:userInfo:", MKErrorDomain, 4, 0);

    v6 = 0;
    goto LABEL_18;
  }
LABEL_19:

}

id _deviceKeyboardLanguageIfAvailable()
{
  void *v0;
  void *v1;
  void *v2;

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "textInputMode");
    v1 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v1, "primaryLanguage");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v2, "length"))
    {

      v2 = 0;
    }

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

void sub_18B18BE18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18B18EB60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18B18F2AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL ___notifyCenterOffsetChanged_block_invoke()
{
  _BOOL8 result;

  result = _MKLinkedOnOrAfterReleaseSet(257);
  byte_1EDFB7A61 = result;
  return result;
}

id MKAddressStringForAddressDictionary(void *a1, unsigned int a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v18 = a2;
  if (qword_1ECE2DA38 != -1)
    dispatch_once(&qword_1ECE2DA38, &__block_literal_global_51);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v3, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend((id)_MergedGlobals_148, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v12)
          {
            objc_msgSend(v3, "objectForKeyedSubscript:", v10);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, v11);

          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

  v14 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(MEMORY[0x1E0C973A8], "postalAddressWithDictionaryRepresentation:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C973B0], "singleLineStringFromPostalAddress:addCountryName:", v15, v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

id MKAddressDictionaryFromPostalAddress(void *a1)
{
  void *v1;
  void *v2;

  if (a1)
  {
    objc_msgSend(a1, "dictionaryRepresentation");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    geoAddressDictionaryFromContactsAddressDictionary(v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

id geoAddressDictionaryFromContactsAddressDictionary(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[8];
  _QWORD v13[9];

  v13[8] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("street");
  v12[1] = CFSTR("city");
  v13[0] = CFSTR("Street");
  v13[1] = CFSTR("City");
  v12[2] = CFSTR("state");
  v12[3] = CFSTR("subAdministrativeArea");
  v13[2] = CFSTR("State");
  v13[3] = CFSTR("SubAdministrativeArea");
  v12[4] = CFSTR("subLocality");
  v12[5] = CFSTR("postalCode");
  v13[4] = CFSTR("SubLocality");
  v13[5] = CFSTR("ZIP");
  v12[6] = CFSTR("country");
  v12[7] = CFSTR("ISOCountryCode");
  v13[6] = CFSTR("Country");
  v13[7] = CFSTR("CountryCode");
  v1 = (void *)MEMORY[0x1E0C99D80];
  v2 = a1;
  objc_msgSend(v1, "dictionaryWithObjects:forKeys:count:", v13, v12, 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v2, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __geoAddressDictionaryFromContactsAddressDictionary_block_invoke;
  v9[3] = &unk_1E20DAEB8;
  v10 = v3;
  v11 = v4;
  v5 = v4;
  v6 = v3;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v9);

  v7 = (void *)objc_msgSend(v5, "copy");
  return v7;
}

id MKAddressDictionaryFromContactsDictionary(void *a1)
{
  if (a1)
  {
    geoAddressDictionaryFromContactsAddressDictionary(a1);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

id MKAddressDictionaryFromCLPlacemark(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  if (a1)
  {
    v1 = (void *)MEMORY[0x1E0C99E08];
    v2 = a1;
    objc_msgSend(v1, "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "thoroughfare");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("street"));

    objc_msgSend(v2, "subLocality");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("subLocality"));

    objc_msgSend(v2, "locality");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("city"));

    objc_msgSend(v2, "subAdministrativeArea");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("subAdministrativeArea"));

    objc_msgSend(v2, "administrativeArea");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("state"));

    objc_msgSend(v2, "postalCode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("postalCode"));

    objc_msgSend(v2, "country");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("country"));

    objc_msgSend(v2, "ISOcountryCode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("ISOCountryCode"));
    if (objc_msgSend(v3, "count") && (v12 = (void *)objc_msgSend(v3, "copy")) != 0)
    {
      v13 = v12;
      geoAddressDictionaryFromContactsAddressDictionary(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }
  return v14;
}

void __geoAddressDictionaryFromContactsAddressDictionary_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0 || objc_msgSend(v5, "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = v6;
    else
      v7 = v9;
    v8 = v7;

    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, v8);
  }

}

void sub_18B196F90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id a16)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

void sub_18B1981EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, ...)
{
  void *v7;
  va_list va;

  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18B198394(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_18B198448(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18B1984E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18B198624(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  void *v11;
  uint64_t v12;
  va_list va;

  va_start(va, a11);

  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v12 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_18B198790(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  void *v11;
  uint64_t v12;
  va_list va;

  va_start(va, a11);

  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v12 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_18B198878(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18B198918(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_18B1989E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void **std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,objc_object * {__strong}*,objc_object * {__strong}*,objc_object * {__strong}*,0>(void **a1, void **a2, void **a3)
{
  void **v5;
  void *v6;
  void *v7;

  if (a1 != a2)
  {
    v5 = a1;
    do
    {
      v6 = *v5;
      *v5++ = 0;
      v7 = *a3;
      *a3++ = v6;

    }
    while (v5 != a2);
  }
  return a3;
}

uint64_t MKCompassPointFromLocationDirection(double a1)
{
  uint64_t result;
  unint64_t v2;
  unint64_t v3;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  result = 0;
  if (a1 >= 0.0 && a1 < 360.0)
  {
    v2 = llround(a1 / 360.0 * 8.0);
    v3 = v2 & 7;
    v5 = -(uint64_t)v2;
    v4 = v5 < 0;
    v6 = v5 & 7;
    if (v4)
      v7 = v3;
    else
      v7 = -v6;
    if ((v7 & 0x8000000000000000) != 0)
      return 0;
    else
      return dword_18B2A9E78[v7];
  }
  return result;
}

id MKLocalizedAbbreviationForCompassPoint(int a1)
{
  if ((a1 - 1) > 7)
    return 0;
  _MKLocalizedStringFromThisBundle(off_1E20DB210[a1 - 1]);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t MKCompassPointNEWSFromLocationDirection(double a1)
{
  uint64_t result;
  unint64_t v2;
  unint64_t v3;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  result = 0;
  if (a1 >= 0.0 && a1 < 360.0)
  {
    v2 = llround(a1 / 360.0 * 4.0);
    v3 = v2 & 3;
    v5 = -(uint64_t)v2;
    v4 = v5 < 0;
    v6 = v5 & 3;
    if (v4)
      v7 = v3;
    else
      v7 = -v6;
    if ((v7 & 0x8000000000000000) != 0)
      return 0;
    else
      return __const_MKCompassPointNEWSFromLocationDirection_quad[v7];
  }
  return result;
}

void sub_18B19AF3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18B1A0714(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18B1A0834(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18B1A2FFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18B1A44CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18B1A4BB8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18B1A4ED8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, id *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28)
{
  id *v28;

  objc_destroyWeak(v28);
  objc_destroyWeak(location);
  objc_destroyWeak(a11);
  objc_destroyWeak(&a28);
  _Unwind_Resume(a1);
}

id _MKLocalizedStringFromThisBundleFromTable(void *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB34D0];
  v4 = a2;
  v5 = a1;
  objc_msgSend(v3, "_mapkitBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_mapkit_localizedStringForKey:value:table:", v5, CFSTR("<unlocalized>"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t MKCompareLocatableObjects(void *a1, void *a2, uint64_t a3)
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  BOOL v21;
  uint64_t v22;

  objc_msgSend(a1, "coordinate");
  v7 = v6;
  v9 = v8;
  objc_msgSend(a2, "coordinate");
  v12 = v10;
  v13 = v11;
  switch(*(_QWORD *)a3)
  {
    case 0:
      v14 = v7 <= v10;
      if (v7 < v10)
        goto LABEL_24;
      goto LABEL_25;
    case 1:
      v14 = v9 <= v11;
      if (v9 >= v11)
        goto LABEL_25;
      goto LABEL_24;
    case 2:
      GEOCalculateDistance();
      v16 = v15;
      GEOCalculateDistance();
      goto LABEL_23;
    case 3:
      if (objc_msgSend(a1, "isHidden") && objc_msgSend(a2, "isHidden"))
      {
        if (a1 >= a2)
        {
          if (a2 >= a1)
            return 0;
          goto LABEL_26;
        }
LABEL_24:
        v21 = *(_BYTE *)(a3 + 64) == 0;
        v22 = -1;
        goto LABEL_27;
      }
      if (!objc_msgSend(a1, "isHidden") || (objc_msgSend(a2, "isHidden") & 1) != 0)
      {
        if (!objc_msgSend(a2, "isHidden") || (objc_msgSend(a1, "isHidden") & 1) != 0)
        {
          objc_msgSend(a1, "superview");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
            objc_msgSend(a1, "center");
          else
            objc_msgSend(*(id *)(a3 + 56), "convertCoordinate:toPointToView:", *(_QWORD *)(a3 + 56), v7, v9);

          objc_msgSend(a2, "superview");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
            objc_msgSend(a2, "center");
          else
            objc_msgSend(*(id *)(a3 + 56), "convertCoordinate:toPointToView:", *(_QWORD *)(a3 + 56), v12, v13);

          GEODistanceBetweenPointAndLine();
          v16 = v20;
          GEODistanceBetweenPointAndLine();
LABEL_23:
          v14 = v16 <= v17;
          if (v16 >= v17)
          {
LABEL_25:
            if (v14)
              return 0;
            goto LABEL_26;
          }
        }
        goto LABEL_24;
      }
LABEL_26:
      v21 = *(_BYTE *)(a3 + 64) == 0;
      v22 = 1;
LABEL_27:
      if (v21)
        return v22;
      else
        return -v22;
    default:
      return 0;
  }
}

id MKLocalizedStringForApproximateLocation()
{
  if (qword_1ECE2DA68 != -1)
    dispatch_once(&qword_1ECE2DA68, &__block_literal_global_57);
  return (id)_MergedGlobals_151;
}

id MKLocalizedStringForCurrentLocation()
{
  if (qword_1ECE2DA78 != -1)
    dispatch_once(&qword_1ECE2DA78, &__block_literal_global_23_0);
  return (id)qword_1ECE2DA70;
}

id MKLocalizedStringForUnknownLocation()
{
  if (qword_1ECE2DA88 != -1)
    dispatch_once(&qword_1ECE2DA88, &__block_literal_global_28_0);
  return (id)qword_1ECE2DA80;
}

id _CreateCoordinateComponentString(int a1, double a2, double a3)
{
  const __CFString *v4;
  const __CFString *v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  double v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;

  if (a1)
    a2 = a3;
  v4 = CFSTR("N");
  v5 = CFSTR("E");
  if ((uint64_t)(a2 * 3600.0) < 0)
  {
    v4 = CFSTR("S");
    v5 = CFSTR("W");
  }
  if (a1)
    v6 = (__CFString *)v5;
  else
    v6 = (__CFString *)v4;
  _MKLocalizedStringFromThisBundle(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((int)(uint64_t)a2 >= 0)
    v8 = (uint64_t)a2;
  else
    v8 = -(uint64_t)a2;
  v9 = fabs((a2 - (double)(uint64_t)a2) * 60.0);
  v10 = (uint64_t)v9;
  v11 = (v9 - (double)(uint64_t)v9) * 60.0;
  v12 = objc_retainAutorelease(v7);

  v13 = v12;
  v14 = (void *)MEMORY[0x1E0CB37F0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringFromNumber:numberStyle:", v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x1E0CB37F0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringFromNumber:numberStyle:", v18, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0CB37F0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (uint64_t)v11);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringFromNumber:numberStyle:", v21, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_alloc(MEMORY[0x1E0CB3940]);
  _MKLocalizedStringFromThisBundle(CFSTR("%1$@°%2$@′%3$@″ %4$@"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v23, "initWithFormat:", v24, v16, v19, v22, v13, 0);

  return v25;
}

unint64_t MKIntegerHash(uint64_t a1)
{
  unint64_t v1;

  v1 = 265 * (((a1 << 21) - 1) ^ ((unint64_t)((a1 << 21) - 1) >> 24));
  return 2147483649u * ((21 * (v1 ^ (v1 >> 14))) ^ ((21 * (v1 ^ (v1 >> 14))) >> 28));
}

unint64_t MKLongHash(uint64_t a1)
{
  unint64_t v1;

  v1 = 21 * ((~a1 + (a1 << 18)) ^ ((unint64_t)(~a1 + (a1 << 18)) >> 31));
  return (65 * (v1 ^ (v1 >> 11))) ^ ((65 * (v1 ^ (v1 >> 11))) >> 22);
}

__CFString *MKCurrencySymbolForLocale(void *a1)
{
  void *v1;
  __CFString *v2;
  uint64_t v3;
  __CFString *v4;
  uint64_t v5;

  objc_msgSend(a1, "objectForKey:", *MEMORY[0x1E0C997C0]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "length") == 1)
  {
    v2 = v1;
LABEL_10:
    v4 = v2;
    goto LABEL_11;
  }
  if (objc_msgSend(v1, "length"))
  {
    v3 = 0;
    v4 = CFSTR("$");
    while (1)
    {
      v5 = objc_msgSend(v1, "characterAtIndex:", v3);
      if (u_charType(v5) == 25)
        break;
      if (++v3 >= (unint64_t)objc_msgSend(v1, "length"))
        goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%C"), v5);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v4 = CFSTR("$");
LABEL_11:

  return v4;
}

uint64_t initNetworkIOThread()
{
  uint64_t v0;
  void *v1;
  pthread_mutexattr_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.__sig = 0;
  *(_QWORD *)v3.__opaque = 0;
  pthread_mutexattr_init(&v3);
  pthread_mutexattr_settype(&v3, 0);
  pthread_mutex_init(&stru_1ECE2DB08, &v3);
  pthread_mutexattr_destroy(&v3);
  pthread_cond_init(&stru_1ECE2DAD8, 0);
  pthread_mutex_lock(&stru_1ECE2DB08);
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3978]), "initWithTarget:selector:object:", objc_opt_class(), sel__mapkit_runThread_, CFSTR("NetworkIO"));
  v1 = (void *)qword_1ECE2DA90;
  qword_1ECE2DA90 = v0;

  objc_msgSend((id)qword_1ECE2DA90, "start");
  pthread_cond_wait(&stru_1ECE2DAD8, &stru_1ECE2DB08);
  return pthread_mutex_unlock(&stru_1ECE2DB08);
}

void sub_18B1ABAB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t SecurityLibrary()
{
  uint64_t v0;
  uint64_t v1;
  void *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = SecurityLibraryCore_frameworkLibrary;
  v7 = SecurityLibraryCore_frameworkLibrary;
  if (!SecurityLibraryCore_frameworkLibrary)
  {
    v8 = xmmword_1E20DB620;
    v9 = *(_OWORD *)&off_1E20DB630;
    v1 = _sl_dlopen();
    v5[3] = v1;
    SecurityLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (void *)abort_report_np();
    __break(1u);
    free(v3);
  }
  return v0;
}

void sub_18B1AC8B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t mk_SecTaskCopyValueForEntitlement(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  _Unwind_Exception *v9;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void *v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v6 = getSecTaskCopyValueForEntitlementSymbolLoc_ptr;
  v14 = getSecTaskCopyValueForEntitlementSymbolLoc_ptr;
  if (!getSecTaskCopyValueForEntitlementSymbolLoc_ptr)
  {
    v7 = (void *)SecurityLibrary();
    v6 = dlsym(v7, "SecTaskCopyValueForEntitlement");
    v12[3] = (uint64_t)v6;
    getSecTaskCopyValueForEntitlementSymbolLoc_ptr = v6;
  }
  v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v6;
  _Block_object_dispose(&v11, 8);
  if (!v10)
  {
    dlerror();
    v9 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v11, 8);
    _Unwind_Resume(v9);
  }
  return v10(a1, a2, a3);
}

uint64_t _MKRAPIsAvailable()
{
  uint64_t v0;
  void *v1;
  char v2;
  uint64_t v3;
  void *v5;
  _BOOL4 v6;
  void *v7;

  if ((GEOConfigGetBOOL() & 1) != 0)
    return 0;
  if (!GEOIsBAASupported())
    return 0;
  objc_msgSend(MEMORY[0x1E0D27680], "primaryICloudAccount");
  v0 = objc_claimAutoreleasedReturnValue();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = objc_msgSend(MEMORY[0x1E0D27680], "isCurrentICloudAccountUnderage");

    if ((v2 & 1) != 0)
      return 0;
  }
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "userMode") == 1 || (objc_msgSend(v5, "isEphemeralMultiUser") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    if (qword_1ECE2DB58 != -1)
      dispatch_once(&qword_1ECE2DB58, &__block_literal_global_59);
    if (_MergedGlobals_152)
    {
      v6 = 0;
    }
    else
    {
      objc_msgSend((id)qword_1ECE2DB50, "aa_primaryAppleAccount");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      byte_1ECE2DB49 = objc_msgSend(v7, "aa_isManagedAppleID");
      if (v7)
      {
        _MergedGlobals_152 = 1;
      }
      else if (qword_1ECE2DB60 != -1)
      {
        dispatch_once(&qword_1ECE2DB60, &__block_literal_global_14);
      }

      v6 = _MergedGlobals_152 == 0;
    }
    if (byte_1ECE2DB49)
      v3 = v6;
    else
      v3 = 1;
  }

  return v3;
}

void _MKRAPiCloudAccountChanged(uint64_t a1, _BYTE *a2)
{
  *a2 = 0;
}

uint64_t MKCurrentNetworkConnectionFailureDiagnosis()
{
  void *v0;
  char v1;
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  int v6;

  objc_msgSend(MEMORY[0x1E0D27298], "sharedNetworkObserver");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isNetworkReachable");

  if ((v1 & 1) != 0)
    return 0;
  v3 = objc_alloc(MEMORY[0x1E0CFA9B8]);
  v4 = (void *)objc_msgSend(v3, "initWithQueue:", MEMORY[0x1E0C80D38]);
  if ((objc_msgSend(v4, "airplaneMode") & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D27298], "sharedNetworkObserver");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isCellConnection");

    if (v6)
      v2 = 2;
    else
      v2 = 3;
  }

  return v2;
}

id getFBSOpenApplicationOptionKeyPromptUnlockDevice()
{
  id *v0;
  uint64_t v1;
  void *v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)qword_1ECE2DB80;
  v7 = qword_1ECE2DB80;
  if (qword_1ECE2DB80)
    goto LABEL_7;
  v8 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v0 = (id *)qword_1ECE2DB78;
  v12 = qword_1ECE2DB78;
  if (!qword_1ECE2DB78)
  {
    v13 = xmmword_1E20DB688;
    v14 = *(_OWORD *)&off_1E20DB698;
    v1 = _sl_dlopen();
    v10[3] = v1;
    qword_1ECE2DB78 = v1;
    v0 = (id *)v1;
  }
  _Block_object_dispose(&v9, 8);
  v2 = v8;
  if (!v0)
    goto LABEL_10;
  if (v8)
    goto LABEL_11;
  while (1)
  {
    v0 = (id *)dlsym(v0, "FBSOpenApplicationOptionKeyPromptUnlockDevice");
    v5[3] = (uint64_t)v0;
    qword_1ECE2DB80 = (uint64_t)v0;
LABEL_7:
    _Block_object_dispose(&v4, 8);
    if (v0)
      break;
    dlerror();
    abort_report_np();
LABEL_10:
    v2 = (void *)abort_report_np();
    __break(1u);
LABEL_11:
    free(v2);
  }
  return *v0;
}

void sub_18B1AD794(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v3;
  va_list va;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, _QWORD);
  v5 = va_arg(va1, _QWORD);
  v6 = va_arg(va1, _QWORD);
  v7 = va_arg(va1, _QWORD);
  v8 = va_arg(va1, _QWORD);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t TelephonyUtilitiesLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = TelephonyUtilitiesLibraryCore_frameworkLibrary;
  v6 = TelephonyUtilitiesLibraryCore_frameworkLibrary;
  if (!TelephonyUtilitiesLibraryCore_frameworkLibrary)
  {
    v7 = __const__block__paths_17;
    v8 = *(_OWORD *)&off_1E20DB6D8;
    v1 = _sl_dlopen();
    v4[3] = v1;
    TelephonyUtilitiesLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18B1AD870(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t TelephonyUtilitiesLibrary()
{
  uint64_t v0;
  void *v2;

  v0 = TelephonyUtilitiesLibraryCore();
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getTUCallCenterClass_block_invoke(uint64_t a1)
{
  Class result;
  MKSystemController *v3;
  SEL v4;

  TelephonyUtilitiesLibrary();
  result = objc_getClass("TUCallCenter");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getTUCallCenterClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (MKSystemController *)abort_report_np();
    return (Class)-[MKSystemController isWifiEnabled](v3, v4);
  }
  return result;
}

void sub_18B1AE610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a10);
  va_start(va, a10);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18B1AE778(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t _MKIsIOSARMAppOnMac()
{
  return 0;
}

void sub_18B1AF314(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PhoneNumbersLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = PhoneNumbersLibraryCore_frameworkLibrary;
  v6 = PhoneNumbersLibraryCore_frameworkLibrary;
  if (!PhoneNumbersLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E20DB858;
    v8 = *(_OWORD *)&off_1E20DB868;
    v1 = _sl_dlopen();
    v4[3] = v1;
    PhoneNumbersLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18B1B0820(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t PhoneNumbersLibrary()
{
  uint64_t v0;
  void *v2;

  v0 = PhoneNumbersLibraryCore();
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void *getCFPhoneNumberCreateSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getCFPhoneNumberCreateSymbolLoc_ptr;
  v6 = getCFPhoneNumberCreateSymbolLoc_ptr;
  if (!getCFPhoneNumberCreateSymbolLoc_ptr)
  {
    v1 = (void *)PhoneNumbersLibrary();
    v0 = dlsym(v1, "CFPhoneNumberCreate");
    v4[3] = (uint64_t)v0;
    getCFPhoneNumberCreateSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18B1B0908(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t mk_CFPhoneNumberCreate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*SymbolLoc)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;

  SymbolLoc = (uint64_t (*)(uint64_t, uint64_t, uint64_t))getCFPhoneNumberCreateSymbolLoc();
  if (SymbolLoc)
    return SymbolLoc(a1, a2, a3);
  dlerror();
  v8 = abort_report_np();
  return getCFPhoneNumberCreateStringSymbolLoc(v8);
}

void *getCFPhoneNumberCreateStringSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getCFPhoneNumberCreateStringSymbolLoc_ptr;
  v6 = getCFPhoneNumberCreateStringSymbolLoc_ptr;
  if (!getCFPhoneNumberCreateStringSymbolLoc_ptr)
  {
    v1 = (void *)PhoneNumbersLibrary();
    v0 = dlsym(v1, "CFPhoneNumberCreateString");
    v4[3] = (uint64_t)v0;
    getCFPhoneNumberCreateStringSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18B1B09F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t mk_CFPhoneNumberCreateString(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*StringSymbolLoc)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;

  StringSymbolLoc = (uint64_t (*)(uint64_t, uint64_t, uint64_t))getCFPhoneNumberCreateStringSymbolLoc();
  if (StringSymbolLoc)
    return StringSymbolLoc(a1, a2, a3);
  dlerror();
  v8 = abort_report_np();
  return +[CLCircularRegion(MKMapItemAdditions) circularRegionFromMapRegion:](v8);
}

void sub_18B1B14C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18B1B15EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18B1B1A58(_Unwind_Exception *a1)
{
  _geo_isolate_unlock();
  _Unwind_Resume(a1);
}

void sub_18B1B1B1C(_Unwind_Exception *a1)
{
  _geo_isolate_unlock();
  _Unwind_Resume(a1);
}

void sub_18B1B1DD0(_Unwind_Exception *a1)
{
  _geo_isolate_unlock();
  _Unwind_Resume(a1);
}

void sub_18B1B1E4C(_Unwind_Exception *a1)
{
  _geo_isolate_unlock();
  _Unwind_Resume(a1);
}

void sub_18B1B1EC8(_Unwind_Exception *a1)
{
  _geo_isolate_unlock();
  _Unwind_Resume(a1);
}

void sub_18B1B1F44(_Unwind_Exception *a1)
{
  _geo_isolate_unlock();
  _Unwind_Resume(a1);
}

void sub_18B1B1FC0(_Unwind_Exception *a1)
{
  _geo_isolate_unlock();
  _Unwind_Resume(a1);
}

void sub_18B1B3508(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18B1B67E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18B1B8D6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__460(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__461(uint64_t a1)
{

}

void sub_18B1BD1C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18B1BEFD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id MKGetMKMapCameraLog()
{
  if (qword_1ECE2DC28 != -1)
    dispatch_once(&qword_1ECE2DC28, &__block_literal_global_116);
  return (id)_MergedGlobals_155;
}

void sub_18B1C5C88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_18B1C5D88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18B1C6294(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_18B1C63C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t MKApplicationLayoutDirectionIsRightToLeft()
{
  void *v1;
  _BOOL8 v2;

  if (objc_msgSend(MEMORY[0x1E0CB34D0], "_navigation_isRunningInSiri"))
  {
    if (qword_1EDFB7B18 != -1)
      dispatch_once(&qword_1EDFB7B18, &__block_literal_global_156_0);
    if (_MergedGlobals_1_7)
      return _MergedGlobals_1_7();
  }
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "userInterfaceLayoutDirection") == 1;

  return v2;
}

uint64_t MKIsHostedInSiri()
{
  return objc_msgSend(MEMORY[0x1E0CB34D0], "_navigation_isRunningInSiri");
}

void sub_18B1C9DB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,id location)
{
  id *v38;

  objc_destroyWeak(v38);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18B1CAAB4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 176));
  _Unwind_Resume(a1);
}

void sub_18B1CB8D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id MKGetMKRemoteUILog_0()
{
  if (qword_1EDFB7B28 != -1)
    dispatch_once(&qword_1EDFB7B28, &__block_literal_global_97);
  return (id)_MergedGlobals_1_8;
}

void sub_18B1CBCEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18B1CF4E8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18B1CF594(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_18B1CF7F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

void sub_18B1CF998(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_18B1CFA70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18B1CFC9C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18B1CFDDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_18B1CFE9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  v12 = v11;

  _Unwind_Resume(a1);
}

void sub_18B1CFF5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v13 = v12;

  _Unwind_Resume(a1);
}

void sub_18B1D00E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v20 = v19;

  _Unwind_Resume(a1);
}

void sub_18B1D0210(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_18B1D028C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18B1D03D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18B1D05E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

double MKCGRectFittingImageWithinSize(void *a1, double a2, double a3)
{
  double v5;
  double v6;
  double v7;
  double v8;
  BOOL v9;
  BOOL i;

  objc_msgSend(a1, "size");
  v7 = v6;
  v8 = v5;
  v9 = v5 > a3;
  for (i = v6 > a2; v7 > a2 || v8 > a3; i = v7 > a2)
  {
    if (i)
    {
      v8 = a2 * (v8 / v7);
      v7 = a2;
    }
    else if (v9)
    {
      v7 = a3 * (v7 / v8);
      v8 = a3;
    }
    v9 = v8 > a3;
  }
  return (a2 - v7) * 0.5;
}

id MKManeuverArrowImage(int a1, int a2, double *a3, void *a4, void *a5, double *a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  id v17;
  id v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGContext *CurrentContext;
  double v34;
  double x;
  double v36;
  double y;
  double v38;
  double width;
  double v40;
  double height;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  void *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v58;
  uint64_t v59;
  int v60;
  id v61;
  void *v62;
  int BOOL;
  unsigned int v64;
  int v65;
  unsigned int v66;
  int v67;
  unsigned int v68;
  void *v69;
  double v70;
  void *v71;
  CGFloat v72;
  CGFloat v73;
  CGFloat v74;
  CGFloat v75;
  CGFloat v76;
  CGFloat v77;
  CGContext *v78;
  id v79;
  CGImage *v80;
  void *v81;
  id v82;
  void *v83;
  void *v84;
  id v85;
  uint64_t v86;
  NSObject *v87;
  double v88;
  double v89;
  id v90;
  id v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  CGAffineTransform transform;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  id v101;
  id v102;
  id v103;
  id v104;
  char v105;
  _BYTE v106[5];
  _BYTE v107[128];
  _BYTE __dst[496];
  uint64_t v109;
  CGSize v110;
  CGSize v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;

  v109 = *MEMORY[0x1E0C80C00];
  v17 = a4;
  v18 = a5;
  v19 = v18;
  v20 = 0;
  switch(a1)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 11:
    case 12:
    case 16:
    case 17:
    case 18:
    case 20:
    case 21:
    case 23:
    case 24:
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 33:
    case 34:
    case 35:
    case 39:
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
    case 60:
    case 61:
    case 62:
    case 63:
    case 64:
    case 65:
    case 66:
    case 88:
      v21 = a3[1];
      v22 = a3[2];
      v105 = 0;
      v103 = 0;
      v104 = 0;
      v101 = 0;
      v102 = 0;
      memcpy(__dst, a3, sizeof(__dst));
      MKManeuverArrowPaths(a1, a2, (double *)__dst, a6, &v104, &v103, &v102, &v101, &v105);
      v23 = v104;
      v24 = v103;
      v25 = v102;
      v26 = v101;
      if (objc_msgSend(v25, "count") || v23 && (objc_msgSend(v23, "isEmpty") & 1) == 0)
      {
        v88 = v22;
        v89 = v21;
        v90 = v26;
        v27 = v19;
        v28 = v17;
        v29 = *MEMORY[0x1E0C9D538];
        v30 = *(double *)(MEMORY[0x1E0C9D538] + 8);
        v31 = a7;
        v110.width = a7;
        v32 = a8;
        v110.height = a8;
        UIGraphicsBeginImageContextWithOptions(v110, 0, a9);
        CurrentContext = UIGraphicsGetCurrentContext();
        objc_msgSend(v23, "bounds");
        x = v34;
        y = v36;
        width = v38;
        height = v40;
        v97 = 0u;
        v98 = 0u;
        v99 = 0u;
        v100 = 0u;
        v91 = v25;
        v42 = v25;
        v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v97, v107, 16);
        if (v43)
        {
          v44 = v43;
          v45 = *(_QWORD *)v98;
          do
          {
            v46 = 0;
            do
            {
              if (*(_QWORD *)v98 != v45)
                objc_enumerationMutation(v42);
              objc_msgSend(*(id *)(*((_QWORD *)&v97 + 1) + 8 * v46), "bounds");
              v117.origin.x = v47;
              v117.origin.y = v48;
              v117.size.width = v49;
              v117.size.height = v50;
              v112.origin.x = x;
              v112.origin.y = y;
              v112.size.width = width;
              v112.size.height = height;
              v113 = CGRectUnion(v112, v117);
              x = v113.origin.x;
              y = v113.origin.y;
              width = v113.size.width;
              height = v113.size.height;
              ++v46;
            }
            while (v44 != v46);
            v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v97, v107, 16);
          }
          while (v44);
        }

        memset(__dst, 0, 48);
        _transformForFrames((CGAffineTransform *)__dst, v29, v30, v89, v88, x, y, width, height, v31, v32);
        if (a6)
        {
          *(float64x2_t *)a6 = vaddq_f64(*(float64x2_t *)&__dst[32], vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&__dst[16], a6[1]), *(float64x2_t *)__dst, *a6));
          if (!v105)
          {
            v114.origin.x = 0.0;
            v114.origin.y = 0.0;
            v114.size.width = v31;
            v114.size.height = v32;
            a6[1] = CGRectGetMidY(v114);
          }
        }
        transform = *(CGAffineTransform *)__dst;
        CGContextConcatCTM(CurrentContext, &transform);
        v17 = v28;
        v19 = v27;
        if (v24)
        {
          objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRect:", 0.0, 0.0, v31, v32);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "appendPath:", v23);
          objc_msgSend(v51, "setUsesEvenOddFillRule:", 1);
          CGContextSaveGState(CurrentContext);
          objc_msgSend(v51, "addClip");
          objc_msgSend(v27, "set");
          objc_msgSend(v24, "fill");
          CGContextRestoreGState(CurrentContext);

        }
        objc_msgSend(v17, "set");
        v94 = 0u;
        v95 = 0u;
        v92 = 0u;
        v93 = 0u;
        v52 = v42;
        v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v92, v106, 16);
        if (v53)
        {
          v54 = v53;
          v55 = *(_QWORD *)v93;
          do
          {
            v56 = 0;
            do
            {
              if (*(_QWORD *)v93 != v55)
                objc_enumerationMutation(v52);
              objc_msgSend(*(id *)(*((_QWORD *)&v92 + 1) + 8 * v56++), "fill");
            }
            while (v54 != v56);
            v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v92, v106, 16);
          }
          while (v54);
        }

        objc_msgSend(v23, "fill");
        UIGraphicsGetImageFromCurrentImageContext();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        UIGraphicsEndImageContext();
        v26 = v90;
        v25 = v91;
      }
      else
      {
        v20 = 0;
      }

      goto LABEL_27;
    case 22:
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
      v58 = v18;
      v59 = 310002;
      v60 = *(unsigned __int8 *)a3;
      v61 = v17;
      v62 = v61;
      switch(a1)
      {
        case 'P':
          goto LABEL_52;
        case 'Q':
          v59 = 310003;
          goto LABEL_52;
        case 'R':
          BOOL = GEOConfigGetBOOL();
          if (v60)
            v64 = 327633261;
          else
            v64 = 603924167;
          if (BOOL)
            v59 = v64;
          else
            v59 = 101625;
          goto LABEL_52;
        case 'S':
          v65 = GEOConfigGetBOOL();
          if (v60)
            v66 = 146083830;
          else
            v66 = 179594842;
          if (v65)
            v59 = v66;
          else
            v59 = 101626;
          goto LABEL_52;
        case 'T':
          v67 = GEOConfigGetBOOL();
          if (v60)
            v68 = 830247085;
          else
            v68 = 316321895;
          if (v67)
            v59 = v68;
          else
            v59 = 101627;
          goto LABEL_52;
        default:
          if (a1 != 22)
          {
            v20 = 0;
            v19 = v58;
            v25 = v61;
            goto LABEL_28;
          }
          v59 = 310004;
LABEL_52:
          objc_msgSend(MEMORY[0x1E0DC6500], "sharedManager");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          *(float *)&v70 = a9;
          objc_msgSend(v69, "imageForDataID:text:contentScale:sizeGroup:modifiers:", v59, 0, 4, 0, v70);
          v23 = (id)objc_claimAutoreleasedReturnValue();

          if (v23)
          {
            objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:", objc_msgSend(v23, "image"));
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            MKCGRectFittingImageWithinSize(v71, a7, a8);
            v73 = v72;
            v75 = v74;
            v76 = *MEMORY[0x1E0C9D538];
            v77 = *(double *)(MEMORY[0x1E0C9D538] + 8);
            v111.width = v72;
            v111.height = v74;
            UIGraphicsBeginImageContextWithOptions(v111, 0, 0.0);
            v78 = UIGraphicsGetCurrentContext();
            CGContextSetInterpolationQuality(v78, kCGInterpolationHigh);
            v25 = v62;
            objc_msgSend(v62, "setFill");
            CGContextTranslateCTM(v78, 0.0, v75);
            CGContextScaleCTM(v78, 1.0, -1.0);
            v79 = objc_retainAutorelease(v71);
            v80 = (CGImage *)objc_msgSend(v79, "CGImage");
            v115.origin.x = v76;
            v115.origin.y = v77;
            v115.size.width = v73;
            v115.size.height = v75;
            CGContextClipToMask(v78, v115, v80);
            v116.origin.x = v76;
            v116.origin.y = v77;
            v116.size.width = v73;
            v116.size.height = v75;
            CGContextFillRect(v78, v116);
            UIGraphicsGetImageFromCurrentImageContext();
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            UIGraphicsEndImageContext();
            v82 = v81;
            v83 = v82;
            v20 = v82;
            if (a2 == 1)
            {
              v84 = (void *)MEMORY[0x1E0CEA638];
              v85 = objc_retainAutorelease(v82);
              v86 = objc_msgSend(v85, "CGImage");
              objc_msgSend(v85, "scale");
              objc_msgSend(v84, "imageWithCGImage:scale:orientation:", v86, 4);
              v20 = (void *)objc_claimAutoreleasedReturnValue();

            }
          }
          else
          {
            MKGetMKDefaultLog();
            v87 = objc_claimAutoreleasedReturnValue();
            v25 = v62;
            if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)__dst = 134217984;
              *(_QWORD *)&__dst[4] = v59;
              _os_log_impl(&dword_18B0B0000, v87, OS_LOG_TYPE_ERROR, "Could not find icon image for id: %lu", __dst, 0xCu);
            }

            v20 = 0;
          }
          v19 = v58;
          break;
      }
LABEL_27:

LABEL_28:
      break;
    default:
      break;
  }

  return v20;
}

void MKManeuverArrowPaths(int a1, int a2, double *a3, double *a4, _QWORD *a5, _QWORD *a6, _QWORD *a7, _QWORD *a8, char *a9)
{
  double v13;
  double v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  double v19;
  double v20;
  void *v21;
  id v22;
  void *v23;
  double v25;
  double v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  CGFloat v34;
  _QWORD *v35;
  _QWORD *v36;
  _QWORD *v37;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MidX;
  CGFloat MidY;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  void *v49;
  void *v56;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  CGAffineTransform t2;
  id v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  _BYTE __dst[496];
  _BYTE v85[128];
  uint64_t v86;
  CGRect BoundingBox;
  CGRect v88;

  v86 = *MEMORY[0x1E0C80C00];
  v14 = a3[1];
  v13 = a3[2];
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPath");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  v17 = 0;
  v18 = 0;
  v20 = *MEMORY[0x1E0C9D538];
  v19 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v21 = 0;
  v22 = 0;
  switch(a1)
  {
    case 0:
    case 7:
    case 17:
    case 22:
    case 24:
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
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
    case 85:
    case 86:
    case 87:
      goto LABEL_30;
    case 1:
    case 27:
    case 60:
      v82 = 0;
      memcpy(__dst, a3, sizeof(__dst));
      MKArrowAppendLeftTurnToPathInRect(v16, __dst, v20, v19, v14, v13, 0, &v82);
      v23 = v82;
      goto LABEL_11;
    case 2:
    case 28:
    case 61:
      v81 = 0;
      memcpy(__dst, a3, sizeof(__dst));
      MKArrowAppendRightTurnToPathInRect(v16, (double *)__dst, 0, &v81, v20, v19, v14, v13);
      v23 = v81;
      goto LABEL_11;
    case 3:
    case 5:
    case 6:
    case 12:
    case 23:
    case 64:
      v83 = 0;
      memcpy(__dst, a3, sizeof(__dst));
      MKArrowAppendStraightArrowToPathInRect(v16, (double *)__dst, &v83, v20, v19, v14, v13);
      v23 = v83;
      goto LABEL_11;
    case 4:
    case 25:
    case 26:
    case 35:
    case 88:
      v78 = 0;
      memcpy(__dst, a3, sizeof(__dst));
      MKArrowAppendUTurnToPathInRect(v16, a2, (double *)__dst, &v78, v20, v19, v14, v13);
      v23 = v78;
      goto LABEL_11;
    case 8:
    case 9:
    case 10:
    case 13:
    case 14:
    case 15:
    case 19:
    case 31:
    case 32:
    case 36:
    case 37:
    case 38:
    case 40:
    case 67:
    case 68:
    case 69:
    case 70:
    case 71:
    case 72:
    case 73:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 79:
      goto LABEL_13;
    case 11:
      if (a2)
      {
        v74 = 0;
        memcpy(__dst, a3, sizeof(__dst));
        MKArrowAppendMergeLeftToPathInRect(v16, __dst, &v74, v20, v19, v14, v13);
        v23 = v74;
      }
      else
      {
        v75 = 0;
        memcpy(__dst, a3, sizeof(__dst));
        MKArrowAppendMergeRightToPathInRect(v16, (double *)__dst, &v75, v20, v19, v14, v13);
        v23 = v75;
      }
      goto LABEL_11;
    case 16:
    case 18:
    case 33:
    case 34:
    case 39:
      v72 = v15;
      v73 = 0;
      memcpy(__dst, a3, sizeof(__dst));
      _D8 = MKArrowCreateBezierPathsForEitherProceedToRouteOrArrivalWithSizeAndReturnCenter(&v73, &v72, (uint64_t)__dst, 0, v14, v13);
      v26 = v25;
      v22 = v73;
      v27 = v72;

      v28 = *MEMORY[0x1E0C9BAA8];
      v29 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v30 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      if (a1 == 34)
      {
        v34 = 1.57079633;
      }
      else
      {
        v31 = *MEMORY[0x1E0C9BAA8];
        v32 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        v33 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
        if (a1 != 33)
          goto LABEL_33;
        v34 = -1.57079633;
      }
      v63 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v65 = *MEMORY[0x1E0C9BAA8];
      v61 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      CGAffineTransformMakeRotation((CGAffineTransform *)__dst, v34);
      v30 = v61;
      v29 = v63;
      v28 = v65;
      v31 = *(_OWORD *)__dst;
      v32 = *(_OWORD *)&__dst[16];
      v33 = *(_OWORD *)&__dst[32];
LABEL_33:
      v64 = v32;
      v66 = v31;
      *(_OWORD *)__dst = v31;
      *(_OWORD *)&__dst[16] = v32;
      v62 = v33;
      *(_OWORD *)&__dst[32] = v33;
      *(_OWORD *)&t2.a = v28;
      *(_OWORD *)&t2.c = v29;
      *(_OWORD *)&t2.tx = v30;
      if (!CGAffineTransformEqualToTransform((CGAffineTransform *)__dst, &t2))
      {
        v69 = 0u;
        v70 = 0u;
        v67 = 0u;
        v68 = 0u;
        v44 = v22;
        v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v67, v85, 16);
        if (v45)
        {
          v46 = v45;
          v47 = *(_QWORD *)v68;
          do
          {
            for (i = 0; i != v46; ++i)
            {
              if (*(_QWORD *)v68 != v47)
                objc_enumerationMutation(v44);
              v49 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
              *(_OWORD *)__dst = v66;
              *(_OWORD *)&__dst[16] = v64;
              *(_OWORD *)&__dst[32] = v62;
              objc_msgSend(v49, "applyTransform:", __dst);
            }
            v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v67, v85, 16);
          }
          while (v46);
        }

        *(_OWORD *)__dst = v66;
        *(_OWORD *)&__dst[16] = v64;
        *(_OWORD *)&__dst[32] = v62;
        objc_msgSend(v27, "applyTransform:", __dst);
      }
      if (!a4)
      {
        v21 = 0;
        v17 = 0;
        v18 = 0;
        goto LABEL_18;
      }
      v18 = 0;
      v21 = 0;
      _V2.D[1] = *((_QWORD *)&v66 + 1);
      __asm { FMLA            D1, D8, V2.D[1] }
      *a4 = *(double *)&v62 + vmlad_n_f64(v26 * *(double *)&v64, _D8, *(double *)&v66);
      a4[1] = *((double *)&v62 + 1) + _D1;
      v17 = 1;
      v16 = v27;
LABEL_13:
      if (!a4)
      {
        v27 = v16;
LABEL_18:
        v36 = a7;
        v35 = a8;
        v37 = a6;
        goto LABEL_19;
      }
      v36 = a7;
      v35 = a8;
      v37 = a6;
      if (!v22)
      {
        v18 = objc_retainAutorelease(v18);
        BoundingBox = CGPathGetBoundingBox((CGPathRef)objc_msgSend(v18, "CGPath"));
        x = BoundingBox.origin.x;
        y = BoundingBox.origin.y;
        width = BoundingBox.size.width;
        height = BoundingBox.size.height;
        MidX = CGRectGetMidX(BoundingBox);
        v88.origin.x = x;
        v88.origin.y = y;
        v88.size.width = width;
        v88.size.height = height;
        MidY = CGRectGetMidY(v88);
        *a4 = MidX;
        a4[1] = MidY;
      }
      v27 = v16;
LABEL_19:
      if (a5)
        *a5 = objc_retainAutorelease(v27);
      if (v37)
        *v37 = objc_retainAutorelease(v21);
      if (v36)
        *v36 = objc_retainAutorelease(v22);
      if (v35)
        *v35 = objc_retainAutorelease(v18);
      if (a9)
        *a9 = v17;
      v16 = v27;
LABEL_30:

      return;
    case 20:
    case 62:
    case 65:
      v80 = 0;
      memcpy(__dst, a3, sizeof(__dst));
      MKArrowAppendMergeLeftToPathInRect(v16, __dst, &v80, v20, v19, v14, v13);
      v23 = v80;
      goto LABEL_11;
    case 21:
    case 63:
    case 66:
      v79 = 0;
      memcpy(__dst, a3, sizeof(__dst));
      MKArrowAppendMergeRightToPathInRect(v16, (double *)__dst, &v79, v20, v19, v14, v13);
      v23 = v79;
LABEL_11:
      v18 = v23;
      v17 = 0;
      v21 = 0;
      goto LABEL_12;
    case 29:
      objc_msgSend(MEMORY[0x1E0CEA390], "bezierPath");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = 0;
      memcpy(__dst, a3, sizeof(__dst));
      MKArrowAppendExitRoadLeftToPathInRect(v16, v21, __dst, &v76, v20, v19, v14, v13);
      v56 = v76;
      goto LABEL_49;
    case 30:
      objc_msgSend(MEMORY[0x1E0CEA390], "bezierPath");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = 0;
      memcpy(__dst, a3, sizeof(__dst));
      MKArrowAppendExitRoadRightToPathInRect(v16, v21, __dst, &v77, v20, v19, v14, v13);
      v56 = v77;
LABEL_49:
      v18 = v56;
      v17 = 0;
LABEL_12:
      v22 = 0;
      goto LABEL_13;
    default:
      v21 = 0;
      v22 = 0;
      goto LABEL_13;
  }
}

CGFloat _transformForFrames(CGAffineTransform *retstr, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11)
{
  double v23;
  double v24;
  double v26;
  __int128 v27;
  __int128 v28;
  CGFloat result;
  CGAffineTransform v30;
  CGAffineTransform v31;
  CGAffineTransform v32;
  CGRect v33;
  CGRect v34;

  v23 = 1.0;
  v24 = a4 / a8;
  if (a4 / a8 >= a5 / a9)
    v24 = a5 / a9;
  if (a8 > a4 || a9 > a5)
    v23 = v24;
  v26 = a10 / a4;
  if (a10 / a4 >= a11 / a5)
    v26 = a11 / a5;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  CGAffineTransformMakeScale(retstr, v26 * v23, v26 * v23);
  v27 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v31.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v31.c = v27;
  *(_OWORD *)&v31.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransformInvert(&v32, &v31);
  v33.origin.x = 0.0;
  v33.origin.y = 0.0;
  v33.size.width = a10;
  v33.size.height = a11;
  v34 = CGRectApplyAffineTransform(v33, &v32);
  v34.origin.y = v34.origin.y + (v34.size.height - a9) * 0.5 - a7;
  *(_OWORD *)&v34.size.height = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v30.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v30.c = *(_OWORD *)&v34.size.height;
  *(_OWORD *)&v30.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransformTranslate(&v31, &v30, v34.origin.x + (v34.size.width - a8) * 0.5 - a6, v34.origin.y);
  v28 = *(_OWORD *)&v31.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v31.a;
  *(_OWORD *)&retstr->c = v28;
  result = v31.tx;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v31.tx;
  return result;
}

id MKJunctionArrowImage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, double *a6, void *a7, void *a8, CGFloat a9, CGFloat a10, CGFloat a11, double *a12)
{
  id v22;
  id v23;
  MKJunction *v24;
  double v25;
  id *v26;
  double v27;
  double v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGContext *CurrentContext;
  double v39;
  double x;
  double v41;
  double y;
  double v43;
  double width;
  double v45;
  double height;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  void *v51;
  double v53;
  double v54;
  CGAffineTransform transform;
  _BYTE __dst[496];
  id v57;
  id v58;
  id v59;
  id v60;
  CGSize v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;

  v22 = a7;
  v23 = a8;
  v24 = -[MKJunction initWithType:maneuver:drivingSide:elements:count:]([MKJunction alloc], "initWithType:maneuver:drivingSide:elements:count:", a1, a2, a3, a4, a5);
  if (v24)
  {
    v59 = 0;
    v60 = 0;
    v58 = 0;
    v25 = a6[5];
    if (v25 > 0.0)
      v26 = &v57;
    else
      v26 = 0;
    if (v25 > 0.0)
      v57 = 0;
    v27 = a6[1];
    v28 = a6[2];
    memcpy(__dst, a6, sizeof(__dst));
    -[MKJunction getArrowPath:arrowStrokePath:intersectionBackgroundPath:strokePath:withSize:metrics:drivingSide:visualCenter:](v24, "getArrowPath:arrowStrokePath:intersectionBackgroundPath:strokePath:withSize:metrics:drivingSide:visualCenter:", &v60, &v59, &v58, v26, __dst, a3, v27, v28, a12);
    v29 = v60;
    v30 = v59;
    v31 = v58;
    if (v25 > 0.0)
      v32 = v57;
    else
      v32 = 0;
    v34 = *MEMORY[0x1E0C9D538];
    v35 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v53 = a6[2];
    v54 = a6[1];
    v36 = a9;
    v61.width = a9;
    v37 = a10;
    v61.height = a10;
    UIGraphicsBeginImageContextWithOptions(v61, 0, a11);
    CurrentContext = UIGraphicsGetCurrentContext();
    objc_msgSend(v29, "bounds");
    x = v39;
    y = v41;
    width = v43;
    height = v45;
    if (v31)
    {
      objc_msgSend(v31, "bounds");
      v65.origin.x = v47;
      v65.origin.y = v48;
      v65.size.width = v49;
      v65.size.height = v50;
      v62.origin.x = x;
      v62.origin.y = y;
      v62.size.width = width;
      v62.size.height = height;
      v63 = CGRectUnion(v62, v65);
      x = v63.origin.x;
      y = v63.origin.y;
      width = v63.size.width;
      height = v63.size.height;
    }
    memset(__dst, 0, 48);
    _transformForFrames((CGAffineTransform *)__dst, v34, v35, v54, v53, x, y, width, height, v36, v37);
    if (a12)
    {
      *(float64x2_t *)a12 = vaddq_f64(*(float64x2_t *)&__dst[32], vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&__dst[16], a12[1]), *(float64x2_t *)__dst, *a12));
      if (-[MKJunction type](v24, "type") != 1)
      {
        v64.origin.x = v34;
        v64.origin.y = v35;
        v64.size.width = v36;
        v64.size.height = v37;
        a12[1] = CGRectGetMidY(v64);
      }
    }
    transform = *(CGAffineTransform *)__dst;
    CGContextConcatCTM(CurrentContext, &transform);
    if (v31)
    {
      objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRect:", v34, v35, v54, v53);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "appendPath:", v29);
      objc_msgSend(v51, "setUsesEvenOddFillRule:", 1);
      CGContextSaveGState(CurrentContext);
      objc_msgSend(v51, "addClip");
      objc_msgSend(v23, "set");
      objc_msgSend(v31, "fill");
      CGContextRestoreGState(CurrentContext);

    }
    objc_msgSend(v22, "set");
    objc_msgSend(v29, "fill");
    UIGraphicsGetImageFromCurrentImageContext();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();

  }
  else
  {
    v33 = 0;
  }

  return v33;
}

uint64_t annotatedItemListIsValidWithDisplayStyle(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t j;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  if (objc_msgSend(v3, "annotatedItemStyle"))
  {
    if (a2 == 2)
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      objc_msgSend(v3, "textItemContainer", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "textItems");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      if (v6)
      {
        v10 = *(_QWORD *)v17;
        while (2)
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v17 != v10)
              objc_enumerationMutation(v5);
            objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "primaryText");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "length");

            if (v13)
            {

              objc_msgSend(v3, "textItemContainer");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "displayConfig");
              v5 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v5, "maxRowCount"))
                v6 = objc_msgSend(v5, "maxItemsPerRow") != 0;
              else
                v6 = 0;
              goto LABEL_27;
            }
          }
          v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
          if (v6)
            continue;
          break;
        }
      }
      goto LABEL_27;
    }
    if (a2 == 1)
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      objc_msgSend(v3, "pictureItemContainer");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "pictureItems");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      if (v6)
      {
        v7 = *(_QWORD *)v21;
        while (2)
        {
          for (j = 0; j != v6; ++j)
          {
            if (*(_QWORD *)v21 != v7)
              objc_enumerationMutation(v5);
            if (objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * j), "pictureItemPhotoType"))
            {
              v6 = 1;
              goto LABEL_27;
            }
          }
          v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
          if (v6)
            continue;
          break;
        }
      }
LABEL_27:

      goto LABEL_28;
    }
  }
  v6 = 0;
LABEL_28:

  return v6;
}

uint64_t displayStyleForAnnotatedItemList(void *a1, int a2)
{
  id v3;
  int BOOL;
  uint64_t v5;
  int IsValidWithDisplayStyle;
  int v7;

  v3 = a1;
  BOOL = GEOConfigGetBOOL();
  v5 = 2;
  IsValidWithDisplayStyle = annotatedItemListIsValidWithDisplayStyle(v3, 2);
  v7 = IsValidWithDisplayStyle;
  if (!BOOL || (IsValidWithDisplayStyle & 1) == 0)
  {
    if (!a2 || (v5 = 1, (annotatedItemListIsValidWithDisplayStyle(v3, 1) & 1) == 0))
    {
      if (v7)
        v5 = 2;
      else
        v5 = 0;
    }
  }

  return v5;
}

_MKMapItemAttribution *mkAttributionForAnnotatedList(void *a1)
{
  id v1;
  _MKMapItemAttribution *v2;
  void *v3;
  _MKMapItemAttribution *v4;

  v1 = a1;
  v2 = [_MKMapItemAttribution alloc];
  objc_msgSend(v1, "attribution");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = -[_MKMapItemAttribution initWithGEOMapItemAttribution:](v2, "initWithGEOMapItemAttribution:", v3);
  return v4;
}

void sub_18B1D8550(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a18, 8);
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

id _MKTransitIncidentImage(void *a1)
{
  if (a1)
  {
    _MKTransitIncidentImageForType(objc_msgSend(a1, "iconType"));
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

id _MKTransitIncidentImageForType(unsigned int a1)
{
  __CFString *v2;
  void *v3;
  double v4;
  float v5;
  void *v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  if (a1 > 2)
  {
    v2 = 0;
  }
  else
  {
    v2 = off_1E20DC1B0[a1];
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scale");
    v5 = v4;

    objc_msgSend(MEMORY[0x1E0DC6500], "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v7 = v5;
    objc_msgSend(v6, "imageForName:contentScale:sizeGroup:modifiers:", v2, 8, 0, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "image");
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:scale:orientation:", v9, 0, v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
        return v10;
    }
    else
    {

    }
  }
  if (a1 <= 2)
    v2 = off_1E20DC1C8[a1];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.Maps"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:inBundle:", v2, v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id MKTransitIncidentIcon()
{
  return +[MKIconManager imageForTrafficIncidentType:size:forScale:](MKIconManager, "imageForTrafficIncidentType:size:forScale:", 4, 0);
}

id MKGetMKMapItemViewLog()
{
  if (qword_1ECE2D6F8 != -1)
    dispatch_once(&qword_1ECE2D6F8, &__block_literal_global_208_0);
  return (id)_MergedGlobals_3_3;
}

id _MKDebugNameForMapItem(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v1 = a1;
  objc_msgSend(v1, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  if (v3)
  {
    objc_msgSend(v1, "name");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v1, "_addressFormattedAsSinglelineAddress");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

    if (v6)
    {
      objc_msgSend(v1, "_addressFormattedAsSinglelineAddress");
    }
    else
    {
      objc_msgSend(v1, "_coordinate");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%+.8f, %+.8f"), v7, v8);
    }
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v4;

  return v9;
}

void sub_18B1D9E28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18B1DA298(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18B1DA904(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18B1DBDFC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

double searchNextRequestInterval()
{
  void *v0;
  int v1;
  uint64_t v2;
  double v3;

  if (qword_1ECE2DC80 != -1)
    dispatch_once(&qword_1ECE2DC80, &__block_literal_global_427);
  objc_msgSend(MEMORY[0x1E0D27298], "sharedNetworkObserver");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isCellConnection");
  v2 = 3;
  if (v1)
    v2 = 2;
  v3 = *(double *)&_MergedGlobals_159[v2];

  return v3;
}

uint64_t __searchReplaceRequestInterval_block_invoke()
{
  uint64_t result;
  uint64_t v1;

  result = GEOConfigGetDouble();
  _MergedGlobals_159[0] = v1;
  return result;
}

double __searchNextRequestInterval_block_invoke()
{
  double v0;
  double v1;
  double result;

  GEOConfigGetDouble();
  qword_1ECE2DC70 = fmin(fmax(v0, 0.01), 5.0);
  GEOConfigGetDouble();
  result = fmin(fmax(v1, 0.01), 5.0);
  qword_1ECE2DC78 = *(_QWORD *)&result;
  return result;
}

uint64_t _MKPuckAnnotationViewInnerStaleColor()
{
  return objc_msgSend(MEMORY[0x1E0CEA478], "colorWithDynamicProvider:", &__block_literal_global_74);
}

void sub_18B1FBA00(_Unwind_Exception *exception_object)
{
  void *v1;

  if (v1)
    operator delete(v1);
  _Unwind_Resume(exception_object);
}

void sub_18B1FC3A0(_Unwind_Exception *exception_object)
{
  void *v1;

  if (v1)
    operator delete(v1);
  _Unwind_Resume(exception_object);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<MKAnnotationView *>>(unint64_t a1)
{
  if (a1 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(8 * a1);
}

uint64_t std::__introsort<std::_ClassicAlgPolicy,_MKSpatialVertComp &,MKAnnotationView **,false>(uint64_t result, uint64_t *a2, uint64_t a3, char a4)
{
  uint64_t *v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  double v18;
  uint64_t j;
  uint64_t v20;
  double v21;
  uint64_t *v23;
  unint64_t v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  double v28;
  uint64_t *v30;
  unint64_t v31;
  double v32;
  uint64_t v34;
  unint64_t v35;
  uint64_t *v36;
  double v37;
  double v38;
  uint64_t *v40;
  double v41;
  BOOL v43;
  uint64_t v44;
  double v45;
  uint64_t *v46;
  uint64_t v47;
  double v48;
  uint64_t *i;
  BOOL v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  double v55;
  uint64_t *v56;
  double v57;
  uint64_t v59;
  double v60;
  uint64_t *v62;
  uint64_t *v63;
  uint64_t v64;
  double v65;
  uint64_t v67;
  double v68;
  uint64_t v69;
  double v70;
  BOOL v71;
  uint64_t *v72;
  BOOL v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t v79;
  double v80;
  double v81;
  BOOL v82;
  uint64_t *v83;
  uint64_t v84;
  double v85;
  uint64_t v86;
  double v87;
  int64_t v89;
  int64_t v90;
  int64_t v91;
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  double v95;
  double v96;
  BOOL v97;
  uint64_t *v98;
  double v99;
  uint64_t v100;
  double v101;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  double v106;
  double v107;
  BOOL v108;
  double v109;
  double v110;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t *v117;
  uint64_t *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  double v122;
  double v123;
  BOOL v124;
  uint64_t v125;
  unint64_t v126;
  unint64_t v127;
  uint64_t *v128;
  uint64_t v129;
  double v130;
  uint64_t v131;
  double v132;
  BOOL v133;
  uint64_t *v134;
  unint64_t v135;
  uint64_t v136;
  double v137;
  double v138;
  uint64_t *v140;
  uint64_t v141;
  uint64_t v142;
  double v143;
  double v144;
  BOOL v145;
  uint64_t *v146;
  uint64_t v147;
  uint64_t v148;
  double v149;
  double v150;

  v7 = (uint64_t *)result;
LABEL_2:
  v8 = a2 - 1;
  v9 = v7;
  while (2)
  {
    v7 = v9;
    v10 = (char *)a2 - (char *)v9;
    v11 = a2 - v9;
    switch(v11)
    {
      case 0uLL:
      case 1uLL:
        return result;
      case 2uLL:
        v67 = *(a2 - 1);
        v68 = *(double *)(v67 + 672);
        v69 = *v9;
        v70 = *(double *)(*v9 + 672);
        if (v68 < v70 || (v67 < v69 ? (v71 = v68 == v70) : (v71 = 0), v71))
        {
          *v9 = v67;
          *(a2 - 1) = v69;
        }
        return result;
      case 3uLL:
        return (uint64_t)std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialVertComp &,MKAnnotationView **>(v9, v9 + 1, a2 - 1);
      case 4uLL:
        return (uint64_t)std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialVertComp &,MKAnnotationView **>(v9, v9 + 1, v9 + 2, a2 - 1);
      case 5uLL:
        return (uint64_t)std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialVertComp &,MKAnnotationView **>(v9, v9 + 1, v9 + 2, v9 + 3, a2 - 1);
      default:
        if (v10 <= 191)
        {
          v72 = v9 + 1;
          v74 = v9 == a2 || v72 == a2;
          if ((a4 & 1) != 0)
          {
            if (!v74)
            {
              v75 = 0;
              v76 = v9;
              do
              {
                v77 = v72;
                v79 = *v76;
                v78 = v76[1];
                v80 = *(double *)(v78 + 672);
                v81 = *(double *)(*v76 + 672);
                if (v80 < v81 || (v78 < v79 ? (v82 = v80 == v81) : (v82 = 0), v82))
                {
                  v76[1] = v79;
                  v83 = v9;
                  if (v76 != v9)
                  {
                    v84 = v75;
                    do
                    {
                      v85 = *(double *)(v78 + 672);
                      v86 = *(uint64_t *)((char *)v9 + v84 - 8);
                      v87 = *(double *)(v86 + 672);
                      if (v85 >= v87 && (v78 >= v86 || v85 != v87))
                      {
                        v83 = (uint64_t *)((char *)v9 + v84);
                        goto LABEL_148;
                      }
                      *(uint64_t *)((char *)v9 + v84) = v86;
                      v84 -= 8;
                    }
                    while (v84);
                    v83 = v9;
                  }
LABEL_148:
                  *v83 = v78;
                }
                v72 = v77 + 1;
                v75 += 8;
                v76 = v77;
              }
              while (v77 + 1 != a2);
            }
          }
          else if (!v74)
          {
            do
            {
              v140 = v72;
              v142 = *v7;
              v141 = v7[1];
              v143 = *(double *)(v141 + 672);
              v144 = *(double *)(*v7 + 672);
              if (v143 < v144 || (v141 < v142 ? (v145 = v143 == v144) : (v145 = 0), v145))
              {
                do
                {
                  do
                  {
                    v146 = v7;
                    v147 = v142;
                    v148 = *--v7;
                    v142 = v148;
                    v7[2] = v147;
                    v149 = *(double *)(v141 + 672);
                    v150 = *(double *)(v148 + 672);
                  }
                  while (v149 < v150);
                }
                while (v141 < v142 && v149 == v150);
                *v146 = v141;
              }
              v72 = v140 + 1;
              v7 = v140;
            }
            while (v140 + 1 != a2);
          }
          return result;
        }
        if (!a3)
        {
          if (v9 != a2)
          {
            v89 = (v11 - 2) >> 1;
            v90 = v89;
            do
            {
              v91 = v90;
              if (v89 >= v90)
              {
                v92 = (2 * v90) | 1;
                v93 = &v9[v92];
                if (2 * v90 + 2 < (uint64_t)v11)
                {
                  v94 = v93[1];
                  v95 = *(double *)(*v93 + 672);
                  v96 = *(double *)(v94 + 672);
                  if (v95 < v96 || (*v93 < v94 ? (v97 = v95 == v96) : (v97 = 0), v97))
                  {
                    ++v93;
                    v92 = 2 * v90 + 2;
                  }
                }
                v98 = &v9[v90];
                result = *v93;
                v99 = *(double *)(*v93 + 672);
                v100 = *v98;
                v101 = *(double *)(*v98 + 672);
                if (v99 >= v101 && (result >= v100 || v99 != v101))
                {
                  do
                  {
                    *v98 = result;
                    v98 = v93;
                    if (v89 < v92)
                      break;
                    v103 = 2 * v92;
                    v92 = (2 * v92) | 1;
                    v93 = &v9[v92];
                    v104 = v103 + 2;
                    if (v104 < (uint64_t)v11)
                    {
                      v105 = v93[1];
                      v106 = *(double *)(*v93 + 672);
                      v107 = *(double *)(v105 + 672);
                      if (v106 < v107 || (*v93 < v105 ? (v108 = v106 == v107) : (v108 = 0), v108))
                      {
                        ++v93;
                        v92 = v104;
                      }
                    }
                    result = *v93;
                    v109 = *(double *)(*v93 + 672);
                    v110 = *(double *)(v100 + 672);
                    if (v109 < v110)
                      break;
                  }
                  while (result >= v100 || v109 != v110);
                  *v98 = v100;
                }
              }
              --v90;
            }
            while (v91);
            v112 = (unint64_t)v10 >> 3;
            do
            {
              v113 = 0;
              v114 = *v9;
              v115 = v112 - 2;
              if (v112 < 2)
                v115 = v112 - 1;
              v116 = v115 >> 1;
              v117 = v9;
              do
              {
                v118 = v117;
                v117 += v113 + 1;
                v119 = 2 * v113;
                v113 = (2 * v113) | 1;
                v120 = v119 + 2;
                if (v120 < v112)
                {
                  v121 = v117[1];
                  result = *v117;
                  v122 = *(double *)(*v117 + 672);
                  v123 = *(double *)(v121 + 672);
                  if (v122 < v123 || (result < v121 ? (v124 = v122 == v123) : (v124 = 0), v124))
                  {
                    ++v117;
                    v113 = v120;
                  }
                }
                *v118 = *v117;
              }
              while (v113 <= v116);
              if (v117 == --a2)
              {
                *v117 = v114;
              }
              else
              {
                *v117 = *a2;
                *a2 = v114;
                v125 = (char *)v117 - (char *)v9 + 8;
                if (v125 >= 9)
                {
                  v126 = ((unint64_t)v125 >> 3) - 2;
                  v127 = v126 >> 1;
                  v128 = &v9[v126 >> 1];
                  v129 = *v128;
                  v130 = *(double *)(*v128 + 672);
                  v131 = *v117;
                  v132 = *(double *)(*v117 + 672);
                  if (v130 < v132 || (v129 < v131 ? (v133 = v130 == v132) : (v133 = 0), v133))
                  {
                    *v117 = v129;
                    if (v126 >= 2)
                    {
                      while (1)
                      {
                        v135 = v127 - 1;
                        v127 = (v127 - 1) >> 1;
                        v134 = &v9[v127];
                        v136 = *v134;
                        result = *v134 + 664;
                        v137 = *(double *)(*v134 + 672);
                        v138 = *(double *)(v131 + 672);
                        if (v137 >= v138 && (v136 >= v131 || v137 != v138))
                          break;
                        *v128 = v136;
                        v128 = &v9[v127];
                        if (v135 <= 1)
                          goto LABEL_215;
                      }
                    }
                    v134 = v128;
LABEL_215:
                    *v134 = v131;
                  }
                }
              }
              v51 = v112-- <= 2;
            }
            while (!v51);
          }
          return result;
        }
        v12 = v11 >> 1;
        v13 = &v9[v11 >> 1];
        if ((unint64_t)v10 < 0x401)
        {
          result = (uint64_t)std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialVertComp &,MKAnnotationView **>(&v7[v11 >> 1], v7, a2 - 1);
        }
        else
        {
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialVertComp &,MKAnnotationView **>(v7, &v7[v11 >> 1], a2 - 1);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialVertComp &,MKAnnotationView **>(v7 + 1, v13 - 1, a2 - 2);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialVertComp &,MKAnnotationView **>(v7 + 2, &v7[v12 + 1], a2 - 3);
          result = (uint64_t)std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialVertComp &,MKAnnotationView **>(v13 - 1, v13, &v7[v12 + 1]);
          v14 = *v7;
          *v7 = *v13;
          *v13 = v14;
        }
        --a3;
        v15 = *v7;
        if ((a4 & 1) == 0)
        {
          v17 = *(v7 - 1);
          v18 = *(double *)(v17 + 672);
          v16 = *(double *)(v15 + 672);
          if (v18 < v16 || v17 < v15 && v18 == v16)
            goto LABEL_14;
          v44 = *v8;
          v45 = *(double *)(*v8 + 672);
          if (v16 < v45 || v15 < v44 && v16 == v45)
          {
            v46 = v7 + 1;
            do
            {
              v9 = v46;
              v47 = *v46;
              v48 = *(double *)(*v46 + 672);
              if (v16 < v48)
                break;
              ++v46;
            }
            while (v15 >= v47 || v16 != v48);
          }
          else
          {
            v63 = v7 + 1;
            do
            {
              v9 = v63;
              if (v63 >= a2)
                break;
              v64 = *v63;
              v65 = *(double *)(*v63 + 672);
              if (v16 < v65)
                break;
              ++v63;
            }
            while (v15 >= v64 || v16 != v65);
          }
          i = a2;
          if (v9 < a2)
          {
            for (i = a2 - 1; ; --i)
            {
              if (v16 >= v45)
              {
                v51 = v16 == v45 && v15 < v44;
                if (!v51)
                  break;
              }
              v52 = *(i - 1);
              v44 = v52;
              v45 = *(double *)(v52 + 672);
            }
          }
          if (v9 < i)
          {
            v53 = *v9;
            v54 = *i;
            do
            {
              *v9 = v54;
              *i = v53;
              v55 = *(double *)(v15 + 672);
              v56 = v9 + 1;
              do
              {
                v9 = v56;
                v53 = *v56;
                v57 = *(double *)(*v56 + 672);
                if (v55 < v57)
                  break;
                ++v56;
              }
              while (v15 >= v53 || v55 != v57);
              do
              {
                do
                {
                  v59 = *--i;
                  v54 = v59;
                  v60 = *(double *)(v59 + 672);
                }
                while (v55 < v60);
              }
              while (v15 < v54 && v55 == v60);
            }
            while (v9 < i);
          }
          v62 = v9 - 1;
          if (v9 - 1 != v7)
            *v7 = *v62;
          a4 = 0;
          *v62 = v15;
          continue;
        }
        v16 = *(double *)(v15 + 672);
LABEL_14:
        for (j = 0; ; ++j)
        {
          v20 = v7[j + 1];
          v21 = *(double *)(v20 + 672);
          if (v21 >= v16 && (v20 >= v15 || v21 != v16))
            break;
        }
        v23 = &v7[j];
        v24 = (unint64_t)&v7[j + 1];
        v25 = a2 - 1;
        if (j * 8)
        {
          do
          {
            v26 = v25;
            v27 = *v25;
            v28 = *(double *)(*v25 + 672);
            if (v28 < v16)
              break;
            --v25;
          }
          while (v27 >= v15 || v28 != v16);
        }
        else
        {
          v30 = a2 - 1;
          while (1)
          {
            v26 = v30;
            v31 = (unint64_t)(v30 + 1);
            if (v24 >= v31)
              break;
            v32 = *(double *)(*v26 + 672);
            if (v32 >= v16)
            {
              v30 = v26 - 1;
              if (*v26 >= v15 || v32 != v16)
                continue;
            }
            goto LABEL_40;
          }
          v26 = (uint64_t *)v31;
        }
LABEL_40:
        if (v24 < (unint64_t)v26)
        {
          v34 = *v26;
          v35 = v24;
          v36 = v26;
          do
          {
            *(_QWORD *)v35 = v34;
            v35 += 8;
            *v36 = v20;
            v37 = *(double *)(v15 + 672);
            while (1)
            {
              v20 = *(_QWORD *)v35;
              v38 = *(double *)(*(_QWORD *)v35 + 672);
              if (v38 >= v37 && (v20 >= v15 || v38 != v37))
                break;
              v35 += 8;
            }
            v40 = v36 - 1;
            do
            {
              v36 = v40;
              v34 = *v40;
              v41 = *(double *)(*v40 + 672);
              if (v41 < v37)
                break;
              --v40;
            }
            while (v34 >= v15 || v41 != v37);
          }
          while (v35 < (unint64_t)v36);
          v23 = (uint64_t *)(v35 - 8);
        }
        if (v23 != v7)
          *v7 = *v23;
        *v23 = v15;
        if (v24 < (unint64_t)v26)
        {
LABEL_63:
          result = std::__introsort<std::_ClassicAlgPolicy,_MKSpatialVertComp &,MKAnnotationView **,false>(v7, v23, a3, a4 & 1);
          a4 = 0;
          v9 = v23 + 1;
          continue;
        }
        v43 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialVertComp &,MKAnnotationView **>(v7, v23);
        v9 = v23 + 1;
        result = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialVertComp &,MKAnnotationView **>(v23 + 1, a2);
        if (!(_DWORD)result)
        {
          if (v43)
            continue;
          goto LABEL_63;
        }
        a2 = v23;
        if (!v43)
          goto LABEL_2;
        return result;
    }
  }
}

uint64_t *std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialVertComp &,MKAnnotationView **>(uint64_t *result, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  BOOL v8;
  uint64_t v9;
  double v10;
  BOOL v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  double v17;
  BOOL v18;
  uint64_t v19;
  double v20;
  double v21;

  v3 = *a2;
  v4 = *(double *)(*a2 + 672);
  v5 = *result;
  v6 = *result + 664;
  v7 = *(double *)(*result + 672);
  if (v4 < v7 || (v3 < v5 ? (v8 = v4 == v7) : (v8 = 0), v8))
  {
    v16 = *a3;
    v17 = *(double *)(*a3 + 672);
    if (v17 < v4 || (v16 < v3 ? (v18 = v17 == v4) : (v18 = 0), v18))
    {
      *result = v16;
    }
    else
    {
      *result = v3;
      *a2 = v5;
      v19 = *a3;
      v20 = *(double *)(*a3 + 672);
      v21 = *(double *)(v6 + 8);
      if (v20 >= v21 && (v19 >= v5 || v20 != v21))
        return result;
      *a2 = v19;
    }
    *a3 = v5;
    return result;
  }
  v9 = *a3;
  v10 = *(double *)(*a3 + 672);
  if (v10 < v4 || (v9 < v3 ? (v11 = v10 == v4) : (v11 = 0), v11))
  {
    *a2 = v9;
    *a3 = v3;
    v12 = *a2;
    v13 = *(double *)(*a2 + 672);
    v14 = *result;
    v15 = *(double *)(*result + 672);
    if (v13 < v15 || v12 < v14 && v13 == v15)
    {
      *result = v12;
      *a2 = v14;
    }
  }
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialVertComp &,MKAnnotationView **>(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  _BOOL8 result;
  uint64_t v6;
  double v7;
  uint64_t v8;
  double v9;
  BOOL v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  double v18;
  BOOL v19;
  uint64_t *v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  double v24;

  v4 = a2 - a1;
  result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      v6 = *(a2 - 1);
      v7 = *(double *)(v6 + 672);
      v8 = *a1;
      v9 = *(double *)(*a1 + 672);
      if (v7 < v9 || (v6 < v8 ? (v10 = v7 == v9) : (v10 = 0), v10))
      {
        *a1 = v6;
        *(a2 - 1) = v8;
      }
      return result;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialVertComp &,MKAnnotationView **>(a1, a1 + 1, a2 - 1);
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialVertComp &,MKAnnotationView **>(a1, a1 + 1, a1 + 2, a2 - 1);
      return 1;
    case 5:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialVertComp &,MKAnnotationView **>(a1, a1 + 1, a1 + 2, a1 + 3, a2 - 1);
      return 1;
    default:
      v11 = a1 + 2;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialVertComp &,MKAnnotationView **>(a1, a1 + 1, a1 + 2);
      v12 = a1 + 3;
      if (a1 + 3 == a2)
        return 1;
      v13 = 0;
      v14 = 0;
      break;
  }
  while (1)
  {
    v15 = *v12;
    v16 = *(double *)(*v12 + 672);
    v17 = *v11;
    v18 = *(double *)(*v11 + 672);
    if (v16 < v18 || (v15 < v17 ? (v19 = v16 == v18) : (v19 = 0), v19))
    {
      *v12 = v17;
      v20 = a1;
      if (v11 != a1)
      {
        v21 = v13;
        do
        {
          v22 = *(double *)(v15 + 672);
          v23 = *(uint64_t *)((char *)a1 + v21 + 8);
          v24 = *(double *)(v23 + 672);
          if (v22 >= v24 && (v15 >= v23 || v22 != v24))
          {
            v20 = (uint64_t *)((char *)a1 + v21 + 16);
            goto LABEL_27;
          }
          *(uint64_t *)((char *)a1 + v21 + 16) = v23;
          v21 -= 8;
        }
        while (v21 != -16);
        v20 = a1;
      }
LABEL_27:
      *v20 = v15;
      if (++v14 == 8)
        return v12 + 1 == a2;
    }
    v11 = v12;
    v13 += 8;
    if (++v12 == a2)
      return 1;
  }
}

uint64_t *std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialVertComp &,MKAnnotationView **>(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t *result;
  uint64_t v9;
  double v10;
  uint64_t v11;
  double v12;
  BOOL v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  double v21;

  result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialVertComp &,MKAnnotationView **>(a1, a2, a3);
  v9 = *a4;
  v10 = *(double *)(*a4 + 672);
  v11 = *a3;
  v12 = *(double *)(*a3 + 672);
  if (v10 < v12 || (v9 < v11 ? (v13 = v10 == v12) : (v13 = 0), v13))
  {
    *a3 = v9;
    *a4 = v11;
    v14 = *a3;
    v15 = *(double *)(*a3 + 672);
    v16 = *a2;
    v17 = *(double *)(*a2 + 672);
    if (v15 < v17 || v14 < v16 && v15 == v17)
    {
      *a2 = v14;
      *a3 = v16;
      v18 = *a2;
      v19 = *(double *)(*a2 + 672);
      v20 = *a1;
      v21 = *(double *)(*a1 + 672);
      if (v19 < v21 || v18 < v20 && v19 == v21)
      {
        *a1 = v18;
        *a2 = v20;
      }
    }
  }
  return result;
}

uint64_t *std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialVertComp &,MKAnnotationView **>(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t *result;
  uint64_t v11;
  double v12;
  uint64_t v13;
  double v14;
  BOOL v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  double v27;

  result = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialVertComp &,MKAnnotationView **>(a1, a2, a3, a4);
  v11 = *a5;
  v12 = *(double *)(*a5 + 672);
  v13 = *a4;
  v14 = *(double *)(*a4 + 672);
  if (v12 < v14 || (v11 < v13 ? (v15 = v12 == v14) : (v15 = 0), v15))
  {
    *a4 = v11;
    *a5 = v13;
    v16 = *a4;
    v17 = *(double *)(*a4 + 672);
    v18 = *a3;
    v19 = *(double *)(*a3 + 672);
    if (v17 < v19 || v16 < v18 && v17 == v19)
    {
      *a3 = v16;
      *a4 = v18;
      v20 = *a3;
      v21 = *(double *)(*a3 + 672);
      v22 = *a2;
      v23 = *(double *)(*a2 + 672);
      if (v21 < v23 || v20 < v22 && v21 == v23)
      {
        *a2 = v20;
        *a3 = v22;
        v24 = *a2;
        v25 = *(double *)(*a2 + 672);
        v26 = *a1;
        v27 = *(double *)(*a1 + 672);
        if (v25 < v27 || v24 < v26 && v25 == v27)
        {
          *a1 = v24;
          *a2 = v26;
        }
      }
    }
  }
  return result;
}

uint64_t *std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialHorzComp &,MKAnnotationView **>(uint64_t *result, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3;
  double v4;
  uint64_t v5;
  double v6;
  BOOL v7;
  uint64_t v8;
  double v9;
  BOOL v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  double v16;
  BOOL v17;
  uint64_t v18;
  double v19;
  double v20;

  v3 = *a2;
  v4 = *(double *)(*a2 + 664);
  v5 = *result;
  v6 = *(double *)(*result + 664);
  if (v4 < v6 || (v3 < v5 ? (v7 = v4 == v6) : (v7 = 0), v7))
  {
    v15 = *a3;
    v16 = *(double *)(*a3 + 664);
    if (v16 < v4 || (v15 < v3 ? (v17 = v16 == v4) : (v17 = 0), v17))
    {
      *result = v15;
    }
    else
    {
      *result = v3;
      *a2 = v5;
      v18 = *a3;
      v19 = *(double *)(*a3 + 664);
      v20 = *(double *)(v5 + 664);
      if (v19 >= v20 && (v18 >= v5 || v19 != v20))
        return result;
      *a2 = v18;
    }
    *a3 = v5;
    return result;
  }
  v8 = *a3;
  v9 = *(double *)(*a3 + 664);
  if (v9 < v4 || (v8 < v3 ? (v10 = v9 == v4) : (v10 = 0), v10))
  {
    *a2 = v8;
    *a3 = v3;
    v11 = *a2;
    v12 = *(double *)(*a2 + 664);
    v13 = *result;
    v14 = *(double *)(*result + 664);
    if (v12 < v14 || v11 < v13 && v12 == v14)
    {
      *result = v11;
      *a2 = v13;
    }
  }
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialHorzComp &,MKAnnotationView **>(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  _BOOL8 result;
  uint64_t v6;
  double v7;
  uint64_t v8;
  double v9;
  BOOL v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  double v18;
  BOOL v19;
  uint64_t *v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  double v24;

  v4 = a2 - a1;
  result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      v6 = *(a2 - 1);
      v7 = *(double *)(v6 + 664);
      v8 = *a1;
      v9 = *(double *)(*a1 + 664);
      if (v7 < v9 || (v6 < v8 ? (v10 = v7 == v9) : (v10 = 0), v10))
      {
        *a1 = v6;
        *(a2 - 1) = v8;
      }
      return result;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialHorzComp &,MKAnnotationView **>(a1, a1 + 1, a2 - 1);
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialHorzComp &,MKAnnotationView **>(a1, a1 + 1, a1 + 2, a2 - 1);
      return 1;
    case 5:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialHorzComp &,MKAnnotationView **>(a1, a1 + 1, a1 + 2, a1 + 3, a2 - 1);
      return 1;
    default:
      v11 = a1 + 2;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialHorzComp &,MKAnnotationView **>(a1, a1 + 1, a1 + 2);
      v12 = a1 + 3;
      if (a1 + 3 == a2)
        return 1;
      v13 = 0;
      v14 = 0;
      break;
  }
  while (1)
  {
    v15 = *v12;
    v16 = *(double *)(*v12 + 664);
    v17 = *v11;
    v18 = *(double *)(*v11 + 664);
    if (v16 < v18 || (v15 < v17 ? (v19 = v16 == v18) : (v19 = 0), v19))
    {
      *v12 = v17;
      v20 = a1;
      if (v11 != a1)
      {
        v21 = v13;
        do
        {
          v22 = *(double *)(v15 + 664);
          v23 = *(uint64_t *)((char *)a1 + v21 + 8);
          v24 = *(double *)(v23 + 664);
          if (v22 >= v24 && (v15 >= v23 || v22 != v24))
          {
            v20 = (uint64_t *)((char *)a1 + v21 + 16);
            goto LABEL_27;
          }
          *(uint64_t *)((char *)a1 + v21 + 16) = v23;
          v21 -= 8;
        }
        while (v21 != -16);
        v20 = a1;
      }
LABEL_27:
      *v20 = v15;
      if (++v14 == 8)
        return v12 + 1 == a2;
    }
    v11 = v12;
    v13 += 8;
    if (++v12 == a2)
      return 1;
  }
}

uint64_t *std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialHorzComp &,MKAnnotationView **>(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t *result;
  uint64_t v9;
  double v10;
  uint64_t v11;
  double v12;
  BOOL v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  double v21;

  result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialHorzComp &,MKAnnotationView **>(a1, a2, a3);
  v9 = *a4;
  v10 = *(double *)(*a4 + 664);
  v11 = *a3;
  v12 = *(double *)(*a3 + 664);
  if (v10 < v12 || (v9 < v11 ? (v13 = v10 == v12) : (v13 = 0), v13))
  {
    *a3 = v9;
    *a4 = v11;
    v14 = *a3;
    v15 = *(double *)(*a3 + 664);
    v16 = *a2;
    v17 = *(double *)(*a2 + 664);
    if (v15 < v17 || v14 < v16 && v15 == v17)
    {
      *a2 = v14;
      *a3 = v16;
      v18 = *a2;
      v19 = *(double *)(*a2 + 664);
      v20 = *a1;
      v21 = *(double *)(*a1 + 664);
      if (v19 < v21 || v18 < v20 && v19 == v21)
      {
        *a1 = v18;
        *a2 = v20;
      }
    }
  }
  return result;
}

uint64_t *std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialHorzComp &,MKAnnotationView **>(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t *result;
  uint64_t v11;
  double v12;
  uint64_t v13;
  double v14;
  BOOL v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  double v27;

  result = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialHorzComp &,MKAnnotationView **>(a1, a2, a3, a4);
  v11 = *a5;
  v12 = *(double *)(*a5 + 664);
  v13 = *a4;
  v14 = *(double *)(*a4 + 664);
  if (v12 < v14 || (v11 < v13 ? (v15 = v12 == v14) : (v15 = 0), v15))
  {
    *a4 = v11;
    *a5 = v13;
    v16 = *a4;
    v17 = *(double *)(*a4 + 664);
    v18 = *a3;
    v19 = *(double *)(*a3 + 664);
    if (v17 < v19 || v16 < v18 && v17 == v19)
    {
      *a3 = v16;
      *a4 = v18;
      v20 = *a3;
      v21 = *(double *)(*a3 + 664);
      v22 = *a2;
      v23 = *(double *)(*a2 + 664);
      if (v21 < v23 || v20 < v22 && v21 == v23)
      {
        *a2 = v20;
        *a3 = v22;
        v24 = *a2;
        v25 = *(double *)(*a2 + 664);
        v26 = *a1;
        v27 = *(double *)(*a1 + 664);
        if (v25 < v27 || v24 < v26 && v25 == v27)
        {
          *a1 = v24;
          *a2 = v26;
        }
      }
    }
  }
  return result;
}

unint64_t std::hash<_MKAnnotationViewPair>::operator()(unint64_t a1, unint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v2 = 0x9DDFEA08EB382D69 * (((8 * a1) + 8) ^ HIDWORD(a1));
  v3 = 0x9DDFEA08EB382D69 * (HIDWORD(a1) ^ (v2 >> 47) ^ v2);
  v4 = 0x9DDFEA08EB382D69 * (((8 * a2) + 8) ^ HIDWORD(a2));
  v5 = 0x9DDFEA08EB382D69 * (HIDWORD(a2) ^ (v4 >> 47) ^ v4);
  return (0x77FA823ACE0B5A40 * (v3 ^ (v3 >> 47))
        + ((0x9DDFEA08EB382D69 * (v3 ^ (v3 >> 47))) >> 2)
        - 0x622015F714C7D297 * (v5 ^ (v5 >> 47))
        - 0x61C8864680B583EBLL) ^ (0x9DDFEA08EB382D69 * (v3 ^ (v3 >> 47)));
}

const __CFString *MKPlaceCardActionTypeAsString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0x2C)
    return CFSTR("Unknown");
  else
    return off_1E20DC450[a1 - 1];
}

void sub_18B201948(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

const __CFString *MKPlaceItemOptionsAsString(uint64_t a1)
{
  const __CFString *result;
  const __CFString *v3;

  result = CFSTR("MKPlaceItemOptionNone");
  switch(a1)
  {
    case 1:
      result = CFSTR("MKPlaceItemOptionUserLocation");
      break;
    case 2:
      result = CFSTR("MKPlaceItemOptionDroppedPin");
      break;
    case 3:
    case 5:
    case 6:
    case 7:
      return result;
    case 4:
      result = CFSTR("MKPlaceItemOptionSuggestedFavorite");
      break;
    case 8:
      result = CFSTR("MKPlaceItemOptionMeCard");
      break;
    default:
      v3 = CFSTR("MKPlaceItemOptionPersonCard");
      if (a1 != 32)
        v3 = CFSTR("MKPlaceItemOptionNone");
      if (a1 == 16)
        result = CFSTR("MKPlaceItemOptionContactOnly");
      else
        result = v3;
      break;
  }
  return result;
}

void sub_18B205694(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18B2076D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id overlayRendererKVOKeys()
{
  if (qword_1EDFB7C90 != -1)
    dispatch_once(&qword_1EDFB7C90, &__block_literal_global_325);
  return (id)_MergedGlobals_2;
}

void __overlayRendererKVOKeys_block_invoke()
{
  void *v0;

  v0 = (void *)_MergedGlobals_2;
  _MergedGlobals_2 = (uint64_t)&unk_1E215A0D8;

}

id MKGetMKSearchFoundationResultLog()
{
  if (qword_1EDFB7B58 != -1)
    dispatch_once(&qword_1EDFB7B58, &__block_literal_global_81);
  return (id)_MergedGlobals_1_11;
}

void sub_18B2119A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18B213370(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18B2136C8(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_18B2141F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18B21AC78(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18B21AD20(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void _AddPathForPolygon(CGPath *a1, void *a2, double a3, double a4)
{
  id v7;
  unint64_t v8;
  double *v9;
  double *v10;
  unint64_t v11;
  double *v12;
  id v13;

  v7 = a2;
  v8 = objc_msgSend(v7, "pointCount");
  v13 = objc_retainAutorelease(v7);
  v9 = (double *)objc_msgSend(v13, "points");
  if (v8 >= 3)
  {
    v10 = v9;
    CGPathMoveToPoint(a1, 0, *v9 - a3, v9[1] - a4);
    v11 = v8 - 1;
    v12 = v10 + 3;
    do
    {
      CGPathAddLineToPoint(a1, 0, *(v12 - 1) - a3, *v12 - a4);
      v12 += 2;
      --v11;
    }
    while (v11);
    CGPathCloseSubpath(a1);
  }

}

void sub_18B21EB2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_18B21EBE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_18B2208CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18B221868(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  id *v33;
  id *v34;
  uint64_t v35;

  objc_destroyWeak(v34);
  objc_destroyWeak(v33);
  objc_destroyWeak((id *)(v35 - 176));
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

void sub_18B223698(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_18B224DF0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_18B224EF8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18B225250(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::vector<gm::Matrix<double,2,1>>::reserve(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  int64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 4)
  {
    if (a2 >> 60)
      std::vector<VKRouteInfo * {__strong}>::__throw_length_error[abi:ne180100]();
    v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<gm::Matrix<double,2,1>>>(v3, a2);
    v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF0];
    v9 = &v6[16 * v8];
    v11 = (char *)*a1;
    v10 = (char *)a1[1];
    v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        *((_OWORD *)v12 - 1) = *((_OWORD *)v10 - 1);
        v12 -= 16;
        v10 -= 16;
      }
      while (v10 != v11);
      v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
      operator delete(v10);
  }
}

uint64_t geo::Intersect::isSelfIntersecting<double>(_QWORD *a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  double *v8;
  unint64_t v9;
  unint64_t v10;
  double *v11;
  BOOL v12;
  __n128 *v13;
  char *v14;
  unint64_t *v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t *v24;
  __int128 v25;
  BOOL v26;
  __n128 *v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  char *v32;
  uint64_t v33;
  char *v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t *v37;
  __int128 v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t *v42;
  float64x2_t v43;
  uint64_t *v44;
  char v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  float64x2_t v50;
  uint64_t *v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  _QWORD *v56;
  BOOL v57;
  float64x2_t v58;
  BOOL v59;
  float64x2_t v60;
  BOOL v61;
  BOOL v62;
  uint64_t *v63;
  uint64_t *v64;
  _QWORD *v65;
  float64x2_t v67;
  float64x2_t v69;
  uint64_t *v72;
  uint64_t *v73;
  uint64_t *v74;
  uint64_t *v75;
  _QWORD *v76;
  _QWORD *v77;
  float64x2_t v79;
  float64x2_t v81;
  float64x2_t v86;
  float64x2_t v87;
  uint64_t *v88;
  _QWORD *v89[2];
  uint64_t *v90;
  __n128 *v91;
  _QWORD v92[2];

  v2 = a1[1] - *a1;
  if ((unint64_t)v2 < 0x30)
    return 0;
  v90 = 0;
  v91 = 0;
  v92[0] = 0;
  std::vector<BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo,std::allocator<BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo>>::reserve((void **)&v90, v2 >> 4);
  v5 = (uint64_t)(a1[1] - *a1) >> 4;
  v6 = v5 - 1;
  if (a2 && *(_OWORD *)*a1 != *(_OWORD *)(*a1 + 16 * v6))
    v6 = (uint64_t)(a1[1] - *a1) >> 4;
  if (v6)
  {
    v7 = 0;
    do
    {
      v8 = (double *)(*a1 + 16 * v7);
      v9 = v7 + 1;
      v10 = (v7 + 1) % v5;
      v11 = (double *)(*a1 + 16 * v10);
      v12 = *v8 < *v11 || *v8 == *v11 && v8[1] < v11[1];
      v13 = v91;
      v14 = (char *)v92[0];
      if ((unint64_t)v91 >= v92[0])
      {
        v16 = 0xAAAAAAAAAAAAAAABLL * (((char *)v91 - (char *)v90) >> 3);
        v17 = v16 + 1;
        if (v16 + 1 > 0xAAAAAAAAAAAAAAALL)
          std::vector<VKRouteInfo * {__strong}>::__throw_length_error[abi:ne180100]();
        if (0x5555555555555556 * ((uint64_t)(v92[0] - (_QWORD)v90) >> 3) > v17)
          v17 = 0x5555555555555556 * ((uint64_t)(v92[0] - (_QWORD)v90) >> 3);
        if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v92[0] - (_QWORD)v90) >> 3) >= 0x555555555555555)
          v18 = 0xAAAAAAAAAAAAAAALL;
        else
          v18 = v17;
        v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo>>((uint64_t)v92, v18);
        v21 = &v19[24 * v16];
        *(_QWORD *)v21 = v7;
        *((_QWORD *)v21 + 1) = v10;
        v21[16] = v12;
        v23 = v90;
        v22 = (uint64_t *)v91;
        v24 = (uint64_t *)v21;
        if (v91 != (__n128 *)v90)
        {
          do
          {
            v25 = *(_OWORD *)(v22 - 3);
            *((_BYTE *)v24 - 8) = *((_BYTE *)v22 - 8);
            *(_OWORD *)(v24 - 3) = v25;
            v24 -= 3;
            v22 -= 3;
          }
          while (v22 != v23);
          v22 = v90;
        }
        v14 = &v19[24 * v20];
        v15 = (unint64_t *)(v21 + 24);
        v90 = v24;
        v91 = (__n128 *)(v21 + 24);
        v92[0] = v14;
        if (v22)
        {
          operator delete(v22);
          v14 = (char *)v92[0];
        }
      }
      else
      {
        v91->n128_u64[0] = v7;
        v13->n128_u64[1] = v10;
        v15 = &v13[1].n128_u64[1];
        v13[1].n128_u8[0] = v12;
      }
      v91 = (__n128 *)v15;
      v26 = !v12;
      if (v15 >= (unint64_t *)v14)
      {
        v28 = 0xAAAAAAAAAAAAAAABLL * (((char *)v15 - (char *)v90) >> 3);
        v29 = v28 + 1;
        if (v28 + 1 > 0xAAAAAAAAAAAAAAALL)
          std::vector<VKRouteInfo * {__strong}>::__throw_length_error[abi:ne180100]();
        v30 = 0xAAAAAAAAAAAAAAABLL * ((v14 - (char *)v90) >> 3);
        if (2 * v30 > v29)
          v29 = 2 * v30;
        if (v30 >= 0x555555555555555)
          v31 = 0xAAAAAAAAAAAAAAALL;
        else
          v31 = v29;
        v32 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo>>((uint64_t)v92, v31);
        v34 = &v32[24 * v28];
        *(_QWORD *)v34 = v10;
        *((_QWORD *)v34 + 1) = v7;
        v34[16] = v26;
        v36 = v90;
        v35 = (uint64_t *)v91;
        v37 = (uint64_t *)v34;
        if (v91 != (__n128 *)v90)
        {
          do
          {
            v38 = *(_OWORD *)(v35 - 3);
            *((_BYTE *)v37 - 8) = *((_BYTE *)v35 - 8);
            *(_OWORD *)(v37 - 3) = v38;
            v37 -= 3;
            v35 -= 3;
          }
          while (v35 != v36);
          v35 = v90;
        }
        v27 = (__n128 *)(v34 + 24);
        v90 = v37;
        v91 = (__n128 *)(v34 + 24);
        v92[0] = &v32[24 * v33];
        if (v35)
          operator delete(v35);
      }
      else
      {
        *v15 = v10;
        v15[1] = v7;
        v27 = (__n128 *)(v15 + 3);
        *((_BYTE *)v15 + 16) = v26;
      }
      v91 = v27;
      ++v7;
    }
    while (v9 != v6);
  }
  else
  {
    v27 = v91;
  }
  v39 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * (((char *)v27 - (char *)v90) >> 3));
  *(_QWORD *)&v86.f64[0] = a1;
  if (v27 == (__n128 *)v90)
    v40 = 0;
  else
    v40 = v39;
  std::__introsort<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*,false>(v90, v27, (uint64_t **)&v86, v40, 1);
  v89[0] = 0;
  v89[1] = 0;
  v88 = (uint64_t *)v89;
  v41 = v90;
  v42 = (uint64_t *)v91;
  while (1)
  {
    if (v41 == v42)
    {
      v3 = 0;
      goto LABEL_133;
    }
    if (*((_BYTE *)v41 + 16))
      break;
    v49 = v41[1];
    v50 = vsubq_f64(*(float64x2_t *)(*a1 + 16 * *v41), *(float64x2_t *)(*a1 + 16 * v49));
    v86 = *(float64x2_t *)(*a1 + 16 * v49);
    v87 = v50;
    v51 = (uint64_t *)std::__tree<gm::LineSegment<double,2>,geo::Intersect::SHSegmentComparator<double>,std::allocator<gm::LineSegment<double,2>>>::find<gm::LineSegment<double,2>>((uint64_t)&v88, v86.f64);
    v52 = v51;
    if (v89 != (_QWORD **)v51)
    {
      if (v88 != v51)
      {
        v53 = *v51;
        if (*v51)
        {
          do
          {
            v54 = v53;
            v53 = *(_QWORD *)(v53 + 8);
          }
          while (v53);
        }
        else
        {
          v72 = v51;
          do
          {
            v54 = v72[2];
            v57 = *(_QWORD *)v54 == (_QWORD)v72;
            v72 = (uint64_t *)v54;
          }
          while (v57);
        }
        v73 = (uint64_t *)v51[1];
        if (v73)
        {
          do
          {
            v74 = v73;
            v73 = (uint64_t *)*v73;
          }
          while (v73);
        }
        else
        {
          v75 = v51;
          do
          {
            v74 = (uint64_t *)v75[2];
            v57 = *v74 == (_QWORD)v75;
            v75 = v74;
          }
          while (!v57);
        }
        if (v74 != (uint64_t *)v89)
        {
          v76 = (_QWORD *)(v54 + 32);
          v77 = v74 + 4;
          if (gm::LineSegment<double,2>::intersects<double,void>((double *)(v54 + 32), (double *)v74 + 4, 0)
            && (*v76 != *v77 || *(_QWORD *)(v54 + 40) != v74[5]))
          {
            v79 = vaddq_f64(*((float64x2_t *)v74 + 2), *((float64x2_t *)v74 + 3));
            if (*v76 != *(_QWORD *)&v79.f64[0] || *(_QWORD *)(v54 + 40) != *(_QWORD *)&v79.f64[1])
            {
              v81 = vaddq_f64(*(float64x2_t *)(v54 + 32), *(float64x2_t *)(v54 + 48));
              if ((*(_QWORD *)&v81.f64[0] != *v77 || *(_QWORD *)&v81.f64[1] != v74[5])
                && (*(_QWORD *)&v81.f64[0] != *(_QWORD *)&v79.f64[0] || *(_QWORD *)&v81.f64[1] != *(_QWORD *)&v79.f64[1]))
              {
                goto LABEL_132;
              }
            }
          }
        }
      }
      std::__tree<gm::LineSegment<double,2>,geo::Intersect::SHSegmentComparator<double>,std::allocator<gm::LineSegment<double,2>>>::__remove_node_pointer(&v88, v52);
      operator delete(v52);
    }
LABEL_130:
    v41 += 3;
  }
  v43 = vsubq_f64(*(float64x2_t *)(*a1 + 16 * v41[1]), *(float64x2_t *)(*a1 + 16 * *v41));
  v86 = *(float64x2_t *)(*a1 + 16 * *v41);
  v87 = v43;
  v44 = std::__tree<gm::LineSegment<double,2>,geo::Intersect::SHSegmentComparator<double>,std::allocator<gm::LineSegment<double,2>>>::__emplace_unique_key_args<gm::LineSegment<double,2>,gm::LineSegment<double,2> const&>(&v88, v86.f64, &v86);
  if (v45)
  {
    v46 = v44;
    if (v88 == v44)
      goto LABEL_78;
    v47 = *v44;
    if (*v44)
    {
      do
      {
        v48 = v47;
        v47 = *(_QWORD *)(v47 + 8);
      }
      while (v47);
    }
    else
    {
      v55 = v44;
      do
      {
        v48 = v55[2];
        v57 = *(_QWORD *)v48 == (_QWORD)v55;
        v55 = (uint64_t *)v48;
      }
      while (v57);
    }
    v56 = (_QWORD *)(v48 + 32);
    if (!gm::LineSegment<double,2>::intersects<double,void>(v86.f64, (double *)(v48 + 32), 0)
      || (*v56 == *(_QWORD *)&v86.f64[0] ? (v57 = *(_QWORD *)(v48 + 40) == *(_QWORD *)&v86.f64[1]) : (v57 = 0),
          v57
       || ((v58 = vaddq_f64(v86, v87), *v56 == *(_QWORD *)&v58.f64[0])
         ? (v59 = *(_QWORD *)(v48 + 40) == *(_QWORD *)&v58.f64[1])
         : (v59 = 0),
           v59
        || ((v60 = vaddq_f64(*(float64x2_t *)(v48 + 32), *(float64x2_t *)(v48 + 48)),
             *(_QWORD *)&v60.f64[0] == *(_QWORD *)&v86.f64[0])
          ? (v61 = *(_QWORD *)&v60.f64[1] == *(_QWORD *)&v86.f64[1])
          : (v61 = 0),
            v61
         || (*(_QWORD *)&v60.f64[0] == *(_QWORD *)&v58.f64[0]
           ? (v62 = *(_QWORD *)&v60.f64[1] == *(_QWORD *)&v58.f64[1])
           : (v62 = 0),
             v62)))))
    {
LABEL_78:
      v63 = (uint64_t *)v46[1];
      if (v63)
      {
        do
        {
          v64 = v63;
          v63 = (uint64_t *)*v63;
        }
        while (v63);
      }
      else
      {
        do
        {
          v64 = (uint64_t *)v46[2];
          v57 = *v64 == (_QWORD)v46;
          v46 = v64;
        }
        while (!v57);
      }
      if (v64 == (uint64_t *)v89)
        goto LABEL_130;
      v65 = v64 + 4;
      if (!gm::LineSegment<double,2>::intersects<double,void>(v86.f64, (double *)v64 + 4, 0))
        goto LABEL_130;
      if (*v65 == *(_QWORD *)&v86.f64[0] && v64[5] == *(_QWORD *)&v86.f64[1])
        goto LABEL_130;
      v67 = vaddq_f64(v86, v87);
      if (*v65 == *(_QWORD *)&v67.f64[0] && v64[5] == *(_QWORD *)&v67.f64[1])
        goto LABEL_130;
      v69 = vaddq_f64(*((float64x2_t *)v64 + 2), *((float64x2_t *)v64 + 3));
      if (*(_QWORD *)&v69.f64[0] == *(_QWORD *)&v86.f64[0] && *(_QWORD *)&v69.f64[1] == *(_QWORD *)&v86.f64[1])
        goto LABEL_130;
      if (*(_QWORD *)&v69.f64[0] == *(_QWORD *)&v67.f64[0] && *(_QWORD *)&v69.f64[1] == *(_QWORD *)&v67.f64[1])
        goto LABEL_130;
    }
  }
LABEL_132:
  v3 = 1;
LABEL_133:
  std::__tree<gm::LineSegment<double,2>,geo::Intersect::SHSegmentComparator<double>,std::allocator<gm::LineSegment<double,2>>>::destroy((uint64_t)&v88, v89[0]);
  if (v90)
  {
    v91 = (__n128 *)v90;
    operator delete(v90);
  }
  return v3;
}

void sub_18B2259A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25)
{
  uint64_t v25;
  void *v27;

  v27 = *(void **)(v25 - 112);
  if (v27)
  {
    *(_QWORD *)(v25 - 104) = v27;
    operator delete(v27);
  }
  _Unwind_Resume(exception_object);
}

void sub_18B225C78(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<gm::Matrix<double,2,1>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(16 * a2);
}

void std::vector<BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo,std::allocator<BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo>>::reserve(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  int64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  __int128 v13;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (0xAAAAAAAAAAAAAAABLL * ((v4 - (_BYTE *)*a1) >> 3) < a2)
  {
    if (a2 >= 0xAAAAAAAAAAAAAABLL)
      std::vector<VKRouteInfo * {__strong}>::__throw_length_error[abi:ne180100]();
    v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo>>(v3, a2);
    v7 = &v6[v5];
    v9 = &v6[24 * v8];
    v11 = (char *)*a1;
    v10 = (char *)a1[1];
    v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        v13 = *(_OWORD *)(v10 - 24);
        *(v12 - 8) = *(v10 - 8);
        *(_OWORD *)(v12 - 24) = v13;
        v12 -= 24;
        v10 -= 24;
      }
      while (v10 != v11);
      v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
      operator delete(v10);
  }
}

BOOL gm::LineSegment<double,2>::intersects<double,void>(double *a1, double *a2, double *a3)
{
  _BOOL8 result;
  _BOOL4 v4;
  double v5;
  double v6;

  v5 = 0.0;
  v6 = 0.0;
  result = gm::LineSegment<double,2>::intersect<double,void>(a1, a2, &v6, &v5, a3);
  if (result)
  {
    v4 = v6 >= 0.0;
    if (v6 > 1.0)
      v4 = 0;
    if (v5 < 0.0)
      v4 = 0;
    return v5 <= 1.0 && v4;
  }
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(24 * a2);
}

__n128 std::__introsort<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*,false>(uint64_t *a1, __n128 *a2, uint64_t **a3, uint64_t a4, char a5)
{
  __n128 *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t *v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double *v24;
  double *v25;
  unint64_t v26;
  char v27;
  char v28;
  char v29;
  __n128 result;
  int v31;
  __n128 *v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v36;
  unint64_t *v37;
  double *v38;
  __n128 v39;
  __int128 v40;
  __n128 v41;
  uint64_t v42;
  unint64_t v43;

LABEL_1:
  v9 = (__n128 *)a1;
LABEL_2:
  v10 = 1 - a4;
  while (2)
  {
    a1 = (uint64_t *)v9;
    v11 = v10;
    v12 = (char *)a2 - (char *)v9;
    v13 = 0xAAAAAAAAAAAAAAABLL * (((char *)a2 - (char *)v9) >> 3);
    switch(v13)
    {
      case 0uLL:
      case 1uLL:
        return result;
      case 2uLL:
        v32 = (__n128 *)((char *)a2 - 24);
        v33 = a2[-2].n128_u64[1];
        if (a2[-1].n128_u8[8] == v9[1].n128_u8[0])
        {
          v34 = v9->n128_u64[0];
        }
        else
        {
          v34 = v9->n128_u64[0];
          if (v33 == v9->n128_u64[1] && a2[-1].n128_u64[0] == v34)
          {
            if (!a2[-1].n128_u8[8])
              return result;
            goto LABEL_47;
          }
        }
        v36 = **a3;
        v37 = (unint64_t *)(v36 + 16 * v33);
        v38 = (double *)(v36 + 16 * v34);
        result.n128_u64[0] = *v37;
        if (*(double *)v37 >= *v38)
        {
          if (*(double *)v37 != *v38)
            return result;
          result.n128_u64[0] = v37[1];
          if (result.n128_f64[0] >= v38[1])
            return result;
        }
LABEL_47:
        v43 = v9[1].n128_u64[0];
        v41 = *v9;
        v39 = *v32;
        v9[1].n128_u8[0] = a2[-1].n128_u8[8];
        *v9 = v39;
        result = v41;
        *v32 = v41;
        a2[-1].n128_u8[8] = v43;
        return result;
      case 3uLL:
        std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>((uint64_t *)v9, &v9[1].n128_i64[1], &a2[-2].n128_i64[1], a3);
        return result;
      case 4uLL:
        result.n128_u64[0] = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>((uint64_t)v9, (uint64_t)&v9[1].n128_i64[1], (uint64_t *)&v9[3], &a2[-2].n128_i64[1], a3).n128_u64[0];
        return result;
      case 5uLL:
        result.n128_u64[0] = std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>((uint64_t)v9, (uint64_t)&v9[1].n128_i64[1], (uint64_t)&v9[3], &v9[4].n128_i64[1], &a2[-2].n128_i64[1], a3).n128_u64[0];
        return result;
      default:
        if (v12 <= 575)
        {
          if ((a5 & 1) != 0)
            std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>((uint64_t *)v9, (uint64_t *)a2, a3);
          else
            std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>((uint64_t *)v9, (uint64_t *)a2, a3);
          return result;
        }
        if (v11 != 1)
        {
          v14 = v13 >> 1;
          v15 = (uint64_t *)v9 + 3 * (v13 >> 1);
          if ((unint64_t)v12 < 0xC01)
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>((uint64_t *)v9 + 3 * v14, (uint64_t *)v9, &a2[-2].n128_i64[1], a3);
            if ((a5 & 1) != 0)
              goto LABEL_19;
          }
          else
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>((uint64_t *)v9, (uint64_t *)v9 + 3 * v14, &a2[-2].n128_i64[1], a3);
            v16 = 3 * v14;
            v17 = (uint64_t *)&v9[-1] + 3 * v14 - 1;
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>(&v9[1].n128_i64[1], v17, (uint64_t *)&a2[-3], a3);
            v18 = (uint64_t *)&v9[3];
            v19 = &v9[1].n128_i64[v16 + 1];
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>(v18, v19, &a2[-5].n128_i64[1], a3);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>(v17, v15, v19, a3);
            v42 = a1[2];
            v40 = *(_OWORD *)a1;
            v20 = *(_OWORD *)v15;
            *((_BYTE *)a1 + 16) = *((_BYTE *)v15 + 16);
            *(_OWORD *)a1 = v20;
            *((_BYTE *)v15 + 16) = v42;
            *(_OWORD *)v15 = v40;
            if ((a5 & 1) != 0)
              goto LABEL_19;
          }
          v21 = *(a1 - 3);
          if (*((unsigned __int8 *)a1 - 8) == *((unsigned __int8 *)a1 + 16))
          {
            v22 = *a1;
          }
          else
          {
            v22 = *a1;
            if (v21 == a1[1] && *(a1 - 2) == v22)
            {
              if (!*((_BYTE *)a1 - 8))
                goto LABEL_23;
              goto LABEL_19;
            }
          }
          v23 = **a3;
          v24 = (double *)(v23 + 16 * v21);
          v25 = (double *)(v23 + 16 * v22);
          if (*v24 >= *v25 && (*v24 != *v25 || v24[1] >= v25[1]))
          {
LABEL_23:
            v9 = (__n128 *)std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo *,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &>(a1, (unint64_t)a2, a3);
            goto LABEL_24;
          }
LABEL_19:
          v26 = std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo *,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &>(a1, (unint64_t)a2, a3);
          if ((v27 & 1) == 0)
            goto LABEL_22;
          std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>((uint64_t)a1, v26, a3);
          v29 = v28;
          v9 = (__n128 *)(v26 + 24);
          result = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>(v26 + 24, (uint64_t)a2, a3);
          if (!v31)
          {
            v10 = v11 + 1;
            if ((v29 & 1) != 0)
              continue;
LABEL_22:
            std::__introsort<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*,false>(a1, v26, a3, -v11, a5 & 1);
            v9 = (__n128 *)(v26 + 24);
LABEL_24:
            a5 = 0;
            a4 = -v11;
            goto LABEL_2;
          }
          a4 = -v11;
          a2 = (__n128 *)v26;
          if ((v29 & 1) != 0)
            return result;
          goto LABEL_1;
        }
        if (v9 != a2)
          std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>(v9, a2, a2, a3);
        return result;
    }
  }
}

uint64_t *std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>(uint64_t *result, uint64_t *a2, uint64_t **a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  double *v12;
  double *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v21;
  double *v22;
  double *v23;

  if (result == a2)
    return result;
  v3 = result + 3;
  if (result + 3 == a2)
    return result;
  v4 = 0;
  v5 = result;
  do
  {
    v6 = v5;
    v5 = v3;
    v7 = *((unsigned __int8 *)v6 + 40);
    v8 = v6[3];
    if (v7 == *((unsigned __int8 *)v6 + 16))
    {
      v9 = *v6;
LABEL_10:
      v11 = **a3;
      v12 = (double *)(v11 + 16 * v8);
      v13 = (double *)(v11 + 16 * v9);
      if (*v12 >= *v13 && (*v12 != *v13 || v12[1] >= v13[1]))
        goto LABEL_33;
      goto LABEL_15;
    }
    v9 = *v6;
    if (v8 != v6[1] || v6[4] != v9)
      goto LABEL_10;
    if (!*((_BYTE *)v6 + 40))
      goto LABEL_33;
LABEL_15:
    v14 = v6[4];
    *(_OWORD *)v5 = *(_OWORD *)v6;
    *((_BYTE *)v5 + 16) = *((_BYTE *)v6 + 16);
    v15 = result;
    if (v6 == result)
      goto LABEL_32;
    v16 = v4;
    while (1)
    {
      v17 = (uint64_t)result + v16;
      v18 = (uint64_t *)((char *)result + v16 - 24);
      if (v7 == *((unsigned __int8 *)result + v16 - 8))
        break;
      v19 = *v18;
      if (v8 != *(_QWORD *)(v17 - 16) || v14 != v19)
        goto LABEL_23;
      if (!v7)
        goto LABEL_31;
LABEL_29:
      v6 -= 3;
      *(_OWORD *)v17 = *(_OWORD *)v18;
      *(_BYTE *)(v17 + 16) = *((_BYTE *)result + v16 - 8);
      v16 -= 24;
      if (!v16)
      {
        v15 = result;
        goto LABEL_32;
      }
    }
    v19 = *v18;
LABEL_23:
    v21 = **a3;
    v22 = (double *)(v21 + 16 * v8);
    v23 = (double *)(v21 + 16 * v19);
    if (*v22 < *v23)
      goto LABEL_29;
    if (*v22 != *v23)
    {
      v15 = (uint64_t *)((char *)result + v16);
      goto LABEL_32;
    }
    if (v22[1] < v23[1])
      goto LABEL_29;
LABEL_31:
    v15 = v6;
LABEL_32:
    *v15 = v8;
    v15[1] = v14;
    *((_BYTE *)v15 + 16) = v7;
LABEL_33:
    v3 = v5 + 3;
    v4 += 24;
  }
  while (v5 + 3 != a2);
  return result;
}

uint64_t *std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>(uint64_t *result, uint64_t *a2, uint64_t **a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  double *v9;
  double *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v15;
  double *v16;
  double *v17;

  if (result != a2)
  {
    while (1)
    {
LABEL_2:
      if (result + 3 == a2)
        return result;
      v3 = result;
      result += 3;
      v4 = *((unsigned __int8 *)v3 + 40);
      v5 = v3[3];
      if (v4 == *((unsigned __int8 *)v3 + 16))
      {
        v6 = *v3;
      }
      else
      {
        v6 = *v3;
        if (v5 == v3[1] && v3[4] == v6)
        {
          if (!*((_BYTE *)v3 + 40))
            continue;
LABEL_14:
          v11 = v3[4];
          while (1)
          {
            v12 = v3;
            *(_OWORD *)(v3 + 3) = *(_OWORD *)v3;
            *((_BYTE *)v3 + 40) = *((_BYTE *)v3 + 16);
            v3 -= 3;
            if (v4 == *((unsigned __int8 *)v12 - 8))
            {
              v13 = *(v12 - 3);
            }
            else
            {
              v13 = *(v12 - 3);
              if (v5 == *(v12 - 2) && v11 == v13)
              {
                if (!v4)
                  goto LABEL_26;
                continue;
              }
            }
            v15 = **a3;
            v16 = (double *)(v15 + 16 * v5);
            v17 = (double *)(v15 + 16 * v13);
            if (*v16 >= *v17 && (*v16 != *v17 || v16[1] >= v17[1]))
            {
LABEL_26:
              *v12 = v5;
              v12[1] = v11;
              *((_BYTE *)v12 + 16) = v4;
              goto LABEL_2;
            }
          }
        }
      }
      v8 = **a3;
      v9 = (double *)(v8 + 16 * v5);
      v10 = (double *)(v8 + 16 * v6);
      if (*v9 < *v10 || *v9 == *v10 && v9[1] < v10[1])
        goto LABEL_14;
    }
  }
  return result;
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t **a4)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  double *v9;
  double *v10;
  uint64_t v11;
  uint64_t v12;
  double *v13;
  double *v14;
  uint64_t v16;
  uint64_t v17;
  double *v18;
  double *v19;
  __int128 v20;
  uint64_t v21;
  char v22;
  __int128 v23;
  uint64_t v24;
  char v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  double *v35;
  double *v36;
  __int128 v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  double *v41;
  double *v42;
  __int128 v43;
  uint64_t v44;
  char v45;

  v4 = *((unsigned __int8 *)a2 + 16);
  v5 = *a2;
  if (v4 == *((unsigned __int8 *)a1 + 16))
  {
    v6 = *a1;
  }
  else
  {
    v6 = *a1;
    if (v5 == a1[1] && a2[1] == v6)
    {
      if (!*((_BYTE *)a2 + 16))
        goto LABEL_10;
      goto LABEL_16;
    }
  }
  v8 = **a4;
  v9 = (double *)(v8 + 16 * v5);
  v10 = (double *)(v8 + 16 * v6);
  if (*v9 >= *v10 && (*v9 != *v10 || v9[1] >= v10[1]))
  {
LABEL_10:
    v11 = *a3;
    if (*((unsigned __int8 *)a3 + 16) != v4 && v11 == a2[1] && a3[1] == v5)
    {
      if (*((_BYTE *)a3 + 16))
        goto LABEL_31;
    }
    else
    {
      v12 = **a4;
      v13 = (double *)(v12 + 16 * v11);
      v14 = (double *)(v12 + 16 * v5);
      if (*v13 < *v14 || *v13 == *v14 && v13[1] < v14[1])
      {
LABEL_31:
        v29 = *(_OWORD *)a2;
        v30 = a2[2];
        v31 = *((_BYTE *)a3 + 16);
        *(_OWORD *)a2 = *(_OWORD *)a3;
        *((_BYTE *)a2 + 16) = v31;
        *((_BYTE *)a3 + 16) = v30;
        *(_OWORD *)a3 = v29;
        v32 = *a2;
        if (*((unsigned __int8 *)a2 + 16) == *((unsigned __int8 *)a1 + 16))
        {
          v33 = *a1;
        }
        else
        {
          v33 = *a1;
          if (v32 == a1[1] && a2[1] == v33)
          {
            if (*((_BYTE *)a2 + 16))
            {
LABEL_48:
              v43 = *(_OWORD *)a1;
              v44 = a1[2];
              v45 = *((_BYTE *)a2 + 16);
              *(_OWORD *)a1 = *(_OWORD *)a2;
              *((_BYTE *)a1 + 16) = v45;
              *((_BYTE *)a2 + 16) = v44;
              *(_OWORD *)a2 = v43;
              return 2;
            }
            return 1;
          }
        }
        v40 = **a4;
        v41 = (double *)(v40 + 16 * v32);
        v42 = (double *)(v40 + 16 * v33);
        if (*v41 < *v42 || *v41 == *v42 && v41[1] < v42[1])
          goto LABEL_48;
        return 1;
      }
    }
    return 0;
  }
LABEL_16:
  v16 = *a3;
  if (*((unsigned __int8 *)a3 + 16) != v4 && v16 == a2[1] && a3[1] == v5)
  {
    if (!*((_BYTE *)a3 + 16))
      goto LABEL_26;
LABEL_24:
    v20 = *(_OWORD *)a1;
    v21 = a1[2];
    v22 = *((_BYTE *)a3 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a3;
    *((_BYTE *)a1 + 16) = v22;
    *((_BYTE *)a3 + 16) = v21;
    *(_OWORD *)a3 = v20;
    return 1;
  }
  v17 = **a4;
  v18 = (double *)(v17 + 16 * v16);
  v19 = (double *)(v17 + 16 * v5);
  if (*v18 < *v19 || *v18 == *v19 && v18[1] < v19[1])
    goto LABEL_24;
LABEL_26:
  v23 = *(_OWORD *)a1;
  v24 = a1[2];
  v25 = *((_BYTE *)a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_BYTE *)a1 + 16) = v25;
  *((_BYTE *)a2 + 16) = v24;
  *(_OWORD *)a2 = v23;
  v26 = v24;
  v27 = *a3;
  if (*((unsigned __int8 *)a3 + 16) == v26)
  {
    v28 = *a2;
    goto LABEL_37;
  }
  v28 = *a2;
  if (v27 != a2[1] || a3[1] != v28)
  {
LABEL_37:
    v34 = **a4;
    v35 = (double *)(v34 + 16 * v27);
    v36 = (double *)(v34 + 16 * v28);
    if (*v35 >= *v36 && (*v35 != *v36 || v35[1] >= v36[1]))
      return 1;
    goto LABEL_40;
  }
  if (!*((_BYTE *)a3 + 16))
    return 1;
LABEL_40:
  v37 = *(_OWORD *)a2;
  v38 = a2[2];
  v39 = *((_BYTE *)a3 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a3;
  *((_BYTE *)a2 + 16) = v39;
  *((_BYTE *)a3 + 16) = v38;
  *(_OWORD *)a3 = v37;
  return 2;
}

unint64_t std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo *,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &>(uint64_t *a1, unint64_t a2, uint64_t **a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t *v9;
  uint64_t v10;
  double *v11;
  double *v12;
  unint64_t i;
  uint64_t v14;
  double *v16;
  double *v17;
  uint64_t *v18;
  uint64_t v19;
  double *v21;
  double *v22;
  uint64_t *v23;
  _QWORD *v24;
  uint64_t v25;
  double *v27;
  double *v28;
  __int128 v29;
  uint64_t *v30;
  uint64_t v31;
  double *v33;
  double *v34;
  uint64_t v35;
  double *v37;
  double *v38;
  __int128 v39;
  __int128 v41;
  uint64_t v42;

  v3 = *a1;
  v4 = a1[1];
  v5 = *((unsigned __int8 *)a1 + 16);
  v6 = *(unsigned __int8 *)(a2 - 8);
  if (v5 == v6)
  {
    v7 = *(_QWORD *)(a2 - 24);
    goto LABEL_7;
  }
  v7 = *(_QWORD *)(a2 - 24);
  if (v3 != *(_QWORD *)(a2 - 16) || v4 != v7)
  {
LABEL_7:
    v9 = *a3;
    v10 = **a3;
    v11 = (double *)(v10 + 16 * v3);
    v12 = (double *)(v10 + 16 * v7);
    if (*v11 >= *v12 && (*v11 != *v12 || v11[1] >= v12[1]))
      goto LABEL_26;
    goto LABEL_13;
  }
  if (*((_BYTE *)a1 + 16))
  {
    v9 = *a3;
LABEL_13:
    for (i = (unint64_t)(a1 + 3); ; i += 24)
    {
      if (v5 == *(unsigned __int8 *)(i + 16))
      {
        v14 = *(_QWORD *)i;
      }
      else
      {
        v14 = *(_QWORD *)i;
        if (v3 == *(_QWORD *)(i + 8) && v4 == v14)
        {
          if (*((_BYTE *)a1 + 16))
            goto LABEL_40;
          continue;
        }
      }
      v16 = (double *)(*v9 + 16 * v3);
      v17 = (double *)(*v9 + 16 * v14);
      if (*v16 < *v17 || *v16 == *v17 && v16[1] < v17[1])
        goto LABEL_40;
    }
  }
LABEL_26:
  i = (unint64_t)(a1 + 3);
  if ((unint64_t)(a1 + 3) < a2)
  {
    v18 = *a3;
    do
    {
      if (v5 == *(unsigned __int8 *)(i + 16))
      {
        v19 = *(_QWORD *)i;
      }
      else
      {
        v19 = *(_QWORD *)i;
        if (v3 == *(_QWORD *)(i + 8) && v4 == v19)
        {
          if (*((_BYTE *)a1 + 16))
            break;
          goto LABEL_39;
        }
      }
      v21 = (double *)(*v18 + 16 * v3);
      v22 = (double *)(*v18 + 16 * v19);
      if (*v21 < *v22 || *v21 == *v22 && v21[1] < v22[1])
        break;
LABEL_39:
      i += 24;
    }
    while (i < a2);
  }
LABEL_40:
  if (i >= a2)
    goto LABEL_78;
  v23 = *a3;
  v24 = (_QWORD *)(a2 - 16);
  while (v5 != v6)
  {
    v25 = *(v24 - 1);
    if (v3 != *v24 || v4 != v25)
      goto LABEL_48;
    if (!*((_BYTE *)a1 + 16))
      goto LABEL_54;
LABEL_53:
    v6 = *((unsigned __int8 *)v24 - 16);
    v24 -= 3;
  }
  v25 = *(v24 - 1);
LABEL_48:
  v27 = (double *)(*v23 + 16 * v3);
  v28 = (double *)(*v23 + 16 * v25);
  if (*v27 < *v28 || *v27 == *v28 && v27[1] < v28[1])
    goto LABEL_53;
LABEL_54:
  a2 = (unint64_t)(v24 - 1);
LABEL_78:
  if (i < a2)
  {
    v42 = *(_QWORD *)(i + 16);
    v41 = *(_OWORD *)i;
    v29 = *(_OWORD *)a2;
    *(_BYTE *)(i + 16) = *(_BYTE *)(a2 + 16);
    *(_OWORD *)i = v29;
    *(_BYTE *)(a2 + 16) = v42;
    *(_OWORD *)a2 = v41;
    v30 = *a3;
    while (1)
    {
      i += 24;
      if (v5 == *(unsigned __int8 *)(i + 16))
      {
        v31 = *(_QWORD *)i;
LABEL_62:
        v33 = (double *)(*v30 + 16 * v3);
        v34 = (double *)(*v30 + 16 * v31);
        if (*v33 < *v34 || *v33 == *v34 && v33[1] < v34[1])
        {
          while (1)
          {
LABEL_69:
            a2 -= 24;
            if (v5 == *(unsigned __int8 *)(a2 + 16))
            {
              v35 = *(_QWORD *)a2;
LABEL_75:
              v37 = (double *)(*v30 + 16 * v3);
              v38 = (double *)(*v30 + 16 * v35);
              if (*v37 >= *v38 && (*v37 != *v38 || v37[1] >= v38[1]))
                goto LABEL_78;
            }
            else
            {
              v35 = *(_QWORD *)a2;
              if (v3 != *(_QWORD *)(a2 + 8) || v4 != v35)
                goto LABEL_75;
              if (!v5)
                goto LABEL_78;
            }
          }
        }
      }
      else
      {
        v31 = *(_QWORD *)i;
        if (v3 != *(_QWORD *)(i + 8) || v4 != v31)
          goto LABEL_62;
        if (v5)
          goto LABEL_69;
      }
    }
  }
  if ((uint64_t *)(i - 24) != a1)
  {
    v39 = *(_OWORD *)(i - 24);
    *((_BYTE *)a1 + 16) = *(_BYTE *)(i - 8);
    *(_OWORD *)a1 = v39;
  }
  *(_QWORD *)(i - 24) = v3;
  *(_QWORD *)(i - 16) = v4;
  *(_BYTE *)(i - 8) = v5;
  return i;
}

unint64_t std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo *,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &>(uint64_t *a1, unint64_t a2, _QWORD **a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  _QWORD *v7;
  uint64_t v8;
  double *v10;
  double *v11;
  unint64_t v12;
  uint64_t v13;
  double *v15;
  double *v16;
  uint64_t v17;
  double *v19;
  double *v20;
  BOOL v21;
  unint64_t v22;
  unint64_t v23;
  __int128 v24;
  _QWORD *v25;
  uint64_t v26;
  double *v28;
  double *v29;
  uint64_t v30;
  double *v32;
  double *v33;
  __int128 v34;
  __int128 v36;
  uint64_t v37;

  v3 = 0;
  v4 = *a1;
  v5 = a1[1];
  v6 = *((unsigned __int8 *)a1 + 16);
  v7 = *a3;
  while (1)
  {
    v8 = a1[v3 + 3];
    if (LOBYTE(a1[v3 + 5]) == v6)
      break;
    if (v8 != v5 || a1[v3 + 4] != v4)
      break;
    if (!LOBYTE(a1[v3 + 5]))
      goto LABEL_13;
LABEL_12:
    v3 += 3;
  }
  v10 = (double *)(*v7 + 16 * v8);
  v11 = (double *)(*v7 + 16 * v4);
  if (*v10 < *v11 || *v10 == *v11 && v10[1] < v11[1])
    goto LABEL_12;
LABEL_13:
  v12 = (unint64_t)&a1[v3 + 3];
  if (v3 * 8)
  {
    do
    {
      while (1)
      {
        a2 -= 24;
        v13 = *(_QWORD *)a2;
        if (*(unsigned __int8 *)(a2 + 16) == v6)
          break;
        if (v13 != v5 || *(_QWORD *)(a2 + 8) != v4)
          break;
        if (*(_BYTE *)(a2 + 16))
          goto LABEL_42;
      }
      v15 = (double *)(*v7 + 16 * v13);
      v16 = (double *)(*v7 + 16 * v4);
    }
    while (*v15 >= *v16 && (*v15 != *v16 || v15[1] >= v16[1]));
  }
  else
  {
    while (v12 < a2)
    {
      while (1)
      {
        while (1)
        {
          a2 -= 24;
          v17 = *(_QWORD *)a2;
          if (*(unsigned __int8 *)(a2 + 16) == v6)
            break;
          if (v17 != v5 || *(_QWORD *)(a2 + 8) != v4)
            break;
          if (*(_BYTE *)(a2 + 16))
            v21 = 1;
          else
            v21 = v12 >= a2;
          if (v21)
            goto LABEL_42;
        }
        v19 = (double *)(*v7 + 16 * v17);
        v20 = (double *)(*v7 + 16 * v4);
        if (*v19 < *v20)
          goto LABEL_42;
        if (*v19 != *v20)
          break;
        if (v12 >= a2 || v19[1] < v20[1])
          goto LABEL_42;
      }
    }
  }
LABEL_42:
  v22 = v12;
  if (v12 < a2)
  {
    v23 = a2;
    do
    {
      v37 = *(_QWORD *)(v22 + 16);
      v36 = *(_OWORD *)v22;
      v24 = *(_OWORD *)v23;
      *(_BYTE *)(v22 + 16) = *(_BYTE *)(v23 + 16);
      *(_OWORD *)v22 = v24;
      *(_BYTE *)(v23 + 16) = v37;
      *(_OWORD *)v23 = v36;
      v25 = *a3;
      do
      {
        while (1)
        {
          v22 += 24;
          v26 = *(_QWORD *)v22;
          if (*(unsigned __int8 *)(v22 + 16) != v6 && v26 == v5 && *(_QWORD *)(v22 + 8) == v4)
            break;
          v28 = (double *)(*v25 + 16 * v26);
          v29 = (double *)(*v25 + 16 * v4);
          if (*v28 >= *v29 && (*v28 != *v29 || v28[1] >= v29[1]))
            goto LABEL_57;
        }
      }
      while (*(_BYTE *)(v22 + 16));
      do
      {
LABEL_57:
        while (1)
        {
          v23 -= 24;
          v30 = *(_QWORD *)v23;
          if (*(unsigned __int8 *)(v23 + 16) == v6)
            break;
          if (v30 != v5 || *(_QWORD *)(v23 + 8) != v4)
            break;
          if (*(_BYTE *)(v23 + 16))
            goto LABEL_65;
        }
        v32 = (double *)(*v25 + 16 * v30);
        v33 = (double *)(*v25 + 16 * v4);
      }
      while (*v32 >= *v33 && (*v32 != *v33 || v32[1] >= v33[1]));
LABEL_65:
      ;
    }
    while (v22 < v23);
  }
  if ((uint64_t *)(v22 - 24) != a1)
  {
    v34 = *(_OWORD *)(v22 - 24);
    *((_BYTE *)a1 + 16) = *(_BYTE *)(v22 - 8);
    *(_OWORD *)a1 = v34;
  }
  *(_QWORD *)(v22 - 24) = v4;
  *(_QWORD *)(v22 - 16) = v5;
  *(_BYTE *)(v22 - 8) = v6;
  return v22 - 24;
}

__n128 std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>(uint64_t a1, uint64_t a2, uint64_t **a3)
{
  _OWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __n128 result;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  unint64_t *v19;
  double *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __n128 *v24;
  __n128 *v25;
  unint64_t v26;
  uint64_t v28;
  unint64_t *v29;
  double *v30;
  uint64_t v32;
  unint64_t *v33;
  double *v34;
  uint64_t v35;
  char v36;

  switch(0xAAAAAAAAAAAAAAABLL * ((a2 - a1) >> 3))
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      v6 = (_OWORD *)(a2 - 24);
      v7 = *(_QWORD *)(a2 - 24);
      if (*(unsigned __int8 *)(a2 - 8) == *(unsigned __int8 *)(a1 + 16))
      {
        v8 = *(_QWORD *)a1;
        goto LABEL_45;
      }
      v8 = *(_QWORD *)a1;
      if (v7 != *(_QWORD *)(a1 + 8) || *(_QWORD *)(a2 - 16) != v8)
      {
LABEL_45:
        v32 = **a3;
        v33 = (unint64_t *)(v32 + 16 * v7);
        v34 = (double *)(v32 + 16 * v8);
        result.n128_u64[0] = *v33;
        if (*(double *)v33 < *v34)
          goto LABEL_51;
        if (*(double *)v33 == *v34)
        {
          result.n128_u64[0] = v33[1];
          if (result.n128_f64[0] < v34[1])
            goto LABEL_51;
        }
        return result;
      }
      if (*(_BYTE *)(a2 - 8))
      {
LABEL_51:
        result = *(__n128 *)a1;
        v35 = *(_QWORD *)(a1 + 16);
        v36 = *(_BYTE *)(a2 - 8);
        *(_OWORD *)a1 = *v6;
        *(_BYTE *)(a1 + 16) = v36;
        *(_BYTE *)(a2 - 8) = v35;
        *v6 = result;
        return result;
      }
      return result;
    case 3uLL:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>((uint64_t *)a1, (uint64_t *)(a1 + 24), (uint64_t *)(a2 - 24), a3);
      return result;
    case 4uLL:
      result.n128_u64[0] = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>(a1, a1 + 24, (uint64_t *)(a1 + 48), (uint64_t *)(a2 - 24), a3).n128_u64[0];
      return result;
    case 5uLL:
      result.n128_u64[0] = std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>(a1, a1 + 24, a1 + 48, (uint64_t *)(a1 + 72), (uint64_t *)(a2 - 24), a3).n128_u64[0];
      return result;
    default:
      v9 = a1 + 48;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>((uint64_t *)a1, (uint64_t *)(a1 + 24), (uint64_t *)(a1 + 48), a3);
      v11 = a1 + 72;
      if (a1 + 72 == a2)
        return result;
      v12 = 0;
      v13 = 0;
      while (2)
      {
        v14 = *(unsigned __int8 *)(v11 + 16);
        v15 = *(_QWORD *)v11;
        if (v14 == *(unsigned __int8 *)(v9 + 16))
        {
          v16 = *(_QWORD *)v9;
        }
        else
        {
          v16 = *(_QWORD *)v9;
          if (v15 == *(_QWORD *)(v9 + 8) && *(_QWORD *)(v11 + 8) == v16)
          {
            if (!*(_BYTE *)(v11 + 16))
              goto LABEL_35;
            goto LABEL_17;
          }
        }
        v18 = **a3;
        v19 = (unint64_t *)(v18 + 16 * v15);
        v20 = (double *)(v18 + 16 * v16);
        result.n128_u64[0] = *v19;
        if (*(double *)v19 >= *v20)
        {
          if (*(double *)v19 != *v20)
            goto LABEL_35;
          result.n128_u64[0] = v19[1];
          if (result.n128_f64[0] >= v20[1])
            goto LABEL_35;
        }
LABEL_17:
        v21 = *(_QWORD *)(v11 + 8);
        result = *(__n128 *)v9;
        *(_OWORD *)v11 = *(_OWORD *)v9;
        *(_BYTE *)(v11 + 16) = *(_BYTE *)(v9 + 16);
        v22 = a1;
        if (v9 == a1)
          goto LABEL_34;
        v23 = v12;
        while (2)
        {
          v24 = (__n128 *)(a1 + v23);
          v25 = (__n128 *)(a1 + v23 + 24);
          if (v14 == *(unsigned __int8 *)(a1 + v23 + 40))
          {
            v26 = v25->n128_u64[0];
          }
          else
          {
            v26 = v25->n128_u64[0];
            if (v15 == v24[2].n128_u64[0] && v21 == v26)
            {
              if (!v14)
                break;
              goto LABEL_31;
            }
          }
          v28 = **a3;
          v29 = (unint64_t *)(v28 + 16 * v15);
          v30 = (double *)(v28 + 16 * v26);
          result.n128_u64[0] = *v29;
          if (*(double *)v29 < *v30)
            goto LABEL_31;
          if (*(double *)v29 != *v30)
          {
            v22 = a1 + v23 + 48;
            goto LABEL_34;
          }
          result.n128_u64[0] = v29[1];
          if (result.n128_f64[0] < v30[1])
          {
LABEL_31:
            v9 -= 24;
            result = *v25;
            v24[3] = *v25;
            v24[4].n128_u8[0] = *(_BYTE *)(a1 + v23 + 40);
            v23 -= 24;
            if (v23 == -48)
            {
              v22 = a1;
              goto LABEL_34;
            }
            continue;
          }
          break;
        }
        v22 = v9;
LABEL_34:
        *(_QWORD *)v22 = v15;
        *(_QWORD *)(v22 + 8) = v21;
        *(_BYTE *)(v22 + 16) = v14;
        if (++v13 != 8)
        {
LABEL_35:
          v9 = v11;
          v12 += 24;
          v11 += 24;
          if (v11 == a2)
            return result;
          continue;
        }
        return result;
      }
  }
}

__n128 std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t *a4, uint64_t **a5)
{
  __n128 result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  unint64_t *v15;
  double *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t *v22;
  double *v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t *v29;
  double *v30;
  uint64_t v31;
  char v32;

  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>((uint64_t *)a1, (uint64_t *)a2, a3, a5);
  v11 = *a4;
  if (*((unsigned __int8 *)a4 + 16) == *((unsigned __int8 *)a3 + 16))
  {
    v12 = *a3;
  }
  else
  {
    v12 = *a3;
    if (v11 == a3[1] && a4[1] == v12)
    {
      if (!*((_BYTE *)a4 + 16))
        return result;
LABEL_12:
      result = *(__n128 *)a3;
      v17 = a3[2];
      v18 = *((_BYTE *)a4 + 16);
      *(_OWORD *)a3 = *(_OWORD *)a4;
      *((_BYTE *)a3 + 16) = v18;
      *((_BYTE *)a4 + 16) = v17;
      *(__n128 *)a4 = result;
      v19 = *a3;
      if (*((unsigned __int8 *)a3 + 16) == *(unsigned __int8 *)(a2 + 16))
      {
        v20 = *(_QWORD *)a2;
      }
      else
      {
        v20 = *(_QWORD *)a2;
        if (v19 == *(_QWORD *)(a2 + 8) && a3[1] == v20)
        {
          if (!*((_BYTE *)a3 + 16))
            return result;
          goto LABEL_21;
        }
      }
      v21 = **a5;
      v22 = (unint64_t *)(v21 + 16 * v19);
      v23 = (double *)(v21 + 16 * v20);
      result.n128_u64[0] = *v22;
      if (*(double *)v22 >= *v23)
      {
        if (*(double *)v22 != *v23)
          return result;
        result.n128_u64[0] = v22[1];
        if (result.n128_f64[0] >= v23[1])
          return result;
      }
LABEL_21:
      result = *(__n128 *)a2;
      v24 = *(_QWORD *)(a2 + 16);
      v25 = *((_BYTE *)a3 + 16);
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *(_BYTE *)(a2 + 16) = v25;
      *((_BYTE *)a3 + 16) = v24;
      *(__n128 *)a3 = result;
      v26 = *(_QWORD *)a2;
      if (*(unsigned __int8 *)(a2 + 16) == *(unsigned __int8 *)(a1 + 16))
      {
        v27 = *(_QWORD *)a1;
      }
      else
      {
        v27 = *(_QWORD *)a1;
        if (v26 == *(_QWORD *)(a1 + 8) && *(_QWORD *)(a2 + 8) == v27)
        {
          if (!*(_BYTE *)(a2 + 16))
            return result;
          goto LABEL_30;
        }
      }
      v28 = **a5;
      v29 = (unint64_t *)(v28 + 16 * v26);
      v30 = (double *)(v28 + 16 * v27);
      result.n128_u64[0] = *v29;
      if (*(double *)v29 >= *v30)
      {
        if (*(double *)v29 != *v30)
          return result;
        result.n128_u64[0] = v29[1];
        if (result.n128_f64[0] >= v30[1])
          return result;
      }
LABEL_30:
      result = *(__n128 *)a1;
      v31 = *(_QWORD *)(a1 + 16);
      v32 = *(_BYTE *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_BYTE *)(a1 + 16) = v32;
      *(_BYTE *)(a2 + 16) = v31;
      *(__n128 *)a2 = result;
      return result;
    }
  }
  v14 = **a5;
  v15 = (unint64_t *)(v14 + 16 * v11);
  v16 = (double *)(v14 + 16 * v12);
  result.n128_u64[0] = *v15;
  if (*(double *)v15 < *v16)
    goto LABEL_12;
  if (*(double *)v15 == *v16)
  {
    result.n128_u64[0] = v15[1];
    if (result.n128_f64[0] < v16[1])
      goto LABEL_12;
  }
  return result;
}

__n128 std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t *a5, uint64_t **a6)
{
  __n128 result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  unint64_t *v17;
  double *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t *v24;
  double *v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t *v31;
  double *v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t *v38;
  double *v39;
  uint64_t v40;
  char v41;

  result.n128_u64[0] = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>(a1, a2, (uint64_t *)a3, a4, a6).n128_u64[0];
  v13 = *a5;
  if (*((unsigned __int8 *)a5 + 16) == *((unsigned __int8 *)a4 + 16))
  {
    v14 = *a4;
  }
  else
  {
    v14 = *a4;
    if (v13 == a4[1] && a5[1] == v14)
    {
      if (!*((_BYTE *)a5 + 16))
        return result;
LABEL_12:
      result = *(__n128 *)a4;
      v19 = a4[2];
      v20 = *((_BYTE *)a5 + 16);
      *(_OWORD *)a4 = *(_OWORD *)a5;
      *((_BYTE *)a4 + 16) = v20;
      *((_BYTE *)a5 + 16) = v19;
      *(__n128 *)a5 = result;
      v21 = *a4;
      if (*((unsigned __int8 *)a4 + 16) == *(unsigned __int8 *)(a3 + 16))
      {
        v22 = *(_QWORD *)a3;
      }
      else
      {
        v22 = *(_QWORD *)a3;
        if (v21 == *(_QWORD *)(a3 + 8) && a4[1] == v22)
        {
          if (!*((_BYTE *)a4 + 16))
            return result;
          goto LABEL_21;
        }
      }
      v23 = **a6;
      v24 = (unint64_t *)(v23 + 16 * v21);
      v25 = (double *)(v23 + 16 * v22);
      result.n128_u64[0] = *v24;
      if (*(double *)v24 >= *v25)
      {
        if (*(double *)v24 != *v25)
          return result;
        result.n128_u64[0] = v24[1];
        if (result.n128_f64[0] >= v25[1])
          return result;
      }
LABEL_21:
      result = *(__n128 *)a3;
      v26 = *(_QWORD *)(a3 + 16);
      v27 = *((_BYTE *)a4 + 16);
      *(_OWORD *)a3 = *(_OWORD *)a4;
      *(_BYTE *)(a3 + 16) = v27;
      *((_BYTE *)a4 + 16) = v26;
      *(__n128 *)a4 = result;
      v28 = *(_QWORD *)a3;
      if (*(unsigned __int8 *)(a3 + 16) == *(unsigned __int8 *)(a2 + 16))
      {
        v29 = *(_QWORD *)a2;
      }
      else
      {
        v29 = *(_QWORD *)a2;
        if (v28 == *(_QWORD *)(a2 + 8) && *(_QWORD *)(a3 + 8) == v29)
        {
          if (!*(_BYTE *)(a3 + 16))
            return result;
          goto LABEL_30;
        }
      }
      v30 = **a6;
      v31 = (unint64_t *)(v30 + 16 * v28);
      v32 = (double *)(v30 + 16 * v29);
      result.n128_u64[0] = *v31;
      if (*(double *)v31 >= *v32)
      {
        if (*(double *)v31 != *v32)
          return result;
        result.n128_u64[0] = v31[1];
        if (result.n128_f64[0] >= v32[1])
          return result;
      }
LABEL_30:
      result = *(__n128 *)a2;
      v33 = *(_QWORD *)(a2 + 16);
      v34 = *(_BYTE *)(a3 + 16);
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *(_BYTE *)(a2 + 16) = v34;
      *(_BYTE *)(a3 + 16) = v33;
      *(__n128 *)a3 = result;
      v35 = *(_QWORD *)a2;
      if (*(unsigned __int8 *)(a2 + 16) == *(unsigned __int8 *)(a1 + 16))
      {
        v36 = *(_QWORD *)a1;
      }
      else
      {
        v36 = *(_QWORD *)a1;
        if (v35 == *(_QWORD *)(a1 + 8) && *(_QWORD *)(a2 + 8) == v36)
        {
          if (!*(_BYTE *)(a2 + 16))
            return result;
          goto LABEL_39;
        }
      }
      v37 = **a6;
      v38 = (unint64_t *)(v37 + 16 * v35);
      v39 = (double *)(v37 + 16 * v36);
      result.n128_u64[0] = *v38;
      if (*(double *)v38 >= *v39)
      {
        if (*(double *)v38 != *v39)
          return result;
        result.n128_u64[0] = v38[1];
        if (result.n128_f64[0] >= v39[1])
          return result;
      }
LABEL_39:
      result = *(__n128 *)a1;
      v40 = *(_QWORD *)(a1 + 16);
      v41 = *(_BYTE *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_BYTE *)(a1 + 16) = v41;
      *(_BYTE *)(a2 + 16) = v40;
      *(__n128 *)a2 = result;
      return result;
    }
  }
  v16 = **a6;
  v17 = (unint64_t *)(v16 + 16 * v13);
  v18 = (double *)(v16 + 16 * v14);
  result.n128_u64[0] = *v17;
  if (*(double *)v17 < *v18)
    goto LABEL_12;
  if (*(double *)v17 == *v18)
  {
    result.n128_u64[0] = v17[1];
    if (result.n128_f64[0] < v18[1])
      goto LABEL_12;
  }
  return result;
}

__n128 *std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>(__n128 *a1, __n128 *a2, __n128 *a3, uint64_t **a4)
{
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t *v12;
  __n128 *v13;
  __n128 *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v18;
  double *v19;
  double *v20;
  __n128 v21;
  uint64_t v22;
  unsigned __int8 v23;
  int64_t v24;
  __n128 *v25;
  __n128 *v26;
  __n128 v27;
  __n128 v30;
  unint64_t v31;

  if (a1 != a2)
  {
    v8 = (char *)a2 - (char *)a1;
    v9 = ((char *)a2 - (char *)a1) / 24;
    if ((char *)a2 - (char *)a1 >= 25)
    {
      v10 = (unint64_t)(v9 - 2) >> 1;
      v11 = v10 + 1;
      v12 = (uint64_t *)a1 + 3 * v10;
      do
      {
        std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>((uint64_t)a1, a4, v9, v12);
        v12 -= 3;
        --v11;
      }
      while (v11);
    }
    v13 = a2;
    if (a2 != a3)
    {
      v14 = a2;
      while (1)
      {
        v15 = v14->n128_u64[0];
        if (v14[1].n128_u8[0] == a1[1].n128_u8[0])
          break;
        v16 = a1->n128_u64[0];
        if (v15 != a1->n128_u64[1] || v14->n128_u64[1] != v16)
          goto LABEL_13;
        if (v14[1].n128_u8[0])
          goto LABEL_18;
LABEL_19:
        v14 = (__n128 *)((char *)v14 + 24);
        if (v14 == a3)
        {
          v13 = a3;
          goto LABEL_21;
        }
      }
      v16 = a1->n128_u64[0];
LABEL_13:
      v18 = **a4;
      v19 = (double *)(v18 + 16 * v15);
      v20 = (double *)(v18 + 16 * v16);
      if (*v19 >= *v20 && (*v19 != *v20 || v19[1] >= v20[1]))
        goto LABEL_19;
LABEL_18:
      v21 = *v14;
      v22 = v14[1].n128_i64[0];
      v23 = a1[1].n128_u8[0];
      *v14 = *a1;
      v14[1].n128_u8[0] = v23;
      a1[1].n128_u8[0] = v22;
      *a1 = v21;
      std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>((uint64_t)a1, a4, v9, (uint64_t *)a1);
      goto LABEL_19;
    }
LABEL_21:
    if (v8 >= 25)
    {
      v24 = v8 / 0x18uLL;
      v25 = (__n128 *)((char *)a2 - 24);
      do
      {
        v30 = *a1;
        v31 = a1[1].n128_u64[0];
        std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>(a1, a4, v24);
        if (v25 == v26)
        {
          *v26 = v30;
          v26[1].n128_u8[0] = v31;
        }
        else
        {
          v27 = *v25;
          v26[1].n128_u8[0] = v25[1].n128_u8[0];
          *v26 = v27;
          *v25 = v30;
          v25[1].n128_u8[0] = v31;
          std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>((uint64_t)a1, (uint64_t)&v26[1].n128_i64[1], a4, 0xAAAAAAAAAAAAAAABLL * ((&v26[1].n128_i8[8] - (__int8 *)a1) >> 3));
        }
        v25 = (__n128 *)((char *)v25 - 24);
      }
      while (v24-- > 2);
    }
    return v13;
  }
  return a3;
}

uint64_t std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>(uint64_t result, uint64_t **a2, uint64_t a3, uint64_t *a4)
{
  int64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  double *v11;
  double *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  double *v18;
  double *v19;
  uint64_t v20;
  __int128 v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  double *v29;
  double *v30;
  uint64_t v31;
  uint64_t v33;
  double *v34;
  double *v35;
  __int128 v36;

  if (a3 < 2)
    return result;
  v4 = (unint64_t)(a3 - 2) >> 1;
  if (v4 < (uint64_t)(0xAAAAAAAAAAAAAAABLL * (((uint64_t)a4 - result) >> 3)))
    return result;
  v5 = (0x5555555555555556 * (((uint64_t)a4 - result) >> 3)) | 1;
  v6 = (uint64_t *)(result + 24 * v5);
  if (0x5555555555555556 * (((uint64_t)a4 - result) >> 3) + 2 < a3)
  {
    v7 = *v6;
    if (*(unsigned __int8 *)(result + 24 * v5 + 16) == *((unsigned __int8 *)v6 + 40))
    {
      v8 = v6[3];
    }
    else
    {
      v8 = v6[3];
      if (v7 == v6[4] && *(_QWORD *)(result + 24 * v5 + 8) == v8)
      {
        if (!*(_BYTE *)(result + 24 * v5 + 16))
          goto LABEL_16;
        goto LABEL_15;
      }
    }
    v10 = **a2;
    v11 = (double *)(v10 + 16 * v7);
    v12 = (double *)(v10 + 16 * v8);
    if (*v11 >= *v12 && (*v11 != *v12 || v11[1] >= v12[1]))
      goto LABEL_16;
LABEL_15:
    v6 += 3;
    v5 = 0x5555555555555556 * (((uint64_t)a4 - result) >> 3) + 2;
  }
LABEL_16:
  v13 = *((unsigned __int8 *)a4 + 16);
  v14 = *v6;
  if (*((unsigned __int8 *)v6 + 16) == v13)
  {
    v15 = *a4;
    goto LABEL_22;
  }
  v15 = *a4;
  if (v14 != a4[1] || v6[1] != v15)
  {
LABEL_22:
    v17 = **a2;
    v18 = (double *)(v17 + 16 * v14);
    v19 = (double *)(v17 + 16 * v15);
    if (*v18 < *v19 || *v18 == *v19 && v18[1] < v19[1])
      return result;
    goto LABEL_27;
  }
  if (*((_BYTE *)v6 + 16))
    return result;
LABEL_27:
  v20 = a4[1];
  v21 = *(_OWORD *)v6;
  *((_BYTE *)a4 + 16) = *((_BYTE *)v6 + 16);
  *(_OWORD *)a4 = v21;
  if (v4 < v5)
    goto LABEL_54;
  while (1)
  {
    v22 = v6;
    v23 = 2 * v5;
    v5 = (2 * v5) | 1;
    v6 = (uint64_t *)(result + 24 * v5);
    v24 = v23 + 2;
    if (v24 < a3)
    {
      v25 = *v6;
      if (*(unsigned __int8 *)(result + 24 * v5 + 16) == *((unsigned __int8 *)v6 + 40))
      {
        v26 = v6[3];
LABEL_35:
        v28 = **a2;
        v29 = (double *)(v28 + 16 * v25);
        v30 = (double *)(v28 + 16 * v26);
        if (*v29 >= *v30 && (*v29 != *v30 || v29[1] >= v30[1]))
          goto LABEL_41;
LABEL_40:
        v6 += 3;
        v5 = v24;
        goto LABEL_41;
      }
      v26 = v6[3];
      if (v25 != v6[4] || *(_QWORD *)(result + 24 * v5 + 8) != v26)
        goto LABEL_35;
      if (*(_BYTE *)(result + 24 * v5 + 16))
        goto LABEL_40;
    }
LABEL_41:
    v31 = *v6;
    if (*((unsigned __int8 *)v6 + 16) == v13)
      break;
    if (v31 != v20 || v6[1] != v15)
      break;
    if (*((_BYTE *)v6 + 16))
      goto LABEL_53;
LABEL_51:
    v36 = *(_OWORD *)v6;
    *((_BYTE *)v22 + 16) = *((_BYTE *)v6 + 16);
    *(_OWORD *)v22 = v36;
    if (v4 < v5)
      goto LABEL_54;
  }
  v33 = **a2;
  v34 = (double *)(v33 + 16 * v31);
  v35 = (double *)(v33 + 16 * v15);
  if (*v34 >= *v35 && (*v34 != *v35 || v34[1] >= v35[1]))
    goto LABEL_51;
LABEL_53:
  v6 = v22;
LABEL_54:
  *v6 = v15;
  v6[1] = v20;
  *((_BYTE *)v6 + 16) = v13;
  return result;
}

__n128 std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>(__n128 *a1, uint64_t **a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __n128 *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v15;
  double *v16;
  double *v17;
  __n128 result;

  v3 = 0;
  v4 = a3 - 2;
  if (a3 < 2)
    v4 = a3 - 1;
  v5 = v4 >> 1;
  do
  {
    v6 = a1;
    v7 = v3 + 1;
    a1 = (__n128 *)((char *)a1 + 24 * v3 + 24);
    v8 = 2 * v3;
    v3 = (2 * v3) | 1;
    v9 = v8 + 2;
    if (v9 >= a3)
      goto LABEL_17;
    v10 = v6[1].n128_u8[24 * v7];
    v11 = a1->n128_u64[0];
    if (v10 == a1[2].n128_u8[8])
    {
      v12 = a1[1].n128_u64[1];
    }
    else
    {
      v12 = a1[1].n128_u64[1];
      v13 = v6->n128_u64[3 * v7 + 1];
      if (v11 == a1[2].n128_u64[0] && v13 == v12)
      {
        if (!v10)
          goto LABEL_17;
LABEL_16:
        a1 = (__n128 *)((char *)a1 + 24);
        v3 = v9;
        goto LABEL_17;
      }
    }
    v15 = **a2;
    v16 = (double *)(v15 + 16 * v11);
    v17 = (double *)(v15 + 16 * v12);
    if (*v16 < *v17 || *v16 == *v17 && v16[1] < v17[1])
      goto LABEL_16;
LABEL_17:
    result = *a1;
    v6[1].n128_u8[0] = a1[1].n128_u8[0];
    *v6 = result;
  }
  while (v3 <= v5);
  return result;
}

uint64_t std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>(uint64_t result, uint64_t a2, uint64_t **a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t *v6;
  uint64_t *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  double *v13;
  double *v14;
  uint64_t v15;
  __int128 v16;
  uint64_t *v17;
  unint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  double *v22;
  double *v23;
  __int128 v24;

  v4 = a4 - 2;
  if (a4 < 2)
    return result;
  v5 = v4 >> 1;
  v6 = (uint64_t *)(result + 24 * (v4 >> 1));
  v7 = (uint64_t *)(a2 - 24);
  v8 = *(unsigned __int8 *)(a2 - 8);
  v9 = *v6;
  if (*((unsigned __int8 *)v6 + 16) == v8)
  {
    v10 = *v7;
    goto LABEL_8;
  }
  v10 = *(_QWORD *)(a2 - 24);
  if (v9 != *(_QWORD *)(a2 - 16) || *(_QWORD *)(result + 24 * v5 + 8) != v10)
  {
LABEL_8:
    v12 = **a3;
    v13 = (double *)(v12 + 16 * v9);
    v14 = (double *)(v12 + 16 * v10);
    if (*v13 >= *v14 && (*v13 != *v14 || v13[1] >= v14[1]))
      return result;
    goto LABEL_13;
  }
  if (!*((_BYTE *)v6 + 16))
    return result;
LABEL_13:
  v15 = *(_QWORD *)(a2 - 16);
  v16 = *(_OWORD *)v6;
  *(_BYTE *)(a2 - 8) = *((_BYTE *)v6 + 16);
  *(_OWORD *)v7 = v16;
  if (v4 >= 2)
  {
    while (1)
    {
      v18 = v5 - 1;
      v5 = (v5 - 1) >> 1;
      v17 = (uint64_t *)(result + 24 * v5);
      v19 = *v17;
      if (*((unsigned __int8 *)v17 + 16) != v8
        && (v19 == v15 ? (v20 = *(_QWORD *)(result + 24 * v5 + 8) == v10) : (v20 = 0), v20))
      {
        if (!*((_BYTE *)v17 + 16))
          break;
      }
      else
      {
        v21 = **a3;
        v22 = (double *)(v21 + 16 * v19);
        v23 = (double *)(v21 + 16 * v10);
        if (*v22 >= *v23 && (*v22 != *v23 || v22[1] >= v23[1]))
          break;
      }
      v24 = *(_OWORD *)v17;
      *((_BYTE *)v6 + 16) = *((_BYTE *)v17 + 16);
      *(_OWORD *)v6 = v24;
      v6 = (uint64_t *)(result + 24 * v5);
      if (v18 <= 1)
        goto LABEL_26;
    }
  }
  v17 = v6;
LABEL_26:
  *v17 = v10;
  v17[1] = v15;
  *((_BYTE *)v17 + 16) = v8;
  return result;
}

uint64_t *std::__tree<gm::LineSegment<double,2>,geo::Intersect::SHSegmentComparator<double>,std::allocator<gm::LineSegment<double,2>>>::__emplace_unique_key_args<gm::LineSegment<double,2>,gm::LineSegment<double,2> const&>(uint64_t **a1, double *a2, _OWORD *a3)
{
  void **v5;
  uint64_t *v6;
  uint64_t **v7;
  __int128 v8;
  uint64_t v10;

  v5 = (void **)std::__tree<gm::LineSegment<double,2>,geo::Intersect::SHSegmentComparator<double>,std::allocator<gm::LineSegment<double,2>>>::__find_equal<gm::LineSegment<double,2>>((uint64_t)a1, &v10, a2);
  v6 = (uint64_t *)*v5;
  if (!*v5)
  {
    v7 = (uint64_t **)v5;
    v6 = (uint64_t *)operator new(0x40uLL);
    v8 = a3[1];
    *((_OWORD *)v6 + 2) = *a3;
    *((_OWORD *)v6 + 3) = v8;
    std::__tree<gm::LineSegment<double,2>,geo::Intersect::SHSegmentComparator<double>,std::allocator<gm::LineSegment<double,2>>>::__insert_node_at(a1, v10, v7, v6);
  }
  return v6;
}

_QWORD *std::__tree<gm::LineSegment<double,2>,geo::Intersect::SHSegmentComparator<double>,std::allocator<gm::LineSegment<double,2>>>::__find_equal<gm::LineSegment<double,2>>(uint64_t a1, _QWORD *a2, double *a3)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v7;
  _QWORD *v8;
  double *v9;

  v5 = (_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 8);
  if (v4)
  {
    v7 = a1 + 16;
    do
    {
      while (1)
      {
        v8 = (_QWORD *)v4;
        v9 = (double *)(v4 + 32);
        if (!geo::Intersect::SHSegmentComparator<double>::operator()(v7, a3, (double *)(v4 + 32)))
          break;
        v4 = *v8;
        v5 = v8;
        if (!*v8)
          goto LABEL_10;
      }
      if (!geo::Intersect::SHSegmentComparator<double>::operator()(v7, v9, a3))
        break;
      v5 = v8 + 1;
      v4 = v8[1];
    }
    while (v4);
  }
  else
  {
    v8 = (_QWORD *)(a1 + 8);
  }
LABEL_10:
  *a2 = v8;
  return v5;
}

uint64_t *std::__tree<gm::LineSegment<double,2>,geo::Intersect::SHSegmentComparator<double>,std::allocator<gm::LineSegment<double,2>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  uint64_t *v5;
  uint64_t *result;

  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

BOOL geo::Intersect::SHSegmentComparator<double>::operator()(uint64_t a1, double *a2, double *a3)
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  BOOL v19;

  if (gm::LineSegment<double,2>::operator==((uint64_t)a2, (uint64_t)a3))
    return 0;
  v6 = *a2;
  v7 = *a3;
  if (*a2 > *a3)
  {
    v8 = a3[1];
    v9 = v7 + a3[2] - v7;
    v10 = v8 + a3[3] - v8;
    v11 = a2[1];
    v12 = v9 * (v11 - v8) - (v6 - v7) * v10;
    v13 = v12 < 0.0;
    if (v12 == 0.0)
      return v9 * (v11 + a2[3] - v8) - (v6 + a2[2] - v7) * v10 <= 0.0;
    return v13;
  }
  v14 = a2[1];
  v15 = v6 + a2[2];
  v16 = v14 + a2[3] - v14;
  v17 = a3[1];
  v18 = (v15 - v6) * (v17 - v14) - (v7 - v6) * v16;
  v19 = v18 <= 0.0;
  if (v18 == 0.0)
  {
    if (v6 == v15)
      return v14 < v17;
    v19 = (v15 - v6) * (v17 + a3[3] - v14) - (v7 + a3[2] - v6) * v16 <= 0.0;
  }
  return !v19;
}

BOOL gm::LineSegment<double,2>::operator==(uint64_t a1, uint64_t a2)
{
  float64x2_t v4;
  float64x2_t v5;

  if (*(_QWORD *)a1 != *(_QWORD *)a2 || *(_QWORD *)(a1 + 8) != *(_QWORD *)(a2 + 8))
    return 0;
  v4 = vaddq_f64(*(float64x2_t *)a1, *(float64x2_t *)(a1 + 16));
  v5 = vaddq_f64(*(float64x2_t *)a2, *(float64x2_t *)(a2 + 16));
  return *(_QWORD *)&v4.f64[0] == *(_QWORD *)&v5.f64[0] && *(_QWORD *)&v4.f64[1] == *(_QWORD *)&v5.f64[1];
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  _BYTE *v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t **v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      v2 = (uint64_t *)a2[2];
      if (*((_BYTE *)v2 + 24))
        return result;
      v3 = (uint64_t *)v2[2];
      v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), v5 = (_BYTE *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            v9 = (uint64_t **)a2[2];
          }
          else
          {
            v9 = (uint64_t **)v2[1];
            v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = v9;
            *v9 = v2;
            v2[2] = (uint64_t)v9;
            v3 = v9[2];
            v2 = (uint64_t *)*v3;
          }
          *((_BYTE *)v9 + 24) = 1;
          *((_BYTE *)v3 + 24) = 0;
          v13 = v2[1];
          *v3 = v13;
          if (v13)
            *(_QWORD *)(v13 + 16) = v3;
          v2[2] = v3[2];
          *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          v11 = a2[1];
          *v2 = v11;
          if (v11)
          {
            *(_QWORD *)(v11 + 16) = v2;
            v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((_BYTE *)a2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        v2 = (uint64_t *)v3[1];
        v12 = *v2;
        v3[1] = *v2;
        if (v12)
          *(_QWORD *)(v12 + 16) = v3;
        v2[2] = v3[2];
        *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
        *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((_BYTE *)v2 + 24) = 1;
      a2 = v3;
      *((_BYTE *)v3 + 24) = v3 == result;
      *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

BOOL gm::LineSegment<double,2>::intersect<double,void>(double *a1, double *a2, double *a3, double *a4, double *a5)
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v5 = a1[2];
  v6 = a1[3];
  v7 = a2[2];
  v8 = a2[3];
  v9 = v5 * v8 - v6 * v7;
  if (v9 != 0.0)
  {
    v10 = v5 + *a1 - *a2;
    v11 = -v6;
    v12 = v6 + a1[1] - a2[1];
    *a3 = 1.0 / v9 * (v10 * v8 - v12 * v7);
    *a4 = 1.0 / v9 * (v5 * v12 + v10 * v11);
    if (a5)
    {
      v13 = a1[1] + a1[3] + v11 * *a3;
      *a5 = *a1 + a1[2] + -v5 * *a3;
      a5[1] = v13;
    }
  }
  return v9 != 0.0;
}

uint64_t std::__tree<gm::LineSegment<double,2>,geo::Intersect::SHSegmentComparator<double>,std::allocator<gm::LineSegment<double,2>>>::find<gm::LineSegment<double,2>>(uint64_t a1, double *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  _BOOL4 v7;
  uint64_t *v8;

  v2 = a1 + 8;
  v3 = *(_QWORD *)(a1 + 8);
  if (!v3)
    return v2;
  v5 = a1 + 16;
  v6 = a1 + 8;
  do
  {
    v7 = geo::Intersect::SHSegmentComparator<double>::operator()(v5, (double *)(v3 + 32), a2);
    v8 = (uint64_t *)(v3 + 8);
    if (!v7)
    {
      v8 = (uint64_t *)v3;
      v6 = v3;
    }
    v3 = *v8;
  }
  while (*v8);
  if (v6 == v2 || geo::Intersect::SHSegmentComparator<double>::operator()(v5, a2, (double *)(v6 + 32)))
    return v2;
  return v6;
}

uint64_t *std::__tree<gm::LineSegment<double,2>,geo::Intersect::SHSegmentComparator<double>,std::allocator<gm::LineSegment<double,2>>>::__remove_node_pointer(uint64_t **a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  BOOL v5;
  uint64_t *v6;

  v2 = (uint64_t *)a2[1];
  if (v2)
  {
    do
    {
      v3 = v2;
      v2 = (uint64_t *)*v2;
    }
    while (v2);
  }
  else
  {
    v4 = a2;
    do
    {
      v3 = (uint64_t *)v4[2];
      v5 = *v3 == (_QWORD)v4;
      v4 = v3;
    }
    while (!v5);
  }
  if (*a1 == a2)
    *a1 = v3;
  v6 = a1[1];
  a1[2] = (uint64_t *)((char *)a1[2] - 1);
  std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v6, a2);
  return v3;
}

uint64_t *std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t *v4;
  int v5;
  uint64_t **v6;
  uint64_t *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t *v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v2 = *a2;
  v3 = a2;
  if (*a2)
  {
    v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      v3 = a2;
      goto LABEL_7;
    }
    do
    {
      v3 = v4;
      v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  v2 = v3[1];
  if (v2)
  {
LABEL_7:
    v5 = 0;
    *(_QWORD *)(v2 + 16) = v3[2];
    goto LABEL_8;
  }
  v5 = 1;
LABEL_8:
  v6 = (uint64_t **)v3[2];
  v7 = *v6;
  if (*v6 == v3)
  {
    *v6 = (uint64_t *)v2;
    if (v3 == result)
    {
      v7 = 0;
      result = (uint64_t *)v2;
    }
    else
    {
      v7 = v6[1];
    }
  }
  else
  {
    v6[1] = (uint64_t *)v2;
  }
  v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2)
  {
    v9 = a2[2];
    v3[2] = v9;
    *(_QWORD *)(v9 + 8 * (*(_QWORD *)a2[2] != (_QWORD)a2)) = v3;
    v11 = *a2;
    v10 = a2[1];
    *(_QWORD *)(v11 + 16) = v3;
    *v3 = v11;
    v3[1] = v10;
    if (v10)
      *(_QWORD *)(v10 + 16) = v3;
    *((_BYTE *)v3 + 24) = *((_BYTE *)a2 + 24);
    if (result == a2)
      result = v3;
  }
  if (!v8 || !result)
    return result;
  if (!v5)
  {
    *(_BYTE *)(v2 + 24) = 1;
    return result;
  }
  while (1)
  {
    v12 = v7[2];
    if (*(uint64_t **)v12 != v7)
      break;
    if (!*((_BYTE *)v7 + 24))
    {
      *((_BYTE *)v7 + 24) = 1;
      *(_BYTE *)(v12 + 24) = 0;
      v18 = v7[1];
      *(_QWORD *)v12 = v18;
      if (v18)
        *(_QWORD *)(v18 + 16) = v12;
      v7[2] = *(_QWORD *)(v12 + 16);
      *(_QWORD *)(*(_QWORD *)(v12 + 16) + 8 * (**(_QWORD **)(v12 + 16) != v12)) = v7;
      v7[1] = v12;
      *(_QWORD *)(v12 + 16) = v7;
      if (result == (uint64_t *)v12)
        result = v7;
      v7 = *(uint64_t **)v12;
    }
    v19 = (_QWORD *)*v7;
    if (*v7 && !*((_BYTE *)v19 + 24))
      goto LABEL_68;
    v20 = (uint64_t *)v7[1];
    if (v20 && !*((_BYTE *)v20 + 24))
    {
      if (v19 && !*((_BYTE *)v19 + 24))
      {
LABEL_68:
        v20 = v7;
      }
      else
      {
        *((_BYTE *)v20 + 24) = 1;
        *((_BYTE *)v7 + 24) = 0;
        v26 = *v20;
        v7[1] = *v20;
        if (v26)
          *(_QWORD *)(v26 + 16) = v7;
        v20[2] = v7[2];
        *(_QWORD *)(v7[2] + 8 * (*(_QWORD *)v7[2] != (_QWORD)v7)) = v20;
        *v20 = (uint64_t)v7;
        v7[2] = (uint64_t)v20;
        v19 = v7;
      }
      v23 = v20[2];
      *((_BYTE *)v20 + 24) = *(_BYTE *)(v23 + 24);
      *(_BYTE *)(v23 + 24) = 1;
      *((_BYTE *)v19 + 24) = 1;
      v24 = *(uint64_t **)v23;
      v27 = *(_QWORD *)(*(_QWORD *)v23 + 8);
      *(_QWORD *)v23 = v27;
      if (v27)
        *(_QWORD *)(v27 + 16) = v23;
      v24[2] = *(_QWORD *)(v23 + 16);
      *(_QWORD *)(*(_QWORD *)(v23 + 16) + 8 * (**(_QWORD **)(v23 + 16) != v23)) = v24;
      v24[1] = v23;
      goto LABEL_72;
    }
    *((_BYTE *)v7 + 24) = 0;
    v17 = (uint64_t *)v7[2];
    if (*((_BYTE *)v17 + 24))
      v21 = v17 == result;
    else
      v21 = 1;
    if (v21)
      goto LABEL_53;
LABEL_49:
    v7 = *(uint64_t **)(v17[2] + 8 * (*(_QWORD *)v17[2] == (_QWORD)v17));
  }
  if (!*((_BYTE *)v7 + 24))
  {
    *((_BYTE *)v7 + 24) = 1;
    *(_BYTE *)(v12 + 24) = 0;
    v13 = *(uint64_t **)(v12 + 8);
    v14 = *v13;
    *(_QWORD *)(v12 + 8) = *v13;
    if (v14)
      *(_QWORD *)(v14 + 16) = v12;
    v13[2] = *(_QWORD *)(v12 + 16);
    *(_QWORD *)(*(_QWORD *)(v12 + 16) + 8 * (**(_QWORD **)(v12 + 16) != v12)) = v13;
    *v13 = v12;
    *(_QWORD *)(v12 + 16) = v13;
    if (result == (uint64_t *)*v7)
      result = v7;
    v7 = *(uint64_t **)(*v7 + 8);
  }
  v15 = (_QWORD *)*v7;
  if (!*v7 || *((_BYTE *)v15 + 24))
  {
    v16 = (uint64_t *)v7[1];
    if (v16 && !*((_BYTE *)v16 + 24))
      goto LABEL_59;
    *((_BYTE *)v7 + 24) = 0;
    v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      v17 = result;
LABEL_53:
      *((_BYTE *)v17 + 24) = 1;
      return result;
    }
    if (!*((_BYTE *)v17 + 24))
      goto LABEL_53;
    goto LABEL_49;
  }
  v16 = (uint64_t *)v7[1];
  if (v16 && !*((_BYTE *)v16 + 24))
  {
LABEL_59:
    v15 = v7;
  }
  else
  {
    *((_BYTE *)v15 + 24) = 1;
    *((_BYTE *)v7 + 24) = 0;
    v22 = v15[1];
    *v7 = v22;
    if (v22)
      *(_QWORD *)(v22 + 16) = v7;
    v15[2] = v7[2];
    *(_QWORD *)(v7[2] + 8 * (*(_QWORD *)v7[2] != (_QWORD)v7)) = v15;
    v15[1] = v7;
    v7[2] = (uint64_t)v15;
    v16 = v7;
  }
  v23 = v15[2];
  *((_BYTE *)v15 + 24) = *(_BYTE *)(v23 + 24);
  *(_BYTE *)(v23 + 24) = 1;
  *((_BYTE *)v16 + 24) = 1;
  v24 = *(uint64_t **)(v23 + 8);
  v25 = *v24;
  *(_QWORD *)(v23 + 8) = *v24;
  if (v25)
    *(_QWORD *)(v25 + 16) = v23;
  v24[2] = *(_QWORD *)(v23 + 16);
  *(_QWORD *)(*(_QWORD *)(v23 + 16) + 8 * (**(_QWORD **)(v23 + 16) != v23)) = v24;
  *v24 = v23;
LABEL_72:
  *(_QWORD *)(v23 + 16) = v24;
  return result;
}

void std::__tree<gm::LineSegment<double,2>,geo::Intersect::SHSegmentComparator<double>,std::allocator<gm::LineSegment<double,2>>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<gm::LineSegment<double,2>,geo::Intersect::SHSegmentComparator<double>,std::allocator<gm::LineSegment<double,2>>>::destroy(a1, *a2);
    std::__tree<gm::LineSegment<double,2>,geo::Intersect::SHSegmentComparator<double>,std::allocator<gm::LineSegment<double,2>>>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

void sub_18B22983C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18B22A218(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18B22A2EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18B22A3B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18B22A620(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18B22A98C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

BOOL MKSeparatingAxisExistsBetweenPolygonsWithPoints(MKMapPoint *a1, unint64_t a2, MKMapPoint *a3, uint64_t a4)
{
  _BOOL8 result;
  uint64_t v6;
  MKMapPoint *v7;
  double x;
  double y;
  uint64_t v10;
  MKMapPoint *v11;
  double v12;
  double v13;
  unint64_t v14;
  double *p_y;
  double v16;
  uint64_t v17;
  uint64_t v18;
  double *v19;
  double v20;
  uint64_t v21;

  if (!a2)
    return 0;
  result = a4 == 0;
  v6 = 1;
  while (1)
  {
    v7 = &a1[v6];
    x = v7[-1].x;
    y = v7[-1].y;
    v10 = v6 == a2 ? 0 : v6;
    v11 = &a1[v10];
    v12 = v11->x - x;
    v13 = v11->y - y;
    v14 = a2;
    p_y = &a1->y;
    while (1)
    {
      v16 = v12 * (*p_y - y) - (*(p_y - 1) - x) * v13;
      if (v16 != 0.0)
        break;
      p_y += 2;
      if (!--v14)
      {
        v17 = 1;
        goto LABEL_12;
      }
    }
    v17 = v16 >= 0.0;
    if (v16 > 0.0)
      v17 = 2;
LABEL_12:
    v18 = a4;
    v19 = &a3->y;
    if (!a4)
      return 1;
    while (1)
    {
      v20 = v12 * (*v19 - y) - (*(v19 - 1) - x) * v13;
      v21 = v20 >= 0.0;
      if (v20 > 0.0)
        v21 = 2;
      if (v20 == 0.0 || v21 == v17)
        break;
      v19 += 2;
      if (!--v18)
        return 1;
    }
    if (++v6 > a2)
      return result;
  }
}

void sub_18B22AC70(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18B22ADB8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18B22AF58(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18B22B124(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18B22B2DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13)
{
  if (__p)
    operator delete(__p);
  if (a12)
    operator delete(a12);
  _Unwind_Resume(exception_object);
}

void sub_18B22BDE4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18B22C484(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18B22D770(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15)
{
  void *v15;

  if (__p)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_18B22D8C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15)
{
  void *v15;

  if (__p)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void ___ZL13_makePolylineI10MKMapPointEP18MKGeodesicPolylinePKT_m_block_invoke(uint64_t a1, CLLocationDegrees a2, CLLocationDegrees a3)
{
  uint64_t v3;
  CLLocationCoordinate2D v4;
  unint64_t v5;
  CLLocationCoordinate2D *v6;
  CLLocationCoordinate2D *v7;
  CLLocationCoordinate2D *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  BOOL v12;
  unint64_t v13;
  uint64_t v14;
  CLLocationCoordinate2D *v15;
  unint64_t v16;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = CLLocationCoordinate2DMake(a2, a3);
  v6 = *(CLLocationCoordinate2D **)(v3 + 8);
  v5 = *(_QWORD *)(v3 + 16);
  if ((unint64_t)v6 >= v5)
  {
    v8 = *(CLLocationCoordinate2D **)v3;
    v9 = ((uint64_t)v6 - *(_QWORD *)v3) >> 4;
    v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 60)
      std::vector<VKRouteInfo * {__strong}>::__throw_length_error[abi:ne180100]();
    v11 = v5 - (_QWORD)v8;
    if (v11 >> 3 > v10)
      v10 = v11 >> 3;
    v12 = (unint64_t)v11 >= 0x7FFFFFFFFFFFFFF0;
    v13 = 0xFFFFFFFFFFFFFFFLL;
    if (!v12)
      v13 = v10;
    if (v13)
    {
      v13 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<CLLocationCoordinate2D>>(v13);
      v8 = *(CLLocationCoordinate2D **)v3;
      v6 = *(CLLocationCoordinate2D **)(v3 + 8);
    }
    else
    {
      v14 = 0;
    }
    v15 = (CLLocationCoordinate2D *)(v13 + 16 * v9);
    v16 = v13 + 16 * v14;
    *v15 = v4;
    v7 = v15 + 1;
    if (v6 != v8)
    {
      do
      {
        v15[-1] = v6[-1];
        --v15;
        --v6;
      }
      while (v6 != v8);
      v8 = *(CLLocationCoordinate2D **)v3;
    }
    *(_QWORD *)v3 = v15;
    *(_QWORD *)(v3 + 8) = v7;
    *(_QWORD *)(v3 + 16) = v16;
    if (v8)
      operator delete(v8);
  }
  else
  {
    *v6 = v4;
    v7 = v6 + 1;
  }
  *(_QWORD *)(v3 + 8) = v7;
}

uint64_t __copy_helper_block_ea8_32c92_ZTSKZL13_makePolylineI10MKMapPointEP18MKGeodesicPolylinePKT_mEUl23GEOLocationCoordinate2DE_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 32) = *(_QWORD *)(a2 + 32);
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<CLLocationCoordinate2D>>(unint64_t a1)
{
  if (a1 >> 60)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(16 * a1);
}

void ___ZL13_makePolylineI22CLLocationCoordinate2DEP18MKGeodesicPolylinePKT_m_block_invoke(uint64_t a1, CLLocationDegrees a2, CLLocationDegrees a3)
{
  uint64_t v3;
  CLLocationCoordinate2D v4;
  unint64_t v5;
  CLLocationCoordinate2D *v6;
  CLLocationCoordinate2D *v7;
  CLLocationCoordinate2D *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  BOOL v12;
  unint64_t v13;
  uint64_t v14;
  CLLocationCoordinate2D *v15;
  unint64_t v16;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = CLLocationCoordinate2DMake(a2, a3);
  v6 = *(CLLocationCoordinate2D **)(v3 + 8);
  v5 = *(_QWORD *)(v3 + 16);
  if ((unint64_t)v6 >= v5)
  {
    v8 = *(CLLocationCoordinate2D **)v3;
    v9 = ((uint64_t)v6 - *(_QWORD *)v3) >> 4;
    v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 60)
      std::vector<VKRouteInfo * {__strong}>::__throw_length_error[abi:ne180100]();
    v11 = v5 - (_QWORD)v8;
    if (v11 >> 3 > v10)
      v10 = v11 >> 3;
    v12 = (unint64_t)v11 >= 0x7FFFFFFFFFFFFFF0;
    v13 = 0xFFFFFFFFFFFFFFFLL;
    if (!v12)
      v13 = v10;
    if (v13)
    {
      v13 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<CLLocationCoordinate2D>>(v13);
      v8 = *(CLLocationCoordinate2D **)v3;
      v6 = *(CLLocationCoordinate2D **)(v3 + 8);
    }
    else
    {
      v14 = 0;
    }
    v15 = (CLLocationCoordinate2D *)(v13 + 16 * v9);
    v16 = v13 + 16 * v14;
    *v15 = v4;
    v7 = v15 + 1;
    if (v6 != v8)
    {
      do
      {
        v15[-1] = v6[-1];
        --v15;
        --v6;
      }
      while (v6 != v8);
      v8 = *(CLLocationCoordinate2D **)v3;
    }
    *(_QWORD *)v3 = v15;
    *(_QWORD *)(v3 + 8) = v7;
    *(_QWORD *)(v3 + 16) = v16;
    if (v8)
      operator delete(v8);
  }
  else
  {
    *v6 = v4;
    v7 = v6 + 1;
  }
  *(_QWORD *)(v3 + 8) = v7;
}

uint64_t __copy_helper_block_ea8_32c104_ZTSKZL13_makePolylineI22CLLocationCoordinate2DEP18MKGeodesicPolylinePKT_mEUl23GEOLocationCoordinate2DE_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 32) = *(_QWORD *)(a2 + 32);
  return result;
}

void __71___mkMapServiceWalletMerchantTicket_submitWithCompletionQueue_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  MKWalletMerchantResponse *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  MKWalletMerchantResponse *v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = [MKWalletMerchantResponse alloc];
    objc_msgSend(v5, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[MKWalletMerchantResponse initWithGEOMapItem:](v8, "initWithGEOMapItem:", v9);
LABEL_3:
    v11 = (void *)v10;

    goto LABEL_6;
  }
  if (!v6)
  {
    v13 = [MKWalletMerchantResponse alloc];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "merchantLookupResult");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[MKWalletMerchantResponse initWithMerchantLookupResult:](v13, "initWithMerchantLookupResult:", v9);
    goto LABEL_3;
  }
  v11 = 0;
LABEL_6:
  v12 = *(NSObject **)(a1 + 40);
  if (v12)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71___mkMapServiceWalletMerchantTicket_submitWithCompletionQueue_handler___block_invoke_2;
    block[3] = &unk_1E20D8028;
    v17 = *(id *)(a1 + 48);
    v15 = v11;
    v16 = v6;
    dispatch_async(v12, block);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __71___mkMapServiceWalletMerchantTicket_submitWithCompletionQueue_handler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

BOOL MKGuidanceManeuverArrowMetricsEqualToArrowMetrics(double *a1, double *a2)
{
  BOOL v2;
  BOOL v3;

  if (*(unsigned __int8 *)a1 == *(unsigned __int8 *)a2
    && (a1[1] == a2[1] ? (v2 = a1[2] == a2[2]) : (v2 = 0),
        v2
     && a1[3] == a2[3]
     && a1[4] == a2[4]
     && a1[5] == a2[5]
     && (a1[6] == a2[6] ? (v3 = a1[7] == a2[7]) : (v3 = 0),
         v3
      && a1[8] == a2[8]
      && a1[9] == a2[9]
      && a1[10] == a2[10]
      && a1[11] == a2[11]
      && a1[12] == a2[12]
      && a1[13] == a2[13]
      && *((_QWORD *)a1 + 14) == *((_QWORD *)a2 + 14)
      && a1[15] == a2[15]
      && a1[16] == a2[16]
      && a1[17] == a2[17]
      && a1[18] == a2[18]
      && a1[19] == a2[19]
      && a1[20] == a2[20]
      && a1[21] == a2[21]
      && a1[22] == a2[22]
      && a1[23] == a2[23]
      && a1[24] == a2[24]
      && a1[25] == a2[25]
      && a1[26] == a2[26]
      && a1[27] == a2[27]
      && a1[28] == a2[28]
      && a1[29] == a2[29]
      && a1[30] == a2[30]
      && a1[31] == a2[31]
      && a1[32] == a2[32]
      && a1[33] == a2[33]
      && a1[34] == a2[34]
      && a1[35] == a2[35]
      && a1[36] == a2[36]
      && *((unsigned __int8 *)a1 + 296) == *((unsigned __int8 *)a2 + 296)
      && a1[38] == a2[38]
      && a1[39] == a2[39]
      && a1[40] == a2[40]
      && a1[41] == a2[41]
      && *((unsigned __int8 *)a1 + 336) == *((unsigned __int8 *)a2 + 336)
      && *((unsigned __int8 *)a1 + 337) == *((unsigned __int8 *)a2 + 337)
      && *((unsigned __int8 *)a1 + 338) == *((unsigned __int8 *)a2 + 338)
      && *((unsigned __int8 *)a1 + 339) == *((unsigned __int8 *)a2 + 339)
      && a1[43] == a2[43]
      && a1[44] == a2[44]
      && a1[45] == a2[45]
      && a1[46] == a2[46]
      && a1[47] == a2[47]
      && a1[48] == a2[48]
      && a1[49] == a2[49]
      && a1[50] == a2[50]
      && a1[51] == a2[51]
      && a1[52] == a2[52]
      && a1[53] == a2[53]
      && a1[54] == a2[54]
      && a1[55] == a2[55]
      && a1[56] == a2[56]
      && a1[57] == a2[57]
      && a1[58] == a2[58]
      && a1[59] == a2[59]
      && a1[60] == a2[60])))
  {
    return a1[61] == a2[61];
  }
  else
  {
    return 0;
  }
}

double _MKUpdatedGuidanceManeuverMetrics@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_BYTE *)a1 = 0;
  *(_OWORD *)(a1 + 8) = MKDefaultGuidanceManeuverMetrics_referenceSize;
  __asm { FMOV            V0.2D, #7.0 }
  *(_OWORD *)(a1 + 24) = _Q0;
  *(_OWORD *)(a1 + 40) = xmmword_18B2AF180;
  *(_OWORD *)(a1 + 56) = xmmword_18B2AF190;
  *(_OWORD *)(a1 + 72) = xmmword_18B2AF1A0;
  *(_OWORD *)(a1 + 88) = xmmword_18B2AF1B0;
  *(_QWORD *)(a1 + 104) = 0x4026000000000000;
  *(_QWORD *)(a1 + 112) = 3;
  *(_OWORD *)(a1 + 120) = xmmword_18B2AF1C0;
  *(_OWORD *)(a1 + 136) = xmmword_18B2AF1D0;
  *(_OWORD *)(a1 + 152) = xmmword_18B2AF1E0;
  *(_OWORD *)(a1 + 168) = xmmword_18B2AF1F0;
  *(_OWORD *)(a1 + 184) = xmmword_18B2AF200;
  *(_OWORD *)(a1 + 200) = xmmword_18B2AF210;
  *(_OWORD *)(a1 + 216) = xmmword_18B2AF220;
  *(_OWORD *)(a1 + 232) = xmmword_18B2AF230;
  *(_OWORD *)(a1 + 248) = xmmword_18B2AF240;
  *(_QWORD *)(a1 + 264) = 0x403E8BA2F8000000;
  *(_OWORD *)(a1 + 272) = xmmword_18B2AF250;
  *(_QWORD *)(a1 + 288) = 0x4024000000000000;
  *(_BYTE *)(a1 + 296) = 0;
  *(_OWORD *)(a1 + 304) = xmmword_18B2AF240;
  *(_OWORD *)(a1 + 320) = xmmword_18B2AF260;
  *(_DWORD *)(a1 + 336) = 16777217;
  *(_QWORD *)(a1 + 488) = 0;
  result = 0.0;
  *(_OWORD *)(a1 + 456) = 0u;
  *(_OWORD *)(a1 + 472) = 0u;
  *(_OWORD *)(a1 + 424) = 0u;
  *(_OWORD *)(a1 + 440) = 0u;
  *(_OWORD *)(a1 + 392) = 0u;
  *(_OWORD *)(a1 + 408) = 0u;
  *(_OWORD *)(a1 + 360) = 0u;
  *(_OWORD *)(a1 + 376) = 0u;
  *(_OWORD *)(a1 + 344) = 0u;
  return result;
}

double MKDefaultGuidanceManeuverMetrics@<D0>(uint64_t a1@<X8>)
{
  double result;

  if (GEOConfigGetBOOL())
    return _MKUpdatedGuidanceManeuverMetrics(a1);
  *(_BYTE *)a1 = 0;
  *(_OWORD *)(a1 + 8) = MKDefaultGuidanceManeuverMetrics_referenceSize;
  __asm { FMOV            V0.2D, #8.0 }
  *(_OWORD *)(a1 + 24) = _Q0;
  *(_OWORD *)(a1 + 40) = xmmword_18B2AF270;
  *(_OWORD *)(a1 + 56) = xmmword_18B2AF280;
  *(_OWORD *)(a1 + 72) = xmmword_18B2AF290;
  *(_QWORD *)(a1 + 88) = 0;
  *(_QWORD *)(a1 + 96) = 0;
  *(_QWORD *)(a1 + 104) = 0;
  *(_QWORD *)(a1 + 112) = 3;
  *(_OWORD *)(a1 + 120) = xmmword_18B2AF2A0;
  *(_OWORD *)(a1 + 136) = xmmword_18B2AF2B0;
  *(_OWORD *)(a1 + 152) = xmmword_18B2AF2C0;
  *(_QWORD *)(a1 + 176) = 0;
  *(_QWORD *)(a1 + 184) = 0;
  *(_QWORD *)(a1 + 168) = 0x402E000000000000;
  *(_OWORD *)(a1 + 192) = xmmword_18B2AF2D0;
  *(_OWORD *)(a1 + 208) = xmmword_18B2AF2E0;
  *(_OWORD *)(a1 + 224) = xmmword_18B2AF2F0;
  *(_OWORD *)(a1 + 240) = xmmword_18B2AF300;
  *(_OWORD *)(a1 + 256) = xmmword_18B2AF310;
  *(_OWORD *)(a1 + 272) = xmmword_18B2AF250;
  *(_QWORD *)(a1 + 288) = 0x4024000000000000;
  *(_BYTE *)(a1 + 296) = 0;
  *(_OWORD *)(a1 + 304) = xmmword_18B2AF320;
  *(_OWORD *)(a1 + 320) = xmmword_18B2AF330;
  *(_DWORD *)(a1 + 336) = 1;
  *(_QWORD *)(a1 + 488) = 0;
  result = 0.0;
  *(_OWORD *)(a1 + 456) = 0u;
  *(_OWORD *)(a1 + 472) = 0u;
  *(_OWORD *)(a1 + 424) = 0u;
  *(_OWORD *)(a1 + 440) = 0u;
  *(_OWORD *)(a1 + 392) = 0u;
  *(_OWORD *)(a1 + 408) = 0u;
  *(_OWORD *)(a1 + 360) = 0u;
  *(_OWORD *)(a1 + 376) = 0u;
  *(_OWORD *)(a1 + 344) = 0u;
  return result;
}

double MKDefaultJunctionManeuverMetrics@<D0>(uint64_t a1@<X8>)
{
  int8x16_t v2;
  double result;

  *(_OWORD *)(a1 + 464) = 0u;
  *(_OWORD *)(a1 + 480) = 0u;
  *(_OWORD *)(a1 + 432) = 0u;
  *(_OWORD *)(a1 + 448) = 0u;
  *(_OWORD *)(a1 + 400) = 0u;
  *(_OWORD *)(a1 + 416) = 0u;
  *(_OWORD *)(a1 + 368) = 0u;
  *(_OWORD *)(a1 + 384) = 0u;
  *(_OWORD *)(a1 + 336) = 0u;
  *(_OWORD *)(a1 + 352) = 0u;
  *(_OWORD *)(a1 + 304) = 0u;
  *(_OWORD *)(a1 + 320) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  MKDefaultGuidanceManeuverMetrics(a1);
  *(_QWORD *)(a1 + 24) = 0x401C000000000000;
  *(_OWORD *)(a1 + 136) = xmmword_18B2AF340;
  *(_QWORD *)(a1 + 152) = 0;
  *(_QWORD *)(a1 + 240) = 0x4037000000000000;
  v2 = (int8x16_t)vmulq_f64(*(float64x2_t *)(a1 + 8), (float64x2_t)xmmword_18B2AF350);
  *(int8x16_t *)(a1 + 224) = vextq_s8(v2, v2, 8uLL);
  *(_QWORD *)(a1 + 200) = v2.i64[0];
  *(_QWORD *)(a1 + 216) = 0x4030000000000000;
  *(_QWORD *)(a1 + 384) = 0x4020000000000000;
  result = 8.0;
  *(_OWORD *)(a1 + 80) = xmmword_18B2AF360;
  return result;
}

double MKDefaultCompactManeuverMetrics@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_BYTE *)a1 = 1;
  *(_OWORD *)(a1 + 8) = MKDefaultCompactManeuverMetrics_referenceSize;
  *(_OWORD *)(a1 + 24) = xmmword_18B2AF370;
  *(_OWORD *)(a1 + 40) = xmmword_18B2AF380;
  *(_OWORD *)(a1 + 56) = xmmword_18B2AF390;
  *(_OWORD *)(a1 + 72) = xmmword_18B2AF3A0;
  *(_OWORD *)(a1 + 88) = xmmword_18B2AA010;
  *(_QWORD *)(a1 + 104) = 0x401C000000000000;
  *(_QWORD *)(a1 + 112) = 3;
  *(_OWORD *)(a1 + 120) = xmmword_18B2AF3B0;
  *(_OWORD *)(a1 + 136) = xmmword_18B2AF3C0;
  *(_OWORD *)(a1 + 152) = xmmword_18B2AF3D0;
  *(_OWORD *)(a1 + 168) = xmmword_18B2AF3E0;
  *(_OWORD *)(a1 + 184) = xmmword_18B2AF3F0;
  *(_OWORD *)(a1 + 200) = xmmword_18B2AF400;
  *(_OWORD *)(a1 + 216) = xmmword_18B2AF410;
  *(_OWORD *)(a1 + 232) = xmmword_18B2AF420;
  *(_OWORD *)(a1 + 248) = xmmword_18B2AF430;
  *(_QWORD *)(a1 + 264) = 0x40305D174E000000;
  *(_OWORD *)(a1 + 272) = xmmword_18B2AF440;
  *(_QWORD *)(a1 + 288) = 0x4014000000000000;
  *(_BYTE *)(a1 + 296) = 0;
  *(_OWORD *)(a1 + 304) = xmmword_18B2AF430;
  *(_OWORD *)(a1 + 320) = xmmword_18B2AF450;
  *(_DWORD *)(a1 + 336) = 16842753;
  *(_QWORD *)(a1 + 488) = 0;
  result = 0.0;
  *(_OWORD *)(a1 + 456) = 0u;
  *(_OWORD *)(a1 + 472) = 0u;
  *(_OWORD *)(a1 + 424) = 0u;
  *(_OWORD *)(a1 + 440) = 0u;
  *(_OWORD *)(a1 + 392) = 0u;
  *(_OWORD *)(a1 + 408) = 0u;
  *(_OWORD *)(a1 + 360) = 0u;
  *(_OWORD *)(a1 + 376) = 0u;
  *(_OWORD *)(a1 + 344) = 0u;
  return result;
}

uint64_t _MKGuidanceManeuverArrowMetricsApplyScaleForContent(uint64_t result, uint64_t a2, int a3, double a4, double a5)
{
  float64x2_t v5;
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  double v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  float64x2_t v19;
  uint64_t v20;
  float64x2_t v21;
  float64x2_t v22;
  float64x2_t v23;
  float64x2_t v24;
  float64x2_t v25;
  float64x2_t v26;
  float64x2_t v27;
  float64x2_t v28;
  float64x2_t v29;
  float64x2_t v30;
  float64x2_t v31;
  double v32;
  float64x2_t v33;
  float64x2_t v34;
  float64x2_t v35;

  *(_BYTE *)result = 0;
  v5.f64[0] = *(float64_t *)(a2 + 8);
  if (a3)
  {
    v5.f64[1] = *(float64_t *)(a2 + 16);
    v6 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a5, 0);
    *(float64x2_t *)(result + 8) = vdivq_f64(vrndaq_f64(vmulq_n_f64(vmulq_n_f64(v5, a5), a4)), v6);
    *(float64x2_t *)(result + 24) = vdivq_f64(vrndaq_f64(vmulq_n_f64(vmulq_n_f64(*(float64x2_t *)(a2 + 24), a5), a4)), v6);
    *(float64x2_t *)(result + 40) = vdivq_f64(vrndaq_f64(vmulq_n_f64(vmulq_n_f64(*(float64x2_t *)(a2 + 40), a5), a4)), v6);
    *(float64x2_t *)(result + 56) = vdivq_f64(vrndaq_f64(vmulq_n_f64(vmulq_n_f64(*(float64x2_t *)(a2 + 56), a5), a4)), v6);
    *(float64x2_t *)(result + 72) = vdivq_f64(vrndaq_f64(vmulq_n_f64(vmulq_n_f64(*(float64x2_t *)(a2 + 72), a5), a4)), v6);
    *(float64x2_t *)(result + 88) = vdivq_f64(vrndaq_f64(vmulq_n_f64(vmulq_n_f64(*(float64x2_t *)(a2 + 88), a5), a4)), v6);
    *(double *)(result + 104) = round(*(double *)(a2 + 104) * a5 * a4) / a5;
    *(_QWORD *)(result + 112) = *(_QWORD *)(a2 + 112);
    *(float64x2_t *)(result + 120) = vdivq_f64(vrndaq_f64(vmulq_n_f64(vmulq_n_f64(*(float64x2_t *)(a2 + 120), a5), a4)), v6);
    *(float64x2_t *)(result + 136) = vdivq_f64(vrndaq_f64(vmulq_n_f64(vmulq_n_f64(*(float64x2_t *)(a2 + 136), a5), a4)), v6);
    *(double *)(result + 152) = round(*(double *)(a2 + 152) * a5 * a4) / a5;
    v7 = vdivq_f64(vrndaq_f64(vmulq_n_f64(vmulq_n_f64(*(float64x2_t *)(a2 + 176), a5), a4)), v6);
    *(_OWORD *)(result + 160) = *(_OWORD *)(a2 + 160);
    *(float64x2_t *)(result + 176) = v7;
    v8 = vdivq_f64(vrndaq_f64(vmulq_n_f64(vmulq_n_f64(*(float64x2_t *)(a2 + 208), a5), a4)), v6);
    *(float64x2_t *)(result + 192) = vdivq_f64(vrndaq_f64(vmulq_n_f64(vmulq_n_f64(*(float64x2_t *)(a2 + 192), a5), a4)), v6);
    *(float64x2_t *)(result + 208) = v8;
    v9 = vdivq_f64(vrndaq_f64(vmulq_n_f64(vmulq_n_f64(*(float64x2_t *)(a2 + 240), a5), a4)), v6);
    *(float64x2_t *)(result + 224) = vdivq_f64(vrndaq_f64(vmulq_n_f64(vmulq_n_f64(*(float64x2_t *)(a2 + 224), a5), a4)), v6);
    *(float64x2_t *)(result + 240) = v9;
    v10 = vdivq_f64(vrndaq_f64(vmulq_n_f64(vmulq_n_f64(*(float64x2_t *)(a2 + 272), a5), a4)), v6);
    *(float64x2_t *)(result + 256) = vdivq_f64(vrndaq_f64(vmulq_n_f64(vmulq_n_f64(*(float64x2_t *)(a2 + 256), a5), a4)), v6);
    *(float64x2_t *)(result + 272) = v10;
    *(double *)(result + 288) = round(*(double *)(a2 + 288) * a5 * a4) / a5;
    *(_BYTE *)(result + 296) = *(_BYTE *)(a2 + 296);
    v11 = vdivq_f64(vrndaq_f64(vmulq_n_f64(vmulq_n_f64(*(float64x2_t *)(a2 + 304), a5), a4)), v6);
    v12 = round(*(double *)(a2 + 320) * a5 * a4) / a5;
  }
  else
  {
    *(double *)(result + 8) = v5.f64[0] * a4;
    v13 = vmulq_n_f64(*(float64x2_t *)(a2 + 32), a4);
    *(float64x2_t *)(result + 16) = vmulq_n_f64(*(float64x2_t *)(a2 + 16), a4);
    *(float64x2_t *)(result + 32) = v13;
    v14 = vmulq_n_f64(*(float64x2_t *)(a2 + 64), a4);
    *(float64x2_t *)(result + 48) = vmulq_n_f64(*(float64x2_t *)(a2 + 48), a4);
    *(float64x2_t *)(result + 64) = v14;
    v15 = vmulq_n_f64(*(float64x2_t *)(a2 + 96), a4);
    *(float64x2_t *)(result + 80) = vmulq_n_f64(*(float64x2_t *)(a2 + 80), a4);
    *(float64x2_t *)(result + 96) = v15;
    *(_QWORD *)(result + 112) = *(_QWORD *)(a2 + 112);
    *(float64x2_t *)(result + 120) = vmulq_n_f64(*(float64x2_t *)(a2 + 120), a4);
    *(float64x2_t *)(result + 136) = vmulq_n_f64(*(float64x2_t *)(a2 + 136), a4);
    *(double *)(result + 152) = *(double *)(a2 + 152) * a4;
    v16 = vmulq_n_f64(*(float64x2_t *)(a2 + 176), a4);
    *(_OWORD *)(result + 160) = *(_OWORD *)(a2 + 160);
    *(float64x2_t *)(result + 176) = v16;
    v17 = vmulq_n_f64(*(float64x2_t *)(a2 + 208), a4);
    *(float64x2_t *)(result + 192) = vmulq_n_f64(*(float64x2_t *)(a2 + 192), a4);
    *(float64x2_t *)(result + 208) = v17;
    v18 = vmulq_n_f64(*(float64x2_t *)(a2 + 240), a4);
    *(float64x2_t *)(result + 224) = vmulq_n_f64(*(float64x2_t *)(a2 + 224), a4);
    *(float64x2_t *)(result + 240) = v18;
    v19 = vmulq_n_f64(*(float64x2_t *)(a2 + 272), a4);
    *(float64x2_t *)(result + 256) = vmulq_n_f64(*(float64x2_t *)(a2 + 256), a4);
    *(float64x2_t *)(result + 272) = v19;
    *(double *)(result + 288) = *(double *)(a2 + 288) * a4;
    v11 = vmulq_n_f64(*(float64x2_t *)(a2 + 304), a4);
    v12 = *(double *)(a2 + 320) * a4;
    *(_BYTE *)(result + 296) = *(_BYTE *)(a2 + 296);
  }
  *(float64x2_t *)(result + 304) = v11;
  v20 = *(_QWORD *)(a2 + 328);
  *(double *)(result + 320) = v12;
  *(_QWORD *)(result + 328) = v20;
  *(_DWORD *)(result + 336) = *(_DWORD *)(a2 + 336);
  v11.f64[0] = *(float64_t *)(a2 + 344);
  if (a3)
  {
    v11.f64[1] = *(float64_t *)(a2 + 352);
    v21 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a5, 0);
    v22 = *(float64x2_t *)(a2 + 376);
    v23 = vdivq_f64(vrndaq_f64(vmulq_n_f64(vmulq_n_f64(*(float64x2_t *)(a2 + 360), a5), a4)), v21);
    *(float64x2_t *)(result + 344) = vdivq_f64(vrndaq_f64(vmulq_n_f64(vmulq_n_f64(v11, a5), a4)), v21);
    *(float64x2_t *)(result + 360) = v23;
    v24 = vdivq_f64(vrndaq_f64(vmulq_n_f64(vmulq_n_f64(v22, a5), a4)), v21);
    v25 = *(float64x2_t *)(a2 + 408);
    v26 = vdivq_f64(vrndaq_f64(vmulq_n_f64(vmulq_n_f64(*(float64x2_t *)(a2 + 392), a5), a4)), v21);
    *(float64x2_t *)(result + 376) = v24;
    *(float64x2_t *)(result + 392) = v26;
    v27 = vdivq_f64(vrndaq_f64(vmulq_n_f64(vmulq_n_f64(v25, a5), a4)), v21);
    v28 = *(float64x2_t *)(a2 + 440);
    v29 = vdivq_f64(vrndaq_f64(vmulq_n_f64(vmulq_n_f64(*(float64x2_t *)(a2 + 424), a5), a4)), v21);
    *(float64x2_t *)(result + 408) = v27;
    *(float64x2_t *)(result + 424) = v29;
    *(float64x2_t *)(result + 440) = vdivq_f64(vrndaq_f64(vmulq_n_f64(vmulq_n_f64(v28, a5), a4)), v21);
    v30 = vdivq_f64(vrndaq_f64(vmulq_n_f64(vmulq_n_f64(*(float64x2_t *)(a2 + 456), a5), a4)), v21);
    v31 = vdivq_f64(vrndaq_f64(vmulq_n_f64(vmulq_n_f64(*(float64x2_t *)(a2 + 472), a5), a4)), v21);
    v32 = round(*(double *)(a2 + 488) * a5 * a4) / a5;
  }
  else
  {
    *(double *)(result + 344) = v11.f64[0] * a4;
    v33 = vmulq_n_f64(*(float64x2_t *)(a2 + 368), a4);
    *(float64x2_t *)(result + 352) = vmulq_n_f64(*(float64x2_t *)(a2 + 352), a4);
    *(float64x2_t *)(result + 368) = v33;
    v34 = vmulq_n_f64(*(float64x2_t *)(a2 + 400), a4);
    *(float64x2_t *)(result + 384) = vmulq_n_f64(*(float64x2_t *)(a2 + 384), a4);
    *(float64x2_t *)(result + 400) = v34;
    v35 = vmulq_n_f64(*(float64x2_t *)(a2 + 432), a4);
    *(float64x2_t *)(result + 416) = vmulq_n_f64(*(float64x2_t *)(a2 + 416), a4);
    *(float64x2_t *)(result + 432) = v35;
    *(double *)(result + 448) = *(double *)(a2 + 448) * a4;
    v30 = vmulq_n_f64(*(float64x2_t *)(a2 + 456), a4);
    v31 = vmulq_n_f64(*(float64x2_t *)(a2 + 472), a4);
    v32 = *(double *)(a2 + 488) * a4;
  }
  *(float64x2_t *)(result + 456) = v30;
  *(float64x2_t *)(result + 472) = v31;
  *(double *)(result + 488) = v32;
  return result;
}

uint64_t MKGuidanceManeuverArrowMetricsApplyScale@<X0>(void *__src@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
  _BYTE v6[496];

  memcpy(v6, __src, sizeof(v6));
  return _MKGuidanceManeuverArrowMetricsApplyScaleForContent(a2, (uint64_t)v6, 0, a3, 1.0);
}

uint64_t MKGuidanceManeuverArrowMetricsApplyScaleForContent@<X0>(void *__src@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  _BYTE v8[496];

  memcpy(v8, __src, sizeof(v8));
  return _MKGuidanceManeuverArrowMetricsApplyScaleForContent(a2, (uint64_t)v8, 1, a3, a4);
}

void MKArrowAppendArrowheadToPathAndReturnMetricsWithStemAdjustment(void *a1, uint64_t a2, uint64_t a3, __int128 *a4, CGFloat a5)
{
  id v8;
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
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  __int128 v24;
  void *v25;
  __int128 v26;
  void *v27;
  __int128 v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double cosval;
  __double2 v39;
  double v40;
  double v41;
  double v42;
  __double2 v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  __int128 v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double __x;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v72;
  double v73;
  double v74;
  double v75;
  CGAffineTransform v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;

  v8 = a1;
  v10 = *(double *)(a2 + 48);
  v9 = *(double *)(a2 + 56);
  v11 = *(double *)(a2 + 24);
  v12 = (v10 - v11) * 0.5;
  v13 = 0.0 - v12;
  v69 = v11;
  v14 = v11 + 0.0;
  v75 = v11 + 0.0 + v12;
  v15 = (0.0 - v12 + v75) * 0.5;
  v16 = 0.0 - v9;
  if (v15 == 0.0 - v12)
  {
    v17 = INFINITY;
    v18 = (0.0 - v12 + v75) * 0.5;
  }
  else
  {
    v17 = v16 / (v15 - v13);
    v18 = v16 - v17 * v15;
  }
  if (v15 == v75)
  {
    v19 = INFINITY;
    v20 = v15;
  }
  else
  {
    v19 = v16 / (v15 - v75);
    v20 = v16 - v19 * v15;
  }
  v72 = v20;
  v73 = v19;
  v74 = 0.0 - v9;
  v70 = v17;
  v65 = v18;
  switch(*(_QWORD *)(a2 + 112))
  {
    case 0:
      v66 = *(double *)(a2 + 56);
      v63 = v11 + 0.0;
      v21 = v13;
      v22 = v75;
      goto LABEL_10;
    case 1:
      v66 = *(double *)(a2 + 56);
      objc_msgSend(MEMORY[0x1E0CEA390], "bezierPath");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "moveToPoint:", v14);
      v16 = v74;
      objc_msgSend(v23, "addLineToPoint:", v14, v69 * 1.39999998 + v72 + v73 * v14);
      objc_msgSend(v23, "addLineToPoint:", v75, v69 * 1.39999998 + 0.0);
      objc_msgSend(v23, "addLineToPoint:", v75, 0.0);
      objc_msgSend(v23, "addLineToPoint:", v15, v74);
      objc_msgSend(v23, "addLineToPoint:", v13, 0.0);
      objc_msgSend(v23, "addLineToPoint:", v13, v69 * 1.39999998 + 0.0);
      objc_msgSend(v23, "addLineToPoint:", 0.0, v69 * 1.39999998 + v18 + v17 * 0.0);
      objc_msgSend(v23, "addLineToPoint:", 0.0, 0.0);
      objc_msgSend(v23, "closePath");
      v24 = a4[1];
      v77 = *a4;
      v78 = v24;
      v79 = a4[2];
      objc_msgSend(v23, "applyTransform:", &v77);
      objc_msgSend(v8, "appendPath:", v23);

      v63 = v14;
      v21 = v13;
      v22 = v75;
LABEL_10:
      objc_msgSend(MEMORY[0x1E0CEA390], "bezierPath");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "moveToPoint:", v15, v16);
      objc_msgSend(v25, "addLineToPoint:", v21, 0.0);
      objc_msgSend(v25, "addCurveToPoint:controlPoint1:controlPoint2:", 0.0, 0.0, v21, 0.0);
      objc_msgSend(v25, "addLineToPoint:", 0.0, 0.0);
      v14 = v63;
      objc_msgSend(v25, "addLineToPoint:", v63, 0.0);
      v16 = v74;
      objc_msgSend(v25, "addCurveToPoint:controlPoint1:controlPoint2:", v22, 0.0);
      objc_msgSend(v25, "addLineToPoint:", v15, v74);
      objc_msgSend(v25, "closePath");
      v26 = a4[1];
      v77 = *a4;
      v78 = v26;
      v79 = a4[2];
      objc_msgSend(v25, "applyTransform:", &v77);
      objc_msgSend(v8, "appendPath:", v25);

      v13 = v21;
      goto LABEL_12;
    case 2:
      v66 = *(double *)(a2 + 56);
LABEL_12:
      objc_msgSend(MEMORY[0x1E0CEA390], "bezierPath");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "moveToPoint:", v14, 0.0);
      objc_msgSend(v27, "addLineToPoint:", v75, 0.0);
      objc_msgSend(v27, "addLineToPoint:", v15, v16);
      objc_msgSend(v27, "addLineToPoint:", v13, 0.0);
      objc_msgSend(v27, "addLineToPoint:", 0.0, 0.0);
      objc_msgSend(v27, "closePath");
      v28 = a4[1];
      v77 = *a4;
      v78 = v28;
      v79 = a4[2];
      objc_msgSend(v27, "applyTransform:", &v77);
      objc_msgSend(v8, "appendPath:", v27);

      v9 = v66;
      goto LABEL_13;
    case 3:
LABEL_13:
      if (v10 == 0.0)
        goto LABEL_34;
      if (v10 / 24.0 >= v9 / 19.0)
        v29 = v9 / 19.0;
      else
        v29 = v10 / 24.0;
      v30 = v29 * 2.0999999;
      v31 = v29 + v29;
      __x = *(double *)(a2 + 160) * 0.0174532925;
      v32 = atan(v9 / v10);
      objc_msgSend(MEMORY[0x1E0CEA390], "bezierPath");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = v29 + v29;
      v34 = (v29 + v29) * 0.829037573;
      if (v34 < 0.0)
        v34 = v31 * -0.829037573;
      v35 = v31 * 0.440807097;
      if (v31 * 0.440807097 < 0.0)
        v35 = v31 * -0.440807097;
      v36 = v15 - v34;
      v67 = v15;
      v37 = v74 + v35;
      v59 = v74 + v35;
      v62 = v67 + v34;
      v57 = v36;
      v68 = -(v29 * 2.0999999);
      v60 = v32;
      v58 = 1.25663706 - v32;
      v39 = __sincos_stret(1.25663706 - v32);
      cosval = v39.__cosval;
      if (v39.__cosval < 0.0)
        cosval = -v39.__cosval;
      v40 = v13;
      v41 = v30 * (1.0 - cosval);
      v43 = __sincos_stret(v32 + -1.57079633 + 1.25663706);
      v42 = v43.__cosval;
      if (v43.__cosval < 0.0)
        v42 = -v43.__cosval;
      v44 = v13 + v41;
      v45 = v13 + v30 * (v43.__sinval + 1.0);
      v46 = -(v30 * (1.0 - v42));
      v47 = v37;
      v15 = v67;
      objc_msgSend(v33, "moveToPoint:", v57, v47, *(_QWORD *)&v46);
      objc_msgSend(v33, "addLineToPoint:", v44, -(v30 * (v39.__sinval + 1.0)));
      objc_msgSend(v33, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v13 + v30, v68, v30, v58 + 3.14159265, v58 + 3.14159265 + -2.51327412);
      v48 = v67 + v69 * -0.5;
      v49 = tan(__x);
      v50 = -(v48 - v45);
      if (v48 - v45 < 0.0)
        v50 = v48 - v45;
      v51 = v46 + v50 * v49;
      v52 = -a5;
      v53 = v45 - v40;
      if (v45 - v40 < 0.0)
        v53 = -(v45 - v40);
      v54 = v75 - v53;
      objc_msgSend(v33, "addLineToPoint:", v48, v51);
      objc_msgSend(v33, "addLineToPoint:", v48, v52);
      objc_msgSend(v33, "addLineToPoint:", v67 + v69 * 0.5, v52);
      v16 = v74;
      objc_msgSend(v33, "addLineToPoint:", v67 + v69 * 0.5, v51);
      objc_msgSend(v33, "addLineToPoint:", v54, v56);
      objc_msgSend(v33, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v75 - v30, v68, v30, v60 + 1.25663706 + -6.28318531, v60 + 1.25663706 + -6.28318531 + -2.51327412);
      objc_msgSend(v33, "addLineToPoint:", v62, v59);
      objc_msgSend(v33, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v67, v74 + v64, v64, 5.68977336, 3.7350046);
      objc_msgSend(v33, "closePath");
      if (a5 > 0.0)
      {
        CGAffineTransformMakeTranslation(&v76, 0.0, a5);
        objc_msgSend(v33, "applyTransform:", &v76);
      }
      v55 = a4[1];
      v77 = *a4;
      v78 = v55;
      v79 = a4[2];
      objc_msgSend(v33, "applyTransform:", &v77);
      objc_msgSend(v8, "appendPath:", v33);

      v13 = v40;
      v17 = v70;
      v18 = v65;
LABEL_32:
      if (a3)
      {
        *(double *)a3 = v15;
        *(double *)(a3 + 8) = v16;
        *(double *)(a3 + 16) = v13;
        *(_QWORD *)(a3 + 24) = 0;
        *(double *)(a3 + 32) = v75;
        *(_QWORD *)(a3 + 40) = 0;
        *(double *)(a3 + 48) = v17;
        *(double *)(a3 + 56) = v18;
        *(double *)(a3 + 64) = v73;
        *(double *)(a3 + 72) = v72;
      }
LABEL_34:

      return;
    default:
      goto LABEL_32;
  }
}

void MKArrowAppendInitialSegmentToPathInvertingCorners(void *a1, uint64_t a2, _OWORD *a3, int a4, double a5)
{
  id v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  CGAffineTransform v18;
  CGAffineTransform v19;

  v9 = a1;
  v10 = *(double *)(a2 + 24);
  if (*(double *)(a2 + 64) >= v10 * 0.5)
    v11 = v10 * 0.5;
  else
    v11 = *(double *)(a2 + 64);
  if (v11 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRect:", 0.0, -a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4)
      v12 = 3;
    else
      v12 = 12;
    objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", v12, 0.0, -a5, v10, a5, v11, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;
  v15 = a3[1];
  *(_OWORD *)&v19.a = *a3;
  *(_OWORD *)&v19.c = v15;
  *(_OWORD *)&v19.tx = a3[2];
  objc_msgSend(v13, "applyTransform:", &v19);
  objc_msgSend(v9, "appendPath:", v14);
  v16 = a3[1];
  *(_OWORD *)&v18.a = *a3;
  *(_OWORD *)&v18.c = v16;
  *(_OWORD *)&v18.tx = a3[2];
  CGAffineTransformTranslate(&v19, &v18, 0.0, -a5);
  v17 = *(_OWORD *)&v19.c;
  *a3 = *(_OWORD *)&v19.a;
  a3[1] = v17;
  a3[2] = *(_OWORD *)&v19.tx;

}

void MKArrowAppendSegmentToPath(void *a1, uint64_t a2, _OWORD *a3, double a4)
{
  id v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  CGAffineTransform v12;
  CGAffineTransform v13;

  v7 = a1;
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRect:", 0.0, -a4, *(double *)(a2 + 24), a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = a3[1];
  *(_OWORD *)&v13.a = *a3;
  *(_OWORD *)&v13.c = v9;
  *(_OWORD *)&v13.tx = a3[2];
  objc_msgSend(v8, "applyTransform:", &v13);
  objc_msgSend(v7, "appendPath:", v8);
  v10 = a3[1];
  *(_OWORD *)&v12.a = *a3;
  *(_OWORD *)&v12.c = v10;
  *(_OWORD *)&v12.tx = a3[2];
  CGAffineTransformTranslate(&v13, &v12, 0.0, -a4);
  v11 = *(_OWORD *)&v13.c;
  *a3 = *(_OWORD *)&v13.a;
  a3[1] = v11;
  a3[2] = *(_OWORD *)&v13.tx;

}

void MKArrowAppendRightAngleCurveToPath(void *a1, double *a2, _OWORD *a3)
{
  id v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  CGAffineTransform v22;
  CGAffineTransform v23;
  CGAffineTransform v24;

  v5 = a1;
  v6 = a2[3];
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = a2[15];
  if (v9 <= v6)
    v10 = v6;
  else
    v10 = a2[15];
  v11 = v9 + 0.0;
  v12 = 0.0 - v10;
  v13 = v9 + 0.0 - v9;
  objc_msgSend(v7, "moveToPoint:", 0.0, 0.0);
  objc_msgSend(v8, "addQuadCurveToPoint:controlPoint:", v11, v12, v13, v12);
  v14 = v6 - a2[15];
  if (v14 > 0.0)
  {
    objc_msgSend(v8, "addLineToPoint:", v6 + 0.0, v12);
    v14 = v6 - a2[15];
  }
  v15 = v6 + v12;
  if (v14 > 0.0)
    objc_msgSend(v8, "addLineToPoint:", v6 + 0.0, v15);
  objc_msgSend(v8, "addLineToPoint:", v11, v15);
  v16 = a2[16];
  if (v16 <= 0.0)
  {
    objc_msgSend(v8, "addLineToPoint:", v6 + 0.0, v15);
  }
  else
  {
    v17 = v15 + v16;
    objc_msgSend(v8, "addLineToPoint:", v6 + 0.0 + v16, v15);
    objc_msgSend(v8, "addQuadCurveToPoint:controlPoint:", v6 + 0.0, v17, v6 + 0.0, v15);
  }
  objc_msgSend(v8, "addLineToPoint:", v6 + 0.0, 0.0);
  objc_msgSend(v8, "closePath");
  v18 = a3[1];
  *(_OWORD *)&v24.a = *a3;
  *(_OWORD *)&v24.c = v18;
  *(_OWORD *)&v24.tx = a3[2];
  objc_msgSend(v8, "applyTransform:", &v24);
  objc_msgSend(v5, "appendPath:", v8);
  v19 = a3[1];
  *(_OWORD *)&v24.a = *a3;
  *(_OWORD *)&v24.c = v19;
  *(_OWORD *)&v24.tx = a3[2];
  *(_OWORD *)&v23.a = *(_OWORD *)&v24.a;
  *(_OWORD *)&v23.c = v19;
  *(_OWORD *)&v23.tx = a3[2];
  CGAffineTransformTranslate(&v24, &v23, v10, -v10);
  v22 = v24;
  CGAffineTransformRotate(&v23, &v22, 1.57079633);
  v21 = *(_OWORD *)&v23.c;
  v20 = *(_OWORD *)&v23.tx;
  v24 = v23;
  *a3 = *(_OWORD *)&v23.a;
  a3[1] = v21;
  a3[2] = v20;

}

void MKArrowAppendCurveToPathWithOptions(void *a1, char a2, double *__src, _OWORD *a4, double *a5, double a6)
{
  double *v11;
  double v12;
  _BYTE v13[496];

  if (fabs(a6 + 0.785398163) >= 0.000001 && fabs(a6 + 2.35619449) >= 0.000001)
  {
    if (fabs(a6 + -0.785398163) >= 0.000001 && fabs(a6 + 3.92699082) >= 0.000001)
    {
      v12 = __src[9];
      goto LABEL_8;
    }
    v11 = __src + 26;
  }
  else
  {
    v11 = __src + 30;
  }
  v12 = *v11;
LABEL_8:
  memcpy(v13, __src, sizeof(v13));
  MKArrowAppendCurveToPathWithOptionsAndRadius(a1, a2, (uint64_t)v13, a4, a5, a6, v12);
}

void MKArrowAppendCurveToPathWithOptionsAndRadius(void *a1, char a2, uint64_t a3, _OWORD *a4, double *a5, double a6, double a7)
{
  id v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  __int128 v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  __double2 v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  __double2 v42;
  double v43;
  double v44;
  double v45;
  double v46;
  __int128 v47;
  __int128 v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  CGFloat v54;
  double v55;
  double v56;
  CGAffineTransform v57;
  CGAffineTransform v58;
  CGAffineTransform v59;

  v13 = a1;
  if (a6 == -1.57079633)
    goto LABEL_15;
  v14 = *(double *)(a3 + 24);
  v56 = fmax(a7 - v14, 0.0);
  v15 = fmax(v14 - a7, 0.0);
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPath");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  v18 = a4[1];
  *(_OWORD *)&v59.a = *a4;
  *(_OWORD *)&v59.c = v18;
  *(_OWORD *)&v59.tx = a4[2];
  if (a6 <= -1.57079633)
  {
    v34 = a6 + 1.57079633;
    objc_msgSend(v16, "moveToPoint:", v14 + 0.0, 0.0);
    v35 = v14 + 0.0 - a7;
    objc_msgSend(v17, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v35, 0.0 - v15, a7, 0.0, v34 * 0.5);
    objc_msgSend(v17, "currentPoint");
    v53 = v37;
    v55 = v36;
    objc_msgSend(v17, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v35, 0.0 - v15, a7, v34 * 0.5, v34);
    objc_msgSend(v17, "currentPoint");
    v39 = v38;
    v41 = v40;
    v42 = __sincos_stret(v34 + 3.14159265);
    v43 = v39 + v14 * v42.__cosval;
    v44 = v41 + v14 * v42.__sinval;
    objc_msgSend(v17, "addLineToPoint:", v43, v44);
    objc_msgSend(v17, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v35, 0.0 - v15, v56, v34, v34 * 0.5);
    objc_msgSend(v17, "currentPoint");
    v52 = v45;
    v31 = v46;
    objc_msgSend(v17, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v35, 0.0 - v15, v56, v34 * 0.5, 0.0);
    if ((a2 & 1) == 0)
      objc_msgSend(v17, "addLineToPoint:", 0.0, 0.0);
    v58 = v59;
    CGAffineTransformTranslate(&v59, &v58, v43, v44);
    v57 = v59;
    CGAffineTransformRotate(&v58, &v57, v34);
    v59 = v58;
    if (!a5)
      goto LABEL_12;
    v33 = v55 + v52;
    v32 = v53;
  }
  else
  {
    v19 = a6 + -1.57079633;
    objc_msgSend(v16, "moveToPoint:", 0.0, 0.0);
    v20 = 0.0 - v15;
    v51 = a7 + 0.0;
    objc_msgSend(v17, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, a7 + 0.0, v20, a7, 3.14159265, (a6 + -1.57079633 + -3.14159265) * 0.5);
    objc_msgSend(v17, "currentPoint");
    v49 = v22;
    v50 = v21;
    objc_msgSend(v17, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, a7 + 0.0, v20, a7, (v19 + -3.14159265) * 0.5, v19);
    objc_msgSend(v17, "currentPoint");
    v24 = v23;
    v26 = v25;
    v27 = __sincos_stret(a6 + -1.57079633 + 3.14159265);
    v54 = v26;
    objc_msgSend(v17, "addLineToPoint:", v24 + v14 * v27.__cosval, v26 + v14 * v27.__sinval);
    objc_msgSend(v17, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v51, v20, v56, v19, (v19 + -3.14159265) * 0.5);
    objc_msgSend(v17, "currentPoint");
    v29 = v28;
    v31 = v30;
    objc_msgSend(v17, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v51, v20, v56, (a6 + -1.57079633 + -3.14159265) * 0.5, 3.14159265);
    if ((a2 & 1) == 0)
      objc_msgSend(v17, "addLineToPoint:", v14 + 0.0, 0.0);
    v58 = v59;
    CGAffineTransformTranslate(&v59, &v58, v24, v54);
    v57 = v59;
    CGAffineTransformRotate(&v58, &v57, a6 + 1.57079633);
    v59 = v58;
    if (!a5)
      goto LABEL_12;
    v32 = v49;
    v33 = v50 + v29;
  }
  *a5 = v33 * 0.5;
  a5[1] = (v32 + v31) * 0.5;
LABEL_12:
  if ((a2 & 1) == 0)
    objc_msgSend(v17, "closePath");
  v47 = a4[1];
  *(_OWORD *)&v58.a = *a4;
  *(_OWORD *)&v58.c = v47;
  *(_OWORD *)&v58.tx = a4[2];
  objc_msgSend(v17, "applyTransform:", &v58);
  objc_msgSend(v13, "appendPath:", v17);
  v48 = *(_OWORD *)&v59.c;
  *a4 = *(_OWORD *)&v59.a;
  a4[1] = v48;
  a4[2] = *(_OWORD *)&v59.tx;

LABEL_15:
}

void MKArrowAppendUTurnCurveToPath(void *a1, uint64_t a2, _OWORD *a3, double a4)
{
  double v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  __int128 v11;
  CGFloat v12;
  CGFloat v13;
  __int128 v14;
  __int128 v15;
  CGAffineTransform v16;
  CGAffineTransform v17;
  CGAffineTransform v18;

  v6 = *(double *)(a2 + 24);
  v7 = (void *)MEMORY[0x1E0CEA390];
  v8 = a1;
  objc_msgSend(v7, "bezierPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = a3[1];
  *(_OWORD *)&v18.a = *a3;
  *(_OWORD *)&v18.c = v11;
  *(_OWORD *)&v18.tx = a3[2];
  if (a4 >= 0.0)
  {
    objc_msgSend(v9, "moveToPoint:", v6 + 0.0, 0.0);
    objc_msgSend(v10, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v6 + 0.0 + a4, 0.0, a4, 3.14159265, 0.0);
    v13 = v6 + v6 + 0.0 + a4 * 2.0;
    objc_msgSend(v10, "addLineToPoint:", v13, 0.0);
    objc_msgSend(v10, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v6 + 0.0 + a4, 0.0, v6 + a4, 0.0, 3.14159265);
    v17 = v18;
    CGAffineTransformTranslate(&v18, &v17, v13, 0.0);
    v16 = v18;
    v12 = -3.14159265;
  }
  else
  {
    objc_msgSend(v9, "moveToPoint:", 0.0, 0.0);
    objc_msgSend(v10, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, a4 + 0.0, 0.0, -a4, 0.0, -3.14159265);
    objc_msgSend(v10, "addLineToPoint:", -(v6 - a4 * 2.0), 0.0);
    objc_msgSend(v10, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, a4 + 0.0, 0.0, v6 - a4, 3.14159265, 0.0);
    v17 = v18;
    CGAffineTransformTranslate(&v18, &v17, v6 - (v6 - a4 * 2.0), 0.0);
    v16 = v18;
    v12 = 3.14159265;
  }
  CGAffineTransformRotate(&v17, &v16, v12);
  v18 = v17;
  objc_msgSend(v10, "closePath", *(_OWORD *)&v16.a, *(_OWORD *)&v16.c, *(_OWORD *)&v16.tx);
  v14 = a3[1];
  *(_OWORD *)&v17.a = *a3;
  *(_OWORD *)&v17.c = v14;
  *(_OWORD *)&v17.tx = a3[2];
  objc_msgSend(v10, "applyTransform:", &v17);
  objc_msgSend(v8, "appendPath:", v10);

  v15 = *(_OWORD *)&v18.c;
  *a3 = *(_OWORD *)&v18.a;
  a3[1] = v15;
  a3[2] = *(_OWORD *)&v18.tx;

}

void MKArrowAppendRightTurnToPathInRect(void *a1, double *a2, double *a3, _QWORD *a4, double a5, double a6, double a7, double a8)
{
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGAffineTransform v21;
  double __dst[62];

  v15 = a1;
  v16 = a2[7];
  v17 = a2[3];
  v18 = fmax(a2[15] - v17, 0.0);
  v19 = ceil(a2[18] - v18);
  v20 = ceil(a2[17] - v18);
  if (a3)
    *a3 = v17 + v19 + -1.0;
  memset(&v21, 0, sizeof(v21));
  CGAffineTransformMakeTranslation(&v21, a5 + a7 - v19, a6 + a8);
  memcpy(__dst, a2, sizeof(__dst));
  MKArrowAppendInitialSegmentToPathInvertingCorners(v15, (uint64_t)__dst, &v21, 0, v20);
  memcpy(__dst, a2, sizeof(__dst));
  MKArrowAppendRightAngleCurveToPath(v15, __dst, &v21);
  memcpy(__dst, a2, sizeof(__dst));
  MKArrowAppendSegmentToPath(v15, (uint64_t)__dst, &v21, v19 - v16);
  if (a4)
    *a4 = (id)objc_msgSend(v15, "copy");
  memcpy(__dst, a2, sizeof(__dst));
  MKArrowAppendArrowheadToPathAndReturnMetricsWithStemAdjustment(v15, (uint64_t)__dst, 0, (__int128 *)&v21, 0.0);

}

void MKArrowAppendLeftTurnToPathInRect(void *a1, const void *a2, double a3, double a4, double a5, double a6, uint64_t a7, _QWORD *a8)
{
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  CGAffineTransform v19;
  CGAffineTransform v20;
  _BYTE __dst[496];
  double v22;

  v14 = a1;
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPath");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0.0;
  memcpy(__dst, a2, sizeof(__dst));
  MKArrowAppendRightTurnToPathInRect(v15, (double *)__dst, &v22, a8, a3, a4, a5, a6);
  memset(__dst, 0, 48);
  CGAffineTransformMakeScale((CGAffineTransform *)__dst, -1.0, 1.0);
  v19 = *(CGAffineTransform *)__dst;
  CGAffineTransformTranslate(&v20, &v19, -v22, 0.0);
  *(CGAffineTransform *)__dst = v20;
  if (a8)
  {
    v16 = (void *)*a8;
    v20 = *(CGAffineTransform *)__dst;
    objc_msgSend(v16, "applyTransform:", &v20);
    v17 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(v17, "appendPath:", *a8);
    v18 = objc_retainAutorelease(v17);
    *a8 = v18;

  }
  v20 = *(CGAffineTransform *)__dst;
  objc_msgSend(v15, "applyTransform:", &v20);
  objc_msgSend(v14, "appendPath:", v15);

}

void MKArrowAppendMergeLeftToPathInRect(void *a1, const void *a2, _QWORD *a3, double a4, CGFloat a5, double a6, double a7)
{
  id v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  id v19;
  CGAffineTransform v20;
  CGAffineTransform v21;
  _BYTE __dst[496];

  v13 = a1;
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x1E0C9D538];
  v16 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  memcpy(__dst, a2, sizeof(__dst));
  MKArrowAppendMergeRightToPathInRect(v14, (double *)__dst, a3, v15, v16, a6, a7);
  memset(__dst, 0, 48);
  CGAffineTransformMakeScale((CGAffineTransform *)__dst, -1.0, 1.0);
  v20 = *(CGAffineTransform *)__dst;
  CGAffineTransformTranslate(&v21, &v20, -a4 - a6, a5);
  *(CGAffineTransform *)__dst = v21;
  if (a3)
  {
    v17 = (void *)*a3;
    v21 = *(CGAffineTransform *)__dst;
    objc_msgSend(v17, "applyTransform:", &v21);
    v18 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v18, "appendPath:", *a3);
    v19 = objc_retainAutorelease(v18);
    *a3 = v19;

  }
  v21 = *(CGAffineTransform *)__dst;
  objc_msgSend(v14, "applyTransform:", &v21);
  objc_msgSend(v13, "appendPath:", v14);

}

void MKArrowAppendMergeRightToPathInRect(void *a1, double *a2, _QWORD *a3, double a4, double a5, double a6, double a7)
{
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGAffineTransform v19;
  _BYTE __dst[496];

  v13 = a1;
  v14 = (a6 + a2[3] * -2.79999995) * 0.5;
  memset(&v19, 0, sizeof(v19));
  CGAffineTransformMakeTranslation(&v19, a4 + v14, a5 + a7);
  v15 = a2[38];
  memcpy(__dst, a2, sizeof(__dst));
  MKArrowAppendInitialSegmentToPathInvertingCorners(v13, (uint64_t)__dst, &v19, 0, v15);
  v16 = a2[40];
  v17 = a2[41] * -0.0174532925;
  memcpy(__dst, a2, sizeof(__dst));
  MKArrowAppendCurveToPathWithOptionsAndRadius(v13, 0, (uint64_t)__dst, &v19, 0, v17, v16);
  v18 = a2[39];
  memcpy(__dst, a2, sizeof(__dst));
  MKArrowAppendSegmentToPath(v13, (uint64_t)__dst, &v19, v18);
  if (a3)
    *a3 = (id)objc_msgSend(v13, "copy");
  memcpy(__dst, a2, sizeof(__dst));
  MKArrowAppendArrowheadToPathAndReturnMetricsWithStemAdjustment(v13, (uint64_t)__dst, 0, (__int128 *)&v19, 0.0);

}

void MKArrowAppendUTurnToPathInRect(void *a1, int a2, double *a3, _QWORD *a4, double a5, double a6, double a7, double a8)
{
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGAffineTransform v23;
  CGAffineTransform v24;
  _BYTE __dst[496];

  v15 = a1;
  v16 = a3[7];
  v17 = a3[3];
  v18 = a3[10];
  v19 = (a3[6] - v17) * 0.5 + v17 + v17 + v18 * 2.0;
  memset(&v24, 0, sizeof(v24));
  CGAffineTransformMakeTranslation(&v24, a5 + v19 - v17, a6 + a8);
  if (a2 == 1)
  {
    v23 = v24;
    CGAffineTransformScale((CGAffineTransform *)__dst, &v23, -1.0, 1.0);
    v24 = *(CGAffineTransform *)__dst;
    v23 = *(CGAffineTransform *)__dst;
    CGAffineTransformTranslate((CGAffineTransform *)__dst, &v23, -a7, 0.0);
    v24 = *(CGAffineTransform *)__dst;
  }
  v20 = a8 * 0.522222221;
  v21 = a8 * 0.522222221 - a3[12];
  v22 = v20 - a3[13];
  memcpy(__dst, a3, sizeof(__dst));
  MKArrowAppendInitialSegmentToPathInvertingCorners(v15, (uint64_t)__dst, &v24, 0, v21);
  memcpy(__dst, a3, sizeof(__dst));
  MKArrowAppendUTurnCurveToPath(v15, (uint64_t)__dst, &v24, -v18);
  memcpy(__dst, a3, sizeof(__dst));
  MKArrowAppendSegmentToPath(v15, (uint64_t)__dst, &v24, v22 - v16);
  if (a4)
    *a4 = (id)objc_msgSend(v15, "copy");
  memcpy(__dst, a3, sizeof(__dst));
  MKArrowAppendArrowheadToPathAndReturnMetricsWithStemAdjustment(v15, (uint64_t)__dst, 0, (__int128 *)&v24, 0.0);

}

void MKArrowAppendStraightArrowToPathInRect(void *a1, double *a2, _QWORD *a3, double a4, double a5, double a6, double a7)
{
  id v13;
  double v14;
  double v15;
  CGAffineTransform v16;
  _BYTE __dst[496];

  v13 = a1;
  v14 = a2[7];
  v15 = a2[19];
  memset(&v16, 0, sizeof(v16));
  CGAffineTransformMakeTranslation(&v16, a4 + ceil((a6 - a2[3]) * 0.5), a5 + a7);
  memcpy(__dst, a2, sizeof(__dst));
  MKArrowAppendInitialSegmentToPathInvertingCorners(v13, (uint64_t)__dst, &v16, 0, a7 - v14 - v15);
  if (a3)
    *a3 = (id)objc_msgSend(v13, "copy");
  memcpy(__dst, a2, sizeof(__dst));
  MKArrowAppendArrowheadToPathAndReturnMetricsWithStemAdjustment(v13, (uint64_t)__dst, 0, (__int128 *)&v16, 0.0);

}

void MKArrowAppendExitRoadRightToPathInRect(void *a1, void *a2, _OWORD *a3, _QWORD *a4, double a5, double a6, double a7, double a8)
{
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  __int128 v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;
  double v26;
  double v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  double v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  id v53;
  CGAffineTransform v54;
  CGAffineTransform v55;
  CGAffineTransform v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _OWORD __dst[31];

  v15 = a1;
  v16 = (void *)MEMORY[0x1E0CEA390];
  v17 = a2;
  objc_msgSend(v16, "bezierPath");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPath");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v57 = *MEMORY[0x1E0C9BAA8];
  v58 = v20;
  v59 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v21 = *((double *)a3 + 31);
  memcpy(__dst, a3, sizeof(__dst));
  MKArrowAppendInitialSegmentToPathInvertingCorners(v18, (uint64_t)__dst, &v57, 0, v21);
  v22 = *((double *)a3 + 33);
  v23 = *((double *)a3 + 3);
  v24 = *((double *)a3 + 8);
  v25 = v19;
  v26 = -v22;
  if (v24 >= v23 * 0.5)
    v27 = v23 * 0.5;
  else
    v27 = v24;
  if (v27 <= 0.0)
    objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRect:", 0.0, v26, v23, v22);
  else
    objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", 15, 0.0, v26, v23, v22, v27, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  __dst[0] = v57;
  __dst[1] = v58;
  __dst[2] = v59;
  objc_msgSend(v28, "applyTransform:", __dst);
  objc_msgSend(v25, "appendPath:", v28);

  v29 = a3[3];
  __dst[2] = a3[2];
  __dst[3] = v29;
  *(_QWORD *)&__dst[4] = *((_QWORD *)a3 + 8);
  v30 = a3[1];
  __dst[0] = *a3;
  __dst[1] = v30;
  v31 = a3[12];
  __dst[11] = a3[11];
  __dst[12] = v31;
  v32 = a3[14];
  __dst[13] = a3[13];
  __dst[14] = v32;
  v33 = a3[8];
  __dst[7] = a3[7];
  __dst[8] = v33;
  v34 = a3[10];
  __dst[9] = a3[9];
  __dst[10] = v34;
  v35 = a3[6];
  __dst[5] = a3[5];
  __dst[6] = v35;
  v36 = *(_OWORD *)((char *)a3 + 440);
  v37 = *(_OWORD *)((char *)a3 + 472);
  *(_OWORD *)((char *)&__dst[28] + 8) = *(_OWORD *)((char *)a3 + 456);
  *(_OWORD *)((char *)&__dst[29] + 8) = v37;
  v38 = *(_OWORD *)((char *)a3 + 376);
  v39 = *(_OWORD *)((char *)a3 + 408);
  v40 = *(_OWORD *)((char *)a3 + 424);
  *(_OWORD *)((char *)&__dst[24] + 8) = *(_OWORD *)((char *)a3 + 392);
  *(_OWORD *)((char *)&__dst[25] + 8) = v39;
  *(_OWORD *)((char *)&__dst[26] + 8) = v40;
  *(_OWORD *)((char *)&__dst[27] + 8) = v36;
  v41 = *(_OWORD *)((char *)a3 + 312);
  v42 = *(_OWORD *)((char *)a3 + 344);
  v43 = *(_OWORD *)((char *)a3 + 360);
  *(_OWORD *)((char *)&__dst[20] + 8) = *(_OWORD *)((char *)a3 + 328);
  *(_OWORD *)((char *)&__dst[21] + 8) = v42;
  *(_OWORD *)((char *)&__dst[22] + 8) = v43;
  *(_OWORD *)((char *)&__dst[23] + 8) = v38;
  v44 = *(_OWORD *)((char *)a3 + 280);
  v45 = *(_OWORD *)((char *)a3 + 296);
  v46 = *(_OWORD *)((char *)a3 + 248);
  *(_OWORD *)((char *)&__dst[16] + 8) = *(_OWORD *)((char *)a3 + 264);
  *(_OWORD *)((char *)&__dst[17] + 8) = v44;
  *(_QWORD *)&v42 = *((_QWORD *)a3 + 9);
  *(_OWORD *)((char *)&__dst[18] + 8) = v45;
  *(_OWORD *)((char *)&__dst[19] + 8) = v41;
  *(_QWORD *)&v44 = *((_QWORD *)a3 + 30);
  *((_QWORD *)&__dst[30] + 1) = *((_QWORD *)a3 + 61);
  *(_OWORD *)((char *)&__dst[15] + 8) = v46;
  *((_QWORD *)&__dst[4] + 1) = v42;
  *(_QWORD *)&__dst[15] = v44;
  MKArrowAppendCurveToPathWithOptionsAndRadius(v18, 0, (uint64_t)__dst, &v57, 0, -0.785398163, *(double *)&v44);
  v47 = *((double *)a3 + 32);
  memcpy(__dst, a3, sizeof(__dst));
  MKArrowAppendSegmentToPath(v18, (uint64_t)__dst, &v57, v47);
  if (a4)
    v48 = (void *)objc_msgSend(v18, "copy");
  else
    v48 = 0;
  memcpy(__dst, a3, sizeof(__dst));
  MKArrowAppendArrowheadToPathAndReturnMetricsWithStemAdjustment(v18, (uint64_t)__dst, 0, &v57, 0.0);
  objc_msgSend(v18, "bounds");
  v50 = a5 + (a7 - v49) * 0.5;
  v51 = a6 + a8;
  if (a4)
  {
    CGAffineTransformMakeTranslation(&v56, v50, v51);
    objc_msgSend(v48, "applyTransform:", &v56);
    v52 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v52, "appendPath:", v48);
    v53 = objc_retainAutorelease(v52);
    *a4 = v53;

  }
  CGAffineTransformMakeTranslation(&v55, v50, v51);
  objc_msgSend(v18, "applyTransform:", &v55);
  objc_msgSend(v15, "appendPath:", v18);
  CGAffineTransformMakeTranslation(&v54, v50, v51);
  objc_msgSend(v25, "applyTransform:", &v54);
  objc_msgSend(v17, "appendPath:", v25);

}

void MKArrowAppendExitRoadLeftToPathInRect(void *a1, void *a2, const void *a3, _QWORD *a4, double a5, double a6, double a7, double a8)
{
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  CGAffineTransform v23;
  CGAffineTransform v24;
  _BYTE __dst[496];

  v15 = a1;
  v16 = (void *)MEMORY[0x1E0CEA390];
  v17 = a2;
  objc_msgSend(v16, "bezierPath");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPath");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  memcpy(__dst, a3, sizeof(__dst));
  MKArrowAppendExitRoadRightToPathInRect(v18, v19, __dst, a4, a5, a6, a7, a8);
  memset(__dst, 0, 48);
  CGAffineTransformMakeScale((CGAffineTransform *)__dst, -1.0, 1.0);
  v23 = *(CGAffineTransform *)__dst;
  CGAffineTransformTranslate(&v24, &v23, -a7, 0.0);
  *(CGAffineTransform *)__dst = v24;
  if (a4)
  {
    v20 = (void *)*a4;
    v24 = *(CGAffineTransform *)__dst;
    objc_msgSend(v20, "applyTransform:", &v24);
    v21 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v21, "appendPath:", *a4);
    v22 = objc_retainAutorelease(v21);
    *a4 = v22;

  }
  v24 = *(CGAffineTransform *)__dst;
  objc_msgSend(v18, "applyTransform:", &v24);
  v24 = *(CGAffineTransform *)__dst;
  objc_msgSend(v19, "applyTransform:", &v24);
  objc_msgSend(v15, "appendPath:", v18);
  objc_msgSend(v17, "appendPath:", v19);

}

double MKArrowCreateBezierPathsForEitherProceedToRouteOrArrivalWithSizeAndReturnCenter(_QWORD *a1, _QWORD *a2, uint64_t a3, int a4, double a5, CGFloat a6)
{
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  __int128 *v17;
  id v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  __double2 v31;
  double v32;
  double v33;
  double v34;
  double v35;
  __double2 v36;
  void *v37;
  id v38;
  double v40;
  CGAffineTransform t2;
  CGAffineTransform v42;
  CGAffineTransform v43;
  CGAffineTransform v44;
  CGAffineTransform v45;
  CGAffineTransform v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE __dst[496];

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v47 = 0u;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = a6 * 0.245614037;
  v15 = a5 - *(double *)(a3 + 24);
  memset(&v46, 0, sizeof(v46));
  CGAffineTransformMakeTranslation(&v46, v15 * 0.5, a6);
  memset(&v45, 0, sizeof(v45));
  if (a4)
  {
    *(CGAffineTransform *)__dst = v46;
    CGAffineTransformTranslate(&v45, (CGAffineTransform *)__dst, 0.0, -v14);
    v16 = *(double *)(a3 + 56);
    memset(&v44, 0, sizeof(v44));
    *(CGAffineTransform *)__dst = v46;
    CGAffineTransformTranslate(&v44, (CGAffineTransform *)__dst, 0.0, -v16);
    memcpy(__dst, (const void *)a3, sizeof(__dst));
    MKArrowAppendInitialSegmentToPathInvertingCorners(v13, (uint64_t)__dst, &v44, 1, v14);
    memset(&v44, 0, sizeof(v44));
    CGAffineTransformMakeScale(&v44, 1.0, -1.0);
    memset(&v43, 0, sizeof(v43));
    *(CGAffineTransform *)__dst = v44;
    t2 = v46;
    CGAffineTransformConcat(&v42, (CGAffineTransform *)__dst, &t2);
    CGAffineTransformTranslate(&v43, &v42, 0.0, v16);
    memcpy(__dst, (const void *)a3, sizeof(__dst));
    v17 = (__int128 *)&v43;
  }
  else
  {
    v45 = v46;
    memcpy(__dst, (const void *)a3, sizeof(__dst));
    MKArrowAppendInitialSegmentToPathInvertingCorners(v13, (uint64_t)__dst, &v45, 0, a6 * 0.245614037);
    memcpy(__dst, (const void *)a3, sizeof(__dst));
    v17 = (__int128 *)&v45;
  }
  MKArrowAppendArrowheadToPathAndReturnMetricsWithStemAdjustment(v13, (uint64_t)__dst, (uint64_t)&v47, v17, 0.0);
  v18 = objc_retainAutorelease(v13);
  *a2 = v18;
  v19 = *(double *)(a3 + 288);
  v20 = v45.tx + *((double *)&v47 + 1) * v45.c + v45.a * *(double *)&v47;
  v21 = v45.ty + *((double *)&v47 + 1) * v45.d + v45.b * *(double *)&v47 - v19;
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPath");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v45.tx + *((double *)&v48 + 1) * v45.c + v45.a * *(double *)&v48;
  v24 = v45.tx + v45.c * *((double *)&v49 + 1) + v45.a * *(double *)&v49;
  v25 = v45.ty + *((double *)&v48 + 1) * v45.d + v45.b * *(double *)&v48 - v19;
  if (v20 == v23)
    v26 = INFINITY;
  else
    v26 = (v21 - v25) / (v20 - v23);
  v27 = v45.ty + v45.d * *((double *)&v49 + 1) + v45.b * *(double *)&v49 - v19;
  v40 = atan(v26) + 3.14159265;
  if (v20 == v24)
    v28 = INFINITY;
  else
    v28 = (v21 - v27) / (v20 - v24);
  v29 = atan(v28);
  v30 = *(double *)(a3 + 272);
  v31 = __sincos_stret(v29);
  v32 = v24 - v30 * v31.__cosval;
  v33 = v27 - v30 * v31.__sinval;
  objc_msgSend(v22, "moveToPoint:", v23, v25);
  objc_msgSend(v22, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v20, v21, sqrt((v20 - v23) * (v20 - v23) + (v21 - v25) * (v21 - v25)), v40, v29);
  objc_msgSend(v22, "addLineToPoint:", v32, v33);
  v34 = sqrt((v20 - v32) * (v20 - v32) + (v21 - v33) * (v21 - v33));
  objc_msgSend(v22, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v20, v21, v34, v29, v40);
  objc_msgSend(v22, "addLineToPoint:", v23, v25);
  objc_msgSend(v22, "closePath");
  objc_msgSend(v12, "addObject:", v22);
  v35 = v34 - *(double *)(a3 + 280);
  if (*(_BYTE *)(a3 + 296))
  {
    v36 = __sincos_stret(v40);
    objc_msgSend(MEMORY[0x1E0CEA390], "bezierPath");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v37, "moveToPoint:", v20, v21);
    objc_msgSend(v37, "addLineToPoint:", v20 + v35 * v36.__cosval, v21 + v35 * v36.__sinval);
    objc_msgSend(v37, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v20, v21, v35, v40, v29);
    objc_msgSend(v37, "addLineToPoint:", v20, v21);
    objc_msgSend(v37, "closePath");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithOvalInRect:", v20 - v35, v21 - v35, v35 + v35, v35 + v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v12, "addObject:", v37);
  v38 = objc_retainAutorelease(v12);
  *a1 = v38;

  return v20;
}

void MKArrowCreateBezierPathsForProceedToRouteWithSizeAndReturnCenter(_QWORD *a1, _QWORD *a2, void *__src, double a4, CGFloat a5)
{
  _BYTE v9[496];

  memcpy(v9, __src, sizeof(v9));
  MKArrowCreateBezierPathsForEitherProceedToRouteOrArrivalWithSizeAndReturnCenter(a1, a2, (uint64_t)v9, 1, a4, a5);
}

void MKArrowCreateBezierPathsForArrivalWithSizeAndReturnCenter(_QWORD *a1, _QWORD *a2, void *__src, double a4, CGFloat a5)
{
  _BYTE v9[496];

  memcpy(v9, __src, sizeof(v9));
  MKArrowCreateBezierPathsForEitherProceedToRouteOrArrivalWithSizeAndReturnCenter(a1, a2, (uint64_t)v9, 0, a4, a5);
}

void MKArrowCreateBezierPathsForArrivalWithSize(_QWORD *a1, _QWORD *a2, void *__src, double a4, CGFloat a5)
{
  _BYTE v9[496];

  memcpy(v9, __src, sizeof(v9));
  MKArrowCreateBezierPathsForEitherProceedToRouteOrArrivalWithSizeAndReturnCenter(a1, a2, (uint64_t)v9, 0, a4, a5);
}

void MKArrowCreateBezierPathsForProceedToRouteWithSize(_QWORD *a1, _QWORD *a2, void *__src, double a4, CGFloat a5)
{
  _BYTE v9[496];

  memcpy(v9, __src, sizeof(v9));
  MKArrowCreateBezierPathsForEitherProceedToRouteOrArrivalWithSizeAndReturnCenter(a1, a2, (uint64_t)v9, 1, a4, a5);
}

void sub_18B237D14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_18B238224(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18B238720(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_18B23AEA4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18B23AFDC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18B23BF98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t MapKitConfig_GetUserDefaultStringKeysForWatchSync()
{
  return MEMORY[0x1E0C9AA60];
}

uint64_t MapKitConfig_GetConfigStoreStringKeysForWatchSync()
{
  return MEMORY[0x1E0C9AA60];
}

void *_getConfigStoreStringKeysForStateCapture()
{
  return &unk_1E215A120;
}

void _MKGEOAppEnteredBackground()
{
  if ((_geoInForeground & 1) == 0)
    _geoInForeground = 1;
}

void _MKGEOAppEnteredForeground()
{
  id v0;

  if (_geoInForeground == 1)
  {
    _geoInForeground = 0;
    objc_msgSend(MEMORY[0x1E0D27008], "sharedConfiguration");
    v0 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "updateProvidersForCurrentCountry");

  }
}

void sub_18B23E2DC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_18B23E444(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id _routeAttributesForMKDirectionsRequest(void *a1)
{
  id v1;
  id v2;
  _BOOL4 v3;
  int BOOL;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _BYTE *v27;
  uint64_t v28;
  int v29;
  uint64_t *v30;
  uint64_t v32;
  _BYTE v33[3];
  uint64_t v34;
  _BYTE v35[3];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x1E0D274A8]);
  v3 = _MKLinkedOnOrAfterReleaseSet(1283);
  BOOL = GEOConfigGetBOOL();
  if (v3 && BOOL)
  {
    v5 = objc_msgSend(v1, "transportType");
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 == 0xFFFFFFF)
    {
      v7 = GEOGetUserTransportTypePreference();
      if (v7 < 5)
        objc_msgSend(v6, "addObject:", qword_1E20DEE80[v7]);
    }
    else if ((v5 & 1) == 0)
    {
LABEL_13:
      if ((v5 & 2) != 0 && (objc_msgSend(v6, "containsObject:", &unk_1E2159388) & 1) == 0)
        objc_msgSend(v6, "addObject:", &unk_1E2159388);
      if ((v5 & 4) != 0 && (objc_msgSend(v6, "containsObject:", &unk_1E21593A0) & 1) == 0)
        objc_msgSend(v6, "addObject:", &unk_1E21593A0);
      if ((v5 & 8) != 0 && (objc_msgSend(v6, "containsObject:", &unk_1E2159370) & 1) == 0)
        objc_msgSend(v6, "addObject:", &unk_1E2159370);
      if (!objc_msgSend(v6, "count"))
        objc_msgSend(v6, "addObject:", &unk_1E21593B8);
      v8 = (void *)objc_msgSend(v6, "mutableCopy");

      goto LABEL_29;
    }
    if ((objc_msgSend(v6, "containsObject:", &unk_1E21593B8) & 1) == 0)
      objc_msgSend(v6, "addObject:", &unk_1E21593B8);
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v1, "transportType");
  switch(v9)
  {
    case 2:
      v10 = &unk_1E2159388;
      break;
    case 4:
      v10 = &unk_1E21593A0;
      break;
    case 8:
      v10 = &unk_1E2159370;
      break;
    default:
      v10 = &unk_1E21593B8;
      break;
  }
  objc_msgSend(v8, "addObject:", v10);
LABEL_29:
  objc_msgSend(v8, "removeObject:", &unk_1E21593A0);
  objc_msgSend(v8, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "intValue");

  objc_msgSend(v2, "setMainTransportType:", v12);
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v13 = v8;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (!v14)
    goto LABEL_49;
  v15 = v14;
  v16 = *(_QWORD *)v37;
  do
  {
    for (i = 0; i != v15; ++i)
    {
      if (*(_QWORD *)v37 != v16)
        objc_enumerationMutation(v13);
      v18 = objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "intValue");
      if ((_DWORD)v18 != (_DWORD)v12)
        objc_msgSend(v2, "addAdditionalTransportType:", v18);
      if ((_DWORD)v18 == 3)
      {
        v22 = objc_alloc_init(MEMORY[0x1E0D27010]);
        objc_msgSend(v2, "setCyclingOptions:", v22);
      }
      else if ((_DWORD)v18 == 2)
      {
        v22 = objc_alloc_init(MEMORY[0x1E0D276F0]);
        objc_msgSend(v2, "setWalkingOptions:", v22);
      }
      else
      {
        if ((_DWORD)v18)
          continue;
        v19 = objc_alloc_init(MEMORY[0x1E0D26F18]);
        objc_msgSend(v2, "setAutomobileOptions:", v19);

        objc_msgSend(v2, "automobileOptions");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setIncludeHistoricTravelTime:", 1);

        objc_msgSend(v2, "automobileOptions");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setTrafficType:", 3);

        v22 = objc_alloc_init(MEMORY[0x1E0D27688]);
        if (objc_msgSend(v1, "tollPreference") == 1)
          objc_msgSend(v22, "setAvoidTolls:", 1);
        if (objc_msgSend(v1, "highwayPreference") == 1)
          objc_msgSend(v22, "setAvoidHighways:", 1);
        objc_msgSend(v2, "automobileOptions");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setUserPreferences:", v22);

      }
    }
    v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  }
  while (v15);
LABEL_49:

  objc_msgSend(v2, "setTrafficType:", 3);
  objc_msgSend(v2, "setIncludeTrafficAlongRoute:", 1);
  if (objc_msgSend(v1, "_includeRoutePoints"))
    objc_msgSend(v2, "setRoutePointTypeForTransportType:", v12);
  objc_msgSend(v2, "setIncludeHistoricTravelTime:", objc_msgSend(v1, "_includeTravelTimes"));
  objc_msgSend(v2, "setIncludeTrafficIncidents:", objc_msgSend(v1, "_includeTrafficIncidents"));
  objc_msgSend(v1, "_arrivalDate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_departureDate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if ((v24 == 0) == (v25 != 0))
  {
    if (v24)
    {
      v27 = v35;
      objc_msgSend(v24, "timeIntervalSinceReferenceDate");
      v34 = 0;
      v29 = 1;
      v30 = &v34;
      goto LABEL_56;
    }
    if (v25)
    {
      v27 = v33;
      objc_msgSend(v25, "timeIntervalSinceReferenceDate");
      v29 = 0;
      v32 = 0;
      v30 = &v32;
LABEL_56:
      v30[1] = v28;
      *((_DWORD *)v30 + 4) = v29;
      *((_BYTE *)v30 + 20) = 6;
      v27[2] = 0;
      *(_WORD *)v27 = 0;
      objc_msgSend(v2, "setTimepoint:", v32);
    }
  }
  objc_msgSend(v2, "addUiContext:", 3);

  return v2;
}

void sub_18B240B28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  uint64_t v33;

  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 192), 8);
  _Block_object_dispose((const void *)(v33 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_18B242CDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18B245524(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location,id a22)
{
  id *v22;
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a22);
  _Unwind_Resume(a1);
}

id _MKOverlayTileLoader()
{
  if (qword_1EDFB7CB0 != -1)
    dispatch_once(&qword_1EDFB7CB0, &__block_literal_global_91);
  return (id)qword_1EDFB7CB8;
}

void sub_18B2459D0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18B245BAC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18B245D04(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_18B245D90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18B245F74(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18B2460A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_18B2461DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18B246364(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_18B2463E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18B246668(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18B24692C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18B246BD4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18B246C4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)_MKOverlayTileRequester;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_18B246D8C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18B247044(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v3;

  _Unwind_Resume(a1);
}

id RequesterRegistry::lookup(RequesterRegistry *this, unsigned int a2)
{
  std::mutex *v4;
  uint64_t v5;
  _DWORD *v6;
  unsigned int v7;
  BOOL v8;
  uint64_t *v9;
  id WeakRetained;
  uint64_t **v11;
  unsigned int v13;

  v13 = a2;
  v4 = (std::mutex *)((char *)this + 24);
  std::mutex::lock((std::mutex *)((char *)this + 24));
  v5 = *((_QWORD *)this + 1);
  if (!v5)
    goto LABEL_12;
  v6 = (_DWORD *)((char *)this + 8);
  do
  {
    v7 = *(_DWORD *)(v5 + 32);
    v8 = v7 >= a2;
    if (v7 >= a2)
      v9 = (uint64_t *)v5;
    else
      v9 = (uint64_t *)(v5 + 8);
    if (v8)
      v6 = (_DWORD *)v5;
    v5 = *v9;
  }
  while (*v9);
  if (v6 != (_DWORD *)((char *)this + 8) && v6[8] <= a2)
  {
    v11 = std::__tree<std::__value_type<unsigned int,objc_object  {objcproto24_MKOverlayTileDataSource}* {__weak}>,std::__map_value_compare<unsigned int,objc_object  {objcproto24_MKOverlayTileDataSource}* {__weak},std::less<unsigned int>,true>,std::allocator<objc_object  {objcproto24_MKOverlayTileDataSource}* {__weak}>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::piecewise_construct_t const&<>>((uint64_t **)this, a2, &v13);
    WeakRetained = objc_loadWeakRetained((id *)v11 + 5);
  }
  else
  {
LABEL_12:
    WeakRetained = 0;
  }
  std::mutex::unlock(v4);
  return WeakRetained;
}

void sub_18B2471A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18B2472CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_18B2474B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void ___ZN17RequesterRegistry14sharedInstanceEv_block_invoke()
{
  uint64_t v0;

  v0 = operator new();
  *(_QWORD *)(v0 + 8) = 0;
  *(_QWORD *)v0 = v0 + 8;
  *(_QWORD *)(v0 + 16) = 0;
  *(_QWORD *)(v0 + 24) = 850045863;
  *(_OWORD *)(v0 + 32) = 0u;
  *(_OWORD *)(v0 + 48) = 0u;
  *(_OWORD *)(v0 + 64) = 0u;
  *(_OWORD *)(v0 + 76) = 0u;
  qword_1EDFB7CC8 = v0;
  _MKOverlayTileLoader();

}

uint64_t **std::__tree<std::__value_type<unsigned int,objc_object  {objcproto24_MKOverlayTileDataSource}* {__weak}>,std::__map_value_compare<unsigned int,objc_object  {objcproto24_MKOverlayTileDataSource}* {__weak},std::less<unsigned int>,true>,std::allocator<objc_object  {objcproto24_MKOverlayTileDataSource}* {__weak}>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::piecewise_construct_t const&<>>(uint64_t **a1, unsigned int a2, _DWORD *a3)
{
  uint64_t *v5;
  uint64_t **v6;
  uint64_t **v7;
  unsigned int v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t *v11;

  v6 = a1 + 1;
  v5 = a1[1];
  if (v5)
  {
    while (1)
    {
      while (1)
      {
        v7 = (uint64_t **)v5;
        v8 = *((_DWORD *)v5 + 8);
        if (v8 <= a2)
          break;
        v5 = *v7;
        v6 = v7;
        if (!*v7)
          goto LABEL_9;
      }
      if (v8 >= a2)
        break;
      v5 = v7[1];
      if (!v5)
      {
        v6 = v7 + 1;
        goto LABEL_9;
      }
    }
  }
  else
  {
    v7 = a1 + 1;
LABEL_9:
    v9 = (uint64_t *)v7;
    v7 = (uint64_t **)operator new(0x30uLL);
    *((_DWORD *)v7 + 8) = *a3;
    v7[5] = 0;
    *v7 = 0;
    v7[1] = 0;
    v7[2] = v9;
    *v6 = (uint64_t *)v7;
    v10 = (uint64_t *)**a1;
    v11 = (uint64_t *)v7;
    if (v10)
    {
      *a1 = v10;
      v11 = *v6;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], v11);
    a1[2] = (uint64_t *)((char *)a1[2] + 1);
  }
  return v7;
}

void ___ZL22_tileRequesterWorkloopv_block_invoke()
{
  dispatch_workloop_t v0;
  void *v1;

  v0 = dispatch_workloop_create("com.apple.MapKit.MKTileOverlay.Requester");
  v1 = (void *)qword_1EDFB7CD8;
  qword_1EDFB7CD8 = (uint64_t)v0;

}

void ___ZL30_tileRequesterCallbackWorkloopv_block_invoke()
{
  dispatch_workloop_t v0;
  void *v1;

  v0 = dispatch_workloop_create("com.apple.MapKit.MKTileOverlay.Callback");
  v1 = (void *)qword_1EDFB7CE8;
  qword_1EDFB7CE8 = (uint64_t)v0;

}

void sub_18B247B90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_18B247C4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_18B24A1BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

void sub_18B24CF00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  id *v24;
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *_MKPlaceCardFormattedStringForTimeInterval()
{
  void *v0;
  void *v1;
  int v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  __CFString *v6;

  if (_MKPlaceCardUseSmallerFont())
  {
    v0 = (void *)MEMORY[0x1E0CEA5E8];
    v1 = (void *)MEMORY[0x1E0CEA5F0];
    v2 = _MKPlaceCardUseSmallerFont();
    v3 = (_QWORD *)MEMORY[0x1E0CEB558];
    if (!v2)
      v3 = (_QWORD *)MEMORY[0x1E0CEB588];
    objc_msgSend(v1, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *v3, 2, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "fontWithDescriptor:size:", v4, 0.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "pointSize");
    _MKPlaceCardUseSmallerFont();

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "_navigation_stringWithSeconds:andAbbreviationType:");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    v6 = &stru_1E20DFC00;
  return v6;
}

void sub_18B2501C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_18B25074C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18B250860(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18B250958(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_18B250A48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_18B250B30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_18B250C20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_18B250D18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_18B250E38(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18B250EB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_18B250FD4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18B25149C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18B251BBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18B252534(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18B25276C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

CGFloat MKRoadWidthAtZoomScale(MKZoomScale zoomScale)
{
  uint64_t v2;
  uint64_t v3;

  v2 = vcvtmd_s64_f64(log2(zoomScale) + 0.5);
  if (v2 >= -21)
    v3 = (v2 & (v2 >> 63)) + 21;
  else
    v3 = 0;
  return __const_MKRoadWidthAtZoomScale_kLineWidthForZoomLevel[v3] / zoomScale;
}

void sub_18B254080(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18B254348(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_18B2547B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *__p)
{
  void *v30;

  _Unwind_Resume(a1);
}

void sub_18B254930(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21)
{
  _Block_object_dispose(&a14, 8);
  if (__p)
  {
    a21 = (uint64_t)__p;
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_18B254A90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18B254BE0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18B254CA4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18B254DB0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18B254ED4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18B254FF8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18B2550C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18B2551C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

CGPath *_MKPolygonRendererCreateStrokeClipPathForPolygon(void *a1, double a2, double a3, double a4, double a5)
{
  id v9;
  unint64_t v10;
  id v11;
  uint64_t v12;
  CGPath *Mutable;
  double *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  unint64_t v21;
  BOOL v22;
  double v23;
  unint64_t v24;
  double *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;

  v9 = a1;
  v10 = objc_msgSend(v9, "pointCount");
  v11 = objc_retainAutorelease(v9);
  v12 = objc_msgSend(v11, "points");
  if (v10 < 3)
  {
    Mutable = 0;
    goto LABEL_18;
  }
  v14 = (double *)v12;
  objc_msgSend(v11, "_mapPointsLength");
  v16 = v15;
  Mutable = CGPathCreateMutable();
  v17 = *v14 - a2;
  v18 = v14[1] - a3;
  CGPathMoveToPoint(Mutable, 0, v17, v18);
  v20 = (uint64_t)&v14[2 * v10];
  v19 = *(double *)(v20 - 8);
  LODWORD(v20) = *v14 != *(double *)(v20 - 16);
  if (v14[1] == v19)
    v20 = v20;
  else
    v20 = 1;
  v21 = v10 + v20;
  if (v10 + v20 >= 2)
  {
    v35 = v16 * a4;
    v36 = a5;
    v34 = v16 * a5;
    v22 = a4 == 0.0;
    v23 = 0.0;
    v24 = 1;
    v37 = a2;
    v38 = a3;
    do
    {
      v25 = &v14[2 * (v24 % v10)];
      v26 = *v25 - a2;
      v27 = v25[1] - a3;
      v28 = v26 - v17;
      v29 = v27 - v18;
      v30 = sqrt(v28 * v28 + v29 * v29);
      v31 = v23 + v30;
      if (!v22)
      {
        if (v31 <= v35)
        {
          v22 = 0;
          goto LABEL_15;
        }
        CGPathMoveToPoint(Mutable, 0, v17 + v28 * ((v35 - v23) / v30), v18 + v29 * ((v35 - v23) / v30));
        v31 = v23 + v30;
      }
      if (v36 < 1.0 && v31 >= v34)
      {
        CGPathAddLineToPoint(Mutable, 0, v17 + v28 * ((v34 - v23) / v30), v18 + v29 * ((v34 - v23) / v30));
        break;
      }
      v32 = v31;
      CGPathAddLineToPoint(Mutable, 0, v26, v27);
      v31 = v32;
      v22 = 1;
LABEL_15:
      ++v24;
      v18 = v27;
      v17 = v26;
      v23 = v31;
      a2 = v37;
      a3 = v38;
    }
    while (v21 != v24);
  }
LABEL_18:

  return Mutable;
}

void sub_18B2571B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_18B257270(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_18B259F78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18B25A858(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18B25A990(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18B25C8E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_18B25CA88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void MKDistanceBetweenPointAndRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  CGPoint v12;
  CGRect v13;
  CGRect v14;
  CGRect v15;

  v13.origin.x = a3;
  v13.origin.y = a4;
  v13.size.width = a5;
  v13.size.height = a6;
  v12.x = a1;
  v12.y = a2;
  if (!CGRectContainsPoint(v13, v12))
  {
    v14.origin.x = a3;
    v14.origin.y = a4;
    v14.size.width = a5;
    v14.size.height = a6;
    CGRectGetMaxX(v14);
    v15.origin.x = a3;
    v15.origin.y = a4;
    v15.size.width = a5;
    v15.size.height = a6;
    CGRectGetMaxY(v15);
  }
}

double MKClosestMapPointInLineSegmentFromMapPoint(double result, double a2, double a3, double a4, double a5, double a6)
{
  double v6;
  double v7;
  double v8;

  v6 = a3 - result;
  v7 = a4 - a2;
  if (a3 - result != 0.0 || v7 != 0.0)
  {
    v8 = (v7 * (a6 - a2) + (a5 - result) * v6) / (v7 * v7 + v6 * v6);
    if (v8 >= 0.0)
    {
      if (v8 <= 1.0)
        return result + v8 * v6;
      else
        return a3;
    }
  }
  return result;
}

void MKCoordinatesForRegion(CLLocationCoordinate2D *a1, CLLocationCoordinate2D *a2)
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v9;
  double v10;
  MKMapPoint v11;

  GEOMapRectForCoordinateRegion();
  if (v4 == INFINITY && v5 == INFINITY)
  {
    *a1 = (CLLocationCoordinate2D)MKCoordinateInvalid;
    *a2 = (CLLocationCoordinate2D)MKCoordinateInvalid;
  }
  else
  {
    v9 = v4 + v6;
    v10 = v5 + v7;
    *a1 = MKCoordinateForMapPoint(*(MKMapPoint *)&v4);
    v11.x = v9;
    v11.y = v10;
    *a2 = MKCoordinateForMapPoint(v11);
  }
}

long double MKZoomLevelForScaleF(long double a1)
{
  long double result;

  result = log2(a1) + 21.0;
  if (result < 0.0)
    return 0.0;
  return result;
}

long double MKZoomScaleForZoomLevelF(double a1)
{
  return 1.0 / exp2(21.0 - a1);
}

CLLocationDistance MKMetersPerMapPointAtLatitude(CLLocationDegrees latitude)
{
  double v1;

  GEOMapPointsPerMeterAtLatitude();
  return 1.0 / v1;
}

MKMapRect MKMapRectInset(MKMapRect rect, double dx, double dy)
{
  double y;
  double v4;
  double v6;

  y = rect.origin.y;
  v4 = INFINITY;
  if (rect.origin.x == INFINITY && y == INFINITY)
  {
    v6 = INFINITY;
  }
  else
  {
    v6 = rect.origin.x + dx;
    v4 = y + dy;
    rect.size.width = rect.size.width - dx * 2.0;
    rect.size.height = rect.size.height - dy * 2.0;
  }
  rect.origin.y = v4;
  rect.origin.x = v6;
  return rect;
}

MKMapRect MKMapRectOffset(MKMapRect rect, double dx, double dy)
{
  _BOOL4 v3;
  _BOOL4 v4;
  double v5;
  double v6;
  double v7;

  v3 = rect.origin.x == INFINITY;
  v4 = rect.origin.y == INFINITY;
  if (v3 && v4)
    dx = -0.0;
  v5 = rect.origin.x + dx;
  if (v3 && v4)
    v6 = -0.0;
  else
    v6 = dy;
  v7 = rect.origin.y + v6;
  rect.origin.y = v7;
  rect.origin.x = v5;
  return rect;
}

void MKMapRectDivide(MKMapRect rect, MKMapRect *slice, MKMapRect *remainder, double amount, CGRectEdge edge)
{
  MKMapSize size;
  double width;
  double v8;
  double v9;

  if (rect.origin.x == INFINITY && rect.origin.y == INFINITY)
  {
    *slice = MKMapRectNull;
    *remainder = MKMapRectNull;
  }
  else
  {
    *remainder = rect;
    size = remainder->size;
    slice->origin = remainder->origin;
    slice->size = size;
    width = 0.0;
    if (amount >= 0.0)
      width = amount;
    if ((edge | 2) == 2)
    {
      if (width > rect.size.width)
        width = rect.size.width;
      slice->size.width = width;
      v8 = remainder->size.width - width;
      remainder->size.width = v8;
      if (edge)
        slice->origin.x = v8 + slice->origin.x;
      else
        remainder->origin.x = width + remainder->origin.x;
    }
    else
    {
      if (width > rect.size.height)
        width = rect.size.height;
      slice->size.height = width;
      v9 = remainder->size.height - width;
      remainder->size.height = v9;
      if (edge == CGRectMinYEdge)
        remainder->origin.y = width + remainder->origin.y;
      else
        slice->origin.y = v9 + slice->origin.y;
    }
  }
}

BOOL MKMapRectSpans180thMeridian(MKMapRect rect)
{
  double v1;

  v1 = rect.origin.x + rect.size.width;
  if (rect.origin.x < 0.0 && v1 > 0.0)
    return 1;
  if (v1 <= 268435456.0)
    return 0;
  return rect.origin.x < 268435456.0;
}

MKMapRect MKMapRectRemainder(MKMapRect rect)
{
  double x;
  double v2;
  double v3;
  double v4;

  x = rect.origin.x;
  if (rect.origin.x >= 0.0)
  {
    v4 = rect.origin.x + rect.size.width;
    if (v4 <= 268435456.0)
    {
      v3 = 0.0;
      v2 = INFINITY;
      rect.origin.y = INFINITY;
      rect.size.height = 0.0;
    }
    else
    {
      v3 = v4 + -268435456.0;
      v2 = 0.0;
    }
  }
  else
  {
    v2 = rect.origin.x + 268435456.0;
    v3 = fabs(x);
  }
  rect.size.width = v3;
  rect.origin.x = v2;
  return rect;
}

BOOL MKMapRectContainsRectWrappingMeridian(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  double v14;
  _BOOL8 result;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  BOOL v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  BOOL v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double rect2;
  double x;
  double height;
  double width;
  double y;
  double rect1;
  MKMapRect v56;
  MKMapRect v57;
  MKMapRect v58;
  MKMapRect v59;
  MKMapRect v60;
  MKMapRect v61;
  MKMapRect v62;
  MKMapRect v63;
  MKMapRect v64;
  MKMapRect v65;
  MKMapRect v66;

  if (a5 == INFINITY && a6 == INFINITY)
    return 1;
  if (a1 == INFINITY && a2 == INFINITY)
    return 0;
  v14 = a6;
  if (MKMapRectContainsRect(*(MKMapRect *)&a1, *(MKMapRect *)&a5))
    return 1;
  rect1 = a8;
  v19 = a1 + a3;
  if (a1 < 0.0 && v19 > 0.0 || (result = 0, a1 < 268435456.0) && v19 > 268435456.0)
  {
    v63.size.width = 268435456.0;
    v63.origin.x = 0.0;
    v63.origin.y = 0.0;
    v56.origin.x = a1;
    v56.origin.y = a2;
    v56.size.width = a3;
    v56.size.height = a4;
    v63.size.height = 268435456.0;
    v57 = MKMapRectIntersection(v56, v63);
    x = v57.origin.x;
    height = v57.size.height;
    width = v57.size.width;
    y = v57.origin.y;
    v20 = INFINITY;
    v21 = v19 + -268435456.0;
    v22 = 0.0;
    if (v19 > 268435456.0)
      v23 = 0.0;
    else
      v23 = INFINITY;
    if (v19 <= 268435456.0)
      v21 = 0.0;
    else
      v20 = a2;
    if (v19 > 268435456.0)
      v22 = a4;
    v24 = fabs(a1);
    v25 = a1 < 0.0;
    if (a1 < 0.0)
      v26 = a1 + 268435456.0;
    else
      v26 = v23;
    if (a1 < 0.0)
      v27 = a2;
    else
      v27 = v20;
    if (v25)
      v28 = v24;
    else
      v28 = v21;
    if (v25)
      v29 = a4;
    else
      v29 = v22;
    v64.size.width = 268435456.0;
    v64.origin.x = 0.0;
    v64.origin.y = 0.0;
    v58.origin.x = a5;
    v58.origin.y = v14;
    v58.size.width = a7;
    v58.size.height = rect1;
    v64.size.height = 268435456.0;
    v59 = MKMapRectIntersection(v58, v64);
    v30 = v59.origin.x;
    v31 = v59.origin.y;
    v32 = v59.size.width;
    v33 = v59.size.height;
    v48 = v28;
    v49 = v29;
    if (a5 >= 0.0)
    {
      rect2 = 0.0;
      if (a5 + a7 <= 268435456.0)
      {
        v34 = INFINITY;
        v14 = INFINITY;
        rect1 = 0.0;
      }
      else
      {
        rect2 = a5 + a7 + -268435456.0;
        v34 = 0.0;
      }
    }
    else
    {
      v34 = a5 + 268435456.0;
      rect2 = fabs(a5);
    }
    v60.size.height = height;
    v60.origin.x = x;
    v60.size.width = width;
    v60.origin.y = y;
    v35 = v30;
    v36 = v31;
    v37 = v32;
    v38 = v33;
    v39 = MKMapRectContainsRect(v60, *(MKMapRect *)(&v31 - 1));
    if (v34 == INFINITY && v14 == INFINITY)
    {
      if (v39)
        return 1;
      v40 = v26;
      v41 = v48;
      v42 = v27;
      v43 = v49;
      v44 = v30;
      v45 = v36;
      v46 = v37;
      v47 = v38;
      return MKMapRectContainsRect(*(MKMapRect *)&v40, *(MKMapRect *)&v44);
    }
    if (v39)
      goto LABEL_48;
    v61.origin.x = x;
    v61.size.width = width;
    v61.origin.y = y;
    v61.size.height = height;
    v65.origin.x = v34;
    v65.origin.y = v14;
    v65.size.width = rect2;
    v65.size.height = rect1;
    result = MKMapRectContainsRect(v61, v65);
    if (result)
    {
LABEL_48:
      v66.origin.x = v30;
      v62.origin.x = v26;
      v62.origin.y = v27;
      v62.size.width = v48;
      v62.size.height = v49;
      v66.origin.y = v36;
      v66.size.width = v37;
      v66.size.height = v38;
      if (MKMapRectContainsRect(v62, v66))
        return 1;
      v40 = v26;
      v42 = v27;
      v47 = rect1;
      v41 = v48;
      v43 = v49;
      v44 = v34;
      v45 = v14;
      v46 = rect2;
      return MKMapRectContainsRect(*(MKMapRect *)&v40, *(MKMapRect *)&v44);
    }
  }
  return result;
}

BOOL MKMapRectIntersectsMapRectWrappingMeridian(double a1, double a2, double width, double a4, double a5, double a6, double a7, double a8)
{
  double v8;
  double v10;
  double v11;
  double v17;
  _BOOL8 result;
  double v19;
  double x;
  double y;
  double height;
  double v23;
  double v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  char v28;
  double *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  char v34;
  char v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  MKMapRect v42;
  double v43;
  double v44;
  double v45;
  double v46;
  _QWORD v47[9];
  MKMapRect v48;
  MKMapRect v49;
  MKMapRect v50;
  MKMapRect v51;
  MKMapRect v52;
  MKMapRect v53;
  MKMapRect v54;

  v8 = a1;
  v47[8] = *MEMORY[0x1E0C80C00];
  if (a1 == INFINITY && a2 == INFINITY)
    return 0;
  v10 = a6;
  v11 = a5;
  if (a5 == INFINITY && a6 == INFINITY)
    return 0;
  v17 = a2;
  if (MKMapRectIntersectsRect(*(MKMapRect *)&a1, *(MKMapRect *)&a5))
    return 1;
  v19 = v8 + width;
  if ((v8 >= 0.0 || v19 <= 0.0) && (v8 >= 268435456.0 || v19 <= 268435456.0))
  {
    v23 = width;
    height = a4;
    y = v17;
    x = v8;
  }
  else
  {
    v40 = v8 + width;
    v53.size.width = 268435456.0;
    v53.origin.x = 0.0;
    v53.origin.y = 0.0;
    v48.origin.x = v8;
    v48.origin.y = v17;
    v48.size.width = width;
    v48.size.height = a4;
    v53.size.height = 268435456.0;
    v49 = MKMapRectIntersection(v48, v53);
    x = v49.origin.x;
    y = v49.origin.y;
    width = v49.size.width;
    height = v49.size.height;
    if (v8 >= 0.0)
    {
      if (v40 <= 268435456.0)
      {
        v17 = INFINITY;
        a4 = 0.0;
        v8 = INFINITY;
        v23 = 0.0;
      }
      else
      {
        v23 = v40 + -268435456.0;
        v8 = 0.0;
      }
    }
    else
    {
      v23 = fabs(v8);
      v8 = v8 + 268435456.0;
    }
  }
  v24 = v11 + a7;
  if ((v11 >= 0.0 || v24 <= 0.0) && (v11 >= 268435456.0 || v24 <= 268435456.0))
  {
    v51.size.height = a8;
    v51.size.width = a7;
    v51.origin.y = v10;
    v51.origin.x = v11;
  }
  else
  {
    v36 = v11 + a7;
    v37 = x;
    v38 = y;
    v39 = height;
    v41 = v23;
    v54.size.width = 268435456.0;
    v54.origin.x = 0.0;
    v54.origin.y = 0.0;
    v50.origin.x = v11;
    v50.origin.y = v10;
    v50.size.width = a7;
    v50.size.height = a8;
    v54.size.height = 268435456.0;
    v51 = MKMapRectIntersection(v50, v54);
    if (v11 >= 0.0)
    {
      if (v36 > 268435456.0)
      {
        a7 = v36 + -268435456.0;
      }
      else
      {
        a8 = 0.0;
        a7 = 0.0;
      }
      if (v36 > 268435456.0)
      {
        v11 = 0.0;
      }
      else
      {
        v10 = INFINITY;
        v11 = INFINITY;
      }
    }
    else
    {
      a7 = fabs(v11);
      v11 = v11 + 268435456.0;
    }
    height = v39;
    v23 = v41;
    x = v37;
    y = v38;
  }
  v25 = 0;
  *(double *)v47 = x;
  *(double *)&v47[1] = y;
  *(double *)&v47[2] = width;
  *(double *)&v47[3] = height;
  *(double *)&v47[4] = v8;
  *(double *)&v47[5] = v17;
  *(double *)&v47[6] = v23;
  *(double *)&v47[7] = a4;
  v42 = v51;
  v43 = v11;
  v44 = v10;
  v26 = 1;
  v45 = a7;
  v46 = a8;
LABEL_38:
  v27 = 0;
  v28 = v26;
  v29 = (double *)&v47[4 * v25];
  v30 = *v29;
  v31 = v29[1];
  v32 = v29[2];
  v33 = v29[3];
  v34 = 1;
  while (1)
  {
    v35 = v34;
    v52.origin.x = v30;
    v52.origin.y = v31;
    v52.size.width = v32;
    v52.size.height = v33;
    result = MKMapRectIntersectsRect(v52, *(&v42 + v27));
    if (result)
      return result;
    v34 = 0;
    v27 = 1;
    if ((v35 & 1) == 0)
    {
      v26 = 0;
      v25 = 1;
      if ((v28 & 1) != 0)
        goto LABEL_38;
      return result;
    }
  }
}

double MKMapRectBoundingMapPoints(uint64_t a1, uint64_t a2)
{
  double *v2;
  double v3;
  double v4;
  double v5;
  double result;
  double v7;
  double v8;

  if (!a2)
    return INFINITY;
  v2 = (double *)(a1 + 8);
  v3 = INFINITY;
  v4 = -INFINITY;
  v5 = -INFINITY;
  result = INFINITY;
  do
  {
    v7 = *(v2 - 1);
    v8 = *v2;
    if (v7 < result)
      result = *(v2 - 1);
    if (v8 < v3)
      v3 = *v2;
    if (v7 > v5)
      v5 = *(v2 - 1);
    if (v8 > v4)
      v4 = *v2;
    v2 += 2;
    --a2;
  }
  while (a2);
  return result;
}

BOOL _MKPolylineAddToPath(CGPath *a1, double *a2, unint64_t a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  unint64_t v10;
  BOOL v19;
  _BOOL4 v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  BOOL v27;
  double *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  char v36;
  double v37;
  double *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  CGPath *v46;
  double v48;
  double v49;
  double v50;
  double v51;

  v10 = a3 - 2;
  if (a3 < 2)
    return a3 > 1;
  v19 = a7 == 0.0;
  v20 = a8 < 1.0 || a7 > 0.0;
  v21 = *a2 - a4;
  v22 = a2[1] - a5;
  CGPathMoveToPoint(a1, 0, v21, v22);
  v23 = a7 * a9;
  v50 = a8 * a9;
  v51 = a7 * a9;
  v24 = a8;
  v25 = 0.0;
  v48 = a9;
  v49 = v24;
  if (a3 - 1 < 2)
  {
    v32 = v22;
    v31 = v21;
    v30 = 1.0;
    goto LABEL_28;
  }
  v26 = 5.0 / a6 * (5.0 / a6);
  v27 = v24 >= 1.0;
  v28 = a2 + 2;
  v29 = 0.0;
  v30 = 1.0;
  while (1)
  {
    v31 = *v28 - a4;
    v32 = v28[1] - a5;
    if (v20)
      v25 = v25
          + sqrt((v31 - (*(v28 - 2) - a4)) * (v31 - (*(v28 - 2) - a4))+ (v32 - (*(v28 - 1) - a5)) * (v32 - (*(v28 - 1) - a5)));
    v33 = v31 - v21;
    v34 = v32 - v22;
    if (v33 * v33 + v34 * v34 >= v26)
      break;
    v32 = v22;
    v31 = v21;
LABEL_24:
    v28 += 2;
    v21 = v31;
    v22 = v32;
    if (!--v10)
      goto LABEL_28;
  }
  if (v19)
  {
    v19 = 1;
  }
  else if (v29 >= v23 || v25 < v23)
  {
    v19 = 0;
    if (v25 < v23)
    {
LABEL_23:
      v29 = v25;
      goto LABEL_24;
    }
  }
  else
  {
    v35 = (v23 - v29) / (v25 - v29);
    v21 = v21 + v33 * v35;
    v22 = v22 + v34 * v35;
    CGPathMoveToPoint(a1, 0, v21, v22);
    v19 = 1;
    v29 = v51;
  }
  v36 = v29 >= v50 || v27;
  if ((v36 & 1) != 0 || v25 < v50)
  {
    CGPathAddLineToPoint(a1, 0, v31, v32);
    v30 = 1.0;
    v23 = v51;
    goto LABEL_23;
  }
  v37 = (v50 - v29) / (v25 - v29);
  v31 = v21 + (v31 - v21) * v37;
  v32 = v22 + (v32 - v22) * v37;
  CGPathAddLineToPoint(a1, 0, v31, v32);
  v30 = 1.0;
  v23 = v51;
  v25 = v50;
LABEL_28:
  v38 = &a2[2 * a3 - 2];
  v39 = *v38 - a4;
  v40 = v38[1] - a5;
  if (v49 >= v30)
  {
    if (v19)
    {
      v46 = a1;
      v44 = v39;
      v45 = v40;
      goto LABEL_35;
    }
  }
  else
  {
    v41 = v50;
    if (v25 < v50)
    {
      if (!v19)
      {
        v42 = (v23 - v25) / (v48 - v25);
        v31 = v31 + (v39 - v31) * v42;
        v32 = v32 + (v40 - v32) * v42;
        CGPathMoveToPoint(a1, 0, v31, v32);
        v41 = v50;
        v25 = v51;
      }
      v43 = (v41 - v25) / (v48 - v25);
      v44 = v31 + (v39 - v31) * v43;
      v45 = v32 + (v40 - v32) * v43;
      v46 = a1;
LABEL_35:
      CGPathAddLineToPoint(v46, 0, v44, v45);
    }
  }
  return a3 > 1;
}

uint64_t _MKMapRectThatFits(double a1, double a2, double a3, double a4, double a5, double a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, __int128 a15, uint64_t a16, uint64_t a17)
{
  unint64_t v23;

  v23 = +[MKMapView minZoomLevelForMapType:viewSize:](MKMapView, "minZoomLevelForMapType:viewSize:", 0, a5, a6);
  return +[MKMapView _mapRectThatFitsViewBounds:mapRect:viewInsets:edgePadding:minZoomLevel:maxZoomLevel:snapToZoomLevel:](MKMapView, "_mapRectThatFitsViewBounds:mapRect:viewInsets:edgePadding:minZoomLevel:maxZoomLevel:snapToZoomLevel:", 0, 0.0, 0.0, a5, a6, a1, a2, a3, a4, *MEMORY[0x1E0CEB4B0], *(_QWORD *)(MEMORY[0x1E0CEB4B0] + 8), *(_QWORD *)(MEMORY[0x1E0CEB4B0] + 16), *(_QWORD *)(MEMORY[0x1E0CEB4B0] + 24), a15, a16, a17, (double)v23,
           0x4035000000000000);
}

long double MKMapRectMakeWithZoomLevel(double a1, double a2, double a3, double a4)
{
  return a1 - a4 / (1.0 / exp2(21.0 - a3)) * 0.5;
}

double MKCoordinateRegionMakeWithZoomLevel(double a1, double a2, double a3, double a4, double a5)
{
  double v8;
  double v9;
  double v10;
  long double v11;
  double result;
  MKMapRect v13;

  v8 = MKTilePointForCoordinate(a1, a2, 21.0);
  v10 = v9;
  v11 = 1.0 / exp2(21.0 - a3);
  v13.size.width = a4 / v11;
  v13.size.height = a5 / v11;
  v13.origin.x = v8 - a4 / v11 * 0.5;
  v13.origin.y = v10 - v13.size.height * 0.5;
  *(_QWORD *)&result = (unint64_t)MKCoordinateRegionForMapRect(v13);
  return result;
}

void MKDirectionBetween(double a1, double a2, double a3, double a4)
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  long double v16;

  v6 = MKTilePointForCoordinate(a1, a2, 21.0);
  v8 = v7;
  v9 = MKTilePointForCoordinate(a3, a4, 21.0);
  v11 = v10;
  v12 = v9 - v6;
  v13 = v8 - v11;
  if ((v8 - v11 >= 0.0000000037252903 || v13 <= -0.0000000037252903)
    && (v12 >= 0.0000000037252903 || v12 <= -0.0000000037252903))
  {
    v16 = 1.57079633 - atan2(v13, v12);
    fmod(v16, 6.28318531);
  }
}

id _accuracyRadiusAnimation(uint64_t a1, void *a2, void *a3, void *a4)
{
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0CD2798];
  v8 = a4;
  v9 = a3;
  v10 = a2;
  objc_msgSend(v7, "animationWithKeyPath:", a1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  v14[1] = v10;
  v14[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setValues:", v12);
  objc_msgSend(v11, "setKeyTimes:", v8);

  return v11;
}

uint64_t MKFormattedStringOptionsMakeDefault@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_BYTE *)a1 = 1;
  *(_DWORD *)(a1 + 15) = 0;
  *(_BYTE *)(a1 + 18) = MKApplicationLayoutDirectionIsRightToLeft();
  result = +[MKTransitItemReferenceDateUpdater referenceDateAsTimeInterval](MKTransitItemReferenceDateUpdater, "referenceDateAsTimeInterval");
  *(_QWORD *)(a1 + 24) = v3;
  return result;
}

id MKTransitDepartureColorForThemeWithLiveStatus(void *a1, uint64_t a2)
{
  void *v2;
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a1;
  v5 = v4;
  if ((unint64_t)(a2 - 3) < 3)
  {
    objc_msgSend(v4, "transitDelayedTextColor");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if ((unint64_t)(a2 - 1) < 2)
  {
    objc_msgSend(v4, "transitOntimeTextColor");
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v2 = (void *)v6;
    goto LABEL_8;
  }
  if (!a2)
  {
    objc_msgSend(v4, "lightTextColor");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
LABEL_8:

  return v2;
}

id MKTransitLiveDepartureColorForLiveStatus(uint64_t a1)
{
  void *v2;
  void *v3;

  +[MKInfoCardThemeManager currentTheme](MKInfoCardThemeManager, "currentTheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MKTransitDepartureColorForThemeWithLiveStatus(v2, a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id MKTransitLiveDepartureColorForViewWithLiveStatus(void *a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "mk_theme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MKTransitDepartureColorForThemeWithLiveStatus(v3, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void sub_18B2655E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18B265D4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18B266CFC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18B267418(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18B267460(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18B2674D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MKTileOverlay;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_18B26761C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void fillTemplate(NSMutableString *a1, NSString *a2, uint64_t a3)
{
  NSString *v5;
  void *v6;
  NSMutableString *v7;

  v7 = a1;
  v5 = a2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableString replaceOccurrencesOfString:withString:options:range:](v7, "replaceOccurrencesOfString:withString:options:range:", v5, v6, 0, 0, -[NSMutableString length](v7, "length"));

}

{
  NSString *v5;
  void *v6;
  NSMutableString *v7;

  v7 = a1;
  v5 = a2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableString replaceOccurrencesOfString:withString:options:range:](v7, "replaceOccurrencesOfString:withString:options:range:", v5, v6, 0, 0, -[NSMutableString length](v7, "length"));

}

void sub_18B2676D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18B267820(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  _Unwind_Resume(a1);
}

void sub_18B2678F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_18B267B14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_18B267C08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_18B267D68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18B267DB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18B267E9C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_18B268258(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_18B2682E8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18B2684B4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

double mapRectContainingMapItems(void *a1, double a2, double a3)
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t i;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  if (objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "_venueFeatureType"))
    {
      objc_msgSend(v6, "_coordinate");
      v8 = v7;
      v10 = v9;
      GEOConfigGetDouble();
      MKCoordinateRegionMakeWithZoomLevel(v8, v10, v11, a2, a3);
      GEOMapRectForCoordinateRegion();
LABEL_42:
      v16 = v12;
      goto LABEL_43;
    }
    objc_msgSend(v6, "_displayMapRegion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v6, "_displayMapRegion");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      GEOMapRectForMapRegion();
      v16 = v15;

LABEL_43:
      goto LABEL_44;
    }

  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v17 = v5;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v38;
    v21 = 0.0;
    v22 = 9.22337204e18;
    v23 = 0.0;
    v24 = 9.22337204e18;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v38 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "_coordinate", (_QWORD)v37);
        v28 = MKTilePointForCoordinate(v26, v27, 21.0);
        if (v24 >= v28)
          v24 = v28;
        if (v22 >= v29)
          v22 = v29;
        if (v21 <= v28)
          v21 = v28;
        if (v23 <= v29)
          v23 = v29;
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v19);
  }
  else
  {
    v21 = 0.0;
    v22 = 9.22337204e18;
    v23 = 0.0;
    v24 = 9.22337204e18;
  }

  if (v24 <= v21)
    v30 = v21;
  else
    v30 = v24;
  if (v24 >= v21)
    v31 = v21;
  else
    v31 = v24;
  if (v30 - v31 <= 0.0
    || (v22 <= v23 ? (v32 = v23) : (v32 = v22), v22 >= v23 ? (v33 = v23) : (v33 = v22), v32 - v33 <= 0.0))
  {
    objc_msgSend(v17, "firstObject", (_QWORD)v37);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_coordinate");
    v12 = MKMapRectMakeWithRadialDistance(v34, v35, 100.0);
    goto LABEL_42;
  }
  if (v24 == INFINITY && v22 == INFINITY)
    v16 = INFINITY;
  else
    v16 = v24 + 0.0;
LABEL_44:

  return v16;
}

void sub_18B2695EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18B26A0B0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18B26A254(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11)
{
  void *v11;
  void *v12;
  void *v13;
  std::mutex *v14;

  std::mutex::unlock(v14);

  _Unwind_Resume(a1);
}

uint64_t geo::_retain_ptr<NSDictionary * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::~_retain_ptr(uint64_t a1)
{
  *(_QWORD *)a1 = &off_1E20D6608;

  return a1;
}

uint64_t geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::~_retain_ptr(uint64_t a1)
{
  *(_QWORD *)a1 = &off_1E20D6628;

  return a1;
}

void sub_18B26A644(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location, uint64_t (**a11)(), void *a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  std::mutex *v16;

  std::mutex::unlock(v16);
  objc_storeWeak(&location, 0);
  objc_destroyWeak(&location);
  a11 = &off_1E20D6628;

  _Unwind_Resume(a1);
}

void sub_18B26A6D4()
{
  JUMPOUT(0x18B26A6C0);
}

void sub_18B26A948(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18B26AA50(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void std::__hash_table<std::__hash_value_type<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__list_iterator<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerStrongReferenceTag,64ul,2097152ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,std::__unordered_map_hasher<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__hash_value_type<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__list_iterator<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerStrongReferenceTag,64ul,2097152ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,true>,std::__unordered_map_equal<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__hash_value_type<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__list_iterator<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerStrongReferenceTag,64ul,2097152ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,true>,std::allocator<std::__hash_value_type<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__list_iterator<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerStrongReferenceTag,64ul,2097152ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>>>::__deallocate_node(void *a1)
{
  void *v1;
  void *v2;

  if (a1)
  {
    v1 = a1;
    do
    {
      v2 = *(void **)v1;
      *((_QWORD *)v1 + 2) = &off_1E20D6628;

      operator delete(v1);
      v1 = v2;
    }
    while (v2);
  }
}

_QWORD *std::__list_imp<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerStrongReferenceTag,64ul,2097152ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>>::clear(_QWORD *result)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  if (result[2])
  {
    v1 = result;
    result = (_QWORD *)result[1];
    v2 = *v1;
    v3 = *result;
    *(_QWORD *)(v3 + 8) = *(_QWORD *)(*v1 + 8);
    **(_QWORD **)(v2 + 8) = v3;
    v1[2] = 0;
    if (result != v1)
    {
      do
      {
        v4 = (_QWORD *)result[1];
        std::__list_imp<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerStrongReferenceTag,64ul,2097152ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>>::__delete_node[abi:ne180100]<>((uint64_t)result);
        result = v4;
      }
      while (v4 != v1);
    }
  }
  return result;
}

void std::__list_imp<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerStrongReferenceTag,64ul,2097152ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>>::__delete_node[abi:ne180100]<>(uint64_t a1)
{
  *(_QWORD *)(a1 + 56) = &off_1E20D6608;

  *(_QWORD *)(a1 + 16) = &off_1E20D6628;
  operator delete((void *)a1);
}

void std::__list_imp<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>>::clear(id *a1)
{
  _QWORD **v2;
  id *v3;
  _QWORD *v4;
  id *v5;

  if (a1[2])
  {
    v2 = (_QWORD **)*a1;
    v3 = (id *)a1[1];
    v4 = *v3;
    v4[1] = *((_QWORD *)*a1 + 1);
    *v2[1] = v4;
    a1[2] = 0;
    if (v3 != a1)
    {
      do
      {
        v5 = (id *)v3[1];
        objc_storeWeak(v3 + 7, 0);
        objc_destroyWeak(v3 + 7);
        v3[2] = &off_1E20D6628;

        operator delete(v3);
        v3 = v5;
      }
      while (v5 != a1);
    }
  }
}

void std::__hash_table<std::__hash_value_type<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__list_iterator<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerStrongReferenceTag,64ul,2097152ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,std::__unordered_map_hasher<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__hash_value_type<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__list_iterator<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerStrongReferenceTag,64ul,2097152ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,true>,std::__unordered_map_equal<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__hash_value_type<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__list_iterator<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerStrongReferenceTag,64ul,2097152ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,true>,std::allocator<std::__hash_value_type<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__list_iterator<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerStrongReferenceTag,64ul,2097152ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>>>::__erase_unique<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>(_QWORD *a1, uint64_t a2)
{
  uint64_t **v3;
  uint64_t **v4;
  int8x8_t v5;
  uint64_t *v6;
  unint64_t v7;
  uint8x8_t v8;
  uint64_t **v9;
  uint64_t **v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t *v13;

  v3 = std::__hash_table<std::__hash_value_type<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__list_iterator<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerStrongReferenceTag,64ul,2097152ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,std::__unordered_map_hasher<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__hash_value_type<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__list_iterator<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerStrongReferenceTag,64ul,2097152ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,true>,std::__unordered_map_equal<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__hash_value_type<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__list_iterator<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerStrongReferenceTag,64ul,2097152ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,true>,std::allocator<std::__hash_value_type<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__list_iterator<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerStrongReferenceTag,64ul,2097152ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>>>::find<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>(a1, a2);
  if (v3)
  {
    v4 = v3;
    v5 = (int8x8_t)a1[1];
    v6 = *v3;
    v7 = (unint64_t)v3[1];
    v8 = (uint8x8_t)vcnt_s8(v5);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      if (v7 >= *(_QWORD *)&v5)
        v7 %= *(_QWORD *)&v5;
    }
    else
    {
      v7 &= *(_QWORD *)&v5 - 1;
    }
    v9 = *(uint64_t ***)(*a1 + 8 * v7);
    do
    {
      v10 = v9;
      v9 = (uint64_t **)*v9;
    }
    while (v9 != v3);
    if (v10 == a1 + 2)
      goto LABEL_20;
    v11 = v10[1];
    if (v8.u32[0] > 1uLL)
    {
      if ((unint64_t)v11 >= *(_QWORD *)&v5)
        v11 = (uint64_t *)((unint64_t)v11 % *(_QWORD *)&v5);
    }
    else
    {
      v11 = (uint64_t *)((unint64_t)v11 & (*(_QWORD *)&v5 - 1));
    }
    if (v11 != (uint64_t *)v7)
    {
LABEL_20:
      if (v6)
      {
        v12 = (uint64_t *)v6[1];
        if (v8.u32[0] > 1uLL)
        {
          v13 = (uint64_t *)v6[1];
          if ((unint64_t)v12 >= *(_QWORD *)&v5)
            v13 = (uint64_t *)((unint64_t)v12 % *(_QWORD *)&v5);
        }
        else
        {
          v13 = (uint64_t *)((unint64_t)v12 & (*(_QWORD *)&v5 - 1));
        }
        if (v13 == (uint64_t *)v7)
          goto LABEL_24;
      }
      *(_QWORD *)(*a1 + 8 * v7) = 0;
      v6 = *v3;
    }
    if (!v6)
    {
LABEL_30:
      *v10 = v6;
      *v3 = 0;
      --a1[3];
      v3[2] = (uint64_t *)&off_1E20D6628;

      operator delete(v4);
      return;
    }
    v12 = (uint64_t *)v6[1];
LABEL_24:
    if (v8.u32[0] > 1uLL)
    {
      if ((unint64_t)v12 >= *(_QWORD *)&v5)
        v12 = (uint64_t *)((unint64_t)v12 % *(_QWORD *)&v5);
    }
    else
    {
      v12 = (uint64_t *)((unint64_t)v12 & (*(_QWORD *)&v5 - 1));
    }
    if (v12 != (uint64_t *)v7)
    {
      *(_QWORD *)(*a1 + 8 * (_QWORD)v12) = v10;
      v6 = *v3;
    }
    goto LABEL_30;
  }
}

uint64_t **std::__hash_table<std::__hash_value_type<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__list_iterator<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerStrongReferenceTag,64ul,2097152ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,std::__unordered_map_hasher<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__hash_value_type<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__list_iterator<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerStrongReferenceTag,64ul,2097152ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,true>,std::__unordered_map_equal<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__hash_value_type<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__list_iterator<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerStrongReferenceTag,64ul,2097152ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,true>,std::allocator<std::__hash_value_type<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__list_iterator<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerStrongReferenceTag,64ul,2097152ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>>>::find<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>(_QWORD *a1, uint64_t a2)
{
  unint64_t v4;
  int8x8_t v5;
  unint64_t v6;
  uint8x8_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t ***v10;
  uint64_t **i;
  unint64_t v12;

  v4 = objc_msgSend(*(id *)(a2 + 8), "hash");
  v5 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v5)
    return 0;
  v6 = v4;
  v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    v9 = v4;
    if (v4 >= *(_QWORD *)&v5)
      v9 = v4 % *(_QWORD *)&v5;
  }
  else
  {
    v9 = (*(_QWORD *)&v5 - 1) & v4;
  }
  v10 = *(uint64_t ****)(*a1 + 8 * v9);
  if (!v10)
    return 0;
  for (i = *v10; i; i = (uint64_t **)*i)
  {
    v12 = (unint64_t)i[1];
    if (v12 == v6)
    {
      if ((geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::operator==(i[3], a2) & 1) != 0)return i;
    }
    else
    {
      if (v8 > 1)
      {
        if (v12 >= *(_QWORD *)&v5)
          v12 %= *(_QWORD *)&v5;
      }
      else
      {
        v12 &= *(_QWORD *)&v5 - 1;
      }
      if (v12 != v9)
        return 0;
    }
  }
  return i;
}

uint64_t geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::operator==(void *a1, uint64_t a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;

  v3 = a1;
  v4 = *(id *)(a2 + 8);
  v5 = v3;
  v6 = v4;
  if (v6 == v5)
    v7 = 1;
  else
    v7 = objc_msgSend(v5, "isEqual:", v6);

  return v7;
}

void sub_18B26AEF0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__list_iterator<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerStrongReferenceTag,64ul,2097152ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,void *>>>::operator()[abi:ne180100](char a1, uint64_t a2)
{
  if (a1)
  {
    *(_QWORD *)(a2 + 16) = &off_1E20D6628;

  }
  else if (!a2)
  {
    return;
  }
  operator delete((void *)a2);
}

_QWORD *geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::_retain_ptr(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  *a1 = &off_1E20D6628;
  a1[1] = v3;
  return a1;
}

void geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::~_retain_ptr(uint64_t a1)
{
  *(_QWORD *)a1 = &off_1E20D6628;

  JUMPOUT(0x18D7787ACLL);
}

uint64_t std::list<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerStrongReferenceTag,64ul,2097152ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>>::splice(uint64_t result, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  if (a2 != a4)
  {
    v4 = (uint64_t *)a4[1];
    if (v4 != a2)
    {
      v5 = *a4;
      *(_QWORD *)(v5 + 8) = v4;
      *(_QWORD *)a4[1] = v5;
      v6 = *a2;
      *(_QWORD *)(v6 + 8) = a4;
      *a4 = v6;
      *a2 = (uint64_t)a4;
      a4[1] = (uint64_t)a2;
      --*(_QWORD *)(a3 + 16);
      ++*(_QWORD *)(result + 16);
    }
  }
  return result;
}

void geo::_retain_ptr<NSDictionary * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::~_retain_ptr(uint64_t a1)
{
  *(_QWORD *)a1 = &off_1E20D6608;

  JUMPOUT(0x18D7787ACLL);
}

uint64_t geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::operator=(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  v4 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v3;

  return a1;
}

void *std::__hash_table<std::__hash_value_type<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__list_iterator<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerStrongReferenceTag,64ul,2097152ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,std::__unordered_map_hasher<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__hash_value_type<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__list_iterator<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerStrongReferenceTag,64ul,2097152ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,true>,std::__unordered_map_equal<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__hash_value_type<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__list_iterator<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerStrongReferenceTag,64ul,2097152ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,true>,std::allocator<std::__hash_value_type<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__list_iterator<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerStrongReferenceTag,64ul,2097152ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>>>::__emplace_unique_key_args<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::piecewise_construct_t const&,std::tuple<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc> const&>,std::tuple<>>(uint64_t *a1, uint64_t a2, uint64_t *a3)
{
  unint64_t v3;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint8x8_t v10;
  unint64_t v11;
  void **v12;
  void *i;
  unint64_t v14;
  _QWORD *v15;
  float v16;
  float v17;
  _BOOL8 v18;
  unint64_t v19;
  unint64_t v20;
  int8x8_t prime;
  void *v22;
  void *v23;
  uint64_t v24;
  _QWORD *v25;
  unint64_t v26;
  uint8x8_t v27;
  unint64_t v28;
  uint8x8_t v29;
  uint64_t v30;
  _QWORD *v31;
  unint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  unint64_t v35;
  void *v37;

  v7 = objc_msgSend(*(id *)(a2 + 8), "hash");
  v8 = v7;
  v9 = a1[1];
  if (v9)
  {
    v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    v11 = v10.u32[0];
    if (v10.u32[0] > 1uLL)
    {
      v3 = v7;
      if (v7 >= v9)
        v3 = v7 % v9;
    }
    else
    {
      v3 = (v9 - 1) & v7;
    }
    v12 = *(void ***)(*a1 + 8 * v3);
    if (v12)
    {
      for (i = *v12; i; i = *(void **)i)
      {
        v14 = *((_QWORD *)i + 1);
        if (v14 == v8)
        {
          if ((geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::operator==(*((void **)i + 3), a2) & 1) != 0)return i;
        }
        else
        {
          if (v11 > 1)
          {
            if (v14 >= v9)
              v14 %= v9;
          }
          else
          {
            v14 &= v9 - 1;
          }
          if (v14 != v3)
            break;
        }
      }
    }
  }
  v15 = a1 + 2;
  i = operator new(0x30uLL);
  *(_QWORD *)i = 0;
  *((_QWORD *)i + 1) = v8;
  geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::_retain_ptr((_QWORD *)i + 2, *a3);
  *((_QWORD *)i + 5) = 0;
  v16 = (float)(unint64_t)(a1[3] + 1);
  v17 = *((float *)a1 + 8);
  if (!v9 || (float)(v17 * (float)v9) < v16)
  {
    v18 = 1;
    if (v9 >= 3)
      v18 = (v9 & (v9 - 1)) != 0;
    v19 = v18 | (2 * v9);
    v20 = vcvtps_u32_f32(v16 / v17);
    if (v19 <= v20)
      prime = (int8x8_t)v20;
    else
      prime = (int8x8_t)v19;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
    }
    v9 = a1[1];
    if (*(_QWORD *)&prime > v9)
      goto LABEL_30;
    if (*(_QWORD *)&prime < v9)
    {
      v28 = vcvtps_u32_f32((float)(unint64_t)a1[3] / *((float *)a1 + 8));
      if (v9 < 3 || (v29 = (uint8x8_t)vcnt_s8((int8x8_t)v9), v29.i16[0] = vaddlv_u8(v29), v29.u32[0] > 1uLL))
      {
        v28 = std::__next_prime(v28);
      }
      else
      {
        v30 = 1 << -(char)__clz(v28 - 1);
        if (v28 >= 2)
          v28 = v30;
      }
      if (*(_QWORD *)&prime <= v28)
        prime = (int8x8_t)v28;
      if (*(_QWORD *)&prime >= v9)
      {
        v9 = a1[1];
      }
      else
      {
        if (prime)
        {
LABEL_30:
          if (*(_QWORD *)&prime >> 61)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v22 = operator new(8 * *(_QWORD *)&prime);
          v23 = (void *)*a1;
          *a1 = (uint64_t)v22;
          if (v23)
            operator delete(v23);
          v24 = 0;
          a1[1] = (uint64_t)prime;
          do
            *(_QWORD *)(*a1 + 8 * v24++) = 0;
          while (*(_QWORD *)&prime != v24);
          v25 = (_QWORD *)*v15;
          if (*v15)
          {
            v26 = v25[1];
            v27 = (uint8x8_t)vcnt_s8(prime);
            v27.i16[0] = vaddlv_u8(v27);
            if (v27.u32[0] > 1uLL)
            {
              if (v26 >= *(_QWORD *)&prime)
                v26 %= *(_QWORD *)&prime;
            }
            else
            {
              v26 &= *(_QWORD *)&prime - 1;
            }
            *(_QWORD *)(*a1 + 8 * v26) = v15;
            v31 = (_QWORD *)*v25;
            if (*v25)
            {
              do
              {
                v32 = v31[1];
                if (v27.u32[0] > 1uLL)
                {
                  if (v32 >= *(_QWORD *)&prime)
                    v32 %= *(_QWORD *)&prime;
                }
                else
                {
                  v32 &= *(_QWORD *)&prime - 1;
                }
                if (v32 != v26)
                {
                  if (!*(_QWORD *)(*a1 + 8 * v32))
                  {
                    *(_QWORD *)(*a1 + 8 * v32) = v25;
                    goto LABEL_55;
                  }
                  *v25 = *v31;
                  *v31 = **(_QWORD **)(*a1 + 8 * v32);
                  **(_QWORD **)(*a1 + 8 * v32) = v31;
                  v31 = v25;
                }
                v32 = v26;
LABEL_55:
                v25 = v31;
                v31 = (_QWORD *)*v31;
                v26 = v32;
              }
              while (v31);
            }
          }
          v9 = (unint64_t)prime;
          goto LABEL_59;
        }
        v37 = (void *)*a1;
        *a1 = 0;
        if (v37)
          operator delete(v37);
        v9 = 0;
        a1[1] = 0;
      }
    }
LABEL_59:
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9)
        v3 = v8 % v9;
      else
        v3 = v8;
    }
    else
    {
      v3 = (v9 - 1) & v8;
    }
  }
  v33 = *a1;
  v34 = *(_QWORD **)(*a1 + 8 * v3);
  if (v34)
  {
    *(_QWORD *)i = *v34;
LABEL_72:
    *v34 = i;
    goto LABEL_73;
  }
  *(_QWORD *)i = *v15;
  *v15 = i;
  *(_QWORD *)(v33 + 8 * v3) = v15;
  if (*(_QWORD *)i)
  {
    v35 = *(_QWORD *)(*(_QWORD *)i + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v35 >= v9)
        v35 %= v9;
    }
    else
    {
      v35 &= v9 - 1;
    }
    v34 = (_QWORD *)(*a1 + 8 * v35);
    goto LABEL_72;
  }
LABEL_73:
  ++a1[3];
  return i;
}

void sub_18B26B48C(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__list_iterator<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerStrongReferenceTag,64ul,2097152ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,void *>>>::operator()[abi:ne180100](1, v1);
  _Unwind_Resume(a1);
}

_QWORD *geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::_retain_ptr(_QWORD *a1, uint64_t a2)
{
  id v3;
  void *v4;

  *a1 = &off_1E20D6628;
  a1[1] = 0;
  v3 = *(id *)(a2 + 8);
  v4 = (void *)a1[1];
  a1[1] = v3;

  return a1;
}

id *geo::_geo_weak_ptr<NSDictionary * {__strong}>::operator=(id *a1, id *location)
{
  id WeakRetained;

  if (a1 != location)
  {
    WeakRetained = objc_loadWeakRetained(location);
    objc_storeWeak(a1, WeakRetained);

  }
  return a1;
}

void *std::__hash_table<std::__hash_value_type<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__list_iterator<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,std::__unordered_map_hasher<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__hash_value_type<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__list_iterator<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,true>,std::__unordered_map_equal<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__hash_value_type<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__list_iterator<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,true>,std::allocator<std::__hash_value_type<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__list_iterator<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>>>::__emplace_unique_key_args<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::piecewise_construct_t const&,std::tuple<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc> const&>,std::tuple<>>(uint64_t *a1, uint64_t a2, uint64_t *a3)
{
  unint64_t v3;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint8x8_t v10;
  unint64_t v11;
  void **v12;
  void *i;
  unint64_t v14;
  _QWORD *v15;
  float v16;
  float v17;
  _BOOL8 v18;
  unint64_t v19;
  unint64_t v20;
  int8x8_t prime;
  void *v22;
  void *v23;
  uint64_t v24;
  _QWORD *v25;
  unint64_t v26;
  uint8x8_t v27;
  unint64_t v28;
  uint8x8_t v29;
  uint64_t v30;
  _QWORD *v31;
  unint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  unint64_t v35;
  void *v37;

  v7 = objc_msgSend(*(id *)(a2 + 8), "hash");
  v8 = v7;
  v9 = a1[1];
  if (v9)
  {
    v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    v11 = v10.u32[0];
    if (v10.u32[0] > 1uLL)
    {
      v3 = v7;
      if (v7 >= v9)
        v3 = v7 % v9;
    }
    else
    {
      v3 = (v9 - 1) & v7;
    }
    v12 = *(void ***)(*a1 + 8 * v3);
    if (v12)
    {
      for (i = *v12; i; i = *(void **)i)
      {
        v14 = *((_QWORD *)i + 1);
        if (v14 == v8)
        {
          if ((geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::operator==(*((void **)i + 3), a2) & 1) != 0)return i;
        }
        else
        {
          if (v11 > 1)
          {
            if (v14 >= v9)
              v14 %= v9;
          }
          else
          {
            v14 &= v9 - 1;
          }
          if (v14 != v3)
            break;
        }
      }
    }
  }
  v15 = a1 + 2;
  i = operator new(0x30uLL);
  *(_QWORD *)i = 0;
  *((_QWORD *)i + 1) = v8;
  geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::_retain_ptr((_QWORD *)i + 2, *a3);
  *((_QWORD *)i + 5) = 0;
  v16 = (float)(unint64_t)(a1[3] + 1);
  v17 = *((float *)a1 + 8);
  if (!v9 || (float)(v17 * (float)v9) < v16)
  {
    v18 = 1;
    if (v9 >= 3)
      v18 = (v9 & (v9 - 1)) != 0;
    v19 = v18 | (2 * v9);
    v20 = vcvtps_u32_f32(v16 / v17);
    if (v19 <= v20)
      prime = (int8x8_t)v20;
    else
      prime = (int8x8_t)v19;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
    }
    v9 = a1[1];
    if (*(_QWORD *)&prime > v9)
      goto LABEL_30;
    if (*(_QWORD *)&prime < v9)
    {
      v28 = vcvtps_u32_f32((float)(unint64_t)a1[3] / *((float *)a1 + 8));
      if (v9 < 3 || (v29 = (uint8x8_t)vcnt_s8((int8x8_t)v9), v29.i16[0] = vaddlv_u8(v29), v29.u32[0] > 1uLL))
      {
        v28 = std::__next_prime(v28);
      }
      else
      {
        v30 = 1 << -(char)__clz(v28 - 1);
        if (v28 >= 2)
          v28 = v30;
      }
      if (*(_QWORD *)&prime <= v28)
        prime = (int8x8_t)v28;
      if (*(_QWORD *)&prime >= v9)
      {
        v9 = a1[1];
      }
      else
      {
        if (prime)
        {
LABEL_30:
          if (*(_QWORD *)&prime >> 61)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v22 = operator new(8 * *(_QWORD *)&prime);
          v23 = (void *)*a1;
          *a1 = (uint64_t)v22;
          if (v23)
            operator delete(v23);
          v24 = 0;
          a1[1] = (uint64_t)prime;
          do
            *(_QWORD *)(*a1 + 8 * v24++) = 0;
          while (*(_QWORD *)&prime != v24);
          v25 = (_QWORD *)*v15;
          if (*v15)
          {
            v26 = v25[1];
            v27 = (uint8x8_t)vcnt_s8(prime);
            v27.i16[0] = vaddlv_u8(v27);
            if (v27.u32[0] > 1uLL)
            {
              if (v26 >= *(_QWORD *)&prime)
                v26 %= *(_QWORD *)&prime;
            }
            else
            {
              v26 &= *(_QWORD *)&prime - 1;
            }
            *(_QWORD *)(*a1 + 8 * v26) = v15;
            v31 = (_QWORD *)*v25;
            if (*v25)
            {
              do
              {
                v32 = v31[1];
                if (v27.u32[0] > 1uLL)
                {
                  if (v32 >= *(_QWORD *)&prime)
                    v32 %= *(_QWORD *)&prime;
                }
                else
                {
                  v32 &= *(_QWORD *)&prime - 1;
                }
                if (v32 != v26)
                {
                  if (!*(_QWORD *)(*a1 + 8 * v32))
                  {
                    *(_QWORD *)(*a1 + 8 * v32) = v25;
                    goto LABEL_55;
                  }
                  *v25 = *v31;
                  *v31 = **(_QWORD **)(*a1 + 8 * v32);
                  **(_QWORD **)(*a1 + 8 * v32) = v31;
                  v31 = v25;
                }
                v32 = v26;
LABEL_55:
                v25 = v31;
                v31 = (_QWORD *)*v31;
                v26 = v32;
              }
              while (v31);
            }
          }
          v9 = (unint64_t)prime;
          goto LABEL_59;
        }
        v37 = (void *)*a1;
        *a1 = 0;
        if (v37)
          operator delete(v37);
        v9 = 0;
        a1[1] = 0;
      }
    }
LABEL_59:
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9)
        v3 = v8 % v9;
      else
        v3 = v8;
    }
    else
    {
      v3 = (v9 - 1) & v8;
    }
  }
  v33 = *a1;
  v34 = *(_QWORD **)(*a1 + 8 * v3);
  if (v34)
  {
    *(_QWORD *)i = *v34;
LABEL_72:
    *v34 = i;
    goto LABEL_73;
  }
  *(_QWORD *)i = *v15;
  *v15 = i;
  *(_QWORD *)(v33 + 8 * v3) = v15;
  if (*(_QWORD *)i)
  {
    v35 = *(_QWORD *)(*(_QWORD *)i + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v35 >= v9)
        v35 %= v9;
    }
    else
    {
      v35 &= v9 - 1;
    }
    v34 = (_QWORD *)(*a1 + 8 * v35);
    goto LABEL_72;
  }
LABEL_73:
  ++a1[3];
  return i;
}

void sub_18B26B91C(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__list_iterator<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerStrongReferenceTag,64ul,2097152ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,void *>>>::operator()[abi:ne180100](1, v1);
  _Unwind_Resume(a1);
}

void sub_18B26C00C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t containsKey(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  id v11;
  int v12;
  int v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  void *v30;
  void *v31;
  int v32;
  int v33;
  int v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v37;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v37 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        v10 = v4;
        v11 = v9;
        v12 = objc_msgSend(v10, "keyType", (_QWORD)v36);
        if (v12 == objc_msgSend(v11, "keyType"))
        {
          v13 = objc_msgSend(v10, "keyType");
          if ((v13 - 4) < 2)
          {
            objc_msgSend(v10, "imageName");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "imageName");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v30, "isEqualToString:", v31);

            if (v32)
              goto LABEL_26;
          }
          else if (v13 == 2)
          {
            v33 = objc_msgSend(v10, "iconAttributeKey");
            if (v33 == objc_msgSend(v11, "iconAttributeKey"))
            {
              v34 = objc_msgSend(v10, "iconAttributeValue");
              if (v34 == objc_msgSend(v11, "iconAttributeValue"))
                goto LABEL_26;
            }
          }
          else
          {
            if (v13 != 1)
              goto LABEL_26;
            v14 = objc_msgSend(v10, "shieldType");
            if (v14 == objc_msgSend(v11, "shieldType"))
            {
              objc_msgSend(v10, "shieldText");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "shieldText");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v15, "isEqualToString:", v16);

              if (v17)
              {
                objc_msgSend(v10, "shieldTextLocale");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v11, "shieldTextLocale");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = objc_msgSend(v18, "isEqualToString:", v19);

                if (v20)
                {
                  objc_msgSend(v10, "transitLineColor");
                  v42 = __PAIR64__(v22, v21);
                  v43 = __PAIR64__(v24, v23);
                  objc_msgSend(v11, "transitLineColor");
                  v40 = __PAIR64__(v28, v27);
                  v41 = __PAIR64__(v26, v25);
                  if (v42 == __PAIR64__(v28, v27) && v43 == __PAIR64__(v26, v25))
                  {
LABEL_26:

                    v6 = 1;
                    goto LABEL_27;
                  }
                }
              }
            }
          }
        }

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_27:

  return v6;
}

void sub_18B27235C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18B27242C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18B27257C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  _Unwind_Resume(a1);
}

void sub_18B272654(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

uint64_t _MKPointInPolygon(uint64_t a1, uint64_t a2, double a3, double a4)
{
  char v4;
  unint64_t v5;
  double *v6;
  unint64_t v7;
  double *v8;
  double v9;
  unint64_t v10;
  double v11;
  double v12;

  v4 = 0;
  if (a2)
  {
    v5 = 0;
    v6 = (double *)(a1 + 8);
    do
    {
      if (v5 < a2 - 1)
        v7 = v5 + 1;
      else
        v7 = 0;
      v8 = (double *)(a1 + 16 * v7);
      v9 = v8[1];
      if (*v6 > v9 || *v6 == v9 && *(v6 - 1) > *v8)
      {
        v10 = v7;
        v7 = v5;
      }
      else
      {
        v9 = *v6;
        v10 = v5;
      }
      if (a4 >= v9)
      {
        v11 = *(double *)(a1 + 16 * v7 + 8);
        if (a4 < v11)
        {
          v12 = v11 - v9;
          if (v12 != 0.0
            && a3 < *(double *)(a1 + 16 * v10)
                  + (*(double *)(a1 + 16 * v7) - *(double *)(a1 + 16 * v10)) / v12 * (a4 - v9))
          {
            v4 ^= 1u;
          }
        }
      }
      ++v5;
      v6 += 2;
    }
    while (a2 != v5);
  }
  return v4 & 1;
}

Class __getCSSearchableItemAttributeSetClass_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  Class result;
  void *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v2 = qword_1ECE2DE20;
  v9 = qword_1ECE2DE20;
  if (!qword_1ECE2DE20)
  {
    v10 = xmmword_1E20DF798;
    v11 = *(_OWORD *)&off_1E20DF7A8;
    v3 = _sl_dlopen();
    v7[3] = v3;
    qword_1ECE2DE20 = v3;
    v2 = v3;
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
  {
    v5 = (void *)abort_report_np();
    __break(1u);
    free(v5);
  }
  result = objc_getClass("CSSearchableItemAttributeSet");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    abort_report_np();
  qword_1ECE2DE28 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_18B27696C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18B277014(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL MKTransitArtworkDataSourceAllowMasking(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;

  v1 = a1;
  if (objc_msgSend(v1, "artworkSourceType") == 1)
  {
    objc_msgSend(v1, "shieldDataSource");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
      goto LABEL_6;
    if (qword_1ECE2DE38 != -1)
      dispatch_once(&qword_1ECE2DE38, &__block_literal_global_101);
    v3 = _MergedGlobals_173;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v2, "shieldType"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v3) = objc_msgSend((id)v3, "containsObject:", v4);

    if ((v3 & 1) == 0)
    {
      objc_msgSend(v2, "shieldText");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v5 = 0;
      }
      else
      {
        objc_msgSend(v2, "shieldColorString");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v7 == 0;

      }
    }
    else
    {
LABEL_6:
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void sub_18B2788E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void MKSnappedRouteFillWithElements(uint64_t a1, uint64_t a2, _OWORD *a3, unsigned int a4)
{
  uint64_t v6;
  void *i;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  _BOOL4 v21;
  char v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  char v30;
  uint64_t v31;
  unint64_t v32;
  BOOL v33;
  _QWORD *v34;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v6 = a2;
  v42 = *MEMORY[0x1E0C80C00];
  a3[2] = 0u;
  a3[3] = 0u;
  *a3 = 0u;
  a3[1] = 0u;
  *((_QWORD *)a3 + 4) = &kMKSnappedRouteEntryElement;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a2);
  for (i = (void *)objc_claimAutoreleasedReturnValue(); v6; --v6)
  {
    if (*(_DWORD *)(a1 + 8) != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", a1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(i, "addObject:", v9);

    }
    a1 += 16;
  }
  objc_msgSend(i, "sortUsingComparator:", &__block_literal_global_102);
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v10 = i;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v38;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v38 != v13)
          objc_enumerationMutation(v10);
        v15 = (int *)objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v14), "pointerValue", (_QWORD)v37);
        v16 = 0;
        v17 = (**((int **)a3 + 4) - 180) % 360;
        v18 = (uint64_t)(*v15 - (v17 + (v17 < 0 ? 0x168uLL : 0))) % 360;
        v19 = v18 + 360;
        if (v18 >= 0)
          v19 = v18;
        v20 = v15[2];
        v21 = v20 == 2;
        v22 = a4 & v21;
        v23 = v21 & (a4 >> 1);
        v24 = -v19;
        v25 = 0x7FFFFFFFFFFFFFFFLL;
        v26 = -1;
        v27 = -1;
        v28 = 0x7FFFFFFFFFFFFFFFLL;
        do
        {
          if (v16 < 5)
            v29 = v22;
          else
            v29 = 0;
          if ((v29 & 1) == 0)
          {
            v30 = v16 - 4 < 0xFFFFFFFFFFFFFFFDLL ? v23 : 0;
            if ((v30 & 1) == 0)
            {
              v31 = *((_QWORD *)a3 + v16);
              if (!v31 || !*(_DWORD *)(v31 + 8))
              {
                v32 = v19 % 360 + (v19 % 360 < 0 ? 0x168uLL : 0);
                if (v32 >= v24 % 360 + (v24 % 360 < 0 ? 0x168uLL : 0))
                  v32 = v24 % 360 + (v24 % 360 < 0 ? 0x168uLL : 0);
                if ((uint64_t)v32 < v28)
                {
                  v28 = v32;
                  v27 = v16;
                }
                v33 = (uint64_t)v32 >= v25 || v32 > 0x18;
                if (!v33 && !v31)
                {
                  v25 = v32;
                  v26 = v16;
                }
              }
            }
          }
          ++v16;
          v24 += 45;
          v19 -= 45;
        }
        while (v16 != 8);
        if (v26 != -1)
        {
          v34 = (_QWORD *)a3 + v27;
LABEL_36:
          *v34 = v15;
          goto LABEL_37;
        }
        if (v27 != -1)
        {
          v34 = (_QWORD *)a3 + v27;
          if (!*v34 || v20 == 2)
            goto LABEL_36;
        }
LABEL_37:
        ++v14;
      }
      while (v14 != v12);
      v36 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      v12 = v36;
    }
    while (v36);
  }

}

void sub_18B27BF70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18B27C798(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18B27DC30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location,char a24)
{
  id *v24;

  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a24, 8);
  _Unwind_Resume(a1);
}

void sub_18B27E088(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18B27E124(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18B27E1F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18B27E28C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18B27E320(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18B27E560(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18B27E630(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t getCHSIsWidgetExtensionPointSymbolLoc()
{
  uint64_t v0;
  _QWORD v2[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = _MergedGlobals_174;
  v6 = _MergedGlobals_174;
  if (!_MergedGlobals_174)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __getCHSIsWidgetExtensionPointSymbolLoc_block_invoke;
    v2[3] = &unk_1E20D8078;
    v2[4] = &v3;
    __getCHSIsWidgetExtensionPointSymbolLoc_block_invoke((uint64_t)v2);
    v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18B27E848(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getCHSIsWidgetExtensionPointSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (qword_1ECE2DE48)
  {
    v2 = (void *)qword_1ECE2DE48;
  }
  else
  {
    qword_1ECE2DE48 = _sl_dlopen();
    v2 = (void *)qword_1ECE2DE48;
    if (!qword_1ECE2DE48)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "CHSIsWidgetExtensionPoint");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  _MergedGlobals_174 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_18B27EBA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18B27EDB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18B27F0F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__23(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x18D778DB8](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void sub_18B27F96C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ___gate_block_invoke()
{
  uint64_t Integer;
  double v1;
  double v2;
  MKThrottledGate *v3;
  uint64_t v4;
  void *v5;
  id v6;

  Integer = GEOConfigGetInteger();
  GEOConfigGetDouble();
  if (v1 <= 0.0)
    v1 = 60.0;
  v2 = (double)(int)Integer / fmax(v1, 1.0);
  v3 = [MKThrottledGate alloc];
  _snapshotQueue();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[MKThrottledGate initWithMax:refreshRate:queue:](v3, "initWithMax:refreshRate:queue:", Integer, v6, fmax(v2, 0.1));
  v5 = (void *)qword_1ECE2DE60;
  qword_1ECE2DE60 = v4;

}

uint64_t ADClientAddValueForScalarKey()
{
  return MEMORY[0x1E0CF63A0]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x1E0CD2388]();
  return result;
}

uint64_t CALayerGetDelegate()
{
  return MEMORY[0x1E0CD24F0]();
}

uint64_t CALayerGetSuperlayer()
{
  return MEMORY[0x1E0CD2500]();
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x1E0CD2638](retstr, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1E0CD2640](retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x1E0CD2648](retstr, tx, ty, tz);
}

CATransform3D *__cdecl CATransform3DRotate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x1E0CD2658](retstr, t, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DRotate_(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x1E0CD2660](retstr, t, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DTranslate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x1E0CD2678](retstr, t, tx, ty, tz);
}

CATransform3D *__cdecl CATransform3DTranslate_(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x1E0CD2688](retstr, t, tx, ty, tz);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

CFIndex CFArrayBSearchValues(CFArrayRef theArray, CFRange range, const void *value, CFComparatorFunction comparator, void *context)
{
  return MEMORY[0x1E0C97D08](theArray, range.location, range.length, value, comparator, context);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
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

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C984D8](theDate);
  return result;
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x1E0C98630](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x1E0C98770]();
}

CFTypeRef CFLocaleGetValue(CFLocaleRef locale, CFLocaleKey key)
{
  return (CFTypeRef)MEMORY[0x1E0C98800](locale, key);
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

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98BF8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C30]();
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x1E0C98CB0](mode, returnAfterSourceHandled, seconds);
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0C98CC8](allocator, order, context);
}

void CFRunLoopTimerSetNextFireDate(CFRunLoopTimerRef timer, CFAbsoluteTime fireDate)
{
  MEMORY[0x1E0C98D58](timer, fireDate);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BA90](retstr, t1, t2);
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return MEMORY[0x1E0C9BAA0](t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAB0](retstr, t);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x1E0C9BAB8](t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD0](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAE0](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAF0](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAF8](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BB00](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1E0C9BB10](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1E0C9BB20](context);
}

uint64_t CGBitmapGetAlignedBytesPerRow()
{
  return MEMORY[0x1E0C9BB98]();
}

CGFloat CGColorGetAlpha(CGColorRef color)
{
  CGFloat result;

  MEMORY[0x1E0C9BCF8](color);
  return result;
}

CGPatternRef CGColorGetPattern(CGColorRef color)
{
  return (CGPatternRef)MEMORY[0x1E0C9BD28](color);
}

CGColorRef CGColorRetain(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x1E0C9BD68](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDE8]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x1E0C9BF30](space);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
  MEMORY[0x1E0C9BFD8](c, path);
}

void CGContextAddRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9BFE8](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextBeginPath(CGContextRef c)
{
  MEMORY[0x1E0C9C000](c);
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C020](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextClip(CGContextRef c)
{
  MEMORY[0x1E0C9C028](c);
}

void CGContextClipToMask(CGContextRef c, CGRect rect, CGImageRef mask)
{
  MEMORY[0x1E0C9C030](c, mask, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextClipToRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C038](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
  MEMORY[0x1E0C9C050](c, transform);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x1E0C9C170](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
  MEMORY[0x1E0C9C198](c, gradient, *(_QWORD *)&options, (__n128)startPoint, *(__n128 *)&startPoint.y, (__n128)endPoint, *(__n128 *)&endPoint.y);
}

void CGContextDrawPath(CGContextRef c, CGPathDrawingMode mode)
{
  MEMORY[0x1E0C9C1B8](c, *(_QWORD *)&mode);
}

void CGContextEOClip(CGContextRef c)
{
  MEMORY[0x1E0C9C1E8](c);
}

void CGContextFillEllipseInRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C210](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextFillPath(CGContextRef c)
{
  MEMORY[0x1E0C9C218](c);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C220](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t CGContextGetBaseCTM()
{
  return MEMORY[0x1E0C9C240]();
}

CGAffineTransform *__cdecl CGContextGetCTM(CGAffineTransform *__return_ptr retstr, CGContextRef c)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9C250](retstr, c);
}

CGRect CGContextGetClipBoundingBox(CGContextRef c)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0C9C260](c);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

uint64_t CGContextGetLineCap()
{
  return MEMORY[0x1E0C9C2B0]();
}

uint64_t CGContextGetLineJoin()
{
  return MEMORY[0x1E0C9C2B8]();
}

uint64_t CGContextGetLineWidth()
{
  return MEMORY[0x1E0C9C2C0]();
}

uint64_t CGContextGetMiterLimit()
{
  return MEMORY[0x1E0C9C2C8]();
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x1E0C9C340](c);
}

uint64_t CGContextResetCTM()
{
  return MEMORY[0x1E0C9C358]();
}

void CGContextRestoreGState(CGContextRef c)
{
  MEMORY[0x1E0C9C370](c);
}

void CGContextSaveGState(CGContextRef c)
{
  MEMORY[0x1E0C9C388](c);
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
  MEMORY[0x1E0C9C390](c, sx, sy);
}

void CGContextSetAlpha(CGContextRef c, CGFloat alpha)
{
  MEMORY[0x1E0C9C3B8](c, alpha);
}

uint64_t CGContextSetBaseCTM()
{
  return MEMORY[0x1E0C9C3C0]();
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
  MEMORY[0x1E0C9C3C8](c, *(_QWORD *)&mode);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C408](c, color);
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
  MEMORY[0x1E0C9C458](c, *(_QWORD *)&quality);
}

void CGContextSetLineCap(CGContextRef c, CGLineCap cap)
{
  MEMORY[0x1E0C9C468](c, *(_QWORD *)&cap);
}

void CGContextSetLineDash(CGContextRef c, CGFloat phase, const CGFloat *lengths, size_t count)
{
  MEMORY[0x1E0C9C470](c, lengths, count, phase);
}

void CGContextSetLineJoin(CGContextRef c, CGLineJoin join)
{
  MEMORY[0x1E0C9C478](c, *(_QWORD *)&join);
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
  MEMORY[0x1E0C9C480](c, width);
}

void CGContextSetMiterLimit(CGContextRef c, CGFloat limit)
{
  MEMORY[0x1E0C9C490](c, limit);
}

void CGContextSetRGBFillColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  MEMORY[0x1E0C9C4A0](c, red, green, blue, alpha);
}

void CGContextSetRGBStrokeColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  MEMORY[0x1E0C9C4A8](c, red, green, blue, alpha);
}

void CGContextSetShadowWithColor(CGContextRef c, CGSize offset, CGFloat blur, CGColorRef color)
{
  MEMORY[0x1E0C9C4C0](c, color, (__n128)offset, *(__n128 *)&offset.height, blur);
}

void CGContextSetShouldAntialias(CGContextRef c, BOOL shouldAntialias)
{
  MEMORY[0x1E0C9C4C8](c, shouldAntialias);
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C508](c, color);
}

void CGContextSetTextPosition(CGContextRef c, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9C538](c, x, y);
}

void CGContextStrokeEllipseInRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C560](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextStrokePath(CGContextRef c)
{
  MEMORY[0x1E0C9C570](c);
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x1E0C9C588](c, tx, ty);
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x1E0C9CA90](space, colors, locations);
}

void CGGradientRelease(CGGradientRef gradient)
{
  MEMORY[0x1E0C9CAC0](gradient);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x1E0C9CBA8](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1E0C9CC60](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1E0C9CCD0](image);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x1E0C9CDA0](image);
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1E0C9CDA8](image);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1E0CBC568](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC590](data, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x1E0CBC5F0](isrc);
}

void CGPathAddArc(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise)
{
  MEMORY[0x1E0C9D280](path, m, clockwise, x, y, radius, startAngle, endAngle);
}

void CGPathAddArcToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x1, CGFloat y1, CGFloat x2, CGFloat y2, CGFloat radius)
{
  MEMORY[0x1E0C9D288](path, m, x1, y1, x2, y2, radius);
}

void CGPathAddCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cp1x, CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9D298](path, m, cp1x, cp1y, cp2x, cp2y, x, y);
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9D2A8](path, m, x, y);
}

void CGPathAddLines(CGMutablePathRef path, const CGAffineTransform *m, const CGPoint *points, size_t count)
{
  MEMORY[0x1E0C9D2B0](path, m, points, count);
}

void CGPathAddPath(CGMutablePathRef path1, const CGAffineTransform *m, CGPathRef path2)
{
  MEMORY[0x1E0C9D2B8](path1, m, path2);
}

void CGPathAddQuadCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cpx, CGFloat cpy, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9D2C0](path, m, cpx, cpy, x, y);
}

void CGPathApplyWithBlock(CGPathRef path, CGPathApplyBlock block)
{
  MEMORY[0x1E0C9D300](path, block);
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
  MEMORY[0x1E0C9D310](path);
}

BOOL CGPathContainsPoint(CGPathRef path, const CGAffineTransform *m, CGPoint point, BOOL eoFill)
{
  return MEMORY[0x1E0C9D318](path, m, eoFill, (__n128)point, *(__n128 *)&point.y);
}

CGPathRef CGPathCreateCopy(CGPathRef path)
{
  return (CGPathRef)MEMORY[0x1E0C9D320](path);
}

CGPathRef CGPathCreateCopyByDashingPath(CGPathRef path, const CGAffineTransform *transform, CGFloat phase, const CGFloat *lengths, size_t count)
{
  return (CGPathRef)MEMORY[0x1E0C9D328](path, transform, lengths, count, phase);
}

CGPathRef CGPathCreateCopyByStrokingPath(CGPathRef path, const CGAffineTransform *transform, CGFloat lineWidth, CGLineCap lineCap, CGLineJoin lineJoin, CGFloat miterLimit)
{
  return (CGPathRef)MEMORY[0x1E0C9D348](path, transform, *(_QWORD *)&lineCap, *(_QWORD *)&lineJoin, lineWidth, miterLimit);
}

CGPathRef CGPathCreateCopyByTransformingPath(CGPathRef path, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1E0C9D358](path, transform);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1E0C9D388]();
}

CGPathRef CGPathCreateWithEllipseInRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1E0C9D3C0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGPathRef CGPathCreateWithRoundedRect(CGRect rect, CGFloat cornerWidth, CGFloat cornerHeight, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1E0C9D3D0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, cornerWidth, cornerHeight);
}

CGRect CGPathGetBoundingBox(CGPathRef path)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0C9D3F0](path);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGPoint CGPathGetCurrentPoint(CGPathRef path)
{
  double v1;
  double v2;
  CGPoint result;

  MEMORY[0x1E0C9D3F8](path);
  result.y = v2;
  result.x = v1;
  return result;
}

BOOL CGPathIsEmpty(CGPathRef path)
{
  return MEMORY[0x1E0C9D448](path);
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9D490](path, m, x, y);
}

void CGPathRelease(CGPathRef path)
{
  MEMORY[0x1E0C9D498](path);
}

CGPathRef CGPathRetain(CGPathRef path)
{
  return (CGPathRef)MEMORY[0x1E0C9D4A0](path);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D548](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1E0C9D550]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D558]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

void CGRectDivide(CGRect rect, CGRect *slice, CGRect *remainder, CGFloat amount, CGRectEdge edge)
{
  MEMORY[0x1E0C9D568](slice, remainder, *(_QWORD *)&edge, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, amount);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D580]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D588]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5B0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D5E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0C9D5F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D5F8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D600]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1E0C9D608]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1E0C9D618]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D630]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D640]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t CLLocationCoordinate2DGetDistanceFrom()
{
  return MEMORY[0x1E0C9E2F8]();
}

BOOL CLLocationCoordinate2DIsValid(CLLocationCoordinate2D coord)
{
  return MEMORY[0x1E0C9E300]((__n128)coord, *(__n128 *)&coord.longitude);
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  double v2;
  double v3;
  CLLocationCoordinate2D result;

  MEMORY[0x1E0C9E308](latitude, longitude);
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

uint64_t CTFontCreateCopyOfSystemUIFontWithGrade()
{
  return MEMORY[0x1E0CA7A28]();
}

CTFontRef CTFontCreateUIFontForLanguage(CTFontUIFontType uiType, CGFloat size, CFStringRef language)
{
  return (CTFontRef)MEMORY[0x1E0CA7A68](*(_QWORD *)&uiType, language, size);
}

CTFontRef CTFontCreateWithFontDescriptor(CTFontDescriptorRef descriptor, CGFloat size, const CGAffineTransform *matrix)
{
  return (CTFontRef)MEMORY[0x1E0CA7A70](descriptor, matrix, size);
}

CTFontDescriptorRef CTFontDescriptorCreateWithAttributes(CFDictionaryRef attributes)
{
  return (CTFontDescriptorRef)MEMORY[0x1E0CA7B00](attributes);
}

BOOL CTFontManagerRegisterFontsForURL(CFURLRef fontURL, CTFontManagerScope scope, CFErrorRef *error)
{
  return MEMORY[0x1E0CA7D48](fontURL, *(_QWORD *)&scope, error);
}

CTLineRef CTLineCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTLineRef)MEMORY[0x1E0CA7E88](attrString);
}

CGRect CTLineGetBoundsWithOptions(CTLineRef line, CTLineBoundsOptions options)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0CA7EC0](line, options);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

double CTLineGetTypographicBounds(CTLineRef line, CGFloat *ascent, CGFloat *descent, CGFloat *leading)
{
  double result;

  MEMORY[0x1E0CA7F18](line, ascent, descent, leading);
  return result;
}

uint64_t GEOApplicationIdentifierOrProcessName()
{
  return MEMORY[0x1E0D26440]();
}

uint64_t GEOBearingFromCoordinateToCoordinate()
{
  return MEMORY[0x1E0D26450]();
}

uint64_t GEOCalculateDistance()
{
  return MEMORY[0x1E0D26458]();
}

uint64_t GEOCalculateDistanceHighPrecision()
{
  return MEMORY[0x1E0D26460]();
}

uint64_t GEOCanUserMakeLagunaBeachContributions()
{
  return MEMORY[0x1E0D26468]();
}

uint64_t GEOConfigGetArray()
{
  return MEMORY[0x1E0D26490]();
}

uint64_t GEOConfigGetBOOL()
{
  return MEMORY[0x1E0D26498]();
}

uint64_t GEOConfigGetDictionary()
{
  return MEMORY[0x1E0D264A8]();
}

uint64_t GEOConfigGetDouble()
{
  return MEMORY[0x1E0D264B0]();
}

uint64_t GEOConfigGetInteger()
{
  return MEMORY[0x1E0D264B8]();
}

uint64_t GEOConfigGetString()
{
  return MEMORY[0x1E0D264C8]();
}

uint64_t GEOConfigGetUInteger()
{
  return MEMORY[0x1E0D264D0]();
}

uint64_t GEOConfigRemoveBlockListener()
{
  return MEMORY[0x1E0D264F0]();
}

uint64_t GEOConfigRemoveDelegateListenerForAllKeys()
{
  return MEMORY[0x1E0D264F8]();
}

uint64_t GEOConfigSetArray()
{
  return MEMORY[0x1E0D26500]();
}

uint64_t GEOConfigSetInteger()
{
  return MEMORY[0x1E0D26518]();
}

uint64_t GEOCoordinateRegionForMapRect()
{
  return MEMORY[0x1E0D26540]();
}

uint64_t GEOCoordinateRegionMakeWithDistance()
{
  return MEMORY[0x1E0D26548]();
}

uint64_t GEODefaultsDisableServer()
{
  return MEMORY[0x1E0D26558]();
}

uint64_t GEODistanceBetweenPointAndLine()
{
  return MEMORY[0x1E0D26568]();
}

uint64_t GEODoesUserHaveValidAccountForMakingContributions()
{
  return MEMORY[0x1E0D26570]();
}

uint64_t GEOErrorDomain()
{
  return MEMORY[0x1E0D26578]();
}

uint64_t GEOFindOrCreateLog()
{
  return MEMORY[0x1E0D265D0]();
}

uint64_t GEOGeodesicEvaluate()
{
  return MEMORY[0x1E0D265D8]();
}

uint64_t GEOGetUserTransportTypePreference()
{
  return MEMORY[0x1E0D265F8]();
}

uint64_t GEOIsBAASupported()
{
  return MEMORY[0x1E0D26608]();
}

uint64_t GEOMachAbsoluteTimeGetCurrent()
{
  return MEMORY[0x1E0D26630]();
}

uint64_t GEOMapPointForCoordinate()
{
  return MEMORY[0x1E0D26670]();
}

uint64_t GEOMapPointsPerMeterAtLatitude()
{
  return MEMORY[0x1E0D26680]();
}

uint64_t GEOMapRectBoundingMapPoints()
{
  return MEMORY[0x1E0D26688]();
}

uint64_t GEOMapRectContainsPoint()
{
  return MEMORY[0x1E0D26690]();
}

uint64_t GEOMapRectEnclosingCameraProperties()
{
  return MEMORY[0x1E0DC64B8]();
}

uint64_t GEOMapRectForCoordinateRegion()
{
  return MEMORY[0x1E0D26698]();
}

uint64_t GEOMapRectForMapRegion()
{
  return MEMORY[0x1E0D266A8]();
}

uint64_t GEONetworkDefaultsDisableServerConnection()
{
  return MEMORY[0x1E0D26748]();
}

uint64_t GEOOnce()
{
  return MEMORY[0x1E0D26778]();
}

uint64_t GEOPolylineCoordinateNearestIndex()
{
  return MEMORY[0x1E0D26A60]();
}

uint64_t GEOResourceFilterScaleForScale()
{
  return MEMORY[0x1E0D26AF0]();
}

uint64_t GEOServerFormatTokenEqual()
{
  return MEMORY[0x1E0D26B18]();
}

uint64_t GEOSupportsOfflineMaps()
{
  return MEMORY[0x1E0D26BB8]();
}

uint64_t GEOTileKeyEquals()
{
  return MEMORY[0x1E0D26BC8]();
}

uint64_t GEOTileKeyMakeEmpty()
{
  return MEMORY[0x1E0D26BE0]();
}

uint64_t GEOTileLoaderClientIdentifier()
{
  return MEMORY[0x1E0D26C00]();
}

uint64_t GEOTransitDepartureIsImminentDepartureTimeInterval()
{
  return MEMORY[0x1E0D26C10]();
}

uint64_t GEOTransitIncidentEntityAffectsSequence()
{
  return MEMORY[0x1E0D26C18]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1E0DE2B70]();
}

uint64_t MNFormattedStringOptionsHash()
{
  return MEMORY[0x1E0D518F0]();
}

uint64_t MNFormattedStringOptionsIsEqual()
{
  return MEMORY[0x1E0D518F8]();
}

uint64_t MNInstructionsDistanceTypeConvertToMeters()
{
  return MEMORY[0x1E0D51900]();
}

uint64_t MNInstructionsLocalizedImperialUnits()
{
  return MEMORY[0x1E0D51908]();
}

uint64_t MNInstructionsLocalizedMetricUnits()
{
  return MEMORY[0x1E0D51910]();
}

uint64_t MNLocaleDidChangeNotification()
{
  return MEMORY[0x1E0D51918]();
}

uint64_t MapKitFeature_IsEnabled_SPRForMapSnapshots()
{
  return MEMORY[0x1E0D26D00]();
}

uint64_t MapsFeatureFlag_RemoveBlockListener()
{
  return MEMORY[0x1E0D26D10]();
}

uint64_t MapsFeature_AddBlockListener()
{
  return MEMORY[0x1E0D26D18]();
}

uint64_t MapsFeature_IsAvailable_Maps298()
{
  return MEMORY[0x1E0D26D28]();
}

uint64_t MapsFeature_IsEnabled_LagunaBeach()
{
  return MEMORY[0x1E0D26D68]();
}

uint64_t MapsFeature_IsEnabled_Maps269()
{
  return MEMORY[0x1E0D26D78]();
}

uint64_t MapsFeature_IsEnabled_MyPlacesFeatures()
{
  return MEMORY[0x1E0D26D90]();
}

uint64_t MapsFeature_IsEnabled_SearchAndDiscovery()
{
  return MEMORY[0x1E0D26DB8]();
}

uint64_t MapsFeature_IsEnabled_ShelbyvilleMapKit()
{
  return MEMORY[0x1E0D26DE8]();
}

uint64_t MapsFeature_RemoveBlockListener()
{
  return MEMORY[0x1E0D26E20]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

const char *__cdecl NSGetSizeAndAlignment(const char *typePtr, NSUInteger *sizep, NSUInteger *alignp)
{
  return (const char *)MEMORY[0x1E0C99758](typePtr, sizep, alignp);
}

uint64_t NSIntegerIsValidFloorOrdinal()
{
  return MEMORY[0x1E0D26EA8]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x1E0CB31F8]();
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x1E0CEA108]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x1E0CEA118]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x1E0CB3218](proto);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1E0CB3220](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

uint64_t PBHashBytes()
{
  return MEMORY[0x1E0D82CD0]();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return MEMORY[0x1E0CEB030]();
}

uint64_t UIAnimationDragCoefficient()
{
  return MEMORY[0x1E0CEB250]();
}

uint64_t UICeilToScale()
{
  return MEMORY[0x1E0CEB3A0]();
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return MEMORY[0x1E0CEB3E8](lhs, rhs);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x1E0CEB418](category);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x1E0CEB630](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x1E0CEB638]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1E0CEB640]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1E0CEB648]();
}

void UIGraphicsPopContext(void)
{
  MEMORY[0x1E0CEB650]();
}

void UIGraphicsPushContext(CGContextRef context)
{
  MEMORY[0x1E0CEB658](context);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x1E0CEB688](image);
}

void UIRectFill(CGRect rect)
{
  MEMORY[0x1E0CEBAD0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t UIRectInset()
{
  return MEMORY[0x1E0CEBAE8]();
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x1E0CEBB30]();
}

uint64_t VKAnimationCurveForCAMediaTimingFunction()
{
  return MEMORY[0x1E0DC65C0]();
}

uint64_t VKAnimationCurveSpring()
{
  return MEMORY[0x1E0DC65D0]();
}

uint64_t VKCameraPropertiesForRect()
{
  return MEMORY[0x1E0DC65D8]();
}

uint64_t VKCameraPropertiesForStoreFrontView()
{
  return MEMORY[0x1E0DC65E0]();
}

uint64_t VKLineDrawWithOuterStroke()
{
  return MEMORY[0x1E0DC65E8]();
}

uint64_t VKLocationCoordinate2DMake()
{
  return MEMORY[0x1E0DC65F0]();
}

uint64_t VKRasterTileOverlayTileLoader()
{
  return MEMORY[0x1E0DC6608]();
}

uint64_t VKShieldColorsFromHexString()
{
  return MEMORY[0x1E0DC6610]();
}

uint64_t VKTrafficIncidentSetSubtitleBlock()
{
  return MEMORY[0x1E0DC6618]();
}

uint64_t VKTrafficIncidentSetTitleBlock()
{
  return MEMORY[0x1E0DC6620]();
}

uint64_t _AXSReduceMotionEnabled()
{
  return MEMORY[0x1E0DDDB20]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _GEOConfigAddBlockListenerForKey()
{
  return MEMORY[0x1E0D277B0]();
}

uint64_t _GEOConfigAddDelegateListenerForKey()
{
  return MEMORY[0x1E0D277B8]();
}

uint64_t _GEOConfigHasValue()
{
  return MEMORY[0x1E0D277C0]();
}

uint64_t _GEOConfigRegisterStateCaptureFunctions()
{
  return MEMORY[0x1E0D277C8]();
}

uint64_t _GEOMurmurHash3_128_realign()
{
  return MEMORY[0x1E0D277E0]();
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x1E0CB3BC8](commaSeparatedKeysString, firstValue);
}

uint64_t _UIApplicationIsExtension()
{
  return MEMORY[0x1E0CEBEE0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1E0DE43E8](__n);
}

void std::mutex::lock(std::mutex *this)
{
  MEMORY[0x1E0DE4AA0](this);
}

void std::mutex::unlock(std::mutex *this)
{
  MEMORY[0x1E0DE4AA8](this);
}

void std::mutex::~mutex(std::mutex *this)
{
  MEMORY[0x1E0DE4AB8](this);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

void operator delete(void *__p)
{
  off_1E20D5C88(__p);
}

uint64_t operator delete()
{
  return off_1E20D5C90();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E20D5C98(__sz);
}

uint64_t operator new()
{
  return off_1E20D5CA0();
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x1E0C80AC8](a1);
  return result;
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x1E0C80BC8](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t _dyld_get_prog_image_header()
{
  return MEMORY[0x1E0C80E90]();
}

uint64_t _geo_isolate_lock()
{
  return MEMORY[0x1E0D278A0]();
}

uint64_t _geo_isolate_unlock()
{
  return MEMORY[0x1E0D278A8]();
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

long double acos(long double __x)
{
  long double result;

  MEMORY[0x1E0C81500](__x);
  return result;
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

long double asin(long double __x)
{
  long double result;

  MEMORY[0x1E0C81598](__x);
  return result;
}

long double atan(long double __x)
{
  long double result;

  MEMORY[0x1E0C81618](__x);
  return result;
}

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x1E0C81620](__y, __x);
  return result;
}

float atan2f(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C81628](a1, a2);
  return result;
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

long double cos(long double __x)
{
  long double result;

  MEMORY[0x1E0C82B40](__x);
  return result;
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BF8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D10](group, queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
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

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E50](label, attr, target);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
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

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

dispatch_workloop_t dispatch_workloop_create(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1E0C82FD8](label);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

uint64_t dyld_get_base_platform()
{
  return MEMORY[0x1E0C830A8]();
}

uint64_t dyld_get_image_versions()
{
  return MEMORY[0x1E0C830B0]();
}

uint64_t dynamicValueAnimation()
{
  return MEMORY[0x1E0DC6628]();
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x1E0C83280](__x);
  return result;
}

long double exp2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83288](__x);
  return result;
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

float fmodf(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C83448](a1, a2);
  return result;
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

uint64_t geo_assert_isolated()
{
  return MEMORY[0x1E0D278C0]();
}

uint64_t geo_dispatch_queue_create()
{
  return MEMORY[0x1E0D278C8]();
}

uint64_t geo_dispatch_queue_create_with_qos()
{
  return MEMORY[0x1E0D278D0]();
}

uint64_t geo_dispatch_queue_create_with_target()
{
  return MEMORY[0x1E0D278D8]();
}

uint64_t geo_dispatch_queue_create_with_workloop_qos()
{
  return MEMORY[0x1E0D278E0]();
}

uint64_t geo_dispatch_timer_create_on_qos()
{
  return MEMORY[0x1E0D278E8]();
}

uint64_t geo_isolate_sync()
{
  return MEMORY[0x1E0D27900]();
}

uint64_t geo_isolate_sync_data()
{
  return MEMORY[0x1E0D27908]();
}

uint64_t geo_isolater_create()
{
  return MEMORY[0x1E0D27910]();
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

long double ldexp(long double __x, int __e)
{
  long double result;

  MEMORY[0x1E0C83B40](*(_QWORD *)&__e, __x);
  return result;
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BB8](__x);
  return result;
}

long double log2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BE8](__x);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F10](ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1E0C84400](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
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

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x1E0DE7C30](dest, src, size, atomic, hasStrong);
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
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

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
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

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1E0C84930](log, ptr);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84990](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x1E0C849A0]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x1E0C84D28](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x1E0C84D30](a1);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x1E0C84D48](a1, a2);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1E0C84E20](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

int pthread_mutexattr_destroy(pthread_mutexattr_t *a1)
{
  return MEMORY[0x1E0C84E40](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x1E0C84E48](a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x1E0C84E60](a1, *(_QWORD *)&a2);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1E0C84E68](a1, a2);
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
  MEMORY[0x1E0C84F90](__base, __nel, __width, __compar);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1E0C85030](__ptr, __size);
}

long double sin(long double __x)
{
  long double result;

  MEMORY[0x1E0C85418](__x);
  return result;
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

long double tan(long double __x)
{
  long double result;

  MEMORY[0x1E0C857E8](__x);
  return result;
}

int8_t u_charType(UChar32 c)
{
  return MEMORY[0x1E0DE5978](*(_QWORD *)&c);
}

uint64_t ucnv_close()
{
  return MEMORY[0x1E0DE5E98]();
}

uint64_t ucnv_fromUChars()
{
  return MEMORY[0x1E0DE5EC0]();
}

uint64_t ucnv_getMaxCharSize()
{
  return MEMORY[0x1E0DE5F00]();
}

uint64_t ucnv_open()
{
  return MEMORY[0x1E0DE5F20]();
}

uint64_t unum_close()
{
  return MEMORY[0x1E0DE6530]();
}

uint64_t unum_formatInt64()
{
  return MEMORY[0x1E0DE6560]();
}

uint64_t unum_open()
{
  return MEMORY[0x1E0DE6598]();
}

uint64_t unum_setAttribute()
{
  return MEMORY[0x1E0DE65C8]();
}

