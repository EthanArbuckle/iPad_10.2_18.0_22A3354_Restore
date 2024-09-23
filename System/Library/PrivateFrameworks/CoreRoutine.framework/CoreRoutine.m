id _RTSafeArray(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9;
  void *v10;
  id v11;
  id *v12;
  id *v14;

  v9 = a1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id *)&a9;
  v11 = v9;
  if (!v9)
    goto LABEL_4;
  while (v11 != (id)1)
  {
    objc_msgSend(v10, "addObject:");
    do
    {
LABEL_4:
      v12 = v14++;
      v11 = *v12;
    }
    while (!*v12);
  }

  return v10;
}

id _RTMultiErrorCreate(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id obj;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[2];
  _QWORD v33[2];
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  int v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v19 = (void *)objc_msgSend(a1, "copy");
  objc_msgSend(v19, "flatten");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v1;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v39, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v29;
    v20 = *(_QWORD *)v29;
    do
    {
      v6 = 0;
      v21 = v4;
      do
      {
        if (*(_QWORD *)v29 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v6);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v23 = v6;
          v26 = 0u;
          v27 = 0u;
          v24 = 0u;
          v25 = 0u;
          v8 = v7;
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v38, 16);
          if (v9)
          {
            v10 = v9;
            v11 = *(_QWORD *)v25;
            do
            {
              v12 = 0;
              do
              {
                if (*(_QWORD *)v25 != v11)
                  objc_enumerationMutation(v8);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                  v13 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136315394;
                    v35 = "NSError * _Nonnull _RTMultiErrorCreate(NSArray *__strong _Nonnull)";
                    v36 = 1024;
                    v37 = 49;
                    _os_log_error_impl(&dword_1A5E26000, v13, OS_LOG_TYPE_ERROR, "All parameters must be NSError or nil. (in %s:%d)", buf, 0x12u);
                  }

                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  objc_msgSend(v2, "addObject:", v8);
                ++v12;
              }
              while (v10 != v12);
              v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v38, 16);
            }
            while (v10);
          }

          v5 = v20;
          v4 = v21;
          v6 = v23;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v35 = "NSError * _Nonnull _RTMultiErrorCreate(NSArray *__strong _Nonnull)";
              v36 = 1024;
              v37 = 55;
              _os_log_error_impl(&dword_1A5E26000, v14, OS_LOG_TYPE_ERROR, "All parameters must be NSError or nil. (in %s:%d)", buf, 0x12u);
            }

          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v2, "addObject:", v7);
        }
        ++v6;
      }
      while (v6 != v4);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v39, 16);
    }
    while (v4);
  }

  if ((unint64_t)objc_msgSend(v2, "count") < 2)
  {
    objc_msgSend(v2, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v32[0] = *MEMORY[0x1E0CB2D50];
    v32[1] = CFSTR("RTDetailedErrorsKey");
    v33[0] = CFSTR("Multiple errors occurred.");
    v33[1] = v2;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("RTErrorDomain"), 9, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v17;
}

double RTCommonIsCoordinateValid(double a1, double a2)
{
  double v2;

  v2 = 1.0;
  if (a2 < -180.0)
    v2 = 0.0;
  if (a2 > 180.0 || a1 < -90.0 || a1 > 90.0)
    return 0.0;
  else
    return v2;
}

void RTCommonCalculateDistanceHighPrecision(double a1, double a2, double a3, double a4)
{
  RTCommonCalculateDistanceRadius(1, a1, a2, a3, a4);
}

void RTCommonCalculateDistanceRadius(int a1, double a2, double a3, double a4, double a5)
{
  double v7;
  double v8;
  double v9;
  double v10;
  unsigned int v11;
  int v12;
  double v13;
  long double v14;
  long double v15;
  double v16;
  long double v17;
  long double v18;
  double v19;
  double v20;

  v7 = (a2 + a4) * 0.0174532925;
  if (a3 < 0.0)
    a3 = a3 + 360.0;
  if (a5 < 0.0)
    a5 = a5 + 360.0;
  v8 = a5 - a3;
  if (v8 <= 180.0)
  {
    if (v8 < -180.0)
      v8 = v8 + 360.0;
  }
  else
  {
    v8 = v8 + -360.0;
  }
  v9 = v7 * 0.5;
  v10 = (a4 - a2) * 0.0174532925;
  v11 = (int)v8;
  if ((int)v8 < 0)
    v11 = -v11;
  v12 = (int)a4 - (int)a2;
  if (v12 < 0)
    v12 = (int)a2 - (int)a4;
  v13 = v8 * 0.0174532925;
  if (v12 > 2 || v11 > 2)
  {
    if (a1)
      sin(v9);
    v14 = sin(v10 * 0.5);
    v15 = v14 * v14;
    v16 = cos(a2 * 0.0174532925);
    v17 = v16 * cos(a4 * 0.0174532925);
    v18 = sin(v13 * 0.5);
    v19 = v15 + v17 * (v18 * v18);
    v20 = 1.0 - v19;
    if (v19 < 0.0)
      v19 = 0.0;
    if (v20 < 0.0)
      v20 = 0.0;
    atan2(sqrt(v19), sqrt(v20));
  }
  else
  {
    __sincos_stret(v9);
  }
}

double RTCommonGetDestinationCoordinate(double *a1, double *a2, double a3, double a4, double a5, double a6)
{
  double v8;
  double v9;
  double v10;
  __double2 v11;
  __double2 v12;
  __double2 v13;
  long double v14;
  long double v15;
  long double v16;
  double result;

  v8 = a4 * 0.0174532925;
  v9 = a5 * 0.0174532925;
  v10 = a6 / 6378137.0;
  v11 = __sincos_stret(a3 * 0.0174532925);
  v12 = __sincos_stret(v10);
  v13 = __sincos_stret(v9);
  v14 = asin(v13.__cosval * (v11.__cosval * v12.__sinval) + v11.__sinval * v12.__cosval);
  v15 = sin(v14);
  v16 = atan2(v11.__cosval * (v13.__sinval * v12.__sinval), v12.__cosval - v11.__sinval * v15);
  *a1 = v14 / 0.0174532925;
  result = (v8 + v16) / 0.0174532925;
  *a2 = result;
  return result;
}

void RTCommonCalculateBoundingBox(double *a1, double *a2, double *a3, double *a4, double a5, double a6, double a7)
{
  double v14;
  double v15;
  double v16;
  double v17;

  if (a1 && a2 && a3)
  {
    if (a4)
    {
      v16 = 0.0;
      v17 = 0.0;
      RTCommonGetDestinationCoordinate(&v17, &v16, a5, a6, 0.0, a7);
      v14 = vabdd_f64(v17, a5);
      RTCommonGetDestinationCoordinate(&v17, &v16, a5, a6, 90.0, a7);
      v15 = vabdd_f64(v16, a6);
      *a1 = a5 - v14;
      *a3 = v14 + a5;
      *a2 = a6 - v15;
      *a4 = v15 + a6;
    }
  }
}

void RTCommonCalculateDistance(double a1, double a2, double a3, double a4)
{
  RTCommonCalculateDistanceRadius(0, a1, a2, a3, a4);
}

BOOL RTCommonConvertGeodeticToLocalFrame(double *a1, double *a2, double *a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  double v9;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  __double2 v22;
  double v23;

  v9 = vabdd_f64(a4, a7);
  if (v9 <= 2.0)
  {
    v16 = (a4 + a7) * 0.5 * 0.0174532925;
    v17 = (a7 - a4) * 0.0174532925;
    v18 = 360.0;
    if (a5 < 0.0)
      a5 = a5 + 360.0;
    v19 = a8 + 360.0;
    if (a8 >= 0.0)
      v19 = a8;
    v20 = v19 - a5;
    if (v20 <= 180.0)
    {
      if (v20 >= -180.0)
      {
LABEL_10:
        v21 = v20 * 0.0174532925;
        v22 = __sincos_stret(v16);
        v23 = sqrt(v22.__sinval * -0.00669437999 * v22.__sinval + 1.0);
        *a1 = v17 * (6335439.33 / (v23 * (v23 * v23)) + a6);
        *a2 = v22.__cosval * (6378137.0 / v23 + a6) * v21;
        *a3 = a9 - a6;
        return v9 <= 2.0;
      }
    }
    else
    {
      v18 = -360.0;
    }
    v20 = v20 + v18;
    goto LABEL_10;
  }
  return v9 <= 2.0;
}

BOOL RTCommonConvertLocalFrameToGeodetic(double *a1, double *a2, double a3, double a4, double a5, double a6, double a7)
{
  _BOOL8 v8;
  __double2 v15;
  double v16;
  double v17;
  double v18;

  v8 = a3 >= -90.0 && a3 <= 90.0;
  if (v8)
  {
    v15 = __sincos_stret(a3 * 0.0174532925);
    v16 = sqrt(v15.__sinval * -0.00669437999 * v15.__sinval + 1.0);
    v17 = 6335439.33 / (v16 * (v16 * v16)) + a5;
    v18 = v15.__cosval * (6378137.0 / v16 + a5);
    if (v18 < 10.0)
      v18 = 10.0;
    *a1 = a3 + a6 / v17 * 57.2957795;
    *a2 = a4 + a7 / v18 * 57.2957795;
  }
  return v8;
}

double RTCommonRandomDouble(double a1, double a2)
{
  return a1 + (double)arc4random_uniform(0x7FFFFFFFu) / 2147483650.0 * (a2 - a1);
}

uint64_t RTCommonRandomInt(unsigned int a1)
{
  return arc4random_uniform(0x7FFFFFFFu) % a1;
}

BOOL RTCommonRandomFlip(double a1)
{
  NSObject *v3;
  int v5;
  double v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (a1 < 0.0 || a1 > 1.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v5 = 134217984;
      v6 = a1;
      _os_log_error_impl(&dword_1A5E26000, v3, OS_LOG_TYPE_ERROR, "RTCommonRandomFlip, invalid probability, %f, probability must be between 0 and 1", (uint8_t *)&v5, 0xCu);
    }

  }
  return (double)arc4random_uniform(0x7FFFFFFFu) / 2147483650.0 < a1;
}

