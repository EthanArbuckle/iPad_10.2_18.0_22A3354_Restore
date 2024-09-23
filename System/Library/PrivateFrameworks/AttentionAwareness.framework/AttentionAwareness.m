unint64_t absTimeNS()
{
  uint64_t v0;

  v0 = mach_absolute_time();
  if (machTimeToNS_onceToken != -1)
    dispatch_once(&machTimeToNS_onceToken, &__block_literal_global_677);
  return v0 * machTimeToNS_timebase / *(unsigned int *)algn_1ED3362DC;
}

NSObject *AttentionServiceEventFilter::filter(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t IntegerValue;
  uint64_t v7;
  _BOOL4 v9;
  _BOOL4 v10;
  int Type;
  uint64_t v12;
  _BOOL4 v13;
  NSObject *v14;
  unint64_t v15;
  double v16;
  uint64_t v17;
  uint64_t TimeStamp;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  double v23;
  const __CFString *v24;
  NSObject *v25;
  unint64_t v27;
  double v28;
  int v29;
  double v30;
  double v31;
  uint8_t buf[4];
  double v33;
  __int16 v34;
  int v35;
  __int16 v36;
  NSObject *v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  double v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  double v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  IntegerValue = IOHIDEventGetIntegerValue();
  v7 = IOHIDEventGetIntegerValue();
  if (IntegerValue == 65289 && v7 == 2)
  {
    v10 = IOHIDEventGetIntegerValue() == 1;
    isSmartCoverEvent_flap1SensorIsEngaged = v10;
    v9 = isSmartCoverEvent_openSensorIsEngaged != 0;
  }
  else
  {
    if (IntegerValue != 65289 || v7 != 1)
      goto LABEL_10;
    v9 = IOHIDEventGetIntegerValue() == 1;
    isSmartCoverEvent_openSensorIsEngaged = v9;
    v10 = isSmartCoverEvent_flap1SensorIsEngaged != 0;
  }
  objc_msgSend(*(id *)(a1 + 24), "setSmartCoverClosed:", v10 & v9);
LABEL_10:
  if (objc_msgSend(*(id *)(a1 + 24), "clientCount") && (IOHIDEventGetEventFlags() & 0x800000) == 0)
  {
    Type = IOHIDEventGetType();
    v12 = 2;
    if (Type > 28)
    {
      if (Type > 38)
      {
        if (Type == 39)
        {
          v12 = 2048;
          goto LABEL_41;
        }
        if (Type == 42)
          goto LABEL_41;
      }
      else
      {
        if (Type == 29)
        {
          v12 = 512;
          goto LABEL_41;
        }
        if (Type == 35)
        {
          v12 = 64;
          goto LABEL_41;
        }
      }
    }
    else if (Type > 10)
    {
      if (Type == 11)
      {
        v12 = 8;
        goto LABEL_41;
      }
      if (Type == 17)
      {
        v12 = 16;
        goto LABEL_41;
      }
    }
    else
    {
      if (Type == 2)
        goto LABEL_41;
      if (Type == 3)
      {
        v12 = 4;
        if (IOHIDEventGetIntegerValue())
          v12 = 2;
LABEL_41:
        v17 = mach_absolute_time();
        TimeStamp = IOHIDEventGetTimeStamp();
        if (machTimeToNS_onceToken != -1)
          dispatch_once(&machTimeToNS_onceToken, &__block_literal_global_677);
        v19 = v17 * machTimeToNS_timebase / *(unsigned int *)algn_1ED3362DC;
        v20 = TimeStamp * (unint64_t)machTimeToNS_timebase / *(unsigned int *)algn_1ED3362DC;
        v21 = v19 - v20;
        if (v19 >= v20)
        {
          if (v21 < 0x2540BE401)
          {
            v14 = 0;
LABEL_58:
            objc_msgSend(*(id *)(a1 + 24), "processHIDEvent:mask:timestamp:senderID:", a3, v12, v20, a2);
LABEL_59:

            return a3;
          }
          v22 = (void *)MEMORY[0x1E0CB3940];
          if (v21 != -1)
          {
            v23 = (double)v21 / 1000000000.0;
            v24 = CFSTR("%13.5f seconds in the past");
            goto LABEL_53;
          }
          v24 = CFSTR("%13.5f seconds in the past");
        }
        else
        {
          v22 = (void *)MEMORY[0x1E0CB3940];
          if (v20 - v19 != -1)
          {
            v23 = (double)(v20 - v19) / 1000000000.0;
            v24 = CFSTR("%13.5f seconds in the future");
            goto LABEL_53;
          }
          v24 = CFSTR("%13.5f seconds in the future");
        }
        v23 = INFINITY;
LABEL_53:
        objc_msgSend(v22, "stringWithFormat:", v24, *(_QWORD *)&v23);
        v14 = objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          if (currentLogLevel >= 3)
          {
            _AALog();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              v27 = absTimeNS();
              if (v27 == -1)
                v28 = INFINITY;
              else
                v28 = (double)v27 / 1000000000.0;
              v29 = IOHIDEventGetType();
              if (v19 == -1)
                v30 = INFINITY;
              else
                v30 = (double)v19 / 1000000000.0;
              if (v20 == -1)
                v31 = INFINITY;
              else
                v31 = (double)v20 / 1000000000.0;
              *(_DWORD *)buf = 134219522;
              v33 = v28;
              v34 = 1024;
              v35 = v29;
              v36 = 2112;
              v37 = v14;
              v38 = 2048;
              v39 = v17;
              v40 = 2048;
              v41 = v30;
              v42 = 2048;
              v43 = TimeStamp;
              v44 = 2048;
              v45 = v31;
              _os_log_error_impl(&dword_1AF589000, v25, OS_LOG_TYPE_ERROR, "%13.5f: EventType %u from %@ (now %llu (%13.5f), event timestamp %llu (%13.5f))", buf, 0x44u);
            }

          }
          v20 = v19;
        }
        goto LABEL_58;
      }
    }
    if (currentLogLevel >= 7)
    {
      v13 = 1;
      if (Type <= 0x19)
      {
        if (((1 << Type) & 0x210F000) != 0)
          return a3;
        if (Type == 1)
          v13 = IOHIDEventGetIntegerValue() != 65292;
      }
      if (v13 && currentLogLevel >= 7)
      {
        _AALog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = absTimeNS();
          if (v15 == -1)
            v16 = INFINITY;
          else
            v16 = (double)v15 / 1000000000.0;
          *(_DWORD *)buf = 134218754;
          v33 = v16;
          v34 = 1024;
          v35 = IOHIDEventGetType();
          v36 = 2112;
          v37 = a3;
          v38 = 2112;
          v39 = a2;
          _os_log_impl(&dword_1AF589000, v14, OS_LOG_TYPE_DEFAULT, "%13.5f: unknown event type %u : %@ from sender %@", buf, 0x26u);
        }
        goto LABEL_59;
      }
    }
  }
  return a3;
}

