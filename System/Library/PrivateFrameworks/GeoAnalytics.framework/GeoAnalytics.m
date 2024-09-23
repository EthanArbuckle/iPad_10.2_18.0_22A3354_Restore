id GEOGetGEOAPRemoteAnalyticsLog()
{
  if (qword_254316CC8 != -1)
    dispatch_once(&qword_254316CC8, &__block_literal_global_121_0);
  return (id)qword_254316CC0;
}

void sub_23CBB59F8(_Unwind_Exception *a1)
{
  _geo_isolate_unlock();
  _Unwind_Resume(a1);
}

long double gloria::TileCoordinate::YToLat(gloria::TileCoordinate *this)
{
  double v1;
  long double v2;
  double v3;
  long double v4;

  v1 = (double)*((unint64_t *)this + 1) * -6.28318531;
  v2 = v1 / ldexp(1.0, *((unsigned __int8 *)this + 16)) + 3.14159265;
  v3 = exp(v2);
  v4 = exp(-v2);
  return atan((v3 - v4) * 0.5) * 57.2957795;
}

double gloria::TileId::ToBBOX(gloria::TileId *this)
{
  int v1;
  double v2;
  int64x2_t v4;
  unsigned __int8 v5;
  int64x2_t v6;
  unsigned __int8 v7;

  gloria::TileId::ToXYZ(this, (int8x16_t *)&v6);
  v1 = v7;
  v4 = vaddq_s64(v6, vdupq_n_s64(1uLL));
  v5 = v7;
  v2 = gloria::TileCoordinate::YToLat((gloria::TileCoordinate *)&v6);
  gloria::TileCoordinate::YToLat((gloria::TileCoordinate *)&v4);
  ldexp(1.0, v1);
  ldexp(1.0, v1);
  return v2;
}

int8x16_t gloria::TileId::ToXYZ@<Q0>(gloria::TileId *this@<X0>, int8x16_t *a2@<X8>)
{
  uint64x2_t v2;
  int8x16_t v3;
  __int8 v4;
  int8x16_t v5;
  int8x16_t v6;
  int8x16_t v7;
  int8x16_t v8;
  int8x16_t v9;
  int8x16_t v10;
  int8x16_t result;

  v2.i64[0] = *(_QWORD *)this & 0x1111111111111111 | ((*(_QWORD *)this & 0x5555555555555555uLL) >> 1) & 0x3333333333333333;
  v2.i64[1] = (*(_QWORD *)this >> 1) & 0x4444444444444444 | *(_QWORD *)this & 0x2222222222222222;
  v3 = (int8x16_t)vshlq_u64(v2, (uint64x2_t)xmmword_23CC47EF0);
  v2.i64[1] = (unint64_t)v2.i64[1] >> 1;
  v4 = *((_BYTE *)this + 8);
  v5 = vorrq_s8(v3, (int8x16_t)v2);
  v3.i64[0] = 0xF0F0F0F0F0F0F0FLL;
  v3.i64[1] = 0xF0F0F0F0F0F0F0FLL;
  v6 = vandq_s8(v5, v3);
  v3.i64[0] = 0xFF00FF00FF00FFLL;
  v3.i64[1] = 0xFF00FF00FF00FFLL;
  v7 = vandq_s8(vorrq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v6, 4uLL), v6), v3);
  v8 = vorrq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v7, 8uLL), v7);
  v9.i64[0] = 4294901760;
  v9.i64[1] = 4294901760;
  v10 = vandq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v8, 0x10uLL), v9);
  v9.i64[0] = 0xFFFFLL;
  v9.i64[1] = 0xFFFFLL;
  result = vorrq_s8(v10, vandq_s8(v8, v9));
  *a2 = result;
  a2[1].i8[0] = v4;
  return result;
}