BOOL RTCommonValidConfidence(double a1)
{
  return a1 <= 1.0 && a1 >= 0.0;
}

void RTCommonSafeLog(long double a1)
{
  log(a1);
}

uint64_t sub_1A5E30710()
{
  void *v0;

  return 0;
}

uint64_t sub_1A5E31870()
{
  void *v0;

  return 0;
}

uint64_t sub_1A5E321A0()
{
  void *v0;

  return 0;
}

uint64_t sub_1A5E32598()
{
  void *v0;

  return 0;
}

id _rt_log_facility_get_os_log(dispatch_once_t *predicate)
{
  if (*predicate != -1)
    dispatch_once_f(predicate, predicate, (dispatch_function_t)_rt_log_facility_prepare);
  return (id)predicate[2];
}

os_log_t _rt_log_facility_prepare(uint64_t a1)
{
  os_log_t result;

  result = os_log_create("com.apple.CoreRoutine", *(const char **)(a1 + 8));
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t sub_1A5E335F8()
{
  void *v0;

  return 0;
}

uint64_t sub_1A5E34E20()
{
  void *v0;

  return 0;
}

uint64_t sub_1A5E352E0()
{
  void *v0;

  return 0;
}

uint64_t onDaemonStartNotification(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "handleDaemonStart");
}