void sub_1AF58CD8C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void updateDeadline(unint64_t *a1, unint64_t a2, void *a3, uint64_t a4, int a5)
{
  id v9;
  NSObject *v10;
  unint64_t v11;
  double v12;
  NSObject *v13;
  unint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  int v19;
  double v20;
  __int16 v21;
  id v22;
  __int16 v23;
  double v24;
  __int16 v25;
  double v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (*a1 <= a2)
  {
    if (currentLogLevel >= 7)
    {
      _AALog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = absTimeNS();
        if (v14 == -1)
          v15 = INFINITY;
        else
          v15 = (double)v14 / 1000000000.0;
        if (*a1 == -1)
          v17 = INFINITY;
        else
          v17 = (double)*a1 / 1000000000.0;
        if (a2 == -1)
          v18 = INFINITY;
        else
          v18 = (double)a2 / 1000000000.0;
        v19 = 134219266;
        v20 = v15;
        v21 = 2112;
        v22 = v9;
        v23 = 2048;
        v24 = v17;
        v25 = 2048;
        v26 = v18;
        v27 = 2080;
        v28 = a4;
        v29 = 1024;
        v30 = a5;
        _os_log_impl(&dword_1AF589000, v13, OS_LOG_TYPE_DEFAULT, "%13.5f: %@ ignoring updating from %13.5f to %13.5f (%s, line %d)", (uint8_t *)&v19, 0x3Au);
      }

    }
  }
  else
  {
    if (currentLogLevel >= 7)
    {
      _AALog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = absTimeNS();
        if (v11 == -1)
          v12 = INFINITY;
        else
          v12 = (double)v11 / 1000000000.0;
        if (*a1 == -1)
          v16 = INFINITY;
        else
          v16 = (double)*a1 / 1000000000.0;
        v19 = 134219266;
        v20 = v12;
        v21 = 2112;
        v22 = v9;
        v23 = 2048;
        v24 = v16;
        v25 = 2048;
        v26 = (double)a2 / 1000000000.0;
        v27 = 2080;
        v28 = a4;
        v29 = 1024;
        v30 = a5;
        _os_log_impl(&dword_1AF589000, v10, OS_LOG_TYPE_DEFAULT, "%13.5f: %@ updating from %13.5f to %13.5f (%s, line %d)", (uint8_t *)&v19, 0x3Au);
      }

    }
    *a1 = a2;
  }

}

void sub_1AF58D3C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF58D540(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _AALog()
{
  if (_AALog_onceToken != -1)
    dispatch_once(&_AALog_onceToken, &__block_literal_global_832);
  return (id)_AALog_log;
}

id awQueue(int a1)
{
  uint64_t *v1;

  if (a1)
  {
    if (awQueue_onceToken != -1)
      dispatch_once(&awQueue_onceToken, &__block_literal_global_94);
    v1 = &awQueue_queue;
  }
  else
  {
    if (awQueue_onceToken_97 != -1)
      dispatch_once(&awQueue_onceToken_97, &__block_literal_global_98);
    v1 = &awQueue_queue_96;
  }
  return (id)*v1;
}

id tagDescription(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("tagIndex %llu"), a1);
  }
  else if (isEventFilterProcess == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("tagIndex %llu (tag not present in server)"), a1);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("tagIndex %llu (nil tag)"), a1);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