int8x16_t gloria::TileCoordinate::FromLatLng@<Q0>(gloria::TileCoordinate *this@<X0>, double *a2@<X1>, const double *a3@<X2>, int8x16_t *a4@<X8>)
{
  double v7;
  double v8;
  double v9;
  double v10;
  long double v11;
  long double v12;
  __int8 v13;
  unint64_t v14;
  float64x2_t v15;
  int8x16_t v16;
  int8x16_t v17;
  int8x16_t result;
  float64_t v19;

  v7 = fmax(*a2, -180.0);
  v8 = fmax(*(double *)this, -85.0511288);
  if (v7 >= 180.0)
    v9 = 1.0;
  else
    v9 = (v7 + 180.0) / 360.0;
  v19 = v9;
  v10 = v8 * 3.14159265 / 180.0;
  if (v8 >= 85.0511288)
    v10 = 1.48442223;
  v11 = sin(v10);
  v12 = log((v11 + 1.0) / (1.0 - v11));
  v13 = *(_BYTE *)a3;
  v14 = 1 << *(_BYTE *)a3;
  v15.f64[0] = v19;
  v15.f64[1] = v12 / -12.5663706 + 0.5;
  v16 = (int8x16_t)vcvtq_u64_f64(vrndmq_f64(vmulq_n_f64(v15, (double)v14)));
  v17 = (int8x16_t)vdupq_n_s64(v14 - 1);
  result = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v16, (uint64x2_t)v17), v17, v16);
  *a4 = result;
  a4[1].i8[0] = v13;
  return result;
}

double gloria::MortonUtils::XYToQuadId(gloria::MortonUtils *this, uint64_t a2)
{
  int64x2_t v2;
  int8x16_t v3;
  int8x16_t v4;
  int64x2_t v5;
  unsigned __int128 v6;
  unsigned __int128 v7;
  int8x16_t v8;
  int8x16_t v9;
  int64x2_t v10;
  double result;

  v2.i64[0] = a2;
  v2.i64[1] = (uint64_t)this;
  v3.i64[0] = 0xFFFFFFFFLL;
  v3.i64[1] = 0xFFFFFFFFLL;
  v4 = vorrq_s8((int8x16_t)vshlq_n_s64(v2, 0x10uLL), vandq_s8((int8x16_t)v2, v3));
  v3.i64[0] = 0xFFFF0000FFFFLL;
  v3.i64[1] = 0xFFFF0000FFFFLL;
  v5 = (int64x2_t)vandq_s8(v4, v3);
  v6 = *(_OWORD *)&vorrq_s8((int8x16_t)vshlq_n_s64(v5, 8uLL), (int8x16_t)v5) & __PAIR128__(0xFFFF00FFFFFF00FFLL, 0xFFFF00FFFFFF00FFLL);
  v7 = *(_OWORD *)&vorrq_s8((int8x16_t)vshlq_n_s64((int64x2_t)v6, 4uLL), (int8x16_t)v6) & __PAIR128__(0xFF0FFF0FFF0FFF0FLL, 0xFF0FFF0FFF0FFF0FLL);
  v3.i64[0] = 0x3333333333333333;
  v3.i64[1] = 0x3333333333333333;
  v8 = vandq_s8(vorrq_s8((int8x16_t)vshlq_n_s64((int64x2_t)v7, 2uLL), (int8x16_t)v7), v3);
  v9 = (int8x16_t)vshlq_u64((uint64x2_t)v8, (uint64x2_t)xmmword_23CC47F00);
  v8.i64[0] *= 2;
  v10 = (int64x2_t)vandq_s8(vorrq_s8(v9, v8), (int8x16_t)xmmword_23CC47F10);
  *(_QWORD *)&result = vorrq_s8((int8x16_t)v10, (int8x16_t)vdupq_laneq_s64(v10, 1)).u64[0];
  return result;
}

double gloria::TileId::FromLatLng(gloria::TileId *this, double *a2, const double *a3, const unsigned __int8 *a4)
{
  int8x16_t v5;

  gloria::TileCoordinate::FromLatLng(this, a2, a3, &v5);
  return gloria::MortonUtils::XYToQuadId((gloria::MortonUtils *)v5.i64[0], v5.i64[1]);
}

id createDeviceIdentifierInternalState()
{
  id v0;
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v0 = objc_alloc_init(MEMORY[0x24BE3CDC8]);
  objc_msgSend(v0, "setStateType:", 201);
  v1 = objc_alloc_init(MEMORY[0x24BE3CE18]);
  objc_msgSend(v0, "setDeviceIdentifier:", v1);

  objc_msgSend(MEMORY[0x24BE3CFE0], "sharedPlatform");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInternalInstall");
  objc_msgSend(v0, "deviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsInternalInstall:", v3);

  +[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isInternalTool");
  objc_msgSend(v0, "deviceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIsInternalTool:", v6);

  return v0;
}

id createStateWithType(uint64_t a1)
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x24BE3CDC8]);
  objc_msgSend(v2, "setStateType:", a1);
  return v2;
}

