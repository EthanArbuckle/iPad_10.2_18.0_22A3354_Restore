uint64_t CDRichComplicationCornerTextCustomViewRect(uint64_t a1, uint64_t a2)
{
  return +[CDRichComplicationCornerUtilities cornerGaugeCustomViewRectWithPosition:forDevice:](CDRichComplicationCornerUtilities, "cornerGaugeCustomViewRectWithPosition:forDevice:", a2, a1);
}

BOOL CDTemplicateComplicationShouldPerformFullFade(void *a1)
{
  id v1;
  _BOOL8 v2;

  v1 = a1;
  v2 = objc_msgSend(v1, "conformsToProtocol:", &unk_254B7C958)
    && (objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v1, "timelineAnimationFadeTypeOverride") == 1;

  return v2;
}

uint64_t CDRichComplicationCornerGaugeCustomViewRect(uint64_t a1, uint64_t a2)
{
  return +[CDRichComplicationCornerUtilities cornerGaugeCustomViewRectWithPosition:forDevice:](CDRichComplicationCornerUtilities, "cornerGaugeCustomViewRectWithPosition:forDevice:", a2, a1);
}

void sub_2130351AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double CapCircleRadius(double a1, double a2, double a3)
{
  return a2 - (a3 - sqrt(-(a3 * a1) - a3 * a2 + a2 * a1 + a1 * a1) * -1.41421356) + a1;
}

double CapIntersectAngle(double a1, double a2, double a3)
{
  return atan2(a1 - a3, a2 + a3);
}

id CDGenerateMeterLayersOnLayer(void *a1, void *a2)
{
  id v3;
  void (**v4)(id, void *, unint64_t, BOOL, double);
  void *v5;
  unint64_t i;
  void *v7;
  id v8;

  v3 = a1;
  v4 = a2;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 18);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  for (i = 0; i != 18; ++i)
  {
    v7 = (void *)objc_opt_new();
    if (_CDMeterDisabledLayerActions_onceToken != -1)
      dispatch_once(&_CDMeterDisabledLayerActions_onceToken, &__block_literal_global_1);
    objc_msgSend(v7, "setActions:", _CDMeterDisabledLayerActions__dictionary);
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v7, "setFillColor:", objc_msgSend(v8, "CGColor"));

    objc_msgSend(v3, "addSublayer:", v7);
    objc_msgSend(v5, "addObject:", v7);
    if (v4)
      v4[2](v4, v7, i, i == 10, (double)i / 18.0);

  }
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");

  return v5;
}

double CDMeterProgressForIndex(unint64_t a1)
{
  return (double)a1 / 18.0;
}

void CDColorizeMeterProgress(void *a1, void *a2, void *a3, double a4)
{
  id v7;
  id v8;
  id v9;
  unint64_t i;
  void *v11;
  void *v12;
  unint64_t v13;
  id v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v7 = a1;
  v8 = a2;
  v9 = a3;
  if (objc_msgSend(v7, "count"))
  {
    for (i = 0; i < objc_msgSend(v7, "count"); ++i)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", i);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if ((double)i / 18.0 >= a4)
      {
        objc_msgSend(v11, "setFillColor:", 0);
        if (!v9)
          goto LABEL_11;
      }
      else
      {
        v13 = (unint64_t)((double)(unint64_t)objc_msgSend(v8, "count") * a4);
        if (objc_msgSend(v8, "count") <= v13)
          objc_msgSend(v8, "lastObject");
        else
          objc_msgSend(v8, "objectAtIndexedSubscript:", v13);
        v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v12, "setFillColor:", objc_msgSend(v14, "CGColor"));

        if (!v9)
          goto LABEL_11;
      }
      v16[0] = v9;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setFilters:", v15);

LABEL_11:
    }
  }

}

unint64_t CDMeterIndexForProgress(double a1)
{
  return (unint64_t)(a1 * 18.0);
}

id CDGenerateMeterBackgroundGradientColors(uint64_t a1)
{
  uint64_t v1;
  void *i;
  void *v3;

  v1 = a1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", a1);
  for (i = (void *)objc_claimAutoreleasedReturnValue(); v1; --v1)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(i, "addObject:", v3);

  }
  return i;
}

uint64_t CLKUpdateReasonFromCDReason(uint64_t result)
{
  if ((unint64_t)(result - 1) >= 3)
    return 0;
  return result;
}

__n64 perpendicularClockwise(double a1)
{
  float v1;
  __n64 result;

  v1 = -*(float *)&a1;
  result.n64_u32[0] = vdup_lane_s32(*(int32x2_t *)&a1, 1).u32[0];
  result.n64_f32[1] = v1;
  return result;
}

BOOL CDRichComplicationProgressFillStyleIsMetered(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 4;
}

void sub_21303A558(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_21303A78C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double CDRichComplicationCornerGaugeOuterFontSize(void *a1)
{
  double v2[11];

  _LayoutConstants(a1, (uint64_t)v2);
  return v2[0];
}

void _LayoutConstants(void *a1@<X0>, uint64_t a2@<X8>)
{
  id WeakRetained;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  id obj;

  obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_5);
  WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_5);
  if (!WeakRetained)
    goto LABEL_5;
  v4 = WeakRetained;
  v5 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_5);
  if (v5 != obj)
  {

LABEL_5:
    v8 = objc_storeWeak(&_LayoutConstants___cachedDevice_5, obj);
    _LayoutConstants___previousCLKDeviceVersion_5 = objc_msgSend(obj, "version");

    ___LayoutConstants_block_invoke_5(v9, obj);
    goto LABEL_6;
  }
  v6 = objc_msgSend(obj, "version");
  v7 = _LayoutConstants___previousCLKDeviceVersion_5;

  if (v6 != v7)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_5);
  v10 = *(_OWORD *)&qword_254B6FF70;
  *(_OWORD *)(a2 + 32) = xmmword_254B6FF60;
  *(_OWORD *)(a2 + 48) = v10;
  *(_OWORD *)(a2 + 64) = xmmword_254B6FF80;
  *(_QWORD *)(a2 + 80) = qword_254B6FF90;
  v11 = *(_OWORD *)&qword_254B6FF50;
  *(_OWORD *)a2 = _LayoutConstants___constants_0;
  *(_OWORD *)(a2 + 16) = v11;

}

double CDRichComplicationCornerGaugeOuterImageMaxSize(void *a1)
{
  _BYTE v2[72];
  double v3;

  _LayoutConstants(a1, (uint64_t)v2);
  return v3;
}

void sub_21303B988(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void _LayoutConstants_0(void *a1@<X0>, uint64_t a2@<X8>)
{
  id WeakRetained;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  id obj;

  obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_6);
  WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_6);
  if (!WeakRetained)
    goto LABEL_5;
  v4 = WeakRetained;
  v5 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_6);
  if (v5 != obj)
  {

LABEL_5:
    v8 = objc_storeWeak(&_LayoutConstants___cachedDevice_6, obj);
    _LayoutConstants___previousCLKDeviceVersion_6 = objc_msgSend(obj, "version");

    ___LayoutConstants_block_invoke_6(v9, obj);
    goto LABEL_6;
  }
  v6 = objc_msgSend(obj, "version");
  v7 = _LayoutConstants___previousCLKDeviceVersion_6;

  if (v6 != v7)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_6);
  v10 = *(_OWORD *)&qword_254B6FFE0;
  *(_OWORD *)(a2 + 32) = xmmword_254B6FFD0;
  *(_OWORD *)(a2 + 48) = v10;
  *(_OWORD *)(a2 + 64) = xmmword_254B6FFF0;
  *(_QWORD *)(a2 + 80) = qword_254B70000;
  v11 = *(_OWORD *)&qword_254B6FFC0;
  *(_OWORD *)a2 = _LayoutConstants___constants_1;
  *(_OWORD *)(a2 + 16) = v11;

}

void sub_21303C924(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void _LayoutConstants_1(void *a1@<X0>, uint64_t a2@<X8>)
{
  id WeakRetained;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  id obj;

  obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_7);
  WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_7);
  if (!WeakRetained)
    goto LABEL_5;
  v4 = WeakRetained;
  v5 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_7);
  if (v5 != obj)
  {

LABEL_5:
    v8 = objc_storeWeak(&_LayoutConstants___cachedDevice_7, obj);
    _LayoutConstants___previousCLKDeviceVersion_7 = objc_msgSend(obj, "version");

    ___LayoutConstants_block_invoke_7(v9, obj);
    goto LABEL_6;
  }
  v6 = objc_msgSend(obj, "version");
  v7 = _LayoutConstants___previousCLKDeviceVersion_7;

  if (v6 != v7)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_7);
  v10 = *(_OWORD *)&qword_254B70050;
  *(_OWORD *)(a2 + 32) = xmmword_254B70040;
  *(_OWORD *)(a2 + 48) = v10;
  *(_OWORD *)(a2 + 64) = xmmword_254B70060;
  *(_QWORD *)(a2 + 80) = qword_254B70070;
  v11 = *(_OWORD *)&qword_254B70030;
  *(_OWORD *)a2 = _LayoutConstants___constants_2;
  *(_OWORD *)(a2 + 16) = v11;

}

void sub_21303D3EC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_0()
{
  return NSRequestConcreteImplementation();
}

uint64_t OUTLINED_FUNCTION_1()
{
  return objc_opt_class();
}

uint64_t CDShowGossamerUI(void *a1)
{
  id v1;
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;

  v1 = a1;
  os_unfair_lock_lock(&CDShowGossamerUI___lock);
  WeakRetained = objc_loadWeakRetained(&CDShowGossamerUI___cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v3 = WeakRetained;
  v4 = objc_loadWeakRetained(&CDShowGossamerUI___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    v7 = objc_storeWeak(&CDShowGossamerUI___cachedDevice, v1);
    CDShowGossamerUI___previousCLKDeviceVersion = objc_msgSend(v1, "version");

    __CDShowGossamerUI_block_invoke(v8, v1);
    goto LABEL_6;
  }
  v5 = objc_msgSend(v1, "version");
  v6 = CDShowGossamerUI___previousCLKDeviceVersion;

  if (v5 != v6)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock(&CDShowGossamerUI___lock);
  v9 = CDShowGossamerUI___showGossamerUI;

  return v9;
}

id CDRichComplicationMonoFontDescriptor()
{
  if (CDRichComplicationMonoFontDescriptor_onceToken != -1)
    dispatch_once(&CDRichComplicationMonoFontDescriptor_onceToken, &__block_literal_global_5);
  return (id)CDRichComplicationMonoFontDescriptor_fontDescriptor;
}

id CDRichComplicationSemiboldFontDescriptor()
{
  if (CDRichComplicationSemiboldFontDescriptor_onceToken != -1)
    dispatch_once(&CDRichComplicationSemiboldFontDescriptor_onceToken, &__block_literal_global_18);
  return (id)CDRichComplicationSemiboldFontDescriptor_fontDescriptor;
}

void sub_213040568(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double CDRichComplicationCornerTextOuterFontSize(void *a1)
{
  double v2[10];

  _LayoutConstants_2(a1, v2);
  return v2[0];
}

__n128 _LayoutConstants_2@<Q0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  id WeakRetained;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __n128 result;
  id obj;

  obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_8);
  WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_8);
  if (!WeakRetained)
    goto LABEL_5;
  v4 = WeakRetained;
  v5 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_8);
  if (v5 != obj)
  {

LABEL_5:
    v8 = objc_storeWeak(&_LayoutConstants___cachedDevice_8, obj);
    _LayoutConstants___previousCLKDeviceVersion_8 = objc_msgSend(obj, "version");

    ___LayoutConstants_block_invoke_8(v9, obj);
    goto LABEL_6;
  }
  v6 = objc_msgSend(obj, "version");
  v7 = _LayoutConstants___previousCLKDeviceVersion_8;

  if (v6 != v7)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_8);
  v10 = *(_OWORD *)&qword_254B70108;
  a2[2] = xmmword_254B700F8;
  a2[3] = v10;
  a2[4] = xmmword_254B70118;
  v11 = *(_OWORD *)&qword_254B700E8;
  *a2 = _LayoutConstants___constants_3;
  a2[1] = v11;

  return result;
}

double CDRichComplicationCornerTextOuterImageMaxSize(void *a1)
{
  _OWORD v2[3];
  double v3;

  _LayoutConstants_2(a1, v2);
  return v3;
}

void sub_213041034(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

double _LayoutConstants_3(void *a1)
{
  id v1;
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  double v9;

  v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_9);
  WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_9);
  if (!WeakRetained)
    goto LABEL_5;
  v3 = WeakRetained;
  v4 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_9);
  if (v4 != v1)
  {

LABEL_5:
    v7 = objc_storeWeak(&_LayoutConstants___cachedDevice_9, v1);
    _LayoutConstants___previousCLKDeviceVersion_9 = objc_msgSend(v1, "version");

    ___LayoutConstants_block_invoke_9(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  v5 = objc_msgSend(v1, "version");
  v6 = _LayoutConstants___previousCLKDeviceVersion_9;

  if (v5 != v6)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_9);
  v9 = *(double *)&_LayoutConstants_constants_0;

  return v9;
}

double CDRichComplicationCornerInnerImageMaxSize(void *a1)
{
  double v1;

  _LayoutConstants_3(a1);
  return v1;
}

double CDRichComplicationCornerInnerImagePadding(void *a1)
{
  double v1;

  _LayoutConstants_3(a1);
  return v1;
}

void sub_213041D44(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

id _CDLoggingObjectForDomain(uint64_t a1, uint64_t a2)
{
  dispatch_once_t *v3;
  _QWORD v5[6];

  v3 = (dispatch_once_t *)((char *)&_CDLoggingObjectForDomain_onceTokens + 8 * a1);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = ___CDLoggingObjectForDomain_block_invoke;
  v5[3] = &__block_descriptor_48_e5_v8__0l;
  v5[4] = a1;
  v5[5] = a2;
  if (*v3 != -1)
    dispatch_once(v3, v5);
  return (id)_CDLoggingObjectForDomain___logObjects[a1];
}

void sub_2130430D0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

double CDCircularSmallComplicationDiameter(void *a1)
{
  id v1;
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  double v9;

  v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CDCircularSmallComplicationDiameter___lock);
  WeakRetained = objc_loadWeakRetained(&CDCircularSmallComplicationDiameter___cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v3 = WeakRetained;
  v4 = objc_loadWeakRetained(&CDCircularSmallComplicationDiameter___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    v7 = objc_storeWeak(&CDCircularSmallComplicationDiameter___cachedDevice, v1);
    CDCircularSmallComplicationDiameter___previousCLKDeviceVersion = objc_msgSend(v1, "version");

    __CDCircularSmallComplicationDiameter_block_invoke(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  v5 = objc_msgSend(v1, "version");
  v6 = CDCircularSmallComplicationDiameter___previousCLKDeviceVersion;

  if (v5 != v6)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CDCircularSmallComplicationDiameter___lock);
  v9 = *(double *)&CDCircularSmallComplicationDiameter__diameter;

  return v9;
}

double CDCircularMediumComplicationDiameter(void *a1)
{
  id v1;
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  double v9;

  v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CDCircularMediumComplicationDiameter___lock);
  WeakRetained = objc_loadWeakRetained(&CDCircularMediumComplicationDiameter___cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v3 = WeakRetained;
  v4 = objc_loadWeakRetained(&CDCircularMediumComplicationDiameter___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    v7 = objc_storeWeak(&CDCircularMediumComplicationDiameter___cachedDevice, v1);
    CDCircularMediumComplicationDiameter___previousCLKDeviceVersion = objc_msgSend(v1, "version");

    __CDCircularMediumComplicationDiameter_block_invoke(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  v5 = objc_msgSend(v1, "version");
  v6 = CDCircularMediumComplicationDiameter___previousCLKDeviceVersion;

  if (v5 != v6)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CDCircularMediumComplicationDiameter___lock);
  v9 = *(double *)&CDCircularMediumComplicationDiameter__diameter;

  return v9;
}

double CDGraphicSubdialComplicationDiameter(void *a1)
{
  return CDCircularMediumComplicationDiameter(a1) + 4.0;
}

double CDGraphicSubdialComplicationEditingInset()
{
  return 5.0;
}

double CDGraphicSubdialComplicationDistanceFromCenter(void *a1)
{
  id v1;
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  double v9;

  v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CDGraphicSubdialComplicationDistanceFromCenter___lock);
  WeakRetained = objc_loadWeakRetained(&CDGraphicSubdialComplicationDistanceFromCenter___cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v3 = WeakRetained;
  v4 = objc_loadWeakRetained(&CDGraphicSubdialComplicationDistanceFromCenter___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    v7 = objc_storeWeak(&CDGraphicSubdialComplicationDistanceFromCenter___cachedDevice, v1);
    CDGraphicSubdialComplicationDistanceFromCenter___previousCLKDeviceVersion = objc_msgSend(v1, "version");

    __CDGraphicSubdialComplicationDistanceFromCenter_block_invoke(v8, v1);
    goto LABEL_6;
  }
  v5 = objc_msgSend(v1, "version");
  v6 = CDGraphicSubdialComplicationDistanceFromCenter___previousCLKDeviceVersion;

  if (v5 != v6)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CDGraphicSubdialComplicationDistanceFromCenter___lock);
  v9 = *(double *)&CDGraphicSubdialComplicationDistanceFromCenter__distance;

  return v9;
}

double CDGraphicExtraLargeComplicationContentDiameter(void *a1)
{
  id v1;
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  double v9;

  v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CDGraphicExtraLargeComplicationContentDiameter___lock);
  WeakRetained = objc_loadWeakRetained(&CDGraphicExtraLargeComplicationContentDiameter___cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v3 = WeakRetained;
  v4 = objc_loadWeakRetained(&CDGraphicExtraLargeComplicationContentDiameter___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    v7 = objc_storeWeak(&CDGraphicExtraLargeComplicationContentDiameter___cachedDevice, v1);
    CDGraphicExtraLargeComplicationContentDiameter___previousCLKDeviceVersion = objc_msgSend(v1, "version");

    __CDGraphicExtraLargeComplicationContentDiameter_block_invoke(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  v5 = objc_msgSend(v1, "version");
  v6 = CDGraphicExtraLargeComplicationContentDiameter___previousCLKDeviceVersion;

  if (v5 != v6)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CDGraphicExtraLargeComplicationContentDiameter___lock);
  v9 = *(double *)&CDGraphicExtraLargeComplicationContentDiameter__contentDiameter;

  return v9;
}

double CDGraphicLargeRectangularComplicationSize(void *a1)
{
  id v1;
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  double v9;

  v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CDGraphicLargeRectangularComplicationSize___lock);
  WeakRetained = objc_loadWeakRetained(&CDGraphicLargeRectangularComplicationSize___cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v3 = WeakRetained;
  v4 = objc_loadWeakRetained(&CDGraphicLargeRectangularComplicationSize___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    v7 = objc_storeWeak(&CDGraphicLargeRectangularComplicationSize___cachedDevice, v1);
    CDGraphicLargeRectangularComplicationSize___previousCLKDeviceVersion = objc_msgSend(v1, "version");

    __CDGraphicLargeRectangularComplicationSize_block_invoke(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  v5 = objc_msgSend(v1, "version");
  v6 = CDGraphicLargeRectangularComplicationSize___previousCLKDeviceVersion;

  if (v5 != v6)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CDGraphicLargeRectangularComplicationSize___lock);
  v9 = *(double *)&CDGraphicLargeRectangularComplicationSize__complicationSize_0;

  return v9;
}

double CDGraphicLargeRectangularComplicationInset(void *a1)
{
  id v1;
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  double v9;

  v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CDGraphicLargeRectangularComplicationInset___lock);
  WeakRetained = objc_loadWeakRetained(&CDGraphicLargeRectangularComplicationInset___cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v3 = WeakRetained;
  v4 = objc_loadWeakRetained(&CDGraphicLargeRectangularComplicationInset___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    v7 = objc_storeWeak(&CDGraphicLargeRectangularComplicationInset___cachedDevice, v1);
    CDGraphicLargeRectangularComplicationInset___previousCLKDeviceVersion = objc_msgSend(v1, "version");

    __CDGraphicLargeRectangularComplicationInset_block_invoke(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  v5 = objc_msgSend(v1, "version");
  v6 = CDGraphicLargeRectangularComplicationInset___previousCLKDeviceVersion;

  if (v5 != v6)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CDGraphicLargeRectangularComplicationInset___lock);
  v9 = *(double *)&CDGraphicLargeRectangularComplicationInset__inset;

  return v9;
}

double CDGraphicLargeRectangularComplicationLargeImageHeight(void *a1)
{
  id v1;
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  double v9;

  v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CDGraphicLargeRectangularComplicationLargeImageHeight___lock);
  WeakRetained = objc_loadWeakRetained(&CDGraphicLargeRectangularComplicationLargeImageHeight___cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v3 = WeakRetained;
  v4 = objc_loadWeakRetained(&CDGraphicLargeRectangularComplicationLargeImageHeight___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    v7 = objc_storeWeak(&CDGraphicLargeRectangularComplicationLargeImageHeight___cachedDevice, v1);
    CDGraphicLargeRectangularComplicationLargeImageHeight___previousCLKDeviceVersion = objc_msgSend(v1, "version");

    __CDGraphicLargeRectangularComplicationLargeImageHeight_block_invoke(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  v5 = objc_msgSend(v1, "version");
  v6 = CDGraphicLargeRectangularComplicationLargeImageHeight___previousCLKDeviceVersion;

  if (v5 != v6)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CDGraphicLargeRectangularComplicationLargeImageHeight___lock);
  v9 = *(double *)&CDGraphicLargeRectangularComplicationLargeImageHeight__largeImageHeight;

  return v9;
}

double CDGraphicLargeRectangularComplicationCornerRadius(void *a1)
{
  id v1;
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  double v9;

  v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CDGraphicLargeRectangularComplicationCornerRadius___lock);
  WeakRetained = objc_loadWeakRetained(&CDGraphicLargeRectangularComplicationCornerRadius___cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v3 = WeakRetained;
  v4 = objc_loadWeakRetained(&CDGraphicLargeRectangularComplicationCornerRadius___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    v7 = objc_storeWeak(&CDGraphicLargeRectangularComplicationCornerRadius___cachedDevice, v1);
    CDGraphicLargeRectangularComplicationCornerRadius___previousCLKDeviceVersion = objc_msgSend(v1, "version");

    __CDGraphicLargeRectangularComplicationCornerRadius_block_invoke(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  v5 = objc_msgSend(v1, "version");
  v6 = CDGraphicLargeRectangularComplicationCornerRadius___previousCLKDeviceVersion;

  if (v5 != v6)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CDGraphicLargeRectangularComplicationCornerRadius___lock);
  v9 = *(double *)&CDGraphicLargeRectangularComplicationCornerRadius__cornerRadius;

  return v9;
}

double CDGraphicCircularScaledComplicationDiameter(void *a1)
{
  id v1;
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  double v9;

  v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CDGraphicCircularScaledComplicationDiameter___lock);
  WeakRetained = objc_loadWeakRetained(&CDGraphicCircularScaledComplicationDiameter___cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v3 = WeakRetained;
  v4 = objc_loadWeakRetained(&CDGraphicCircularScaledComplicationDiameter___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    v7 = objc_storeWeak(&CDGraphicCircularScaledComplicationDiameter___cachedDevice, v1);
    CDGraphicCircularScaledComplicationDiameter___previousCLKDeviceVersion = objc_msgSend(v1, "version");

    __CDGraphicCircularScaledComplicationDiameter_block_invoke(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  v5 = objc_msgSend(v1, "version");
  v6 = CDGraphicCircularScaledComplicationDiameter___previousCLKDeviceVersion;

  if (v5 != v6)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CDGraphicCircularScaledComplicationDiameter___lock);
  v9 = *(double *)&CDGraphicCircularScaledComplicationDiameter__complicationDiameter;

  return v9;
}

double CDCornerComplicationSize(void *a1)
{
  id v1;
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  double v9;

  v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CDCornerComplicationSize___lock);
  WeakRetained = objc_loadWeakRetained(&CDCornerComplicationSize___cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v3 = WeakRetained;
  v4 = objc_loadWeakRetained(&CDCornerComplicationSize___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    v7 = objc_storeWeak(&CDCornerComplicationSize___cachedDevice, v1);
    CDCornerComplicationSize___previousCLKDeviceVersion = objc_msgSend(v1, "version");

    __CDCornerComplicationSize_block_invoke(v8, v1);
    goto LABEL_6;
  }
  v5 = objc_msgSend(v1, "version");
  v6 = CDCornerComplicationSize___previousCLKDeviceVersion;

  if (v5 != v6)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CDCornerComplicationSize___lock);
  v9 = *(double *)&CDCornerComplicationSize__complicationSize_0;

  return v9;
}

double _avoniaComplicationSize(void *a1)
{
  id v1;
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  double v9;

  v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&_avoniaComplicationSize___lock);
  WeakRetained = objc_loadWeakRetained(&_avoniaComplicationSize___cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v3 = WeakRetained;
  v4 = objc_loadWeakRetained(&_avoniaComplicationSize___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    v7 = objc_storeWeak(&_avoniaComplicationSize___cachedDevice, v1);
    _avoniaComplicationSize___previousCLKDeviceVersion = objc_msgSend(v1, "version");

    ___avoniaComplicationSize_block_invoke(v8, v1);
    goto LABEL_6;
  }
  v5 = objc_msgSend(v1, "version");
  v6 = _avoniaComplicationSize___previousCLKDeviceVersion;

  if (v5 != v6)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_avoniaComplicationSize___lock);
  v9 = *(double *)&_avoniaComplicationSize__complicationSize_0;

  return v9;
}

double CDCornerComplicationKeylineSize(void *a1)
{
  id v1;
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  double v9;

  v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CDCornerComplicationKeylineSize___lock);
  WeakRetained = objc_loadWeakRetained(&CDCornerComplicationKeylineSize___cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v3 = WeakRetained;
  v4 = objc_loadWeakRetained(&CDCornerComplicationKeylineSize___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    v7 = objc_storeWeak(&CDCornerComplicationKeylineSize___cachedDevice, v1);
    CDCornerComplicationKeylineSize___previousCLKDeviceVersion = objc_msgSend(v1, "version");

    __CDCornerComplicationKeylineSize_block_invoke(v8, v1);
    goto LABEL_6;
  }
  v5 = objc_msgSend(v1, "version");
  v6 = CDCornerComplicationKeylineSize___previousCLKDeviceVersion;

  if (v5 != v6)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CDCornerComplicationKeylineSize___lock);
  v9 = *(double *)&CDCornerComplicationKeylineSize__complicationSize_0;

  return v9;
}

double CDCornerComplicationKeylineInnerRadius(void *a1)
{
  id v1;
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  double v9;

  v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CDCornerComplicationKeylineInnerRadius___lock);
  WeakRetained = objc_loadWeakRetained(&CDCornerComplicationKeylineInnerRadius___cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v3 = WeakRetained;
  v4 = objc_loadWeakRetained(&CDCornerComplicationKeylineInnerRadius___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    v7 = objc_storeWeak(&CDCornerComplicationKeylineInnerRadius___cachedDevice, v1);
    CDCornerComplicationKeylineInnerRadius___previousCLKDeviceVersion = objc_msgSend(v1, "version");

    __CDCornerComplicationKeylineInnerRadius_block_invoke(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  v5 = objc_msgSend(v1, "version");
  v6 = CDCornerComplicationKeylineInnerRadius___previousCLKDeviceVersion;

  if (v5 != v6)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CDCornerComplicationKeylineInnerRadius___lock);
  v9 = *(double *)&CDCornerComplicationKeylineInnerRadius__innerDiameter;

  return v9;
}

double CDCornerComplicationCenterPointRadius(void *a1)
{
  id v1;
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  double v9;

  v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CDCornerComplicationCenterPointRadius___lock);
  WeakRetained = objc_loadWeakRetained(&CDCornerComplicationCenterPointRadius___cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v3 = WeakRetained;
  v4 = objc_loadWeakRetained(&CDCornerComplicationCenterPointRadius___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    v7 = objc_storeWeak(&CDCornerComplicationCenterPointRadius___cachedDevice, v1);
    CDCornerComplicationCenterPointRadius___previousCLKDeviceVersion = objc_msgSend(v1, "version");

    __CDCornerComplicationCenterPointRadius_block_invoke(v8, v1);
    goto LABEL_6;
  }
  v5 = objc_msgSend(v1, "version");
  v6 = CDCornerComplicationCenterPointRadius___previousCLKDeviceVersion;

  if (v5 != v6)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CDCornerComplicationCenterPointRadius___lock);
  v9 = *(double *)&CDCornerComplicationCenterPointRadius__complicationCenterRadius;

  return v9;
}

double _avoniaCornerComplicationOuterRadius(void *a1)
{
  id v1;
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  double v9;

  v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&_avoniaCornerComplicationOuterRadius___lock);
  WeakRetained = objc_loadWeakRetained(&_avoniaCornerComplicationOuterRadius___cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v3 = WeakRetained;
  v4 = objc_loadWeakRetained(&_avoniaCornerComplicationOuterRadius___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    v7 = objc_storeWeak(&_avoniaCornerComplicationOuterRadius___cachedDevice, v1);
    _avoniaCornerComplicationOuterRadius___previousCLKDeviceVersion = objc_msgSend(v1, "version");

    ___avoniaCornerComplicationOuterRadius_block_invoke(v8, v1);
    goto LABEL_6;
  }
  v5 = objc_msgSend(v1, "version");
  v6 = _avoniaCornerComplicationOuterRadius___previousCLKDeviceVersion;

  if (v5 != v6)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_avoniaCornerComplicationOuterRadius___lock);
  v9 = *(double *)&_avoniaCornerComplicationOuterRadius__complicationOuterRadius;

  return v9;
}

double CDCornerComplicationClippingSliceAngle(uint64_t a1)
{
  void *v1;
  void *v2;
  double v3;
  double v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDB8738], "metricsWithDevice:identitySizeClass:", a1, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = &unk_24CF2D930;
  v6[1] = &unk_24CF2D948;
  v7[0] = &unk_24CF2DDD0;
  v7[1] = &unk_24CF2DDD0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "constantValue:withOverrides:", v2, 56.0);
  v4 = v3;

  return v4;
}

double CDCornerComplicationTopExclusionSliceAngle(uint64_t a1)
{
  void *v1;
  void *v2;
  double v3;
  double v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDB8738], "metricsWithDevice:identitySizeClass:", a1, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = &unk_24CF2D930;
  v6[1] = &unk_24CF2D948;
  v7[0] = &unk_24CF2DDE0;
  v7[1] = &unk_24CF2DDE0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "constantValue:withOverrides:", v2, 12.0);
  v4 = v3;

  return v4;
}

double CDCornerComplicationSideExclusionSliceAngle(uint64_t a1)
{
  void *v1;
  void *v2;
  double v3;
  double v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDB8738], "metricsWithDevice:identitySizeClass:", a1, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = &unk_24CF2D930;
  v6[1] = &unk_24CF2D948;
  v7[0] = &unk_24CF2DDF0;
  v7[1] = &unk_24CF2DDF0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "constantValue:withOverrides:", v2, 56.0);
  v4 = v3;

  return v4;
}

double CDCornerComplicationInnerUpperCircleRadius(void *a1)
{
  id v1;
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  double v9;

  v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CDCornerComplicationInnerUpperCircleRadius___lock);
  WeakRetained = objc_loadWeakRetained(&CDCornerComplicationInnerUpperCircleRadius___cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v3 = WeakRetained;
  v4 = objc_loadWeakRetained(&CDCornerComplicationInnerUpperCircleRadius___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    v7 = objc_storeWeak(&CDCornerComplicationInnerUpperCircleRadius___cachedDevice, v1);
    CDCornerComplicationInnerUpperCircleRadius___previousCLKDeviceVersion = objc_msgSend(v1, "version");

    __CDCornerComplicationInnerUpperCircleRadius_block_invoke(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  v5 = objc_msgSend(v1, "version");
  v6 = CDCornerComplicationInnerUpperCircleRadius___previousCLKDeviceVersion;

  if (v5 != v6)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CDCornerComplicationInnerUpperCircleRadius___lock);
  v9 = *(double *)&CDCornerComplicationInnerUpperCircleRadius__innerUpperCircleRadius;

  return v9;
}

double CDCornerComplicationInnerUpperTextBaselineRadius(void *a1)
{
  id v1;
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  double v9;

  v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CDCornerComplicationInnerUpperTextBaselineRadius___lock);
  WeakRetained = objc_loadWeakRetained(&CDCornerComplicationInnerUpperTextBaselineRadius___cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v3 = WeakRetained;
  v4 = objc_loadWeakRetained(&CDCornerComplicationInnerUpperTextBaselineRadius___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    v7 = objc_storeWeak(&CDCornerComplicationInnerUpperTextBaselineRadius___cachedDevice, v1);
    CDCornerComplicationInnerUpperTextBaselineRadius___previousCLKDeviceVersion = objc_msgSend(v1, "version");

    __CDCornerComplicationInnerUpperTextBaselineRadius_block_invoke(v8, v1);
    goto LABEL_6;
  }
  v5 = objc_msgSend(v1, "version");
  v6 = CDCornerComplicationInnerUpperTextBaselineRadius___previousCLKDeviceVersion;

  if (v5 != v6)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CDCornerComplicationInnerUpperTextBaselineRadius___lock);
  v9 = *(double *)&CDCornerComplicationInnerUpperTextBaselineRadius__innerUpperBaselineRadius;

  return v9;
}

double CDCornerComplicationInnerLowerTextBaselineRadius(void *a1)
{
  id v1;
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  double v9;

  v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CDCornerComplicationInnerLowerTextBaselineRadius___lock);
  WeakRetained = objc_loadWeakRetained(&CDCornerComplicationInnerLowerTextBaselineRadius___cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v3 = WeakRetained;
  v4 = objc_loadWeakRetained(&CDCornerComplicationInnerLowerTextBaselineRadius___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    v7 = objc_storeWeak(&CDCornerComplicationInnerLowerTextBaselineRadius___cachedDevice, v1);
    CDCornerComplicationInnerLowerTextBaselineRadius___previousCLKDeviceVersion = objc_msgSend(v1, "version");

    __CDCornerComplicationInnerLowerTextBaselineRadius_block_invoke(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  v5 = objc_msgSend(v1, "version");
  v6 = CDCornerComplicationInnerLowerTextBaselineRadius___previousCLKDeviceVersion;

  if (v5 != v6)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CDCornerComplicationInnerLowerTextBaselineRadius___lock);
  v9 = *(double *)&CDCornerComplicationInnerLowerTextBaselineRadius__innerLowerBaselineRadius;

  return v9;
}

double CDCornerComplicationOuterUpperTextBaselineRadius(void *a1)
{
  id v1;
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  double v9;

  v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CDCornerComplicationOuterUpperTextBaselineRadius___lock);
  WeakRetained = objc_loadWeakRetained(&CDCornerComplicationOuterUpperTextBaselineRadius___cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v3 = WeakRetained;
  v4 = objc_loadWeakRetained(&CDCornerComplicationOuterUpperTextBaselineRadius___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    v7 = objc_storeWeak(&CDCornerComplicationOuterUpperTextBaselineRadius___cachedDevice, v1);
    CDCornerComplicationOuterUpperTextBaselineRadius___previousCLKDeviceVersion = objc_msgSend(v1, "version");

    __CDCornerComplicationOuterUpperTextBaselineRadius_block_invoke(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  v5 = objc_msgSend(v1, "version");
  v6 = CDCornerComplicationOuterUpperTextBaselineRadius___previousCLKDeviceVersion;

  if (v5 != v6)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CDCornerComplicationOuterUpperTextBaselineRadius___lock);
  v9 = *(double *)&CDCornerComplicationOuterUpperTextBaselineRadius__outerUpperBaselineRadius;

  return v9;
}

double CDCornerComplicationOuterLowerTextBaselineRadius(void *a1)
{
  id v1;
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  double v9;

  v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CDCornerComplicationOuterLowerTextBaselineRadius___lock);
  WeakRetained = objc_loadWeakRetained(&CDCornerComplicationOuterLowerTextBaselineRadius___cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v3 = WeakRetained;
  v4 = objc_loadWeakRetained(&CDCornerComplicationOuterLowerTextBaselineRadius___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    v7 = objc_storeWeak(&CDCornerComplicationOuterLowerTextBaselineRadius___cachedDevice, v1);
    CDCornerComplicationOuterLowerTextBaselineRadius___previousCLKDeviceVersion = objc_msgSend(v1, "version");

    __CDCornerComplicationOuterLowerTextBaselineRadius_block_invoke(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  v5 = objc_msgSend(v1, "version");
  v6 = CDCornerComplicationOuterLowerTextBaselineRadius___previousCLKDeviceVersion;

  if (v5 != v6)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CDCornerComplicationOuterLowerTextBaselineRadius___lock);
  v9 = *(double *)&CDCornerComplicationOuterLowerTextBaselineRadius__outerLowerBaselineRadius;

  return v9;
}

double CDCornerComplicationTopLeftCenterAngle(void *a1)
{
  id v1;
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  double v9;

  v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CDCornerComplicationTopLeftCenterAngle___lock);
  WeakRetained = objc_loadWeakRetained(&CDCornerComplicationTopLeftCenterAngle___cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v3 = WeakRetained;
  v4 = objc_loadWeakRetained(&CDCornerComplicationTopLeftCenterAngle___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    v7 = objc_storeWeak(&CDCornerComplicationTopLeftCenterAngle___cachedDevice, v1);
    CDCornerComplicationTopLeftCenterAngle___previousCLKDeviceVersion = objc_msgSend(v1, "version");

    __CDCornerComplicationTopLeftCenterAngle_block_invoke(v8, v1);
    goto LABEL_6;
  }
  v5 = objc_msgSend(v1, "version");
  v6 = CDCornerComplicationTopLeftCenterAngle___previousCLKDeviceVersion;

  if (v5 != v6)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CDCornerComplicationTopLeftCenterAngle___lock);
  v9 = *(double *)&CDCornerComplicationTopLeftCenterAngle__cornerTopLeftCenterAngle;

  return v9;
}

double CDCornerComplicationOuterImageCenterRadius(void *a1)
{
  id v1;
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  double v9;

  v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CDCornerComplicationOuterImageCenterRadius___lock);
  WeakRetained = objc_loadWeakRetained(&CDCornerComplicationOuterImageCenterRadius___cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v3 = WeakRetained;
  v4 = objc_loadWeakRetained(&CDCornerComplicationOuterImageCenterRadius___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    v7 = objc_storeWeak(&CDCornerComplicationOuterImageCenterRadius___cachedDevice, v1);
    CDCornerComplicationOuterImageCenterRadius___previousCLKDeviceVersion = objc_msgSend(v1, "version");

    __CDCornerComplicationOuterImageCenterRadius_block_invoke(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  v5 = objc_msgSend(v1, "version");
  v6 = CDCornerComplicationOuterImageCenterRadius___previousCLKDeviceVersion;

  if (v5 != v6)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CDCornerComplicationOuterImageCenterRadius___lock);
  v9 = *(double *)&CDCornerComplicationOuterImageCenterRadius__outerImageCenterRadius;

  return v9;
}

double CDCornerComplicationOuterImageCenterPoint(void *a1)
{
  id v1;
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  double v9;

  v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CDCornerComplicationOuterImageCenterPoint___lock);
  WeakRetained = objc_loadWeakRetained(&CDCornerComplicationOuterImageCenterPoint___cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v3 = WeakRetained;
  v4 = objc_loadWeakRetained(&CDCornerComplicationOuterImageCenterPoint___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    v7 = objc_storeWeak(&CDCornerComplicationOuterImageCenterPoint___cachedDevice, v1);
    CDCornerComplicationOuterImageCenterPoint___previousCLKDeviceVersion = objc_msgSend(v1, "version");

    __CDCornerComplicationOuterImageCenterPoint_block_invoke(v8, v1);
    goto LABEL_6;
  }
  v5 = objc_msgSend(v1, "version");
  v6 = CDCornerComplicationOuterImageCenterPoint___previousCLKDeviceVersion;

  if (v5 != v6)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CDCornerComplicationOuterImageCenterPoint___lock);
  v9 = *(double *)&CDCornerComplicationOuterImageCenterPoint__outerImageCenterPoint_0;

  return v9;
}

double CDCornerComplicationCenterPoint(void *a1)
{
  id v1;
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  double v9;

  v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&CDCornerComplicationCenterPoint___lock);
  WeakRetained = objc_loadWeakRetained(&CDCornerComplicationCenterPoint___cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v3 = WeakRetained;
  v4 = objc_loadWeakRetained(&CDCornerComplicationCenterPoint___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    v7 = objc_storeWeak(&CDCornerComplicationCenterPoint___cachedDevice, v1);
    CDCornerComplicationCenterPoint___previousCLKDeviceVersion = objc_msgSend(v1, "version");

    __CDCornerComplicationCenterPoint_block_invoke(v8, v1);
    goto LABEL_6;
  }
  v5 = objc_msgSend(v1, "version");
  v6 = CDCornerComplicationCenterPoint___previousCLKDeviceVersion;

  if (v5 != v6)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&CDCornerComplicationCenterPoint___lock);
  v9 = *(double *)&CDCornerComplicationCenterPoint__complicationCenterPoint;

  return v9;
}

double ___avoniaComplicationSize_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double result;

  v2 = a2;
  v3 = CDCornerComplicationKeylineInnerRadius(v2);
  v4 = MEMORY[0x2199AA040](objc_msgSend(v2, "screenBounds"));
  v6 = v5;
  v7 = _avoniaCornerComplicationOuterRadius(v2);
  CDCornerComplicationClippingSliceAngle((uint64_t)v2);
  CLKDegreesToRadians();
  *(float *)&v8 = v8;
  v9 = v7 * sinf(*(float *)&v8);
  CLKDegreesToRadians();
  *(float *)&v10 = v10;
  v11 = v3 + v9 / sinf(*(float *)&v10);
  CDCornerComplicationTopExclusionSliceAngle((uint64_t)v2);
  CLKDegreesToRadians();
  *(float *)&v12 = v12;
  v13 = v11 * -0.5;
  *(double *)&_avoniaComplicationSize__complicationSize_0 = v4 + v13 * sinf(*(float *)&v12);
  CDCornerComplicationSideExclusionSliceAngle((uint64_t)v2);

  CLKDegreesToRadians();
  *(float *)&v14 = v14;
  result = v6 + v13 * sinf(*(float *)&v14);
  _avoniaComplicationSize__complicationSize_1 = *(_QWORD *)&result;
  return result;
}

void ___avoniaCornerComplicationOuterRadius_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  double v3;
  double v4;
  double v5;
  double v6;
  float v7;
  float v8;
  double v9;
  double v10;
  float v11;
  float v12;
  double v13;

  v2 = a2;
  v3 = MEMORY[0x2199AA040](objc_msgSend(v2, "screenBounds"));
  v5 = v4;
  CDCornerComplicationClippingSliceAngle((uint64_t)v2);
  CDCornerComplicationSideExclusionSliceAngle((uint64_t)v2);

  CLKDegreesToRadians();
  *(float *)&v6 = v6;
  v7 = tanf(*(float *)&v6);
  v8 = v7 * v7 + 1.0;
  v9 = v3 * sqrtf(v8);
  CLKDegreesToRadians();
  *(float *)&v10 = v10;
  v11 = atanf(*(float *)&v10);
  v12 = v11 * v11 + 1.0;
  v13 = v5 * sqrtf(v12);
  if (v13 >= v9)
    v13 = v9;
  _avoniaCornerComplicationOuterRadius__complicationOuterRadius = *(_QWORD *)&v13;
}

id _CDLayerMaskColorizationFilter(void *a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  void *v12;
  int v13;
  void *v14;
  _DWORD v16[2];
  uint64_t v17;
  int v18;
  float v19;
  float v20;
  uint64_t v21;
  int v22;
  float v23;
  float v24;
  int v25;
  __int128 v26;
  int v27;
  int v28;
  int v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  double v33[3];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v32 = 0u;
  *(_OWORD *)v33 = 0u;
  v3 = a2;
  objc_msgSend(a1, "getRed:green:blue:alpha:", &v32, (char *)&v32 + 8, v33, &v33[1]);
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(v3, "getRed:green:blue:alpha:", &v30, (char *)&v30 + 8, &v31, (char *)&v31 + 8);

  v4 = MEMORY[0x24BDE53E8];
  v5 = *(_DWORD *)(MEMORY[0x24BDE53E8] + 76);
  v6 = *(double *)&v32;
  v7 = *((double *)&v32 + 1);
  v8 = v33[0];
  v9 = *(double *)&v30;
  v10 = *((double *)&v30 + 1);
  v11 = *(double *)&v31;
  objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5A00]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)v16 = v6;
  *(float *)&v16[1] = v9;
  v17 = *(_QWORD *)(v4 + 8);
  v18 = *(_DWORD *)(v4 + 16);
  v19 = v7;
  v20 = v10;
  v21 = *(_QWORD *)(v4 + 28);
  v22 = *(_DWORD *)(v4 + 36);
  v23 = v8;
  v24 = v11;
  v25 = 0;
  v13 = *(_DWORD *)(v4 + 68);
  v26 = *(_OWORD *)(v4 + 52);
  v27 = v13;
  v28 = 1065353216;
  v29 = v5;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCAColorMatrix:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setValue:forKey:", v14, CFSTR("inputColorMatrix"));

  return v12;
}

void sub_213046E00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_213046FF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2130476EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

double CDRichComplicationCornerBaseCircularViewRect(void *a1, uint64_t a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v3 = a1;
  v4 = _LayoutConstants_4(v3);
  v6 = v5;
  v7 = CDCornerComplicationSize(v3);
  objc_msgSend(v3, "sizeClass");
  if (CLKDeviceCategoryForSizeClass() == 5)
    v8 = CDCornerComplicationCenterPoint(v3) - v4 * 0.5;
  else
    v8 = v6;
  switch(a2)
  {
    case 0:
    case 2:
      break;
    case 1:
      v8 = v7 - v8 - v4;
      break;
    case 3:
      v8 = v7 - v8 - v4;
      break;
    default:
      v8 = *MEMORY[0x24BDBEFB0];
      break;
  }

  return v8;
}

double _LayoutConstants_4(void *a1)
{
  id v1;
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  double v9;

  v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_10);
  WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_10);
  if (!WeakRetained)
    goto LABEL_5;
  v3 = WeakRetained;
  v4 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_10);
  if (v4 != v1)
  {

LABEL_5:
    v7 = objc_storeWeak(&_LayoutConstants___cachedDevice_10, v1);
    _LayoutConstants___previousCLKDeviceVersion_10 = objc_msgSend(v1, "version");

    ___LayoutConstants_block_invoke_10(v8, v1);
    goto LABEL_6;
  }
  v5 = objc_msgSend(v1, "version");
  v6 = _LayoutConstants___previousCLKDeviceVersion_10;

  if (v5 != v6)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_10);
  v9 = *(double *)&_LayoutConstants___constants_0_4;

  return v9;
}

double sub_213049AE8()
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  CGRect v6;
  CGRect v7;

  v6.origin.x = sub_213049B48();
  x = v6.origin.x;
  y = v6.origin.y;
  width = v6.size.width;
  height = v6.size.height;
  MidX = CGRectGetMidX(v6);
  v7.origin.x = x;
  v7.origin.y = y;
  v7.size.width = width;
  v7.size.height = height;
  CGRectGetMidY(v7);
  return MidX;
}

double sub_213049B48()
{
  uint64_t v0;
  id v1;
  id v2;
  double v3;
  double v4;

  v1 = objc_msgSend((id)objc_opt_self(), sel_sharedRenderingContext);
  v2 = objc_msgSend(v1, sel_device);

  CDRichComplicationCornerGaugeCustomViewRect((uint64_t)v2, *(_QWORD *)(v0 + 16));
  v4 = v3;

  return v4;
}

double sub_213049BE8()
{
  double *v0;
  double v1;

  sub_213049B48();
  return v1 / *v0;
}

double sub_213049C08()
{
  double v0;

  sub_213049B48();
  return v0;
}

uint64_t sub_213049C24@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[2];

  v29 = a2;
  v3 = sub_2130685B8();
  v27 = *(_QWORD *)(v3 - 8);
  v28 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(a1 + 16);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B6EEC8);
  sub_2130685C4();
  sub_2130685C4();
  sub_2130685C4();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B6EED0);
  sub_2130685C4();
  sub_2130685C4();
  swift_getTupleTypeMetadata2();
  v7 = sub_213068AC8();
  MEMORY[0x2199AA6AC](MEMORY[0x24BDF5428], v7);
  v8 = sub_213068AA4();
  v24 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v24 - v9;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B6EED8);
  v11 = sub_2130685C4();
  v25 = *(_QWORD *)(v11 - 8);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v24 - v15;
  v17 = *(_QWORD *)(a1 + 24);
  v30 = v6;
  v31 = v17;
  v32 = v26;
  sub_213068ABC();
  sub_213068A98();
  swift_getKeyPath();
  v19 = v27;
  v18 = v28;
  (*(void (**)(char *, _QWORD, uint64_t))(v27 + 104))(v5, *MEMORY[0x24BDED100], v28);
  v20 = MEMORY[0x2199AA6AC](MEMORY[0x24BDF4750], v8);
  sub_213068918();
  swift_release();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v5, v18);
  (*(void (**)(char *, uint64_t))(v24 + 8))(v10, v8);
  v21 = sub_21304B778((unint64_t *)&qword_254B6EEE0, &qword_254B6EED8, MEMORY[0x24BDF1028]);
  v33[0] = v20;
  v33[1] = v21;
  MEMORY[0x2199AA6AC](MEMORY[0x24BDED308], v11, v33);
  sub_213059AA0((uint64_t)v14, v11, (uint64_t)v16);
  v22 = *(void (**)(char *, uint64_t))(v25 + 8);
  v22(v14, v11);
  sub_213055E58((uint64_t)v16, v11, v29);
  return ((uint64_t (*)(char *, uint64_t))v22)(v16, v11);
}

void sub_213049F48(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(uint64_t, uint64_t);
  void *v49;
  void *v50;
  void (*v51)(uint64_t, uint64_t, uint64_t);
  uint64_t v52;
  id v53;
  id v54;
  void *v55;
  uint64_t v56;
  char *v57;
  char *v58;
  char *v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  uint64_t v83;
  _QWORD v84[2];
  _QWORD v85[2];
  id v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  id v90;
  uint64_t v91[2];
  _QWORD v92[2];
  _QWORD v93[2];
  _QWORD v94[2];
  _QWORD v95[2];
  _QWORD v96[2];

  v56 = a3;
  v81 = a4;
  v62 = *(_QWORD *)(a2 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v58 = (char *)&v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B6EEC8);
  v8 = sub_2130685C4();
  v70 = *(_QWORD *)(v8 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v57 = (char *)&v56 - v9;
  v10 = sub_2130685C4();
  v73 = *(_QWORD *)(v10 - 8);
  v65 = v10;
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v59 = (char *)&v56 - v11;
  v12 = sub_2130685C4();
  v77 = *(_QWORD *)(v12 - 8);
  v67 = v12;
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v61 = (char *)&v56 - v13;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B6EED0);
  v14 = sub_2130685C4();
  v15 = *(_QWORD *)(v14 - 8);
  v74 = v14;
  v79 = v15;
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v66 = (char *)&v56 - v16;
  v17 = sub_2130685C4();
  v80 = *(_QWORD *)(v17 - 8);
  v18 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v72 = (char *)&v56 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v78 = (uint64_t)&v56 - v20;
  v60 = type metadata accessor for ComplicationCornerGaugeView(0, a2, a3, v21);
  sub_213049B48();
  sub_213049B48();
  v76 = *(_QWORD *)(a1 + 16);
  v22 = *(void **)(a1 + 32);
  v75 = *(_QWORD *)(a1 + 24);
  v23 = *(_QWORD *)(a1 + 56);
  v69 = *(_QWORD *)(a1 + 48);
  v68 = v23;
  v24 = *(void **)(a1 + 40);
  type metadata accessor for MonochromeModel();
  sub_21304C434((unint64_t *)&qword_254B6EEE8, (uint64_t (*)(uint64_t))type metadata accessor for MonochromeModel, (uint64_t)&protocol conformance descriptor for MonochromeModel);
  v71 = v24;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v25 = v22;
  v64 = sub_2130685AC();
  v63 = v26;
  v27 = v58;
  (*(void (**)(void))(a1 + 64))();
  swift_getKeyPath();
  LOBYTE(v85[0]) = 1;
  v28 = v57;
  v29 = v56;
  sub_213068918();
  swift_release();
  (*(void (**)(char *, uint64_t))(v62 + 8))(v27, a2);
  sub_213068AEC();
  v30 = sub_21304B778(&qword_254B6EEF0, &qword_254B6EEC8, MEMORY[0x24BDF1028]);
  v96[0] = v29;
  v96[1] = v30;
  v31 = MEMORY[0x24BDED308];
  v32 = MEMORY[0x2199AA6AC](MEMORY[0x24BDED308], v8, v96);
  v33 = v59;
  sub_213068924();
  (*(void (**)(char *, uint64_t))(v70 + 8))(v28, v8);
  sub_213068ABC();
  v95[0] = v32;
  v95[1] = MEMORY[0x24BDEBF50];
  v34 = v65;
  v35 = MEMORY[0x2199AA6AC](v31, v65, v95);
  v36 = v61;
  sub_213068954();
  (*(void (**)(char *, uint64_t))(v73 + 8))(v33, v34);
  v94[0] = v35;
  v94[1] = MEMORY[0x24BDEBEE0];
  v37 = v67;
  v38 = MEMORY[0x2199AA6AC](v31, v67, v94);
  sub_21304B734();
  v39 = v66;
  sub_213068984();
  (*(void (**)(char *, uint64_t))(v77 + 8))(v36, v37);
  sub_213049AE8();
  v40 = sub_21304B778(&qword_254B6EF00, &qword_254B6EED0, MEMORY[0x24BDEB950]);
  v93[0] = v38;
  v93[1] = v40;
  v41 = v74;
  v42 = MEMORY[0x2199AA6AC](v31, v74, v93);
  v43 = (uint64_t)v72;
  sub_213068978();
  (*(void (**)(char *, uint64_t))(v79 + 8))(v39, v41);
  v44 = sub_21304B7B8();
  v92[0] = v42;
  v92[1] = v44;
  v45 = MEMORY[0x2199AA6AC](v31, v17, v92);
  v46 = v78;
  sub_213059AA0(v43, v17, v78);
  v47 = v80;
  v48 = *(void (**)(uint64_t, uint64_t))(v80 + 8);
  v48(v43, v17);
  v85[0] = v76;
  v85[1] = v75;
  v49 = v71;
  v86 = v71;
  v87 = v69;
  v88 = v68;
  v89 = v64;
  v50 = v63;
  v90 = v63;
  v91[0] = (uint64_t)v85;
  v51 = *(void (**)(uint64_t, uint64_t, uint64_t))(v47 + 16);
  v52 = v46;
  v51(v43, v46, v17);
  v91[1] = v43;
  v53 = v49;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v54 = v50;
  v84[0] = &type metadata for ComplicationCornerGaugeViewRepresentable;
  v84[1] = v17;
  v82 = sub_21304B7FC();
  v83 = v45;
  sub_213050490(v91, 2uLL, (uint64_t)v84);
  v48(v52, v17);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v48(v43, v17);
  v55 = v86;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

uint64_t sub_21304A6C8()
{
  return sub_21306893C();
}

uint64_t sub_21304A6E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_213049C24(a1, a2);
}

void sub_21304A720(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  double v25;
  __int128 v26;

  v3 = *(_QWORD *)(v1 + 24);
  v4 = swift_bridgeObjectRetain();
  v5 = sub_2130579C0(v4);
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, v5, 0);
LABEL_3:
    v8 = v7;
    swift_bridgeObjectRelease();

    goto LABEL_13;
  }
  v9 = *(_QWORD *)(v3 + 16);
  if (v9)
  {
    swift_bridgeObjectRetain();
    v10 = 0;
    while (1)
    {
      v11 = *(id *)(v3 + 8 * v10 + 32);
      v12 = objc_msgSend(v11, sel_imageProvider);

      if (v12)
        break;
      ++v10;

      if (v9 == v10)
      {
        swift_bridgeObjectRelease_n();
        goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
    v6 = objc_msgSend(v11, sel_imageProvider);

    if (v6)
    {
      v7 = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, 0, v6);
      goto LABEL_3;
    }
  }
  swift_bridgeObjectRelease();
LABEL_12:
  v8 = 0;
LABEL_13:
  v13 = *(_QWORD *)(v1 + 32);
  v14 = swift_bridgeObjectRetain();
  v15 = sub_2130579C0(v14);
  if (v15)
  {
    v16 = v15;
    v17 = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, v15, 0);
LABEL_15:
    v18 = v17;
    swift_bridgeObjectRelease();

    goto LABEL_25;
  }
  v19 = *(_QWORD *)(v13 + 16);
  if (v19)
  {
    swift_bridgeObjectRetain();
    v20 = 0;
    while (1)
    {
      v21 = *(id *)(v13 + 8 * v20 + 32);
      v22 = objc_msgSend(v21, sel_imageProvider);

      if (v22)
        break;
      ++v20;

      if (v19 == v20)
      {
        swift_bridgeObjectRelease_n();
        goto LABEL_24;
      }
    }
    swift_bridgeObjectRelease();
    v16 = objc_msgSend(v21, sel_imageProvider);

    if (v16)
    {
      v17 = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, 0, v16);
      goto LABEL_15;
    }
  }
  swift_bridgeObjectRelease();
LABEL_24:
  v18 = 0;
LABEL_25:
  objc_msgSend(a1, sel_handleGaugeProvider_leftLabelProvider_rightLabelProvider_, *(_QWORD *)(v1 + 16), v8, v18);
  v26 = *(_OWORD *)(v1 + 40);
  objc_msgSend(a1, sel_setFilterProvider_, *((_QWORD *)&v26 + 1));
  objc_msgSend(a1, sel_setCornerComplicationPosition_, *(_QWORD *)v1);
  objc_msgSend(a1, sel_setFontStyle_, *(_QWORD *)(v1 + 8));
  objc_msgSend(a1, sel_setNeedsLayout);
  objc_msgSend(a1, sel_layoutIfNeeded);
  swift_getKeyPath();
  swift_getKeyPath();
  v23 = *((id *)&v26 + 1);
  sub_2130684A4();
  swift_release();
  swift_release();
  sub_21304C524((uint64_t)&v26);
  if (v25 >= 1.0)
  {
    objc_msgSend(a1, sel_updateMonochromeColor, v25);
  }
  else
  {
    swift_getKeyPath();
    swift_getKeyPath();
    v24 = v23;
    sub_2130684A4();
    swift_release();
    swift_release();
    sub_21304C524((uint64_t)&v26);
    objc_msgSend(a1, sel_transitionToMonochromeWithFraction_, v25);
  }

}

uint64_t sub_21304AAB8()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  _QWORD v8[6];

  v1 = (void *)objc_opt_self();
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = v0;
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = sub_21304B864;
  *(_QWORD *)(v3 + 24) = v2;
  v8[4] = sub_21304B8B0;
  v8[5] = v3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 1107296256;
  v8[2] = sub_213061058;
  v8[3] = &block_descriptor;
  v4 = _Block_copy(v8);
  v5 = v0;
  swift_retain();
  swift_release();
  objc_msgSend(v1, sel_performWithoutAnimation_, v4);
  _Block_release(v4);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
    __break(1u);
  return result;
}

id sub_21304AC64()
{
  return sub_21304AFB0(type metadata accessor for ComplicationCornerGaugeViewRepresentable._CornerView);
}

uint64_t type metadata accessor for ComplicationCornerGaugeViewRepresentable._CornerView()
{
  return objc_opt_self();
}

id sub_21304AC90()
{
  _QWORD *v0;
  id v1;

  v1 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ComplicationCornerGaugeViewRepresentable._CornerView()), sel_initWithFontFallback_, 1, *v0, v0[1], v0[2], v0[3], v0[4], v0[5], v0[6]);
  sub_21304A720(v1);
  return v1;
}

uint64_t sub_21304AD04()
{
  return sub_2130686FC();
}

uint64_t sub_21304AD44()
{
  sub_21304C4D8();
  return sub_21306875C();
}

uint64_t sub_21304AD94()
{
  sub_21304C4D8();
  return sub_213068708();
}

void sub_21304ADE4()
{
  sub_21304C4D8();
  sub_213068750();
  __break(1u);
}

id sub_21304AE08(id a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  id v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v11;

  if (a1)
  {
    v7 = objc_msgSend(a1, sel_style);
    v8 = *(_QWORD *)&v3[OBJC_IVAR____TtC19ComplicationDisplay35_ComplicationCornerDynamicGaugeView_fillStyle];
    if (v7 == (id)*MEMORY[0x24BDB85E8])
    {
      if (v8 != 7)
      {
        v9 = 7;
LABEL_7:
        *(_QWORD *)&v3[OBJC_IVAR____TtC19ComplicationDisplay35_ComplicationCornerDynamicGaugeView_fillStyle] = v9;
        objc_msgSend(v3, sel__replaceProgressView_);
      }
    }
    else if (v8 == 7)
    {
      v9 = 0;
      goto LABEL_7;
    }
  }
  v11.receiver = v3;
  v11.super_class = (Class)type metadata accessor for _ComplicationCornerDynamicGaugeView();
  return objc_msgSendSuper2(&v11, sel_handleGaugeProvider_leftLabelProvider_rightLabelProvider_, a1, a2, a3);
}

id sub_21304AFA4()
{
  return sub_21304AFB0(type metadata accessor for _ComplicationCornerDynamicGaugeView);
}

id sub_21304AFB0(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for _ComplicationCornerDynamicGaugeView()
{
  return objc_opt_self();
}

void type metadata accessor for SymbolScale(uint64_t a1)
{
  sub_21304C00C(a1, &qword_254B6EE10);
}

void type metadata accessor for ComplicationViewFontStyle(uint64_t a1)
{
  sub_21304C00C(a1, &qword_254B6EE18);
}

void type metadata accessor for ComplicationCornerViewPosition(uint64_t a1)
{
  sub_21304C00C(a1, &qword_254B6EE20);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_21304B04C(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_21304B06C(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
  sub_21304C00C(a1, &qword_254B6EE28);
}

void type metadata accessor for CGPoint(uint64_t a1)
{
  sub_21304C00C(a1, &qword_254B6EE30);
}

void type metadata accessor for CDRichComplicationProgressFillStyle(uint64_t a1)
{
  sub_21304C00C(a1, qword_254B6EE38);
}

uint64_t sub_21304B0D0()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t initializeBufferWithCopyOfBuffer for ComplicationCurvedTextConfiguration(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_21304B108(uint64_t a1)
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_21304B148(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  v4 = *(void **)(a2 + 32);
  v5 = *(void **)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = v5;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  v6 = *(_QWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 72) = v6;
  v7 = v4;
  v8 = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

_QWORD *sub_21304B1C8(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;

  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  v4 = (void *)a2[4];
  v5 = (void *)a1[4];
  a1[4] = v4;
  v6 = v4;

  v7 = (void *)a2[5];
  v8 = (void *)a1[5];
  a1[5] = v7;
  v9 = v7;

  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10 = a2[9];
  a1[8] = a2[8];
  a1[9] = v10;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy80_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

uint64_t sub_21304B2A0(uint64_t a1, _OWORD *a2)
{
  __int128 v4;
  void *v5;

  v4 = a2[1];
  *(_OWORD *)a1 = *a2;
  *(_OWORD *)(a1 + 16) = v4;

  v5 = *(void **)(a1 + 40);
  *(_OWORD *)(a1 + 32) = a2[2];

  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 48) = a2[3];
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 64) = a2[4];
  swift_release();
  return a1;
}

uint64_t sub_21304B30C(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 80))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_21304B354(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 80) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 32) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 80) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t type metadata accessor for ComplicationCornerGaugeView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ComplicationCornerGaugeView);
}

void type metadata accessor for CLKMonochromeFilterStyle(uint64_t a1)
{
  sub_21304C00C(a1, &qword_254B6EEC0);
}

BOOL sub_21304B3C8(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_21304B3DC(uint64_t a1, uint64_t a2)
{
  return sub_21304B4A4(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_21304B3E8()
{
  sub_213068B58();
  sub_213068B64();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21304B428()
{
  uint64_t v0;

  sub_213068B58();
  sub_213068C9C();
  sub_213068B64();
  v0 = sub_213068CB4();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_21304B498(uint64_t a1, uint64_t a2)
{
  return sub_21304B4A4(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_21304B4A4(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_213068B58();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_21304B4E0(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_213068B40();
  *a2 = 0;
  return result;
}

uint64_t sub_21304B554(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_213068B4C();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_21304B5D0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_213068B58();
  v2 = sub_213068B34();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

void sub_21304B610(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_21304B618@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

BOOL sub_21304B62C(_QWORD *a1, uint64_t *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = *v2 & *a2;
  if (v4 != *a2)
    *v2 |= v3;
  *a1 = v3;
  return v4 != v3;
}

_QWORD *sub_21304B65C(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_21304B670(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

_QWORD *sub_21304B684@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_21304B694(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_21304B6A0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2199AA6A0](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void sub_21304B718(uint64_t a1@<X8>)
{
  uint64_t *v1;

  sub_213049F48(v1[4], v1[2], v1[3], a1);
}

unint64_t sub_21304B734()
{
  unint64_t result;

  result = qword_254B6EEF8;
  if (!qword_254B6EEF8)
  {
    result = MEMORY[0x2199AA6AC](MEMORY[0x24BDF4440], MEMORY[0x24BDF4458]);
    atomic_store(result, (unint64_t *)&qword_254B6EEF8);
  }
  return result;
}

uint64_t sub_21304B778(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x2199AA6AC](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_21304B7B8()
{
  unint64_t result;

  result = qword_254B6EF08;
  if (!qword_254B6EF08)
  {
    result = MEMORY[0x2199AA6AC](MEMORY[0x24BDED5C0], MEMORY[0x24BDED5D0]);
    atomic_store(result, (unint64_t *)&qword_254B6EF08);
  }
  return result;
}

unint64_t sub_21304B7FC()
{
  unint64_t result;

  result = qword_254B6EF10;
  if (!qword_254B6EF10)
  {
    result = MEMORY[0x2199AA6AC](&unk_21306BA7C, &type metadata for ComplicationCornerGaugeViewRepresentable);
    atomic_store(result, (unint64_t *)&qword_254B6EF10);
  }
  return result;
}

uint64_t sub_21304B840()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_21304B864()
{
  uint64_t v0;
  objc_super v2;

  v2.receiver = *(id *)(v0 + 16);
  v2.super_class = (Class)type metadata accessor for ComplicationCornerGaugeViewRepresentable._CornerView();
  return objc_msgSendSuper2(&v2, sel_layoutSubviews);
}

uint64_t sub_21304B8A0()
{
  return swift_deallocObject();
}

uint64_t sub_21304B8B0()
{
  uint64_t v0;

  return sub_213061038(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_21304B8D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_213068B58();
  v2 = v1;
  if (v0 == sub_213068B58() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_213068C90();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

_QWORD *sub_21304B958@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_21304B964@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_213068B34();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_21304B9A8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_213068B58();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_21304B9D0()
{
  sub_21304C434(&qword_254B6EF48, (uint64_t (*)(uint64_t))type metadata accessor for RBDrawableStatisticsKey, (uint64_t)&unk_21306BA3C);
  sub_21304C434((unint64_t *)&unk_254B6EF50, (uint64_t (*)(uint64_t))type metadata accessor for RBDrawableStatisticsKey, (uint64_t)&unk_21306B99C);
  return sub_213068C78();
}

void sub_21304BA54(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, void *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, double a10@<D0>, double a11@<D1>)
{
  void *v17;
  id v18;
  id v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  int64_t v24;
  uint64_t i;
  id v26;
  id v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  double *v32;
  id v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  int64_t v37;
  id *v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  double *v45;
  id v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  void *v50;
  id v51;
  id v52;
  void *v58;
  uint64_t v59;
  uint64_t v60;

  v17 = (void *)objc_opt_self();
  v52 = a3;
  v51 = a4;
  v18 = objc_msgSend(v17, sel_sharedRenderingContext);
  v19 = objc_msgSend(v18, sel_device);

  v50 = v19;
  v20 = CDRichComplicationCornerInnerImageMaxSize(v19);
  v22 = v21;
  v23 = MEMORY[0x24BEE4AF8];
  v24 = *(_QWORD *)(a5 + 16);
  if (!v24)
  {
    swift_bridgeObjectRelease();
    v34 = MEMORY[0x24BEE4AF8];
    v37 = *(_QWORD *)(a6 + 16);
    if (!v37)
      goto LABEL_31;
    goto LABEL_18;
  }
  v49 = a6;
  v59 = MEMORY[0x24BEE4AF8];
  sub_21304E408(0, v24, 0);
  for (i = 0; i != v24; ++i)
  {
    v26 = *(id *)(a5 + 8 * i + 32);
    v27 = objc_msgSend(v26, sel_textProvider);
    objc_msgSend(v27, sel_finalize);
    v28 = objc_msgSend(v26, sel_imageProvider);
    v29 = v28;
    if (v28)
    {
      objc_msgSend(v28, sel_copy);

      sub_213068BF4();
      swift_unknownObjectRelease();
      sub_21304BF90();
      if ((swift_dynamicCast() & 1) != 0)
      {
        v29 = v58;
        type metadata accessor for WidgetNamedImageProvider(0);
        v30 = swift_dynamicCastClass();
        if (v30)
        {
          v31 = OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_finalized;
          if ((*(_BYTE *)(v30 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_finalized) & 1) == 0)
          {
            v32 = (double *)(v30 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider__maxSize);
            *v32 = v20;
            v32[1] = v22;
            *(_BYTE *)(v30 + v31) = 1;
          }
        }
        else
        {
          objc_msgSend(v58, sel_finalizeWithMaxSDKSize_maxDeviceSize_maskToCircle_, 0, v20, v22, v20, v22);
        }
      }
      else
      {
        v29 = 0;
      }
    }
    v33 = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, v27, v29);

    v34 = v59;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_21304E408(0, *(_QWORD *)(v59 + 16) + 1, 1);
      v34 = v59;
    }
    v36 = *(_QWORD *)(v34 + 16);
    v35 = *(_QWORD *)(v34 + 24);
    if (v36 >= v35 >> 1)
    {
      sub_21304E408((char *)(v35 > 1), v36 + 1, 1);
      v34 = v59;
    }
    *(_QWORD *)(v34 + 16) = v36 + 1;
    *(_QWORD *)(v34 + 8 * v36 + 32) = v33;
  }
  swift_bridgeObjectRelease();
  a6 = v49;
  v23 = MEMORY[0x24BEE4AF8];
  v37 = *(_QWORD *)(v49 + 16);
  if (v37)
  {
LABEL_18:
    v60 = v23;
    sub_21304E408(0, v37, 0);
    v38 = (id *)(a6 + 32);
    do
    {
      v39 = *v38;
      v40 = objc_msgSend(v39, sel_textProvider);
      objc_msgSend(v40, sel_finalize);
      v41 = objc_msgSend(v39, sel_imageProvider);
      v42 = v41;
      if (v41)
      {
        objc_msgSend(v41, sel_copy);

        sub_213068BF4();
        swift_unknownObjectRelease();
        sub_21304BF90();
        if ((swift_dynamicCast() & 1) != 0)
        {
          v42 = v58;
          type metadata accessor for WidgetNamedImageProvider(0);
          v43 = swift_dynamicCastClass();
          if (v43)
          {
            v44 = OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_finalized;
            if ((*(_BYTE *)(v43 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_finalized) & 1) == 0)
            {
              v45 = (double *)(v43 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider__maxSize);
              *v45 = v20;
              v45[1] = v22;
              *(_BYTE *)(v43 + v44) = 1;
            }
          }
          else
          {
            objc_msgSend(v58, sel_finalizeWithMaxSDKSize_maxDeviceSize_maskToCircle_, 0, v20, v22, v20, v22);
          }
        }
        else
        {
          v42 = 0;
        }
      }
      v46 = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, v40, v42);

      v23 = v60;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_21304E408(0, *(_QWORD *)(v60 + 16) + 1, 1);
        v23 = v60;
      }
      v48 = *(_QWORD *)(v23 + 16);
      v47 = *(_QWORD *)(v23 + 24);
      if (v48 >= v47 >> 1)
      {
        sub_21304E408((char *)(v47 > 1), v48 + 1, 1);
        v23 = v60;
      }
      *(_QWORD *)(v23 + 16) = v48 + 1;
      *(_QWORD *)(v23 + 8 * v48 + 32) = v46;
      ++v38;
      --v37;
    }
    while (v37);
  }
LABEL_31:

  *(double *)a9 = a10;
  *(double *)(a9 + 8) = a11;
  *(_QWORD *)(a9 + 16) = a1;
  *(_QWORD *)(a9 + 24) = a2;
  *(_QWORD *)(a9 + 32) = v52;
  *(_QWORD *)(a9 + 40) = v51;
  *(_QWORD *)(a9 + 48) = v34;
  *(_QWORD *)(a9 + 56) = v23;
  *(_QWORD *)(a9 + 64) = a7;
  *(_QWORD *)(a9 + 72) = a8;
}

unint64_t sub_21304BF90()
{
  unint64_t result;

  result = qword_254B6EF18;
  if (!qword_254B6EF18)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254B6EF18);
  }
  return result;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x2199AA634](a1, v6, a5);
}

void type metadata accessor for RBDrawableStatisticsKey(uint64_t a1)
{
  sub_21304C00C(a1, &qword_254B6EF20);
}

void sub_21304C00C(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

void destroy for ComplicationCornerGaugeViewRepresentable(uint64_t a1)
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

uint64_t initializeWithCopy for ComplicationCornerGaugeViewRepresentable(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(void **)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  v6 = *(void **)(a2 + 48);
  *(_QWORD *)(a1 + 48) = v6;
  v7 = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v8 = v6;
  return a1;
}

_QWORD *assignWithCopy for ComplicationCornerGaugeViewRepresentable(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  *a1 = *a2;
  a1[1] = a2[1];
  v4 = (void *)a2[2];
  v5 = (void *)a1[2];
  a1[2] = v4;
  v6 = v4;

  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  v7 = (void *)a2[6];
  v8 = (void *)a1[6];
  a1[6] = v7;
  v9 = v7;

  return a1;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for ComplicationCornerGaugeViewRepresentable(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;

  *(_OWORD *)a1 = *(_OWORD *)a2;

  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 48);
  v5 = *(void **)(a1 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v4;

  return a1;
}

uint64_t getEnumTagSinglePayload for ComplicationCornerGaugeViewRepresentable(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 56))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ComplicationCornerGaugeViewRepresentable(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 56) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ComplicationCornerGaugeViewRepresentable()
{
  return &type metadata for ComplicationCornerGaugeViewRepresentable;
}

uint64_t sub_21304C2A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[2];

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B6EEC8);
  sub_2130685C4();
  sub_2130685C4();
  sub_2130685C4();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B6EED0);
  sub_2130685C4();
  sub_2130685C4();
  swift_getTupleTypeMetadata2();
  v0 = sub_213068AC8();
  MEMORY[0x2199AA6AC](MEMORY[0x24BDF5428], v0);
  v1 = sub_213068AA4();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B6EED8);
  v2 = sub_2130685C4();
  v4[0] = MEMORY[0x2199AA6AC](MEMORY[0x24BDF4750], v1);
  v4[1] = sub_21304B778((unint64_t *)&qword_254B6EEE0, &qword_254B6EED8, MEMORY[0x24BDF1028]);
  return MEMORY[0x2199AA6AC](MEMORY[0x24BDED308], v2, v4);
}

uint64_t sub_21304C408()
{
  return sub_21304C434(&qword_254B6EF28, (uint64_t (*)(uint64_t))type metadata accessor for RBDrawableStatisticsKey, (uint64_t)&unk_21306B964);
}

uint64_t sub_21304C434(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2199AA6AC](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21304C474()
{
  return sub_21304C434(&qword_254B6EF30, (uint64_t (*)(uint64_t))type metadata accessor for RBDrawableStatisticsKey, (uint64_t)&unk_21306B93C);
}

uint64_t sub_21304C4A0()
{
  return sub_21304C434(&qword_254B6EF38, (uint64_t (*)(uint64_t))type metadata accessor for RBDrawableStatisticsKey, (uint64_t)&unk_21306B9CC);
}

uint64_t sub_21304C4CC()
{
  return MEMORY[0x24BDF5560];
}

unint64_t sub_21304C4D8()
{
  unint64_t result;

  result = qword_254B6EF40;
  if (!qword_254B6EF40)
  {
    result = MEMORY[0x2199AA6AC](&unk_21306B8AC, &type metadata for ComplicationCornerGaugeViewRepresentable);
    atomic_store(result, (unint64_t *)&qword_254B6EF40);
  }
  return result;
}

uint64_t sub_21304C524(uint64_t a1)
{

  return a1;
}

uint64_t sub_21304C564()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_21304C570()
{
  return swift_release();
}

_QWORD *sub_21304C578(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  v4 = a2[2];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = v4;
  swift_retain();
  return a1;
}

_QWORD *sub_21304C5AC(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  *a1 = *a2;
  v3 = a2[2];
  a1[1] = a2[1];
  a1[2] = v3;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t sub_21304C600(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  return a1;
}

uint64_t sub_21304C638(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_21304C680(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t type metadata accessor for ComplicationCornerCircularView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ComplicationCornerCircularView);
}

uint64_t sub_21304C6CC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21304C700()
{
  return sub_213068630();
}

uint64_t sub_21304C720(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_2130685B8();
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_21306863C();
}

double sub_21304C7A0(uint64_t a1)
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  CGRect v7;
  CGRect v8;

  v7.origin.x = sub_21304C800(a1);
  x = v7.origin.x;
  y = v7.origin.y;
  width = v7.size.width;
  height = v7.size.height;
  MidX = CGRectGetMidX(v7);
  v8.origin.x = x;
  v8.origin.y = y;
  v8.size.width = width;
  v8.size.height = height;
  CGRectGetMidY(v8);
  return MidX;
}

double sub_21304C800(uint64_t a1)
{
  id v2;
  id v3;
  double v4;

  v2 = objc_msgSend((id)objc_opt_self(), sel_sharedRenderingContext);
  v3 = objc_msgSend(v2, sel_device);

  v4 = CDRichComplicationCornerBaseCircularViewRect(v3, a1);
  return v4;
}

double sub_21304C8A4(uint64_t a1)
{
  double v1;

  sub_21304C800(a1);
  return v1;
}

uint64_t sub_21304C8C0@<X0>(uint64_t a1@<X0>, void (*a2)(double)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(uint64_t, uint64_t);
  _QWORD v46[3];
  char *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD v61[2];
  _QWORD v62[2];
  _QWORD v63[2];
  _QWORD v64[3];

  v51 = a5;
  v46[2] = a3;
  v46[1] = a2;
  v60 = a6;
  v9 = sub_2130685B8();
  v58 = *(_QWORD *)(v9 - 8);
  v59 = v9;
  v10 = MEMORY[0x24BDAC7A8](v9);
  v57 = (char *)v46 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = *(_QWORD *)(a4 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_2130685C4();
  v49 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)v46 - v15;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B6EED0);
  v17 = sub_2130685C4();
  v53 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)v46 - v18;
  v20 = sub_2130685C4();
  v21 = *(_QWORD *)(v20 - 8);
  v52 = v20;
  v55 = v21;
  MEMORY[0x24BDAC7A8](v20);
  v47 = (char *)v46 - v22;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B6EED8);
  v23 = sub_2130685C4();
  v56 = *(_QWORD *)(v23 - 8);
  v24 = MEMORY[0x24BDAC7A8](v23);
  v50 = (char *)v46 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v24);
  v54 = (uint64_t)v46 - v26;
  v27 = sub_21304C800(a1);
  a2(v27);
  sub_213068ABC();
  v28 = v51;
  sub_213068954();
  (*(void (**)(char *, uint64_t))(v48 + 8))(v13, a4);
  v64[0] = v28;
  v64[1] = MEMORY[0x24BDEBEE0];
  v29 = MEMORY[0x2199AA6AC](MEMORY[0x24BDED308], v14, v64);
  sub_21304B734();
  sub_213068984();
  (*(void (**)(char *, uint64_t))(v49 + 8))(v16, v14);
  sub_21304C7A0(a1);
  v30 = sub_21304B778(&qword_254B6EF00, &qword_254B6EED0, MEMORY[0x24BDEB950]);
  v63[0] = v29;
  v63[1] = v30;
  v31 = MEMORY[0x24BDED308];
  v32 = MEMORY[0x2199AA6AC](MEMORY[0x24BDED308], v17, v63);
  v33 = v47;
  sub_213068978();
  (*(void (**)(char *, uint64_t))(v53 + 8))(v19, v17);
  swift_getKeyPath();
  v35 = v57;
  v34 = v58;
  v36 = v59;
  (*(void (**)(char *, _QWORD, uint64_t))(v58 + 104))(v57, *MEMORY[0x24BDED100], v59);
  v37 = sub_21304B7B8();
  v62[0] = v32;
  v62[1] = v37;
  v38 = v31;
  v39 = v52;
  v40 = MEMORY[0x2199AA6AC](v38, v52, v62);
  v41 = (uint64_t)v50;
  sub_213068918();
  swift_release();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v35, v36);
  (*(void (**)(char *, uint64_t))(v55 + 8))(v33, v39);
  v42 = sub_21304B778((unint64_t *)&qword_254B6EEE0, &qword_254B6EED8, MEMORY[0x24BDF1028]);
  v61[0] = v40;
  v61[1] = v42;
  MEMORY[0x2199AA6AC](MEMORY[0x24BDED308], v23, v61);
  v43 = v54;
  sub_213059AA0(v41, v23, v54);
  v44 = *(void (**)(uint64_t, uint64_t))(v56 + 8);
  v44(v41, v23);
  sub_213055E58(v43, v23, v60);
  return ((uint64_t (*)(uint64_t, uint64_t))v44)(v43, v23);
}

uint64_t sub_21304CD80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_21304C8C0(*(_QWORD *)v2, *(void (**)(double))(v2 + 8), *(_QWORD *)(v2 + 16), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), a2);
}

uint64_t sub_21304CD94()
{
  return sub_213068630();
}

uint64_t sub_21304CDB8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[2];
  _QWORD v9[2];
  _QWORD v10[2];
  _QWORD v11[2];

  v1 = *(_QWORD *)(a1 + 8);
  v2 = sub_2130685C4();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B6EED0);
  v3 = sub_2130685C4();
  v4 = sub_2130685C4();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B6EED8);
  v5 = sub_2130685C4();
  v11[0] = v1;
  v11[1] = MEMORY[0x24BDEBEE0];
  v6 = MEMORY[0x24BDED308];
  v10[0] = MEMORY[0x2199AA6AC](MEMORY[0x24BDED308], v2, v11);
  v10[1] = sub_21304B778(&qword_254B6EF00, &qword_254B6EED0, MEMORY[0x24BDEB950]);
  v9[0] = MEMORY[0x2199AA6AC](v6, v3, v10);
  v9[1] = sub_21304B7B8();
  v8[0] = MEMORY[0x2199AA6AC](v6, v4, v9);
  v8[1] = sub_21304B778((unint64_t *)&qword_254B6EEE0, &qword_254B6EED8, MEMORY[0x24BDF1028]);
  return MEMORY[0x2199AA6AC](v6, v5, v8);
}

uint64_t ComplicationCurvedLabelViewConfiguration.curvedTextConfiguration.getter@<X0>(_OWORD *a1@<X8>)
{
  _OWORD *v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _OWORD v8[2];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  v2 = v1[3];
  v9 = v1[2];
  v10 = v2;
  v4 = v1[5];
  v11 = v1[4];
  v3 = v11;
  v12 = v4;
  v6 = v1[1];
  v8[0] = *v1;
  v5 = v8[0];
  v8[1] = v6;
  a1[2] = v9;
  a1[3] = v2;
  a1[4] = v3;
  a1[5] = v4;
  *a1 = v5;
  a1[1] = v6;
  return sub_21304CF4C((uint64_t)v8);
}

uint64_t sub_21304CF4C(uint64_t a1)
{
  id v2;

  v2 = *(id *)(a1 + 64);
  swift_retain();
  return a1;
}

__n128 ComplicationCurvedLabelViewConfiguration.curvedTextConfiguration.setter(uint64_t a1)
{
  _OWORD *v1;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __n128 result;
  __int128 v9;
  _OWORD v10[6];

  v3 = v1[3];
  v10[2] = v1[2];
  v10[3] = v3;
  v4 = v1[5];
  v10[4] = v1[4];
  v10[5] = v4;
  v5 = v1[1];
  v10[0] = *v1;
  v10[1] = v5;
  sub_21304CFDC((uint64_t)v10);
  v6 = *(_OWORD *)(a1 + 48);
  v1[2] = *(_OWORD *)(a1 + 32);
  v1[3] = v6;
  v7 = *(_OWORD *)(a1 + 80);
  v1[4] = *(_OWORD *)(a1 + 64);
  v1[5] = v7;
  result = *(__n128 *)a1;
  v9 = *(_OWORD *)(a1 + 16);
  *v1 = *(_OWORD *)a1;
  v1[1] = v9;
  return result;
}

uint64_t sub_21304CFDC(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 64);
  swift_release();

  return a1;
}

uint64_t (*ComplicationCurvedLabelViewConfiguration.curvedTextConfiguration.modify())()
{
  return nullsub_1;
}

uint64_t ComplicationCurvedLabelViewConfiguration.labelProviders.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ComplicationCurvedLabelViewConfiguration.labelProviders.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 96) = a1;
  return result;
}

uint64_t (*ComplicationCurvedLabelViewConfiguration.labelProviders.modify())()
{
  return nullsub_1;
}

void *ComplicationCurvedLabelViewConfiguration.monochromeModel.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 104);
  v2 = v1;
  return v1;
}

void ComplicationCurvedLabelViewConfiguration.monochromeModel.setter(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 104) = a1;
}

uint64_t (*ComplicationCurvedLabelViewConfiguration.monochromeModel.modify())()
{
  return nullsub_1;
}

__n128 ComplicationCurvedLabelViewConfiguration.init(curvedTextConfiguration:monochromeModel:labelProviders:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  __int128 v4;
  __int128 v5;
  __n128 result;
  __int128 v7;

  v4 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(a4 + 32) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a4 + 48) = v4;
  v5 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(a4 + 64) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(a4 + 80) = v5;
  result = *(__n128 *)a1;
  v7 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a4 = *(_OWORD *)a1;
  *(_OWORD *)(a4 + 16) = v7;
  *(_QWORD *)(a4 + 96) = a3;
  *(_QWORD *)(a4 + 104) = a2;
  return result;
}

uint64_t ComplicationCurvedLabelView.configuration.getter@<X0>(_OWORD *a1@<X8>)
{
  _OWORD *v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _OWORD v9[2];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  v3 = v1[5];
  v12 = v1[4];
  v2 = v12;
  v13 = v3;
  v14 = v1[6];
  v4 = v14;
  v5 = v1[1];
  v9[0] = *v1;
  v9[1] = v5;
  v6 = v1[3];
  v10 = v1[2];
  v7 = v10;
  v11 = v6;
  *a1 = v9[0];
  a1[1] = v5;
  a1[2] = v7;
  a1[3] = v6;
  a1[4] = v2;
  a1[5] = v3;
  a1[6] = v4;
  return sub_21304D128((uint64_t)v9);
}

uint64_t sub_21304D128(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 64);
  v3 = *(id *)(a1 + 104);
  swift_retain();
  v4 = v2;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_21304D174()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F130);
  sub_213068A44();
  return v1;
}

uint64_t ComplicationCurvedLabelView.body.getter@<X0>(uint64_t a1@<X8>)
{
  __int128 *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  char v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[24];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;

  v3 = type metadata accessor for ComplicationCurvedTextViewRepresentable();
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F040);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = v1[7];
  v39 = v1[6];
  *(_OWORD *)v40 = v9;
  v10 = v1[3];
  v11 = v1[1];
  v35 = v1[2];
  v36 = v10;
  v12 = v1[5];
  v13 = v1[3];
  v37 = v1[4];
  v38 = v12;
  v14 = v1[1];
  v33 = *v1;
  v34 = v14;
  v43 = v35;
  v44 = v13;
  v45 = v37;
  v46 = v12;
  v15 = *((_QWORD *)v1 + 16);
  *(_QWORD *)&v40[16] = v15;
  v41 = v33;
  v42 = v11;
  v16 = *(_QWORD *)&v40[8];
  sub_21304CF4C((uint64_t)&v33);
  *(_QWORD *)&v30 = v16;
  *((_QWORD *)&v30 + 1) = v15;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F130);
  sub_213068A44();
  v17 = v47;
  v19 = (void *)*((_QWORD *)&v39 + 1);
  v18 = *(_QWORD *)v40;
  v20 = *((id *)&v39 + 1);
  swift_bridgeObjectRetain();
  sub_213061078(&v41, v17, v18, v19, (uint64_t)v5);
  v41 = *(_OWORD *)&v40[8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F130);
  sub_213068A44();
  v21 = v30;
  sub_21304D448((uint64_t)v5, (uint64_t)v8);
  *(_QWORD *)&v8[*(int *)(v6 + 36)] = v21;
  sub_21304D48C((uint64_t)v5);
  v30 = 0u;
  v31 = 0u;
  v32 = 2;
  sub_21304CF4C((uint64_t)&v33);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F048);
  sub_213068A38();
  v29 = v41;
  v22 = v42;
  LOBYTE(v6) = v43;
  v23 = *((_QWORD *)&v43 + 1);
  v43 = v35;
  v44 = v36;
  v45 = v37;
  v46 = v38;
  v41 = v33;
  v42 = v34;
  sub_21304F2CC((uint64_t)v8, a1, &qword_254B6F040);
  v24 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254B6F050) + 36);
  v25 = v44;
  *(_OWORD *)(v24 + 32) = v43;
  *(_OWORD *)(v24 + 48) = v25;
  v26 = v46;
  *(_OWORD *)(v24 + 64) = v45;
  *(_OWORD *)(v24 + 80) = v26;
  v27 = v42;
  *(_OWORD *)v24 = v41;
  *(_OWORD *)(v24 + 16) = v27;
  *(_OWORD *)(v24 + 96) = v29;
  *(_OWORD *)(v24 + 112) = v22;
  *(_BYTE *)(v24 + 128) = v6;
  *(_QWORD *)(v24 + 136) = v23;
  return sub_21304F310((uint64_t)v8, &qword_254B6F040);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2199AA694]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_21304D448(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ComplicationCurvedTextViewRepresentable();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21304D48C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for ComplicationCurvedTextViewRepresentable();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21304D4CC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v3;
  uint64_t v4;
  __int128 v5;
  uint64_t result;
  __int128 v7;
  char v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  char v14;
  int v15;
  char v16;
  __int128 v17;
  __int128 v18;
  char v19;
  _OWORD v20[2];
  char v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE v26[40];

  v3 = *(_BYTE *)(v1 + 128);
  v4 = *(_QWORD *)(v1 + 136);
  v5 = *(_OWORD *)(v1 + 112);
  v22 = *(_OWORD *)(v1 + 96);
  v23 = v5;
  LOBYTE(v24) = v3;
  v25 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F120);
  result = sub_213068A44();
  if (v16 == 2)
  {
    v7 = 0uLL;
    v8 = -1;
    v9 = 0uLL;
  }
  else
  {
    sub_2130688E8();
    v22 = 0x3FF0000000000000uLL;
    *(_QWORD *)&v23 = 0;
    *((_QWORD *)&v23 + 1) = 0x3FF0000000000000;
    v24 = 0;
    v25 = 0;
    sub_2130688C4();
    v20[0] = v12;
    v20[1] = v13;
    v21 = v14;
    sub_21304F34C((uint64_t)v20, (uint64_t)v26);
    sub_21304F3C8((uint64_t)v26, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_21304F388);
    sub_2130684EC();
    sub_2130688A0();
    v10 = v18;
    v11 = v17;
    v8 = v19;
    sub_21304F3A0((uint64_t)&v15);
    sub_21304F3C8((uint64_t)v20, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_21304F400);
    result = sub_21304F3C8((uint64_t)v20, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_21304F400);
    v9 = v10;
    v7 = v11;
  }
  *(_OWORD *)a1 = v7;
  *(_OWORD *)(a1 + 16) = v9;
  *(_BYTE *)(a1 + 32) = v8;
  return result;
}

uint64_t sub_21304D674(unsigned int *a1, _OWORD *a2)
{
  unsigned int v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  __int128 v9;
  uint64_t result;
  __int128 v11;
  _DWORD v12[2];
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  char v22;

  v4 = *a1;
  v3 = a1[1];
  v5 = *((_QWORD *)a1 + 1);
  v6 = *((_QWORD *)a1 + 2);
  v7 = *((_QWORD *)a1 + 3);
  v8 = *((_BYTE *)a1 + 32);
  v9 = a2[7];
  v17 = a2[6];
  v18 = v9;
  v19 = a2[8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F120);
  sub_213068A44();
  if (v22 == 2)
    goto LABEL_3;
  v17 = v20;
  v18 = v21;
  LOBYTE(v19) = v22;
  v12[0] = v4;
  v12[1] = v3;
  v13 = v5;
  v14 = v6;
  v15 = v7;
  v16 = v8;
  result = _s19ComplicationDisplay0A17CurvedTextMetricsV2eeoiySbAC_ACtFZ_0((uint64_t)&v17, (uint64_t)v12);
  if ((result & 1) == 0)
  {
LABEL_3:
    v11 = a2[7];
    v17 = a2[6];
    v18 = v11;
    v19 = a2[8];
    *(_QWORD *)&v20 = v4 | ((unint64_t)v3 << 32);
    *((_QWORD *)&v20 + 1) = v5;
    *(_QWORD *)&v21 = v6;
    *((_QWORD *)&v21 + 1) = v7;
    v22 = v8;
    return sub_213068A50();
  }
  return result;
}

uint64_t sub_21304D774()
{
  return sub_213068510();
}

uint64_t sub_21304D78C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __int128 *v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t (*v12)(unsigned int *);
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  uint64_t (**v18)(unsigned int *);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _OWORD v23[10];
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F108);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = v2[7];
  v34 = v2[6];
  v35 = v8;
  v36 = v2[8];
  v9 = v2[3];
  v30 = v2[2];
  v31 = v9;
  v10 = v2[5];
  v32 = v2[4];
  v33 = v10;
  v11 = v2[1];
  v28 = *v2;
  v29 = v11;
  v12 = (uint64_t (*)(unsigned int *))swift_allocObject();
  v13 = v2[7];
  *((_OWORD *)v12 + 7) = v2[6];
  *((_OWORD *)v12 + 8) = v13;
  *((_OWORD *)v12 + 9) = v2[8];
  v14 = v2[3];
  *((_OWORD *)v12 + 3) = v2[2];
  *((_OWORD *)v12 + 4) = v14;
  v15 = v2[5];
  *((_OWORD *)v12 + 5) = v2[4];
  *((_OWORD *)v12 + 6) = v15;
  v16 = v2[1];
  *((_OWORD *)v12 + 1) = *v2;
  *((_OWORD *)v12 + 2) = v16;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F110);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v7, a1, v17);
  v18 = (uint64_t (**)(unsigned int *))&v7[*(int *)(v5 + 36)];
  *v18 = sub_21304F280;
  v18[1] = v12;
  v23[7] = v34;
  v23[8] = v35;
  v23[9] = v36;
  v23[3] = v30;
  v23[4] = v31;
  v23[5] = v32;
  v23[6] = v33;
  v23[1] = v28;
  v23[2] = v29;
  sub_21304F288((uint64_t)&v28);
  sub_21304D4CC((uint64_t)&v24);
  v23[0] = v24;
  v19 = v25;
  v20 = v26;
  LOBYTE(a1) = v27;
  sub_21304F2CC((uint64_t)v7, a2, &qword_254B6F108);
  v21 = a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254B6F118) + 36);
  *(_OWORD *)v21 = v23[0];
  *(_QWORD *)(v21 + 16) = v19;
  *(_QWORD *)(v21 + 24) = v20;
  *(_BYTE *)(v21 + 32) = a1;
  return sub_21304F310((uint64_t)v7, &qword_254B6F108);
}

__n128 ComplicationCurvedLabelView<>.init(configuration:)@<Q0>(__n128 *a1@<X0>, uint64_t a2@<X8>)
{
  __n128 v3;
  __n128 v4;
  __n128 v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t i;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  unint64_t v23;
  unint64_t v24;
  __int128 v25;
  __n128 v26;
  __n128 result;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __n128 v32;
  __n128 v33;
  __n128 v34;
  __n128 v35;
  __n128 v36;
  __int128 v37;
  __n128 v38;

  v3 = a1[5];
  v36 = a1[4];
  v37 = (__int128)v3;
  v38 = a1[6];
  v4 = a1[1];
  v32 = *a1;
  v33 = v4;
  v5 = a1[3];
  v34 = a1[2];
  v35 = v5;
  type metadata accessor for ComplicationCurvedTextMetricsObservable();
  v6 = swift_allocObject();
  if (qword_254B6ED40 != -1)
    swift_once();
  v7 = qword_254B71DA8;
  v8 = byte_254B71DB0;
  *(_QWORD *)(v6 + 16) = xmmword_254B71D90;
  *(_OWORD *)(v6 + 24) = *(__int128 *)((char *)&xmmword_254B71D90 + 8);
  *(_QWORD *)(v6 + 40) = v7;
  *(_BYTE *)(v6 + 48) = v8;
  sub_213068450();
  sub_213068A38();
  v9 = v29;
  v10 = v30;
  v11 = v38.n128_u64[0];
  v12 = *(_QWORD *)(v38.n128_u64[0] + 16);
  v13 = MEMORY[0x24BEE4AF8];
  if (v12)
  {
    v14 = v37;
    sub_21304D128((uint64_t)&v32);
    v31 = v13;
    swift_bridgeObjectRetain();
    sub_21304E408(0, v12, 0);
    for (i = 0; i != v12; ++i)
    {
      v16 = *(id *)(v11 + 8 * i + 32);
      v17 = objc_msgSend(v16, sel_textProvider);
      objc_msgSend(v17, sel_finalize);
      v18 = objc_msgSend(v16, sel_imageProvider);
      v19 = v18;
      if (v18)
      {
        objc_msgSend(v18, sel_copy);

        sub_213068BF4();
        swift_unknownObjectRelease();
        sub_21304BF90();
        if ((swift_dynamicCast() & 1) != 0)
        {
          v19 = v28;
          type metadata accessor for WidgetNamedImageProvider(0);
          v20 = swift_dynamicCastClass();
          if (v20)
          {
            v21 = OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_finalized;
            if ((*(_BYTE *)(v20 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_finalized) & 1) == 0)
            {
              *(_OWORD *)(v20 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider__maxSize) = v14;
              *(_BYTE *)(v20 + v21) = 1;
            }
          }
          else
          {
            objc_msgSend(v28, sel_finalizeWithMaxSDKSize_maxDeviceSize_maskToCircle_, 0, v14, v14);
          }
        }
        else
        {
          v19 = 0;
        }
      }
      v22 = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, v17, v19);

      v13 = v31;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_21304E408(0, *(_QWORD *)(v31 + 16) + 1, 1);
        v13 = v31;
      }
      v24 = *(_QWORD *)(v13 + 16);
      v23 = *(_QWORD *)(v13 + 24);
      if (v24 >= v23 >> 1)
      {
        sub_21304E408((char *)(v23 > 1), v24 + 1, 1);
        v13 = v31;
      }
      *(_QWORD *)(v13 + 16) = v24 + 1;
      *(_QWORD *)(v13 + 8 * v24 + 32) = v22;
    }
    sub_21304E424((uint64_t)&v32);
    swift_bridgeObjectRelease();
    v9 = v29;
    v10 = v30;
  }
  v25 = v37;
  *(__n128 *)(a2 + 64) = v36;
  *(_OWORD *)(a2 + 80) = v25;
  *(__n128 *)(a2 + 96) = v38;
  v26 = v33;
  *(__n128 *)a2 = v32;
  *(__n128 *)(a2 + 16) = v26;
  result = v35;
  *(__n128 *)(a2 + 32) = v34;
  *(__n128 *)(a2 + 48) = result;
  *(_QWORD *)(a2 + 112) = v13;
  *(_QWORD *)(a2 + 120) = v9;
  *(_QWORD *)(a2 + 128) = v10;
  return result;
}

id ComplicationCurvedLabelViewConfiguration.textProvider.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 96);
  if (*(_QWORD *)(v1 + 16))
    return objc_msgSend(*(id *)(v1 + 32), sel_textProvider);
  else
    return 0;
}

uint64_t ComplicationCurvedLabelViewConfiguration.textProvider.setter(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  if (a1)
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_254B6F058);
    v3 = swift_allocObject();
    *(_OWORD *)(v3 + 16) = xmmword_21306BC10;
    *(_QWORD *)(v3 + 32) = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, a1, 0);

    result = swift_bridgeObjectRelease();
    *(_QWORD *)(v1 + 96) = v3;
  }
  else
  {
    result = swift_bridgeObjectRelease();
    *(_QWORD *)(v1 + 96) = MEMORY[0x24BEE4AF8];
  }
  return result;
}

void (*ComplicationCurvedLabelViewConfiguration.textProvider.modify(_QWORD *a1))(id *a1, char a2)
{
  uint64_t v1;
  uint64_t v3;
  id v4;

  a1[1] = v1;
  v3 = *(_QWORD *)(v1 + 96);
  if (*(_QWORD *)(v3 + 16))
    v4 = objc_msgSend(*(id *)(v3 + 32), sel_textProvider);
  else
    v4 = 0;
  *a1 = v4;
  return sub_21304DDD4;
}

void sub_21304DDD4(id *a1, char a2)
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  id v9;
  id v10;

  v3 = *a1;
  if ((a2 & 1) != 0)
  {
    v9 = *a1;
    if (v3)
    {
      __swift_instantiateConcreteTypeFromMangledName(qword_254B6F058);
      v4 = swift_allocObject();
      *(_OWORD *)(v4 + 16) = xmmword_21306BC10;
      v5 = objc_allocWithZone((Class)CDLabelProvider);
      v9 = v9;
      *(_QWORD *)(v4 + 32) = objc_msgSend(v5, sel_initWithTextProvider_imageProvider_, v9, 0);

    }
    else
    {
      v4 = MEMORY[0x24BEE4AF8];
    }
    v7 = a1[1];
    swift_bridgeObjectRelease();
    v7[12] = v4;

  }
  else
  {
    if (v3)
    {
      v10 = *a1;
      __swift_instantiateConcreteTypeFromMangledName(qword_254B6F058);
      v6 = swift_allocObject();
      *(_OWORD *)(v6 + 16) = xmmword_21306BC10;
      *(_QWORD *)(v6 + 32) = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, v10, 0);

    }
    else
    {
      v6 = MEMORY[0x24BEE4AF8];
    }
    v8 = a1[1];
    swift_bridgeObjectRelease();
    v8[12] = v6;
  }
}

uint64_t ComplicationCurvedLabelViewConfiguration.contentProviders.getter()
{
  uint64_t v0;
  uint64_t v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  id v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v1 = *(_QWORD *)(v0 + 96);
  v2 = *(_QWORD *)(v1 + 16);
  v3 = MEMORY[0x24BEE4AF8];
  if (v2)
  {
    v13 = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    sub_21304E470(0, v2, 0);
    v4 = 0;
    v3 = v13;
    do
    {
      v5 = *(id *)(v1 + 8 * v4 + 32);
      v6 = objc_msgSend(v5, sel_textProvider);
      v7 = v6;
      v8 = objc_msgSend(v5, sel_imageProvider);

      v10 = *(_QWORD *)(v13 + 16);
      v9 = *(_QWORD *)(v13 + 24);
      if (v10 >= v9 >> 1)
        sub_21304E470((char *)(v9 > 1), v10 + 1, 1);
      ++v4;
      *(_QWORD *)(v13 + 16) = v10 + 1;
      v11 = v13 + 16 * v10;
      *(_QWORD *)(v11 + 32) = v6;
      *(_QWORD *)(v11 + 40) = v8;
    }
    while (v2 != v4);
    swift_bridgeObjectRelease();
  }
  return v3;
}

uint64_t ComplicationCurvedLabelViewConfiguration.contentProviders.setter(uint64_t a1)
{
  uint64_t v1;
  int64_t v3;
  uint64_t v4;
  _QWORD *v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;

  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v11 = MEMORY[0x24BEE4AF8];
    sub_21304E408(0, v3, 0);
    v4 = v11;
    v5 = (_QWORD *)(a1 + 40);
    do
    {
      v6 = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, *(v5 - 1), *v5);
      v8 = *(_QWORD *)(v11 + 16);
      v7 = *(_QWORD *)(v11 + 24);
      if (v8 >= v7 >> 1)
        sub_21304E408((char *)(v7 > 1), v8 + 1, 1);
      v5 += 2;
      *(_QWORD *)(v11 + 16) = v8 + 1;
      *(_QWORD *)(v11 + 8 * v8 + 32) = v6;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
    v1 = v10;
  }
  else
  {
    swift_bridgeObjectRelease();
    v4 = MEMORY[0x24BEE4AF8];
  }
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 96) = v4;
  return result;
}

uint64_t (*ComplicationCurvedLabelViewConfiguration.contentProviders.modify(uint64_t *a1))(uint64_t *a1, char a2)
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = ComplicationCurvedLabelViewConfiguration.contentProviders.getter();
  return sub_21304E1CC;
}

uint64_t sub_21304E1CC(uint64_t *a1, char a2)
{
  uint64_t v2;

  if ((a2 & 1) == 0)
    return ComplicationCurvedLabelViewConfiguration.contentProviders.setter(*a1);
  v2 = swift_bridgeObjectRetain();
  ComplicationCurvedLabelViewConfiguration.contentProviders.setter(v2);
  return swift_bridgeObjectRelease();
}

__n128 ComplicationCurvedLabelViewConfiguration.init(contentSize:curvedTextConfiguration:textProvider:)@<Q0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __n128 result;
  __int128 v10;

  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_254B6F058);
    v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_21306BC10;
    *(_QWORD *)(v6 + 32) = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, a2, 0);

  }
  else
  {
    v6 = MEMORY[0x24BEE4AF8];
  }
  v7 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(a3 + 32) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a3 + 48) = v7;
  v8 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(a3 + 64) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(a3 + 80) = v8;
  result = *(__n128 *)a1;
  v10 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a3 = *(_OWORD *)a1;
  *(_OWORD *)(a3 + 16) = v10;
  *(_QWORD *)(a3 + 96) = v6;
  *(_QWORD *)(a3 + 104) = 0;
  return result;
}

double ComplicationCurvedLabelViewConfiguration.init(curvedTextConfiguration:monochromeModel:contentProviders:)@<D0>(__int128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5;
  int64_t v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  unint64_t v11;
  unint64_t v12;
  double result;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;

  v5 = a2;
  v18 = a1[2];
  v19 = a1[3];
  v20 = a1[4];
  v21 = a1[5];
  v16 = *a1;
  v17 = a1[1];
  v7 = *(_QWORD *)(a3 + 16);
  if (v7)
  {
    v15 = MEMORY[0x24BEE4AF8];
    sub_21304E408(0, v7, 0);
    v8 = v15;
    v9 = (_QWORD *)(a3 + 40);
    do
    {
      v10 = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, *(v9 - 1), *v9);
      v12 = *(_QWORD *)(v15 + 16);
      v11 = *(_QWORD *)(v15 + 24);
      if (v12 >= v11 >> 1)
        sub_21304E408((char *)(v11 > 1), v12 + 1, 1);
      v9 += 2;
      *(_QWORD *)(v15 + 16) = v12 + 1;
      *(_QWORD *)(v15 + 8 * v12 + 32) = v10;
      --v7;
    }
    while (v7);
    swift_bridgeObjectRelease();
    v5 = a2;
  }
  else
  {
    swift_bridgeObjectRelease();
    v8 = MEMORY[0x24BEE4AF8];
  }
  *(_OWORD *)(a4 + 32) = v18;
  *(_OWORD *)(a4 + 48) = v19;
  *(_OWORD *)(a4 + 64) = v20;
  *(_OWORD *)(a4 + 80) = v21;
  result = *(double *)&v16;
  *(_OWORD *)a4 = v16;
  *(_OWORD *)(a4 + 16) = v17;
  *(_QWORD *)(a4 + 96) = v8;
  *(_QWORD *)(a4 + 104) = v5;
  return result;
}

char *sub_21304E408(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_21304F418(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

uint64_t sub_21304E424(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 64);
  v3 = *(void **)(a1 + 104);
  swift_bridgeObjectRelease();
  swift_release();

  return a1;
}

char *sub_21304E470(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_21304F518(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

uint64_t sub_21304E48C()
{
  return swift_getOpaqueTypeConformance2();
}

id sub_21304E4C0@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  id result;

  v3 = *(_QWORD *)(a1 + 96);
  if (*(_QWORD *)(v3 + 16))
    result = objc_msgSend(*(id *)(v3 + 32), sel_textProvider);
  else
    result = 0;
  *a2 = result;
  return result;
}

uint64_t sub_21304E50C(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  return ComplicationCurvedLabelViewConfiguration.textProvider.setter(v1);
}

uint64_t sub_21304E538@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = ComplicationCurvedLabelViewConfiguration.contentProviders.getter();
  *a1 = result;
  return result;
}

uint64_t sub_21304E560()
{
  uint64_t v0;

  v0 = swift_bridgeObjectRetain();
  return ComplicationCurvedLabelViewConfiguration.contentProviders.setter(v0);
}

void destroy for ComplicationCurvedLabelViewConfiguration(uint64_t a1)
{
  swift_release();

  swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ComplicationCurvedLabelViewConfiguration(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 52) = *(_BYTE *)(a2 + 52);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  v3 = *(void **)(a2 + 64);
  *(_QWORD *)(a1 + 64) = v3;
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_DWORD *)(a1 + 76) = *(_DWORD *)(a2 + 76);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  v4 = *(void **)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v4;
  swift_retain();
  v5 = v3;
  swift_bridgeObjectRetain();
  v6 = v4;
  return a1;
}

uint64_t assignWithCopy for ComplicationCurvedLabelViewConfiguration(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(_DWORD *)(a1 + 44) = *(_DWORD *)(a2 + 44);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 52) = *(_BYTE *)(a2 + 52);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  v4 = *(void **)(a1 + 64);
  v5 = *(void **)(a2 + 64);
  *(_QWORD *)(a1 + 64) = v5;
  v6 = v5;

  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_DWORD *)(a1 + 76) = *(_DWORD *)(a2 + 76);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v7 = *(void **)(a1 + 104);
  v8 = *(void **)(a2 + 104);
  *(_QWORD *)(a1 + 104) = v8;
  v9 = v8;

  return a1;
}

__n128 __swift_memcpy112_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __n128 result;
  __int128 v5;
  __int128 v6;

  v2 = *a2;
  v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  result = (__n128)a2[3];
  v5 = a2[4];
  v6 = a2[6];
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_OWORD *)(a1 + 96) = v6;
  *(__n128 *)(a1 + 48) = result;
  *(_OWORD *)(a1 + 64) = v5;
  return result;
}

uint64_t assignWithTake for ComplicationCurvedLabelViewConfiguration(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 52) = *(_BYTE *)(a2 + 52);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  v4 = *(void **)(a1 + 64);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);

  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_DWORD *)(a1 + 76) = *(_DWORD *)(a2 + 76);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  swift_bridgeObjectRelease();
  v5 = *(void **)(a1 + 104);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);

  return a1;
}

uint64_t getEnumTagSinglePayload for ComplicationCurvedLabelViewConfiguration(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 112))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ComplicationCurvedLabelViewConfiguration(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 104) = 0;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 112) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 112) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ComplicationCurvedLabelViewConfiguration()
{
  return &type metadata for ComplicationCurvedLabelViewConfiguration;
}

uint64_t sub_21304E8EC()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_21304E8F4(uint64_t a1)
{
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_release();
}

uint64_t sub_21304E944(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 52) = *(_BYTE *)(a2 + 52);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  v3 = *(void **)(a2 + 64);
  *(_QWORD *)(a1 + 64) = v3;
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_DWORD *)(a1 + 76) = *(_DWORD *)(a2 + 76);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  v4 = *(void **)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v4;
  v5 = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v5;
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  swift_retain();
  v6 = v3;
  swift_bridgeObjectRetain();
  v7 = v4;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_21304EA28(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(_DWORD *)(a1 + 44) = *(_DWORD *)(a2 + 44);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 52) = *(_BYTE *)(a2 + 52);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  v4 = *(void **)(a1 + 64);
  v5 = *(void **)(a2 + 64);
  *(_QWORD *)(a1 + 64) = v5;
  v6 = v5;

  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_DWORD *)(a1 + 76) = *(_DWORD *)(a2 + 76);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v7 = *(void **)(a1 + 104);
  v8 = *(void **)(a2 + 104);
  *(_QWORD *)(a1 + 104) = v8;
  v9 = v8;

  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy136_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;
  __int128 v7;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v2 = *(_OWORD *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  result = *(__n128 *)(a2 + 80);
  v6 = *(_OWORD *)(a2 + 96);
  v7 = *(_OWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 80) = result;
  return result;
}

uint64_t sub_21304EB98(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 52) = *(_BYTE *)(a2 + 52);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  v4 = *(void **)(a1 + 64);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);

  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_DWORD *)(a1 + 76) = *(_DWORD *)(a2 + 76);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  swift_bridgeObjectRelease();
  v5 = *(void **)(a1 + 104);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);

  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  swift_release();
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  swift_release();
  return a1;
}

uint64_t sub_21304EC74(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 136))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_21304ECBC(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 136) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 136) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t type metadata accessor for ComplicationCurvedLabelView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ComplicationCurvedLabelView);
}

uint64_t sub_21304ED28()
{
  return sub_21304ED80(&qword_254B6F0E0, &qword_254B6F050, sub_21304ED5C, (uint64_t (*)(void))sub_21304EE7C);
}

uint64_t sub_21304ED5C()
{
  return sub_21304ED80(&qword_254B6F0E8, &qword_254B6F040, (uint64_t (*)(void))sub_21304EDF0, (uint64_t (*)(void))sub_21304EE38);
}

uint64_t sub_21304ED80(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t (*a4)(void))
{
  uint64_t result;
  uint64_t v8;
  _QWORD v9[2];

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9[0] = a3();
    v9[1] = a4();
    result = MEMORY[0x2199AA6AC](MEMORY[0x24BDED308], v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_21304EDF0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254B6F0F0;
  if (!qword_254B6F0F0)
  {
    v1 = type metadata accessor for ComplicationCurvedTextViewRepresentable();
    result = MEMORY[0x2199AA6AC](&unk_21306D1A0, v1);
    atomic_store(result, (unint64_t *)&qword_254B6F0F0);
  }
  return result;
}

unint64_t sub_21304EE38()
{
  unint64_t result;

  result = qword_254B6F0F8;
  if (!qword_254B6F0F8)
  {
    result = MEMORY[0x2199AA6AC](&unk_21306C6C0, &type metadata for ComplicationCurvedTextMetricsObservableViewModifier);
    atomic_store(result, (unint64_t *)&qword_254B6F0F8);
  }
  return result;
}

unint64_t sub_21304EE7C()
{
  unint64_t result;

  result = qword_254B6F100;
  if (!qword_254B6F100)
  {
    result = MEMORY[0x2199AA6AC](&unk_21306BD60, &type metadata for ComplicationCurvedLabelViewContentShapeModifier);
    atomic_store(result, (unint64_t *)&qword_254B6F100);
  }
  return result;
}

uint64_t destroy for ComplicationCurvedLabelViewContentShapeModifier(uint64_t a1)
{
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for ComplicationCurvedLabelViewContentShapeModifier(uint64_t a1, uint64_t a2)
{
  void *v3;
  __int128 v4;
  id v5;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 52) = *(_BYTE *)(a2 + 52);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  v3 = *(void **)(a2 + 64);
  *(_QWORD *)(a1 + 64) = v3;
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_DWORD *)(a1 + 76) = *(_DWORD *)(a2 + 76);
  v4 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v4;
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_BYTE *)(a1 + 128) = *(_BYTE *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  swift_retain();
  v5 = v3;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for ComplicationCurvedLabelViewContentShapeModifier(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  __int128 v7;
  __int128 v8;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(_DWORD *)(a1 + 44) = *(_DWORD *)(a2 + 44);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 52) = *(_BYTE *)(a2 + 52);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  v4 = *(void **)(a1 + 64);
  v5 = *(void **)(a2 + 64);
  *(_QWORD *)(a1 + 64) = v5;
  v6 = v5;

  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_DWORD *)(a1 + 76) = *(_DWORD *)(a2 + 76);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  v7 = *(_OWORD *)(a2 + 96);
  v8 = *(_OWORD *)(a2 + 112);
  *(_BYTE *)(a1 + 128) = *(_BYTE *)(a2 + 128);
  *(_OWORD *)(a1 + 96) = v7;
  *(_OWORD *)(a1 + 112) = v8;
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy144_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;
  __int128 v7;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v2 = *(_OWORD *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  result = *(__n128 *)(a2 + 80);
  v6 = *(_OWORD *)(a2 + 96);
  v7 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v7;
  *(__n128 *)(a1 + 80) = result;
  *(_OWORD *)(a1 + 96) = v6;
  return result;
}

uint64_t assignWithTake for ComplicationCurvedLabelViewContentShapeModifier(uint64_t a1, uint64_t a2)
{
  void *v4;
  __int128 v5;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 52) = *(_BYTE *)(a2 + 52);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  v4 = *(void **)(a1 + 64);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);

  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_DWORD *)(a1 + 76) = *(_DWORD *)(a2 + 76);
  v5 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v5;
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_BYTE *)(a1 + 128) = *(_BYTE *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ComplicationCurvedLabelViewContentShapeModifier(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 144))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ComplicationCurvedLabelViewContentShapeModifier(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 136) = 0;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 144) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 144) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ComplicationCurvedLabelViewContentShapeModifier()
{
  return &type metadata for ComplicationCurvedLabelViewContentShapeModifier;
}

uint64_t sub_21304F23C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21304F24C()
{
  uint64_t v0;

  swift_release();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21304F280(unsigned int *a1)
{
  uint64_t v1;

  return sub_21304D674(a1, (_OWORD *)(v1 + 16));
}

uint64_t sub_21304F288(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 64);
  swift_retain();
  swift_retain();
  v3 = v2;
  return a1;
}

uint64_t sub_21304F2CC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_21304F310(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_21304F34C(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BDF1B28] - 8) + 32))(a2, a1);
  return a2;
}

uint64_t sub_21304F388(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  uint64_t result;

  if (a5 - 2 <= 3)
    return swift_retain();
  return result;
}

uint64_t sub_21304F3A0(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_21304F3C8(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  a2(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(unsigned __int8 *)(a1 + 32));
  return a1;
}

uint64_t sub_21304F400(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  uint64_t result;

  if (a5 - 2 <= 3)
    return swift_release();
  return result;
}

char *sub_21304F418(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_254B6F058);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8])
      memmove(v13, v14, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_21304F518(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F128);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t sub_21304F61C()
{
  return sub_21304ED80(&qword_254B6F138, &qword_254B6F118, (uint64_t (*)(void))sub_21304F650, (uint64_t (*)(void))sub_21304F6EC);
}

unint64_t sub_21304F650()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254B6F140;
  if (!qword_254B6F140)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B6F108);
    v2[0] = sub_21304B778(&qword_254B6F148, &qword_254B6F110, MEMORY[0x24BDEFB78]);
    v2[1] = sub_21304B778(&qword_254B6F150, &qword_254B6F158, MEMORY[0x24BDF09B0]);
    result = MEMORY[0x2199AA6AC](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254B6F140);
  }
  return result;
}

unint64_t sub_21304F6EC()
{
  unint64_t result;

  result = qword_254B6F160;
  if (!qword_254B6F160)
  {
    result = MEMORY[0x2199AA6AC](&unk_21306BE74, &type metadata for ComplicationContainerPathModifier);
    atomic_store(result, (unint64_t *)&qword_254B6F160);
  }
  return result;
}

uint64_t View.complicationContainerPath(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _OWORD v6[2];
  char v7;
  _OWORD v8[2];
  char v9;

  sub_21304F798(a1, (uint64_t)v8);
  v6[0] = v8[0];
  v6[1] = v8[1];
  v7 = v9;
  return MEMORY[0x2199A9AE8](v6, a2, &type metadata for ComplicationContainerPathModifier, a3);
}

uint64_t sub_21304F798(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F190);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t static ComplicationContainerPathKey.defaultValue.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  swift_beginAccess();
  v2 = qword_254B6F168;
  v3 = qword_254B6F170;
  v4 = qword_254B6F178;
  v5 = qword_254B6F180;
  v6 = byte_254B6F188;
  result = sub_21304F860(qword_254B6F168, qword_254B6F170, qword_254B6F178, qword_254B6F180, byte_254B6F188);
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  *(_BYTE *)(a1 + 32) = v6;
  return result;
}

uint64_t sub_21304F860(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  if (a5 != 0xFF)
    return sub_21304F388(a1, a2, a3, a4, a5);
  return a1;
}

uint64_t static ComplicationContainerPathKey.defaultValue.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;

  swift_beginAccess();
  v2 = qword_254B6F168;
  v3 = qword_254B6F170;
  v4 = qword_254B6F178;
  v5 = qword_254B6F180;
  v6 = byte_254B6F188;
  sub_21304F798(a1, (uint64_t)&qword_254B6F168);
  return sub_21304F8FC(v2, v3, v4, v5, v6);
}

uint64_t sub_21304F8FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  if (a5 != 0xFF)
    return sub_21304F400(a1, a2, a3, a4, a5);
  return a1;
}

uint64_t (*static ComplicationContainerPathKey.defaultValue.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t static ComplicationContainerPathKey.reduce(value:nextValue:)(uint64_t a1, void (*a2)(_QWORD *__return_ptr))
{
  uint64_t result;
  _QWORD v4[5];
  _OWORD v5[2];
  unsigned __int8 v6;
  __int128 v7;
  __int128 v8;
  unsigned __int8 v9;
  _QWORD v10[6];

  if (*(unsigned __int8 *)(a1 + 32) == 255)
  {
    a2(v10);
    return sub_21304F798((uint64_t)v10, a1);
  }
  else
  {
    a2(v4);
    result = sub_21304F798((uint64_t)v4, (uint64_t)v5);
    if (v6 != 255)
    {
      v7 = v5[0];
      v8 = v5[1];
      v9 = v6;
      v10[0] = 0x3FF0000000000000;
      v10[1] = 0;
      v10[2] = 0;
      v10[3] = 0x3FF0000000000000;
      v10[4] = 0;
      v10[5] = 0;
      sub_213068894();
      return sub_21304F3C8((uint64_t)v4, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_21304F8FC);
    }
  }
  return result;
}

uint64_t sub_21304FA08@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;

  swift_beginAccess();
  v2 = qword_254B6F168;
  v3 = qword_254B6F170;
  v4 = qword_254B6F178;
  v5 = qword_254B6F180;
  *(_QWORD *)a1 = qword_254B6F168;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  v6 = byte_254B6F188;
  *(_BYTE *)(a1 + 32) = byte_254B6F188;
  return sub_21304F860(v2, v3, v4, v5, v6);
}

double sub_21304FA64(uint64_t a1, void (*a2)(__int128 *__return_ptr))
{
  double result;
  unsigned __int8 v4;
  __int128 v5;
  __int128 v6;
  char v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;

  if (*(unsigned __int8 *)(a1 + 32) == 255)
  {
    a2(&v9);
    v7 = v11;
    result = *(double *)&v9;
    v8 = v10;
    *(_OWORD *)a1 = v9;
    *(_OWORD *)(a1 + 16) = v8;
    *(_BYTE *)(a1 + 32) = v7;
  }
  else
  {
    a2(&v9);
    v4 = v11;
    if (v11 != 255)
    {
      v5 = v9;
      v6 = v10;
      v9 = 0x3FF0000000000000uLL;
      *(_QWORD *)&v10 = 0;
      *((_QWORD *)&v10 + 1) = 0x3FF0000000000000;
      v11 = 0;
      v12 = 0;
      sub_213068894();
      sub_21304F8FC(v5, *((uint64_t *)&v5 + 1), v6, *((uint64_t *)&v6 + 1), v4);
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ComplicationContainerPathKey()
{
  return &type metadata for ComplicationContainerPathKey;
}

uint64_t sub_21304FB5C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[2];

  v1 = *(_QWORD *)(a1 + 8);
  v2 = sub_2130685C4();
  v4[0] = v1;
  v4[1] = sub_21304F6EC();
  return MEMORY[0x2199AA6AC](MEMORY[0x24BDED308], v2, v4);
}

uint64_t destroy for ComplicationContainerPathModifier(uint64_t result)
{
  int v1;

  v1 = *(unsigned __int8 *)(result + 32);
  if (v1 != 255)
    return sub_21304F400(*(_QWORD *)result, *(_QWORD *)(result + 8), *(_QWORD *)(result + 16), *(_QWORD *)(result + 24), v1);
  return result;
}

uint64_t initializeWithCopy for ComplicationContainerPathModifier(uint64_t a1, uint64_t *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;

  v3 = *((unsigned __int8 *)a2 + 32);
  if (v3 == 255)
  {
    v8 = *((_OWORD *)a2 + 1);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v8;
    *(_BYTE *)(a1 + 32) = *((_BYTE *)a2 + 32);
  }
  else
  {
    v4 = *a2;
    v5 = a2[1];
    v6 = a2[2];
    v7 = a2[3];
    sub_21304F388(*a2, v5, v6, v7, v3);
    *(_QWORD *)a1 = v4;
    *(_QWORD *)(a1 + 8) = v5;
    *(_QWORD *)(a1 + 16) = v6;
    *(_QWORD *)(a1 + 24) = v7;
    *(_BYTE *)(a1 + 32) = v3;
  }
  return a1;
}

uint64_t assignWithCopy for ComplicationContainerPathModifier(uint64_t a1, __int128 *a2)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned __int8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;

  v4 = *((unsigned __int8 *)a2 + 32);
  if (*(unsigned __int8 *)(a1 + 32) == 255)
  {
    if (v4 == 255)
    {
      v20 = *a2;
      v21 = a2[1];
      *(_BYTE *)(a1 + 32) = *((_BYTE *)a2 + 32);
      *(_OWORD *)a1 = v20;
      *(_OWORD *)(a1 + 16) = v21;
    }
    else
    {
      v14 = *(_QWORD *)a2;
      v15 = *((_QWORD *)a2 + 1);
      v17 = *((_QWORD *)a2 + 2);
      v16 = *((_QWORD *)a2 + 3);
      sub_21304F388(*(_QWORD *)a2, v15, v17, v16, v4);
      *(_QWORD *)a1 = v14;
      *(_QWORD *)(a1 + 8) = v15;
      *(_QWORD *)(a1 + 16) = v17;
      *(_QWORD *)(a1 + 24) = v16;
      *(_BYTE *)(a1 + 32) = v4;
    }
  }
  else if (v4 == 255)
  {
    sub_21304FD3C(a1);
    v18 = *((_BYTE *)a2 + 32);
    v19 = a2[1];
    *(_OWORD *)a1 = *a2;
    *(_OWORD *)(a1 + 16) = v19;
    *(_BYTE *)(a1 + 32) = v18;
  }
  else
  {
    v5 = *(_QWORD *)a2;
    v6 = *((_QWORD *)a2 + 1);
    v8 = *((_QWORD *)a2 + 2);
    v7 = *((_QWORD *)a2 + 3);
    sub_21304F388(*(_QWORD *)a2, v6, v8, v7, v4);
    v9 = *(_QWORD *)a1;
    v10 = *(_QWORD *)(a1 + 8);
    v11 = *(_QWORD *)(a1 + 16);
    v12 = *(_QWORD *)(a1 + 24);
    *(_QWORD *)a1 = v5;
    *(_QWORD *)(a1 + 8) = v6;
    *(_QWORD *)(a1 + 16) = v8;
    *(_QWORD *)(a1 + 24) = v7;
    v13 = *(_BYTE *)(a1 + 32);
    *(_BYTE *)(a1 + 32) = v4;
    sub_21304F400(v9, v10, v11, v12, v13);
  }
  return a1;
}

uint64_t sub_21304FD3C(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BDF1BB0] - 8) + 8))();
  return a1;
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for ComplicationContainerPathModifier(uint64_t a1, uint64_t a2)
{
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;

  v4 = *(unsigned __int8 *)(a1 + 32);
  if (v4 == 255)
    goto LABEL_5;
  v5 = *(unsigned __int8 *)(a2 + 32);
  if (v5 == 255)
  {
    sub_21304FD3C(a1);
LABEL_5:
    v11 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v11;
    *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
    return a1;
  }
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v8 = *(_QWORD *)(a1 + 16);
  v9 = *(_QWORD *)(a1 + 24);
  v10 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v10;
  *(_BYTE *)(a1 + 32) = v5;
  sub_21304F400(v6, v7, v8, v9, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for ComplicationContainerPathModifier(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xF9 && *(_BYTE *)(a1 + 33))
    return (*(_DWORD *)a1 + 249);
  v3 = *(unsigned __int8 *)(a1 + 32);
  if (v3 <= 6)
    v4 = -1;
  else
    v4 = (v3 ^ 0xFF) - 1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ComplicationContainerPathModifier(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF8)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 - 249;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xF9)
      *(_BYTE *)(result + 33) = 1;
  }
  else
  {
    if (a3 >= 0xF9)
      *(_BYTE *)(result + 33) = 0;
    if (a2)
      *(_BYTE *)(result + 32) = ~(_BYTE)a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for ComplicationContainerPathModifier()
{
  return &type metadata for ComplicationContainerPathModifier;
}

uint64_t sub_21304FE98()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21304FEA8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  double (**v6)@<D0>(uint64_t@<X8>);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  __int128 v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v23)(char *, uint64_t, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F198);
  MEMORY[0x24BDAC7A8](v29);
  v6 = (double (**)@<D0>(uint64_t@<X8>))((char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F1A0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x24BDAC7A8](v7);
  v10 = *(unsigned __int8 *)(v2 + 32);
  if (v10 == 255)
  {
    v23 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
    v23((char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v7);
    v23((char *)v6, (uint64_t)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F1A8);
    sub_21304B778(&qword_254B6F1B0, &qword_254B6F1A8, MEMORY[0x24BDEC6F8]);
    sub_21304B778(&qword_254B6F1B8, &qword_254B6F1A0, MEMORY[0x24BDEFB78]);
    sub_213068780();
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))((char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
  }
  else
  {
    v11 = *(_QWORD *)(v2 + 24);
    v26 = *(_QWORD *)(v2 + 16);
    v27 = v11;
    v12 = *(_QWORD *)(v2 + 8);
    v24 = *(_QWORD *)v2;
    v25 = v12;
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v7);
    v13 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    v28 = a2;
    v14 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v14 + v13, (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
    v15 = v14 + ((v13 + v9 + 7) & 0xFFFFFFFFFFFFFFF8);
    v16 = *(_OWORD *)(v2 + 16);
    *(_OWORD *)v15 = *(_OWORD *)v2;
    *(_OWORD *)(v15 + 16) = v16;
    *(_BYTE *)(v15 + 32) = *(_BYTE *)(v2 + 32);
    v17 = v14 + ((v13 + v9 + 47) & 0xFFFFFFFFFFFFFFF8);
    v19 = v24;
    v18 = v25;
    *(_QWORD *)v17 = v24;
    *(_QWORD *)(v17 + 8) = v18;
    v21 = v26;
    v20 = v27;
    *(_QWORD *)(v17 + 16) = v26;
    *(_QWORD *)(v17 + 24) = v20;
    *(_BYTE *)(v17 + 32) = v10;
    *v6 = sub_213050380;
    v6[1] = (double (*)@<D0>(uint64_t@<X8>))v14;
    swift_storeEnumTagMultiPayload();
    sub_21304F3C8(v2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_21304F860);
    sub_21304F388(v19, v18, v21, v20, v10);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F1A8);
    sub_21304B778(&qword_254B6F1B0, &qword_254B6F1A8, MEMORY[0x24BDEC6F8]);
    sub_21304B778(&qword_254B6F1B8, &qword_254B6F1A0, MEMORY[0x24BDEFB78]);
    return sub_213068780();
  }
}

double sub_213050178@<D0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double result;
  _QWORD v13[7];
  char v14;

  v4 = sub_2130687A4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21306881C();
  sub_213068528();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_2130688D0();
  *(_OWORD *)v13 = *(_OWORD *)&v13[3];
  v8 = v13[5];
  v9 = v13[6];
  LOBYTE(v4) = v14;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F1A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(a2, a1, v10);
  v11 = a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254B6F1C0) + 36);
  result = *(double *)v13;
  *(_OWORD *)v11 = *(_OWORD *)v13;
  *(_QWORD *)(v11 + 16) = v8;
  *(_QWORD *)(v11 + 24) = v9;
  *(_BYTE *)(v11 + 32) = v4;
  return result;
}

uint64_t sub_2130502A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_21304FEA8(a1, a2);
}

uint64_t sub_2130502D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  int v6;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F1A0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = v3 + *(_QWORD *)(v2 + 64);
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  v5 = v0 + ((v4 + 7) & 0xFFFFFFFFFFFFFFF8);
  v6 = *(unsigned __int8 *)(v5 + 32);
  if (v6 != 255)
    sub_21304F400(*(_QWORD *)v5, *(_QWORD *)(v5 + 8), *(_QWORD *)(v5 + 16), *(_QWORD *)(v5 + 24), v6);
  sub_21304F400(*(_QWORD *)(v0 + ((v4 + 47) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v0 + ((v4 + 47) & 0xFFFFFFFFFFFFFFF8) + 8), *(_QWORD *)(v0 + ((v4 + 47) & 0xFFFFFFFFFFFFFFF8) + 16), *(_QWORD *)(v0 + ((v4 + 47) & 0xFFFFFFFFFFFFFFF8) + 24), *(_BYTE *)(v0 + ((v4 + 47) & 0xFFFFFFFFFFFFFFF8) + 32));
  return swift_deallocObject();
}

double sub_213050380@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F1A0);
  return sub_213050178(v1+ ((*(unsigned __int8 *)(*(_QWORD *)(v3 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v3 - 8) + 80)), a1);
}

unint64_t sub_2130503F4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254B6F1C8;
  if (!qword_254B6F1C8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B6F1D0);
    v2[0] = sub_21304B778(&qword_254B6F1B0, &qword_254B6F1A8, MEMORY[0x24BDEC6F8]);
    v2[1] = sub_21304B778(&qword_254B6F1B8, &qword_254B6F1A0, MEMORY[0x24BDEFB78]);
    result = MEMORY[0x2199AA6AC](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254B6F1C8);
  }
  return result;
}

uint64_t sub_213050490(uint64_t *a1, unint64_t a2, uint64_t a3)
{
  uint64_t *v5;
  uint64_t TupleTypeMetadata;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  __int128 *v12;
  _OWORD *v13;
  unint64_t v14;
  __int128 v15;
  unint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;

  v5 = (uint64_t *)(a3 & 0xFFFFFFFFFFFFFFFELL);
  if (a2 == 1)
  {
    TupleTypeMetadata = *v5;
    MEMORY[0x24BDAC7A8]();
    v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
LABEL_12:
    v22 = 32;
    v23 = a2;
    do
    {
      if (a2 == 1)
        v24 = 0;
      else
        v24 = *(_DWORD *)(TupleTypeMetadata + v22);
      v26 = *v5++;
      v25 = v26;
      v27 = *a1++;
      (*(void (**)(char *, uint64_t))(*(_QWORD *)(v25 - 8) + 16))(&v8[v24], v27);
      v22 += 16;
      --v23;
    }
    while (v23);
    return sub_213068AD4();
  }
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    v11 = 0;
    if (a2 < 4)
      goto LABEL_9;
    if ((unint64_t)(v10 - (char *)v5) < 0x20)
      goto LABEL_9;
    v11 = a2 & 0xFFFFFFFFFFFFFFFCLL;
    v12 = (__int128 *)(v5 + 2);
    v13 = v10 + 16;
    v14 = a2 & 0xFFFFFFFFFFFFFFFCLL;
    do
    {
      v15 = *v12;
      *(v13 - 1) = *(v12 - 1);
      *v13 = v15;
      v12 += 2;
      v13 += 2;
      v14 -= 4;
    }
    while (v14);
    if (v11 != a2)
    {
LABEL_9:
      v16 = a2 - v11;
      v17 = v11;
      v18 = &v10[8 * v11];
      v19 = &v5[v17];
      do
      {
        v20 = *v19++;
        *(_QWORD *)v18 = v20;
        v18 += 8;
        --v16;
      }
      while (v16);
    }
  }
  TupleTypeMetadata = swift_getTupleTypeMetadata();
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v29 - v21;
  if (a2)
    goto LABEL_12;
  return sub_213068AD4();
}

double sub_213050644()
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  CGRect v6;
  CGRect v7;

  v6.origin.x = sub_2130506A4();
  x = v6.origin.x;
  y = v6.origin.y;
  width = v6.size.width;
  height = v6.size.height;
  MidX = CGRectGetMidX(v6);
  v7.origin.x = x;
  v7.origin.y = y;
  v7.size.width = width;
  v7.size.height = height;
  CGRectGetMidY(v7);
  return MidX;
}

double sub_2130506A4()
{
  uint64_t v0;
  id v1;
  id v2;
  double v3;
  double v4;

  v1 = objc_msgSend((id)objc_opt_self(), sel_sharedRenderingContext);
  v2 = objc_msgSend(v1, sel_device);

  CDRichComplicationCornerTextCustomViewRect((uint64_t)v2, *(_QWORD *)(v0 + 16));
  v4 = v3;

  return v4;
}

double sub_213050744()
{
  double *v0;
  double v1;

  sub_2130506A4();
  return v1 / *v0;
}

double sub_213050764()
{
  double v0;

  sub_2130506A4();
  return v0;
}

uint64_t sub_213050780@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[2];

  v29 = a2;
  v3 = sub_2130685B8();
  v27 = *(_QWORD *)(v3 - 8);
  v28 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(a1 + 16);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B6EEC8);
  sub_2130685C4();
  sub_2130685C4();
  sub_2130685C4();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B6EED0);
  sub_2130685C4();
  sub_2130685C4();
  swift_getTupleTypeMetadata2();
  v7 = sub_213068AC8();
  MEMORY[0x2199AA6AC](MEMORY[0x24BDF5428], v7);
  v8 = sub_213068AA4();
  v24 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v24 - v9;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B6EED8);
  v11 = sub_2130685C4();
  v25 = *(_QWORD *)(v11 - 8);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v24 - v15;
  v17 = *(_QWORD *)(a1 + 24);
  v30 = v6;
  v31 = v17;
  v32 = v26;
  sub_213068ABC();
  sub_213068A98();
  swift_getKeyPath();
  v19 = v27;
  v18 = v28;
  (*(void (**)(char *, _QWORD, uint64_t))(v27 + 104))(v5, *MEMORY[0x24BDED100], v28);
  v20 = MEMORY[0x2199AA6AC](MEMORY[0x24BDF4750], v8);
  sub_213068918();
  swift_release();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v5, v18);
  (*(void (**)(char *, uint64_t))(v24 + 8))(v10, v8);
  v21 = sub_21304B778((unint64_t *)&qword_254B6EEE0, &qword_254B6EED8, MEMORY[0x24BDF1028]);
  v33[0] = v20;
  v33[1] = v21;
  MEMORY[0x2199AA6AC](MEMORY[0x24BDED308], v11, v33);
  sub_213059AA0((uint64_t)v14, v11, (uint64_t)v16);
  v22 = *(void (**)(char *, uint64_t))(v25 + 8);
  v22(v14, v11);
  sub_213055E58((uint64_t)v16, v11, v29);
  return ((uint64_t (*)(char *, uint64_t))v22)(v16, v11);
}

uint64_t sub_213050AA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t, uint64_t);
  void *v46;
  void (*v47)(uint64_t, uint64_t, uint64_t);
  uint64_t v48;
  id v49;
  uint64_t v51;
  char *v52;
  char *v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  _QWORD v75[2];
  _QWORD v76[4];
  id v77;
  uint64_t v78[2];
  _QWORD v79[2];
  _QWORD v80[2];
  _QWORD v81[2];
  _QWORD v82[2];
  _QWORD v83[2];

  v51 = a3;
  v72 = a4;
  v56 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v8 = (char *)&v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B6EEC8);
  v9 = sub_2130685C4();
  v61 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v52 = (char *)&v51 - v10;
  v11 = sub_2130685C4();
  v64 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v53 = (char *)&v51 - v12;
  v13 = sub_2130685C4();
  v68 = *(_QWORD *)(v13 - 8);
  v58 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v55 = (char *)&v51 - v14;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B6EED0);
  v15 = sub_2130685C4();
  v16 = *(_QWORD *)(v15 - 8);
  v65 = v15;
  v70 = v16;
  MEMORY[0x24BDAC7A8](v15);
  v57 = (char *)&v51 - v17;
  v18 = sub_2130685C4();
  v71 = *(_QWORD *)(v18 - 8);
  v19 = MEMORY[0x24BDAC7A8](v18);
  v63 = (char *)&v51 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v69 = (uint64_t)&v51 - v21;
  v54 = type metadata accessor for ComplicationCornerTextView(0, a2, a3, v22);
  sub_2130506A4();
  sub_2130506A4();
  v67 = *(_QWORD *)(a1 + 16);
  v23 = *(void **)(a1 + 32);
  v66 = *(_QWORD *)(a1 + 24);
  v62 = *(_QWORD *)(a1 + 40);
  type metadata accessor for MonochromeModel();
  sub_2130517F8();
  swift_bridgeObjectRetain();
  v24 = v23;
  v60 = sub_2130685AC();
  v59 = v25;
  (*(void (**)(void))(a1 + 48))();
  swift_getKeyPath();
  LOBYTE(v76[0]) = 1;
  v26 = v52;
  v27 = v51;
  sub_213068918();
  swift_release();
  (*(void (**)(char *, uint64_t))(v56 + 8))(v8, a2);
  sub_213068AEC();
  v28 = sub_21304B778(&qword_254B6EEF0, &qword_254B6EEC8, MEMORY[0x24BDF1028]);
  v83[0] = v27;
  v83[1] = v28;
  v29 = MEMORY[0x24BDED308];
  v30 = MEMORY[0x2199AA6AC](MEMORY[0x24BDED308], v9, v83);
  v31 = v53;
  sub_213068924();
  (*(void (**)(char *, uint64_t))(v61 + 8))(v26, v9);
  sub_213068ABC();
  v82[0] = v30;
  v82[1] = MEMORY[0x24BDEBF50];
  v32 = MEMORY[0x2199AA6AC](v29, v11, v82);
  v33 = v55;
  sub_213068954();
  (*(void (**)(char *, uint64_t))(v64 + 8))(v31, v11);
  v81[0] = v32;
  v81[1] = MEMORY[0x24BDEBEE0];
  v34 = v58;
  v35 = MEMORY[0x2199AA6AC](v29, v58, v81);
  sub_21304B734();
  v36 = v57;
  sub_213068984();
  (*(void (**)(char *, uint64_t))(v68 + 8))(v33, v34);
  sub_213050644();
  v37 = sub_21304B778(&qword_254B6EF00, &qword_254B6EED0, MEMORY[0x24BDEB950]);
  v80[0] = v35;
  v80[1] = v37;
  v38 = v65;
  v39 = MEMORY[0x2199AA6AC](v29, v65, v80);
  v40 = (uint64_t)v63;
  sub_213068978();
  (*(void (**)(char *, uint64_t))(v70 + 8))(v36, v38);
  v41 = sub_21304B7B8();
  v79[0] = v39;
  v79[1] = v41;
  v42 = MEMORY[0x2199AA6AC](v29, v18, v79);
  v43 = v69;
  sub_213059AA0(v40, v18, v69);
  v44 = v71;
  v45 = *(void (**)(uint64_t, uint64_t))(v71 + 8);
  v45(v40, v18);
  v76[0] = v67;
  v76[1] = v66;
  v76[2] = v62;
  v76[3] = v60;
  v46 = v59;
  v77 = v59;
  v78[0] = (uint64_t)v76;
  v47 = *(void (**)(uint64_t, uint64_t, uint64_t))(v44 + 16);
  v48 = v43;
  v47(v40, v43, v18);
  v78[1] = v40;
  swift_bridgeObjectRetain();
  v49 = v46;
  v75[0] = &type metadata for ComplicationCornerTextViewRepresentable;
  v75[1] = v18;
  v73 = sub_213051848();
  v74 = v42;
  sub_213050490(v78, 2uLL, (uint64_t)v75);
  v45(v48, v18);

  swift_bridgeObjectRelease();
  v45(v40, v18);

  return swift_bridgeObjectRelease();
}

uint64_t sub_21305116C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_213050780(a1, a2);
}

id sub_2130511A4(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  double v8;
  __int128 v9;

  v9 = *(_OWORD *)(v1 + 24);
  objc_msgSend(a1, sel_setFilterProvider_, *((_QWORD *)&v9 + 1));
  objc_msgSend(a1, sel_setCornerComplicationPosition_, *(_QWORD *)v1);
  objc_msgSend(a1, sel_setFontStyle_, *(_QWORD *)(v1 + 8));
  v3 = swift_bridgeObjectRetain();
  sub_213059FE0(v3);
  swift_bridgeObjectRelease();
  sub_2130520D8(0, &qword_254B6F290);
  v4 = (void *)sub_213068B7C();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_setInnerLabelProviders_, v4);

  objc_msgSend(a1, sel_setNeedsLayout);
  objc_msgSend(a1, sel_layoutIfNeeded);
  swift_getKeyPath();
  swift_getKeyPath();
  v5 = *((id *)&v9 + 1);
  sub_2130684A4();
  swift_release();
  swift_release();
  sub_21304C524((uint64_t)&v9);
  if (v8 >= 1.0)
    return objc_msgSend(a1, sel_updateMonochromeColor, v8);
  swift_getKeyPath();
  swift_getKeyPath();
  v6 = v5;
  sub_2130684A4();
  swift_release();
  swift_release();
  sub_21304C524((uint64_t)&v9);
  return objc_msgSend(a1, sel_transitionToMonochromeWithFraction_, v8);
}

uint64_t sub_21305137C()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  _QWORD v8[6];

  v1 = (void *)objc_opt_self();
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = v0;
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = sub_2130519D0;
  *(_QWORD *)(v3 + 24) = v2;
  v8[4] = sub_21304B8B0;
  v8[5] = v3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 1107296256;
  v8[2] = sub_213061058;
  v8[3] = &block_descriptor_0;
  v4 = _Block_copy(v8);
  v5 = v0;
  swift_retain();
  swift_release();
  objc_msgSend(v1, sel_performWithoutAnimation_, v4);
  _Block_release(v4);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
    __break(1u);
  return result;
}

id sub_213051528()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ComplicationCornerTextViewRepresentable._CornerView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ComplicationCornerTextViewRepresentable._CornerView()
{
  return objc_opt_self();
}

uint64_t sub_213051578()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_213051580(uint64_t a1)
{

  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_2130515B0(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  void *v4;
  uint64_t v5;
  id v6;

  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  v4 = *(void **)(a2 + 32);
  *(_QWORD *)(a1 + 32) = v4;
  v5 = *(_QWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 56) = v5;
  v6 = v4;
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

_QWORD *sub_213051614(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;

  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  v4 = (void *)a2[4];
  v5 = (void *)a1[4];
  a1[4] = v4;
  v6 = v4;

  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t sub_2130516B8(uint64_t a1, _OWORD *a2)
{
  __int128 v4;

  v4 = a2[1];
  *(_OWORD *)a1 = *a2;
  *(_OWORD *)(a1 + 16) = v4;

  *(_OWORD *)(a1 + 32) = a2[2];
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 48) = a2[3];
  swift_release();
  return a1;
}

uint64_t sub_21305170C(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 64))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_213051754(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 64) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 32) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t type metadata accessor for ComplicationCornerTextView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ComplicationCornerTextView);
}

uint64_t sub_2130517B0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2130517E4@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_213050AA4(v1[4], v1[2], v1[3], a1);
}

unint64_t sub_2130517F8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254B6EEE8;
  if (!qword_254B6EEE8)
  {
    v1 = type metadata accessor for MonochromeModel();
    result = MEMORY[0x2199AA6AC](&protocol conformance descriptor for MonochromeModel, v1);
    atomic_store(result, (unint64_t *)&qword_254B6EEE8);
  }
  return result;
}

unint64_t sub_213051848()
{
  unint64_t result;

  result = qword_254B6F280;
  if (!qword_254B6F280)
  {
    result = MEMORY[0x2199AA6AC](&unk_21306C0C0, &type metadata for ComplicationCornerTextViewRepresentable);
    atomic_store(result, (unint64_t *)&qword_254B6F280);
  }
  return result;
}

id sub_21305188C()
{
  _QWORD *v0;
  id v1;

  v1 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ComplicationCornerTextViewRepresentable._CornerView()), sel_initWithFontFallback_, 1, *v0, v0[1], v0[2], v0[3], v0[4]);
  sub_2130511A4(v1);
  return v1;
}

uint64_t sub_2130518E8()
{
  sub_213052094();
  return sub_21306875C();
}

uint64_t sub_213051938()
{
  sub_213052094();
  return sub_213068708();
}

void sub_213051988()
{
  sub_213052094();
  sub_213068750();
  __break(1u);
}

uint64_t sub_2130519AC()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_2130519D0()
{
  uint64_t v0;
  objc_super v2;

  v2.receiver = *(id *)(v0 + 16);
  v2.super_class = (Class)type metadata accessor for ComplicationCornerTextViewRepresentable._CornerView();
  return objc_msgSendSuper2(&v2, sel_layoutSubviews);
}

uint64_t sub_213051A0C()
{
  return swift_deallocObject();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

void sub_213051A34(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>, double a8@<D0>, double a9@<D1>)
{
  void *v18;
  id v19;
  id v20;
  id v21;
  double v22;
  double v23;
  int64_t v24;
  double v25;
  double v26;
  id *v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  double *v34;
  id v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;

  v18 = (void *)objc_opt_self();
  v19 = a3;
  v20 = objc_msgSend(v18, sel_sharedRenderingContext);
  v21 = objc_msgSend(v20, sel_device);

  v22 = CDRichComplicationCornerInnerImageMaxSize(v21);
  v24 = *(_QWORD *)(a4 + 16);
  if (v24)
  {
    v25 = v22;
    v26 = v23;
    v39 = a1;
    v40 = a2;
    v41 = a7;
    v42 = a5;
    v44 = MEMORY[0x24BEE4AF8];
    sub_21304E408(0, v24, 0);
    v27 = (id *)(a4 + 32);
    do
    {
      v28 = *v27;
      v29 = objc_msgSend(v28, sel_textProvider);
      objc_msgSend(v29, sel_finalize);
      v30 = objc_msgSend(v28, sel_imageProvider);
      v31 = v30;
      if (v30)
      {
        objc_msgSend(v30, sel_copy);

        sub_213068BF4();
        swift_unknownObjectRelease();
        sub_2130520D8(0, (unint64_t *)&qword_254B6EF18);
        if ((swift_dynamicCast() & 1) != 0)
        {
          v31 = v43;
          type metadata accessor for WidgetNamedImageProvider(0);
          v32 = swift_dynamicCastClass();
          if (v32)
          {
            v33 = OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_finalized;
            if ((*(_BYTE *)(v32 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_finalized) & 1) == 0)
            {
              v34 = (double *)(v32 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider__maxSize);
              *v34 = v25;
              v34[1] = v26;
              *(_BYTE *)(v32 + v33) = 1;
            }
          }
          else
          {
            objc_msgSend(v43, sel_finalizeWithMaxSDKSize_maxDeviceSize_maskToCircle_, 0, v25, v26, v25, v26);
          }
        }
        else
        {
          v31 = 0;
        }
      }
      v35 = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, v29, v31);

      v36 = v44;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_21304E408(0, *(_QWORD *)(v44 + 16) + 1, 1);
        v36 = v44;
      }
      v38 = *(_QWORD *)(v36 + 16);
      v37 = *(_QWORD *)(v36 + 24);
      if (v38 >= v37 >> 1)
      {
        sub_21304E408((char *)(v37 > 1), v38 + 1, 1);
        v36 = v44;
      }
      *(_QWORD *)(v36 + 16) = v38 + 1;
      *(_QWORD *)(v36 + 8 * v38 + 32) = v35;
      ++v27;
      --v24;
    }
    while (v24);

    a5 = v42;
    a2 = v40;
    a7 = v41;
    a1 = v39;
  }
  else
  {

    v36 = MEMORY[0x24BEE4AF8];
  }
  *(double *)a7 = a8;
  *(double *)(a7 + 8) = a9;
  *(_QWORD *)(a7 + 16) = a1;
  *(_QWORD *)(a7 + 24) = a2;
  *(_QWORD *)(a7 + 32) = v19;
  *(_QWORD *)(a7 + 40) = v36;
  *(_QWORD *)(a7 + 48) = a5;
  *(_QWORD *)(a7 + 56) = a6;
}

void destroy for ComplicationCornerTextViewRepresentable(uint64_t a1)
{
  swift_bridgeObjectRelease();

}

uint64_t initializeWithCopy for ComplicationCornerTextViewRepresentable(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v3;
  v4 = *(void **)(a2 + 32);
  *(_QWORD *)(a1 + 32) = v4;
  swift_bridgeObjectRetain();
  v5 = v4;
  return a1;
}

_QWORD *assignWithCopy for ComplicationCornerTextViewRepresentable(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;

  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  v4 = (void *)a2[4];
  v5 = (void *)a1[4];
  a1[4] = v4;
  v6 = v4;

  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for ComplicationCornerTextViewRepresentable(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 32);
  v5 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;

  return a1;
}

uint64_t getEnumTagSinglePayload for ComplicationCornerTextViewRepresentable(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ComplicationCornerTextViewRepresentable(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ComplicationCornerTextViewRepresentable()
{
  return &type metadata for ComplicationCornerTextViewRepresentable;
}

uint64_t sub_213051F34()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[2];

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B6EEC8);
  sub_2130685C4();
  sub_2130685C4();
  sub_2130685C4();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B6EED0);
  sub_2130685C4();
  sub_2130685C4();
  swift_getTupleTypeMetadata2();
  v0 = sub_213068AC8();
  MEMORY[0x2199AA6AC](MEMORY[0x24BDF5428], v0);
  v1 = sub_213068AA4();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B6EED8);
  v2 = sub_2130685C4();
  v4[0] = MEMORY[0x2199AA6AC](MEMORY[0x24BDF4750], v1);
  v4[1] = sub_21304B778((unint64_t *)&qword_254B6EEE0, &qword_254B6EED8, MEMORY[0x24BDF1028]);
  return MEMORY[0x2199AA6AC](MEMORY[0x24BDED308], v2, v4);
}

unint64_t sub_213052094()
{
  unint64_t result;

  result = qword_254B6F288;
  if (!qword_254B6F288)
  {
    result = MEMORY[0x2199AA6AC](&unk_21306C030, &type metadata for ComplicationCornerTextViewRepresentable);
    atomic_store(result, (unint64_t *)&qword_254B6F288);
  }
  return result;
}

uint64_t sub_2130520D8(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

void sub_213052118(_QWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t KeyPath;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B6EED8);
  MEMORY[0x24BDAC7A8](v31);
  v4 = (uint64_t *)((char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v32 = sub_2130685B8();
  v27 = *(_QWORD *)(v32 - 8);
  MEMORY[0x24BDAC7A8](v32);
  v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v1;
  v8 = (void *)v1[2];
  v29 = v1[1];
  v30 = v7;
  v9 = (void *)v1[4];
  v28 = v1[3];
  v10 = v1[5];
  v11 = v1[6];
  type metadata accessor for MonochromeModel();
  sub_2130517F8();
  v12 = v8;
  swift_bridgeObjectRetain();
  v26 = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v13 = sub_2130685AC();
  v15 = v14;
  KeyPath = swift_getKeyPath();
  v17 = v27;
  v18 = v32;
  (*(void (**)(char *, _QWORD, uint64_t))(v27 + 104))(v6, *MEMORY[0x24BDED100], v32);
  (*(void (**)(char *, char *, uint64_t))(v17 + 16))((char *)v4 + *(int *)(v31 + 28), v6, v18);
  *v4 = KeyPath;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F2C0);
  sub_213052B20((uint64_t)v4, (uint64_t)a1 + *(int *)(v19 + 36));
  v21 = v28;
  v20 = v29;
  *a1 = v30;
  a1[1] = v20;
  a1[2] = v13;
  a1[3] = v15;
  v22 = v26;
  a1[4] = v21;
  a1[5] = v22;
  a1[6] = v10;
  a1[7] = v11;
  v23 = v15;
  swift_bridgeObjectRetain();
  v24 = v22;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_213052B68((uint64_t)v4);
  (*(void (**)(char *, uint64_t))(v17 + 8))(v6, v32);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

void sub_213052330(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  double v27;
  __int128 v28;

  v3 = *(_QWORD *)(v1 + 48);
  v4 = swift_bridgeObjectRetain();
  v5 = sub_2130579C0(v4);
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, v5, 0);
LABEL_3:
    v8 = v7;
    swift_bridgeObjectRelease();

    goto LABEL_13;
  }
  v9 = *(_QWORD *)(v3 + 16);
  if (v9)
  {
    swift_bridgeObjectRetain();
    v10 = 0;
    while (1)
    {
      v11 = *(id *)(v3 + 8 * v10 + 32);
      v12 = objc_msgSend(v11, sel_imageProvider);

      if (v12)
        break;
      ++v10;

      if (v9 == v10)
      {
        swift_bridgeObjectRelease_n();
        goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
    v6 = objc_msgSend(v11, sel_imageProvider);

    if (v6)
    {
      v7 = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, 0, v6);
      goto LABEL_3;
    }
  }
  swift_bridgeObjectRelease();
LABEL_12:
  v8 = 0;
LABEL_13:
  v13 = *(_QWORD *)(v1 + 56);
  v14 = swift_bridgeObjectRetain();
  v15 = sub_2130579C0(v14);
  if (v15)
  {
    v16 = v15;
    v17 = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, v15, 0);
LABEL_15:
    v18 = v17;
    swift_bridgeObjectRelease();

    goto LABEL_25;
  }
  v19 = *(_QWORD *)(v13 + 16);
  if (v19)
  {
    swift_bridgeObjectRetain();
    v20 = 0;
    while (1)
    {
      v21 = *(id *)(v13 + 8 * v20 + 32);
      v22 = objc_msgSend(v21, sel_imageProvider);

      if (v22)
        break;
      ++v20;

      if (v19 == v20)
      {
        swift_bridgeObjectRelease_n();
        goto LABEL_24;
      }
    }
    swift_bridgeObjectRelease();
    v16 = objc_msgSend(v21, sel_imageProvider);

    if (v16)
    {
      v17 = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, 0, v16);
      goto LABEL_15;
    }
  }
  swift_bridgeObjectRelease();
LABEL_24:
  v18 = 0;
LABEL_25:
  objc_msgSend(a1, sel_handleGaugeProvider_leftLabelProvider_rightLabelProvider_, *(_QWORD *)(v1 + 40), v8, v18);
  v23 = swift_bridgeObjectRetain();
  sub_213059FE0(v23);
  swift_bridgeObjectRelease();
  sub_2130520D8(0, &qword_254B6F290);
  v24 = (void *)sub_213068B7C();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_setOuterLabelProviders_, v24);

  v28 = *(_OWORD *)(v1 + 16);
  objc_msgSend(a1, sel_setFilterProvider_, *((_QWORD *)&v28 + 1));
  objc_msgSend(a1, sel_setCornerComplicationPosition_, *(_QWORD *)v1);
  objc_msgSend(a1, sel_setFontStyle_, *(_QWORD *)(v1 + 8));
  objc_msgSend(a1, sel_setNeedsLayout);
  objc_msgSend(a1, sel_layoutIfNeeded);
  swift_getKeyPath();
  swift_getKeyPath();
  v25 = *((id *)&v28 + 1);
  sub_2130684A4();
  swift_release();
  swift_release();
  sub_21304C524((uint64_t)&v28);
  if (v27 >= 1.0)
  {
    objc_msgSend(a1, sel_updateMonochromeColor, v27);
  }
  else
  {
    swift_getKeyPath();
    swift_getKeyPath();
    v26 = v25;
    sub_2130684A4();
    swift_release();
    swift_release();
    sub_21304C524((uint64_t)&v28);
    objc_msgSend(a1, sel_transitionToMonochromeWithFraction_, v27);
  }

}

uint64_t sub_213052734()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  _QWORD v8[6];

  v1 = (void *)objc_opt_self();
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = v0;
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = sub_213052BCC;
  *(_QWORD *)(v3 + 24) = v2;
  v8[4] = sub_21304B8B0;
  v8[5] = v3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 1107296256;
  v8[2] = sub_213061058;
  v8[3] = &block_descriptor_1;
  v4 = _Block_copy(v8);
  v5 = v0;
  swift_retain();
  swift_release();
  objc_msgSend(v1, sel_performWithoutAnimation_, v4);
  _Block_release(v4);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
    __break(1u);
  return result;
}

id sub_2130528E0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ComplicationCornerStackedGaugeViewRepresentable._CornerView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ComplicationCornerStackedGaugeViewRepresentable._CornerView()
{
  return objc_opt_self();
}

uint64_t destroy for ComplicationCornerStackedGaugeView(uint64_t a1)
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ComplicationCornerStackedGaugeView(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(void **)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 24) = v4;
  v6 = *(void **)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v6;
  *(_QWORD *)(a1 + 40) = v5;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  v7 = v3;
  swift_bridgeObjectRetain();
  v8 = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for ComplicationCornerStackedGaugeView(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  *a1 = *a2;
  a1[1] = a2[1];
  v4 = (void *)a2[2];
  v5 = (void *)a1[2];
  a1[2] = v4;
  v6 = v4;

  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v7 = (void *)a2[4];
  v8 = (void *)a1[4];
  a1[4] = v7;
  v9 = v7;

  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for ComplicationCornerStackedGaugeView(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;

  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRelease();

  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for ComplicationCornerStackedGaugeView()
{
  return &type metadata for ComplicationCornerStackedGaugeView;
}

uint64_t sub_213052B08()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_213052B20(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B6EED8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_213052B68(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B6EED8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_213052BA8()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_213052BCC()
{
  uint64_t v0;
  objc_super v2;

  v2.receiver = *(id *)(v0 + 16);
  v2.super_class = (Class)type metadata accessor for ComplicationCornerStackedGaugeViewRepresentable._CornerView();
  return objc_msgSendSuper2(&v2, sel_layoutSubviews);
}

uint64_t sub_213052C08()
{
  return swift_deallocObject();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

id sub_213052C30()
{
  _QWORD *v0;
  id v1;

  v1 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ComplicationCornerStackedGaugeViewRepresentable._CornerView()), sel_initWithFontFallback_, 1, *v0, v0[1], v0[2], v0[3], v0[4], v0[5], v0[6], v0[7]);
  sub_213052330(v1);
  return v1;
}

uint64_t sub_213052C8C()
{
  sub_21305383C();
  return sub_21306875C();
}

uint64_t sub_213052CDC()
{
  sub_21305383C();
  return sub_213068708();
}

void sub_213052D2C()
{
  sub_21305383C();
  sub_213068750();
  __break(1u);
}

void sub_213052D50(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, void *a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, _QWORD *a8@<X8>)
{
  void *v12;
  id v13;
  id v14;
  double v15;
  double v16;
  uint64_t v17;
  int64_t v18;
  double v19;
  double v20;
  uint64_t i;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  double *v29;
  id v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  double v34;
  double v35;
  double v36;
  int64_t v37;
  uint64_t j;
  id v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  double *v46;
  id v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  int64_t v51;
  id *v52;
  id v53;
  id v54;
  id v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  double *v60;
  id v61;
  unint64_t v62;
  unint64_t v63;
  void *v64;
  id v65;
  id v67;
  void *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;

  v12 = (void *)objc_opt_self();
  v67 = a3;
  v13 = objc_msgSend(v12, sel_sharedRenderingContext);
  v14 = objc_msgSend(v13, sel_device);

  v71 = v14;
  v15 = CDRichComplicationCornerGaugeOuterImageMaxSize(v14);
  v17 = MEMORY[0x24BEE4AF8];
  v18 = *(_QWORD *)(a4 + 16);
  if (v18)
  {
    v19 = v15;
    v20 = v16;
    v64 = a5;
    v73 = MEMORY[0x24BEE4AF8];
    sub_21304E408(0, v18, 0);
    for (i = 0; i != v18; ++i)
    {
      v22 = *(id *)(a4 + 8 * i + 32);
      v23 = objc_msgSend(v22, sel_textProvider);
      objc_msgSend(v23, sel_finalize);
      v24 = objc_msgSend(v22, sel_imageProvider);
      if (v24
        && (v25 = v24,
            objc_msgSend(v24, sel_copy),
            v25,
            sub_213068BF4(),
            swift_unknownObjectRelease(),
            sub_2130520D8(0, (unint64_t *)&qword_254B6EF18),
            (swift_dynamicCast() & 1) != 0))
      {
        v26 = v72;
        type metadata accessor for WidgetNamedImageProvider(0);
        v27 = swift_dynamicCastClass();
        if (v27)
        {
          v28 = OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_finalized;
          if ((*(_BYTE *)(v27 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_finalized) & 1) == 0)
          {
            v29 = (double *)(v27 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider__maxSize);
            *v29 = v19;
            v29[1] = v20;
            *(_BYTE *)(v27 + v28) = 1;
          }
        }
        else
        {
          objc_msgSend(v72, sel_finalizeWithMaxSDKSize_maxDeviceSize_maskToCircle_, 0, v19, v20, v19, v20);
        }
      }
      else
      {
        v26 = 0;
      }
      v30 = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, v23, v26);

      v31 = v73;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_21304E408(0, *(_QWORD *)(v73 + 16) + 1, 1);
        v31 = v73;
      }
      v33 = *(_QWORD *)(v31 + 16);
      v32 = *(_QWORD *)(v31 + 24);
      if (v33 >= v32 >> 1)
      {
        sub_21304E408((char *)(v32 > 1), v33 + 1, 1);
        v31 = v73;
      }
      *(_QWORD *)(v31 + 16) = v33 + 1;
      *(_QWORD *)(v31 + 8 * v33 + 32) = v30;
    }
    swift_bridgeObjectRelease();
    v17 = MEMORY[0x24BEE4AF8];
    a5 = v64;
  }
  else
  {
    swift_bridgeObjectRelease();
    v31 = MEMORY[0x24BEE4AF8];
  }
  v65 = a5;
  v34 = CDRichComplicationCornerInnerImageMaxSize(v71);
  v36 = v35;
  v37 = *(_QWORD *)(a6 + 16);
  if (v37)
  {
    v74 = v17;
    sub_21304E408(0, v37, 0);
    for (j = 0; j != v37; ++j)
    {
      v39 = *(id *)(a6 + 8 * j + 32);
      v40 = objc_msgSend(v39, sel_textProvider);
      objc_msgSend(v40, sel_finalize);
      v41 = objc_msgSend(v39, sel_imageProvider);
      if (v41
        && (v42 = v41,
            objc_msgSend(v41, sel_copy),
            v42,
            sub_213068BF4(),
            swift_unknownObjectRelease(),
            sub_2130520D8(0, (unint64_t *)&qword_254B6EF18),
            (swift_dynamicCast() & 1) != 0))
      {
        v43 = v72;
        type metadata accessor for WidgetNamedImageProvider(0);
        v44 = swift_dynamicCastClass();
        if (v44)
        {
          v45 = OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_finalized;
          if ((*(_BYTE *)(v44 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_finalized) & 1) == 0)
          {
            v46 = (double *)(v44 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider__maxSize);
            *v46 = v34;
            v46[1] = v36;
            *(_BYTE *)(v44 + v45) = 1;
          }
        }
        else
        {
          objc_msgSend(v72, sel_finalizeWithMaxSDKSize_maxDeviceSize_maskToCircle_, 0, v34, v36, v34, v36);
        }
      }
      else
      {
        v43 = 0;
      }
      v47 = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, v40, v43);

      v48 = v74;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_21304E408(0, *(_QWORD *)(v74 + 16) + 1, 1);
        v48 = v74;
      }
      v50 = *(_QWORD *)(v48 + 16);
      v49 = *(_QWORD *)(v48 + 24);
      if (v50 >= v49 >> 1)
      {
        sub_21304E408((char *)(v49 > 1), v50 + 1, 1);
        v48 = v74;
      }
      *(_QWORD *)(v48 + 16) = v50 + 1;
      *(_QWORD *)(v48 + 8 * v50 + 32) = v47;
    }
    swift_bridgeObjectRelease();
    v17 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    swift_bridgeObjectRelease();
    v48 = MEMORY[0x24BEE4AF8];
  }
  v51 = *(_QWORD *)(a7 + 16);
  if (v51)
  {
    v75 = v17;
    sub_21304E408(0, v51, 0);
    v52 = (id *)(a7 + 32);
    do
    {
      v53 = *v52;
      v54 = objc_msgSend(v53, sel_textProvider);
      objc_msgSend(v54, sel_finalize);
      v55 = objc_msgSend(v53, sel_imageProvider);
      if (v55
        && (v56 = v55,
            objc_msgSend(v55, sel_copy),
            v56,
            sub_213068BF4(),
            swift_unknownObjectRelease(),
            sub_2130520D8(0, (unint64_t *)&qword_254B6EF18),
            (swift_dynamicCast() & 1) != 0))
      {
        v57 = v72;
        type metadata accessor for WidgetNamedImageProvider(0);
        v58 = swift_dynamicCastClass();
        if (v58)
        {
          v59 = OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_finalized;
          if ((*(_BYTE *)(v58 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_finalized) & 1) == 0)
          {
            v60 = (double *)(v58 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider__maxSize);
            *v60 = v34;
            v60[1] = v36;
            *(_BYTE *)(v58 + v59) = 1;
          }
        }
        else
        {
          objc_msgSend(v72, sel_finalizeWithMaxSDKSize_maxDeviceSize_maskToCircle_, 0, v34, v36, v34, v36);
        }
      }
      else
      {
        v57 = 0;
      }
      v61 = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, v54, v57);

      v17 = v75;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_21304E408(0, *(_QWORD *)(v75 + 16) + 1, 1);
        v17 = v75;
      }
      v63 = *(_QWORD *)(v17 + 16);
      v62 = *(_QWORD *)(v17 + 24);
      if (v63 >= v62 >> 1)
      {
        sub_21304E408((char *)(v62 > 1), v63 + 1, 1);
        v17 = v75;
      }
      *(_QWORD *)(v17 + 16) = v63 + 1;
      *(_QWORD *)(v17 + 8 * v63 + 32) = v61;
      ++v52;
      --v51;
    }
    while (v51);
  }

  *a8 = a1;
  a8[1] = a2;
  a8[2] = v67;
  a8[3] = v31;
  a8[4] = v65;
  a8[5] = v48;
  a8[6] = v17;
}

uint64_t destroy for ComplicationCornerStackedGaugeViewRepresentable(uint64_t a1)
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ComplicationCornerStackedGaugeViewRepresentable(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(void **)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v3;
  v4 = *(void **)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v4;
  v5 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v5;
  v6 = v3;
  swift_bridgeObjectRetain();
  v7 = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for ComplicationCornerStackedGaugeViewRepresentable(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  v4 = (void *)a2[3];
  v5 = (void *)a1[3];
  a1[3] = v4;
  v6 = v4;

  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v7 = (void *)a2[5];
  v8 = (void *)a1[5];
  a1[5] = v7;
  v9 = v7;

  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for ComplicationCornerStackedGaugeViewRepresentable(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);

  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();

  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ComplicationCornerStackedGaugeViewRepresentable(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 64))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ComplicationCornerStackedGaugeViewRepresentable(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 64) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ComplicationCornerStackedGaugeViewRepresentable()
{
  return &type metadata for ComplicationCornerStackedGaugeViewRepresentable;
}

unint64_t sub_213053734()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254B6F2C8;
  if (!qword_254B6F2C8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B6F2C0);
    v2[0] = sub_2130537A0();
    v2[1] = sub_2130537E4();
    result = MEMORY[0x2199AA6AC](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254B6F2C8);
  }
  return result;
}

unint64_t sub_2130537A0()
{
  unint64_t result;

  result = qword_254B6F2D0;
  if (!qword_254B6F2D0)
  {
    result = MEMORY[0x2199AA6AC](&unk_21306C270, &type metadata for ComplicationCornerStackedGaugeViewRepresentable);
    atomic_store(result, (unint64_t *)&qword_254B6F2D0);
  }
  return result;
}

unint64_t sub_2130537E4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254B6EEE0;
  if (!qword_254B6EEE0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B6EED8);
    result = MEMORY[0x2199AA6AC](MEMORY[0x24BDF1028], v1);
    atomic_store(result, (unint64_t *)&qword_254B6EEE0);
  }
  return result;
}

unint64_t sub_21305383C()
{
  unint64_t result;

  result = qword_254B6F2D8;
  if (!qword_254B6F2D8)
  {
    result = MEMORY[0x2199AA6AC](&unk_21306C2C0, &type metadata for ComplicationCornerStackedGaugeViewRepresentable);
    atomic_store(result, (unint64_t *)&qword_254B6F2D8);
  }
  return result;
}

double MonochromeModel.fraction.getter()
{
  double v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_2130684A4();
  swift_release();
  swift_release();
  return v1;
}

double sub_2130538F0@<D0>(double *a1@<X8>)
{
  double result;
  double v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_2130684A4();
  swift_release();
  swift_release();
  result = v3;
  *a1 = v3;
  return result;
}

uint64_t sub_213053970(uint64_t a1, void **a2)
{
  void *v2;
  id v3;

  v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = v2;
  return sub_2130684B0();
}

uint64_t MonochromeModel.fraction.setter()
{
  void *v0;
  id v1;

  swift_getKeyPath();
  swift_getKeyPath();
  v1 = v0;
  return sub_2130684B0();
}

uint64_t (*MonochromeModel.fraction.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_213068498();
  return sub_213053AD0;
}

uint64_t MonochromeModel.$fraction.getter()
{
  return sub_2130543B4((uint64_t)&OBJC_IVAR____TtC19ComplicationDisplay15MonochromeModel__fraction, &qword_254B6F2E8);
}

uint64_t MonochromeModel.$fraction.setter(uint64_t a1)
{
  return sub_2130545B8(a1, &qword_254B6F2F0, (uint64_t)&OBJC_IVAR____TtC19ComplicationDisplay15MonochromeModel__fraction, &qword_254B6F2E8);
}

uint64_t (*MonochromeModel.$fraction.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F2F0);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC19ComplicationDisplay15MonochromeModel__fraction;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F2E8);
  sub_213068480();
  swift_endAccess();
  return sub_213053BCC;
}

uint64_t MonochromeModel.accent.getter()
{
  return sub_213053DAC();
}

uint64_t sub_213053BE4@<X0>(_QWORD *a1@<X8>)
{
  return sub_213053E28(a1);
}

uint64_t sub_213053BFC(uint64_t a1, void **a2)
{
  return sub_213053EB8(a1, a2);
}

uint64_t MonochromeModel.accent.setter()
{
  return sub_213053F40();
}

uint64_t (*MonochromeModel.accent.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_213068498();
  return sub_213053AD0;
}

uint64_t MonochromeModel.$accent.getter()
{
  return sub_2130543B4((uint64_t)&OBJC_IVAR____TtC19ComplicationDisplay15MonochromeModel__accent, &qword_254B6F300);
}

uint64_t MonochromeModel.$accent.setter(uint64_t a1)
{
  return sub_2130545B8(a1, &qword_254B6F308, (uint64_t)&OBJC_IVAR____TtC19ComplicationDisplay15MonochromeModel__accent, &qword_254B6F300);
}

uint64_t (*MonochromeModel.$accent.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F308);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC19ComplicationDisplay15MonochromeModel__accent;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F300);
  sub_213068480();
  swift_endAccess();
  return sub_213053BCC;
}

uint64_t MonochromeModel.background.getter()
{
  return sub_213053DAC();
}

uint64_t sub_213053DAC()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_2130684A4();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_213053E14@<X0>(_QWORD *a1@<X8>)
{
  return sub_213053E28(a1);
}

uint64_t sub_213053E28@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_2130684A4();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_213053EA4(uint64_t a1, void **a2)
{
  return sub_213053EB8(a1, a2);
}

uint64_t sub_213053EB8(uint64_t a1, void **a2)
{
  void *v2;
  id v3;

  v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  v3 = v2;
  return sub_2130684B0();
}

uint64_t MonochromeModel.background.setter()
{
  return sub_213053F40();
}

uint64_t sub_213053F40()
{
  void *v0;
  id v1;

  swift_getKeyPath();
  swift_getKeyPath();
  v1 = v0;
  return sub_2130684B0();
}

uint64_t (*MonochromeModel.background.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_213068498();
  return sub_213053AD0;
}

uint64_t MonochromeModel.$background.getter()
{
  return sub_2130543B4((uint64_t)&OBJC_IVAR____TtC19ComplicationDisplay15MonochromeModel__background, &qword_254B6F300);
}

uint64_t MonochromeModel.$background.setter(uint64_t a1)
{
  return sub_2130545B8(a1, &qword_254B6F308, (uint64_t)&OBJC_IVAR____TtC19ComplicationDisplay15MonochromeModel__background, &qword_254B6F300);
}

uint64_t (*MonochromeModel.$background.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F308);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC19ComplicationDisplay15MonochromeModel__background;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F300);
  sub_213068480();
  swift_endAccess();
  return sub_213053BCC;
}

uint64_t MonochromeModel.style.getter()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_2130684A4();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_213054184@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_2130684A4();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_213054204(uint64_t a1, void **a2)
{
  void *v2;
  id v3;

  v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = v2;
  return sub_2130684B0();
}

uint64_t MonochromeModel.style.setter()
{
  void *v0;
  id v1;

  swift_getKeyPath();
  swift_getKeyPath();
  v1 = v0;
  return sub_2130684B0();
}

uint64_t (*MonochromeModel.style.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_213068498();
  return sub_213053AD0;
}

void sub_213054354(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();
  free(v1);
}

uint64_t MonochromeModel.$style.getter()
{
  return sub_2130543B4((uint64_t)&OBJC_IVAR____TtC19ComplicationDisplay15MonochromeModel__style, &qword_254B6F320);
}

uint64_t sub_2130543B4(uint64_t a1, uint64_t *a2)
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a2);
  sub_213068480();
  return swift_endAccess();
}

uint64_t sub_213054418(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a5);
  sub_213068480();
  return swift_endAccess();
}

uint64_t sub_213054484(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t a6, uint64_t *a7)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  void (*v16)(char *, uint64_t, uint64_t);
  uint64_t v18;

  v9 = __swift_instantiateConcreteTypeFromMangledName(a5);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v18 - v14;
  v16 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v16((char *)&v18 - v14, a1, v9);
  v16(v13, (uint64_t)v15, v9);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a7);
  sub_21306848C();
  swift_endAccess();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v15, v9);
}

uint64_t MonochromeModel.$style.setter(uint64_t a1)
{
  return sub_2130545B8(a1, &qword_254B6F328, (uint64_t)&OBJC_IVAR____TtC19ComplicationDisplay15MonochromeModel__style, &qword_254B6F320);
}

uint64_t sub_2130545B8(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a4);
  sub_21306848C();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
}

uint64_t (*MonochromeModel.$style.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F328);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC19ComplicationDisplay15MonochromeModel__style;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F320);
  sub_213068480();
  swift_endAccess();
  return sub_213053BCC;
}

void sub_213054758(uint64_t a1, char a2)
{
  _QWORD *v3;
  void (*v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void *, uint64_t);

  v3 = *(_QWORD **)a1;
  v4 = *(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(*(_QWORD *)a1 + 88) + 16);
  v4(*(_QWORD *)(*(_QWORD *)a1 + 104), v3[14], v3[10]);
  v5 = (void *)v3[13];
  v6 = (void *)v3[14];
  v8 = v3[11];
  v7 = (void *)v3[12];
  v9 = v3[10];
  if ((a2 & 1) != 0)
  {
    v4(v3[12], v3[13], v3[10]);
    swift_beginAccess();
    sub_21306848C();
    swift_endAccess();
    v10 = *(void (**)(void *, uint64_t))(v8 + 8);
    v10(v5, v9);
  }
  else
  {
    swift_beginAccess();
    sub_21306848C();
    swift_endAccess();
    v10 = *(void (**)(void *, uint64_t))(v8 + 8);
  }
  v10(v6, v9);
  free(v6);
  free(v5);
  free(v7);
  free(v3);
}

id MonochromeModel.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id MonochromeModel.init()()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  void (*v16)(char *, char *, uint64_t);
  char *v17;
  char *v18;
  uint64_t v20;
  uint64_t v21;
  objc_class *ObjectType;
  objc_super v23;
  uint64_t v24;

  v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType();
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F320);
  v2 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F300);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F2E8);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = &v1[OBJC_IVAR____TtC19ComplicationDisplay15MonochromeModel__fraction];
  v24 = 0;
  v14 = v1;
  sub_213068474();
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v13, v12, v9);
  v15 = &v14[OBJC_IVAR____TtC19ComplicationDisplay15MonochromeModel__accent];
  v24 = sub_2130689B4();
  sub_213068474();
  v16 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
  v16(v15, v8, v5);
  v17 = &v14[OBJC_IVAR____TtC19ComplicationDisplay15MonochromeModel__background];
  v24 = sub_2130689B4();
  sub_213068474();
  v16(v17, v8, v5);
  v18 = &v14[OBJC_IVAR____TtC19ComplicationDisplay15MonochromeModel__style];
  v24 = 1;
  type metadata accessor for CLKMonochromeFilterStyle(0);
  sub_213068474();
  (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v18, v4, v21);

  v23.receiver = v14;
  v23.super_class = ObjectType;
  return objc_msgSendSuper2(&v23, sel_init);
}

id MonochromeModel.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_213054BB4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  swift_getObjectType();
  result = sub_213068468();
  *a1 = result;
  return result;
}

uint64_t MonochromeModel.filters(for:style:)()
{
  return sub_213054DB0();
}

uint64_t MonochromeModel.filters(for:style:fraction:)()
{
  return sub_213054F08();
}

uint64_t MonochromeModel.filter(for:style:)()
{
  return 0;
}

uint64_t MonochromeModel.filter(for:style:fraction:)()
{
  return 0;
}

UIColor_optional __swiftcall MonochromeModel.color(for:accented:)(UIView *a1, Swift::Bool accented)
{
  objc_class *v2;
  Swift::Bool v3;
  UIColor_optional result;

  v2 = (objc_class *)sub_21305506C();
  result.value.super.isa = v2;
  result.is_nil = v3;
  return result;
}

UIColor_optional __swiftcall MonochromeModel.backgroundColor(for:)(UIView *a1)
{
  objc_class *v1;
  UIColor_optional result;

  v1 = 0;
  result.value.super.isa = v1;
  return result;
}

uint64_t sub_213054DB0()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;

  sub_2130520D8(0, &qword_254B6F388);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2130684A4();
  swift_release();
  swift_release();
  v0 = (void *)sub_213068BDC();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2130684A4();
  swift_release();
  swift_release();
  v1 = (void *)sub_213068BDC();
  v2 = (id)CLKUIMonochromeFiltersForStyle();

  if (!v2)
    return 0;
  sub_2130520D8(0, &qword_254B6F380);
  v3 = sub_213068B88();

  return v3;
}

uint64_t sub_213054F08()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;

  sub_2130520D8(0, &qword_254B6F388);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2130684A4();
  swift_release();
  swift_release();
  v0 = (void *)sub_213068BDC();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2130684A4();
  swift_release();
  swift_release();
  v1 = (void *)sub_213068BDC();
  v2 = (id)CLKUIMonochromeFiltersForStyle();

  if (!v2)
    return 0;
  sub_2130520D8(0, &qword_254B6F380);
  v3 = sub_213068B88();

  return v3;
}

uint64_t sub_21305506C()
{
  sub_2130520D8(0, &qword_254B6F388);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2130684A4();
  swift_release();
  swift_release();
  return sub_213068BDC();
}

uint64_t sub_213055124()
{
  return MEMORY[0x24BDB9D70];
}

uint64_t sub_213055130(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_213054418(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC19ComplicationDisplay15MonochromeModel__fraction, &qword_254B6F2E8);
}

uint64_t sub_213055154(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_213054484(a1, a2, a3, a4, &qword_254B6F2F0, (uint64_t)&OBJC_IVAR____TtC19ComplicationDisplay15MonochromeModel__fraction, &qword_254B6F2E8);
}

uint64_t sub_213055180(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_213054418(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC19ComplicationDisplay15MonochromeModel__accent, &qword_254B6F300);
}

uint64_t sub_2130551A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_213054484(a1, a2, a3, a4, &qword_254B6F308, (uint64_t)&OBJC_IVAR____TtC19ComplicationDisplay15MonochromeModel__accent, &qword_254B6F300);
}

uint64_t sub_2130551D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_213054418(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC19ComplicationDisplay15MonochromeModel__background, &qword_254B6F300);
}

uint64_t sub_2130551F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_213054484(a1, a2, a3, a4, &qword_254B6F308, (uint64_t)&OBJC_IVAR____TtC19ComplicationDisplay15MonochromeModel__background, &qword_254B6F300);
}

uint64_t sub_213055220(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_213054418(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC19ComplicationDisplay15MonochromeModel__style, &qword_254B6F320);
}

uint64_t sub_213055244(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_213054484(a1, a2, a3, a4, &qword_254B6F328, (uint64_t)&OBJC_IVAR____TtC19ComplicationDisplay15MonochromeModel__style, &qword_254B6F320);
}

uint64_t sub_213055270()
{
  return type metadata accessor for MonochromeModel();
}

uint64_t type metadata accessor for MonochromeModel()
{
  uint64_t result;

  result = qword_254B6F358;
  if (!qword_254B6F358)
    return swift_getSingletonMetadata();
  return result;
}

void sub_2130552B4()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_213055374(319, &qword_254B6F368);
  if (v0 <= 0x3F)
  {
    sub_213055374(319, &qword_254B6F370);
    if (v1 <= 0x3F)
    {
      sub_2130553B8();
      if (v2 <= 0x3F)
        swift_updateClassMetadata2();
    }
  }
}

void sub_213055374(uint64_t a1, unint64_t *a2)
{
  unint64_t v3;
  uint64_t v4;

  if (!*a2)
  {
    v3 = sub_2130684BC();
    if (!v4)
      atomic_store(v3, a2);
  }
}

void sub_2130553B8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254B6F378)
  {
    type metadata accessor for CLKMonochromeFilterStyle(255);
    v0 = sub_2130684BC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254B6F378);
  }
}

float ComplicationCurvedTextMetrics.angularRange.getter()
{
  uint64_t v0;

  return *(float *)v0;
}

void ComplicationCurvedTextMetrics.angularRange.setter(float a1, float a2)
{
  float *v2;

  *v2 = a1;
  v2[1] = a2;
}

uint64_t (*ComplicationCurvedTextMetrics.angularRange.modify())()
{
  return nullsub_1;
}

double ComplicationCurvedTextMetrics.accessoryCenter.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 8);
}

void ComplicationCurvedTextMetrics.accessoryCenter.setter(double a1, double a2)
{
  uint64_t v2;

  *(double *)(v2 + 8) = a1;
  *(double *)(v2 + 16) = a2;
}

uint64_t (*ComplicationCurvedTextMetrics.accessoryCenter.modify())()
{
  return nullsub_1;
}

double ComplicationCurvedTextMetrics.accessoryRotation.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 24);
}

void ComplicationCurvedTextMetrics.accessoryRotation.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 24) = a1;
}

uint64_t (*ComplicationCurvedTextMetrics.accessoryRotation.modify())()
{
  return nullsub_1;
}

void ComplicationCurvedTextMetrics.init(angularRange:accessoryCenter:accessoryRotation:)(uint64_t a1@<X8>, float a2@<S0>, float a3@<S1>, double a4@<D2>, double a5@<D3>, double a6@<D4>)
{
  *(float *)a1 = a2;
  *(float *)(a1 + 4) = a3;
  *(double *)(a1 + 8) = a4;
  *(double *)(a1 + 16) = a5;
  *(double *)(a1 + 24) = a6;
  *(_BYTE *)(a1 + 32) = 0;
}

double sub_213055480()
{
  double result;

  byte_254B71DB0 = 0;
  result = 0.0;
  xmmword_254B71D90 = 0u;
  unk_254B71DA0 = 0u;
  return result;
}

double sub_213055498()
{
  double result;

  if (qword_254B6ED40 != -1)
    swift_once();
  result = *(double *)&qword_254B71DA8;
  qword_254B71DB8 = xmmword_254B71D90;
  unk_254B71DC0 = *(__int128 *)((char *)&xmmword_254B71D90 + 8);
  qword_254B71DD0 = qword_254B71DA8;
  byte_254B71DD8 = 1;
  return result;
}

double sub_213055508()
{
  double result;

  if (qword_254B6ED48 != -1)
    swift_once();
  result = *(double *)&qword_254B71DD0;
  qword_254B6F390 = qword_254B71DB8;
  *(_OWORD *)algn_254B6F398 = unk_254B71DC0;
  qword_254B6F3A8 = qword_254B71DD0;
  byte_254B6F3B0 = byte_254B71DD8;
  return result;
}

double static ComplicationCurvedTextMetricsKey.defaultValue.getter@<D0>(uint64_t a1@<X8>)
{
  double result;
  char v3;

  if (qword_254B6ED50 != -1)
    swift_once();
  swift_beginAccess();
  result = *(double *)&qword_254B6F3A8;
  v3 = byte_254B6F3B0;
  *(_QWORD *)a1 = qword_254B6F390;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)algn_254B6F398;
  *(double *)(a1 + 24) = result;
  *(_BYTE *)(a1 + 32) = v3;
  return result;
}

uint64_t static ComplicationCurvedTextMetricsKey.defaultValue.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t result;

  v1 = *(_QWORD *)a1;
  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  v4 = *(_QWORD *)(a1 + 24);
  v5 = *(_BYTE *)(a1 + 32);
  if (qword_254B6ED50 != -1)
    swift_once();
  result = swift_beginAccess();
  qword_254B6F390 = v1;
  *(_QWORD *)algn_254B6F398 = v2;
  qword_254B6F3A0 = v3;
  qword_254B6F3A8 = v4;
  byte_254B6F3B0 = v5;
  return result;
}

uint64_t (*static ComplicationCurvedTextMetricsKey.defaultValue.modify())()
{
  if (qword_254B6ED50 != -1)
    swift_once();
  swift_beginAccess();
  return j__swift_endAccess;
}

_QWORD *static ComplicationCurvedTextMetricsKey.reduce(value:nextValue:)(_QWORD *result, _QWORD *(*a2)(uint64_t *__return_ptr))
{
  _QWORD *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  char v10;

  v2 = result;
  if (*((_BYTE *)result + 32) == 1)
  {
    result = a2(&v7);
    v3 = v7;
    v4 = v8;
    v5 = v9;
    v6 = v10;
  }
  else
  {
    v6 = 0;
    v3 = *result;
    v4 = *(_OWORD *)(result + 1);
    v5 = result[3];
  }
  *v2 = v3;
  *(_OWORD *)(v2 + 1) = v4;
  v2[3] = v5;
  *((_BYTE *)v2 + 32) = v6;
  return result;
}

double sub_213055760@<D0>(uint64_t a1@<X8>)
{
  double result;
  char v3;

  if (qword_254B6ED50 != -1)
    swift_once();
  swift_beginAccess();
  result = *(double *)&qword_254B6F3A8;
  v3 = byte_254B6F3B0;
  *(_QWORD *)a1 = qword_254B6F390;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)algn_254B6F398;
  *(double *)(a1 + 24) = result;
  *(_BYTE *)(a1 + 32) = v3;
  return result;
}

_QWORD *sub_2130557E8(_QWORD *result, _QWORD *(*a2)(uint64_t *__return_ptr))
{
  _QWORD *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  char v10;

  v2 = result;
  if (*((_BYTE *)result + 32) == 1)
  {
    result = a2(&v7);
    v3 = v7;
    v4 = v8;
    v5 = v9;
    v6 = v10;
  }
  else
  {
    v6 = 0;
    v3 = *result;
    v4 = *(_OWORD *)(result + 1);
    v5 = result[3];
  }
  *v2 = v3;
  *(_OWORD *)(v2 + 1) = v4;
  v2[3] = v5;
  *((_BYTE *)v2 + 32) = v6;
  return result;
}

double sub_213055858@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  double result;
  char v4;

  swift_getKeyPath();
  sub_213055D58();
  sub_21306842C();
  swift_release();
  result = *(double *)(v1 + 40);
  v4 = *(_BYTE *)(v1 + 48);
  *(_QWORD *)a1 = *(_QWORD *)(v1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(v1 + 24);
  *(double *)(a1 + 24) = result;
  *(_BYTE *)(a1 + 32) = v4;
  return result;
}

double sub_2130558E4@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  double result;
  char v5;

  v3 = *a1;
  swift_getKeyPath();
  sub_213055D58();
  sub_21306842C();
  swift_release();
  result = *(double *)(v3 + 40);
  v5 = *(_BYTE *)(v3 + 48);
  *(_QWORD *)a2 = *(_QWORD *)(v3 + 16);
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(v3 + 24);
  *(double *)(a2 + 24) = result;
  *(_BYTE *)(a2 + 32) = v5;
  return result;
}

uint64_t sub_213055970()
{
  swift_getKeyPath();
  sub_213055D58();
  sub_213068420();
  return swift_release();
}

__n128 sub_213055A0C(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 32) = v3;
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 32);
  return result;
}

uint64_t sub_213055A20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC19ComplicationDisplay39ComplicationCurvedTextMetricsObservable___observationRegistrar;
  v2 = sub_21306845C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

__n128 sub_213055A70@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __n128 result;
  __n128 v12;

  v5 = *v2;
  swift_getKeyPath();
  sub_213055D58();
  sub_21306842C();
  swift_release();
  v12 = *(__n128 *)(v5 + 24);
  v6 = *(_QWORD *)(v5 + 40);
  v7 = *(_BYTE *)(v5 + 48);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F4C0);
  v9 = *(_QWORD *)(v5 + 16);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a2, a1, v8);
  v10 = a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254B6F4C8) + 36);
  *(_QWORD *)v10 = v9;
  result = v12;
  *(__n128 *)(v10 + 8) = v12;
  *(_QWORD *)(v10 + 24) = v6;
  *(_BYTE *)(v10 + 32) = v7;
  return result;
}

uint64_t _s19ComplicationDisplay0A17CurvedTextMetricsV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  int v6;
  int v7;

  if (*(float *)a1 != *(float *)a2
    || *(float *)(a1 + 4) != *(float *)(a2 + 4)
    || *(double *)(a1 + 8) != *(double *)(a2 + 8)
    || *(double *)(a1 + 16) != *(double *)(a2 + 16))
  {
    return 0;
  }
  v6 = *(unsigned __int8 *)(a1 + 32);
  v7 = *(unsigned __int8 *)(a2 + 32);
  if ((sub_213068990() & 1) != 0)
    return v6 ^ v7 ^ 1u;
  else
    return 0;
}

uint64_t getEnumTagSinglePayload for ComplicationCurvedTextMetrics(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 33))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 32);
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for ComplicationCurvedTextMetrics(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 33) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 33) = 0;
    if (a2)
      *(_BYTE *)(result + 32) = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for ComplicationCurvedTextMetrics()
{
  return &type metadata for ComplicationCurvedTextMetrics;
}

ValueMetadata *type metadata accessor for ComplicationCurvedTextMetricsKey()
{
  return &type metadata for ComplicationCurvedTextMetricsKey;
}

uint64_t sub_213055C74()
{
  return type metadata accessor for ComplicationCurvedTextMetricsObservable();
}

uint64_t type metadata accessor for ComplicationCurvedTextMetricsObservable()
{
  uint64_t result;

  result = qword_254B6F3E8;
  if (!qword_254B6F3E8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_213055CB8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_21306845C();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for ComplicationCurvedTextMetricsObservableViewModifier()
{
  return &type metadata for ComplicationCurvedTextMetricsObservableViewModifier;
}

uint64_t sub_213055D40()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_213055D58()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254B6F4B8;
  if (!qword_254B6F4B8)
  {
    v1 = type metadata accessor for ComplicationCurvedTextMetricsObservable();
    result = MEMORY[0x2199AA6AC](&unk_21306C6A4, v1);
    atomic_store(result, (unint64_t *)&qword_254B6F4B8);
  }
  return result;
}

__n128 sub_213055DA0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __n128 result;
  __int128 v4;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v0 + 24);
  result = *(__n128 *)v2;
  v4 = *(_OWORD *)(v2 + 16);
  *(_BYTE *)(v1 + 48) = *(_BYTE *)(v2 + 32);
  *(__n128 *)(v1 + 16) = result;
  *(_OWORD *)(v1 + 32) = v4;
  return result;
}

unint64_t sub_213055DBC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254B6F4D0;
  if (!qword_254B6F4D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B6F4C8);
    v2[0] = sub_21304B778(&qword_254B6F4D8, &qword_254B6F4C0, MEMORY[0x24BDEFB78]);
    v2[1] = sub_21304B778(&qword_254B6F4E0, &qword_254B6F4E8, MEMORY[0x24BDF0B90]);
    result = MEMORY[0x2199AA6AC](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254B6F4D0);
  }
  return result;
}

uint64_t sub_213055E58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))(a3, a1);
}

double ComplicationCornerViewConfiguration.contentSize.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

void ComplicationCornerViewConfiguration.contentSize.setter(double a1, double a2)
{
  double *v2;

  *v2 = a1;
  v2[1] = a2;
}

uint64_t (*ComplicationCornerViewConfiguration.contentSize.modify())()
{
  return nullsub_1;
}

uint64_t ComplicationCornerViewConfiguration.outerLabelProviders.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ComplicationCornerViewConfiguration.outerLabelProviders.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 16) = a1;
  return result;
}

uint64_t (*ComplicationCornerViewConfiguration.outerLabelProviders.modify())()
{
  return nullsub_1;
}

void *ComplicationCornerViewConfiguration.innerContent.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;

  v2 = *(void **)(v1 + 24);
  v3 = *(_QWORD *)(v1 + 32);
  v4 = *(_QWORD *)(v1 + 40);
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = v4;
  v5 = *(_BYTE *)(v1 + 48);
  *(_BYTE *)(a1 + 24) = v5;
  return sub_213055EEC(v2, v3, v4, v5);
}

void *sub_213055EEC(void *result, uint64_t a2, uint64_t a3, char a4)
{
  id v4;

  if (a4)
  {
    if (a4 != 1)
      return result;
    v4 = result;
    swift_bridgeObjectRetain();
  }
  return (void *)swift_bridgeObjectRetain();
}

__n128 ComplicationCornerViewConfiguration.innerContent.setter(__n128 *a1)
{
  uint64_t v1;
  unint64_t v2;
  unsigned __int8 v3;
  __n128 result;
  __n128 v5;

  v5 = *a1;
  v2 = a1[1].n128_u64[0];
  v3 = a1[1].n128_u8[8];
  sub_213055F98(*(void **)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_BYTE *)(v1 + 48));
  result = v5;
  *(__n128 *)(v1 + 24) = v5;
  *(_QWORD *)(v1 + 40) = v2;
  *(_BYTE *)(v1 + 48) = v3;
  return result;
}

void *sub_213055F98(void *result, uint64_t a2, uint64_t a3, char a4)
{
  if (a4)
  {
    if (a4 != 1)
      return result;

    swift_bridgeObjectRelease();
  }
  return (void *)swift_bridgeObjectRelease();
}

uint64_t (*ComplicationCornerViewConfiguration.innerContent.modify())()
{
  return nullsub_1;
}

uint64_t ComplicationCornerViewConfiguration.position.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 56);
}

uint64_t ComplicationCornerViewConfiguration.position.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 56) = result;
  return result;
}

uint64_t (*ComplicationCornerViewConfiguration.position.modify())()
{
  return nullsub_1;
}

uint64_t ComplicationCornerViewConfiguration.fontStyle.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 64);
}

uint64_t ComplicationCornerViewConfiguration.fontStyle.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 64) = result;
  return result;
}

uint64_t (*ComplicationCornerViewConfiguration.fontStyle.modify())()
{
  return nullsub_1;
}

id ComplicationCornerViewConfiguration.monochromeModel.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 72);
}

__n128 ComplicationCornerViewConfiguration.init(contentSize:outerLabelProviders:innerContent:position:fontStyle:monochromeModel:)@<Q0>(uint64_t a1@<X0>, __n128 *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>, double a7@<D0>, double a8@<D1>)
{
  unint64_t v8;
  unsigned __int8 v9;
  __n128 result;

  v8 = a2[1].n128_u64[0];
  v9 = a2[1].n128_u8[8];
  *(double *)a6 = a7;
  *(double *)(a6 + 8) = a8;
  *(_QWORD *)(a6 + 16) = a1;
  result = *a2;
  *(__n128 *)(a6 + 24) = *a2;
  *(_QWORD *)(a6 + 40) = v8;
  *(_BYTE *)(a6 + 48) = v9;
  *(_QWORD *)(a6 + 56) = a3;
  *(_QWORD *)(a6 + 64) = a4;
  *(_QWORD *)(a6 + 72) = a5;
  return result;
}

__n128 CornerComplicationView.init(configuration:content:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  __n128 result;

  v4 = *(_QWORD *)(a1 + 16);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_BYTE *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 72);
  *(_OWORD *)a4 = *(_OWORD *)a1;
  *(_QWORD *)(a4 + 16) = v4;
  *(_OWORD *)(a4 + 24) = *(_OWORD *)(a1 + 24);
  *(_QWORD *)(a4 + 40) = v5;
  *(_BYTE *)(a4 + 48) = v6;
  result = *(__n128 *)(a1 + 56);
  *(__n128 *)(a4 + 56) = result;
  *(_QWORD *)(a4 + 72) = v7;
  *(_QWORD *)(a4 + 80) = a2;
  *(_QWORD *)(a4 + 88) = a3;
  return result;
}

void sub_2130560B0(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>)
{
  uint64_t v3;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  __int128 v12;
  __int128 v13;
  char v14;

  v7 = *(_QWORD *)(v3 + 56);
  v8 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  if (v8)
  {
    v9 = v8;
    v10 = objc_msgSend((id)objc_opt_self(), sel_hitTestPathWithViewBounds_position_forDevice_, v7, v8, 0.0, 0.0, a2, a3);

    v11 = objc_msgSend(v10, sel_CGPath);
    sub_2130688F4();

    *(_OWORD *)a1 = v12;
    *(_OWORD *)(a1 + 16) = v13;
    *(_BYTE *)(a1 + 32) = v14;
  }
  else
  {
    __break(1u);
  }
}

uint64_t CornerComplicationView.body.getter@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  _OWORD *v2;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(_QWORD *, uint64_t *, uint64_t);
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[2];
  _QWORD v42[2];
  _OWORD v43[7];

  v4 = v2[3];
  v43[2] = v2[2];
  v43[3] = v4;
  v5 = v2[5];
  v43[4] = v2[4];
  v43[5] = v5;
  v6 = v2[1];
  v43[0] = *v2;
  v43[1] = v6;
  v7 = swift_allocObject();
  v8 = *(_QWORD *)(a1 + 16);
  v9 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(v7 + 16) = v8;
  *(_QWORD *)(v7 + 24) = v9;
  v10 = v2[3];
  *(_OWORD *)(v7 + 64) = v2[2];
  *(_OWORD *)(v7 + 80) = v10;
  v11 = v2[5];
  *(_OWORD *)(v7 + 96) = v2[4];
  *(_OWORD *)(v7 + 112) = v11;
  v12 = v2[1];
  *(_OWORD *)(v7 + 32) = *v2;
  *(_OWORD *)(v7 + 48) = v12;
  sub_21305695C((uint64_t)v43);
  v14 = type metadata accessor for ComplicationCornerCircularView(255, v8, v9, v13);
  v16 = type metadata accessor for ComplicationCornerTextView(255, v8, v9, v15);
  v17 = sub_21306878C();
  v18 = sub_21306878C();
  v20 = type metadata accessor for ComplicationCornerGaugeView(255, v8, v9, v19);
  v21 = sub_21306878C();
  v22 = sub_21306878C();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B6F4F0);
  v32 = sub_2130685C4();
  v23 = sub_2130685C4();
  v24 = MEMORY[0x2199AA6AC](&unk_21306BB88, v14);
  v41[0] = sub_2130569D0();
  v41[1] = MEMORY[0x2199AA6AC](&unk_21306BF88, v16);
  v25 = MEMORY[0x24BDEF3E0];
  v40[0] = v24;
  v40[1] = MEMORY[0x2199AA6AC](MEMORY[0x24BDEF3E0], v17, v41);
  v26 = MEMORY[0x2199AA6AC](v25, v18, v40);
  v39[0] = sub_213056A14();
  v39[1] = MEMORY[0x2199AA6AC](&unk_21306B7E4, v20);
  v38[0] = v26;
  v38[1] = MEMORY[0x2199AA6AC](v25, v21, v39);
  v37[0] = MEMORY[0x2199AA6AC](v25, v22, v38);
  v37[1] = sub_21304B778(qword_254B6F508, &qword_254B6F4F0, MEMORY[0x24BDF0960]);
  v27 = MEMORY[0x24BDED308];
  v36[0] = MEMORY[0x2199AA6AC](MEMORY[0x24BDED308], v32, v37);
  v36[1] = sub_21304F6EC();
  MEMORY[0x2199AA6AC](v27, v23, v36);
  v34 = sub_21306857C();
  v35 = v28;
  v29 = sub_213068588();
  MEMORY[0x2199AA6AC](MEMORY[0x24BDEC6F8], v29);
  v30 = *(void (**)(_QWORD *, uint64_t *, uint64_t))(*(_QWORD *)(v29 - 8) + 16);
  v30(v42, &v34, v29);
  swift_release();
  v34 = v42[0];
  v35 = v42[1];
  v30(a2, &v34, v29);
  return swift_release();
}

uint64_t sub_213056480@<X0>(uint64_t a1@<X0>, __int128 *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  unint64_t v45;
  uint64_t v46;
  void (*v47)(char *, char *, uint64_t);
  char *v48;
  void (*v49)(char *, uint64_t);
  _QWORD v51[2];
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  _QWORD v64[2];
  _QWORD v65[2];
  _QWORD v66[2];
  _QWORD v67[2];
  _QWORD v68[2];
  _QWORD v69[2];
  __int128 v70;
  __int128 v71;
  char v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int16 v84;
  _OWORD v85[2];
  char v86;

  v51[1] = a1;
  v63 = a5;
  v8 = sub_2130685F4();
  v59 = *(_QWORD *)(v8 - 8);
  v60 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51[0] = type metadata accessor for ComplicationCornerCircularView(255, a3, a4, v11);
  v53 = type metadata accessor for ComplicationCornerTextView(255, a3, a4, v12);
  v54 = sub_21306878C();
  v52 = sub_21306878C();
  v55 = type metadata accessor for ComplicationCornerGaugeView(255, a3, a4, v13);
  v56 = sub_21306878C();
  v14 = sub_21306878C();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B6F4F0);
  v15 = sub_2130685C4();
  v62 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)v51 - v16;
  v18 = sub_2130685C4();
  v61 = *(_QWORD *)(v18 - 8);
  v19 = MEMORY[0x24BDAC7A8](v18);
  v57 = (char *)v51 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v58 = (char *)v51 - v21;
  v22 = a2[3];
  v75 = a2[2];
  v76 = v22;
  v23 = a2[5];
  v77 = a2[4];
  v78 = v23;
  v24 = a2[1];
  v73 = *a2;
  v74 = v24;
  v26 = type metadata accessor for CornerComplicationView(0, a3, a4, v25);
  sub_213056A58(v26, (uint64_t)&v79);
  v73 = v79;
  v74 = v80;
  v75 = v81;
  v76 = v82;
  v77 = v83;
  LOWORD(v78) = v84;
  sub_2130685E8();
  sub_21306851C();
  sub_2130560B0((uint64_t)v85, v27, v28);
  v70 = v85[0];
  v71 = v85[1];
  v72 = v86;
  v29 = MEMORY[0x2199AA6AC](&unk_21306BB88, v51[0]);
  v30 = sub_2130569D0();
  v31 = MEMORY[0x2199AA6AC](&unk_21306BF88, v53);
  v69[0] = v30;
  v69[1] = v31;
  v32 = MEMORY[0x24BDEF3E0];
  v33 = MEMORY[0x2199AA6AC](MEMORY[0x24BDEF3E0], v54, v69);
  v68[0] = v29;
  v68[1] = v33;
  v34 = MEMORY[0x2199AA6AC](v32, v52, v68);
  v35 = sub_213056A14();
  v36 = MEMORY[0x2199AA6AC](&unk_21306B7E4, v55);
  v67[0] = v35;
  v67[1] = v36;
  v37 = MEMORY[0x2199AA6AC](v32, v56, v67);
  v66[0] = v34;
  v66[1] = v37;
  v38 = MEMORY[0x2199AA6AC](v32, v14, v66);
  sub_2130597B8();
  sub_213068930();
  sub_2130597FC((uint64_t)v85);
  (*(void (**)(char *, uint64_t))(v59 + 8))(v10, v60);
  sub_213059830(v73, *((uint64_t *)&v73 + 1), (void *)v74, *((uint64_t *)&v74 + 1), (void *)v75, *((void **)&v75 + 1), v76, *((uint64_t *)&v76 + 1), v77, *((uint64_t *)&v77 + 1), v78, SBYTE1(v78));
  sub_21306851C();
  sub_2130560B0((uint64_t)&v79, v39, v40);
  v73 = v79;
  v74 = v80;
  LOBYTE(v75) = v81;
  v41 = sub_21304B778(qword_254B6F508, &qword_254B6F4F0, MEMORY[0x24BDF0960]);
  v65[0] = v38;
  v65[1] = v41;
  v42 = MEMORY[0x24BDED308];
  v43 = MEMORY[0x2199AA6AC](MEMORY[0x24BDED308], v15, v65);
  v44 = v57;
  View.complicationContainerPath(_:)((uint64_t)&v73, v15, v43);
  sub_2130597FC((uint64_t)&v79);
  (*(void (**)(char *, uint64_t))(v62 + 8))(v17, v15);
  v45 = sub_21304F6EC();
  v64[0] = v43;
  v64[1] = v45;
  MEMORY[0x2199AA6AC](v42, v18, v64);
  v46 = v61;
  v47 = *(void (**)(char *, char *, uint64_t))(v61 + 16);
  v48 = v58;
  v47(v58, v44, v18);
  v49 = *(void (**)(char *, uint64_t))(v46 + 8);
  v49(v44, v18);
  v47(v63, v48, v18);
  return ((uint64_t (*)(char *, uint64_t))v49)(v48, v18);
}

uint64_t sub_21305690C()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  sub_213055F98(*(void **)(v0 + 56), *(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72), *(_BYTE *)(v0 + 80));

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_213056950@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v2;

  return sub_213056480(a1, (__int128 *)(v2 + 32), *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), a2);
}

uint64_t sub_21305695C(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  char v6;
  id v7;

  v2 = *(void **)(a1 + 24);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(a1 + 72);
  v6 = *(_BYTE *)(a1 + 48);
  swift_bridgeObjectRetain();
  sub_213055EEC(v2, v3, v4, v6);
  v7 = v5;
  swift_retain();
  return a1;
}

unint64_t sub_2130569D0()
{
  unint64_t result;

  result = qword_254B6F4F8;
  if (!qword_254B6F4F8)
  {
    result = MEMORY[0x2199AA6AC](&unk_21306C960, &type metadata for ComplicationCornerStackedTextView);
    atomic_store(result, (unint64_t *)&qword_254B6F4F8);
  }
  return result;
}

unint64_t sub_213056A14()
{
  unint64_t result;

  result = qword_254B6F500;
  if (!qword_254B6F500)
  {
    result = MEMORY[0x2199AA6AC](&unk_21306C1F0, &type metadata for ComplicationCornerStackedGaugeView);
    atomic_store(result, (unint64_t *)&qword_254B6F500);
  }
  return result;
}

uint64_t sub_213056A58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  double v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(__int128 *, __int128 *, uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  char v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(__int128 *, __int128 *, uint64_t);
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void (*v83)(__int128 *, __int128 *, uint64_t);
  void *v84;
  void *v85;
  __int128 v86;
  __int128 v87;
  uint64_t v88;
  uint64_t v89;
  __int128 v90;
  __int128 v91;
  void *v92;
  uint64_t v93;
  __int128 v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  __int128 v98;
  char v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  char v105;
  char v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  unint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  unint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  uint64_t v135;
  void *v136;
  uint64_t v137;
  void *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  char v147;
  char v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  void *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  __int128 v160;
  void *v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  void *v165;
  uint64_t v166;
  __int128 v167;
  _QWORD v170[2];
  _QWORD v171[2];
  _QWORD v172[2];
  _QWORD v173[2];
  _QWORD v174[2];
  _QWORD v175[2];
  __int128 v176;
  __int128 v177;
  _BYTE v178[24];
  __int128 v179;
  uint64_t v180;
  _QWORD v181[2];
  _QWORD v182[2];
  _QWORD v183[2];
  _QWORD v184[2];
  _QWORD v185[2];
  _QWORD v186[2];
  __int128 v187;
  __int128 v188;
  _BYTE v189[40];
  uint64_t v190;
  char v191;
  _QWORD v192[2];
  __int128 v193;
  __int128 v194;
  _BYTE v195[40];
  uint64_t v196;
  char v197;
  __int128 v198;
  __int128 v199;
  _BYTE v200[48];
  char v201;
  char v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  uint64_t v208[3];

  v4 = *(double *)v2;
  v3 = *(double *)(v2 + 8);
  v5 = *(_QWORD *)(v2 + 16);
  v7 = *(_QWORD *)(v2 + 32);
  v6 = *(_QWORD *)(v2 + 40);
  v8 = *(_QWORD *)(v2 + 56);
  v9 = *(_QWORD *)(v2 + 64);
  v11 = *(void **)(v2 + 72);
  v10 = *(_QWORD *)(v2 + 80);
  v12 = *(_QWORD *)(v2 + 88);
  if (*(_BYTE *)(v2 + 48))
  {
    if (*(_BYTE *)(v2 + 48) == 1)
    {
      v165 = *(void **)(v2 + 24);
      if (*(_QWORD *)(v5 + 16))
      {
        v13 = *(void **)(v2 + 24);
        sub_213055EEC(v13, v7, v6, 1);
        v14 = v11;
        swift_bridgeObjectRetain();
        sub_213052D50(v8, v9, v14, v5, v13, v7, v6, &v203);
        swift_bridgeObjectRelease();
        v193 = v203;
        v194 = v204;
        *(_OWORD *)v195 = v205;
        *(_QWORD *)&v195[16] = v206;
        v15 = *(_QWORD *)(a1 + 16);
        v16 = *(_QWORD *)(a1 + 24);
        v18 = type metadata accessor for ComplicationCornerGaugeView(0, v15, v16, v17);
        sub_213056A14();
        MEMORY[0x2199AA6AC](&unk_21306B7E4, v18);
        sub_21305E51C((uint64_t)&v193, (uint64_t)&type metadata for ComplicationCornerStackedGaugeView);
        sub_213059980((uint64_t)&v203);
      }
      else
      {
        v50 = *(void **)(v2 + 24);
        swift_retain();
        sub_213055EEC(v50, v7, v6, 1);
        v128 = *(_QWORD *)(a1 + 16);
        v129 = *(_QWORD *)(a1 + 24);
        sub_21304BA54(v8, v9, v11, v50, v7, v6, v10, v12, (uint64_t)&v203, v4, v3);
        swift_bridgeObjectRelease();
        *(_OWORD *)v200 = v205;
        *(_OWORD *)&v200[16] = v206;
        *(_OWORD *)&v200[32] = v207;
        v198 = v203;
        v199 = v204;
        v52 = type metadata accessor for ComplicationCornerGaugeView(0, v128, v129, v51);
        MEMORY[0x2199AA6AC](&unk_21306B7E4, v52);
        v53 = *(void (**)(__int128 *, __int128 *, uint64_t))(*(_QWORD *)(v52 - 8) + 16);
        v53(&v193, &v198, v52);
        sub_2130599D8((uint64_t)&v203);
        v54 = *(_OWORD *)v195;
        v198 = v193;
        v199 = v194;
        *(_OWORD *)v200 = *(_OWORD *)v195;
        *(_OWORD *)&v200[24] = *(_OWORD *)&v195[24];
        *(_QWORD *)&v200[16] = *(_QWORD *)&v195[16];
        *(_QWORD *)&v200[40] = v196;
        v53(&v187, &v198, v52);
        v55 = *(_OWORD *)v189;
        v176 = v187;
        v177 = v188;
        *(_OWORD *)v178 = *(_OWORD *)v189;
        v179 = *(_OWORD *)&v189[24];
        *(_QWORD *)&v178[16] = *(_QWORD *)&v189[16];
        v180 = v190;
        sub_213056A14();
        sub_21305E5E0((uint64_t)&v176, (uint64_t)&type metadata for ComplicationCornerStackedGaugeView, v52);
        v16 = v129;
        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        swift_release();
        swift_bridgeObjectRelease();
        v15 = v128;
        swift_bridgeObjectRelease();

      }
      v144 = *(_QWORD *)&v200[40];
      v145 = *(_QWORD *)&v200[32];
      v147 = v201;
      v149 = *((_QWORD *)&v199 + 1);
      v151 = (void *)v199;
      v154 = *((_QWORD *)&v198 + 1);
      v157 = v198;
      v56 = *(_OWORD *)v200;
      v57 = *(_OWORD *)&v200[16];
      v58 = type metadata accessor for ComplicationCornerGaugeView(255, v15, v16, v19);
      v59 = sub_21306878C();
      v60 = sub_213056A14();
      v61 = MEMORY[0x2199AA6AC](&unk_21306B7E4, v58);
      v192[0] = v60;
      v192[1] = v61;
      MEMORY[0x2199AA6AC](MEMORY[0x24BDEF3E0], v59, v192);
      (*(void (**)(__int128 *, __int128 *, uint64_t))(*(_QWORD *)(v59 - 8) + 16))(&v193, &v198, v59);
      v140 = *((_QWORD *)&v193 + 1);
      v142 = v193;
      v62 = *((_QWORD *)&v194 + 1);
      v136 = *(void **)v195;
      v138 = (void *)v194;
      v132 = *(_QWORD *)&v195[16];
      v134 = *(void **)&v195[8];
      v130 = *(_QWORD *)&v195[24];
      v63 = *(_QWORD *)&v195[32];
      v64 = v196;
      v65 = v197;
      v187 = v193;
      v188 = v194;
      *(_OWORD *)v189 = *(_OWORD *)v195;
      *(_OWORD *)&v189[16] = *(_OWORD *)&v195[16];
      *(_QWORD *)&v189[32] = *(_QWORD *)&v195[32];
      v190 = v196;
      v191 = v197;
      v67 = type metadata accessor for ComplicationCornerCircularView(255, v15, v16, v66);
      v69 = type metadata accessor for ComplicationCornerTextView(255, v15, v16, v68);
      v70 = sub_21306878C();
      v71 = sub_21306878C();
      v72 = MEMORY[0x2199AA6AC](&unk_21306BB88, v67);
      v73 = sub_2130569D0();
      v74 = MEMORY[0x2199AA6AC](&unk_21306BF88, v69);
      v186[0] = v73;
      v186[1] = v74;
      v75 = MEMORY[0x24BDEF3E0];
      v76 = MEMORY[0x2199AA6AC](MEMORY[0x24BDEF3E0], v70, v186);
      v185[0] = v72;
      v185[1] = v76;
      MEMORY[0x2199AA6AC](v75, v71, v185);
      sub_21305E5E0((uint64_t)&v187, v71, v59);

      sub_2130598EC(v157, v154, v151, v149, (void *)v56, *((void **)&v56 + 1), v57, *((uint64_t *)&v57 + 1), v145, v144, v147);
      sub_2130598EC(v142, v140, v138, v62, v136, v134, v132, v130, v63, v64, v65);
    }
    else
    {
      v28 = *(_QWORD *)(a1 + 16);
      v29 = *(_QWORD *)(a1 + 24);
      *(_QWORD *)&v198 = nullsub_1(v8, v10, v12, v28, v29);
      *((_QWORD *)&v198 + 1) = v30;
      *(_QWORD *)&v199 = v31;
      v33 = type metadata accessor for ComplicationCornerCircularView(0, v28, v29, v32);
      v34 = MEMORY[0x2199AA6AC](&unk_21306BB88, v33);
      v35 = *(void (**)(__int128 *, __int128 *, uint64_t))(*(_QWORD *)(v33 - 8) + 16);
      v35(&v203, &v198, v33);
      swift_retain();
      swift_release();
      v193 = v203;
      *(_QWORD *)&v194 = v204;
      v35(&v198, &v193, v33);
      v187 = v198;
      *(_QWORD *)&v188 = v199;
      v37 = type metadata accessor for ComplicationCornerTextView(255, v28, v29, v36);
      v38 = sub_21306878C();
      v172[0] = sub_2130569D0();
      v172[1] = MEMORY[0x2199AA6AC](&unk_21306BF88, v37);
      v39 = MEMORY[0x2199AA6AC](MEMORY[0x24BDEF3E0], v38, v172);
      sub_21305E51C((uint64_t)&v187, v33);
      swift_release();
      v40 = v193;
      v41 = v194;
      v161 = *(void **)v195;
      v156 = *(_QWORD *)&v195[16];
      v159 = *(_QWORD *)&v195[8];
      v153 = *(_QWORD *)&v195[24];
      v42 = v195[32];
      v43 = v195[33];
      v187 = v193;
      v188 = v194;
      *(_OWORD *)v189 = *(_OWORD *)v195;
      *(_OWORD *)&v189[16] = *(_OWORD *)&v195[16];
      *(_WORD *)&v189[32] = *(_WORD *)&v195[32];
      v44 = sub_21306878C();
      v46 = type metadata accessor for ComplicationCornerGaugeView(255, v28, v29, v45);
      v47 = sub_21306878C();
      v171[0] = v34;
      v171[1] = v39;
      v48 = MEMORY[0x24BDEF3E0];
      MEMORY[0x2199AA6AC](MEMORY[0x24BDEF3E0], v44, v171);
      v170[0] = sub_213056A14();
      v170[1] = MEMORY[0x2199AA6AC](&unk_21306B7E4, v46);
      MEMORY[0x2199AA6AC](v48, v47, v170);
      sub_21305E51C((uint64_t)&v187, v44);
      sub_213059864(v40, *((uint64_t *)&v40 + 1), (void *)v41, *((uint64_t *)&v41 + 1), v161, v159, v156, v153, v42, v43);
      swift_release();
    }
  }
  else
  {
    if (*(_QWORD *)(v5 + 16))
    {
      v20 = *(void **)(v2 + 24);
      sub_213055EEC(v20, *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), 0);
      v21 = v11;
      swift_bridgeObjectRetain();
      sub_21305A9D4(v8, v9, v21, v5, (uint64_t)v20, &v203);
      sub_213055F98(v20, v7, v6, 0);
      *(_QWORD *)&v176 = *((_QWORD *)&v204 + 1);
      v22 = (void *)v204;
      v208[0] = v205;
      v193 = v203;
      v194 = v204;
      *(_QWORD *)v195 = v205;
      v23 = *(_QWORD *)(a1 + 16);
      v24 = *(_QWORD *)(a1 + 24);
      v26 = type metadata accessor for ComplicationCornerTextView(0, v23, v24, v25);
      sub_2130569D0();
      MEMORY[0x2199AA6AC](&unk_21306BF88, v26);
      sub_21305E51C((uint64_t)&v193, (uint64_t)&type metadata for ComplicationCornerStackedTextView);

      sub_213059A30((uint64_t)&v176);
      sub_213059A30((uint64_t)v208);
    }
    else
    {
      v77 = *(void **)(v2 + 24);
      swift_retain();
      sub_213055EEC(v77, v7, v6, 0);
      v78 = *(_QWORD *)(a1 + 16);
      v24 = *(_QWORD *)(a1 + 24);
      v79 = v11;
      v80 = v9;
      v23 = v78;
      sub_213051A34(v8, v80, v79, (uint64_t)v77, v10, v12, (uint64_t)&v203, v4, v3);
      sub_213055F98(v77, v7, v6, 0);
      v198 = v203;
      v199 = v204;
      *(_OWORD *)v200 = v205;
      *(_OWORD *)&v200[16] = v206;
      v82 = type metadata accessor for ComplicationCornerTextView(0, v78, v24, v81);
      MEMORY[0x2199AA6AC](&unk_21306BF88, v82);
      v83 = *(void (**)(__int128 *, __int128 *, uint64_t))(*(_QWORD *)(v82 - 8) + 16);
      v83(&v193, &v198, v82);
      sub_213059A58((uint64_t)&v203);
      v84 = *(void **)v195;
      v198 = v193;
      v199 = v194;
      *(_OWORD *)&v200[8] = *(_OWORD *)&v195[8];
      *(_QWORD *)v200 = *(_QWORD *)v195;
      *(_QWORD *)&v200[24] = *(_QWORD *)&v195[24];
      v83(&v187, &v198, v82);
      v85 = *(void **)v189;
      v176 = v187;
      v177 = v188;
      *(_OWORD *)&v178[8] = *(_OWORD *)&v189[8];
      *(_QWORD *)v178 = *(_QWORD *)v189;
      *(_QWORD *)&v179 = *(_QWORD *)&v189[24];
      sub_2130569D0();
      sub_21305E5E0((uint64_t)&v176, (uint64_t)&type metadata for ComplicationCornerStackedTextView, v82);
      swift_release();
      swift_bridgeObjectRelease();

      swift_release();
      swift_bridgeObjectRelease();

    }
    v133 = v23;
    v148 = v200[32];
    v150 = *((_QWORD *)&v199 + 1);
    v152 = (void *)v199;
    v155 = *((_QWORD *)&v198 + 1);
    v158 = v198;
    v86 = *(_OWORD *)v200;
    v87 = *(_OWORD *)&v200[16];
    v193 = v198;
    v194 = v199;
    *(_OWORD *)v195 = *(_OWORD *)v200;
    *(_OWORD *)&v195[16] = *(_OWORD *)&v200[16];
    v195[32] = v200[32];
    v88 = type metadata accessor for ComplicationCornerTextView(255, v23, v24, v27);
    v89 = sub_21306878C();
    v175[0] = sub_2130569D0();
    v175[1] = MEMORY[0x2199AA6AC](&unk_21306BF88, v88);
    v166 = MEMORY[0x2199AA6AC](MEMORY[0x24BDEF3E0], v89, v175);
    (*(void (**)(__int128 *, __int128 *, uint64_t))(*(_QWORD *)(v89 - 8) + 16))(&v198, &v193, v89);
    v90 = v198;
    v91 = v199;
    v92 = *(void **)v200;
    v135 = v24;
    v93 = *(_QWORD *)&v200[8];
    v94 = *(_OWORD *)&v200[16];
    LOBYTE(v88) = v200[32];
    v187 = v198;
    v188 = v199;
    *(_OWORD *)v189 = *(_OWORD *)v200;
    *(_OWORD *)&v189[16] = *(_OWORD *)&v200[16];
    v189[32] = v200[32];
    v96 = type metadata accessor for ComplicationCornerCircularView(0, v23, v24, v95);
    v131 = MEMORY[0x2199AA6AC](&unk_21306BB88, v96);
    sub_21305E5E0((uint64_t)&v187, v96, v89);
    sub_213059884(v90, *((uint64_t *)&v90 + 1), (void *)v91, *((uint64_t *)&v91 + 1), v92, v93, v94, *((uint64_t *)&v94 + 1), v88);
    v97 = *((_QWORD *)&v193 + 1);
    v98 = v194;
    v146 = v193;
    v141 = *(_QWORD *)&v195[8];
    v143 = *(void **)v195;
    v137 = *(_QWORD *)&v195[24];
    v139 = *(_QWORD *)&v195[16];
    v99 = v195[32];
    LOBYTE(v92) = v195[33];
    v187 = v193;
    v188 = v194;
    *(_OWORD *)v189 = *(_OWORD *)v195;
    *(_OWORD *)&v189[16] = *(_OWORD *)&v195[16];
    *(_WORD *)&v189[32] = *(_WORD *)&v195[32];
    v100 = sub_21306878C();
    v102 = type metadata accessor for ComplicationCornerGaugeView(255, v133, v135, v101);
    v103 = sub_21306878C();
    v174[0] = v131;
    v174[1] = v166;
    v104 = MEMORY[0x24BDEF3E0];
    MEMORY[0x2199AA6AC](MEMORY[0x24BDEF3E0], v100, v174);
    v173[0] = sub_213056A14();
    v173[1] = MEMORY[0x2199AA6AC](&unk_21306B7E4, v102);
    MEMORY[0x2199AA6AC](v104, v103, v173);
    sub_21305E51C((uint64_t)&v187, v100);
    sub_213059884(v158, v155, v152, v150, (void *)v86, *((uint64_t *)&v86 + 1), v87, *((uint64_t *)&v87 + 1), v148);
    sub_213059864(v146, v97, (void *)v98, *((uint64_t *)&v98 + 1), v143, v141, v139, v137, v99, (char)v92);
  }
  v105 = v201;
  v106 = v202;
  v160 = v198;
  v162 = v199;
  v163 = *(_OWORD *)v200;
  v164 = *(_OWORD *)&v200[16];
  v167 = *(_OWORD *)&v200[32];
  v107 = *(_QWORD *)(a1 + 16);
  v108 = *(_QWORD *)(a1 + 24);
  v109 = type metadata accessor for ComplicationCornerCircularView(255, v107, v108, v49);
  v111 = type metadata accessor for ComplicationCornerTextView(255, v107, v108, v110);
  v112 = sub_21306878C();
  v113 = sub_21306878C();
  v115 = type metadata accessor for ComplicationCornerGaugeView(255, v107, v108, v114);
  v116 = sub_21306878C();
  v117 = sub_21306878C();
  v118 = MEMORY[0x2199AA6AC](&unk_21306BB88, v109);
  v119 = sub_2130569D0();
  v120 = MEMORY[0x2199AA6AC](&unk_21306BF88, v111);
  v184[0] = v119;
  v184[1] = v120;
  v121 = MEMORY[0x24BDEF3E0];
  v122 = MEMORY[0x2199AA6AC](MEMORY[0x24BDEF3E0], v112, v184);
  v183[0] = v118;
  v183[1] = v122;
  v123 = MEMORY[0x2199AA6AC](v121, v113, v183);
  v124 = sub_213056A14();
  v125 = MEMORY[0x2199AA6AC](&unk_21306B7E4, v115);
  v182[0] = v124;
  v182[1] = v125;
  v126 = MEMORY[0x2199AA6AC](v121, v116, v182);
  v181[0] = v123;
  v181[1] = v126;
  MEMORY[0x2199AA6AC](v121, v117, v181);
  (*(void (**)(uint64_t, __int128 *, uint64_t))(*(_QWORD *)(v117 - 8) + 16))(a2, &v198, v117);
  return sub_213059830(v160, *((uint64_t *)&v160 + 1), (void *)v162, *((uint64_t *)&v162 + 1), (void *)v163, *((void **)&v163 + 1), v164, *((uint64_t *)&v164 + 1), v167, *((uint64_t *)&v167 + 1), v105, v106);
}

id sub_2130579C0(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t i;
  unint64_t v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  unint64_t v18;
  unint64_t v19;

  v1 = MEMORY[0x24BEE4AF8];
  v19 = MEMORY[0x24BEE4AF8];
  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    swift_bridgeObjectRetain();
    for (i = 0; i != v2; ++i)
    {
      v6 = *(id *)(a1 + 8 * i + 32);
      v7 = objc_msgSend(v6, sel_textProvider);
      if (v7)
      {
        v8 = v7;
        objc_opt_self();
        v9 = swift_dynamicCastObjCClass();
        if (v9)
        {
          v10 = (void *)v9;
          v11 = v8;
          v12 = objc_msgSend(v10, sel_textProviders);
          sub_2130594E0();
          v5 = sub_213068B88();

        }
        else
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F598);
          v13 = swift_allocObject();
          *(_OWORD *)(v13 + 16) = xmmword_21306C740;
          *(_QWORD *)(v13 + 32) = v8;
          v18 = v13;
          sub_213068B94();
          v5 = v18;

        }
      }
      else
      {

        v5 = MEMORY[0x24BEE4AF8];
      }
      sub_213059328(v5);
    }
    swift_bridgeObjectRelease();
    v1 = v19;
  }
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v16 = sub_213068C6C();
    swift_bridgeObjectRelease();
    if (v16)
      goto LABEL_12;
LABEL_14:
    swift_bridgeObjectRelease();
    return 0;
  }
  if (!*(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_14;
LABEL_12:
  sub_2130594E0();
  v14 = (void *)sub_213068B7C();
  swift_bridgeObjectRelease();
  v15 = objc_msgSend((id)objc_opt_self(), sel_providerWithProviders_, v14);

  return v15;
}

id ComplicationCornerViewConfiguration.outerLabel.getter()
{
  uint64_t v0;
  id v1;

  v0 = swift_bridgeObjectRetain();
  v1 = sub_2130579C0(v0);
  swift_bridgeObjectRelease();
  return v1;
}

void sub_213057C0C(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char v8;
  id v9;
  id v10;

  v3 = *(_QWORD *)(a1 + 16);
  v4 = *(void **)(a1 + 24);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(a1 + 72);
  v8 = *(_BYTE *)(a1 + 48);
  swift_bridgeObjectRetain_n();
  sub_213055EEC(v4, v5, v6, v8);
  v9 = v7;
  v10 = sub_2130579C0(v3);
  swift_bridgeObjectRelease_n();
  sub_213055F98(v4, v5, v6, v8);

  *a2 = v10;
}

uint64_t ComplicationCornerViewConfiguration.outerLabel.setter(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  if (a1)
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_254B6F058);
    v3 = swift_allocObject();
    *(_OWORD *)(v3 + 16) = xmmword_21306BC10;
    *(_QWORD *)(v3 + 32) = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, a1, 0);

    result = swift_bridgeObjectRelease();
    *(_QWORD *)(v1 + 16) = v3;
  }
  else
  {
    result = swift_bridgeObjectRelease();
    *(_QWORD *)(v1 + 16) = MEMORY[0x24BEE4AF8];
  }
  return result;
}

void (*ComplicationCornerViewConfiguration.outerLabel.modify(_QWORD *a1))(id *a1, char a2)
{
  uint64_t v1;
  uint64_t v3;
  id v4;

  a1[1] = v1;
  v3 = swift_bridgeObjectRetain();
  v4 = sub_2130579C0(v3);
  swift_bridgeObjectRelease();
  *a1 = v4;
  return sub_213057D9C;
}

void sub_213057D9C(id *a1, char a2)
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  id v9;
  id v10;

  v3 = *a1;
  if ((a2 & 1) != 0)
  {
    v9 = *a1;
    if (v3)
    {
      __swift_instantiateConcreteTypeFromMangledName(qword_254B6F058);
      v4 = swift_allocObject();
      *(_OWORD *)(v4 + 16) = xmmword_21306BC10;
      v5 = objc_allocWithZone((Class)CDLabelProvider);
      v9 = v9;
      *(_QWORD *)(v4 + 32) = objc_msgSend(v5, sel_initWithTextProvider_imageProvider_, v9, 0);

    }
    else
    {
      v4 = MEMORY[0x24BEE4AF8];
    }
    v7 = a1[1];
    swift_bridgeObjectRelease();
    v7[2] = v4;

  }
  else
  {
    if (v3)
    {
      v10 = *a1;
      __swift_instantiateConcreteTypeFromMangledName(qword_254B6F058);
      v6 = swift_allocObject();
      *(_OWORD *)(v6 + 16) = xmmword_21306BC10;
      *(_QWORD *)(v6 + 32) = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, v10, 0);

    }
    else
    {
      v6 = MEMORY[0x24BEE4AF8];
    }
    v8 = a1[1];
    swift_bridgeObjectRelease();
    v8[2] = v6;
  }
}

void ComplicationCornerViewConfiguration.label.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  int v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;

  v4 = *(void **)(v1 + 24);
  v3 = *(_QWORD *)(v1 + 32);
  v5 = *(_QWORD *)(v1 + 40);
  v6 = *(unsigned __int8 *)(v1 + 48);
  if (*(_BYTE *)(v1 + 48))
  {
    if (v6 == 1)
    {
      sub_213055EEC(*(void **)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), 1);
      v7 = v4;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v8 = sub_2130579C0(v3);
      swift_bridgeObjectRelease();
      v9 = sub_2130579C0(v5);
      sub_213055F98(v4, v3, v5, 1);
      swift_bridgeObjectRelease();
    }
    else
    {
      v4 = 0;
      v8 = 0;
      v9 = 0;
    }
  }
  else
  {
    v10 = swift_bridgeObjectRetain();
    v11 = sub_2130579C0(v10);
    sub_213055F98(v4, v3, v5, 0);
    v8 = 0;
    v9 = 0;
    LOBYTE(v6) = 2 * (v11 == 0);
    v4 = v11;
  }
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v8;
  *(_QWORD *)(a1 + 16) = v9;
  *(_BYTE *)(a1 + 24) = v6;
}

double sub_213057FF8@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  char v3;
  double result;
  __int128 v5;
  uint64_t v6;
  char v7;

  ComplicationCornerViewConfiguration.label.getter((uint64_t)&v5);
  v2 = v6;
  v3 = v7;
  result = *(double *)&v5;
  *(_OWORD *)a1 = v5;
  *(_QWORD *)(a1 + 16) = v2;
  *(_BYTE *)(a1 + 24) = v3;
  return result;
}

void *sub_213058078(uint64_t a1)
{
  void *v1;
  void *v2;
  char v3;
  id v5[3];
  char v6;

  v1 = *(void **)(a1 + 8);
  v2 = *(void **)(a1 + 16);
  v3 = *(_BYTE *)(a1 + 24);
  v5[0] = *(id *)a1;
  v5[1] = v1;
  v5[2] = v2;
  v6 = v3;
  sub_2130585E0(v5[0], v1, v2, v3);
  return ComplicationCornerViewConfiguration.label.setter((uint64_t)v5);
}

void *ComplicationCornerViewConfiguration.label.setter(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *result;
  void *v14;

  v2 = *(void **)a1;
  v3 = *(void **)(a1 + 8);
  v4 = *(void **)(a1 + 16);
  v5 = *(unsigned __int8 *)(a1 + 24);
  if (*(_BYTE *)(a1 + 24))
  {
    if (v5 == 1)
    {
      __swift_instantiateConcreteTypeFromMangledName(qword_254B6F058);
      v6 = swift_allocObject();
      *(_OWORD *)(v6 + 16) = xmmword_21306BC10;
      v7 = objc_allocWithZone((Class)CDLabelProvider);
      v8 = v4;
      v9 = v2;
      v14 = v3;
      v10 = v3;
      *(_QWORD *)(v6 + 32) = objc_msgSend(v7, sel_initWithTextProvider_imageProvider_, v10, 0);
      v11 = swift_allocObject();
      *(_OWORD *)(v11 + 16) = xmmword_21306BC10;
      *(_QWORD *)(v11 + 32) = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, v8, 0);

      sub_213058488(v2, v14, v4, 1);
    }
    else
    {
      v2 = 0;
      v6 = 0;
      v11 = 0;
    }
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_254B6F058);
    v12 = swift_allocObject();
    *(_OWORD *)(v12 + 16) = xmmword_21306BC10;
    *(_QWORD *)(v12 + 32) = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, v2, 0);
    sub_213058488(v2, v3, v4, 0);
    sub_213058488(v2, v3, v4, 0);
    v6 = 0;
    v11 = 0;
    v2 = (void *)v12;
  }
  result = sub_213055F98(*(void **)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_BYTE *)(v1 + 48));
  *(_QWORD *)(v1 + 24) = v2;
  *(_QWORD *)(v1 + 32) = v6;
  *(_QWORD *)(v1 + 40) = v11;
  *(_BYTE *)(v1 + 48) = v5;
  return result;
}

void sub_2130582AC(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v3 = *(void **)a1;
  v4 = *(void **)(a1 + 8);
  v5 = *(void **)(a1 + 16);
  v6 = *(unsigned __int8 *)(a1 + 24);
  if (*(_BYTE *)(a1 + 24))
  {
    if (v6 == 1)
    {
      __swift_instantiateConcreteTypeFromMangledName(qword_254B6F058);
      v7 = swift_allocObject();
      *(_OWORD *)(v7 + 16) = xmmword_21306BC10;
      v8 = objc_allocWithZone((Class)CDLabelProvider);
      v9 = v5;
      v10 = v3;
      v14 = v4;
      v11 = v4;
      *(_QWORD *)(v7 + 32) = objc_msgSend(v8, sel_initWithTextProvider_imageProvider_, v11, 0);
      v12 = swift_allocObject();
      *(_OWORD *)(v12 + 16) = xmmword_21306BC10;
      *(_QWORD *)(v12 + 32) = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, v9, 0);

      sub_213058488(v3, v14, v5, 1);
    }
    else
    {
      v3 = 0;
      v7 = 0;
      v12 = 0;
    }
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_254B6F058);
    v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_21306BC10;
    *(_QWORD *)(v13 + 32) = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, v3, 0);
    sub_213058488(v3, v4, v5, 0);
    sub_213058488(v3, v4, v5, 0);
    v7 = 0;
    v12 = 0;
    v3 = (void *)v13;
  }
  *(_QWORD *)a2 = v3;
  *(_QWORD *)(a2 + 8) = v7;
  *(_QWORD *)(a2 + 16) = v12;
  *(_BYTE *)(a2 + 24) = v6;
}

void sub_213058488(void *a1, void *a2, void *a3, char a4)
{
  if (a4)
  {
    if (a4 != 1)
      return;

    a1 = a3;
  }

}

void (*ComplicationCornerViewConfiguration.label.modify(_QWORD *a1))(void ***a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  ComplicationCornerViewConfiguration.label.getter((uint64_t)v3);
  return sub_213058560;
}

void sub_213058560(void ***a1, char a2)
{
  void **v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  _QWORD v8[3];
  char v9;

  v3 = *a1;
  v4 = **a1;
  v5 = v3[1];
  v6 = v3[2];
  v7 = *((_BYTE *)v3 + 24);
  v8[0] = v4;
  v8[1] = v5;
  v8[2] = v6;
  v9 = v7;
  if ((a2 & 1) != 0)
  {
    sub_2130585E0(v4, v5, v6, v7);
    ComplicationCornerViewConfiguration.label.setter((uint64_t)v8);
    sub_213058488(*v3, v3[1], v3[2], *((_BYTE *)v3 + 24));
  }
  else
  {
    ComplicationCornerViewConfiguration.label.setter((uint64_t)v8);
  }
  free(v3);
}

id sub_2130585E0(id result, void *a2, void *a3, char a4)
{
  id v4;
  id v5;
  id v6;

  v4 = result;
  if (!a4)
    return result;
  if (a4 == 1)
  {
    v5 = a3;
    v6 = v4;
    return a2;
  }
  return result;
}

__n128 ComplicationCornerViewConfiguration.init(contentSize:label:position:fontStyle:monochromeModel:)@<Q0>(__int128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, uint64_t a5@<X8>, double a6@<D0>, double a7@<D1>)
{
  uint64_t v13;
  char v14;
  uint64_t v15;
  char v16;
  id v17;
  __n128 result;
  __n128 v19;
  __int128 v20;
  uint64_t v21;
  char v22;
  __n128 v23;
  uint64_t v24;
  char v25;

  v13 = *((_QWORD *)a1 + 2);
  v14 = *((_BYTE *)a1 + 24);
  v20 = *a1;
  v21 = v13;
  v22 = v14;
  sub_2130582AC((uint64_t)&v20, (uint64_t)&v23);
  v19 = v23;
  v15 = v24;
  v16 = v25;
  v17 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for MonochromeModel()), sel_init);

  *(double *)a5 = a6;
  *(double *)(a5 + 8) = a7;
  *(_QWORD *)(a5 + 16) = MEMORY[0x24BEE4AF8];
  result = v19;
  *(__n128 *)(a5 + 24) = v19;
  *(_QWORD *)(a5 + 40) = v15;
  *(_BYTE *)(a5 + 48) = v16;
  *(_QWORD *)(a5 + 56) = a2;
  *(_QWORD *)(a5 + 64) = a3;
  *(_QWORD *)(a5 + 72) = v17;
  return result;
}

__n128 ComplicationCornerViewConfiguration.init(contentSize:outerLabel:label:position:fontStyle:monochromeModel:)@<Q0>(void *a1@<X0>, __int128 *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X4>, uint64_t a6@<X8>, double a7@<D0>, double a8@<D1>)
{
  __int128 v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  char v21;
  id v22;
  __n128 result;
  __int128 v24;
  __n128 v25;
  __int128 v26;
  uint64_t v27;
  char v28;
  __n128 v29;
  uint64_t v30;
  char v31;

  v15 = *a2;
  v16 = *((_QWORD *)a2 + 2);
  v17 = *((_BYTE *)a2 + 24);
  if (a1)
  {
    v24 = *a2;
    __swift_instantiateConcreteTypeFromMangledName(qword_254B6F058);
    v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = xmmword_21306BC10;
    v19 = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, a1, 0);
    v15 = v24;
    *(_QWORD *)(v18 + 32) = v19;
  }
  else
  {
    v18 = MEMORY[0x24BEE4AF8];
  }
  v26 = v15;
  v27 = v16;
  v28 = v17;
  sub_2130582AC((uint64_t)&v26, (uint64_t)&v29);
  v25 = v29;
  v20 = v30;
  v21 = v31;
  v22 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for MonochromeModel()), sel_init);

  *(double *)a6 = a7;
  *(double *)(a6 + 8) = a8;
  *(_QWORD *)(a6 + 16) = v18;
  result = v25;
  *(__n128 *)(a6 + 24) = v25;
  *(_QWORD *)(a6 + 40) = v20;
  *(_BYTE *)(a6 + 48) = v21;
  *(_QWORD *)(a6 + 56) = a3;
  *(_QWORD *)(a6 + 64) = a4;
  *(_QWORD *)(a6 + 72) = v22;
  return result;
}

uint64_t sub_213058850()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_213058888(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  return ComplicationCornerViewConfiguration.outerLabel.setter(v1);
}

void destroy for ComplicationCornerViewConfiguration(uint64_t a1)
{
  swift_bridgeObjectRelease();
  sub_213055F98(*(void **)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_BYTE *)(a1 + 48));

}

uint64_t initializeWithCopy for ComplicationCornerViewConfiguration(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  void *v8;
  id v9;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v4 = *(void **)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 32);
  v6 = *(_QWORD *)(a2 + 40);
  v7 = *(_BYTE *)(a2 + 48);
  swift_bridgeObjectRetain();
  sub_213055EEC(v4, v5, v6, v7);
  *(_QWORD *)(a1 + 24) = v4;
  *(_QWORD *)(a1 + 32) = v5;
  *(_QWORD *)(a1 + 40) = v6;
  *(_BYTE *)(a1 + 48) = v7;
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  v8 = *(void **)(a2 + 72);
  *(_QWORD *)(a1 + 72) = v8;
  v9 = v8;
  return a1;
}

uint64_t assignWithCopy for ComplicationCornerViewConfiguration(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  void *v12;
  void *v13;
  id v14;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(void **)(a2 + 24);
  v5 = *(_QWORD *)(a2 + 32);
  v6 = *(_QWORD *)(a2 + 40);
  v7 = *(_BYTE *)(a2 + 48);
  sub_213055EEC(v4, v5, v6, v7);
  v8 = *(void **)(a1 + 24);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 24) = v4;
  *(_QWORD *)(a1 + 32) = v5;
  *(_QWORD *)(a1 + 40) = v6;
  v11 = *(_BYTE *)(a1 + 48);
  *(_BYTE *)(a1 + 48) = v7;
  sub_213055F98(v8, v9, v10, v11);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  v12 = *(void **)(a2 + 72);
  v13 = *(void **)(a1 + 72);
  *(_QWORD *)(a1 + 72) = v12;
  v14 = v12;

  return a1;
}

uint64_t assignWithTake for ComplicationCornerViewConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  void *v10;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 40);
  v5 = *(_BYTE *)(a2 + 48);
  v6 = *(void **)(a1 + 24);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = v4;
  v9 = *(_BYTE *)(a1 + 48);
  *(_BYTE *)(a1 + 48) = v5;
  sub_213055F98(v6, v7, v8, v9);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  v10 = *(void **)(a1 + 72);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);

  return a1;
}

uint64_t getEnumTagSinglePayload for ComplicationCornerViewConfiguration(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 80))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ComplicationCornerViewConfiguration(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 80) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 80) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ComplicationCornerViewConfiguration()
{
  return &type metadata for ComplicationCornerViewConfiguration;
}

void *destroy for ComplicationCornerViewConfiguration.InnerContent(uint64_t a1)
{
  return sub_213055F98(*(void **)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_BYTE *)(a1 + 24));
}

uint64_t initializeWithCopy for ComplicationCornerViewConfiguration.InnerContent(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return sub_213058F1C(a1, a2, a3, (void (*)(_QWORD, uint64_t, uint64_t, uint64_t))sub_213055EEC);
}

uint64_t *assignWithCopy for ComplicationCornerViewConfiguration.InnerContent(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_213058F90(a1, a2, a3, (void (*)(_QWORD, uint64_t, uint64_t, uint64_t))sub_213055EEC, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_213055F98);
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t *assignWithTake for ComplicationCornerViewConfiguration.InnerContent(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_213059010(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_213055F98);
}

uint64_t sub_213058BB8(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 24) <= 1u)
    return *(unsigned __int8 *)(a1 + 24);
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t sub_213058BD0(uint64_t result, unsigned int a2)
{
  uint64_t v2;

  v2 = a2 - 2;
  if (a2 >= 2)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    LOBYTE(a2) = 2;
    *(_QWORD *)result = v2;
  }
  *(_BYTE *)(result + 24) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ComplicationCornerViewConfiguration.InnerContent()
{
  return &type metadata for ComplicationCornerViewConfiguration.InnerContent;
}

uint64_t sub_213058BFC(uint64_t a1)
{
  swift_bridgeObjectRelease();
  sub_213055F98(*(void **)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_BYTE *)(a1 + 48));

  return swift_release();
}

uint64_t sub_213058C3C(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  __int128 v9;
  id v10;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v4 = *(void **)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 32);
  v6 = *(_QWORD *)(a2 + 40);
  v7 = *(_BYTE *)(a2 + 48);
  swift_bridgeObjectRetain();
  sub_213055EEC(v4, v5, v6, v7);
  *(_QWORD *)(a1 + 24) = v4;
  *(_QWORD *)(a1 + 32) = v5;
  *(_QWORD *)(a1 + 40) = v6;
  *(_BYTE *)(a1 + 48) = v7;
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  v8 = *(_QWORD *)(a2 + 88);
  v9 = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 72) = v9;
  *(_QWORD *)(a1 + 88) = v8;
  v10 = (id)v9;
  swift_retain();
  return a1;
}

uint64_t sub_213058CD4(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(void **)(a2 + 24);
  v5 = *(_QWORD *)(a2 + 32);
  v6 = *(_QWORD *)(a2 + 40);
  v7 = *(_BYTE *)(a2 + 48);
  sub_213055EEC(v4, v5, v6, v7);
  v8 = *(void **)(a1 + 24);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 24) = v4;
  *(_QWORD *)(a1 + 32) = v5;
  *(_QWORD *)(a1 + 40) = v6;
  v11 = *(_BYTE *)(a1 + 48);
  *(_BYTE *)(a1 + 48) = v7;
  sub_213055F98(v8, v9, v10, v11);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  v12 = *(void **)(a2 + 72);
  v13 = *(void **)(a1 + 72);
  *(_QWORD *)(a1 + 72) = v12;
  v14 = v12;

  v15 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v15;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy96_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __n128 result;
  __int128 v4;
  __int128 v5;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  result = *(__n128 *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v4;
  return result;
}

uint64_t sub_213058DC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 40);
  v5 = *(_BYTE *)(a2 + 48);
  v6 = *(void **)(a1 + 24);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = v4;
  v9 = *(_BYTE *)(a1 + 48);
  *(_BYTE *)(a1 + 48) = v5;
  sub_213055F98(v6, v7, v8, v9);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);

  v10 = *(_QWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 88) = v10;
  swift_release();
  return a1;
}

uint64_t sub_213058E50(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 96))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_213058E98(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 96) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 96) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t type metadata accessor for CornerComplicationView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for CornerComplicationView);
}

void destroy for ComplicationCornerViewConfiguration.Label(uint64_t a1)
{
  sub_213058488(*(void **)a1, *(void **)(a1 + 8), *(void **)(a1 + 16), *(_BYTE *)(a1 + 24));
}

uint64_t initializeWithCopy for ComplicationCornerViewConfiguration.Label(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return sub_213058F1C(a1, a2, a3, (void (*)(_QWORD, uint64_t, uint64_t, uint64_t))sub_2130585E0);
}

uint64_t sub_213058F1C(uint64_t a1, uint64_t *a2, uint64_t a3, void (*a4)(_QWORD, uint64_t, uint64_t, uint64_t))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = *a2;
  v6 = a2[1];
  v7 = a2[2];
  v8 = *((unsigned __int8 *)a2 + 24);
  a4(*a2, v6, v7, v8);
  *(_QWORD *)a1 = v5;
  *(_QWORD *)(a1 + 8) = v6;
  *(_QWORD *)(a1 + 16) = v7;
  *(_BYTE *)(a1 + 24) = v8;
  return a1;
}

uint64_t *assignWithCopy for ComplicationCornerViewConfiguration.Label(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_213058F90(a1, a2, a3, (void (*)(_QWORD, uint64_t, uint64_t, uint64_t))sub_2130585E0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_213058488);
}

uint64_t *sub_213058F90(uint64_t *a1, uint64_t *a2, uint64_t a3, void (*a4)(_QWORD, uint64_t, uint64_t, uint64_t), void (*a5)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v7 = *a2;
  v8 = a2[1];
  v9 = a2[2];
  v10 = *((unsigned __int8 *)a2 + 24);
  a4(*a2, v8, v9, v10);
  v11 = *a1;
  v12 = a1[1];
  v13 = a1[2];
  *a1 = v7;
  a1[1] = v8;
  a1[2] = v9;
  v14 = *((unsigned __int8 *)a1 + 24);
  *((_BYTE *)a1 + 24) = v10;
  a5(v11, v12, v13, v14);
  return a1;
}

uint64_t *assignWithTake for ComplicationCornerViewConfiguration.Label(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_213059010(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_213058488);
}

uint64_t *sub_213059010(uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = *(_QWORD *)(a2 + 16);
  v7 = *(_BYTE *)(a2 + 24);
  v8 = *a1;
  v10 = a1[1];
  v9 = a1[2];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  a1[2] = v6;
  v11 = *((unsigned __int8 *)a1 + 24);
  *((_BYTE *)a1 + 24) = v7;
  a4(v8, v10, v9, v11);
  return a1;
}

uint64_t _s19ComplicationDisplay35ComplicationCornerViewConfigurationV12InnerContentOwet_0(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 25))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 24);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t _s19ComplicationDisplay35ComplicationCornerViewConfigurationV12InnerContentOwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 25) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 25) = 0;
    if (a2)
      *(_BYTE *)(result + 24) = -(char)a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for ComplicationCornerViewConfiguration.Label()
{
  return &type metadata for ComplicationCornerViewConfiguration.Label;
}

uint64_t sub_213059100(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[2];

  v4 = *a1;
  v5 = a1[1];
  v6 = type metadata accessor for ComplicationCornerCircularView(255, *a1, v5, a4);
  v8 = type metadata accessor for ComplicationCornerTextView(255, v4, v5, v7);
  v9 = sub_21306878C();
  v10 = sub_21306878C();
  v12 = type metadata accessor for ComplicationCornerGaugeView(255, v4, v5, v11);
  v13 = sub_21306878C();
  v14 = sub_21306878C();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B6F4F0);
  v15 = sub_2130685C4();
  v16 = sub_2130685C4();
  v17 = MEMORY[0x2199AA6AC](&unk_21306BB88, v6);
  v28[0] = sub_2130569D0();
  v28[1] = MEMORY[0x2199AA6AC](&unk_21306BF88, v8);
  v18 = MEMORY[0x24BDEF3E0];
  v27[0] = v17;
  v27[1] = MEMORY[0x2199AA6AC](MEMORY[0x24BDEF3E0], v9, v28);
  v19 = MEMORY[0x2199AA6AC](v18, v10, v27);
  v26[0] = sub_213056A14();
  v26[1] = MEMORY[0x2199AA6AC](&unk_21306B7E4, v12);
  v25[0] = v19;
  v25[1] = MEMORY[0x2199AA6AC](v18, v13, v26);
  v24[0] = MEMORY[0x2199AA6AC](v18, v14, v25);
  v24[1] = sub_21304B778(qword_254B6F508, &qword_254B6F4F0, MEMORY[0x24BDF0960]);
  v20 = MEMORY[0x24BDED308];
  v23[0] = MEMORY[0x2199AA6AC](MEMORY[0x24BDED308], v15, v24);
  v23[1] = sub_21304F6EC();
  MEMORY[0x2199AA6AC](v20, v16, v23);
  v21 = sub_213068588();
  return MEMORY[0x2199AA6AC](MEMORY[0x24BDEC6F8], v21);
}

uint64_t sub_213059328(unint64_t a1)
{
  unint64_t *v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_213068C6C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_213068C6C();
    swift_bridgeObjectRelease();
    v6 = v5 + v3;
    if (!__OFADD__(v5, v3))
      goto LABEL_5;
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
    goto LABEL_23;
LABEL_5:
  v4 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v1 = v4;
  v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_15;
    v5 = 1;
  }
  if (v4 >> 62)
    goto LABEL_25;
  v9 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6)
      v9 = v6;
    swift_bridgeObjectRetain();
    v4 = MEMORY[0x2199A9D94](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = sub_213059610(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v9 = sub_213068C6C();
    swift_bridgeObjectRelease();
  }
  if (v11 < 1)
    goto LABEL_19;
  v12 = *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v13 = __OFADD__(v12, v11);
  v14 = v12 + v11;
  if (!v13)
  {
    *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
LABEL_19:
    swift_bridgeObjectRelease();
    return sub_213068B94();
  }
  __break(1u);
  return result;
}

unint64_t sub_2130594E0()
{
  unint64_t result;

  result = qword_254B6F590;
  if (!qword_254B6F590)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254B6F590);
  }
  return result;
}

void (*sub_21305951C(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_21305959C(v6, a2, a3);
  return sub_213059570;
}

void sub_213059570(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_21305959C(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x2199A9D88](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(_QWORD *)v3 = v4;
    return sub_213059608;
  }
  __break(1u);
  return result;
}

void sub_213059608(id *a1)
{

}

uint64_t sub_213059610(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t i;
  void (*v10)(_QWORD *);
  id *v11;
  id v12;
  void (*v13[4])(id *);

  v5 = result;
  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_213068C6C();
    result = swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      v8 = sub_213068C6C();
      result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_21304B778(&qword_254B6F5A8, &qword_254B6F5A0, MEMORY[0x24BEE12E0]);
          swift_bridgeObjectRetain();
          for (i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F5A0);
            v10 = sub_21305951C(v13, i, a3);
            v12 = *v11;
            ((void (*)(void (**)(id *), _QWORD))v10)(v13, 0);
            *(_QWORD *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        sub_2130594E0();
        swift_arrayInitWithCopy();
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

unint64_t sub_2130597B8()
{
  unint64_t result;

  result = qword_254B6F5B0;
  if (!qword_254B6F5B0)
  {
    result = MEMORY[0x2199AA6AC](MEMORY[0x24BDF1B90], MEMORY[0x24BDF1BB0]);
    atomic_store(result, (unint64_t *)&qword_254B6F5B0);
  }
  return result;
}

uint64_t sub_2130597FC(uint64_t a1)
{
  sub_21304F400(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_BYTE *)(a1 + 32));
  return a1;
}

uint64_t sub_213059830(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, char a12)
{
  if ((a12 & 1) != 0)
    return sub_2130598EC(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11 & 1);
  else
    return sub_213059864(a1, a2, a3, a4, a5, (uint64_t)a6, a7, a8, a9, (unsigned __int16)(a9 & 0x1FF) >> 8);
}

uint64_t sub_213059864(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, char a10)
{
  if ((a10 & 1) != 0)
    return sub_213059884(a1, a2, a3, a4, a5, a6, a7, a8, a9 & 1);
  else
    return swift_release();
}

uint64_t sub_213059884(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if ((a9 & 1) != 0)
  {

    swift_bridgeObjectRelease();
    return swift_release();
  }
  else
  {

    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_2130598EC(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  if ((a11 & 1) != 0)
  {

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_release();
  }
  else
  {

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_213059980(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 16);
  v3 = *(void **)(a1 + 32);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2130599D8(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return a1;
}

uint64_t sub_213059A30(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_213059A58(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  swift_release();
  swift_bridgeObjectRelease();

  return a1;
}

id ComplicationLabelProvider.textProvider.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_textProvider);
}

ComplicationDisplay::ComplicationLabelProvider __swiftcall ComplicationLabelProvider.init(textProvider:imageProvider:)(CLKTextProvider_optional textProvider, CLKImageProvider_optional *imageProvider)
{
  _QWORD *v2;
  void *v3;
  Class isa;
  _QWORD *v5;
  id v6;
  objc_class *v7;
  CLKTextProvider *v8;
  CLKImageProvider *v9;
  ComplicationDisplay::ComplicationLabelProvider result;

  v3 = *(void **)&textProvider.is_nil;
  isa = textProvider.value.super.isa;
  v5 = v2;
  v6 = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, textProvider.value.super.isa, *(_QWORD *)&textProvider.is_nil);

  *v5 = v6;
  result._labelProvider._imageProvider = v9;
  result._labelProvider._textProvider = v8;
  result._labelProvider.super.isa = v7;
  return result;
}

id Sequence<>.fallbackTextProvider.getter()
{
  unint64_t v0;
  void *v1;
  id v2;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F5A0);
  sub_213059F84();
  v0 = sub_213068B70();
  if (v0 >> 62)
  {
    if (sub_213068C6C())
      goto LABEL_3;
LABEL_5:
    swift_bridgeObjectRelease();
    return 0;
  }
  if (!*(_QWORD *)((v0 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_5;
LABEL_3:
  sub_2130594E0();
  v1 = (void *)sub_213068B7C();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend((id)objc_opt_self(), sel_providerWithProviders_, v1);

  return v2;
}

id ComplicationLabelProvider.imageProvider.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_imageProvider);
}

uint64_t ComplicationLabelProvider.snapshotMetadata.getter()
{
  id *v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v19[2];

  v19[1] = *(id *)MEMORY[0x24BDAC8D0];
  v1 = *v0;
  v2 = objc_msgSend(*v0, sel_imageProvider);
  if (v2)
  {
    v3 = v2;
    type metadata accessor for WidgetNamedImageProvider(0);
    if (swift_dynamicCastClass())
    {
      v4 = sub_213063DD8();
      if (v4)
      {
        v5 = (void *)v4;
        v6 = objc_msgSend((id)objc_opt_self(), sel_imageProviderWithOnePieceImage_, v4);

      }
      else
      {
        v6 = 0;
      }
      v12 = objc_msgSend(v1, sel_textProvider);
      v13 = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, v12, v6);

      v19[0] = 0;
      v14 = objc_msgSend((id)objc_opt_self(), sel_archivedDataWithRootObject_requiringSecureCoding_error_, v13, 1, v19);
      v15 = v19[0];
      if (v14)
      {
        v9 = sub_213068414();

        return v9;
      }
      v16 = v15;
      v17 = (void *)sub_2130683E4();

      swift_willThrow();
      return 0;
    }

  }
  v19[0] = 0;
  v7 = objc_msgSend((id)objc_opt_self(), sel_archivedDataWithRootObject_requiringSecureCoding_error_, v1, 1, v19);
  v8 = v19[0];
  if (!v7)
  {
    v10 = v8;
    v11 = (void *)sub_2130683E4();

    swift_willThrow();
    return 0;
  }
  v9 = sub_213068414();

  return v9;
}

void sub_213059E7C(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = objc_msgSend(*a1, sel_textProvider);
  if (v3)
  {
    v4 = v3;
    objc_opt_self();
    v5 = swift_dynamicCastObjCClass();
    if (v5)
    {
      v6 = (void *)v5;
      v7 = v4;
      v8 = objc_msgSend(v6, sel_textProviders);
      sub_2130594E0();
      v9 = sub_213068B88();

    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F598);
      v10 = swift_allocObject();
      *(_OWORD *)(v10 + 16) = xmmword_21306C740;
      *(_QWORD *)(v10 + 32) = v4;
      v11 = v10;
      sub_213068B94();
      v9 = v11;
    }
  }
  else
  {
    v9 = MEMORY[0x24BEE4AF8];
  }
  *a2 = v9;
}

unint64_t sub_213059F84()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254B6F5B8;
  if (!qword_254B6F5B8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B6F5A0);
    result = MEMORY[0x2199AA6AC](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_254B6F5B8);
  }
  return result;
}

ValueMetadata *type metadata accessor for ComplicationLabelProvider()
{
  return &type metadata for ComplicationLabelProvider;
}

uint64_t sub_213059FE0(uint64_t a1)
{
  uint64_t v2;
  void **v3;
  void *v4;
  id v5;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 + 16);
  v7 = MEMORY[0x24BEE4AF8];
  sub_213068C3C();
  if (v2)
  {
    v3 = (void **)(a1 + 32);
    swift_bridgeObjectRetain();
    do
    {
      v4 = *v3++;
      v5 = v4;
      sub_213068C24();
      sub_213068C48();
      sub_213068C54();
      sub_213068C30();
      --v2;
    }
    while (v2);
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return v7;
}

void sub_21305A0AC(_QWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t KeyPath;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B6EED8);
  MEMORY[0x24BDAC7A8](v24);
  v4 = (uint64_t *)((char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = sub_2130685B8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v1;
  v10 = (void *)v1[2];
  v22 = v1[1];
  v23 = v9;
  v11 = v1[3];
  v12 = v1[4];
  type metadata accessor for MonochromeModel();
  sub_2130517F8();
  v13 = v10;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v14 = sub_2130685AC();
  v16 = v15;
  KeyPath = swift_getKeyPath();
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x24BDED100], v5);
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))((char *)v4 + *(int *)(v24 + 28), v8, v5);
  *v4 = KeyPath;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F5E8);
  sub_213052B20((uint64_t)v4, (uint64_t)a1 + *(int *)(v18 + 36));
  v19 = v22;
  *a1 = v23;
  a1[1] = v19;
  a1[2] = v14;
  a1[3] = v16;
  a1[4] = v11;
  a1[5] = v12;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v20 = v16;
  sub_213052B68((uint64_t)v4);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

id sub_21305A27C(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  double v10;
  __int128 v11;

  v11 = *(_OWORD *)(v1 + 16);
  objc_msgSend(a1, sel_setFilterProvider_, *((_QWORD *)&v11 + 1));
  objc_msgSend(a1, sel_setCornerComplicationPosition_, *(_QWORD *)v1);
  objc_msgSend(a1, sel_setFontStyle_, *(_QWORD *)(v1 + 8));
  v3 = swift_bridgeObjectRetain();
  sub_213059FE0(v3);
  swift_bridgeObjectRelease();
  sub_2130520D8(0, &qword_254B6F290);
  v4 = (void *)sub_213068B7C();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_setOuterLabelProviders_, v4);

  v5 = swift_bridgeObjectRetain();
  sub_213059FE0(v5);
  swift_bridgeObjectRelease();
  v6 = (void *)sub_213068B7C();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_setInnerLabelProviders_, v6);

  objc_msgSend(a1, sel_setNeedsLayout);
  objc_msgSend(a1, sel_layoutIfNeeded);
  swift_getKeyPath();
  swift_getKeyPath();
  v7 = *((id *)&v11 + 1);
  sub_2130684A4();
  swift_release();
  swift_release();
  sub_21304C524((uint64_t)&v11);
  if (v10 >= 1.0)
    return objc_msgSend(a1, sel_updateMonochromeColor, v10);
  swift_getKeyPath();
  swift_getKeyPath();
  v8 = v7;
  sub_2130684A4();
  swift_release();
  swift_release();
  sub_21304C524((uint64_t)&v11);
  return objc_msgSend(a1, sel_transitionToMonochromeWithFraction_, v10);
}

uint64_t sub_21305A4B0()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  _QWORD v8[6];

  v1 = (void *)objc_opt_self();
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = v0;
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = sub_21305A850;
  *(_QWORD *)(v3 + 24) = v2;
  v8[4] = sub_21304B8B0;
  v8[5] = v3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 1107296256;
  v8[2] = sub_213061058;
  v8[3] = &block_descriptor_2;
  v4 = _Block_copy(v8);
  v5 = v0;
  swift_retain();
  swift_release();
  objc_msgSend(v1, sel_performWithoutAnimation_, v4);
  _Block_release(v4);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
    __break(1u);
  return result;
}

id sub_21305A65C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ComplicationCornerStackedTextViewRepresentable._CornerView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ComplicationCornerStackedTextViewRepresentable._CornerView()
{
  return objc_opt_self();
}

uint64_t destroy for ComplicationCornerStackedTextView(uint64_t a1)
{

  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ComplicationCornerStackedTextView(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(void **)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 24) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  v5 = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for ComplicationCornerStackedTextView(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;

  *a1 = *a2;
  a1[1] = a2[1];
  v4 = (void *)a2[2];
  v5 = (void *)a1[2];
  a1[2] = v4;
  v6 = v4;

  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for ComplicationCornerStackedTextView(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;

  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for ComplicationCornerStackedTextView()
{
  return &type metadata for ComplicationCornerStackedTextView;
}

uint64_t sub_21305A814()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21305A82C()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_21305A850()
{
  uint64_t v0;
  objc_super v2;

  v2.receiver = *(id *)(v0 + 16);
  v2.super_class = (Class)type metadata accessor for ComplicationCornerStackedTextViewRepresentable._CornerView();
  return objc_msgSendSuper2(&v2, sel_layoutSubviews);
}

uint64_t sub_21305A88C()
{
  return swift_deallocObject();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

id sub_21305A8B4()
{
  _QWORD *v0;
  id v1;

  v1 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ComplicationCornerStackedTextViewRepresentable._CornerView()), sel_initWithFontFallback_, 1, *v0, v0[1], v0[2], v0[3], v0[4], v0[5]);
  sub_21305A27C(v1);
  return v1;
}

uint64_t sub_21305A910()
{
  sub_21305B1E4();
  return sub_21306875C();
}

uint64_t sub_21305A960()
{
  sub_21305B1E4();
  return sub_213068708();
}

void sub_21305A9B0()
{
  sub_21305B1E4();
  sub_213068750();
  __break(1u);
}

void sub_21305A9D4(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X8>)
{
  void *v9;
  id v10;
  id v11;
  double v12;
  double v13;
  uint64_t v14;
  int64_t v15;
  double v16;
  double v17;
  uint64_t i;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  double *v25;
  id v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  double v30;
  double v31;
  int64_t v32;
  double v33;
  double v34;
  id *v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  double *v42;
  id v43;
  unint64_t v44;
  unint64_t v45;
  id v46;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;

  v9 = (void *)objc_opt_self();
  v46 = a3;
  v10 = objc_msgSend(v9, sel_sharedRenderingContext);
  v11 = objc_msgSend(v10, sel_device);

  v12 = CDRichComplicationCornerTextOuterImageMaxSize(v11);
  v14 = MEMORY[0x24BEE4AF8];
  v15 = *(_QWORD *)(a4 + 16);
  v50 = v11;
  if (v15)
  {
    v16 = v12;
    v17 = v13;
    v52 = MEMORY[0x24BEE4AF8];
    sub_21304E408(0, v15, 0);
    for (i = 0; i != v15; ++i)
    {
      v19 = *(id *)(a4 + 8 * i + 32);
      v20 = objc_msgSend(v19, sel_textProvider);
      objc_msgSend(v20, sel_finalize);
      v21 = objc_msgSend(v19, sel_imageProvider);
      v22 = v21;
      if (v21)
      {
        objc_msgSend(v21, sel_copy);

        sub_213068BF4();
        swift_unknownObjectRelease();
        sub_2130520D8(0, (unint64_t *)&qword_254B6EF18);
        if ((swift_dynamicCast() & 1) != 0)
        {
          v22 = v51;
          type metadata accessor for WidgetNamedImageProvider(0);
          v23 = swift_dynamicCastClass();
          if (v23)
          {
            v24 = OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_finalized;
            if ((*(_BYTE *)(v23 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_finalized) & 1) == 0)
            {
              v25 = (double *)(v23 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider__maxSize);
              *v25 = v16;
              v25[1] = v17;
              *(_BYTE *)(v23 + v24) = 1;
            }
          }
          else
          {
            objc_msgSend(v51, sel_finalizeWithMaxSDKSize_maxDeviceSize_maskToCircle_, 0, v16, v17, v16, v17);
          }
        }
        else
        {
          v22 = 0;
        }
      }
      v26 = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, v20, v22);

      v27 = v52;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_21304E408(0, *(_QWORD *)(v52 + 16) + 1, 1);
        v27 = v52;
      }
      v29 = *(_QWORD *)(v27 + 16);
      v28 = *(_QWORD *)(v27 + 24);
      if (v29 >= v28 >> 1)
      {
        sub_21304E408((char *)(v28 > 1), v29 + 1, 1);
        v27 = v52;
      }
      *(_QWORD *)(v27 + 16) = v29 + 1;
      *(_QWORD *)(v27 + 8 * v29 + 32) = v26;
    }
    swift_bridgeObjectRelease();
    v11 = v50;
    v14 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    swift_bridgeObjectRelease();
    v27 = MEMORY[0x24BEE4AF8];
  }
  v30 = CDRichComplicationCornerInnerImageMaxSize(v11);
  v32 = *(_QWORD *)(a5 + 16);
  if (v32)
  {
    v33 = v30;
    v34 = v31;
    v53 = v14;
    sub_21304E408(0, v32, 0);
    v35 = (id *)(a5 + 32);
    do
    {
      v36 = *v35;
      v37 = objc_msgSend(v36, sel_textProvider);
      objc_msgSend(v37, sel_finalize);
      v38 = objc_msgSend(v36, sel_imageProvider);
      v39 = v38;
      if (v38)
      {
        objc_msgSend(v38, sel_copy);

        sub_213068BF4();
        swift_unknownObjectRelease();
        sub_2130520D8(0, (unint64_t *)&qword_254B6EF18);
        if ((swift_dynamicCast() & 1) != 0)
        {
          v39 = v51;
          type metadata accessor for WidgetNamedImageProvider(0);
          v40 = swift_dynamicCastClass();
          if (v40)
          {
            v41 = OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_finalized;
            if ((*(_BYTE *)(v40 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_finalized) & 1) == 0)
            {
              v42 = (double *)(v40 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider__maxSize);
              *v42 = v33;
              v42[1] = v34;
              *(_BYTE *)(v40 + v41) = 1;
            }
          }
          else
          {
            objc_msgSend(v51, sel_finalizeWithMaxSDKSize_maxDeviceSize_maskToCircle_, 0, v33, v34, v33, v34);
          }
        }
        else
        {
          v39 = 0;
        }
      }
      v43 = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, v37, v39);

      v14 = v53;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_21304E408(0, *(_QWORD *)(v53 + 16) + 1, 1);
        v14 = v53;
      }
      v45 = *(_QWORD *)(v14 + 16);
      v44 = *(_QWORD *)(v14 + 24);
      if (v45 >= v44 >> 1)
      {
        sub_21304E408((char *)(v44 > 1), v45 + 1, 1);
        v14 = v53;
      }
      *(_QWORD *)(v14 + 16) = v45 + 1;
      *(_QWORD *)(v14 + 8 * v45 + 32) = v43;
      ++v35;
      --v32;
    }
    while (v32);

  }
  else
  {

  }
  *a6 = a1;
  a6[1] = a2;
  a6[2] = v46;
  a6[3] = v27;
  a6[4] = v14;
}

uint64_t destroy for ComplicationCornerStackedTextViewRepresentable(uint64_t a1)
{

  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ComplicationCornerStackedTextViewRepresentable(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(void **)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v3;
  v4 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v4;
  v5 = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for ComplicationCornerStackedTextViewRepresentable(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;

  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  v4 = (void *)a2[3];
  v5 = (void *)a1[3];
  a1[3] = v4;
  v6 = v4;

  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for ComplicationCornerStackedTextViewRepresentable(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);

  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ComplicationCornerStackedTextViewRepresentable(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ComplicationCornerStackedTextViewRepresentable(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 48) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ComplicationCornerStackedTextViewRepresentable()
{
  return &type metadata for ComplicationCornerStackedTextViewRepresentable;
}

unint64_t sub_21305B128()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254B6F5F0;
  if (!qword_254B6F5F0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B6F5E8);
    v2[0] = sub_21305B194();
    v2[1] = sub_2130537E4();
    result = MEMORY[0x2199AA6AC](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254B6F5F0);
  }
  return result;
}

unint64_t sub_21305B194()
{
  unint64_t result;

  result = qword_254B6F5F8;
  if (!qword_254B6F5F8)
  {
    result = MEMORY[0x2199AA6AC](&unk_21306C9E0, &type metadata for ComplicationCornerStackedTextViewRepresentable);
    atomic_store(result, (unint64_t *)&qword_254B6F5F8);
  }
  return result;
}

unint64_t sub_21305B1E4()
{
  unint64_t result;

  result = qword_254B6F600;
  if (!qword_254B6F600)
  {
    result = MEMORY[0x2199AA6AC](&unk_21306CA30, &type metadata for ComplicationCornerStackedTextViewRepresentable);
    atomic_store(result, (unint64_t *)&qword_254B6F600);
  }
  return result;
}

float ComplicationCurvedTextConfiguration.fontSize.getter()
{
  uint64_t v0;

  return *(float *)v0;
}

void ComplicationCurvedTextConfiguration.fontSize.setter(float a1)
{
  float *v1;

  *v1 = a1;
}

uint64_t (*ComplicationCurvedTextConfiguration.fontSize.modify())()
{
  return nullsub_1;
}

uint64_t ComplicationCurvedTextConfiguration.color.getter()
{
  return swift_retain();
}

uint64_t ComplicationCurvedTextConfiguration.color.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_release();
  *(_QWORD *)(v1 + 8) = a1;
  return result;
}

uint64_t (*ComplicationCurvedTextConfiguration.color.modify())()
{
  return nullsub_1;
}

uint64_t ComplicationCurvedTextConfiguration.interior.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t ComplicationCurvedTextConfiguration.interior.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 16) = result;
  return result;
}

uint64_t (*ComplicationCurvedTextConfiguration.interior.modify())()
{
  return nullsub_1;
}

float ComplicationCurvedTextConfiguration.tracking.getter()
{
  uint64_t v0;

  return *(float *)(v0 + 20);
}

void ComplicationCurvedTextConfiguration.tracking.setter(float a1)
{
  uint64_t v1;

  *(float *)(v1 + 20) = a1;
}

uint64_t (*ComplicationCurvedTextConfiguration.tracking.modify())()
{
  return nullsub_1;
}

double ComplicationCurvedTextConfiguration.circleCenter.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 24);
}

void ComplicationCurvedTextConfiguration.circleCenter.setter(double a1, double a2)
{
  uint64_t v2;

  *(double *)(v2 + 24) = a1;
  *(double *)(v2 + 32) = a2;
}

uint64_t (*ComplicationCurvedTextConfiguration.circleCenter.modify())()
{
  return nullsub_1;
}

float ComplicationCurvedTextConfiguration.circleRadius.getter()
{
  uint64_t v0;

  return *(float *)(v0 + 40);
}

void ComplicationCurvedTextConfiguration.circleRadius.setter(float a1)
{
  uint64_t v1;

  *(float *)(v1 + 40) = a1;
}

uint64_t (*ComplicationCurvedTextConfiguration.circleRadius.modify())()
{
  return nullsub_1;
}

float ComplicationCurvedTextConfiguration.maximumAngularWidth.getter()
{
  uint64_t v0;

  return *(float *)(v0 + 44);
}

void ComplicationCurvedTextConfiguration.maximumAngularWidth.setter(float a1)
{
  uint64_t v1;

  *(float *)(v1 + 44) = a1;
}

uint64_t (*ComplicationCurvedTextConfiguration.maximumAngularWidth.modify())()
{
  return nullsub_1;
}

float ComplicationCurvedTextConfiguration.centerAngle.getter()
{
  uint64_t v0;

  return *(float *)(v0 + 48);
}

void ComplicationCurvedTextConfiguration.centerAngle.setter(float a1)
{
  uint64_t v1;

  *(float *)(v1 + 48) = a1;
}

uint64_t (*ComplicationCurvedTextConfiguration.centerAngle.modify())()
{
  return nullsub_1;
}

void ComplicationCurvedTextConfiguration.textAlignment.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 52);
}

_BYTE *ComplicationCurvedTextConfiguration.textAlignment.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 52) = *result;
  return result;
}

uint64_t (*ComplicationCurvedTextConfiguration.textAlignment.modify())()
{
  return nullsub_1;
}

float ComplicationCurvedTextConfiguration.baselineOffset.getter()
{
  uint64_t v0;

  return *(float *)(v0 + 56);
}

void ComplicationCurvedTextConfiguration.baselineOffset.setter(float a1)
{
  uint64_t v1;

  *(float *)(v1 + 56) = a1;
}

uint64_t (*ComplicationCurvedTextConfiguration.baselineOffset.modify())()
{
  return nullsub_1;
}

void *ComplicationCurvedTextConfiguration.path.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 64);
  v2 = v1;
  return v1;
}

void ComplicationCurvedTextConfiguration.path.setter(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 64) = a1;
}

uint64_t (*ComplicationCurvedTextConfiguration.path.modify())()
{
  return nullsub_1;
}

void ComplicationCurvedTextConfiguration.accessoryContentPlacement.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 72);
}

_BYTE *ComplicationCurvedTextConfiguration.accessoryContentPlacement.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 72) = *result;
  return result;
}

uint64_t (*ComplicationCurvedTextConfiguration.accessoryContentPlacement.modify())()
{
  return nullsub_1;
}

float ComplicationCurvedTextConfiguration.accessoryContentPadding.getter()
{
  uint64_t v0;

  return *(float *)(v0 + 76);
}

void ComplicationCurvedTextConfiguration.accessoryContentPadding.setter(float a1)
{
  uint64_t v1;

  *(float *)(v1 + 76) = a1;
}

uint64_t (*ComplicationCurvedTextConfiguration.accessoryContentPadding.modify())()
{
  return nullsub_1;
}

double ComplicationCurvedTextConfiguration.accessoryContentMaxSize.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 80);
}

void ComplicationCurvedTextConfiguration.accessoryContentMaxSize.setter(double a1, double a2)
{
  uint64_t v2;

  *(double *)(v2 + 80) = a1;
  *(double *)(v2 + 88) = a2;
}

uint64_t (*ComplicationCurvedTextConfiguration.accessoryContentMaxSize.modify())()
{
  return nullsub_1;
}

BOOL static ComplicationCurvedTextConfiguration.CurvedTextAlignment.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t ComplicationCurvedTextConfiguration.CurvedTextAlignment.hash(into:)()
{
  return sub_213068CA8();
}

uint64_t _s19ComplicationDisplay0A23CurvedTextConfigurationV16ContentPlacementO9hashValueSivg_0()
{
  sub_213068C9C();
  sub_213068CA8();
  return sub_213068CB4();
}

BOOL sub_21305B4E4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_21305B4F8()
{
  return sub_213068CA8();
}

uint64_t sub_21305B520()
{
  sub_213068C9C();
  sub_213068CA8();
  return sub_213068CB4();
}

uint64_t ComplicationCurvedTextConfiguration.init(fontSize:color:interior:tracking:circleCenter:circleRadius:maximumAngularWidth:centerAngle:accessoryContentPlacement:accessoryContentPadding:accessoryContentMaxSize:)@<X0>(uint64_t result@<X0>, char a2@<W1>, char *a3@<X2>, uint64_t a4@<X8>, float a5@<S0>, float a6@<S1>, double a7@<D2>, double a8@<D3>, float a9@<S4>, float a10@<S5>, float a11@<S6>, float a12@<S7>, uint64_t a13, uint64_t a14)
{
  char v14;

  v14 = *a3;
  *(float *)a4 = a5;
  *(_QWORD *)(a4 + 8) = result;
  *(_BYTE *)(a4 + 16) = a2;
  *(float *)(a4 + 20) = a6;
  *(double *)(a4 + 24) = a7;
  *(double *)(a4 + 32) = a8;
  *(float *)(a4 + 40) = a9;
  *(float *)(a4 + 44) = a10;
  *(float *)(a4 + 48) = a11;
  *(_BYTE *)(a4 + 52) = 0;
  *(_DWORD *)(a4 + 56) = 0;
  *(_QWORD *)(a4 + 64) = 0;
  *(_BYTE *)(a4 + 72) = v14;
  *(float *)(a4 + 76) = a12;
  *(_QWORD *)(a4 + 80) = a13;
  *(_QWORD *)(a4 + 88) = a14;
  return result;
}

__n128 ComplicationCurvedTextConfiguration.init(fontSize:color:path:accessoryContentPlacement:accessoryContentPadding:accessoryContentMaxSize:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>, float a5@<S0>, float a6@<S1>, double a7@<D2>, double a8@<D3>)
{
  char v8;
  __n128 result;

  v8 = *a3;
  *(float *)a4 = a5;
  *(_QWORD *)(a4 + 8) = a1;
  *(_BYTE *)(a4 + 16) = 0;
  *(_DWORD *)(a4 + 20) = 0;
  result = *(__n128 *)MEMORY[0x24BDBEFB0];
  *(_OWORD *)(a4 + 24) = *MEMORY[0x24BDBEFB0];
  *(_QWORD *)(a4 + 40) = 0;
  *(_QWORD *)(a4 + 45) = 0;
  *(_DWORD *)(a4 + 56) = 0;
  *(_QWORD *)(a4 + 64) = a2;
  *(_BYTE *)(a4 + 72) = v8;
  *(float *)(a4 + 76) = a6;
  *(double *)(a4 + 80) = a7;
  *(double *)(a4 + 88) = a8;
  return result;
}

__n128 ComplicationCurvedTextConfiguration.init(fontSize:color:tracking:textAlignment:baselineOffset:path:accessoryContentPlacement:accessoryContentPadding:accessoryContentMaxSize:)@<Q0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, char *a4@<X3>, uint64_t a5@<X8>, float a6@<S0>, float a7@<S1>, float a8@<S2>, float a9@<S3>, double a10@<D4>, double a11@<D5>)
{
  char v11;
  char v12;
  __n128 result;

  v11 = *a2;
  v12 = *a4;
  *(float *)a5 = a6;
  *(_QWORD *)(a5 + 8) = a1;
  *(_BYTE *)(a5 + 16) = 0;
  *(float *)(a5 + 20) = a7;
  result = *(__n128 *)MEMORY[0x24BDBEFB0];
  *(_OWORD *)(a5 + 24) = *MEMORY[0x24BDBEFB0];
  *(_QWORD *)(a5 + 40) = 0;
  *(_DWORD *)(a5 + 48) = 0;
  *(_BYTE *)(a5 + 52) = v11;
  *(float *)(a5 + 56) = a8;
  *(_QWORD *)(a5 + 64) = a3;
  *(_BYTE *)(a5 + 72) = v12;
  *(float *)(a5 + 76) = a9;
  *(double *)(a5 + 80) = a10;
  *(double *)(a5 + 88) = a11;
  return result;
}

unint64_t sub_21305B634()
{
  unint64_t result;

  result = qword_254B6F608;
  if (!qword_254B6F608)
  {
    result = MEMORY[0x2199AA6AC](&protocol conformance descriptor for ComplicationCurvedTextConfiguration.ContentPlacement, &type metadata for ComplicationCurvedTextConfiguration.ContentPlacement);
    atomic_store(result, (unint64_t *)&qword_254B6F608);
  }
  return result;
}

unint64_t sub_21305B67C()
{
  unint64_t result;

  result = qword_254B6F610;
  if (!qword_254B6F610)
  {
    result = MEMORY[0x2199AA6AC](&protocol conformance descriptor for ComplicationCurvedTextConfiguration.CurvedTextAlignment, &type metadata for ComplicationCurvedTextConfiguration.CurvedTextAlignment);
    atomic_store(result, (unint64_t *)&qword_254B6F610);
  }
  return result;
}

void destroy for ComplicationCurvedTextConfiguration(uint64_t a1)
{
  swift_release();

}

uint64_t initializeWithCopy for ComplicationCurvedTextConfiguration(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 52) = *(_BYTE *)(a2 + 52);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  v3 = *(void **)(a2 + 64);
  *(_QWORD *)(a1 + 64) = v3;
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_DWORD *)(a1 + 76) = *(_DWORD *)(a2 + 76);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  swift_retain();
  v4 = v3;
  return a1;
}

uint64_t assignWithCopy for ComplicationCurvedTextConfiguration(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(_DWORD *)(a1 + 44) = *(_DWORD *)(a2 + 44);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 52) = *(_BYTE *)(a2 + 52);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  v4 = *(void **)(a1 + 64);
  v5 = *(void **)(a2 + 64);
  *(_QWORD *)(a1 + 64) = v5;
  v6 = v5;

  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_DWORD *)(a1 + 76) = *(_DWORD *)(a2 + 76);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  return a1;
}

uint64_t assignWithTake for ComplicationCurvedTextConfiguration(uint64_t a1, uint64_t a2)
{
  void *v4;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 52) = *(_BYTE *)(a2 + 52);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  v4 = *(void **)(a1 + 64);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);

  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_DWORD *)(a1 + 76) = *(_DWORD *)(a2 + 76);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  return a1;
}

uint64_t getEnumTagSinglePayload for ComplicationCurvedTextConfiguration(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 96))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ComplicationCurvedTextConfiguration(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 96) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 96) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ComplicationCurvedTextConfiguration()
{
  return &type metadata for ComplicationCurvedTextConfiguration;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for ComplicationCurvedTextConfiguration.ContentPlacement()
{
  return &type metadata for ComplicationCurvedTextConfiguration.ContentPlacement;
}

uint64_t _s19ComplicationDisplay35ComplicationCurvedTextConfigurationV19CurvedTextAlignmentOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
  if (a2 + 2 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 2) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s19ComplicationDisplay35ComplicationCurvedTextConfigurationV19CurvedTextAlignmentOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_21305BA8C + 4 * byte_21306CB15[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_21305BAC0 + 4 * byte_21306CB10[v4]))();
}

uint64_t sub_21305BAC0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21305BAC8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21305BAD0);
  return result;
}

uint64_t sub_21305BADC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21305BAE4);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_21305BAE8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21305BAF0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21305BAFC(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_21305BB04(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ComplicationCurvedTextConfiguration.CurvedTextAlignment()
{
  return &type metadata for ComplicationCurvedTextConfiguration.CurvedTextAlignment;
}

uint64_t sub_21305BB7C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_filterProvider;
  swift_beginAccess();
  return MEMORY[0x2199AA76C](v1);
}

uint64_t sub_21305BC14()
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*sub_21305BC6C(_QWORD *a1))(void **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_filterProvider;
  v3[4] = v1;
  v3[5] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x2199AA76C](v5);
  return sub_21305BCDC;
}

void sub_21305BCDC(void **a1, char a2)
{
  void *v3;

  v3 = *a1;
  swift_unknownObjectWeakAssign();
  if ((a2 & 1) != 0)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

id _ComplicationHosting.view.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_view);
}

uint64_t _ComplicationHosting.rendersAsynchronously.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_rendersAsynchronously);
}

uint64_t sub_21305BE38()
{
  return sub_21305CA7C(&OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_renderStatsHandler, (void (*)(_QWORD, _QWORD))sub_21305BE4C);
}

uint64_t sub_21305BE4C(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_21305BE5C(uint64_t a1, double a2, double a3)
{
  void (*v5)(uint64_t, double, double);
  uint64_t v6;

  v5 = *(void (**)(uint64_t, double, double))(a1 + 32);
  v6 = swift_retain();
  v5(v6, a2, a3);
  return swift_release();
}

uint64_t sub_21305BF34(uint64_t a1, uint64_t a2)
{
  return sub_21305CB80(a1, a2, &OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_renderStatsHandler, (uint64_t (*)(uint64_t, uint64_t))sub_21305BF48);
}

uint64_t sub_21305BF48(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_21305BF58@<X0>(_QWORD *a1@<X0>, uint64_t (**a2)(double *a1, double *a2)@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(double *, double *);

  v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_renderStatsHandler);
  swift_beginAccess();
  v4 = *v3;
  v5 = v3[1];
  if (v4)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = sub_21305E3DC;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  *a2 = v7;
  a2[1] = (uint64_t (*)(double *, double *))v6;
  return sub_21305BE4C(v4);
}

uint64_t sub_21305BFEC(uint64_t *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(double, double);
  uint64_t *v7;
  uint64_t v8;

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_21305E3A8;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = (uint64_t *)(*a2 + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_renderStatsHandler);
  swift_beginAccess();
  v8 = *v7;
  *v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_21305BE4C(v3);
  return sub_21305BF48(v8);
}

uint64_t (*sub_21305C0A4())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_21305C12C()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0
                         + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_shouldCallRenderStatsHandlerOnMainQueue);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_21305C1B8(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_shouldCallRenderStatsHandlerOnMainQueue);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_21305C200())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_21305C288()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_shouldAccentDesaturatedView);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_21305C314(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_shouldAccentDesaturatedView);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_21305C35C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

char *sub_21305C3C0()
{
  return sub_21305C3D8(1);
}

char *sub_21305C3D0()
{
  return sub_21305C3D8(0);
}

char *sub_21305C3D8(char a1)
{
  id v2;

  v2 = objc_allocWithZone((Class)type metadata accessor for _ComplicationHosting());
  return _s19ComplicationDisplay01_A7HostingC5frame5asyncACSo6CGRectV_Sbtcfc_0(a1);
}

char *sub_21305C410(uint64_t a1, uint64_t a2, char a3)
{
  id v4;

  v4 = objc_allocWithZone((Class)type metadata accessor for _ComplicationHosting());
  return _s19ComplicationDisplay01_A7HostingC5frame5asyncACSo6CGRectV_Sbtcfc_0(a3);
}

char *_ComplicationHosting.__allocating_init(frame:async:)(char a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return _s19ComplicationDisplay01_A7HostingC5frame5asyncACSo6CGRectV_Sbtcfc_0(a1);
}

uint64_t type metadata accessor for _ComplicationHosting()
{
  return objc_opt_self();
}

void sub_21305C494(void *a1, uint64_t a2)
{
  id v4;
  uint64_t v5;
  id v6;
  unint64_t v7;
  char v8;
  double v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  unint64_t v14;
  char v15;
  double v16;
  uint64_t v17;
  void *v18;
  double v19;
  __int128 v20;
  __int128 v21;

  v4 = objc_msgSend(a1, sel_statistics);
  type metadata accessor for RBDrawableStatisticsKey(0);
  sub_21304C434(&qword_254B6EF48, (uint64_t (*)(uint64_t))type metadata accessor for RBDrawableStatisticsKey, (uint64_t)&unk_21306BA3C);
  v5 = sub_213068B28();

  if (!*(_QWORD *)(v5 + 16))
  {
    v20 = 0u;
    v21 = 0u;
LABEL_8:
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  v6 = (id)*MEMORY[0x24BE7EFD0];
  v7 = sub_21305D5E4((uint64_t)v6);
  if ((v8 & 1) == 0)
  {
    v20 = 0u;
    v21 = 0u;

    goto LABEL_8;
  }
  sub_21305E4C8(*(_QWORD *)(v5 + 56) + 32 * v7, (uint64_t)&v20);

  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v21 + 1))
  {
LABEL_9:
    sub_21305E488((uint64_t)&v20);
    goto LABEL_10;
  }
  if (swift_dynamicCast())
  {
    v9 = v19;
    goto LABEL_11;
  }
LABEL_10:
  v9 = 0.0;
LABEL_11:
  v10 = a2 + 16;
  v11 = objc_msgSend(a1, sel_statistics);
  v12 = sub_213068B28();

  if (*(_QWORD *)(v12 + 16))
  {
    v13 = (id)*MEMORY[0x24BE7EFD8];
    v14 = sub_21305D5E4((uint64_t)v13);
    if ((v15 & 1) != 0)
    {
      sub_21305E4C8(*(_QWORD *)(v12 + 56) + 32 * v14, (uint64_t)&v20);
    }
    else
    {
      v20 = 0u;
      v21 = 0u;
    }

  }
  else
  {
    v20 = 0u;
    v21 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v21 + 1))
  {
    if (swift_dynamicCast())
    {
      v16 = v19;
      goto LABEL_22;
    }
  }
  else
  {
    sub_21305E488((uint64_t)&v20);
  }
  v16 = 0.0;
LABEL_22:
  swift_beginAccess();
  v17 = MEMORY[0x2199AA76C](v10);
  if (v17)
  {
    v18 = (void *)v17;
    sub_21305CF20(v16, v9);

  }
}

uint64_t sub_21305C6DC(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
}

id _ComplicationHosting.__deallocating_deinit()
{
  char *v0;
  void *v1;
  void *v2;
  id v3;
  objc_super v5;

  v1 = v0;
  v2 = *(void **)&v0[OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_hostingViewController];
  swift_getObjectType();
  v3 = v2;
  sub_213068AB0();
  sub_2130686C0();

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for _ComplicationHosting();
  return objc_msgSendSuper2(&v5, sel_dealloc);
}

uint64_t sub_21305C90C()
{
  swift_getObjectType();
  return sub_213068690();
}

uint64_t sub_21305CA68()
{
  return sub_21305CA7C(&OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_viewData, (void (*)(_QWORD, _QWORD))sub_21305DCDC);
}

uint64_t sub_21305CA7C(_QWORD *a1, void (*a2)(_QWORD, _QWORD))
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;

  v4 = (_QWORD *)(v2 + *a1);
  swift_beginAccess();
  v5 = *v4;
  a2(*v4, v4[1]);
  return v5;
}

uint64_t sub_21305CB6C(uint64_t a1, uint64_t a2)
{
  return sub_21305CB80(a1, a2, &OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_viewData, (uint64_t (*)(uint64_t, uint64_t))sub_21305DD34);
}

uint64_t sub_21305CB80(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v4;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v8 = (uint64_t *)(v4 + *a3);
  swift_beginAccess();
  v9 = *v8;
  v10 = v8[1];
  *v8 = a1;
  v8[1] = a2;
  return a4(v9, v10);
}

uint64_t sub_21305CBDC@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  unint64_t v5;

  v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_viewData);
  swift_beginAccess();
  v4 = *v3;
  v5 = v3[1];
  *a2 = *v3;
  a2[1] = v5;
  return sub_21305DCDC(v4, v5);
}

uint64_t sub_21305CC30(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  unint64_t v6;

  v2 = *a1;
  v3 = a1[1];
  v4 = (uint64_t *)(*a2 + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_viewData);
  swift_beginAccess();
  v5 = *v4;
  v6 = v4[1];
  *v4 = v2;
  v4[1] = v3;
  sub_21305DCDC(v2, v3);
  return sub_21305DD34(v5, v6);
}

uint64_t (*sub_21305CCA8())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_21305CD30()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_paused);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_21305CDBC(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_paused);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_21305CE04())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_21305CE48()
{
  uint64_t v0;
  void *v1;

  if (*(_BYTE *)(v0 + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_rendersAsynchronously) == 1)
  {
    objc_msgSend((id)objc_opt_self(), sel_flush);
    swift_getObjectType();
    if (sub_21306869C())
    {
      objc_opt_self();
      v1 = (void *)swift_dynamicCastObjCClass();
      if (v1)
        objc_msgSend(v1, sel_waitUntilAsyncRenderingCompleted);
      swift_unknownObjectRelease();
    }
  }
}

uint64_t sub_21305CF20(double a1, double a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t result;
  void (*v15)(uint64_t, double, double);
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  void *v19;
  const void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD aBlock[6];

  v5 = sub_213068AF8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_213068B10();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = v2 + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_renderStatsHandler;
  result = swift_beginAccess();
  v15 = *(void (**)(uint64_t, double, double))v13;
  if (*(_QWORD *)v13)
  {
    v16 = *(_QWORD *)(v13 + 8);
    v17 = (_BYTE *)(v2
                  + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_shouldCallRenderStatsHandlerOnMainQueue);
    swift_beginAccess();
    if (*v17 == 1)
    {
      sub_2130520D8(0, &qword_254B6F710);
      swift_retain();
      v24 = sub_213068BC4();
      v18 = swift_allocObject();
      *(_QWORD *)(v18 + 16) = v15;
      *(_QWORD *)(v18 + 24) = v16;
      *(double *)(v18 + 32) = a1;
      *(double *)(v18 + 40) = a2;
      aBlock[4] = sub_21305E1B8;
      aBlock[5] = v18;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_2130612F0;
      aBlock[3] = &block_descriptor_3;
      v19 = _Block_copy(aBlock);
      v23 = v6;
      v20 = v19;
      swift_retain();
      swift_release();
      sub_213068B04();
      aBlock[0] = MEMORY[0x24BEE4AF8];
      sub_21304C434(&qword_254B6F718, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F720);
      sub_21305E1F8();
      sub_213068C00();
      v21 = (void *)v24;
      MEMORY[0x2199A9D4C](0, v12, v8, v20);
      _Block_release(v20);

      sub_21305BF48((uint64_t)v15);
      (*(void (**)(char *, uint64_t))(v23 + 8))(v8, v5);
      return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    }
    else
    {
      v22 = swift_retain();
      v15(v22, a1, a2);
      return sub_21305BF48((uint64_t)v15);
    }
  }
  return result;
}

id _ComplicationHosting.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void _ComplicationHosting.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

Swift::Void __swiftcall _ComplicationHosting.updateMonochromeColor()()
{
  void *v0;

  objc_msgSend(v0, sel_transitionToMonochromeWithFraction_, 1.0);
}

void _ComplicationHosting.transitionToMonochrome(withFraction:)()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;

  *(_BYTE *)(v0 + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_isMonochrome) = CLKFloatEqualsFloat();
  v1 = v0 + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_filterProvider;
  swift_beginAccess();
  v2 = (void *)MEMORY[0x2199AA76C](v1);
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, sel_colorForView_accented_, *(_QWORD *)(v0 + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_view), 1);
    swift_unknownObjectRelease();
    if (v4)
    {
      v5 = *(void **)(v0 + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_model);
      v3 = v4;
      MEMORY[0x2199A9B24]();
      swift_getKeyPath();
      swift_getKeyPath();
      v6 = v5;
      sub_2130684B0();
    }
    else
    {
      v3 = 0;
    }
  }
  v7 = (void *)MEMORY[0x2199AA76C](v1);
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, sel_colorForView_accented_, *(_QWORD *)(v0 + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_view), 0);
    swift_unknownObjectRelease();
    if (v9)
    {
      v10 = *(void **)(v0 + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_model);
      v8 = v9;
      MEMORY[0x2199A9B24](v8);
      swift_getKeyPath();
      swift_getKeyPath();
      v11 = v10;
      sub_2130684B0();
    }
    else
    {
      v8 = 0;
    }
  }
  v12 = *(void **)(v0 + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_model);
  sub_21305D4B4();
  swift_getKeyPath();
  swift_getKeyPath();
  v13 = v12;
  sub_2130684B0();
  swift_getKeyPath();
  swift_getKeyPath();
  v14 = v13;
  sub_2130684B0();

}

uint64_t sub_21305D4B4()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  unsigned __int8 v4;
  _BYTE *v6;

  v1 = v0 + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_filterProvider;
  swift_beginAccess();
  v2 = (void *)MEMORY[0x2199AA76C](v1);
  if (v2)
  {
    v3 = v2;
    if ((objc_msgSend(v2, sel_respondsToSelector_, sel_viewShouldIgnoreTwoPieceImage_) & 1) != 0)
    {
      v4 = objc_msgSend(v3, sel_viewShouldIgnoreTwoPieceImage_, *(_QWORD *)(v0 + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_view));
      swift_unknownObjectRelease();
      if ((v4 & 1) != 0)
        goto LABEL_8;
    }
    else
    {
      swift_unknownObjectRelease();
    }
  }
  if ((*(_BYTE *)(v0 + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_supportsComplicationForeground) & 1) != 0)
    return 0;
LABEL_8:
  v6 = (_BYTE *)(v0 + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_shouldAccentDesaturatedView);
  swift_beginAccess();
  if (*v6)
    return 3;
  else
    return 1;
}

unint64_t sub_21305D5E4(uint64_t a1)
{
  uint64_t v2;

  sub_213068B58();
  sub_213068C9C();
  sub_213068B64();
  v2 = sub_213068CB4();
  swift_bridgeObjectRelease();
  return sub_21305D664(a1, v2);
}

unint64_t sub_21305D664(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v6 = sub_213068B58();
    v8 = v7;
    if (v6 == sub_213068B58() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_213068C90();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      v12 = ~v4;
      v5 = (v5 + 1) & v12;
      if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
      {
        while (1)
        {
          v13 = sub_213068B58();
          v15 = v14;
          if (v13 == sub_213068B58() && v15 == v16)
            break;
          v18 = sub_213068C90();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            v5 = (v5 + 1) & v12;
            if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
              continue;
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

char *_s19ComplicationDisplay01_A7HostingC5frame5asyncACSo6CGRectV_Sbtcfc_0(char a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  id v10;
  char *v11;
  char *v12;
  char v13;
  void *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, char *, uint64_t);
  uint64_t v20;
  void (*v21)(_QWORD *, _QWORD);
  id v22;
  void (*v23)(_QWORD *, _QWORD);
  void *v24;
  id v25;
  char *result;
  char *v27;
  void *v28;
  char *v29;
  id v30;
  objc_class *v31;
  char *v32;
  void *v33;
  char *v34;
  id v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD aBlock[6];
  objc_super v51;

  v3 = sub_2130687BC();
  v47 = *(_QWORD *)(v3 - 8);
  v48 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (uint64_t *)((char *)&v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = sub_2130687F8();
  v49 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectWeakInit();
  v9 = OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_model;
  v10 = objc_allocWithZone((Class)type metadata accessor for MonochromeModel());
  v11 = v1;
  *(_QWORD *)&v1[v9] = objc_msgSend(v10, sel_init);
  v11[OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_isMonochrome] = 0;
  v12 = &v11[OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_renderStatsHandler];
  *(_QWORD *)v12 = 0;
  *((_QWORD *)v12 + 1) = 0;
  v11[OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_shouldCallRenderStatsHandlerOnMainQueue] = 1;
  v11[OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_shouldAccentDesaturatedView] = 0;
  v11[OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_supportsComplicationForeground] = 0;
  *(_OWORD *)&v11[OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_viewData] = xmmword_21306CCC0;
  v11[OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_paused] = 0;
  v13 = CLKIsUVPreviewApp();
  v46 = OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_inPreview;
  v11[OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_inPreview] = v13;
  v11[OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_rendersAsynchronously] = a1;
  sub_213068AB0();
  v14 = (void *)sub_213068828();
  swift_release();
  swift_getObjectType();
  sub_2130520D8(0, (unint64_t *)&unk_254B6F730);
  v15 = dynamic_cast_existential_1_superclass_unconditional((uint64_t)v14);
  v16 = &v11[OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_hostingViewController];
  *(_QWORD *)v16 = v15;
  *((_QWORD *)v16 + 1) = v17;
  sub_2130687EC();
  sub_2130687D4();
  sub_2130687E0();
  swift_getObjectType();
  v18 = swift_allocBox();
  v19 = *(void (**)(uint64_t, char *, uint64_t))(v49 + 16);
  v44 = v8;
  v45 = v6;
  v19(v20, v8, v6);
  *v5 = v18;
  (*(void (**)(uint64_t *, _QWORD, uint64_t))(v47 + 104))(v5, *MEMORY[0x24BDEFFC8], v48);
  v21 = (void (*)(_QWORD *, _QWORD))sub_2130686B4();
  sub_213068804();
  v21(aBlock, 0);
  v22 = v14;
  v23 = (void (*)(_QWORD *, _QWORD))sub_2130686B4();
  sub_2130687C8();
  v23(aBlock, 0);

  v24 = *(void **)v16;
  swift_getObjectType();
  v25 = v24;
  sub_2130686A8();

  result = (char *)objc_msgSend(*(id *)v16, sel_view);
  if (result)
  {
    v27 = result;
    *(_QWORD *)&v11[OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_view] = result;
    v28 = (void *)objc_opt_self();
    v29 = v27;
    v30 = objc_msgSend(v28, sel_clearColor);
    objc_msgSend(v29, sel_setBackgroundColor_, v30);

    v31 = (objc_class *)type metadata accessor for _ComplicationHosting();
    v51.receiver = v11;
    v51.super_class = v31;
    v32 = (char *)objc_msgSendSuper2(&v51, sel_init);
    v33 = *(void **)&v32[OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_hostingViewController];
    swift_getObjectType();
    v34 = v32;
    v35 = v33;
    v36 = sub_21306869C();

    if (v36)
    {
      objc_opt_self();
      v37 = (void *)swift_dynamicCastObjCClass();
      v39 = v44;
      v38 = v45;
      v40 = v49;
      if (v37)
      {
        v41 = v37;
        objc_msgSend(v37, sel_resetStatistics_alpha_, 6, 0.0);
        v42 = swift_allocObject();
        swift_unknownObjectWeakInit();
        aBlock[4] = sub_21305E480;
        aBlock[5] = v42;
        aBlock[0] = MEMORY[0x24BDAC760];
        aBlock[1] = 1107296256;
        aBlock[2] = sub_21305C6DC;
        aBlock[3] = &block_descriptor_50;
        v43 = _Block_copy(aBlock);
        swift_release();
        objc_msgSend(v41, sel_setStatisticsHandler_, v43);

        _Block_release(v43);
        swift_unknownObjectRelease();
      }
      else
      {
        swift_unknownObjectRelease();

      }
    }
    else
    {

      v39 = v44;
      v38 = v45;
      v40 = v49;
    }
    (*(void (**)(char *, uint64_t))(v40 + 8))(v39, v38);
    return v34;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_21305DCDC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_21305DCF0(a1, a2);
  return a1;
}

uint64_t sub_21305DCF0(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_21305DD34(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_21305DD48(a1, a2);
  return a1;
}

uint64_t sub_21305DD48(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release();
  }
  return swift_release();
}

uint64_t sub_21305DDAC@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1 + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_filterProvider;
  swift_beginAccess();
  result = MEMORY[0x2199AA76C](v3);
  *a2 = result;
  return result;
}

uint64_t sub_21305DE00()
{
  swift_beginAccess();
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_21305DE5C@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return keypath_get_25Tm(a1, &OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_shouldCallRenderStatsHandlerOnMainQueue, a2);
}

uint64_t sub_21305DE68(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_26Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_shouldCallRenderStatsHandlerOnMainQueue);
}

uint64_t sub_21305DE74@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return keypath_get_25Tm(a1, &OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_shouldAccentDesaturatedView, a2);
}

uint64_t sub_21305DE80(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_26Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_shouldAccentDesaturatedView);
}

uint64_t sub_21305DE94@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return keypath_get_25Tm(a1, &OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_paused, a2);
}

uint64_t keypath_get_25Tm@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X3>, _BYTE *a3@<X8>)
{
  _BYTE *v4;
  uint64_t result;

  v4 = (_BYTE *)(*a1 + *a2);
  result = swift_beginAccess();
  *a3 = *v4;
  return result;
}

uint64_t sub_21305DEEC(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_26Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_paused);
}

uint64_t keypath_set_26Tm(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  char v5;
  _BYTE *v6;
  uint64_t result;

  v5 = *a1;
  v6 = (_BYTE *)(*a2 + *a5);
  result = swift_beginAccess();
  *v6 = v5;
  return result;
}

uint64_t method lookup function for _ComplicationHosting()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of _ComplicationHosting.filterProvider.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of _ComplicationHosting.filterProvider.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of _ComplicationHosting.filterProvider.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of _ComplicationHosting.renderStatsHandler.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of _ComplicationHosting.renderStatsHandler.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of _ComplicationHosting.renderStatsHandler.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of _ComplicationHosting.shouldCallRenderStatsHandlerOnMainQueue.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of _ComplicationHosting.shouldCallRenderStatsHandlerOnMainQueue.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of _ComplicationHosting.shouldCallRenderStatsHandlerOnMainQueue.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of _ComplicationHosting.shouldAccentDesaturatedView.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of _ComplicationHosting.shouldAccentDesaturatedView.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of _ComplicationHosting.shouldAccentDesaturatedView.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x128))();
}

uint64_t dispatch thunk of static _ComplicationHosting.async()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 328))();
}

uint64_t dispatch thunk of static _ComplicationHosting.sync()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 336))();
}

uint64_t dispatch thunk of _ComplicationHosting.__allocating_init(frame:async:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 344))();
}

uint64_t dispatch thunk of _ComplicationHosting.sizeThatFits(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x168))();
}

uint64_t dispatch thunk of _ComplicationHosting.viewData.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x170))();
}

uint64_t dispatch thunk of _ComplicationHosting.viewData.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x178))();
}

uint64_t dispatch thunk of _ComplicationHosting.viewData.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x180))();
}

uint64_t dispatch thunk of _ComplicationHosting.paused.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x188))();
}

uint64_t dispatch thunk of _ComplicationHosting.paused.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x190))();
}

uint64_t dispatch thunk of _ComplicationHosting.paused.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x198))();
}

uint64_t dispatch thunk of _ComplicationHosting.waitForAsyncRendering()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1A0))();
}

uint64_t sub_21305E194()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21305E1B8()
{
  uint64_t v0;

  return (*(uint64_t (**)(double, double))(v0 + 16))(*(double *)(v0 + 32), *(double *)(v0 + 40));
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

unint64_t sub_21305E1F8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254B6F728;
  if (!qword_254B6F728)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B6F720);
    result = MEMORY[0x2199AA6AC](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_254B6F728);
  }
  return result;
}

void sub_21305E244()
{
  _BYTE *v0;
  uint64_t v1;
  _QWORD *v2;

  swift_unknownObjectWeakInit();
  v1 = OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_model;
  *(_QWORD *)&v0[v1] = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for MonochromeModel()), sel_init);
  v0[OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_isMonochrome] = 0;
  v2 = &v0[OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_renderStatsHandler];
  *v2 = 0;
  v2[1] = 0;
  v0[OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_shouldCallRenderStatsHandlerOnMainQueue] = 1;
  v0[OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_shouldAccentDesaturatedView] = 0;
  v0[OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_supportsComplicationForeground] = 0;
  *(_OWORD *)&v0[OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_viewData] = xmmword_21306CCC0;
  v0[OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_paused] = 0;

  sub_213068C60();
  __break(1u);
}

uint64_t sub_21305E330()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_21305E354()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_21305E360(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t sub_21305E384()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21305E3A8(double a1, double a2)
{
  uint64_t v2;
  uint64_t (*v3)(double *, double *);
  double v5;
  double v6;

  v3 = *(uint64_t (**)(double *, double *))(v2 + 16);
  v5 = a2;
  v6 = a1;
  return v3(&v6, &v5);
}

uint64_t sub_21305E3DC(double *a1, double *a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(double, double))(v2 + 16))(*a1, *a2);
}

uint64_t dynamic_cast_existential_1_superclass_unconditional(uint64_t a1)
{
  uint64_t result;

  result = swift_dynamicCastMetatype();
  if (result)
  {
    result = swift_conformsToProtocol2();
    if (result)
      return a1;
  }
  __break(1u);
  return result;
}

uint64_t sub_21305E45C()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_21305E480(void *a1)
{
  uint64_t v1;

  sub_21305C494(a1, v1);
}

uint64_t sub_21305E488(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254B6F740);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21305E4C8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_21305E51C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v4 = sub_213068774();
  MEMORY[0x24BDAC7A8](v4);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))((char *)&v7 - v5, a1, a2);
  swift_storeEnumTagMultiPayload();
  return sub_213068780();
}

uint64_t sub_21305E5E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v5 = sub_213068774();
  MEMORY[0x24BDAC7A8](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 16))((char *)&v8 - v6, a1, a3);
  swift_storeEnumTagMultiPayload();
  return sub_213068780();
}

double ComplicationCircularBezelView.contentCenter.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

uint64_t ComplicationCircularBezelView.curvedLabelViewConfiguration.getter@<X0>(_OWORD *a1@<X8>)
{
  _OWORD *v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _OWORD v9[2];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  v3 = v1[6];
  v12 = v1[5];
  v2 = v12;
  v13 = v3;
  v14 = v1[7];
  v4 = v14;
  v5 = v1[2];
  v9[0] = v1[1];
  v9[1] = v5;
  v6 = v1[4];
  v10 = v1[3];
  v7 = v10;
  v11 = v6;
  *a1 = v9[0];
  a1[1] = v5;
  a1[2] = v7;
  a1[3] = v6;
  a1[4] = v2;
  a1[5] = v3;
  a1[6] = v4;
  return sub_21304D128((uint64_t)v9);
}

uint64_t ComplicationCircularBezelView.circularContent.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 128);
  swift_retain();
  return v1;
}

void ComplicationCircularBezelView.body.getter()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B6F750);
  type metadata accessor for ComplicationCircularBezelView.ContainerShapeModifier();
}

uint64_t sub_21305E788()
{
  _OWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  void (*v17)(_BYTE *, uint64_t);
  _BYTE v19[96];

  sub_2130685C4();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B6EED0);
  sub_2130685C4();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_254B6F758);
  sub_2130685C4();
  sub_2130685C4();
  swift_getTupleTypeMetadata2();
  v5 = sub_213068AC8();
  MEMORY[0x2199AA6AC](MEMORY[0x24BDF5428], v5);
  v6 = sub_213068AA4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v19[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v19[-v11];
  v13 = v0[7];
  *(_OWORD *)(v4 - 144) = v0[6];
  *(_OWORD *)(v4 - 128) = v13;
  *(_OWORD *)(v4 - 112) = v0[8];
  v14 = v0[3];
  *(_OWORD *)(v4 - 208) = v0[2];
  *(_OWORD *)(v4 - 192) = v14;
  v15 = v0[5];
  *(_OWORD *)(v4 - 176) = v0[4];
  *(_OWORD *)(v4 - 160) = v15;
  v16 = v0[1];
  *(_OWORD *)(v4 - 240) = *v0;
  *(_OWORD *)(v4 - 224) = v16;
  *(_QWORD *)(v4 - 288) = v2;
  *(_QWORD *)(v4 - 280) = v1;
  *(_QWORD *)(v4 - 272) = v3;
  *(_QWORD *)(v4 - 264) = *(_QWORD *)(v4 - 320);
  *(_QWORD *)(v4 - 256) = v4 - 240;
  sub_213068ABC();
  sub_213068A98();
  MEMORY[0x2199AA6AC](MEMORY[0x24BDF4750], v6);
  sub_213059AA0((uint64_t)v10, v6, (uint64_t)v12);
  v17 = *(void (**)(_BYTE *, uint64_t))(v7 + 8);
  v17(v10, v6);
  sub_213055E58((uint64_t)v12, v6, *(_QWORD *)(v4 - 312));
  return ((uint64_t (*)(_BYTE *, uint64_t))v17)(v12, v6);
}

void type metadata accessor for ComplicationCircularBezelView.ContainerShapeModifier()
{
  JUMPOUT(0x2199AA634);
}

void sub_21305E984(__n128 *a1@<X0>, unint64_t a2@<X1>, unint64_t a3@<X2>, unint64_t a4@<X3>, unint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __n128 v21;
  __n128 v22;
  __n128 v23;
  __n128 v24;
  __n128 v25;
  __n128 v26;
  __n128 v27;
  _QWORD v28[102];
  __n128 v29;
  __n128 v30;
  __n128 v31;
  __n128 v32;
  __n128 v33;
  __n128 v34;
  __n128 v35;
  _OWORD v36[8];
  uint64_t v37;
  _QWORD v38[95];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __n128 v49;
  __n128 v50;
  __n128 v51;
  __n128 v52;
  __n128 v53;
  __n128 v54;
  __n128 v55;

  v28[13] = a6;
  v28[6] = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v28[0] = (char *)v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B6EED0);
  v12 = sub_2130685C4();
  v28[10] = *(_QWORD *)(v12 - 8);
  v28[5] = v12;
  MEMORY[0x24BDAC7A8](v12);
  v28[3] = (char *)v28 - v13;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_254B6F758);
  v14 = sub_2130685C4();
  v15 = *(_QWORD *)(v14 - 8);
  v28[8] = v14;
  v28[11] = v15;
  MEMORY[0x24BDAC7A8](v14);
  v28[4] = (char *)v28 - v16;
  v17 = sub_2130685C4();
  v28[12] = *(_QWORD *)(v17 - 8);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v28[7] = (char *)v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v28[9] = (char *)v28 - v20;
  v21 = a1[4];
  v22 = a1[6];
  v33 = a1[5];
  v34 = v22;
  v23 = a1[6];
  v35 = a1[7];
  v24 = a1[2];
  v29 = a1[1];
  v30 = v24;
  v25 = a1[4];
  v27 = a1[1];
  v26 = a1[2];
  v31 = a1[3];
  v32 = v25;
  v53 = v33;
  v54 = v23;
  v55 = a1[7];
  v49 = v27;
  v50 = v26;
  v52 = v21;
  v51 = v31;
  sub_21304D128((uint64_t)&v29);
  ComplicationCurvedLabelView<>.init(configuration:)(&v49, (uint64_t)v36);
  *(_OWORD *)&v38[69] = v36[6];
  *(_OWORD *)&v38[71] = v36[7];
  v38[73] = v37;
  *(_OWORD *)&v38[61] = v36[2];
  *(_OWORD *)&v38[63] = v36[3];
  *(_OWORD *)&v38[67] = v36[5];
  *(_OWORD *)&v38[65] = v36[4];
  *(_OWORD *)&v38[59] = v36[1];
  *(_OWORD *)&v38[57] = v36[0];
  v53 = v33;
  v54 = v34;
  v55 = v35;
  v49 = v29;
  v50 = v30;
  v52 = v32;
  v51 = v31;
  v40 = 0u;
  v39 = 0u;
  LOBYTE(v41) = 2;
  sub_21304D128((uint64_t)&v29);
  sub_21305F004(&v49, (uint64_t)v38);
  v45 = *(_OWORD *)&v38[12];
  v46 = *(_OWORD *)&v38[14];
  v47 = *(_OWORD *)&v38[16];
  v48 = *(_OWORD *)&v38[18];
  v41 = *(_OWORD *)&v38[4];
  v42 = *(_OWORD *)&v38[6];
  v43 = *(_OWORD *)&v38[8];
  v44 = *(_OWORD *)&v38[10];
  v39 = *(_OWORD *)v38;
  v40 = *(_OWORD *)&v38[2];
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F750);
  v49.n128_u64[0] = a2;
  v49.n128_u64[1] = a3;
  v50.n128_u64[0] = a4;
  v50.n128_u64[1] = a5;
  type metadata accessor for ComplicationCircularBezelView.ContainerShapeModifier();
}

_QWORD *sub_21305EC6C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t);

  v9 = sub_21304B778(&qword_254B6F870, v2, (uint64_t)&protocol conformance descriptor for ComplicationCurvedLabelView<A>);
  MEMORY[0x2199A9AE8](v1 + 228, v3, a1, v9);
  sub_2130609B0((uint64_t)(v1 + 133));
  sub_213060A10((uint64_t)(v1 + 116));
  memcpy(v1 + 153, v1 + 266, 0x128uLL);
  memcpy(v1 + 228, v1 + 266, 0x128uLL);
  v10 = sub_2130685C4();
  v1[1] = v10;
  v11 = MEMORY[0x2199AA6AC](&unk_21306CFA0, a1);
  v1[63] = v9;
  v1[64] = v11;
  v12 = MEMORY[0x24BDED308];
  v1[2] = MEMORY[0x2199AA6AC](MEMORY[0x24BDED308], v10, v1 + 63);
  sub_213059AA0((uint64_t)(v1 + 228), v10, (uint64_t)(v1 + 65));
  v13 = sub_213060A88(v1 + 153);
  v14 = *v1;
  (*(void (**)(_QWORD *))(v6 + 128))(v13);
  sub_21304B734();
  v15 = v1[3];
  sub_213068984();
  (*(void (**)(uint64_t, uint64_t))(v1[6] + 8))(v14, v5);
  sub_213068ABC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F878);
  v16 = sub_21304B778(&qword_254B6EF00, &qword_254B6EED0, MEMORY[0x24BDEB950]);
  v1[61] = v7;
  v1[62] = v16;
  v17 = v12;
  v18 = v1[5];
  v19 = MEMORY[0x2199AA6AC](v17, v18, v1 + 61);
  sub_21304B778(&qword_254B6F880, &qword_254B6F878, MEMORY[0x24BDEC6F8]);
  v20 = v1[4];
  sub_213068960();
  (*(void (**)(uint64_t, uint64_t))(v1[10] + 8))(v15, v18);
  v21 = sub_21304B778(&qword_254B6F888, qword_254B6F758, MEMORY[0x24BDEDC10]);
  v1[59] = v19;
  v1[60] = v21;
  v22 = MEMORY[0x24BDED308];
  v23 = v1[8];
  v24 = MEMORY[0x2199AA6AC](MEMORY[0x24BDED308], v23, v1 + 59);
  v25 = v1[7];
  sub_213068978();
  (*(void (**)(uint64_t, uint64_t))(v1[11] + 8))(v20, v23);
  v26 = sub_21304B7B8();
  v1[57] = v24;
  v1[58] = v26;
  v27 = MEMORY[0x2199AA6AC](v22, v4, v1 + 57);
  v28 = v1[9];
  sub_213059AA0(v25, v4, v28);
  v29 = v1[12];
  v30 = *(void (**)(uint64_t, uint64_t))(v29 + 8);
  v30(v25, v4);
  memcpy(v1 + 190, v1 + 65, 0x128uLL);
  memcpy(v1 + 18, v1 + 65, 0x128uLL);
  v1[55] = (uint64_t)(v1 + 18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 16))(v25, v28, v4);
  v1[56] = v25;
  sub_213060B4C(v1 + 190);
  v1[16] = v1[1];
  v1[17] = v4;
  v1[14] = v1[2];
  v1[15] = v27;
  sub_213050490(v1 + 55, 2uLL, (uint64_t)(v1 + 16));
  v30(v28, v4);
  memcpy(v1 + 228, v1 + 65, 0x128uLL);
  sub_213060A88(v1 + 228);
  v30(v25, v4);
  memcpy(v1 + 266, v1 + 18, 0x128uLL);
  return sub_213060A88(v1 + 266);
}

void sub_21305EFE0(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_21305E984(*(__n128 **)(v1 + 48), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), a1);
}

double sub_21305EFF0@<D0>(uint64_t a1@<X8>)
{
  double result;

  result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_BYTE *)(a1 + 32) = 2;
  return result;
}

double sub_21305F004@<D0>(_OWORD *a1@<X0>, uint64_t a2@<X8>)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  double result;
  __int128 v7;
  __int128 v8;
  char v9;
  uint64_t v10;

  v3 = a1[5];
  *(_OWORD *)(a2 + 64) = a1[4];
  *(_OWORD *)(a2 + 80) = v3;
  *(_OWORD *)(a2 + 96) = a1[6];
  v4 = a1[1];
  *(_OWORD *)a2 = *a1;
  *(_OWORD *)(a2 + 16) = v4;
  v5 = a1[3];
  *(_OWORD *)(a2 + 32) = a1[2];
  *(_OWORD *)(a2 + 48) = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F048);
  sub_213068A38();
  result = *(double *)&v7;
  *(_OWORD *)(a2 + 112) = v7;
  *(_OWORD *)(a2 + 128) = v8;
  *(_BYTE *)(a2 + 144) = v9;
  *(_QWORD *)(a2 + 152) = v10;
  return result;
}

void sub_21305F08C(double (**a1)@<D0>(uint64_t a1@<X8>)@<X8>)
{
  *a1 = sub_21305F09C;
  a1[1] = 0;
}

double sub_21305F09C@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  uint64_t v14;
  char v15;
  double result;
  __int128 v17;
  _OWORD v18[2];
  char v19;
  CGRect v20;

  v2 = sub_213068798();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_213068810();
  sub_213068528();
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v20.origin.x = v7;
  v20.origin.y = v9;
  v20.size.width = v11;
  v20.size.height = v13;
  CGRectInset(v20, -5.0, -5.0);
  v14 = sub_2130689B4();
  sub_2130688DC();
  v15 = v19;
  *(_QWORD *)a1 = v14;
  result = *(double *)v18;
  v17 = v18[1];
  *(_OWORD *)(a1 + 8) = v18[0];
  *(_OWORD *)(a1 + 24) = v17;
  *(_BYTE *)(a1 + 40) = v15;
  return result;
}

__n128 ComplicationCircularBezelView<>.init(curvedLabelViewConfiguration:contentCenter:content:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>, double a5@<D0>, double a6@<D1>)
{
  void *v12;
  id v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  __n128 result;

  v12 = *(void **)(a1 + 104);
  if (v12)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    v13 = v12;
    sub_2130684B0();
  }
  v14 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(a4 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(a4 + 96) = v14;
  v15 = *(_QWORD *)(a1 + 96);
  v16 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(a4 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(a4 + 32) = v16;
  result = *(__n128 *)(a1 + 48);
  *(_OWORD *)(a4 + 48) = *(_OWORD *)(a1 + 32);
  *(__n128 *)(a4 + 64) = result;
  *(double *)a4 = a5;
  *(double *)(a4 + 8) = a6;
  *(_QWORD *)(a4 + 112) = v15;
  *(_QWORD *)(a4 + 120) = v12;
  *(_QWORD *)(a4 + 128) = a2;
  *(_QWORD *)(a4 + 136) = a3;
  return result;
}

uint64_t sub_21305F28C()
{
  return sub_21305FB68();
}

uint64_t sub_21305F298(uint64_t a1)
{
  swift_release();

  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_21305F2D8(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  __int128 v8;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_DWORD *)(a1 + 36) = *(_DWORD *)(a2 + 36);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_DWORD *)(a1 + 64) = *(_DWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 68) = *(_BYTE *)(a2 + 68);
  *(_DWORD *)(a1 + 72) = *(_DWORD *)(a2 + 72);
  v3 = *(void **)(a2 + 80);
  *(_QWORD *)(a1 + 80) = v3;
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  *(_DWORD *)(a1 + 92) = *(_DWORD *)(a2 + 92);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  v4 = *(_QWORD *)(a2 + 136);
  v8 = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 120) = v8;
  *(_QWORD *)(a1 + 136) = v4;
  swift_retain();
  v5 = v3;
  swift_bridgeObjectRetain();
  v6 = (id)v8;
  swift_retain();
  return a1;
}

uint64_t sub_21305F3B8(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_DWORD *)(a1 + 36) = *(_DWORD *)(a2 + 36);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  *(_DWORD *)(a1 + 60) = *(_DWORD *)(a2 + 60);
  *(_DWORD *)(a1 + 64) = *(_DWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 68) = *(_BYTE *)(a2 + 68);
  *(_DWORD *)(a1 + 72) = *(_DWORD *)(a2 + 72);
  v4 = *(void **)(a1 + 80);
  v5 = *(void **)(a2 + 80);
  *(_QWORD *)(a1 + 80) = v5;
  v6 = v5;

  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  *(_DWORD *)(a1 + 92) = *(_DWORD *)(a2 + 92);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v7 = *(void **)(a1 + 120);
  v8 = *(void **)(a2 + 120);
  *(_QWORD *)(a1 + 120) = v8;
  v9 = v8;

  v10 = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = v10;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_21305F4D4(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_release();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_DWORD *)(a1 + 36) = *(_DWORD *)(a2 + 36);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_DWORD *)(a1 + 64) = *(_DWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 68) = *(_BYTE *)(a2 + 68);
  *(_DWORD *)(a1 + 72) = *(_DWORD *)(a2 + 72);
  v4 = *(void **)(a1 + 80);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);

  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  *(_DWORD *)(a1 + 92) = *(_DWORD *)(a2 + 92);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  swift_bridgeObjectRelease();
  v5 = *(void **)(a1 + 120);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);

  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  swift_release();
  return a1;
}

uint64_t sub_21305F5A0(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 144))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_21305F5E8(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 136) = 0;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 144) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 144) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for ComplicationCircularBezelView()
{
  JUMPOUT(0x2199AA634);
}

void sub_21305F658()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B6F750);
  type metadata accessor for ComplicationCircularBezelView.ContainerShapeModifier();
}

uint64_t sub_21305F6A8()
{
  uint64_t v0;
  uint64_t v1;

  sub_2130685C4();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B6EED0);
  sub_2130685C4();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_254B6F758);
  sub_2130685C4();
  sub_2130685C4();
  swift_getTupleTypeMetadata2();
  v0 = sub_213068AC8();
  MEMORY[0x2199AA6AC](MEMORY[0x24BDF5428], v0);
  v1 = sub_213068AA4();
  return MEMORY[0x2199AA6AC](MEMORY[0x24BDF4750], v1);
}

uint64_t sub_21305F77C(uint64_t a1)
{
  swift_release();

  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_21305F7BC(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  __int128 v5;
  id v6;
  id v7;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 52) = *(_BYTE *)(a2 + 52);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  v3 = *(void **)(a2 + 64);
  *(_QWORD *)(a1 + 64) = v3;
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_DWORD *)(a1 + 76) = *(_DWORD *)(a2 + 76);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  v4 = *(void **)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v4;
  v5 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v5;
  *(_BYTE *)(a1 + 144) = *(_BYTE *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  swift_retain();
  v6 = v3;
  swift_bridgeObjectRetain();
  v7 = v4;
  swift_retain();
  return a1;
}

uint64_t sub_21305F890(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  __int128 v10;
  __int128 v11;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(_DWORD *)(a1 + 44) = *(_DWORD *)(a2 + 44);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 52) = *(_BYTE *)(a2 + 52);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  v4 = *(void **)(a1 + 64);
  v5 = *(void **)(a2 + 64);
  *(_QWORD *)(a1 + 64) = v5;
  v6 = v5;

  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_DWORD *)(a1 + 76) = *(_DWORD *)(a2 + 76);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v7 = *(void **)(a1 + 104);
  v8 = *(void **)(a2 + 104);
  *(_QWORD *)(a1 + 104) = v8;
  v9 = v8;

  v10 = *(_OWORD *)(a2 + 112);
  v11 = *(_OWORD *)(a2 + 128);
  *(_BYTE *)(a1 + 144) = *(_BYTE *)(a2 + 144);
  *(_OWORD *)(a1 + 112) = v10;
  *(_OWORD *)(a1 + 128) = v11;
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy160_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __n128 result;
  __int128 v7;
  __int128 v8;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  result = *(__n128 *)(a2 + 96);
  v7 = *(_OWORD *)(a2 + 112);
  v8 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v8;
  *(__n128 *)(a1 + 96) = result;
  *(_OWORD *)(a1 + 112) = v7;
  return result;
}

uint64_t sub_21305F9D8(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  __int128 v6;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 52) = *(_BYTE *)(a2 + 52);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  v4 = *(void **)(a1 + 64);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);

  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_DWORD *)(a1 + 76) = *(_DWORD *)(a2 + 76);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  swift_bridgeObjectRelease();
  v5 = *(void **)(a1 + 104);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);

  v6 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v6;
  *(_BYTE *)(a1 + 144) = *(_BYTE *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  swift_release();
  return a1;
}

uint64_t sub_21305FAAC(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 160))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_21305FAF4(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 152) = 0;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 160) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 160) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t sub_21305FB5C()
{
  return sub_21305FB68();
}

uint64_t sub_21305FB68()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21305FB98()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F048);
  return sub_213068A38();
}

uint64_t sub_21305FBE8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F120);
  return sub_213068A44();
}

uint64_t sub_21305FC3C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F120);
  return sub_213068A50();
}

double sub_21305FCA0@<D0>(uint64_t a1@<X8>)
{
  double result;
  __int128 v3;
  __int128 v4;
  char v5;

  sub_2130688E8();
  sub_2130688B8();
  sub_2130688C4();
  sub_2130688AC();
  result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = v4;
  *(_BYTE *)(a1 + 32) = v5;
  return result;
}

uint64_t sub_21305FD6C(unsigned int *a1)
{
  __int128 *v1;
  unsigned int v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t result;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _DWORD v18[2];
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  _BYTE v35[7];
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  char v39;

  v3 = *a1;
  v2 = a1[1];
  v4 = *((_QWORD *)a1 + 1);
  v5 = *((_QWORD *)a1 + 2);
  v6 = *((_QWORD *)a1 + 3);
  v7 = *((_BYTE *)a1 + 32);
  v8 = *((_QWORD *)v1 + 14);
  v9 = *((_QWORD *)v1 + 15);
  v10 = *((_QWORD *)v1 + 16);
  v11 = *((_QWORD *)v1 + 17);
  v12 = *((_BYTE *)v1 + 144);
  v13 = *((_QWORD *)v1 + 19);
  *(_QWORD *)&v23 = v8;
  *((_QWORD *)&v23 + 1) = v9;
  *(_QWORD *)&v24 = v10;
  *((_QWORD *)&v24 + 1) = v11;
  LOBYTE(v25) = v12;
  *((_QWORD *)&v25 + 1) = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F120);
  sub_213068A44();
  if (v39 == 2)
    goto LABEL_3;
  v23 = v37;
  v24 = v38;
  LOBYTE(v25) = v39;
  v18[0] = v3;
  v18[1] = v2;
  v19 = v4;
  v20 = v5;
  v21 = v6;
  v22 = v7;
  result = _s19ComplicationDisplay0A17CurvedTextMetricsV2eeoiySbAC_ACtFZ_0((uint64_t)&v23, (uint64_t)v18);
  if ((result & 1) == 0)
  {
LABEL_3:
    v15 = v1[5];
    v27 = v1[4];
    v28 = v15;
    v29 = v1[6];
    v16 = v1[1];
    v23 = *v1;
    v24 = v16;
    v17 = v1[3];
    v25 = v1[2];
    v26 = v17;
    v30 = v8;
    v31 = v9;
    v32 = v10;
    v33 = v11;
    v34 = v12;
    *(_DWORD *)&v35[3] = *((_DWORD *)v1 + 37);
    *(_DWORD *)v35 = *(_DWORD *)((char *)v1 + 145);
    v36 = v13;
    *(_QWORD *)&v37 = v3 | ((unint64_t)v2 << 32);
    *((_QWORD *)&v37 + 1) = v4;
    *(_QWORD *)&v38 = v5;
    *((_QWORD *)&v38 + 1) = v6;
    v39 = v7;
    return sub_21305FC3C();
  }
  return result;
}

uint64_t sub_21305FEB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  __int128 *v3;
  __int128 *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  _DWORD *v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _BYTE *v47;
  void (*v48)(uint64_t, uint64_t);
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  _BYTE *v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint64_t v67;
  _BYTE *v68;
  _BYTE *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  _BYTE *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  _BYTE *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  uint64_t v88;
  _BYTE *v89;
  _BYTE v91[12];
  int v92;
  uint64_t v93;
  uint64_t v94;
  __int128 v95;
  _BYTE *v96;
  _BYTE *v97;
  uint64_t v98;
  uint64_t v99;
  _BYTE *v100;
  uint64_t v101;
  uint64_t v102;
  _BYTE *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  _BYTE *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  _BYTE *v115;
  _QWORD v116[2];
  _QWORD v117[4];
  _QWORD v118[2];
  _QWORD v119[2];
  _QWORD v120[2];
  _QWORD v121[2];
  _QWORD v122[2];
  _QWORD v123[2];
  _QWORD v124[2];
  __int128 v125;
  __int128 v126;
  unsigned __int8 v127;
  _BYTE v128[32];
  char v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  char v141;
  _BYTE v142[7];
  uint64_t v143;

  v4 = v3;
  v105 = a1;
  v114 = a3;
  v6 = sub_2130685F4();
  v101 = *(_QWORD *)(v6 - 8);
  v102 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v100 = &v91[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x2199AA6AC](&unk_21306CFA0, a2);
  v104 = a2;
  v8 = sub_2130687B0();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B6F158);
  v112 = v8;
  v9 = sub_2130685C4();
  v106 = *(_QWORD *)(v9 - 8);
  v10 = MEMORY[0x24BDAC7A8](v9);
  *(_QWORD *)&v95 = &v91[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v10);
  v107 = &v91[-v12];
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B6F4F0);
  v13 = sub_2130685C4();
  v98 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v97 = &v91[-v14];
  v111 = v15;
  v16 = sub_2130685C4();
  v99 = *(_QWORD *)(v16 - 8);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v96 = &v91[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v17);
  v103 = &v91[-v19];
  v110 = v20;
  v113 = v9;
  v21 = sub_21306878C();
  v108 = *(_QWORD *)(v21 - 8);
  v109 = v21;
  MEMORY[0x24BDAC7A8](v21);
  v115 = &v91[-v22];
  v24 = *((_QWORD *)v4 + 14);
  v23 = *((_QWORD *)v4 + 15);
  v25 = *((_QWORD *)v4 + 16);
  v26 = *((_QWORD *)v4 + 17);
  v27 = *((_BYTE *)v4 + 144);
  v28 = (_DWORD *)((char *)v4 + 145);
  v29 = *((_QWORD *)v4 + 19);
  *(_QWORD *)&v130 = v24;
  *((_QWORD *)&v130 + 1) = v23;
  *(_QWORD *)&v131 = v25;
  *((_QWORD *)&v131 + 1) = v26;
  v30 = v27;
  LOBYTE(v132) = v27;
  v31 = v29;
  *((_QWORD *)&v132 + 1) = v29;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F120);
  sub_213068A44();
  if (v129 == 2)
  {
    v32 = v4[5];
    v134 = v4[4];
    v135 = v32;
    v136 = v4[6];
    v33 = v4[1];
    v130 = *v4;
    v131 = v33;
    v34 = v4[3];
    v132 = v4[2];
    v133 = v34;
    v137 = v24;
    v138 = v23;
    v139 = v25;
    v140 = v26;
    v141 = v30;
    *(_DWORD *)v142 = *v28;
    *(_DWORD *)&v142[3] = *((_DWORD *)v4 + 37);
    v143 = v31;
    v35 = swift_allocObject();
    v36 = *(_OWORD *)(v104 + 32);
    *(_OWORD *)(v35 + 16) = *(_OWORD *)(v104 + 16);
    *(_OWORD *)(v35 + 32) = v36;
    v37 = v4[5];
    *(_OWORD *)(v35 + 112) = v4[4];
    *(_OWORD *)(v35 + 128) = v37;
    *(_OWORD *)(v35 + 144) = v4[6];
    v38 = v4[1];
    *(_OWORD *)(v35 + 48) = *v4;
    *(_OWORD *)(v35 + 64) = v38;
    v39 = v4[3];
    *(_OWORD *)(v35 + 80) = v4[2];
    *(_OWORD *)(v35 + 96) = v39;
    *(_QWORD *)(v35 + 160) = v24;
    *(_QWORD *)(v35 + 168) = v23;
    *(_QWORD *)(v35 + 176) = v25;
    *(_QWORD *)(v35 + 184) = v26;
    *(_BYTE *)(v35 + 192) = v30;
    *(_DWORD *)(v35 + 193) = *v28;
    *(_DWORD *)(v35 + 196) = *((_DWORD *)v4 + 37);
    *(_QWORD *)(v35 + 200) = v31;
    sub_2130608EC((uint64_t)&v130);
    v40 = v112;
    v41 = MEMORY[0x2199AA6AC](MEMORY[0x24BDEFB78], v112);
    sub_21306085C();
    sub_2130608A0();
    v42 = v95;
    sub_213068948();
    swift_release();
    v43 = sub_21304B778(&qword_254B6F150, &qword_254B6F158, MEMORY[0x24BDF09B0]);
    v124[0] = v41;
    v124[1] = v43;
    v44 = MEMORY[0x24BDED308];
    v45 = v113;
    v46 = MEMORY[0x2199AA6AC](MEMORY[0x24BDED308], v113, v124);
    v47 = v107;
    sub_213059AA0(v42, v45, (uint64_t)v107);
    v48 = *(void (**)(uint64_t, uint64_t))(v106 + 8);
    v48(v42, v45);
    sub_213055E58((uint64_t)v47, v45, v42);
    v49 = sub_21304B778(qword_254B6F508, &qword_254B6F4F0, MEMORY[0x24BDF0960]);
    v123[0] = v46;
    v123[1] = v49;
    v50 = v111;
    v51 = MEMORY[0x2199AA6AC](v44, v111, v123);
    v52 = sub_21304F6EC();
    v122[0] = v51;
    v122[1] = v52;
    v53 = v110;
    MEMORY[0x2199AA6AC](v44, v110, v122);
    sub_21305E5E0(v42, v53, v45);
    v48(v42, v45);
    v54 = v47;
    v55 = v45;
  }
  else
  {
    v56 = v4[5];
    v134 = v4[4];
    v135 = v56;
    v136 = v4[6];
    v57 = v4[1];
    v130 = *v4;
    v131 = v57;
    v58 = v4[3];
    v132 = v4[2];
    v133 = v58;
    v137 = v24;
    v138 = v23;
    v139 = v25;
    v140 = v26;
    v141 = v30;
    *(_DWORD *)v142 = *v28;
    *(_DWORD *)&v142[3] = *((_DWORD *)v4 + 37);
    v143 = v31;
    v129 &= 1u;
    sub_21305FCA0((uint64_t)&v125);
    v95 = v125;
    v93 = *((_QWORD *)&v126 + 1);
    v94 = v126;
    v92 = v127;
    v59 = v4[5];
    v134 = v4[4];
    v135 = v59;
    v136 = v4[6];
    v60 = v4[1];
    v130 = *v4;
    v131 = v60;
    v61 = v4[3];
    v132 = v4[2];
    v133 = v61;
    v137 = v24;
    v138 = v23;
    v139 = v25;
    v140 = v26;
    v141 = v30;
    *(_DWORD *)v142 = *v28;
    *(_DWORD *)&v142[3] = *((_DWORD *)v4 + 37);
    v143 = v31;
    v62 = swift_allocObject();
    v63 = *(_OWORD *)(v104 + 32);
    *(_OWORD *)(v62 + 16) = *(_OWORD *)(v104 + 16);
    *(_OWORD *)(v62 + 32) = v63;
    v64 = v4[5];
    *(_OWORD *)(v62 + 112) = v4[4];
    *(_OWORD *)(v62 + 128) = v64;
    *(_OWORD *)(v62 + 144) = v4[6];
    v65 = v4[1];
    *(_OWORD *)(v62 + 48) = *v4;
    *(_OWORD *)(v62 + 64) = v65;
    v66 = v4[3];
    *(_OWORD *)(v62 + 80) = v4[2];
    *(_OWORD *)(v62 + 96) = v66;
    *(_QWORD *)(v62 + 160) = v24;
    *(_QWORD *)(v62 + 168) = v23;
    *(_QWORD *)(v62 + 176) = v25;
    *(_QWORD *)(v62 + 184) = v26;
    *(_BYTE *)(v62 + 192) = v30;
    *(_DWORD *)(v62 + 193) = *v28;
    *(_DWORD *)(v62 + 196) = *((_DWORD *)v4 + 37);
    *(_QWORD *)(v62 + 200) = v31;
    sub_2130608EC((uint64_t)&v130);
    v40 = v112;
    v67 = MEMORY[0x2199AA6AC](MEMORY[0x24BDEFB78], v112);
    sub_21306085C();
    sub_2130608A0();
    v68 = v107;
    sub_213068948();
    swift_release();
    v69 = v100;
    sub_2130685E8();
    v130 = v125;
    v131 = v126;
    LOBYTE(v132) = v127;
    v70 = sub_21304B778(&qword_254B6F150, &qword_254B6F158, MEMORY[0x24BDF09B0]);
    v117[2] = v67;
    v117[3] = v70;
    v71 = MEMORY[0x24BDED308];
    v45 = v113;
    v72 = MEMORY[0x2199AA6AC]();
    sub_2130597B8();
    v73 = v97;
    sub_213068930();
    (*(void (**)(_BYTE *, uint64_t))(v101 + 8))(v69, v102);
    (*(void (**)(_BYTE *, uint64_t))(v106 + 8))(v68, v45);
    v130 = v95;
    *(_QWORD *)&v131 = v94;
    *((_QWORD *)&v131 + 1) = v93;
    LOBYTE(v132) = v92;
    sub_21304F34C((uint64_t)&v125, (uint64_t)v128);
    sub_21304F3C8((uint64_t)v128, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_21304F388);
    v74 = sub_21304B778(qword_254B6F508, &qword_254B6F4F0, MEMORY[0x24BDF0960]);
    v117[0] = v72;
    v117[1] = v74;
    v75 = v71;
    v50 = v111;
    v76 = MEMORY[0x2199AA6AC](v71, v111, v117);
    v77 = (uint64_t)v96;
    View.complicationContainerPath(_:)((uint64_t)&v130, v50, v76);
    sub_21304F3C8((uint64_t)&v125, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_21304F400);
    (*(void (**)(_BYTE *, uint64_t))(v98 + 8))(v73, v50);
    v78 = sub_21304F6EC();
    v116[0] = v76;
    v116[1] = v78;
    v79 = v110;
    MEMORY[0x2199AA6AC](v75, v110, v116);
    v80 = v103;
    sub_213059AA0(v77, v79, (uint64_t)v103);
    v48 = *(void (**)(uint64_t, uint64_t))(v99 + 8);
    v48(v77, v79);
    sub_213055E58((uint64_t)v80, v79, v77);
    v53 = v79;
    sub_21305E51C(v77, v79);
    sub_21304F3C8((uint64_t)&v125, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_21304F400);
    v48(v77, v79);
    v54 = v80;
    v55 = v79;
  }
  v48((uint64_t)v54, v55);
  v81 = MEMORY[0x2199AA6AC](MEMORY[0x24BDEFB78], v40);
  v82 = sub_21304B778(&qword_254B6F150, &qword_254B6F158, MEMORY[0x24BDF09B0]);
  v121[0] = v81;
  v121[1] = v82;
  v83 = MEMORY[0x24BDED308];
  v84 = MEMORY[0x2199AA6AC](MEMORY[0x24BDED308], v45, v121);
  v85 = sub_21304B778(qword_254B6F508, &qword_254B6F4F0, MEMORY[0x24BDF0960]);
  v120[0] = v84;
  v120[1] = v85;
  v86 = MEMORY[0x2199AA6AC](v83, v50, v120);
  v87 = sub_21304F6EC();
  v119[0] = v86;
  v119[1] = v87;
  v118[0] = MEMORY[0x2199AA6AC](v83, v53, v119);
  v118[1] = v84;
  v88 = v109;
  MEMORY[0x2199AA6AC](MEMORY[0x24BDEF3E0], v109, v118);
  v89 = v115;
  sub_213055E58((uint64_t)v115, v88, v114);
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v108 + 8))(v89, v88);
}

void sub_2130607F8()
{
  type metadata accessor for ComplicationCircularBezelView.ContainerShapeModifier();
}

uint64_t sub_213060840()
{
  unsigned int v1;

  return sub_21305FD6C(&v1);
}

unint64_t sub_21306085C()
{
  unint64_t result;

  result = qword_254B6F860;
  if (!qword_254B6F860)
  {
    result = MEMORY[0x2199AA6AC](&protocol conformance descriptor for ComplicationCurvedTextMetricsKey, &type metadata for ComplicationCurvedTextMetricsKey);
    atomic_store(result, (unint64_t *)&qword_254B6F860);
  }
  return result;
}

unint64_t sub_2130608A0()
{
  unint64_t result;

  result = qword_254B6F868;
  if (!qword_254B6F868)
  {
    result = MEMORY[0x2199AA6AC](&protocol conformance descriptor for ComplicationCurvedTextMetrics, &type metadata for ComplicationCurvedTextMetrics);
    atomic_store(result, (unint64_t *)&qword_254B6F868);
  }
  return result;
}

uint64_t sub_2130608EC(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(void **)(a1 + 64);
  v3 = *(void **)(a1 + 104);
  swift_retain();
  swift_retain();
  v4 = v2;
  swift_bridgeObjectRetain();
  v5 = v3;
  return a1;
}

uint64_t objectdestroyTm()
{
  uint64_t v0;

  swift_release();

  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

void sub_213060990()
{
  sub_2130607F8();
}

uint64_t sub_2130609B0(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 64);
  v3 = *(void **)(a1 + 104);
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
  return a1;
}

uint64_t sub_213060A10(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 64);
  v3 = *(void **)(a1 + 104);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
  return a1;
}

_QWORD *sub_213060A88(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v6;

  v2 = (void *)a1[8];
  v3 = (void *)a1[13];
  v4 = (void *)a1[25];
  v6 = (void *)a1[30];
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
  swift_release();
  return a1;
}

_QWORD *sub_213060B4C(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v10;

  v2 = (void *)a1[8];
  v3 = (void *)a1[13];
  v4 = (void *)a1[25];
  v10 = (void *)a1[30];
  swift_retain();
  swift_retain();
  v5 = v2;
  swift_bridgeObjectRetain();
  v6 = v3;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  v7 = v4;
  swift_bridgeObjectRetain();
  v8 = v10;
  return a1;
}

void sub_213060C10()
{
  type metadata accessor for ComplicationCircularBezelView.ContainerShapeModifier();
}

uint64_t sub_213060C40(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[2];
  _QWORD v10[2];
  _QWORD v11[2];
  _QWORD v12[16];

  MEMORY[0x2199AA6AC](&unk_21306CFA0, a1);
  v1 = sub_2130687B0();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B6F158);
  v2 = sub_2130685C4();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B6F4F0);
  v3 = sub_2130685C4();
  v4 = sub_2130685C4();
  v5 = sub_21306878C();
  v12[0] = MEMORY[0x2199AA6AC](MEMORY[0x24BDEFB78], v1);
  v12[1] = sub_21304B778(&qword_254B6F150, &qword_254B6F158, MEMORY[0x24BDF09B0]);
  v6 = MEMORY[0x24BDED308];
  v7 = MEMORY[0x2199AA6AC](MEMORY[0x24BDED308], v2, v12);
  v11[0] = v7;
  v11[1] = sub_21304B778(qword_254B6F508, &qword_254B6F4F0, MEMORY[0x24BDF0960]);
  v10[0] = MEMORY[0x2199AA6AC](v6, v3, v11);
  v10[1] = sub_21304F6EC();
  v9[0] = MEMORY[0x2199AA6AC](v6, v4, v10);
  v9[1] = v7;
  return MEMORY[0x2199AA6AC](MEMORY[0x24BDEF3E0], v5, v9);
}

uint64_t EnvironmentValues._complicationInvertsAccentFilterStyle.getter()
{
  unsigned __int8 v1;

  sub_213060DDC();
  sub_213068678();
  return v1;
}

unint64_t sub_213060DDC()
{
  unint64_t result;

  result = qword_254B6F890;
  if (!qword_254B6F890)
  {
    result = MEMORY[0x2199AA6AC](&unk_21306D038, &_s39ComplicationInvertsAccentFilterStyleKeyVN);
    atomic_store(result, (unint64_t *)&qword_254B6F890);
  }
  return result;
}

uint64_t sub_213060E20@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  sub_213060DDC();
  result = sub_213068678();
  *a1 = v3;
  return result;
}

uint64_t sub_213060E6C()
{
  sub_213060DDC();
  return sub_213068684();
}

uint64_t EnvironmentValues._complicationInvertsAccentFilterStyle.setter()
{
  sub_213060DDC();
  return sub_213068684();
}

void sub_213060EEC(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_213060EF4()
{
  return sub_213068570();
}

uint64_t (*EnvironmentValues._complicationInvertsAccentFilterStyle.modify(uint64_t a1))(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)a1 = v1;
  *(_QWORD *)(a1 + 8) = sub_213060DDC();
  sub_213068678();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a1 + 17);
  return sub_213060F60;
}

uint64_t sub_213060F60(uint64_t a1)
{
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a1 + 16);
  return sub_213068684();
}

uint64_t sub_213060F94@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  sub_213060DDC();
  result = sub_213068678();
  *a1 = v3;
  return result;
}

uint64_t sub_213060FE0()
{
  sub_213060DDC();
  return sub_213068684();
}

ValueMetadata *_s39ComplicationInvertsAccentFilterStyleKeyVMa()
{
  return &_s39ComplicationInvertsAccentFilterStyleKeyVN;
}

uint64_t sub_213061038(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_213061058(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_213061078@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, id a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t *v10;
  uint64_t result;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v10 = (uint64_t *)(a5 + *(int *)(type metadata accessor for ComplicationCurvedTextViewRepresentable() + 32));
  *v10 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F8D8);
  result = swift_storeEnumTagMultiPayload();
  v12 = a1[3];
  *(_OWORD *)(a5 + 32) = a1[2];
  *(_OWORD *)(a5 + 48) = v12;
  v13 = a1[5];
  *(_OWORD *)(a5 + 64) = a1[4];
  *(_OWORD *)(a5 + 80) = v13;
  v14 = a1[1];
  *(_OWORD *)a5 = *a1;
  *(_OWORD *)(a5 + 16) = v14;
  *(_QWORD *)(a5 + 112) = a2;
  *(_QWORD *)(a5 + 96) = a3;
  if (!a4)
  {
    v15 = objc_allocWithZone((Class)type metadata accessor for MonochromeModel());
    swift_retain();
    v16 = objc_msgSend(v15, sel_init);
    swift_getKeyPath();
    swift_getKeyPath();
    v17 = v16;
    sub_2130684B0();
    sub_2130689C0();
    swift_getKeyPath();
    swift_getKeyPath();
    v18 = v17;
    sub_2130684B0();
    sub_2130689C0();
    swift_getKeyPath();
    swift_getKeyPath();
    a4 = v18;
    sub_2130684B0();
    result = swift_release();
  }
  *(_QWORD *)(a5 + 104) = a4;
  return result;
}

void ComplicationCurvedTextConfiguration.ContentProvider.init(_:)(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id v3;
  id v4;
  id v5;
  id v6;

  v3 = *a1;
  v4 = objc_msgSend(*a1, sel_textProvider);
  v5 = v4;
  v6 = objc_msgSend(v3, sel_imageProvider);

  *a2 = v4;
  a2[1] = v6;
}

id ComplicationCurvedTextConfiguration.ContentProvider.labelProvider.getter@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)CDLabelProvider), sel_initWithTextProvider_imageProvider_, *v1, v1[1]);
  *a1 = result;
  return result;
}

uint64_t sub_2130612F0(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

char *sub_21306131C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD aBlock[6];

  v1 = type metadata accessor for ComplicationCurvedTextViewRepresentable();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 64);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CenteringCurvedTextView()), sel_init);
  v5 = OBJC_IVAR____TtC19ComplicationDisplay23CenteringCurvedTextView_curvedLabelView;
  v6 = *(void **)&v4[OBJC_IVAR____TtC19ComplicationDisplay23CenteringCurvedTextView_curvedLabelView];
  v7 = swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_21304D448(v0, (uint64_t)aBlock - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v7;
  sub_213063698((uint64_t)aBlock - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v9 + v8);
  aBlock[4] = sub_2130636DC;
  aBlock[5] = v9;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2130612F0;
  aBlock[3] = &block_descriptor_4;
  v10 = _Block_copy(aBlock);
  v11 = v6;
  swift_release();
  objc_msgSend(v11, sel_setNeedsResizeHandler_, v10);
  _Block_release(v10);

  v12 = *(void **)&v4[v5];
  objc_msgSend(v12, sel_setUppercase_, 1);
  objc_msgSend(v12, sel_setUsesLegibility_, 0);
  return v4;
}

void sub_2130614BC(uint64_t a1)
{
  uint64_t v1;
  char *v2;
  char *v3;

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = (char *)MEMORY[0x2199AA76C](v1);
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, sel_layoutSubviews);
    sub_213061520(v3);

  }
}

uint64_t sub_213061520(char *a1)
{
  uint64_t v1;
  void *v3;
  id v4;
  CGFloat v5;
  double v6;
  double v7;
  float v8;
  float v9;
  unsigned int v11;
  unsigned int v12;
  char v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGPoint v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  long double v23;
  uint64_t v24;
  char v25;
  uint64_t result;
  uint64_t KeyPath;
  double v28[2];
  double v29;
  __int128 v30;
  uint64_t v31;
  char v32;
  CGAffineTransform v33;
  uint64_t v34;
  CGPoint v35;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = *(void **)&a1[OBJC_IVAR____TtC19ComplicationDisplay23CenteringCurvedTextView_curvedLabelView];
  v4 = objc_msgSend(v3, sel_path);

  if (v4)
  {
    v5 = *(double *)(v1 + 112);
    goto LABEL_12;
  }
  v33.a = 0.0;
  v33.b = 0.0;
  v29 = 0.0;
  v28[0] = 0.0;
  objc_msgSend(v3, sel_getTextCenter_startAngle_endAngle_, &v33, &v29, v28);
  v6 = v29;
  v7 = v28[0];
  if (v29 >= v28[0])
    goto LABEL_6;
  v8 = v29;
  v9 = v28[0];
  if (v8 > v9)
  {
    __break(1u);
LABEL_6:
    v8 = v7;
    v9 = v6;
    if (v8 > v9)
      __break(1u);
  }
  v5 = *(double *)(v1 + 112);
  swift_getKeyPath();
  sub_21304C434((unint64_t *)&qword_254B6F4B8, (uint64_t (*)(uint64_t))type metadata accessor for ComplicationCurvedTextMetricsObservable, (uint64_t)&unk_21306C6A4);
  sub_21306842C();
  swift_release();
  if (*(float *)(*(_QWORD *)&v5 + 16) != v8 || *(float *)(*(_QWORD *)&v5 + 20) != v9)
  {
    swift_getKeyPath();
    sub_21306842C();
    swift_release();
    swift_getKeyPath();
    sub_213068444();
    swift_release();
    *(float *)(*(_QWORD *)&v5 + 16) = v8;
    *(float *)(*(_QWORD *)&v5 + 20) = v9;
    swift_getKeyPath();
    sub_213068438();
    swift_release();
  }
LABEL_12:
  swift_getKeyPath();
  v33.a = v5;
  sub_21304C434((unint64_t *)&qword_254B6F4B8, (uint64_t (*)(uint64_t))type metadata accessor for ComplicationCurvedTextMetricsObservable, (uint64_t)&unk_21306C6A4);
  sub_21306842C();
  swift_release();
  v11 = *(_DWORD *)(*(_QWORD *)&v5 + 16);
  v12 = *(_DWORD *)(*(_QWORD *)&v5 + 20);
  v13 = *(_BYTE *)(*(_QWORD *)&v5 + 48);
  objc_msgSend(v3, sel_centerForImage);
  v15 = v14;
  v17 = v16;
  objc_msgSend(v3, sel_transformForImage);
  v35.x = v15;
  v35.y = v17;
  v18 = CGPointApplyAffineTransform(v35, &v33);
  objc_msgSend(a1, sel_convertPoint_fromCoordinateSpace_, v3, v18.x, v18.y);
  v20 = v19;
  v22 = v21;
  objc_msgSend(v3, sel_transformForImage);
  v23 = atan2(v33.b, v33.a);
  *(_QWORD *)&v33.a = __PAIR64__(v12, v11);
  v33.b = v20;
  v33.c = v22;
  v33.d = v23;
  LOBYTE(v33.tx) = v13;
  swift_getKeyPath();
  v29 = v5;
  sub_21306842C();
  swift_release();
  v24 = *(_QWORD *)(*(_QWORD *)&v5 + 40);
  v25 = *(_BYTE *)(*(_QWORD *)&v5 + 48);
  v29 = *(double *)(*(_QWORD *)&v5 + 16);
  v30 = *(_OWORD *)(*(_QWORD *)&v5 + 24);
  v31 = v24;
  v32 = v25;
  result = _s19ComplicationDisplay0A17CurvedTextMetricsV2eeoiySbAC_ACtFZ_0((uint64_t)&v33, (uint64_t)&v29);
  if ((result & 1) == 0)
  {
    *(_QWORD *)&v33.a = __PAIR64__(v12, v11);
    v33.b = v20;
    v33.c = v22;
    v33.d = v23;
    LOBYTE(v33.tx) = v13;
    KeyPath = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](KeyPath);
    v29 = v5;
    sub_213068420();
    return swift_release();
  }
  return result;
}

void sub_213061914(char *a1)
{
  uint64_t v1;
  id v3;
  id v4;
  void *v5;
  id v6;
  float *v7;
  char **v8;
  id v9;

  v3 = objc_msgSend((id)objc_opt_self(), sel_systemFontOfSize_weight_design_, *MEMORY[0x24BDB8650], *(float *)v1, *MEMORY[0x24BEBB600]);
  v4 = objc_msgSend(v3, sel_CLKFontWithAlternativePunctuation);

  if (!v4)
  {
    __break(1u);
    goto LABEL_8;
  }
  v9 = objc_msgSend(v4, sel_CLKFontWithLooplessThaiFallback);

  if (!v9)
  {
LABEL_8:
    __break(1u);
    return;
  }
  v5 = *(void **)&a1[OBJC_IVAR____TtC19ComplicationDisplay23CenteringCurvedTextView_curvedLabelView];
  objc_msgSend(v5, sel_setTracking_, *(float *)(v1 + 20));
  objc_msgSend(v5, sel_setFont_, v9);
  v6 = sub_213061B10();
  objc_msgSend(v5, sel_setTextColor_, v6);

  if (*(_QWORD *)(v1 + 64))
  {
    objc_msgSend(v5, sel_setPath_);
    objc_msgSend(v5, sel_setTextAlignment_, qword_21306D328[*(char *)(v1 + 52)]);
    v7 = (float *)(v1 + 56);
    v8 = &selRef_setBaselineOffset_;
  }
  else
  {
    *(_OWORD *)&a1[OBJC_IVAR____TtC19ComplicationDisplay23CenteringCurvedTextView_circleCenter] = *(_OWORD *)(v1 + 24);
    objc_msgSend(v5, sel_setInterior_, *(unsigned __int8 *)(v1 + 16));
    objc_msgSend(v5, sel_setImagePlacement_, *(unsigned __int8 *)(v1 + 72));
    objc_msgSend(v5, sel_setCircleRadius_, *(float *)(v1 + 40));
    objc_msgSend(v5, sel_setMaxAngularWidth_, *(float *)(v1 + 44));
    v7 = (float *)(v1 + 48);
    v8 = &selRef_setCenterAngle_;
  }
  objc_msgSend(v5, *v8, *v7);
  sub_213061C54(a1);
  sub_213061520(a1);

}

id sub_213061B10()
{
  void *v0;
  id v1;
  double v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_2130684A4();
  swift_release();
  swift_release();
  if (v3 == 0.0)
  {
    v0 = (void *)sub_21306899C();
    if (v0)
    {
LABEL_3:
      v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithCGColor_, v0);

      return v1;
    }
  }
  else
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_2130684A4();
    swift_release();
    swift_release();
    v0 = (void *)sub_21306899C();
    swift_release();
    if (v0)
      goto LABEL_3;
  }
  return objc_msgSend((id)objc_opt_self(), sel_whiteColor);
}

void sub_213061C54(char *a1)
{
  uint64_t v1;
  char *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  void **v12;
  void *v13;
  _QWORD *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  double v32;
  unsigned __int8 v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  id v39;
  uint64_t v40;

  v2 = a1;
  v3 = *(_QWORD *)(v1 + 96);
  v38 = *(_QWORD *)(v3 + 16);
  if (v38)
  {
    v4 = (void *)objc_opt_self();
    v5 = *(void **)&v2[OBJC_IVAR____TtC19ComplicationDisplay23CenteringCurvedTextView_curvedLabelView];
    swift_bridgeObjectRetain();
    v6 = 0;
    v36 = v1;
    v37 = v2;
    v34 = v3;
    v35 = v4;
    while (1)
    {
      v39 = *(id *)(v3 + 8 * v6 + 32);
      v7 = objc_msgSend(v39, sel_imageProvider);
      if (v7)
      {
        type metadata accessor for WidgetNamedImageProvider(0);
        v8 = swift_dynamicCastClass();
        if (v8)
        {
          v9 = v8;
          v10 = v7;
          v11 = objc_msgSend(v5, sel_font);
          v12 = (void **)(v9 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_font);
          swift_beginAccess();
          v13 = *v12;
          *v12 = v11;
          v1 = v36;
          v2 = v37;

          v14 = (_QWORD *)(v9 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_scale);
          swift_beginAccess();
          *v14 = 2;

        }
      }
      v15 = objc_msgSend(v5, sel_imageView);
      if (v15)
      {
        v16 = v15;
        v17 = (void *)swift_dynamicCastObjCProtocolConditional();
        if (!v17)

      }
      else
      {
        v17 = 0;
      }
      if ((objc_msgSend(v4, sel_existingImageView_supportsImageProvider_, v17, v7) & 1) == 0)
      {
        v18 = objc_msgSend(v4, sel_viewForImageProvider_, v7);
        objc_msgSend(v5, sel_setImageView_, v18);

        v17 = v18;
      }
      if (v17)
      {
        type metadata accessor for WidgetNamedImageView();
        v19 = swift_dynamicCastClass();
        if (v19)
        {
          v20 = v19;
          swift_getKeyPath();
          swift_getKeyPath();
          v21 = v17;
          sub_2130684A4();
          swift_release();
          swift_release();
          *(_QWORD *)(v20 + OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_monochromeFraction) = v40;
          v22 = *(void **)(v20 + OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_imageProvider);
          if (v22 && (type metadata accessor for WidgetNamedImageProvider(0), (v23 = swift_dynamicCastClass()) != 0))
          {
            v24 = v23;
            v25 = *(void **)(v20 + OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_color);
            v26 = v22;
            if (v25)
              MEMORY[0x2199A9B24](v25);
            swift_getObjectType();
            v40 = v24;
            sub_21306352C();
            v27 = v22;
            swift_retain();
            sub_213068AB0();
            sub_2130686C0();

            swift_release();
          }
          else
          {

          }
          v3 = v34;
          v1 = v36;
          v2 = v37;
        }
        v28 = v17;
        v29 = sub_213061B10();
        objc_msgSend(v28, sel_setColor_, v29);

        objc_msgSend(v28, sel_setImageProvider_, v7);
        v4 = v35;
      }
      v30 = objc_msgSend(v39, sel_textProvider);
      objc_msgSend(v5, sel_setTextProvider_, v30);
      if (!v7 || v30)
      {
        v32 = *(float *)(v1 + 76);
      }
      else
      {
        v31 = (void *)sub_213068B34();
        objc_msgSend(v5, sel_setText_, v31);

        v32 = 0.0;
      }
      objc_msgSend(v5, sel_setImagePadding_, v32);
      objc_msgSend(v2, sel_layoutSubviews);
      v33 = objc_msgSend(v5, sel_isTextTruncated);

      if ((v33 & 1) == 0)
        break;
      ++v6;

      if (v38 == v6)
      {
        swift_bridgeObjectRelease();
        return;
      }
    }
    swift_bridgeObjectRelease();

  }
  else
  {
    objc_msgSend(*(id *)&a1[OBJC_IVAR____TtC19ComplicationDisplay23CenteringCurvedTextView_curvedLabelView], sel_setTextProvider_, 0);
  }
}

uint64_t sub_213062134()
{
  sub_21304C434((unint64_t *)&unk_254B6F9A0, (uint64_t (*)(uint64_t))type metadata accessor for ComplicationCurvedTextViewRepresentable, (uint64_t)&unk_21306D110);
  return sub_21306875C();
}

uint64_t sub_21306219C()
{
  sub_21304C434((unint64_t *)&unk_254B6F9A0, (uint64_t (*)(uint64_t))type metadata accessor for ComplicationCurvedTextViewRepresentable, (uint64_t)&unk_21306D110);
  return sub_213068708();
}

void sub_213062204()
{
  sub_21304C434((unint64_t *)&unk_254B6F9A0, (uint64_t (*)(uint64_t))type metadata accessor for ComplicationCurvedTextViewRepresentable, (uint64_t)&unk_21306D110);
  sub_213068750();
  __break(1u);
}

uint64_t sub_213062374()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  _QWORD v8[6];

  v1 = (void *)objc_opt_self();
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = v0;
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = sub_213063748;
  *(_QWORD *)(v3 + 24) = v2;
  v8[4] = sub_213063760;
  v8[5] = v3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 1107296256;
  v8[2] = sub_213061058;
  v8[3] = &block_descriptor_24;
  v4 = _Block_copy(v8);
  v5 = v0;
  swift_retain();
  swift_release();
  objc_msgSend(v1, sel_performWithoutAnimation_, v4);
  _Block_release(v4);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
    __break(1u);
  return result;
}

id sub_2130624A8(char *a1)
{
  void *v2;
  id v3;
  double v4;
  double v5;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v11.receiver = a1;
  v11.super_class = (Class)type metadata accessor for CenteringCurvedTextView();
  objc_msgSendSuper2(&v11, sel_layoutSubviews);
  v2 = *(void **)&a1[OBJC_IVAR____TtC19ComplicationDisplay23CenteringCurvedTextView_curvedLabelView];
  v3 = objc_msgSend(v2, sel_path);

  if (!v3)
  {
    v9 = 0.0;
    v10 = 0.0;
    v7 = 0;
    v8 = 0;
    objc_msgSend(v2, sel_getTextCenter_startAngle_endAngle_, &v9, &v8, &v7);
    v4 = *(double *)&a1[OBJC_IVAR____TtC19ComplicationDisplay23CenteringCurvedTextView_circleCenter] - v9;
    v5 = *(double *)&a1[OBJC_IVAR____TtC19ComplicationDisplay23CenteringCurvedTextView_circleCenter + 8] - v10;
    objc_msgSend(v2, sel_frame);
    objc_msgSend(v2, sel_setFrame_, v4, v5);
  }
  return objc_msgSend(v2, sel_sizeToFit);
}

id sub_2130625FC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CenteringCurvedTextView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id ComplicationCurvedTextConfiguration.ContentProvider.textProvider.getter()
{
  id *v0;
  id v1;
  id v2;

  v1 = *v0;
  v2 = *v0;
  return v1;
}

void ComplicationCurvedTextConfiguration.ContentProvider.textProvider.setter(void *a1)
{
  id *v1;

  *v1 = a1;
}

uint64_t (*ComplicationCurvedTextConfiguration.ContentProvider.textProvider.modify())()
{
  return nullsub_1;
}

void *ComplicationCurvedTextConfiguration.ContentProvider.imageProvider.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 8);
  v2 = v1;
  return v1;
}

void ComplicationCurvedTextConfiguration.ContentProvider.imageProvider.setter(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 8) = a1;
}

uint64_t (*ComplicationCurvedTextConfiguration.ContentProvider.imageProvider.modify())()
{
  return nullsub_1;
}

uint64_t ComplicationCurvedTextConfiguration.ContentProvider.init(textProvider:imageProvider:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

uint64_t type metadata accessor for CenteringCurvedTextView()
{
  return objc_opt_self();
}

_QWORD *_s15ContentProviderVwCP(_QWORD *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v5 = v3;
  v6 = v4;
  return a1;
}

void _s15ContentProviderVwxx(id *a1)
{

}

uint64_t _s15ContentProviderVwca(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *(void **)a1;
  v5 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v5;

  v7 = *(void **)(a1 + 8);
  v8 = *(void **)(a2 + 8);
  *(_QWORD *)(a1 + 8) = v8;
  v9 = v8;

  return a1;
}

uint64_t _s15ContentProviderVwta(uint64_t a1, _OWORD *a2)
{
  void *v4;

  v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  return a1;
}

uint64_t _s15ContentProviderVwet(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 16))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t _s15ContentProviderVwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for ComplicationCurvedTextConfiguration.ContentProvider()
{
  return &type metadata for ComplicationCurvedTextConfiguration.ContentProvider;
}

_QWORD *sub_2130628C0(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = (_QWORD *)a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v15 = *a2;
    *v3 = *a2;
    v3 = (_QWORD *)(v15 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_DWORD *)a1 = *(_DWORD *)a2;
    *(_QWORD *)(a1 + 8) = a2[1];
    *(_BYTE *)(a1 + 16) = *((_BYTE *)a2 + 16);
    *(_DWORD *)(a1 + 20) = *((_DWORD *)a2 + 5);
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 3);
    *(_QWORD *)(a1 + 40) = a2[5];
    *(_DWORD *)(a1 + 48) = *((_DWORD *)a2 + 12);
    *(_BYTE *)(a1 + 52) = *((_BYTE *)a2 + 52);
    *(_DWORD *)(a1 + 56) = *((_DWORD *)a2 + 14);
    v5 = (void *)a2[8];
    *(_QWORD *)(a1 + 64) = v5;
    *(_BYTE *)(a1 + 72) = *((_BYTE *)a2 + 72);
    *(_DWORD *)(a1 + 76) = *((_DWORD *)a2 + 19);
    *(_OWORD *)(a1 + 80) = *((_OWORD *)a2 + 5);
    v6 = (void *)a2[13];
    *(_QWORD *)(a1 + 96) = a2[12];
    *(_QWORD *)(a1 + 104) = v6;
    v7 = *(int *)(a3 + 32);
    v8 = (_QWORD *)(a1 + v7);
    v9 = (uint64_t *)((char *)a2 + v7);
    *(_QWORD *)(a1 + 112) = a2[14];
    swift_retain();
    v10 = v5;
    swift_bridgeObjectRetain();
    v11 = v6;
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F8D8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v12 = sub_2130685D0();
      v13 = *(_QWORD *)(v12 - 8);
      if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v13 + 48))(v9, 1, v12))
      {
        v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F8E0);
        memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v13 + 16))(v8, v9, v12);
        (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v8, 0, 1, v12);
      }
    }
    else
    {
      *v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return v3;
}

uint64_t sub_213062A8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  swift_release();

  swift_bridgeObjectRelease();
  swift_release();
  v4 = a1 + *(int *)(a2 + 32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F8D8);
  if (swift_getEnumCaseMultiPayload() != 1)
    return swift_release();
  v5 = sub_2130685D0();
  v6 = *(_QWORD *)(v5 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  return result;
}

uint64_t sub_213062B5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 52) = *(_BYTE *)(a2 + 52);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  v4 = *(void **)(a2 + 64);
  *(_QWORD *)(a1 + 64) = v4;
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_DWORD *)(a1 + 76) = *(_DWORD *)(a2 + 76);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  v5 = *(void **)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v5;
  v6 = *(int *)(a3 + 32);
  v7 = (_QWORD *)(a1 + v6);
  v8 = (_QWORD *)(a2 + v6);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  swift_retain();
  v9 = v4;
  swift_bridgeObjectRetain();
  v10 = v5;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F8D8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v11 = sub_2130685D0();
    v12 = *(_QWORD *)(v11 - 8);
    if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v12 + 48))(v8, 1, v11))
    {
      v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F8E0);
      memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v12 + 16))(v7, v8, v11);
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v7, 0, 1, v11);
    }
  }
  else
  {
    *v7 = *v8;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_213062CFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(_DWORD *)(a1 + 44) = *(_DWORD *)(a2 + 44);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 52) = *(_BYTE *)(a2 + 52);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  v6 = *(void **)(a1 + 64);
  v7 = *(void **)(a2 + 64);
  *(_QWORD *)(a1 + 64) = v7;
  v8 = v7;

  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_DWORD *)(a1 + 76) = *(_DWORD *)(a2 + 76);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v9 = *(void **)(a2 + 104);
  v10 = *(void **)(a1 + 104);
  *(_QWORD *)(a1 + 104) = v9;
  v11 = v9;

  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    v12 = *(int *)(a3 + 32);
    v13 = (_QWORD *)(a1 + v12);
    v14 = (_QWORD *)(a2 + v12);
    sub_213062EF8(a1 + v12);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F8D8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v15 = sub_2130685D0();
      v16 = *(_QWORD *)(v15 - 8);
      if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
      {
        v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F8E0);
        memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v16 + 16))(v13, v14, v15);
        (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
      }
    }
    else
    {
      *v13 = *v14;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_213062EF8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F8D8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_213062F38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  v7 = *(int *)(a3 + 32);
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F8D8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v11 = sub_2130685D0();
    v12 = *(_QWORD *)(v11 - 8);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48))(v9, 1, v11))
    {
      v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F8E0);
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v12 + 32))(v8, v9, v11);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v8, 0, 1, v11);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
  }
  return a1;
}

uint64_t sub_213063060(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 52) = *(_BYTE *)(a2 + 52);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  v6 = *(void **)(a1 + 64);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);

  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_DWORD *)(a1 + 76) = *(_DWORD *)(a2 + 76);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_bridgeObjectRelease();
  v7 = *(void **)(a1 + 104);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);

  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  swift_release();
  if (a1 != a2)
  {
    v8 = *(int *)(a3 + 32);
    v9 = (void *)(a1 + v8);
    v10 = (const void *)(a2 + v8);
    sub_213062EF8(a1 + v8);
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F8D8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v12 = sub_2130685D0();
      v13 = *(_QWORD *)(v12 - 8);
      if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v13 + 48))(v10, 1, v12))
      {
        v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F8E0);
        memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, const void *, uint64_t))(v13 + 32))(v9, v10, v12);
        (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v9, 0, 1, v12);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_213063220()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21306322C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(qword_254B6F8E8);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 32), a2, v8);
  }
}

uint64_t sub_2130632AC()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2130632B8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(qword_254B6F8E8);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 32), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for ComplicationCurvedTextViewRepresentable()
{
  uint64_t result;

  result = qword_254B6F948;
  if (!qword_254B6F948)
    return swift_getSingletonMetadata();
  return result;
}

void sub_21306336C()
{
  unint64_t v0;

  sub_213063408();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_213063408()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254B6F958[0])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B6F8E0);
    v0 = sub_2130684E0();
    if (!v1)
      atomic_store(v0, qword_254B6F958);
  }
}

uint64_t sub_213063460()
{
  return sub_21304C434((unint64_t *)&qword_254B6F0F0, (uint64_t (*)(uint64_t))type metadata accessor for ComplicationCurvedTextViewRepresentable, (uint64_t)&unk_21306D1A0);
}

uint64_t sub_213063494(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F8E0);
  MEMORY[0x24BDAC7A8](v2);
  sub_2130637AC(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  return sub_213068654();
}

double sub_21306350C()
{
  uint64_t v0;
  double result;

  *(_QWORD *)&result = sub_213055A0C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24)).n128_u64[0];
  return result;
}

unint64_t sub_21306352C()
{
  unint64_t result;

  result = qword_254B6F9B0;
  if (!qword_254B6F9B0)
  {
    result = MEMORY[0x2199AA6AC](&unk_21306D444, &type metadata for WidgetNamedImageView.NamedImageView);
    atomic_store(result, (unint64_t *)&qword_254B6F9B0);
  }
  return result;
}

uint64_t sub_213063578()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_21306359C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for ComplicationCurvedTextViewRepresentable();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  swift_release();
  v3 = v0 + ((v2 + 24) & ~v2);
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();
  v4 = v3 + *(int *)(v1 + 32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F8D8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v5 = sub_2130685D0();
    v6 = *(_QWORD *)(v5 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5))
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  return swift_deallocObject();
}

uint64_t sub_213063698(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ComplicationCurvedTextViewRepresentable();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_2130636DC()
{
  uint64_t v0;

  type metadata accessor for ComplicationCurvedTextViewRepresentable();
  sub_2130614BC(*(_QWORD *)(v0 + 16));
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

uint64_t sub_213063724()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_213063748()
{
  uint64_t v0;

  return sub_2130624A8(*(char **)(v0 + 16));
}

uint64_t sub_213063750()
{
  return swift_deallocObject();
}

uint64_t sub_213063760()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_213063780()
{
  return sub_213068648();
}

uint64_t sub_2130637AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B6F8E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

id ApricotNamedImageProvider.__allocating_init(_:)(uint64_t a1)
{
  objc_class *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  id v8;
  uint64_t v10;

  v3 = sub_21306887C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = objc_allocWithZone(v1);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, v3);
  v8 = WidgetNamedImageProvider.init(_:)((uint64_t)v6);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return v8;
}

id ApricotNamedImageProvider.init(_:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  uint64_t v8;

  v2 = sub_21306887C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  v6 = WidgetNamedImageProvider.init(_:)((uint64_t)v5);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  return v6;
}

id WidgetNamedImageProvider.init(_:)(uint64_t a1)
{
  _BYTE *v1;
  _QWORD *v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[6];
  objc_super v12;

  *(_QWORD *)&v1[OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_font] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_scale] = 2;
  v1[OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_finalized] = 0;
  v3 = &v1[OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider__maxSize];
  *v3 = 0;
  v3[1] = 0;
  v4 = &v1[OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_named];
  v5 = sub_21306887C();
  v6 = *(_QWORD *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v4, a1, v5);
  v12.receiver = v1;
  v12.super_class = (Class)type metadata accessor for WidgetNamedImageProvider(0);
  v7 = objc_msgSendSuper2(&v12, sel_initPrivate);
  v11[4] = sub_213064594;
  v11[5] = 0;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 1107296256;
  v11[2] = sub_2130645D4;
  v11[3] = &block_descriptor_5;
  v8 = _Block_copy(v11);
  v9 = v7;
  objc_msgSend(v9, sel_setImageViewCreationHandler_, v8);
  _Block_release(v8);

  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
  return v9;
}

uint64_t type metadata accessor for WidgetNamedImageProvider(uint64_t a1)
{
  return sub_213064650(a1, (uint64_t *)&unk_254B6FAF8);
}

id ApricotNamedImageProvider.__deallocating_deinit()
{
  return sub_213064B9C(0, (uint64_t (*)(void))type metadata accessor for ApricotNamedImageProvider);
}

uint64_t sub_213063AE8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_named;
  swift_beginAccess();
  v4 = sub_21306887C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_213063B4C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_named;
  swift_beginAccess();
  v4 = sub_21306887C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
  return swift_endAccess();
}

uint64_t (*sub_213063BB8())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void *sub_213063BFC()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_font);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_213063C48(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_font);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*sub_213063C98())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_213063CDC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_scale;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t sub_213063D20(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_scale);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_213063D68())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_213063DAC(double a1, double a2)
{
  uint64_t v2;
  uint64_t v3;
  double *v4;

  v3 = OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_finalized;
  if ((*(_BYTE *)(v2 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_finalized) & 1) == 0)
  {
    v4 = (double *)(v2 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider__maxSize);
    *v4 = a1;
    v4[1] = a2;
    *(_BYTE *)(v2 + v3) = 1;
  }
}

uint64_t sub_213063DD8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  void (*v18)(char *, uint64_t, uint64_t);
  void (*v19)(char *, uint64_t);
  char *v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  char *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  char *v29;
  uint64_t v30;
  int v31;
  char *v32;
  void (*v33)(char *, uint64_t, uint64_t);
  uint64_t v34;
  char *v35;
  void (*v36)(char *, uint64_t);
  double v37;
  uint64_t *v38;
  uint64_t v39;
  _QWORD *v40;
  id v41;
  _QWORD *v42;
  char *v43;
  id v44;
  uint64_t v45;
  void *v46;
  void *v47;
  char *v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;

  v1 = sub_2130683FC();
  v2 = *(_QWORD *)(v1 - 8);
  v52 = v1;
  v53 = v2;
  MEMORY[0x24BDAC7A8](v1);
  v51 = (char *)&v49 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_213068864();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (unsigned __int8 *)&v49 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_21306887C();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v49 = (char *)&v49 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v49 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v49 - v15;
  v50 = v0;
  v17 = v0 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_named;
  swift_beginAccess();
  v18 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v18(v16, v17, v8);
  sub_213068870();
  v19 = *(void (**)(char *, uint64_t))(v9 + 8);
  v20 = v16;
  v21 = v8;
  v19(v20, v8);
  v22 = (*(uint64_t (**)(unsigned __int8 *, uint64_t))(v5 + 88))(v7, v4);
  if (v22 == *MEMORY[0x24BDF0D48])
  {
    (*(void (**)(unsigned __int8 *, uint64_t))(v5 + 96))(v7, v4);
    v23 = v52;
    v24 = v51;
    (*(void (**)(char *, unsigned __int8 *, uint64_t))(v53 + 32))(v51, v7, v52);
    v25 = (void *)sub_2130683F0();
    v26 = (id)CLKUniqueBundle();

    v18(v14, v17, v21);
    sub_213068840();
    v19(v14, v21);
    v27 = (void *)sub_213068B34();
    swift_bridgeObjectRelease();
    v28 = objc_msgSend((id)objc_opt_self(), sel_imageNamed_inBundle_compatibleWithTraitCollection_, v27, v26, 0);

    (*(void (**)(char *, uint64_t))(v53 + 8))(v24, v23);
  }
  else
  {
    v53 = v17;
    v29 = v49;
    v30 = v50;
    if (v22 == *MEMORY[0x24BDF0D50])
    {
      (*(void (**)(unsigned __int8 *, uint64_t))(v5 + 96))(v7, v4);
      v31 = *v7;
      v32 = v29;
      v33 = v18;
      v18(v29, v53, v8);
      v34 = sub_21306884C();
      v35 = v32;
      v36 = v19;
      v19(v35, v8);
      if ((v34 & 0x100000000) != 0)
        v37 = 1.0;
      else
        v37 = *(float *)&v34;
      v38 = (uint64_t *)(v30 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_font);
      swift_beginAccess();
      v39 = *v38;
      if (v39)
      {
        v40 = (_QWORD *)(v30 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_scale);
        swift_beginAccess();
        v41 = objc_msgSend((id)objc_opt_self(), sel_configurationWithFont_scale_, v39, *v40);
      }
      else
      {
        v42 = (_QWORD *)(v30 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_scale);
        swift_beginAccess();
        v41 = objc_msgSend((id)objc_opt_self(), sel_configurationWithScale_, *v42);
      }
      v43 = v14;
      v44 = v41;
      v45 = v53;
      if (v31)
      {
        v46 = (void *)objc_opt_self();
        v33(v43, v45, v8);
        sub_213068840();
        v36(v43, v8);
        v47 = (void *)sub_213068B34();
        swift_bridgeObjectRelease();
        v28 = objc_msgSend(v46, sel_cd_internalSystemName_variableValue_withConfiguration_, v47, v44, v37);

      }
      else
      {
        sub_2130520D8(0, &qword_254B6FA90);
        v33(v14, v45, v8);
        sub_213068840();
        v36(v14, v8);
        return sub_213068BE8();
      }
    }
    else
    {
      (*(void (**)(unsigned __int8 *, uint64_t))(v5 + 8))(v7, v4);
      return 0;
    }
  }
  return (uint64_t)v28;
}

uint64_t sub_2130642A8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_named;
  swift_beginAccess();
  v4 = sub_21306887C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, v3, v4);
}

uint64_t sub_213064310(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;

  v4 = sub_21306887C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  v8 = *a2 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_named;
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 40))(v8, v7, v4);
  return swift_endAccess();
}

void sub_213064478(void **a1, _QWORD *a2)
{
  void *v2;
  void **v3;
  void *v4;
  id v5;

  v2 = *a1;
  v3 = (void **)(*a2 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_font);
  swift_beginAccess();
  v4 = *v3;
  *v3 = v2;
  v5 = v2;

}

id WidgetNamedImageProvider.__allocating_init(_:)(uint64_t a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return WidgetNamedImageProvider.init(_:)(a1);
}

char *sub_213064594(double a1, double a2)
{
  id v4;

  v4 = objc_allocWithZone((Class)type metadata accessor for WidgetNamedImageView());
  return sub_2130655CC(a1, a2);
}

id sub_2130645D4(uint64_t a1, double a2, double a3)
{
  uint64_t (*v5)(uint64_t, double, double);
  uint64_t v6;
  void *v7;

  v5 = *(uint64_t (**)(uint64_t, double, double))(a1 + 32);
  v6 = swift_retain();
  v7 = (void *)v5(v6, a2, a3);
  swift_release();
  return v7;
}

uint64_t block_copy_helper_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_5()
{
  return swift_release();
}

uint64_t type metadata accessor for ApricotNamedImageProvider(uint64_t a1)
{
  return sub_213064650(a1, (uint64_t *)&unk_254B6FAE8);
}

uint64_t sub_213064650(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

__n128 sub_21306470C@<Q0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  objc_class *v9;
  id v10;
  _BYTE *v11;
  void **v12;
  void *v13;
  void **v14;
  void *v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  _QWORD *v19;
  __n128 result;
  uint64_t v21;

  v2 = v1;
  v4 = sub_21306887C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = v2 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_named;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  v9 = (objc_class *)type metadata accessor for WidgetNamedImageProvider(0);
  v10 = objc_allocWithZone(v9);
  v11 = WidgetNamedImageProvider.init(_:)((uint64_t)v7);
  v12 = (void **)(v2 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_font);
  swift_beginAccess();
  v13 = *v12;
  v14 = (void **)&v11[OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_font];
  swift_beginAccess();
  v15 = *v14;
  *v14 = v13;
  v16 = v13;

  v17 = (uint64_t *)(v2 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_scale);
  swift_beginAccess();
  v18 = *v17;
  v19 = &v11[OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_scale];
  swift_beginAccess();
  *v19 = v18;
  v11[OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_finalized] = *(_BYTE *)(v2
                                                                                            + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_finalized);
  result = *(__n128 *)(v2 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider__maxSize);
  *(__n128 *)&v11[OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider__maxSize] = result;
  a1[3] = v9;
  *a1 = v11;
  return result;
}

double sub_213064904()
{
  uint64_t v0;

  return *(double *)(v0 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider__maxSize);
}

id WidgetNamedImageProvider.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void WidgetNamedImageProvider.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id WidgetNamedImageProvider.__allocating_init(jsonObjectRepresentation:bundle:)(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v4;
  void *v5;
  id v6;

  v4 = objc_allocWithZone(v2);
  v5 = (void *)sub_213068B1C();
  swift_bridgeObjectRelease();
  v6 = objc_msgSend(v4, sel_initWithJSONObjectRepresentation_bundle_, v5, a2);

  return v6;
}

void WidgetNamedImageProvider.init(jsonObjectRepresentation:bundle:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id WidgetNamedImageProvider.__allocating_init(private:)()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_initPrivate);
}

void WidgetNamedImageProvider.init(private:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id WidgetNamedImageProvider.__allocating_init(foregroundAccentImage:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithForegroundAccentImage_, a1);

  return v3;
}

void WidgetNamedImageProvider.init(foregroundAccentImage:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id WidgetNamedImageProvider.__deallocating_deinit()
{
  return sub_213064B9C(0, (uint64_t (*)(void))type metadata accessor for WidgetNamedImageProvider);
}

id sub_213064B9C(uint64_t a1, uint64_t (*a2)(void))
{
  void *v2;
  objc_super v4;

  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

id sub_213064BD4@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  void **v3;
  void *v4;

  v3 = (void **)(*a1 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_font);
  swift_beginAccess();
  v4 = *v3;
  *a2 = *v3;
  return v4;
}

uint64_t sub_213064C28@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_scale);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_213064C78(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_scale);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

uint64_t sub_213064CC4()
{
  return type metadata accessor for ApricotNamedImageProvider(0);
}

uint64_t sub_213064CCC()
{
  return swift_updateClassMetadata2();
}

uint64_t sub_213064D50()
{
  return type metadata accessor for WidgetNamedImageProvider(0);
}

uint64_t sub_213064D58()
{
  uint64_t result;
  unint64_t v1;

  result = sub_21306887C();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for WidgetNamedImageProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of WidgetNamedImageProvider.named.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of WidgetNamedImageProvider.named.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of WidgetNamedImageProvider.named.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of WidgetNamedImageProvider.font.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of WidgetNamedImageProvider.font.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of WidgetNamedImageProvider.font.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of WidgetNamedImageProvider.scale.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of WidgetNamedImageProvider.scale.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of WidgetNamedImageProvider.scale.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of WidgetNamedImageProvider.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 240))();
}

uint64_t dispatch thunk of WidgetNamedImageProvider.finalize(maxSize:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of WidgetNamedImageProvider.uiImage.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x100))();
}

uint64_t sub_213064F38@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t KeyPath;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  void (*v31)(char *, uint64_t, uint64_t);
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;

  v48 = a1;
  v51 = a3;
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B6FC70);
  v4 = *(_QWORD *)(v52 - 8);
  MEMORY[0x24BDAC7A8](v52);
  v6 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B6FC78);
  MEMORY[0x24BDAC7A8](v49);
  v50 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B6FC80);
  MEMORY[0x24BDAC7A8](v47);
  v9 = (char *)&v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B6FC88);
  MEMORY[0x24BDAC7A8](v42);
  v11 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B6FC90);
  MEMORY[0x24BDAC7A8](v43);
  v45 = (uint64_t)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B6FC98);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v41 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B6FCA0);
  MEMORY[0x24BDAC7A8](v44);
  v17 = (char *)&v41 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B6FCA8);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v41 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B6FCB0);
  v22 = MEMORY[0x24BDAC7A8](v21);
  v46 = (char *)&v41 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2 && (v24 = a2[2]) != 0)
  {
    v41 = v22;
    if (v24 == 2)
    {
      v34 = a2[4];
      v35 = a2[5];
      (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v11, v48, v52);
      v36 = &v11[*(int *)(v42 + 36)];
      *(_QWORD *)v36 = v34;
      *((_QWORD *)v36 + 1) = v35;
      sub_21304F2CC((uint64_t)v11, (uint64_t)v15, &qword_254B6FC88);
      swift_storeEnumTagMultiPayload();
      sub_213067B1C();
      sub_213067BB8();
      swift_retain();
      swift_retain();
      sub_213068780();
      sub_21304F2CC((uint64_t)v17, v45, &qword_254B6FCA0);
      swift_storeEnumTagMultiPayload();
      sub_213067AF8();
      sub_213067C54();
      v28 = (uint64_t)v46;
      sub_213068780();
      sub_21304F310((uint64_t)v17, &qword_254B6FCA0);
      v29 = (uint64_t)v11;
      v30 = &qword_254B6FC88;
    }
    else if (v24 == 1)
    {
      v25 = a2[4];
      KeyPath = swift_getKeyPath();
      (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v20, v48, v52);
      v27 = (uint64_t *)&v20[*(int *)(v18 + 36)];
      *v27 = KeyPath;
      v27[1] = v25;
      sub_21304F2CC((uint64_t)v20, (uint64_t)v15, &qword_254B6FCA8);
      swift_storeEnumTagMultiPayload();
      sub_213067B1C();
      sub_213067BB8();
      swift_retain();
      sub_213068780();
      sub_21304F2CC((uint64_t)v17, v45, &qword_254B6FCA0);
      swift_storeEnumTagMultiPayload();
      sub_213067AF8();
      sub_213067C54();
      v28 = (uint64_t)v46;
      sub_213068780();
      sub_21304F310((uint64_t)v17, &qword_254B6FCA0);
      v29 = (uint64_t)v20;
      v30 = &qword_254B6FCA8;
    }
    else
    {
      v37 = a2[4];
      v38 = a2[5];
      v39 = a2[6];
      (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v9, v48, v52);
      v40 = &v9[*(int *)(v47 + 36)];
      *(_QWORD *)v40 = v37;
      *((_QWORD *)v40 + 1) = v38;
      *((_QWORD *)v40 + 2) = v39;
      sub_21304F2CC((uint64_t)v9, v45, &qword_254B6FC80);
      swift_storeEnumTagMultiPayload();
      sub_213067AF8();
      sub_213067C54();
      swift_retain();
      swift_retain();
      swift_retain();
      v28 = (uint64_t)v46;
      sub_213068780();
      v29 = (uint64_t)v9;
      v30 = &qword_254B6FC80;
    }
    sub_21304F310(v29, v30);
    sub_21304F2CC(v28, (uint64_t)v50, &qword_254B6FCB0);
    swift_storeEnumTagMultiPayload();
    sub_213067A88(&qword_254B6FCB8, &qword_254B6FCB0, sub_213067AF8, (uint64_t (*)(void))sub_213067C54);
    sub_21304B778(&qword_254B6FCD0, &qword_254B6FC70, MEMORY[0x24BDEFB78]);
    sub_213068780();
    return sub_21304F310(v28, &qword_254B6FCB0);
  }
  else
  {
    v31 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
    v32 = v52;
    v31(v6, v48, v52);
    v31(v50, (uint64_t)v6, v32);
    swift_storeEnumTagMultiPayload();
    sub_213067A88(&qword_254B6FCB8, &qword_254B6FCB0, sub_213067AF8, (uint64_t (*)(void))sub_213067C54);
    sub_21304B778(&qword_254B6FCD0, &qword_254B6FC70, MEMORY[0x24BDEFB78]);
    sub_213068780();
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v32);
  }
}

uint64_t sub_2130655C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  _QWORD **v2;

  return sub_213064F38(a1, *v2, a2);
}

char *sub_2130655CC(double a1, double a2)
{
  _BYTE *v2;
  double *v5;
  char *v6;
  uint64_t v7;
  void *v8;
  char *v9;
  uint64_t v10;
  char *result;
  char *v12;
  id v13;
  char *v14;
  void *v15;
  char *v16;
  char *v17;
  objc_super v18;

  *(_QWORD *)&v2[OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_baseline] = 0;
  *(_QWORD *)&v2[OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_imageProvider] = 0;
  *(_QWORD *)&v2[OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_monochromeFraction] = 0;
  *(_QWORD *)&v2[OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_color] = 0;
  v2[OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_usesLegibility] = 0;
  *(_QWORD *)&v2[OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_overrideColor] = 0;
  v5 = (double *)&v2[OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_maxSize];
  *v5 = a1;
  v5[1] = a2;
  v6 = v2;
  sub_213068AB0();
  v7 = sub_213068828();
  swift_release();
  swift_getObjectType();
  sub_2130520D8(0, (unint64_t *)&unk_254B6F730);
  v8 = (void *)dynamic_cast_existential_1_superclass_unconditional(v7);
  v9 = &v6[OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_hostingViewController];
  *(_QWORD *)v9 = v8;
  *((_QWORD *)v9 + 1) = v10;
  result = (char *)objc_msgSend(v8, sel_view);
  if (result)
  {
    v12 = result;
    v13 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
    objc_msgSend(v12, sel_setBackgroundColor_, v13);

    v18.receiver = v6;
    v18.super_class = (Class)type metadata accessor for WidgetNamedImageView();
    v14 = (char *)objc_msgSendSuper2(&v18, sel_initWithFrame_, 0.0, 0.0, a1, a2);
    v15 = *(void **)&v14[OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_hostingViewController];
    v16 = v14;
    result = (char *)objc_msgSend(v15, sel_view);
    if (result)
    {
      v17 = result;
      objc_msgSend(v16, sel_addSubview_, result);

      return v16;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_2130657E0()
{
  char *v0;
  id v1;
  void *v2;
  objc_super v3;
  CGRect v4;
  CGRect v5;

  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for WidgetNamedImageView();
  objc_msgSendSuper2(&v3, sel_layoutSubviews);
  v1 = objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_hostingViewController], sel_view);
  if (v1)
  {
    v2 = v1;
    objc_msgSend(v0, sel_bounds);
    v5 = CGRectOffset(v4, 0.0, *(CGFloat *)&v0[OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_baseline]);
    objc_msgSend(v2, sel_setFrame_, v5.origin.x, v5.origin.y, v5.size.width, v5.size.height);

  }
  else
  {
    __break(1u);
  }
}

void sub_213065924(void *a1)
{
  char *v1;
  char *v2;
  void *v3;
  BOOL v4;
  uint64_t v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v2 = v1;
  v3 = *(void **)&v1[OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_imageProvider];
  if (a1)
  {
    if (v3)
      v4 = a1 == v3;
    else
      v4 = 1;
    if (v4)
      return;
  }
  else if (!v3)
  {
    return;
  }
  type metadata accessor for WidgetNamedImageProvider(0);
  if (swift_dynamicCastClass())
  {
    v11 = v3;
    sub_213065A58();
    swift_getObjectType();
    sub_213068690();
    v5 = 0;
    objc_msgSend(v2, sel_setBounds_, 0.0, 0.0, v6, v7);
    v8 = (void *)sub_213063DD8();
    if (v8)
    {
      v9 = v8;
      objc_msgSend(v8, sel_cd_baselineOffsetFromBottom);
      v5 = v10;

    }
    *(_QWORD *)&v2[OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_baseline] = v5;
    objc_msgSend(v2, sel_setNeedsLayout);

  }
}

void sub_213065A58()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  id v4;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_imageProvider);
  if (v1)
  {
    type metadata accessor for WidgetNamedImageProvider(0);
    if (swift_dynamicCastClass())
    {
      v2 = *(void **)(v0 + OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_color);
      v3 = v1;
      if (v2)
        MEMORY[0x2199A9B24](v2);
      swift_getObjectType();
      sub_21306352C();
      v4 = v1;
      swift_retain();
      sub_213068AB0();
      sub_2130686C0();

      swift_release();
    }
  }
}

uint64_t sub_213065C1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  void (*v33)(char *, char *, uint64_t);
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(char *, uint64_t);
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t result;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t *v52;
  uint64_t v53;
  char *v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  unint64_t v60;
  unsigned int *v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t KeyPath;
  uint64_t *v66;
  id *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t *v76;
  char *v77;
  uint64_t v78;
  char *v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void (*v91)(char *, char *, uint64_t);
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  uint64_t v96;
  uint64_t *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  char *v105;
  uint64_t v106;
  char *v107;
  uint64_t v108;
  uint64_t v109;
  char *v110;
  uint64_t v111;
  char *v112;
  uint64_t *v113;
  uint64_t v115;

  v111 = a4;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B6FBD0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v90 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v109 = sub_213068864();
  v108 = *(_QWORD *)(v109 - 8);
  MEMORY[0x24BDAC7A8](v109);
  v107 = (char *)&v90 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B6FBD8);
  MEMORY[0x24BDAC7A8](v100);
  v97 = (uint64_t *)((char *)&v90 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v96 = sub_213068A14();
  v102 = *(_QWORD *)(v96 - 8);
  MEMORY[0x24BDAC7A8](v96);
  v101 = (char *)&v90 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B6FBE0);
  MEMORY[0x24BDAC7A8](v13);
  v112 = (char *)&v90 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B6FBE8);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v90 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v115 = sub_21306887C();
  v18 = *(_QWORD *)(v115 - 8);
  v19 = MEMORY[0x24BDAC7A8](v115);
  v105 = (char *)&v90 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v90 - v22;
  MEMORY[0x24BDAC7A8](v21);
  v25 = (char *)&v90 - v24;
  v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B6FBF0);
  MEMORY[0x24BDAC7A8](v98);
  v113 = (uint64_t *)((char *)&v90 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0));
  v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B6FBF8);
  MEMORY[0x24BDAC7A8](v99);
  v104 = (uint64_t)&v90 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B6FC00);
  v29 = MEMORY[0x24BDAC7A8](v28);
  v103 = (uint64_t)&v90 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v29);
  v106 = (uint64_t)&v90 - v31;
  v110 = (char *)a1;
  if (!sub_213067148(a1))
  {
    swift_storeEnumTagMultiPayload();
    sub_2130674C4();
    return sub_213068780();
  }
  v93 = v28;
  v94 = v7;
  v95 = v9;
  v92 = v18;
  if ((a3 & 1) == 0)
  {
    v32 = &v110[OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_named];
    swift_beginAccess();
    v33 = *(void (**)(char *, char *, uint64_t))(v18 + 16);
    v34 = a3;
    v35 = a2;
    v36 = v18;
    v37 = v115;
    v91 = v33;
    v33(v25, v32, v115);
    v38 = sub_213068858();
    v39 = *(void (**)(char *, uint64_t))(v36 + 8);
    v40 = v37;
    v18 = v36;
    a2 = v35;
    a3 = v34;
    v39(v25, v40);
    swift_bridgeObjectRelease();
    if (!v38)
      goto LABEL_9;
    v41 = v32;
    v42 = v115;
    v91(v23, v41, v115);
    v43 = sub_213068858();
    result = ((uint64_t (*)(char *, uint64_t))v39)(v23, v42);
    if (!v43)
    {
      __break(1u);
      return result;
    }
    v45 = *(_QWORD *)(v43 + 16);
    swift_bridgeObjectRelease();
    if (!v45)
    {
LABEL_9:
      swift_retain();
      goto LABEL_10;
    }
  }
  v46 = *MEMORY[0x24BDF4068];
  v47 = sub_213068A08();
  v48 = *(_QWORD *)(v47 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v48 + 104))(v17, v46, v47);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v48 + 56))(v17, 0, 1, v47);
  sub_2130689E4();
  sub_21304F310((uint64_t)v17, &qword_254B6FBE8);
  if ((a3 & 1) == 0)
  {
LABEL_10:
    v51 = v110;
    v52 = v97;
    v53 = v96;
    v54 = &v110[OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_named];
    swift_beginAccess();
    v55 = v54;
    v56 = v115;
    (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v25, v55, v115);
    sub_213068834();
    v49 = (uint64_t)v112;
    (*(void (**)(char *, uint64_t))(v18 + 8))(v25, v56);
    goto LABEL_11;
  }
  v49 = (uint64_t)v112;
  sub_2130686CC();
  v50 = sub_2130686D8();
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v50 - 8) + 56))(v49, 0, 1, v50);
  v51 = v110;
  v52 = v97;
  v53 = v96;
LABEL_11:
  v57 = sub_2130689FC();
  swift_release();
  sub_21304F310(v49, &qword_254B6FBE0);
  v58 = sub_213066564((uint64_t)v51, a2, a3 & 1);
  v59 = &v51[OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_scale];
  swift_beginAccess();
  v60 = *(_QWORD *)v59 - 1;
  if (v60 > 2)
    v61 = (unsigned int *)MEMORY[0x24BDF40B8];
  else
    v61 = (unsigned int *)qword_24CF236A0[v60];
  v62 = (uint64_t)v95;
  v63 = v102;
  v64 = v101;
  (*(void (**)(char *, _QWORD, uint64_t))(v102 + 104))(v101, *v61, v53);
  KeyPath = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v63 + 16))((char *)v52 + *(int *)(v100 + 28), v64, v53);
  *v52 = KeyPath;
  v66 = v113;
  sub_21304F2CC((uint64_t)v52, (uint64_t)v113 + *(int *)(v98 + 36), &qword_254B6FBD8);
  *v66 = v57;
  v66[1] = v58;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_21304F310((uint64_t)v52, &qword_254B6FBD8);
  (*(void (**)(char *, uint64_t))(v63 + 8))(v64, v53);
  swift_bridgeObjectRelease();
  swift_release();
  v67 = (id *)&v51[OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_font];
  swift_beginAccess();
  if (*v67)
  {
    v68 = *v67;
    v69 = sub_213068888();
  }
  else
  {
    v69 = 0;
  }
  v70 = v109;
  v71 = v99;
  v72 = v107;
  v73 = swift_getKeyPath();
  v74 = (uint64_t)v113;
  v75 = v104;
  sub_21304F2CC((uint64_t)v113, v104, &qword_254B6FBF0);
  v76 = (uint64_t *)(v75 + *(int *)(v71 + 36));
  *v76 = v73;
  v76[1] = v69;
  sub_21304F310(v74, &qword_254B6FBF0);
  v77 = &v51[OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_named];
  swift_beginAccess();
  v78 = v92;
  v79 = v105;
  v80 = v77;
  v81 = v115;
  (*(void (**)(char *, char *, uint64_t))(v92 + 16))(v105, v80, v115);
  sub_213068870();
  (*(void (**)(char *, uint64_t))(v78 + 8))(v79, v81);
  v82 = v108;
  LOBYTE(v79) = (*(unsigned int (**)(char *, uint64_t))(v108 + 88))(v72, v70) != *MEMORY[0x24BDF0D48];
  (*(void (**)(char *, uint64_t))(v82 + 8))(v72, v70);
  objc_msgSend(v51, sel_maxSize);
  v84 = v83;
  v86 = v85;
  v87 = v103;
  sub_21304F2CC(v75, v103, &qword_254B6FBF8);
  v88 = v87 + *(int *)(v93 + 36);
  *(_BYTE *)v88 = (_BYTE)v79;
  *(_QWORD *)(v88 + 8) = v84;
  *(_QWORD *)(v88 + 16) = v86;
  *(_BYTE *)(v88 + 24) = 0;
  sub_21304F310(v75, &qword_254B6FBF8);
  v89 = v106;
  sub_2130677A0(v87, v106);
  sub_21304F2CC(v89, v62, &qword_254B6FC00);
  swift_storeEnumTagMultiPayload();
  sub_2130674C4();
  sub_213068780();
  swift_release();
  return sub_21304F310(v89, &qword_254B6FC00);
}

uint64_t sub_213066564(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v15;

  v6 = sub_21306887C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = a1 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_named;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  v11 = sub_213068858();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  if ((a3 & 1) != 0)
  {
    if (!a2)
      return v11;
    goto LABEL_12;
  }
  if (!v11)
  {
    if (!a2)
      return 0;
    goto LABEL_12;
  }
  if (*(_QWORD *)(v11 + 16))
    v12 = 1;
  else
    v12 = a2 == 0;
  if (!v12)
  {
LABEL_12:
    swift_retain();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B6FC58);
    v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_21306BC10;
    *(_QWORD *)(v13 + 32) = a2;
    v15 = v13;
    sub_213068B94();
    return v15;
  }
  return v11;
}

uint64_t sub_2130666A4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_213065C1C(*(_QWORD *)v1, *(_QWORD *)(v1 + 8), *(_BYTE *)(v1 + 16), a1);
}

id sub_2130666DC(uint64_t a1)
{
  return sub_213064B9C(a1, type metadata accessor for WidgetNamedImageView);
}

uint64_t type metadata accessor for WidgetNamedImageView()
{
  return objc_opt_self();
}

uint64_t sub_213066760@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, int a5@<W4>, uint64_t a6@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  void (*v19)(char *, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;

  v24 = a5;
  v23 = a4;
  v25 = a6;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B6FD18);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B6FD20);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B6FD28);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v22 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
  {
    v19 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
    v19(v12, a1, v9);
    v19(v15, (uint64_t)v12, v9);
    swift_storeEnumTagMultiPayload();
    sub_213067D40();
    sub_21304B778(&qword_254B6FD48, &qword_254B6FD18, MEMORY[0x24BDEFB78]);
    sub_213068780();
    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  else
  {
    v21 = v23;
    *(_QWORD *)v18 = a3;
    *((_QWORD *)v18 + 1) = v21;
    v18[16] = v24 & 1;
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(&v18[*(int *)(v16 + 44)], a1, v9);
    sub_21304F2CC((uint64_t)v18, (uint64_t)v15, &qword_254B6FD28);
    swift_storeEnumTagMultiPayload();
    sub_213067D40();
    sub_21304B778(&qword_254B6FD48, &qword_254B6FD18, MEMORY[0x24BDEFB78]);
    sub_213068780();
    return sub_21304F310((uint64_t)v18, &qword_254B6FD28);
  }
}

uint64_t sub_213066998(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char v10;
  char v11;
  _QWORD v13[2];
  char v14;
  char v15;

  v13[1] = a6;
  v6 = sub_21306854C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2130685A0();
  sub_2130685DC();
  v15 = v10 & 1;
  v14 = v11 & 1;
  sub_213068534();
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_213066B08(uint64_t a1, char a2, uint64_t a3, char a4, uint64_t a5)
{
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v12;
  uint64_t result;

  v6 = v5;
  v12 = *v6;
  sub_213068594();
  sub_213068180();
  sub_213068BA0();
  sub_213068BB8();
  result = sub_213068BAC();
  if (result == 1)
    return sub_213066998(a1, a2 & 1, a3, a4 & 1, a5, v12);
  return result;
}

uint64_t sub_213066BEC(double a1, double a2, double a3, double a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t *v10;

  return sub_213067FF8(a9, a1, a2, a3, a4, a10, *v10);
}

uint64_t sub_213066C00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_213066C58(a1, a2, a3, a4, a5, a6, a7, a8, a9, MEMORY[0x24BDF44F8]);
}

uint64_t sub_213066C2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_213066C58(a1, a2, a3, a4, a5, a6, a7, a8, a9, MEMORY[0x24BDF4500]);
}

uint64_t sub_213066C58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t (*a10)(uint64_t))
{
  return a10(a1);
}

void (*sub_213066C94(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_2130684C8();
  return sub_213059570;
}

uint64_t sub_213066CF4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_213066760(a1, *(_BYTE *)v2, *(_QWORD *)(v2 + 8), *(_QWORD *)(v2 + 16), *(unsigned __int8 *)(v2 + 24), a2);
}

uint64_t sub_213066D04(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_213068A14();
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_21306860C();
}

void sub_213066D80()
{
  _BYTE *v0;

  *(_QWORD *)&v0[OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_baseline] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_imageProvider] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_monochromeFraction] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_color] = 0;
  v0[OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_usesLegibility] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_overrideColor] = 0;

  sub_213068C60();
  __break(1u);
}

void sub_213066E24(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v2 = OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_color;
  v3 = *(void **)(v1 + OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_color);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_color) = a1;
  v4 = a1;

  v5 = *(void **)(v1 + OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_imageProvider);
  if (v5)
  {
    type metadata accessor for WidgetNamedImageProvider(0);
    if (swift_dynamicCastClass())
    {
      v6 = *(void **)(v1 + v2);
      v7 = v5;
      if (v6)
        MEMORY[0x2199A9B24](v6);
      swift_getObjectType();
      sub_21306352C();
      v8 = v5;
      swift_retain();
      sub_213068AB0();
      sub_2130686C0();

      swift_release();
    }
  }
}

_QWORD *__swift_project_boxed_opaque_existential_0(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t destroy for WidgetNamedImageView.NamedImageView(id *a1)
{

  return swift_release();
}

uint64_t _s19ComplicationDisplay20WidgetNamedImageViewC14NamedImageViewVwCP_0(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v5 = v3;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for WidgetNamedImageView.NamedImageView(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for WidgetNamedImageView.NamedImageView(uint64_t a1, uint64_t a2)
{

  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for WidgetNamedImageView.NamedImageView(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 17))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for WidgetNamedImageView.NamedImageView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 17) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for WidgetNamedImageView.NamedImageView()
{
  return &type metadata for WidgetNamedImageView.NamedImageView;
}

uint64_t sub_213067138()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_213067148(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t, uint64_t);
  uint64_t v22;
  void (*v23)(char *, uint64_t);
  int v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  void *v28;
  id v29;
  id v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v2 = sub_2130689D8();
  v43 = *(_QWORD *)(v2 - 8);
  v44 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v42 = (char *)&v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_2130683FC();
  v40 = *(_QWORD *)(v4 - 8);
  v41 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v39 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_213068864();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (unsigned __int8 *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_21306887C();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)&v38 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v38 - v18;
  v20 = a1 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_named;
  swift_beginAccess();
  v21 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v21(v19, v20, v10);
  v45 = sub_213068840();
  v46 = v22;
  v23 = *(void (**)(char *, uint64_t))(v11 + 8);
  v23(v19, v10);
  v21(v17, v20, v10);
  sub_213068870();
  v23(v17, v10);
  v24 = (*(uint64_t (**)(unsigned __int8 *, uint64_t))(v7 + 88))(v9, v6);
  if (v24 == *MEMORY[0x24BDF0D48])
  {
    (*(void (**)(unsigned __int8 *, uint64_t))(v7 + 96))(v9, v6);
    v26 = v39;
    v25 = v40;
    v27 = v41;
    (*(void (**)(char *, unsigned __int8 *, uint64_t))(v40 + 32))(v39, v9, v41);
    v28 = (void *)sub_2130683F0();
    v29 = (id)CLKUniqueBundle();

    v30 = v29;
    sub_213068A2C();
    v32 = v42;
    v31 = v43;
    v33 = v44;
    (*(void (**)(char *, _QWORD, uint64_t))(v43 + 104))(v42, *MEMORY[0x24BDF3FD0], v44);
    v34 = sub_213068A20();

    swift_release();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v32, v33);
    (*(void (**)(char *, uint64_t))(v25 + 8))(v26, v27);
  }
  else if (v24 == *MEMORY[0x24BDF0D50])
  {
    (*(void (**)(unsigned __int8 *, uint64_t))(v7 + 96))(v9, v6);
    v35 = *v9;
    v21(v14, v20, v10);
    sub_21306884C();
    v23(v14, v10);
    if (v35 == 1)
      return sub_2130689F0();
    else
      return sub_2130689CC();
  }
  else
  {
    swift_bridgeObjectRelease();
    (*(void (**)(unsigned __int8 *, uint64_t))(v7 + 8))(v9, v6);
    return 0;
  }
  return v34;
}

unint64_t sub_2130674C4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254B6FC08;
  if (!qword_254B6FC08)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B6FC00);
    v2[0] = sub_213067530();
    v2[1] = sub_2130676E8();
    result = MEMORY[0x2199AA6AC](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254B6FC08);
  }
  return result;
}

unint64_t sub_213067530()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254B6FC10;
  if (!qword_254B6FC10)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B6FBF8);
    v2[0] = sub_2130675B4();
    v2[1] = sub_21304B778(&qword_254B6FC40, &qword_254B6FC48, MEMORY[0x24BDF1028]);
    result = MEMORY[0x2199AA6AC](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254B6FC10);
  }
  return result;
}

unint64_t sub_2130675B4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254B6FC18;
  if (!qword_254B6FC18)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B6FBF0);
    v2[0] = sub_213067638();
    v2[1] = sub_21304B778(&qword_254B6FC38, &qword_254B6FBD8, MEMORY[0x24BDF1028]);
    result = MEMORY[0x2199AA6AC](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254B6FC18);
  }
  return result;
}

unint64_t sub_213067638()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  _QWORD v3[2];

  result = qword_254B6FC20;
  if (!qword_254B6FC20)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B6FC28);
    v2 = sub_2130676A4();
    v3[0] = MEMORY[0x24BDF40E8];
    v3[1] = v2;
    result = MEMORY[0x2199AA6AC](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_254B6FC20);
  }
  return result;
}

unint64_t sub_2130676A4()
{
  unint64_t result;

  result = qword_254B6FC30;
  if (!qword_254B6FC30)
  {
    result = MEMORY[0x2199AA6AC](&unk_21306D594, &type metadata for MetadataForegroundColorsModifier);
    atomic_store(result, (unint64_t *)&qword_254B6FC30);
  }
  return result;
}

unint64_t sub_2130676E8()
{
  unint64_t result;

  result = qword_254B6FC50;
  if (!qword_254B6FC50)
  {
    result = MEMORY[0x2199AA6AC](&unk_21306D544, &type metadata for _ShrinkToFitModifier);
    atomic_store(result, (unint64_t *)&qword_254B6FC50);
  }
  return result;
}

uint64_t sub_21306772C()
{
  return sub_213068600();
}

uint64_t sub_213067750@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_213068660();
  *a1 = result;
  return result;
}

uint64_t sub_213067778()
{
  swift_retain();
  return sub_21306866C();
}

uint64_t sub_2130677A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B6FC00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t getEnumTagSinglePayload for _ShrinkToFitModifier(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && a1[25])
    return (*(_DWORD *)a1 + 255);
  v3 = *a1;
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for _ShrinkToFitModifier(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 25) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 25) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for _ShrinkToFitModifier()
{
  return &type metadata for _ShrinkToFitModifier;
}

_QWORD *initializeBufferWithCopyOfBuffer for MetadataForegroundColorsModifier(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for MetadataForegroundColorsModifier()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for MetadataForegroundColorsModifier(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

_QWORD *assignWithTake for MetadataForegroundColorsModifier(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for MetadataForegroundColorsModifier(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 8))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for MetadataForegroundColorsModifier(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for MetadataForegroundColorsModifier()
{
  return &type metadata for MetadataForegroundColorsModifier;
}

unint64_t sub_2130679FC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254B6FC60;
  if (!qword_254B6FC60)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B6FC68);
    v2[0] = sub_2130674C4();
    v2[1] = MEMORY[0x24BDF5138];
    result = MEMORY[0x2199AA6AC](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254B6FC60);
  }
  return result;
}

uint64_t sub_213067A68()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_213067A78()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_213067A88(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t (*a4)(void))
{
  uint64_t result;
  uint64_t v8;
  _QWORD v9[2];

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9[0] = a3();
    v9[1] = a4();
    result = MEMORY[0x2199AA6AC](MEMORY[0x24BDEF3E0], v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_213067AF8()
{
  return sub_213067A88(&qword_254B6FCC0, &qword_254B6FCA0, (uint64_t (*)(void))sub_213067B1C, (uint64_t (*)(void))sub_213067BB8);
}

unint64_t sub_213067B1C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254B6FCC8;
  if (!qword_254B6FCC8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B6FCA8);
    v2[0] = sub_21304B778(&qword_254B6FCD0, &qword_254B6FC70, MEMORY[0x24BDEFB78]);
    v2[1] = sub_21304B778(&qword_254B6FCD8, &qword_254B6FCE0, MEMORY[0x24BDF1028]);
    result = MEMORY[0x2199AA6AC](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254B6FCC8);
  }
  return result;
}

unint64_t sub_213067BB8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254B6FCE8;
  if (!qword_254B6FCE8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B6FC88);
    v2[0] = sub_21304B778(&qword_254B6FCD0, &qword_254B6FC70, MEMORY[0x24BDEFB78]);
    v2[1] = sub_21304B778(&qword_254B6FCF0, &qword_254B6FCF8, MEMORY[0x24BDF0978]);
    result = MEMORY[0x2199AA6AC](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254B6FCE8);
  }
  return result;
}

unint64_t sub_213067C54()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254B6FD00;
  if (!qword_254B6FD00)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B6FC80);
    v2[0] = sub_21304B778(&qword_254B6FCD0, &qword_254B6FC70, MEMORY[0x24BDEFB78]);
    v2[1] = sub_21304B778(&qword_254B6FD08, &qword_254B6FD10, MEMORY[0x24BDF0990]);
    result = MEMORY[0x2199AA6AC](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254B6FD00);
  }
  return result;
}

uint64_t sub_213067CF0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_213068618();
  *a1 = result;
  return result;
}

uint64_t sub_213067D18()
{
  swift_retain();
  return sub_213068624();
}

unint64_t sub_213067D40()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254B6FD30;
  if (!qword_254B6FD30)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B6FD28);
    v2[0] = sub_21304B778(&qword_254B6FD38, &qword_254B6FD40, MEMORY[0x24BDEB9A8]);
    v2[1] = sub_21304B778(&qword_254B6FD48, &qword_254B6FD18, MEMORY[0x24BDEFB78]);
    result = MEMORY[0x2199AA6AC](MEMORY[0x24BDEC550], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254B6FD30);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for _ShrinkToFitModifier._ShrinkToFitLayout(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for _ShrinkToFitModifier._ShrinkToFitLayout(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 17) = v3;
  return result;
}

ValueMetadata *type metadata accessor for _ShrinkToFitModifier._ShrinkToFitLayout()
{
  return &type metadata for _ShrinkToFitModifier._ShrinkToFitLayout;
}

unint64_t sub_213067E3C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254B6FD50;
  if (!qword_254B6FD50)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B6FD58);
    v2[0] = sub_213067A88(&qword_254B6FCB8, &qword_254B6FCB0, sub_213067AF8, (uint64_t (*)(void))sub_213067C54);
    v2[1] = sub_21304B778(&qword_254B6FCD0, &qword_254B6FC70, MEMORY[0x24BDEFB78]);
    result = MEMORY[0x2199AA6AC](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254B6FD50);
  }
  return result;
}

unint64_t sub_213067EE4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254B6FD60;
  if (!qword_254B6FD60)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B6FD68);
    v2[0] = sub_213067D40();
    v2[1] = sub_21304B778(&qword_254B6FD48, &qword_254B6FD18, MEMORY[0x24BDEFB78]);
    result = MEMORY[0x2199AA6AC](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254B6FD60);
  }
  return result;
}

unint64_t sub_213067F6C()
{
  unint64_t result;

  result = qword_254B6FD70;
  if (!qword_254B6FD70)
  {
    result = MEMORY[0x2199AA6AC](MEMORY[0x24BDEEF18], MEMORY[0x24BDEEF38]);
    atomic_store(result, (unint64_t *)&qword_254B6FD70);
  }
  return result;
}

unint64_t sub_213067FB4()
{
  unint64_t result;

  result = qword_254B6FD78;
  if (!qword_254B6FD78)
  {
    result = MEMORY[0x2199AA6AC](&unk_21306D634, &type metadata for _ShrinkToFitModifier._ShrinkToFitLayout);
    atomic_store(result, (unint64_t *)&qword_254B6FD78);
  }
  return result;
}

uint64_t sub_213067FF8(uint64_t a1, double a2, double a3, double a4, double a5, uint64_t a6, uint64_t a7)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t result;
  _BYTE v16[8];
  char v17;

  v11 = sub_21306854C();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = &v16[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_213068594();
  sub_213068180();
  sub_213068BA0();
  sub_213068BB8();
  result = sub_213068BAC();
  if (result == 1)
  {
    sub_2130685A0();
    sub_213068AE0();
    v17 = 0;
    v16[0] = 0;
    sub_213066998(*(uint64_t *)&a4, 0, *(uint64_t *)&a5, 0, a1, a7);
    v17 = 0;
    v16[0] = 0;
    sub_213068540();
    return (*(uint64_t (**)(_BYTE *, uint64_t))(v12 + 8))(v14, v11);
  }
  return result;
}

unint64_t sub_213068180()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254B6FD80;
  if (!qword_254B6FD80)
  {
    v1 = sub_213068594();
    result = MEMORY[0x2199AA6AC](MEMORY[0x24BDEC7A0], v1);
    atomic_store(result, (unint64_t *)&qword_254B6FD80);
  }
  return result;
}

uint64_t sub_2130683E4()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_2130683F0()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_2130683FC()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_213068408()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_213068414()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_213068420()
{
  return MEMORY[0x24BEE5C38]();
}

uint64_t sub_21306842C()
{
  return MEMORY[0x24BEE5C40]();
}

uint64_t sub_213068438()
{
  return MEMORY[0x24BEE5C48]();
}

uint64_t sub_213068444()
{
  return MEMORY[0x24BEE5C50]();
}

uint64_t sub_213068450()
{
  return MEMORY[0x24BEE5C58]();
}

uint64_t sub_21306845C()
{
  return MEMORY[0x24BEE5C60]();
}

uint64_t sub_213068468()
{
  return MEMORY[0x24BDB9C48]();
}

uint64_t sub_213068474()
{
  return MEMORY[0x24BDB9E98]();
}

uint64_t sub_213068480()
{
  return MEMORY[0x24BDB9EA0]();
}

uint64_t sub_21306848C()
{
  return MEMORY[0x24BDB9EA8]();
}

uint64_t sub_213068498()
{
  return MEMORY[0x24BDB9EC0]();
}

uint64_t sub_2130684A4()
{
  return MEMORY[0x24BDB9EC8]();
}

uint64_t sub_2130684B0()
{
  return MEMORY[0x24BDB9ED0]();
}

uint64_t sub_2130684BC()
{
  return MEMORY[0x24BDB9EF0]();
}

uint64_t sub_2130684C8()
{
  return MEMORY[0x24BDEAE98]();
}

uint64_t sub_2130684D4()
{
  return MEMORY[0x24BDEAEB0]();
}

uint64_t sub_2130684E0()
{
  return MEMORY[0x24BDEB560]();
}

uint64_t sub_2130684EC()
{
  return MEMORY[0x24BDEB7B8]();
}

uint64_t sub_2130684F8()
{
  return MEMORY[0x24BDEBDE0]();
}

uint64_t sub_213068504()
{
  return MEMORY[0x24BDEBDF0]();
}

uint64_t sub_213068510()
{
  return MEMORY[0x24BDEBE00]();
}

uint64_t sub_21306851C()
{
  return MEMORY[0x24BDEC120]();
}

uint64_t sub_213068528()
{
  return MEMORY[0x24BDEC138]();
}

uint64_t sub_213068534()
{
  return MEMORY[0x24BDEC260]();
}

uint64_t sub_213068540()
{
  return MEMORY[0x24BDEC268]();
}

uint64_t sub_21306854C()
{
  return MEMORY[0x24BDEC280]();
}

uint64_t sub_213068558()
{
  return MEMORY[0x24BDEC348]();
}

uint64_t sub_213068564()
{
  return MEMORY[0x24BDEC358]();
}

uint64_t sub_213068570()
{
  return MEMORY[0x24BDEC648]();
}

uint64_t sub_21306857C()
{
  return MEMORY[0x24BDEC6D8]();
}

uint64_t sub_213068588()
{
  return MEMORY[0x24BDEC6E0]();
}

uint64_t sub_213068594()
{
  return MEMORY[0x24BDEC778]();
}

uint64_t sub_2130685A0()
{
  return MEMORY[0x24BDEC7A8]();
}

uint64_t sub_2130685AC()
{
  return MEMORY[0x24BDEC998]();
}

uint64_t sub_2130685B8()
{
  return MEMORY[0x24BDED130]();
}

uint64_t sub_2130685C4()
{
  return MEMORY[0x24BDED2D0]();
}

uint64_t sub_2130685D0()
{
  return MEMORY[0x24BDED790]();
}

uint64_t sub_2130685DC()
{
  return MEMORY[0x24BDED8E0]();
}

uint64_t sub_2130685E8()
{
  return MEMORY[0x24BDEDCF8]();
}

uint64_t sub_2130685F4()
{
  return MEMORY[0x24BDEDD10]();
}

uint64_t sub_213068600()
{
  return MEMORY[0x24BDEDE90]();
}

uint64_t sub_21306860C()
{
  return MEMORY[0x24BDEDE98]();
}

uint64_t sub_213068618()
{
  return MEMORY[0x24BDEE038]();
}

uint64_t sub_213068624()
{
  return MEMORY[0x24BDEE048]();
}

uint64_t sub_213068630()
{
  return MEMORY[0x24BDEE070]();
}

uint64_t sub_21306863C()
{
  return MEMORY[0x24BDEE080]();
}

uint64_t sub_213068648()
{
  return MEMORY[0x24BDEE0B8]();
}

uint64_t sub_213068654()
{
  return MEMORY[0x24BDEE0C0]();
}

uint64_t sub_213068660()
{
  return MEMORY[0x24BDEE390]();
}

uint64_t sub_21306866C()
{
  return MEMORY[0x24BDEE3A0]();
}

uint64_t sub_213068678()
{
  return MEMORY[0x24BDEE530]();
}

uint64_t sub_213068684()
{
  return MEMORY[0x24BDEE538]();
}

uint64_t sub_213068690()
{
  return MEMORY[0x24BDEECC8]();
}

uint64_t sub_21306869C()
{
  return MEMORY[0x24BDEECD0]();
}

uint64_t sub_2130686A8()
{
  return MEMORY[0x24BDEECD8]();
}

uint64_t sub_2130686B4()
{
  return MEMORY[0x24BDEECE0]();
}

uint64_t sub_2130686C0()
{
  return MEMORY[0x24BDEECE8]();
}

uint64_t sub_2130686CC()
{
  return MEMORY[0x24BDEF0B0]();
}

uint64_t sub_2130686D8()
{
  return MEMORY[0x24BDEF0E8]();
}

uint64_t sub_2130686E4()
{
  return MEMORY[0x24BDEF228]();
}

uint64_t sub_2130686F0()
{
  return MEMORY[0x24BDEF238]();
}

uint64_t sub_2130686FC()
{
  return MEMORY[0x24BDEF248]();
}

uint64_t sub_213068708()
{
  return MEMORY[0x24BDEF260]();
}

uint64_t sub_213068714()
{
  return MEMORY[0x24BDEF270]();
}

uint64_t sub_213068720()
{
  return MEMORY[0x24BDEF278]();
}

uint64_t sub_21306872C()
{
  return MEMORY[0x24BDEF288]();
}

uint64_t sub_213068738()
{
  return MEMORY[0x24BDEF298]();
}

uint64_t sub_213068744()
{
  return MEMORY[0x24BDEF2A8]();
}

uint64_t sub_213068750()
{
  return MEMORY[0x24BDEF2C0]();
}

uint64_t sub_21306875C()
{
  return MEMORY[0x24BDEF2C8]();
}

uint64_t sub_213068768()
{
  return MEMORY[0x24BDEF2D8]();
}

uint64_t sub_213068774()
{
  return MEMORY[0x24BDEF380]();
}

uint64_t sub_213068780()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_21306878C()
{
  return MEMORY[0x24BDEF3B8]();
}

uint64_t sub_213068798()
{
  return MEMORY[0x24BDEF540]();
}

uint64_t sub_2130687A4()
{
  return MEMORY[0x24BDEF950]();
}

uint64_t sub_2130687B0()
{
  return MEMORY[0x24BDEFB50]();
}

uint64_t sub_2130687BC()
{
  return MEMORY[0x24BDEFFD0]();
}

uint64_t sub_2130687C8()
{
  return MEMORY[0x24BDEFFD8]();
}

uint64_t sub_2130687D4()
{
  return MEMORY[0x24BDEFFE0]();
}

uint64_t sub_2130687E0()
{
  return MEMORY[0x24BDEFFE8]();
}

uint64_t sub_2130687EC()
{
  return MEMORY[0x24BDEFFF0]();
}

uint64_t sub_2130687F8()
{
  return MEMORY[0x24BDEFFF8]();
}

uint64_t sub_213068804()
{
  return MEMORY[0x24BDF0000]();
}

uint64_t sub_213068810()
{
  return MEMORY[0x24BDF0138]();
}

uint64_t sub_21306881C()
{
  return MEMORY[0x24BDF0158]();
}

uint64_t sub_213068828()
{
  return MEMORY[0x24BDF0738]();
}

uint64_t sub_213068834()
{
  return MEMORY[0x24BDF0D28]();
}

uint64_t sub_213068840()
{
  return MEMORY[0x24BDF0D30]();
}

uint64_t sub_21306884C()
{
  return MEMORY[0x24BDF0D38]();
}

uint64_t sub_213068858()
{
  return MEMORY[0x24BDF0D40]();
}

uint64_t sub_213068864()
{
  return MEMORY[0x24BDF0D58]();
}

uint64_t sub_213068870()
{
  return MEMORY[0x24BDF0D60]();
}

uint64_t sub_21306887C()
{
  return MEMORY[0x24BDF0D68]();
}

uint64_t sub_213068888()
{
  return MEMORY[0x24BDF1950]();
}

uint64_t sub_213068894()
{
  return MEMORY[0x24BDF1A80]();
}

uint64_t sub_2130688A0()
{
  return MEMORY[0x24BDF1A88]();
}

uint64_t sub_2130688AC()
{
  return MEMORY[0x24BDF1AC8]();
}

uint64_t sub_2130688B8()
{
  return MEMORY[0x24BDF1AF0]();
}

uint64_t sub_2130688C4()
{
  return MEMORY[0x24BDF1B10]();
}

uint64_t sub_2130688D0()
{
  return MEMORY[0x24BDF1B78]();
}

uint64_t sub_2130688DC()
{
  return MEMORY[0x24BDF1B80]();
}

uint64_t sub_2130688E8()
{
  return MEMORY[0x24BDF1BA0]();
}

uint64_t sub_2130688F4()
{
  return MEMORY[0x24BDF1BC8]();
}

uint64_t sub_213068900()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_21306890C()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_213068918()
{
  return MEMORY[0x24BDF2370]();
}

uint64_t sub_213068924()
{
  return MEMORY[0x24BDF2410]();
}

uint64_t sub_213068930()
{
  return MEMORY[0x24BDF24B0]();
}

uint64_t sub_21306893C()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_213068948()
{
  return MEMORY[0x24BDF2CD8]();
}

uint64_t sub_213068954()
{
  return MEMORY[0x24BDF3628]();
}

uint64_t sub_213068960()
{
  return MEMORY[0x24BDF37B0]();
}

uint64_t sub_21306896C()
{
  return MEMORY[0x24BDF38C0]();
}

uint64_t sub_213068978()
{
  return MEMORY[0x24BDF3938]();
}

uint64_t sub_213068984()
{
  return MEMORY[0x24BDF3980]();
}

uint64_t sub_213068990()
{
  return MEMORY[0x24BDF3BA8]();
}

uint64_t sub_21306899C()
{
  return MEMORY[0x24BDF3BE0]();
}

uint64_t sub_2130689A8()
{
  return MEMORY[0x24BDF3BE8]();
}

uint64_t sub_2130689B4()
{
  return MEMORY[0x24BDF3D10]();
}

uint64_t sub_2130689C0()
{
  return MEMORY[0x24BDF3D30]();
}

uint64_t sub_2130689CC()
{
  return MEMORY[0x24BDF3F78]();
}

uint64_t sub_2130689D8()
{
  return MEMORY[0x24BDF3FE8]();
}

uint64_t sub_2130689E4()
{
  return MEMORY[0x24BDF4028]();
}

uint64_t sub_2130689F0()
{
  return MEMORY[0x24BDF4038]();
}

uint64_t sub_2130689FC()
{
  return MEMORY[0x24BDF4050]();
}

uint64_t sub_213068A08()
{
  return MEMORY[0x24BDF4070]();
}

uint64_t sub_213068A14()
{
  return MEMORY[0x24BDF40C0]();
}

uint64_t sub_213068A20()
{
  return MEMORY[0x24BDF40D8]();
}

uint64_t sub_213068A2C()
{
  return MEMORY[0x24BDF4130]();
}

uint64_t sub_213068A38()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_213068A44()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_213068A50()
{
  return MEMORY[0x24BDF42A8]();
}

uint64_t sub_213068A5C()
{
  return MEMORY[0x24BDF44E0]();
}

uint64_t sub_213068A68()
{
  return MEMORY[0x24BDF44E8]();
}

uint64_t sub_213068A74()
{
  return MEMORY[0x24BDF44F0]();
}

uint64_t sub_213068A80()
{
  return MEMORY[0x24BDF4508]();
}

uint64_t sub_213068A8C()
{
  return MEMORY[0x24BDF4510]();
}

uint64_t sub_213068A98()
{
  return MEMORY[0x24BDF4728]();
}

uint64_t sub_213068AA4()
{
  return MEMORY[0x24BDF4730]();
}

uint64_t sub_213068AB0()
{
  return MEMORY[0x24BDF4790]();
}

uint64_t sub_213068ABC()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_213068AC8()
{
  return MEMORY[0x24BDF53F0]();
}

uint64_t sub_213068AD4()
{
  return MEMORY[0x24BDF5418]();
}

uint64_t sub_213068AE0()
{
  return MEMORY[0x24BDF5448]();
}

uint64_t sub_213068AEC()
{
  return MEMORY[0x24BDF54A0]();
}

uint64_t sub_213068AF8()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_213068B04()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_213068B10()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_213068B1C()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_213068B28()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_213068B34()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_213068B40()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_213068B4C()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_213068B58()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_213068B64()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_213068B70()
{
  return MEMORY[0x24BEE0ED0]();
}

uint64_t sub_213068B7C()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_213068B88()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_213068B94()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_213068BA0()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_213068BAC()
{
  return MEMORY[0x24BEE1908]();
}

uint64_t sub_213068BB8()
{
  return MEMORY[0x24BEE1910]();
}

uint64_t sub_213068BC4()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_213068BD0()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_213068BDC()
{
  return MEMORY[0x24BDF5540]();
}

uint64_t sub_213068BE8()
{
  return MEMORY[0x24BEBCFF0]();
}

uint64_t sub_213068BF4()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_213068C00()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_213068C0C()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_213068C18()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_213068C24()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_213068C30()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_213068C3C()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_213068C48()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_213068C54()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_213068C60()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_213068C6C()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_213068C78()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_213068C84()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_213068C90()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_213068C9C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_213068CA8()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_213068CB4()
{
  return MEMORY[0x24BEE4328]();
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x24BDBD8C8](t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8D8](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E8](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8F8](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD908](retstr, t, tx, ty);
}

void CGPathAddArc(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise)
{
  MEMORY[0x24BDBEDA8](path, m, clockwise, x, y, radius, startAngle, endAngle);
}

void CGPathAddArcToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x1, CGFloat y1, CGFloat x2, CGFloat y2, CGFloat radius)
{
  MEMORY[0x24BDBEDB0](path, m, x1, y1, x2, y2, radius);
}

void CGPathAddCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cp1x, CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBEDB8](path, m, cp1x, cp1y, cp2x, cp2y, x, y);
}

void CGPathAddEllipseInRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
  MEMORY[0x24BDBEDC0](path, m, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBEDC8](path, m, x, y);
}

void CGPathAddPath(CGMutablePathRef path1, const CGAffineTransform *m, CGPathRef path2)
{
  MEMORY[0x24BDBEDD8](path1, m, path2);
}

void CGPathAddQuadCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cpx, CGFloat cpy, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBEDE0](path, m, cpx, cpy, x, y);
}

void CGPathAddRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
  MEMORY[0x24BDBEDE8](path, m, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGPathApplyWithBlock(CGPathRef path, CGPathApplyBlock block)
{
  MEMORY[0x24BDBEE10](path, block);
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
  MEMORY[0x24BDBEE20](path);
}

CGPathRef CGPathCreateCopyByTransformingPath(CGPathRef path, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x24BDBEE60](path, transform);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x24BDBEE80]();
}

BOOL CGPathEqualToPath(CGPathRef path1, CGPathRef path2)
{
  return MEMORY[0x24BDBEEB8](path1, path2);
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

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBEF40](path, m, x, y);
}

void CGPathRelease(CGPathRef path)
{
  MEMORY[0x24BDBEF48](path);
}

CGPoint CGPointApplyAffineTransform(CGPoint point, CGAffineTransform *t)
{
  double v2;
  double v3;
  CGPoint result;

  MEMORY[0x24BDBEF90](t, (__n128)point, *(__n128 *)&point.y);
  result.y = v3;
  result.x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x24BDBEFC0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
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

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x24BDBF050]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF078]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

uint64_t CLKComplicationGraphicExtraLargeCircularScalingFactor()
{
  return MEMORY[0x24BDB85B0]();
}

uint64_t CLKCompressFraction()
{
  return MEMORY[0x24BDB85B8]();
}

uint64_t CLKDegreesToRadians()
{
  return MEMORY[0x24BDB85C0]();
}

uint64_t CLKDeviceCategoryForSizeClass()
{
  return MEMORY[0x24BDB85C8]();
}

uint64_t CLKFloatEqualsFloat()
{
  return MEMORY[0x24BDB85D8]();
}

uint64_t CLKFloorForDevice()
{
  return MEMORY[0x24BDB85E0]();
}

uint64_t CLKInterpolateBetweenFloatsClipped()
{
  return MEMORY[0x24BDB85F8]();
}

uint64_t CLKIsUVPreviewApp()
{
  return MEMORY[0x24BDB8608]();
}

uint64_t CLKLargeDialDiameterForDevice()
{
  return MEMORY[0x24BDB8610]();
}

uint64_t CLKPixelAlignRectForDevice()
{
  return MEMORY[0x24BDB8620]();
}

uint64_t CLKRectCenteredIntegralRectForDevice()
{
  return MEMORY[0x24BDB8628]();
}

uint64_t CLKRectGetCenter()
{
  return MEMORY[0x24BDB8630]();
}

uint64_t CLKUIMonochromeFiltersForStyle()
{
  return MEMORY[0x24BE16F00]();
}

uint64_t CLKUIShadowImage()
{
  return MEMORY[0x24BE16F08]();
}

uint64_t CLKUIShadowImageFromView()
{
  return MEMORY[0x24BE16F10]();
}

uint64_t CLKUniqueBundle()
{
  return MEMORY[0x24BDB8660]();
}

uint64_t CLKValueForLuxoDeviceMetrics()
{
  return MEMORY[0x24BDB8668]();
}

uint64_t CLKWidgetGroupNestedContentDiameter()
{
  return MEMORY[0x24BDB8670]();
}

uint64_t CLKWidgetGroupSafeAreaInsets()
{
  return MEMORY[0x24BDB8678]();
}

uint64_t CLKWidgetGroupSquareContentCornerRadius()
{
  return MEMORY[0x24BDB8680]();
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x24BDD11E8]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x24BEBE280](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x24BEBE298]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x24BEBE2A8]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x24BEBE2B0]();
}

uint64_t UIRectCenteredIntegralRectScale()
{
  return MEMORY[0x24BEBE660]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x24BDAC890](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
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

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

long double acos(long double __x)
{
  long double result;

  MEMORY[0x24BDAD108](__x);
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

float atanf(float a1)
{
  float result;

  MEMORY[0x24BDAD230](a1);
  return result;
}

float cosf(float a1)
{
  float result;

  MEMORY[0x24BDADBE8](a1);
  return result;
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

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
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

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

long double sin(long double __x)
{
  long double result;

  MEMORY[0x24BDAFE18](__x);
  return result;
}

float sinf(float a1)
{
  float result;

  MEMORY[0x24BDAFE20](a1);
  return result;
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x24BEE4BF0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x24BEE4C50]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x24BEE4C70]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x24BEE4DC0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x24BEE4DF0]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x24BEE4DF8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x24BEE4FB0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x24BEE4FC8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x24BEE4FD0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x24BEE4FD8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

float tanf(float a1)
{
  float result;

  MEMORY[0x24BDB0140](a1);
  return result;
}