__CFString *getEventMaskDescription(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  __CFString *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if ((a1 & 1) != 0)
  {
    objc_msgSend(v2, "appendString:", CFSTR("AttentionLost|"));
    a1 &= ~1uLL;
    if ((a1 & 2) == 0)
    {
LABEL_3:
      if ((a1 & 4) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "appendString:", CFSTR("Button|"));
  a1 &= ~2uLL;
  if ((a1 & 4) == 0)
  {
LABEL_4:
    if ((a1 & 8) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(v3, "appendString:", CFSTR("Keyboard|"));
  a1 &= ~4uLL;
  if ((a1 & 8) == 0)
  {
LABEL_5:
    if ((a1 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(v3, "appendString:", CFSTR("Digitizer|"));
  a1 &= ~8uLL;
  if ((a1 & 0x10) == 0)
  {
LABEL_6:
    if ((a1 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(v3, "appendString:", CFSTR("Pointer|"));
  a1 &= ~0x10uLL;
  if ((a1 & 0x20) == 0)
  {
LABEL_7:
    if ((a1 & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(v3, "appendString:", CFSTR("Remote|"));
  a1 &= ~0x20uLL;
  if ((a1 & 0x40) == 0)
  {
LABEL_8:
    if ((a1 & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(v3, "appendString:", CFSTR("GameController|"));
  a1 &= ~0x40uLL;
  if ((a1 & 0x80) == 0)
  {
LABEL_9:
    if ((a1 & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(v3, "appendString:", CFSTR("FaceDetect|"));
  a1 &= ~0x80uLL;
  if ((a1 & 0x100) == 0)
  {
LABEL_10:
    if ((a1 & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(v3, "appendString:", CFSTR("DigitalCrown|"));
  a1 &= ~0x100uLL;
  if ((a1 & 0x200) == 0)
  {
LABEL_11:
    if ((a1 & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(v3, "appendString:", CFSTR("MesaTouch|"));
  a1 &= ~0x200uLL;
  if ((a1 & 0x400) == 0)
  {
LABEL_12:
    if ((a1 & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(v3, "appendString:", CFSTR("RemoteProximity|"));
  a1 &= ~0x400uLL;
  if ((a1 & 0x800) == 0)
  {
LABEL_13:
    if (!a1)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_28:
  objc_msgSend(v3, "appendString:", CFSTR("GenericGesture|"));
  a1 &= ~0x800uLL;
  if (a1)
LABEL_14:
    objc_msgSend(v3, "appendFormat:", CFSTR("UNKNOWN EVENT MASK 0x%016llx|"), a1);
LABEL_15:
  v4 = objc_msgSend(v3, "length");
  if (v4)
  {
    objc_msgSend(v3, "deleteCharactersInRange:", v4 - 1, 1);
    v5 = v3;
  }
  else
  {
    v5 = CFSTR("NONE");
  }

  return v5;
}

id decodeString(void *a1, _BYTE *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  unint64_t v12;
  double v13;
  int v14;
  double v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a3;
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else if ((objc_msgSend(v5, "containsValueForKey:", v6) & 1) == 0)
  {
    if (currentLogLevel >= 3)
    {
      _AALog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v12 = absTimeNS();
        if (v12 == -1)
          v13 = INFINITY;
        else
          v13 = (double)v12 / 1000000000.0;
        v14 = 134218242;
        v15 = v13;
        v16 = 2112;
        v17 = v6;
        _os_log_error_impl(&dword_1AF589000, v10, OS_LOG_TYPE_ERROR, "%13.5f: failed to decode %@", (uint8_t *)&v14, 0x16u);
      }

    }
    *a2 = 1;
  }

  return v8;
}

uint64_t decodeUInt64(void *a1, _BYTE *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  unint64_t v11;
  double v12;
  int v13;
  double v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a1;
  objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_msgSend(v7, "unsignedLongLongValue");
  }
  else
  {
    if (currentLogLevel >= 3)
    {
      _AALog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v11 = absTimeNS();
        if (v11 == -1)
          v12 = INFINITY;
        else
          v12 = (double)v11 / 1000000000.0;
        v13 = 134218242;
        v14 = v12;
        v15 = 2112;
        v16 = v5;
        _os_log_error_impl(&dword_1AF589000, v9, OS_LOG_TYPE_ERROR, "%13.5f: failed to decode %@", (uint8_t *)&v13, 0x16u);
      }

    }
    v8 = 0;
    *a2 = 1;
  }

  return v8;
}

double decodeDouble(void *a1, _BYTE *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  NSObject *v10;
  unint64_t v12;
  double v13;
  int v14;
  double v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a1;
  objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "doubleValue");
    v9 = v8;
  }
  else
  {
    if (currentLogLevel >= 3)
    {
      _AALog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v12 = absTimeNS();
        if (v12 == -1)
          v13 = INFINITY;
        else
          v13 = (double)v12 / 1000000000.0;
        v14 = 134218242;
        v15 = v13;
        v16 = 2112;
        v17 = v5;
        _os_log_error_impl(&dword_1AF589000, v10, OS_LOG_TYPE_ERROR, "%13.5f: failed to decode %@", (uint8_t *)&v14, 0x16u);
      }

    }
    *a2 = 1;
    v9 = 0.0;
  }

  return v9;
}

void sub_1AF590494(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  uint64_t v12;
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v12 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_1AF591020(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AF5923A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AF593D3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF593EBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF5950CC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 120));
  _Unwind_Resume(a1);
}

void sub_1AF59677C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void __getPearlDevice_block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *v9;
  unint64_t v10;
  double v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  double v18;
  __int16 v19;
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D02808], "availableDevices");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v0 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
  if (v1)
  {
    v2 = v1;
    v3 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v14 != v3)
          objc_enumerationMutation(v0);
        v5 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v5, "type") == 2)
        {
          v12 = 0;
          objc_msgSend(MEMORY[0x1E0D027F0], "deviceWithDescriptor:error:", v5, &v12);
          v6 = objc_claimAutoreleasedReturnValue();
          v7 = v12;
          v8 = (void *)getPearlDevice_result;
          getPearlDevice_result = v6;

          if (v7 && currentLogLevel >= 3)
          {
            _AALog();
            v9 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
            {
              v10 = absTimeNS();
              if (v10 == -1)
                v11 = INFINITY;
              else
                v11 = (double)v10 / 1000000000.0;
              *(_DWORD *)buf = 134218242;
              v18 = v11;
              v19 = 2112;
              v20 = v7;
              _os_log_error_impl(&dword_1AF589000, v9, OS_LOG_TYPE_ERROR, "%13.5f: Failed to get pearl device: %@", buf, 0x16u);
            }

          }
          goto LABEL_15;
        }
      }
      v2 = objc_msgSend(v0, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
      if (v2)
        continue;
      break;
    }
  }
LABEL_15:

}

char *getDeviceStateDescription(uint64_t a1)
{
  id v2;
  uint64_t v3;

  if ((unint64_t)(a1 - 1) < 5)
    return off_1E5F8DE68[a1 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unknown BKPearlDeviceState %llu"), a1);
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = objc_msgSend(v2, "UTF8String");

  return (char *)v3;
}

char *getDeviceEventDescription(uint64_t a1)
{
  id v2;
  uint64_t v3;

  if ((unint64_t)(a1 - 1) < 0xC)
    return off_1E5F8DE08[a1 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unknown BKPearlDeviceEvent %llu"), a1);
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = objc_msgSend(v2, "UTF8String");

  return (char *)v3;
}

char *getEndReasonDescription(uint64_t a1)
{
  id v2;
  uint64_t v3;

  if ((unint64_t)(a1 - 1) < 4)
    return off_1E5F8DDE8[a1 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unknown BKOperationEndReason %llu"), a1);
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = objc_msgSend(v2, "UTF8String");

  return (char *)v3;
}

void __getPearlDevice_block_invoke_302()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *v9;
  unint64_t v10;
  double v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  double v18;
  __int16 v19;
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D02808], "availableDevices");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v0 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
  if (v1)
  {
    v2 = v1;
    v3 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v14 != v3)
          objc_enumerationMutation(v0);
        v5 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v5, "type") == 2)
        {
          v12 = 0;
          objc_msgSend(MEMORY[0x1E0D027F0], "deviceWithDescriptor:error:", v5, &v12);
          v6 = objc_claimAutoreleasedReturnValue();
          v7 = v12;
          v8 = (void *)getPearlDevice_result_300;
          getPearlDevice_result_300 = v6;

          if (v7 && currentLogLevel >= 3)
          {
            _AALog();
            v9 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
            {
              v10 = absTimeNS();
              if (v10 == -1)
                v11 = INFINITY;
              else
                v11 = (double)v10 / 1000000000.0;
              *(_DWORD *)buf = 134218242;
              v18 = v11;
              v19 = 2112;
              v20 = v7;
              _os_log_error_impl(&dword_1AF589000, v9, OS_LOG_TYPE_ERROR, "%13.5f: Failed to get pearl device: %@", buf, 0x16u);
            }

          }
          goto LABEL_15;
        }
      }
      v2 = objc_msgSend(v0, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
      if (v2)
        continue;
      break;
    }
  }
LABEL_15:

}

uint64_t AttentionServiceEventFilter::QueryInterface(AttentionServiceEventFilter *this, void *a2, CFUUIDBytes a3, void **a4)
{
  _QWORD *v4;
  CFUUIDRef v6;
  const __CFAllocator *v7;
  CFUUIDRef v8;
  CFUUIDRef v9;
  uint64_t v10;

  v4 = *(_QWORD **)&a3.byte8;
  v6 = CFUUIDCreateFromUUIDBytes(0, *(CFUUIDBytes *)&a2);
  v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE30];
  v8 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x1E0C9AE30], 0, 0, 0, 0, 0, 0, 0, 0, 0xC0u, 0, 0, 0, 0, 0, 0, 0x46u);
  if (CFEqual(v6, v8)
    || (v9 = CFUUIDGetConstantUUIDWithBytes(v7, 0x19u, 0xD7u, 0x74u, 0x41u, 0xBBu, 0xC4u, 0x45u, 0x11u, 0x91u, 0x49u, 0x60u, 0x57u, 0x2Au, 0xBu, 1u, 0x5Cu), CFEqual(v6, v9)))
  {
    v10 = 0;
    ++*((_DWORD *)this + 2);
  }
  else
  {
    this = 0;
    v10 = 2147483652;
  }
  *v4 = this;
  CFRelease(v6);
  return v10;
}

uint64_t AttentionServiceEventFilter::AddRef(AttentionServiceEventFilter *this, void *a2)
{
  uint64_t v2;

  v2 = (*((_DWORD *)this + 2) + 1);
  *((_DWORD *)this + 2) = v2;
  return v2;
}

uint64_t AttentionServiceEventFilter::Release(AttentionServiceEventFilter *this, void *a2)
{
  int v2;
  uint64_t v3;

  v2 = *((_DWORD *)this + 2);
  v3 = (v2 - 1);
  *((_DWORD *)this + 2) = v3;
  if (v2 == 1)
  {
    CFPlugInRemoveInstanceForFactory(*((CFUUIDRef *)this + 2));
    CFRelease(*((CFTypeRef *)this + 2));

    MEMORY[0x1B5DF8D50](this, 0x10E0C406288F30FLL);
  }
  return v3;
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

_DWORD *_AWAttentionServiceEventFilterFactory(const __CFAllocator *a1, const void *a2)
{
  const __CFAllocator *v4;
  CFUUIDRef v5;
  _DWORD *v6;
  const __CFUUID *v7;
  uint64_t v8;
  void *v9;

  isEventFilterProcess = 1;
  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE30];
  v5 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x1E0C9AE30], 0x7Fu, 0x1Au, 0x3Au, 0xE6u, 0x3Eu, 0x3Du, 0x47u, 0xAu, 0xBDu, 0x15u, 0xA2u, 0xDDu, 0x7Eu, 0x1Bu, 0xB7u, 0x19u);
  if (!CFEqual(a2, v5))
    return 0;
  v6 = CFAllocatorAllocate(a1, 32, 0);
  v7 = CFUUIDGetConstantUUIDWithBytes(v4, 0xE9u, 0xC1u, 0x6Bu, 0x10u, 0x46u, 0xD0u, 0x46u, 0x2Cu, 0x86u, 0xDDu, 0x34u, 0x46u, 0x45u, 0x10u, 0x56u, 0xAAu);
  *(_QWORD *)v6 = &AttentionServiceEventFilter::functionTable;
  v6[2] = 1;
  *((_QWORD *)v6 + 2) = 0;
  *((_QWORD *)v6 + 3) = 0;
  CFPlugInAddInstanceForFactory(v7);
  *((_QWORD *)v6 + 2) = CFRetain(v7);
  +[AWAttentionAwareService sharedAttentionService](AWAttentionAwareService, "sharedAttentionService");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)*((_QWORD *)v6 + 3);
  *((_QWORD *)v6 + 3) = v8;

  return v6;
}

void sub_1AF59A2C8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_1AF59A6AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AF59B254(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1AF59C1DC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1AF59D994(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF59E83C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF59E9D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__560(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__561(uint64_t a1)
{

}

void __registerForPrefsChange_block_invoke_223(uint64_t a1, void *a2)
{
  char isKindOfClass;
  void *v4;
  id v5;

  v5 = a2;
  if (!v5 || (isKindOfClass = objc_opt_isKindOfClass(), v4 = v5, (isKindOfClass & 1) != 0))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v4 = v5;
  }

}

void __registerForPrefsChange_block_invoke_2_226(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend((id)registerForPrefsChange_notifyBlocks, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)registerForPrefsChange_notifyBlocks, "setObject:forKeyedSubscript:");
  }
  v2 = (void *)MEMORY[0x1B5DF9110](*(_QWORD *)(a1 + 40));
  objc_msgSend(v5, "addObject:", v2);

  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend((id)registerForPrefsChange_curPrefs, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

}

uint64_t __registerForPrefsChange_block_invoke()
{
  uint64_t v0;
  void *v1;
  dispatch_queue_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int out_token;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)registerForPrefsChange_notifyBlocks;
  registerForPrefsChange_notifyBlocks = v0;

  v2 = dispatch_queue_create("com.apple.AttentionAwareness.PreferencesChanged", 0);
  v3 = (void *)registerForPrefsChange_queue;
  registerForPrefsChange_queue = (uint64_t)v2;

  getPreferences();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)registerForPrefsChange_curPrefs;
  registerForPrefsChange_curPrefs = v4;

  out_token = 0;
  return notify_register_dispatch("com.apple.AttentionAwareness.PreferencesChanged", &out_token, (dispatch_queue_t)registerForPrefsChange_queue, &__block_literal_global_222);
}

id getPreferences()
{
  CFDictionaryRef v0;
  void *v1;
  id v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__678;
  v10 = __Block_byref_object_dispose__679;
  v11 = 0;
  if (isEventFilterProcess == 1)
  {
    CFPreferencesAppSynchronize(CFSTR("com.apple.AttentionAwareness"));
    v0 = CFPreferencesCopyMultiple(0, CFSTR("com.apple.AttentionAwareness"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
    v1 = (void *)v7[5];
    v7[5] = (uint64_t)v0;

  }
  else
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getPreferences_block_invoke;
    v5[3] = &unk_1E5F8E188;
    v5[4] = &v6;
    v2 = +[AWServiceManager invokeWithService:](AWServiceManager, "invokeWithService:", v5);
  }
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void sub_1AF59F7C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __registerForPrefsChange_block_invoke_2()
{
  void *v0;
  uint64_t v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  BOOL v11;
  NSObject *v12;
  unint64_t v13;
  double v14;
  unint64_t v15;
  double v16;
  unint64_t v17;
  double v18;
  NSObject *v19;
  const char *v20;
  uint32_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  void *v28;
  __int128 v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[128];
  uint8_t buf[4];
  double v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  void *v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  getPreferences();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  objc_msgSend((id)registerForPrefsChange_notifyBlocks, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
  if (v1)
  {
    v3 = v1;
    v4 = *(_QWORD *)v36;
    *(_QWORD *)&v2 = 134218754;
    v29 = v2;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v36 != v4)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v5);
        objc_msgSend((id)registerForPrefsChange_curPrefs, "objectForKeyedSubscript:", v6, v29);
        v7 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v0, "objectForKeyedSubscript:", v6);
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = (void *)v8;
        if (v7 | v8)
        {
          if (v7)
            v10 = v8 == 0;
          else
            v10 = 0;
          if (v10)
          {
            if (currentLogLevel < 6)
              goto LABEL_36;
            _AALog();
            v12 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
              goto LABEL_35;
            v15 = absTimeNS();
            if (v15 == -1)
              v16 = INFINITY;
            else
              v16 = (double)v15 / 1000000000.0;
            *(_DWORD *)buf = 134218498;
            v41 = v16;
            v42 = 2112;
            v43 = v6;
            v44 = 2112;
            v45 = v7;
            v19 = v12;
            v20 = "%13.5f: preference %@ removed (was %@)";
LABEL_33:
            v21 = 32;
          }
          else
          {
            if (v7)
              v11 = 1;
            else
              v11 = v8 == 0;
            if (!v11)
            {
              if (currentLogLevel >= 6)
              {
                _AALog();
                v12 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
                {
                  v17 = absTimeNS();
                  if (v17 == -1)
                    v18 = INFINITY;
                  else
                    v18 = (double)v17 / 1000000000.0;
                  *(_DWORD *)buf = 134218498;
                  v41 = v18;
                  v42 = 2112;
                  v43 = v6;
                  v44 = 2112;
                  v45 = (uint64_t)v9;
                  v19 = v12;
                  v20 = "%13.5f: preference %@ set to %@";
                  goto LABEL_33;
                }
LABEL_35:

              }
LABEL_36:
              v33 = 0u;
              v34 = 0u;
              v31 = 0u;
              v32 = 0u;
              objc_msgSend((id)registerForPrefsChange_notifyBlocks, "objectForKeyedSubscript:", v6);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
              if (v23)
              {
                v24 = v23;
                v25 = *(_QWORD *)v32;
                do
                {
                  for (i = 0; i != v24; ++i)
                  {
                    if (*(_QWORD *)v32 != v25)
                      objc_enumerationMutation(v22);
                    (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i) + 16))();
                  }
                  v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
                }
                while (v24);
              }

              goto LABEL_44;
            }
            if ((objc_msgSend((id)v7, "isEqual:", v8) & 1) != 0)
              goto LABEL_44;
            if (currentLogLevel < 6)
              goto LABEL_36;
            _AALog();
            v12 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
              goto LABEL_35;
            v13 = absTimeNS();
            if (v13 == -1)
              v14 = INFINITY;
            else
              v14 = (double)v13 / 1000000000.0;
            *(_DWORD *)buf = v29;
            v41 = v14;
            v42 = 2112;
            v43 = v6;
            v44 = 2112;
            v45 = v7;
            v46 = 2112;
            v47 = v9;
            v19 = v12;
            v20 = "%13.5f: preference %@ changed from %@ to %@";
            v21 = 42;
          }
          _os_log_impl(&dword_1AF589000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, v21);
          goto LABEL_35;
        }
LABEL_44:

        ++v5;
      }
      while (v5 != v3);
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
      v3 = v27;
    }
    while (v27);
  }

  v28 = (void *)registerForPrefsChange_curPrefs;
  registerForPrefsChange_curPrefs = (uint64_t)v0;

}