void sub_23CBB7DEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_23CBB8A50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23CBB8C28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23CBBA12C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_23CBBADD4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void __createApplicationIdentifierState_block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "applicationIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAppType:", a2);

}

id GEOGetGEOAPSequenceAnalyticsLog()
{
  if (qword_2543169B8 != -1)
    dispatch_once(&qword_2543169B8, &__block_literal_global_0);
  return (id)_MergedGlobals_1;
}

void sub_23CBC1B54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23CBC1C10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t CrashReporterSupportLibrary()
{
  uint64_t v0;
  void *v2;

  if (CrashReporterSupportLibraryCore_frameworkLibrary)
    return CrashReporterSupportLibraryCore_frameworkLibrary;
  CrashReporterSupportLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = CrashReporterSupportLibraryCore_frameworkLibrary;
  if (!CrashReporterSupportLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id GEOGetMetroRegionLog()
{
  if (qword_2543169E0 != -1)
    dispatch_once(&qword_2543169E0, &__block_literal_global_2);
  return (id)_MergedGlobals_3;
}

void __eventDenyList_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v0 = objc_msgSend(v2, "copy");
  v1 = (void *)qword_254316BC0;
  qword_254316BC0 = v0;

}

void __stateDenyList_block_invoke()
{
  id v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v0 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  objc_msgSend(v0, "addObject:", CFSTR("CN"));
  v1 = (void *)objc_msgSend(v0, "copy");
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v1, CFSTR("DetailedExperiments"));

  v2 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  objc_msgSend(v2, "addObject:", CFSTR("CN"));
  v3 = (void *)objc_msgSend(v2, "copy");
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v3, CFSTR("Experiments"));

  v4 = objc_msgSend(v6, "copy");
  v5 = (void *)qword_254316BD0;
  qword_254316BD0 = v4;

}

id GEOGetGEOAPUserActionAnalyticsLog()
{
  if (qword_254316C00 != -1)
    dispatch_once(&qword_254316C00, &__block_literal_global_5);
  return (id)_MergedGlobals_6;
}