id RTErrorConnectionCreate(const char *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  objc_class *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v10 = (objc_class *)MEMORY[0x1E0CB3940];
  v11 = a2;
  v12 = (void *)objc_msgSend([v10 alloc], "initWithFormat:arguments:", v11, &a9);

  v13 = (void *)MEMORY[0x1E0CB35C8];
  v20 = *MEMORY[0x1E0CB2D50];
  v14 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("connection failure while servicing %@, %@"), v15, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("RTErrorDomain"), 8, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

id RTErrorInvalidParameterCreate(const char *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  objc_class *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v10 = (objc_class *)MEMORY[0x1E0CB3940];
  v11 = a2;
  v12 = (void *)objc_msgSend([v10 alloc], "initWithFormat:arguments:", v11, &a9);

  v13 = (void *)MEMORY[0x1E0CB35C8];
  v20 = *MEMORY[0x1E0CB2D50];
  v14 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("invalid parameter passed to %@, %@"), v15, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("RTErrorDomain"), 7, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

void sub_1A5E38888(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A5E38DB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
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

void sub_1A5E39394(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A5E3A140(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  uint64_t v41;

  _Block_object_dispose(&a35, 8);
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose((const void *)(v41 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1A5E44AE8()
{
  void *v0;

  return 0;
}

uint64_t sub_1A5E45BA0()
{
  void *v0;

  return 0;
}

uint64_t sub_1A5E46AB8()
{
  void *v0;

  return 0;
}

void _RTRequireInitializer(uint64_t a1, SEL aSelector)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(aSelector);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ requires the use of the initializer: %@"), a1, v4);
  v5 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

uint64_t sub_1A5E4765C()
{
  void *v0;

  return 0;
}

uint64_t sub_1A5E493C4()
{
  void *v0;

  return 0;
}

uint64_t sub_1A5E4CCD0()
{
  void *v0;

  return 0;
}

void log_analytics_submission(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "appendFormat:", CFSTR("\n=== BEGIN analytics submission for event %@ ===\n"), v3);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v4, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendFormat:", CFSTR("%@ : %@\n"), v12, v13);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v9);
  }

  objc_msgSend(v5, "appendFormat:", CFSTR("=== END analytics submission for event %@ ===\n"), v3);
  _rt_log_facility_get_os_log(RTLogFacilityMetric);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v5;
    _os_log_impl(&dword_1A5E26000, v14, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

}

uint64_t __log_analytics_submission_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t sub_1A5E4D758()
{
  void *v0;

  return 0;
}

void sub_1A5E4E8AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
  _Block_object_dispose(&a51, 8);
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

void sub_1A5E4FEEC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  _Unwind_Resume(exception_object);
}

uint64_t sub_1A5E502F4()
{
  void *v0;

  return 0;
}

uint64_t sub_1A5E50E40()
{
  void *v0;

  return 0;
}

uint64_t sub_1A5E523BC()
{
  void *v0;

  return 0;
}

uint64_t sub_1A5E52C4C()
{
  void *v0;

  return 0;
}

uint64_t sub_1A5E52EA0()
{
  void *v0;

  return 0;
}

uint64_t sub_1A5E53100()
{
  void *v0;

  return 0;
}

uint64_t sub_1A5E54C84()
{
  void *v0;

  return 0;
}

uint64_t sub_1A5E55094()
{
  void *v0;

  return 0;
}

uint64_t sub_1A5E55BB4()
{
  void *v0;

  return 0;
}

uint64_t sub_1A5E56480()
{
  void *v0;

  return 0;
}

uint64_t sub_1A5E56FC8()
{
  void *v0;

  return 0;
}

uint64_t sub_1A5E57F24()
{
  void *v0;

  return 0;
}

uint64_t sub_1A5E588A4()
{
  void *v0;

  return 0;
}

uint64_t sub_1A5E59404()
{
  void *v0;

  return 0;
}

uint64_t sub_1A5E5A460()
{
  void *v0;

  return 0;
}

uint64_t sub_1A5E5B144()
{
  void *v0;

  return 0;
}

uint64_t sub_1A5E5B5F4()
{
  void *v0;

  return 0;
}

uint64_t sub_1A5E5D9CC()
{
  void *v0;

  return 0;
}

uint64_t sub_1A5E5E7EC()
{
  void *v0;

  return 0;
}

uint64_t sub_1A5E5F15C()
{
  void *v0;

  return 0;
}

uint64_t sub_1A5E5FE34()
{
  void *v0;

  return 0;
}

uint64_t sub_1A5E6032C()
{
  void *v0;

  return 0;
}

uint64_t sub_1A5E614DC()
{
  void *v0;

  return 0;
}

uint64_t sub_1A5E63098()
{
  void *v0;

  return 0;
}

const __CFString *RTLinkQualityToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return CFSTR("RTLinkQualityUnknown");
  else
    return *(&off_1E4FB1808 + a1 - 1);
}

BOOL RTLinkQualityIsConnected(uint64_t a1)
{
  return (unint64_t)(a1 - 2) < 3;
}

uint64_t sub_1A5E63A30()
{
  void *v0;

  return 0;
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1E0D15420]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
  MEMORY[0x1E0C988F0](center, observer);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x1E0CB3158]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return (CFStringRef)MEMORY[0x1E0CD65E0](task, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1E0CD6610](allocator);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
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

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

long double asin(long double __x)
{
  long double result;

  MEMORY[0x1E0C81598](__x);
  return result;
}

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x1E0C81620](__y, __x);
  return result;
}

long double cos(long double __x)
{
  long double result;

  MEMORY[0x1E0C82B40](__x);
  return result;
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1E0C82E58](queue);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x1E0C83490](a1, a2);
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BB8](__x);
  return result;
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

BOOL sel_isEqual(SEL lhs, SEL rhs)
{
  return MEMORY[0x1E0DE80D8](lhs, rhs);
}

long double sin(long double __x)
{
  long double result;

  MEMORY[0x1E0C85418](__x);
  return result;
}

uint64_t vproc_swap_integer()
{
  return MEMORY[0x1E0C85B88]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

uint64_t xpc_set_event()
{
  return MEMORY[0x1E0C866E0]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
  MEMORY[0x1E0C866E8](stream, targetq, handler);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1E0C86720](string);
}