uint64_t __machTimeToNS_block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&machTimeToNS_timebase);
}

uint64_t __Block_byref_object_copy__678(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__679(uint64_t a1)
{

}

uint64_t __getPreferences_block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __getPreferences_block_invoke_2;
  v3[3] = &unk_1E5F8E160;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "getDebugPreferences:", v3);
  return 0;
}

void __getPreferences_block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

__CFString *getNotificationMaskDescription(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  __CFString *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if ((a1 & 1) != 0)
  {
    objc_msgSend(v2, "appendString:", CFSTR("FaceDetectWasInterrupted|"));
    a1 &= ~1uLL;
    if ((a1 & 2) == 0)
    {
LABEL_3:
      if ((a1 & 4) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "appendString:", CFSTR("FaceDetectInterruptionDidEnd|"));
  a1 &= ~2uLL;
  if ((a1 & 4) == 0)
  {
LABEL_4:
    if ((a1 & 8) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  objc_msgSend(v3, "appendString:", CFSTR("FaceDetectWasDisabled|"));
  a1 &= ~4uLL;
  if ((a1 & 8) == 0)
  {
LABEL_5:
    if ((a1 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(v3, "appendString:", CFSTR("MotionDetectWasInterrupted|"));
  a1 &= ~8uLL;
  if ((a1 & 0x10) == 0)
  {
LABEL_6:
    if (!a1)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_14:
  objc_msgSend(v3, "appendString:", CFSTR("MotionDetectInterruptionDidEnd|"));
  a1 &= ~0x10uLL;
  if (a1)
LABEL_7:
    objc_msgSend(v3, "appendFormat:", CFSTR("UNKNOWN NOTIFICATION MASK 0x%016llx|"), a1);
LABEL_8:
  v4 = objc_msgSend(v3, "length");
  if (v4)
  {
    objc_msgSend(v3, "deleteCharactersInRange:", v4 - 1, 1);
    v5 = v3;
  }
  else
  {
    v5 = CFSTR("NONE");
  }

  return v5;
}

__CFString *getFaceDetectOrientationDescription(unint64_t a1)
{
  if (a1 < 5)
    return off_1E5F8E210[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unknown AWFaceDetectOrientation %llu"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *getEyeReliefFaceStateDescription(unint64_t a1)
{
  if (a1 < 6)
    return off_1E5F8E238[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unknown AWEyeReliefFaceState %llu"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t connectionHasEntitlement(void *a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "valueForEntitlement:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  return v4;
}

void __awQueue_block_invoke_2()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.AttentionAwareness.Framework", 0);
  v1 = (void *)awQueue_queue_96;
  awQueue_queue_96 = (uint64_t)v0;

}

void __awQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.AttentionAwareness.Server", 0);
  v1 = (void *)awQueue_queue;
  awQueue_queue = (uint64_t)v0;

}

id xpcInterfaceForScheduler()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE46A70);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE4B208);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE47030);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v1, sel_addClient_clientConfig_clientIndex_clientId_unitTestMode_reply_subscribeForStreamingEvents_, 0, 0);
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v2, sel_addClient_clientConfig_clientIndex_clientId_unitTestMode_reply_subscribeForStreamingEvents_, 0, 1);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE489A8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v3, sel_getUnitTestSamplerWithReply_, 0, 1);
  return v0;
}

id decodeStringSet(void *a1, _BYTE *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  id v16;
  NSObject *v17;
  unint64_t v19;
  double v20;
  _BYTE *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  double v27;
  __int16 v28;
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    if ((objc_msgSend(v5, "containsValueForKey:", v6) & 1) != 0)
    {
      v16 = 0;
      goto LABEL_19;
    }
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_15:
    if (currentLogLevel >= 3)
    {
      _AALog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v19 = absTimeNS();
        if (v19 == -1)
          v20 = INFINITY;
        else
          v20 = (double)v19 / 1000000000.0;
        *(_DWORD *)buf = 134218242;
        v27 = v20;
        v28 = 2112;
        v29 = v6;
        _os_log_error_impl(&dword_1AF589000, v17, OS_LOG_TYPE_ERROR, "%13.5f: Failed to decode %@", buf, 0x16u);
      }

    }
    v16 = 0;
    *a2 = 1;
    goto LABEL_19;
  }
  v21 = a2;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          a2 = v21;
          goto LABEL_15;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      if (v13)
        continue;
      break;
    }
  }

  v16 = v11;