void sub_23CC30370(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23CC3040C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23CC30508(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_23CC3071C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  va_list va;

  va_start(va, a13);
  v16 = v15;

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(result + 56) = *(_BYTE *)(a2 + 56);
  *(_QWORD *)(result + 48) = v2;
  return result;
}

void sub_23CC30970(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t CoreAnalyticsLibraryCore()
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

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = CoreAnalyticsLibraryCore_frameworkLibrary;
  v6 = CoreAnalyticsLibraryCore_frameworkLibrary;
  if (!CoreAnalyticsLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_250DC0C20;
    v8 = *(_OWORD *)&off_250DC0C30;
    v1 = _sl_dlopen();
    v4[3] = v1;
    CoreAnalyticsLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_23CC31618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t CoreAnalyticsLibrary()
{
  uint64_t v0;
  void *v2;

  v0 = CoreAnalyticsLibraryCore();
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void *getAnalyticsSendEventLazySymbolLoc()
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
  v0 = (void *)getAnalyticsSendEventLazySymbolLoc_ptr;
  v6 = getAnalyticsSendEventLazySymbolLoc_ptr;
  if (!getAnalyticsSendEventLazySymbolLoc_ptr)
  {
    v1 = (void *)CoreAnalyticsLibrary();
    v0 = dlsym(v1, "AnalyticsSendEventLazy");
    v4[3] = (uint64_t)v0;
    getAnalyticsSendEventLazySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_23CC31700(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *geoAnalyticsSendEventLazy(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t (*AnalyticsSendEventLazySymbolLoc)(id, id);
  uint64_t v6;

  v3 = a1;
  v4 = a2;
  AnalyticsSendEventLazySymbolLoc = (uint64_t (*)(id, id))getAnalyticsSendEventLazySymbolLoc();
  if (AnalyticsSendEventLazySymbolLoc)
  {
    v6 = AnalyticsSendEventLazySymbolLoc(v3, v4);

    return (void *)v6;
  }
  else
  {
    dlerror();
    abort_report_np();
    return GeoAnalyticsUserActionConfig_placeCardReveal_dropRate_Metadata_block_invoke();
  }
}

id GEOGetTrafficProbeAnalyticsLog()
{
  if (qword_254316C88 != -1)
    dispatch_once(&qword_254316C88, &__block_literal_global_11);
  return (id)qword_254316C80;
}

void sub_23CC324BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose(&a30, 8);
  _Unwind_Resume(a1);
}

void sub_23CC32940(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

Class __getPPUtilsClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!qword_254316C98)
  {
    qword_254316C98 = _sl_dlopen();
    if (!qword_254316C98)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("PPUtils");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)abort_report_np();
    free(v3);
  }
  _MergedGlobals_12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getMADownloadOptionsClass()
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
  v0 = (void *)getMADownloadOptionsClass_softClass;
  v7 = getMADownloadOptionsClass_softClass;
  if (!getMADownloadOptionsClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getMADownloadOptionsClass_block_invoke;
    v3[3] = &unk_250DC1318;
    v3[4] = &v4;
    __getMADownloadOptionsClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_23CC32D78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23CC32F8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23CC33960(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23CC33BE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getMADownloadOptionsClass_block_invoke(uint64_t a1)
{
  MobileAssetLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MADownloadOptions");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMADownloadOptionsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    MobileAssetLibrary();
  }
}

void MobileAssetLibrary()
{
  void *v0;

  if (!MobileAssetLibraryCore_frameworkLibrary)
  {
    MobileAssetLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!MobileAssetLibraryCore_frameworkLibrary)
    {
      v0 = (void *)abort_report_np();
      free(v0);
    }
  }
}

Class __getMAAssetQueryClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  MobileAssetLibrary();
  result = objc_getClass("MAAssetQuery");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMAAssetQueryClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = abort_report_np();
    return (Class)__getMAAssetClass_block_invoke(v3);
  }
  return result;
}

void __getMAAssetClass_block_invoke(uint64_t a1)
{
  void *v2;
  SEL v3;
  id v4;

  MobileAssetLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MAAsset");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMAAssetClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v2 = (void *)abort_report_np();
    +[GEOAPWiFiConnectionQualityReporter reportWiFiConnectionQuality:](v2, v3, v4);
  }
}

void sub_23CC3501C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x24262F900](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void _registerStateCaptureCallbacks_2()
{
  if (_registerStateCaptureCallbacks_onceToken != -1)
    dispatch_once(&_registerStateCaptureCallbacks_onceToken, &__block_literal_global_8_0);
}

uint64_t ___registerStateCaptureCallbacks_block_invoke()
{
  _stateCaptureCallbackRegistration_2 = 1;
  return _GEOConfigRegisterStateCaptureFunctions();
}

void *_getConfigStoreStringKeysForStateCapture()
{
  return &unk_250DE01F8;
}

id GEOGetGEOAPShowEvalHandlerAnalyticsLog()
{
  if (qword_254316CB8 != -1)
    dispatch_once(&qword_254316CB8, &__block_literal_global_118_0);
  return (id)_MergedGlobals_14;
}

void sub_23CC3C9FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_23CC3CB38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23CC3CC5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23CC3DD7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23CC3DF6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23CC3E7D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

id GEOGetUploadPoliciesAnalyticsLog()
{
  if (qword_254316D08 != -1)
    dispatch_once(&qword_254316D08, &__block_literal_global_140);
  return (id)qword_254316D00;
}

id GEOGetGEOAPSequenceStateAnalyticsLog()
{
  if (qword_254316D18 != -1)
    dispatch_once(&qword_254316D18, &__block_literal_global_19);
  return (id)_MergedGlobals_16;
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

uint64_t GEOApplicationIdentifierOrProcessName()
{
  return MEMORY[0x24BE3C918]();
}

uint64_t GEOBatchLogMessageType()
{
  return MEMORY[0x24BE3C920]();
}

uint64_t GEOCoarseLocationTerritoryInfoContainsPoint()
{
  return MEMORY[0x24BE3C938]();
}

uint64_t GEOConfigGetArray()
{
  return MEMORY[0x24BE3C940]();
}

uint64_t GEOConfigGetBOOL()
{
  return MEMORY[0x24BE3C948]();
}

uint64_t GEOConfigGetBytes()
{
  return MEMORY[0x24BE3C950]();
}

uint64_t GEOConfigGetDate()
{
  return MEMORY[0x24BE3C958]();
}

uint64_t GEOConfigGetDictionary()
{
  return MEMORY[0x24BE3C960]();
}

uint64_t GEOConfigGetDouble()
{
  return MEMORY[0x24BE3C968]();
}

uint64_t GEOConfigGetString()
{
  return MEMORY[0x24BE3C978]();
}

uint64_t GEOConfigGetUInteger()
{
  return MEMORY[0x24BE3C980]();
}

uint64_t GEOConfigGetUint64()
{
  return MEMORY[0x24BE3C988]();
}

uint64_t GEOConfigRemoveBlockListener()
{
  return MEMORY[0x24BE3C990]();
}

uint64_t GEOConfigSetBOOL()
{
  return MEMORY[0x24BE3C9A0]();
}

uint64_t GEOConfigSetBytes()
{
  return MEMORY[0x24BE3C9A8]();
}

uint64_t GEOConfigSetDate()
{
  return MEMORY[0x24BE3C9B0]();
}

uint64_t GEOConfigSetString()
{
  return MEMORY[0x24BE3C9B8]();
}

uint64_t GEOConfigSetUInteger()
{
  return MEMORY[0x24BE3C9C0]();
}

uint64_t GEOCoordinateWithReducedPrecision()
{
  return MEMORY[0x24BE3C9D8]();
}

uint64_t GEOErrorDomain()
{
  return MEMORY[0x24BE3C9F8]();
}

uint64_t GEOFindOrCreateLog()
{
  return MEMORY[0x24BE3CA28]();
}

uint64_t GEOMakeGEOAPBatchID()
{
  return MEMORY[0x24BE3CA40]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _GEOConfigAddBlockListenerForKey()
{
  return MEMORY[0x24BE3D140]();
}

uint64_t _GEOConfigHasValue()
{
  return MEMORY[0x24BE3D150]();
}

uint64_t _GEOConfigRegisterStateCaptureFunctions()
{
  return MEMORY[0x24BE3D158]();
}

uint64_t _GEOConfigRemoveValue()
{
  return MEMORY[0x24BE3D160]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t _geo_isolate_lock()
{
  return MEMORY[0x24BE3D168]();
}

uint64_t _geo_isolate_unlock()
{
  return MEMORY[0x24BE3D170]();
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x24BDAD158]();
}

long double atan(long double __x)
{
  long double result;

  MEMORY[0x24BDAD218](__x);
  return result;
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x24BDAE270](__x);
  return result;
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint64_t geo_assert_not_isolated()
{
  return MEMORY[0x24BE3D178]();
}

uint64_t geo_assert_reentrant_isolated()
{
  return MEMORY[0x24BE3D180]();
}

uint64_t geo_dispatch_queue_create()
{
  return MEMORY[0x24BE3D188]();
}

uint64_t geo_dispatch_queue_create_with_qos()
{
  return MEMORY[0x24BE3D190]();
}

uint64_t geo_get_global_queue()
{
  return MEMORY[0x24BE3D198]();
}

uint64_t geo_isolate_sync()
{
  return MEMORY[0x24BE3D1A0]();
}

uint64_t geo_isolater_create()
{
  return MEMORY[0x24BE3D1B0]();
}

uint64_t geo_reentrant_isolate_sync()
{
  return MEMORY[0x24BE3D1C0]();
}

uint64_t geo_reentrant_isolater_create_with_format()
{
  return MEMORY[0x24BE3D1C8]();
}

long double ldexp(long double __x, int __e)
{
  long double result;

  MEMORY[0x24BDAEA30](*(_QWORD *)&__e, __x);
  return result;
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAA8](__x);
  return result;
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
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

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

void objc_terminate(void)
{
  MEMORY[0x24BEDD450]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
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