LABEL_19:

  return v16;
}

uint64_t deviceSupportsPearl()
{
  uint64_t result;
  char *v1;
  int v2;
  int v3;
  NSObject *v4;
  unint64_t v5;
  double v6;
  size_t v7;
  size_t *v8;
  uint64_t v9;
  char v10;
  __int128 __s1;
  uint64_t (*v12)(uint64_t);
  void *v13;
  size_t *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  result = AVGestaltGetBoolAnswer();
  if ((_DWORD)result)
  {
    bzero(&__s1, 0x800uLL);
    v7 = 2048;
    sysctlbyname("kern.bootargs", &__s1, &v7, 0, 0);
    v1 = strstr((char *)&__s1, "disable-attention-checks");
    if (!v1 || (v2 = strtol(v1 + 25, 0, 0), result = 0, !v2))
    {
      if (isPearlDisabledViaAccessibility_onceToken != -1)
        dispatch_once(&isPearlDisabledViaAccessibility_onceToken, &__block_literal_global_242);
      v7 = 0;
      v8 = &v7;
      v9 = 0x2020000000;
      v10 = 0;
      *(_QWORD *)&__s1 = MEMORY[0x1E0C809B0];
      *((_QWORD *)&__s1 + 1) = 3221225472;
      v12 = __isPearlDisabledViaAccessibility_block_invoke_248;
      v13 = &unk_1E5F8E1F0;
      v14 = &v7;
      dispatch_sync((dispatch_queue_t)isPearlDisabledViaAccessibility_queue, &__s1);
      v3 = *((unsigned __int8 *)v8 + 24);
      _Block_object_dispose(&v7, 8);
      if (v3)
      {
        if (currentLogLevel >= 7)
        {
          _AALog();
          v4 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
          {
            v5 = absTimeNS();
            if (v5 == -1)
              v6 = INFINITY;
            else
              v6 = (double)v5 / 1000000000.0;
            LODWORD(__s1) = 134217984;
            *(double *)((char *)&__s1 + 4) = v6;
            _os_log_impl(&dword_1AF589000, v4, OS_LOG_TYPE_DEFAULT, "%13.5f: Pearl disabled via accessibility; disabling FaceDetect",
              (uint8_t *)&__s1,
              0xCu);
          }

        }
        return 0;
      }
      else
      {
        return 1;
      }
    }
  }
  return result;
}

uint64_t __isPearlDisabledViaAccessibility_block_invoke_248(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = isPearlDisabledViaAccessibility_accessibilityValue;
  return result;
}

uint64_t __isPearlDisabledViaAccessibility_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  const char *v2;
  int out_token;

  v0 = dispatch_queue_create("com.apple.AttentionAwareness.pearlAccessibilitySettingsChanged", 0);
  v1 = (void *)isPearlDisabledViaAccessibility_queue;
  isPearlDisabledViaAccessibility_queue = (uint64_t)v0;

  isPearlDisabledViaAccessibility_accessibilityValue = _AXSAttentionAwarenessFeaturesEnabled() == 0;
  out_token = 0;
  v2 = (const char *)objc_msgSend(objc_retainAutorelease((id)*MEMORY[0x1E0DDE020]), "UTF8String");
  return notify_register_dispatch(v2, &out_token, (dispatch_queue_t)isPearlDisabledViaAccessibility_queue, &__block_literal_global_244);
}

uint64_t __isPearlDisabledViaAccessibility_block_invoke_2()
{
  uint64_t result;
  NSObject *v1;
  unint64_t v2;
  double v3;
  const char *v4;
  int v5;
  double v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  result = _AXSAttentionAwarenessFeaturesEnabled();
  if (isPearlDisabledViaAccessibility_accessibilityValue != ((_DWORD)result == 0))
  {
    isPearlDisabledViaAccessibility_accessibilityValue = (_DWORD)result == 0;
    if (currentLogLevel >= 6)
    {
      _AALog();
      v1 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
      {
        v2 = absTimeNS();
        if (v2 == -1)
          v3 = INFINITY;
        else
          v3 = (double)v2 / 1000000000.0;
        v4 = "OFF";
        if (!isPearlDisabledViaAccessibility_accessibilityValue)
          v4 = "ON";
        v5 = 134218242;
        v6 = v3;
        v7 = 2080;
        v8 = v4;
        _os_log_impl(&dword_1AF589000, v1, OS_LOG_TYPE_DEFAULT, "%13.5f: Attention Aware Features set to %s", (uint8_t *)&v5, 0x16u);
      }

    }
    return notify_post("com.apple.AttentionAwareness.SupportedEventsChanged");
  }
  return result;
}

void sub_1AF5A18E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  uint64_t v45;

  _Block_object_dispose((const void *)(v45 - 160), 8);
  _Block_object_dispose(&a45, 8);
  _Block_object_dispose((const void *)(v45 - 240), 8);
  _Unwind_Resume(a1);
}

void sub_1AF5A1BA0(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  id *v4;
  id *v5;
  uint64_t v6;
  id *v7;

  v7 = v3;
  objc_destroyWeak(v7);
  objc_destroyWeak(v5);
  objc_destroyWeak(v4);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v6 - 112));
  _Unwind_Resume(a1);
}

void sub_1AF5A2F6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1073(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1074(uint64_t a1)
{

}

void __schedulerQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.AttentionAwareness.Scheduler", 0);
  v1 = (void *)schedulerQueue_queue;
  schedulerQueue_queue = (uint64_t)v0;

}

void AWStartAttentionAwarenessServer()
{
  NSObject *v0;
  unint64_t v1;
  double v2;
  int v3;
  double v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (currentLogLevel >= 6)
  {
    _AALog();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      v1 = absTimeNS();
      if (v1 == -1)
        v2 = INFINITY;
      else
        v2 = (double)v1 / 1000000000.0;
      v3 = 134217984;
      v4 = v2;
      _os_log_impl(&dword_1AF589000, v0, OS_LOG_TYPE_DEFAULT, "%13.5f: This method doesn't do anything, this is an empty stub", (uint8_t *)&v3, 0xCu);
    }

  }
}

void _AWStartStandaloneServer()
{
  CFUUIDRef v0;
  __IOHIDEventSystemClient *v1;
  NSObject *v2;
  dispatch_queue_t v3;
  unint64_t v4;
  double v5;
  uint8_t buf[4];
  double v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v0 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x1E0C9AE30], 0x7Fu, 0x1Au, 0x3Au, 0xE6u, 0x3Eu, 0x3Du, 0x47u, 0xAu, 0xBDu, 0x15u, 0xA2u, 0xDDu, 0x7Eu, 0x1Bu, 0xB7u, 0x19u);
  _AWAttentionServiceEventFilterFactory(0, v0);
  v1 = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreateWithType();
  if (!IOHIDEventSystemClientSetProperty(v1, CFSTR("ClientEventFilter"), &unk_1E5F97AD0) && currentLogLevel >= 3)
  {
    _AALog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v4 = absTimeNS();
      if (v4 == -1)
        v5 = INFINITY;
      else
        v5 = (double)v4 / 1000000000.0;
      *(_DWORD *)buf = 134217984;
      v7 = v5;
      _os_log_error_impl(&dword_1AF589000, v2, OS_LOG_TYPE_ERROR, "%13.5f: IOHIDEventSystemClientSetProperty failed", buf, 0xCu);
    }

  }
  IOHIDEventSystemClientRegisterEventBlock();
  v3 = dispatch_queue_create("com.apple.AttentionAwareness.StandaloneServerQueue", 0);
  IOHIDEventSystemClientScheduleWithDispatchQueue();

}

void sub_1AF5A4598(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 120));
  _Unwind_Resume(a1);
}

void sub_1AF5A5C5C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

char *getAttentionSamplerStateDescription(unsigned int a1)
{
  id v2;
  uint64_t v3;

  if (a1 < 6)
    return off_1E5F8E4B8[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unknown AWAttentionSamplerState %llu"), a1);
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = objc_msgSend(v2, "UTF8String");

  return (char *)v3;
}

void sub_1AF5A6778(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF5A730C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1552(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1553(uint64_t a1)
{

}

void sub_1AF5A7450(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF5A757C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF5A76AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF5A77D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF5A7904(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF5A7E00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF5A876C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF5AAD08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF5AE75C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1903(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1904(uint64_t a1)
{

}

void sub_1AF5B27F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF5B29F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF5B2E9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF5B30C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1AF5B32C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF5B3B08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2138(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2139(uint64_t a1)
{

}

void sub_1AF5B40C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF5B4374(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF5B45EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF5B482C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF5B4A00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF5B4C30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AVGestaltGetBoolAnswer()
{
  return MEMORY[0x1E0C8A6A8]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1E0D15420]();
}

uint64_t BKSHIDServicesIsSmartCoverClosed()
{
  return MEMORY[0x1E0D00B48]();
}

uint64_t BLSBacklightStateIsActive()
{
  return MEMORY[0x1E0D00EF0]();
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x1E0C97C98](allocator, size, hint);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

void CFPlugInAddInstanceForFactory(CFUUIDRef factoryID)
{
  MEMORY[0x1E0C989D8](factoryID);
}

void CFPlugInRemoveInstanceForFactory(CFUUIDRef factoryID)
{
  MEMORY[0x1E0C98A20](factoryID);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFDictionaryRef CFPreferencesCopyMultiple(CFArrayRef keysToFetch, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98A58](keysToFetch, applicationID, userName, hostName);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x1E0C99530](alloc, *(_QWORD *)&bytes.byte0, *(_QWORD *)&bytes.byte8);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return (CFUUIDRef)MEMORY[0x1E0C99558](alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6);
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x1E0C9F318](retstr, value, *(_QWORD *)&timescale);
}

uint64_t IOHIDEventGetEventFlags()
{
  return MEMORY[0x1E0CBB118]();
}

uint64_t IOHIDEventGetIntegerValue()
{
  return MEMORY[0x1E0CBB130]();
}

uint64_t IOHIDEventGetTimeStamp()
{
  return MEMORY[0x1E0CBB158]();
}

uint64_t IOHIDEventGetType()
{
  return MEMORY[0x1E0CBB168]();
}

uint64_t IOHIDEventSystemClientCreateWithType()
{
  return MEMORY[0x1E0CBB1F8]();
}

uint64_t IOHIDEventSystemClientRegisterEventBlock()
{
  return MEMORY[0x1E0CBB218]();
}

uint64_t IOHIDEventSystemClientScheduleWithDispatchQueue()
{
  return MEMORY[0x1E0CBB248]();
}

Boolean IOHIDEventSystemClientSetProperty(IOHIDEventSystemClientRef client, CFStringRef key, CFTypeRef property)
{
  return MEMORY[0x1E0CBB278](client, key, property);
}

uint64_t IOHIDServiceGetProperty()
{
  return MEMORY[0x1E0CBB520]();
}

uint64_t IOHIDServiceGetTypeID()
{
  return MEMORY[0x1E0CBB530]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

NSZone *NSDefaultMallocZone(void)
{
  return (NSZone *)MEMORY[0x1E0CB2960]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

uint64_t PLLogTimeSensitiveRegisteredEvent()
{
  return MEMORY[0x1E0D7FE30]();
}

uint64_t _AXSAttentionAwarenessFeaturesEnabled()
{
  return MEMORY[0x1E0DDD5C0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

uint64_t operator delete()
{
  return off_1E5F8D6B8();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

uint64_t analytics_send_event()
{
  return MEMORY[0x1E0D15468]();
}

int audit_token_to_pidversion(audit_token_t *atoken)
{
  return MEMORY[0x1E0DE40F8](atoken);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
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

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x1E0C82F08](object, queue);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F48](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x1E0C82F88](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1E0C83590](*(_QWORD *)&a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1E0C83C70]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x1E0C840B8](__b, __pattern16, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
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

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

int shm_open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C853A8](a1, *(_QWORD *)&a2);
}

int shm_unlink(const char *a1)
{
  return MEMORY[0x1E0C853B0](a1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1E0C85610](__s1, __s2);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85658](__str, __endptr, *(_QWORD *)&__base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86360](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

