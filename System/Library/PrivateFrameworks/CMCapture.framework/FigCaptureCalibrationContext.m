@implementation FigCaptureCalibrationContext

- (NSDictionary)lastSuccessfulCalibrationData
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_lastSuccessfulCalibrationData, "copy");
}

+ (void)initialize
{
  objc_opt_class();
}

+ (id)calibrationDataStringForInternalLogging:(id)a3
{
  return 0;
}

+ (unsigned)calibrationStatusFromRawStreamCalibrationData:(id)a3
{
  return 0;
}

+ (id)createRawStreamCalibrationDataWithFailureReasons:(int)a3
{
  return 0;
}

- (FigCaptureCalibrationContext)initWithSupportedDeviceNames:(id)a3
{
  return 0;
}

- (FigCaptureCalibrationContext)initWithPreferenceString:(id)a3 withActivityName:(id)a4 withPropertyName:(id)a5 withExpectedDataSize:(unint64_t)a6 withInterval:(int)a7 withMinimumBatteryLevel:(int)a8 withInternalLogName:(id)a9 supportedDeviceNames:(id)a10
{
  FigCaptureCalibrationContext *v16;
  void *v17;
  uint64_t v18;
  double Current;
  objc_super v21;

  if (a3)
  {
    v21.receiver = self;
    v21.super_class = (Class)FigCaptureCalibrationContext;
    v16 = -[FigCaptureCalibrationContext init](&v21, sel_init);
    if (v16)
    {
      v17 = (void *)CFPreferencesCopyValue((CFStringRef)a3, CFSTR("com.apple.cameracapture.volatile"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
      v18 = objc_msgSend((id)objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("CalibrationData")), "mutableCopy");
      v16->_lastSuccessfulCalibrationData = (NSMutableDictionary *)v18;
      if (!v18)
        v16->_lastSuccessfulCalibrationData = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      if (objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("TimeStampOfLastSuccessfulCalibration")))
        objc_msgSend((id)objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("TimeStampOfLastSuccessfulCalibration")), "doubleValue");
      else
        Current = CFAbsoluteTimeGetCurrent();
      v16->_lastSuccessfulCalibrationTimeStamp = Current;
      if (objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("CalibrationCompassHeading")))
        objc_msgSend((id)objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("CalibrationCompassHeading")), "getBytes:length:", &v16->_lastSuccessfulCalibrationMagneticField, 24);

      v16->_activityName = (NSString *)a4;
      v16->_preferenceString = (NSString *)a3;
      v16->_interval = a7;
      v16->_minimumBatteryLevelToRun = a8;
      v16->_internalLogName = (NSString *)a9;
      v16->_propertyName = (NSString *)a5;
      v16->_expectedDataSize = a6;
      v16->_supportedDevices = (NSArray *)a10;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  return v16;
}

- (void)setLastSuccessfulCalibrationData:(id)a3
{
  -[NSMutableDictionary addEntriesFromDictionary:](self->_lastSuccessfulCalibrationData, "addEntriesFromDictionary:", a3);
}

- (void)updateWithNewCalibrationData:(id)a3 orExternalErrors:(unsigned int)a4 magneticFieldAttempts:(int)a5 magneticField:(id)a6 isCalibrationValid:(BOOL *)a7 calibrationStatus:(unsigned int *)a8
{
  uint64_t v10;
  uint64_t v11;
  double var2;
  double var1;
  double var0;
  id v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  int v22;
  int v23;
  double v24;
  _BOOL8 v25;
  BOOL *v26;
  unsigned int *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v10 = *(_QWORD *)&a5;
  v11 = *(_QWORD *)&a4;
  var2 = a6.var2;
  var1 = a6.var1;
  var0 = a6.var0;
  v15 = a3;
  v33 = *MEMORY[0x1E0C80C00];
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v17 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v17)
  {
    v18 = v17;
    v26 = a7;
    v27 = a8;
    v19 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v29 != v19)
          objc_enumerationMutation(v15);
        v21 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        if ((objc_msgSend(v21, "isEqualToString:", CFSTR("Back Camera")) & 1) != 0
          || objc_msgSend(v21, "isEqualToString:", CFSTR("Back Telephoto Camera")))
        {
          v22 = objc_msgSend((id)objc_opt_class(), "calibrationStatusFromRawStreamCalibrationData:", objc_msgSend(v15, "objectForKeyedSubscript:", v21));
          if (v22)
          {
            v23 = v22;
            goto LABEL_13;
          }
        }
      }
      v18 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v18)
        continue;
      break;
    }
    v23 = 0;
LABEL_13:
    a7 = v26;
    a8 = v27;
    v10 = v10;
  }
  else
  {
    v23 = 0;
  }
  v24 = sqrt(var1 * var1 + var0 * var0 + var2 * var2);
  if (!v15)
    v15 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v25 = (-[FigCaptureCalibrationContext _updateAndStashCalibrationData:externalErrors:hasFirmwareErrors:magneticFieldAttempts:magneticField:]((CFStringRef *)self, v15, v11, v23 != 0, v10, var0, var1, var2) | v11 | v23) == 0;
  -[FigCaptureCalibrationContext _writeCalibrationDataToInternalLogFile:magneticField:]((uint64_t)self, v15, var0, var1, var2);
  -[FigCaptureCalibrationContext reportLoggingWithCalibrationData:isValid:magneticFieldMagnitude:](self, "reportLoggingWithCalibrationData:isValid:magneticFieldMagnitude:", v15, v25, v24);
  if (a7)
    *a7 = v25;
  if (a8)
    *a8 = !v25 | v11 | v23;
}

- (uint64_t)_updateAndStashCalibrationData:(uint64_t)a3 externalErrors:(char)a4 hasFirmwareErrors:(uint64_t)a5 magneticFieldAttempts:(double)a6 magneticField:(double)a7
{
  double Current;
  double v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  const __CFString *v18;
  char v20;
  double v21;
  double v22;
  double v23;

  v21 = a6;
  v22 = a7;
  v23 = a8;
  if (!a1)
    return 0;
  Current = CFAbsoluteTimeGetCurrent();
  -[CFStringRef lastSuccessfulCalibrationTimeStamp](a1, "lastSuccessfulCalibrationTimeStamp");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", Current - v14), CFSTR("TimeSinceLastSuccessfulCalibration"));
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v21, 24), CFSTR("CalibrationCompassHeading"));
  v20 = 0;
  if ((_DWORD)a3 || (a4 & 1) != 0)
  {
    if (!(_DWORD)a3)
      goto LABEL_10;
    objc_msgSend(a2, "addEntriesFromDictionary:", -[FigCaptureCalibrationContext _createDictionaryForFailureOutsideFirmwareWithReasons:]((uint64_t)a1, a3));
LABEL_9:
    a3 = 0;
    goto LABEL_10;
  }
  -[CFStringRef pushCalibrationDataToHistory:isRejected:](a1, "pushCalibrationDataToHistory:isRejected:", a2, &v20);
  if (!v20)
  {
    -[CFStringRef setLastSuccessfulCalibrationData:](a1, "setLastSuccessfulCalibrationData:", a2);
    -[CFStringRef setLastSuccessfulCalibrationTimeStamp:](a1, "setLastSuccessfulCalibrationTimeStamp:", Current);
    -[CFStringRef setLastSuccessfulCalibrationMagneticField:](a1, "setLastSuccessfulCalibrationMagneticField:", v21, v22, v23);
    if (!v20)
      goto LABEL_9;
  }
  a3 = 257;
  objc_msgSend((id)objc_opt_class(), "setStatusForCalibrationData:status:", a2, 257);
LABEL_10:
  v15 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v15, "setObject:forKeyedSubscript:", -[CFStringRef lastSuccessfulCalibrationData](a1, "lastSuccessfulCalibrationData"), CFSTR("CalibrationData"));
  v16 = (void *)MEMORY[0x1E0CB37E8];
  -[CFStringRef lastSuccessfulCalibrationTimeStamp](a1, "lastSuccessfulCalibrationTimeStamp");
  objc_msgSend(v15, "setObject:forKeyedSubscript:", objc_msgSend(v16, "numberWithDouble:"), CFSTR("TimeStampOfLastSuccessfulCalibration"));
  objc_msgSend(v15, "setObject:forKeyedSubscript:", -[CFStringRef calibrationDataHistory](a1, "calibrationDataHistory"), CFSTR("CalibrationHistory"));
  v17 = (const __CFString *)*MEMORY[0x1E0C9B260];
  v18 = (const __CFString *)*MEMORY[0x1E0C9B230];
  CFPreferencesSetValue(a1[7], v15, CFSTR("com.apple.cameracapture.volatile"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  CFPreferencesSetValue(CFSTR("magnetic_field_attempts"), (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a5), CFSTR("com.apple.cameracapture.volatile"), v17, v18);
  CFPreferencesSynchronize(CFSTR("com.apple.cameracapture.volatile"), v17, v18);
  return a3;
}

- (void)_writeCalibrationDataToInternalLogFile:(double)a3 magneticField:(double)a4
{
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;

  if (a1)
  {
    v23 = 0;
    if (*(_QWORD *)(a1 + 88) && (MGGetBoolAnswer() & 1) == 0 && MGGetBoolAnswer())
    {
      v10 = objc_msgSend((id)objc_opt_class(), "calibrationDataStringForInternalLogging:", a2);
      if (v10)
      {
        v11 = v10;
        v12 = objc_alloc_init(MEMORY[0x1E0CB3578]);
        objc_msgSend(v12, "setTimeZone:", objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone"));
        objc_msgSend(v12, "setDateFormat:", CFSTR("yyyy-MM-dd"));
        v13 = objc_msgSend(v12, "stringFromDate:", objc_msgSend(MEMORY[0x1E0C99D68], "date"));
        if (FigCaptureCameracapturedEnabled())
          v14 = CFSTR("cameracaptured");
        else
          v14 = CFSTR("mediaserverd");
        v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@-%@.log"), v14, *(_QWORD *)(a1 + 88), v13);
        v16 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/private/var/mobile/Library/Logs/CrashReporter/%@"), v14);
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v16, 1, 0, &v23);
        v17 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), v16, v15);
        if (!v23)
        {
          v18 = v17;
          v19 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("TimeSinceLastSuccessfulCalibration")), "longLongValue");
          objc_msgSend(v12, "setDateFormat:", CFSTR("HH:mm:ss"));
          v20 = objc_msgSend(v12, "stringFromDate:", objc_msgSend(MEMORY[0x1E0C99D68], "date"));
          v21 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
          objc_msgSend(v21, "appendFormat:", CFSTR("%@, "), v20);
          objc_msgSend(v21, "appendFormat:", CFSTR("%lld, "), v19);
          objc_msgSend(v21, "appendFormat:", CFSTR("%f, %f, %f, %f, "), *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, sqrt(a4 * a4 + a3 * a3 + a5 * a5));
          objc_msgSend(v21, "appendString:", v11);
          objc_msgSend(v21, "appendString:", CFSTR("\n"));
          if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", v18) & 1) == 0)
            objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "createFileAtPath:contents:attributes:", v18, 0, 0);
          v22 = (void *)objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForUpdatingAtPath:", v18);
          objc_msgSend(v22, "seekToEndOfFile");
          objc_msgSend(v22, "writeData:", objc_msgSend(v21, "dataUsingEncoding:", 4));
          objc_msgSend(v22, "closeFile");
          goto LABEL_13;
        }
LABEL_17:
        v21 = 0;
LABEL_13:

        return;
      }
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    v12 = 0;
    goto LABEL_17;
  }
}

- (void)pushCalibrationDataToHistory:(id)a3 isRejected:(BOOL *)a4
{
  if (a4)
    *a4 = 0;
}

- (id)calibrationDataHistory
{
  return 0;
}

- (void)_createDictionaryForFailureOutsideFirmwareWithReasons:(uint64_t)a1
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (!*(_QWORD *)(a1 + 96))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = *(void **)(a1 + 96);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v10, "isEqualToString:", CFSTR("Back Camera")) & 1) != 0
          || objc_msgSend(v10, "isEqualToString:", CFSTR("Back Telephoto Camera")))
        {
          objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_opt_class(), "createRawStreamCalibrationDataWithFailureReasons:", a2), v10);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
  return v4;
}

- (double)lastSuccessfulCalibrationTimeStamp
{
  return self->_lastSuccessfulCalibrationTimeStamp;
}

- (void)setLastSuccessfulCalibrationTimeStamp:(double)a3
{
  self->_lastSuccessfulCalibrationTimeStamp = a3;
}

- ($1AB5FA073B851C12C2339EC22442E995)lastSuccessfulCalibrationMagneticField
{
  double x;
  double y;
  double z;
  $1AB5FA073B851C12C2339EC22442E995 result;

  x = self->_lastSuccessfulCalibrationMagneticField.x;
  y = self->_lastSuccessfulCalibrationMagneticField.y;
  z = self->_lastSuccessfulCalibrationMagneticField.z;
  result.var2 = z;
  result.var1 = y;
  result.var0 = x;
  return result;
}

- (void)setLastSuccessfulCalibrationMagneticField:(id)a3
{
  self->_lastSuccessfulCalibrationMagneticField = ($83A9B0F16167884A9BDC45564D3E7367)a3;
}

- (NSString)activityName
{
  return self->_activityName;
}

- (NSString)propertyName
{
  return self->_propertyName;
}

- (unint64_t)expectedDataSize
{
  return self->_expectedDataSize;
}

- (int)interval
{
  return self->_interval;
}

- (int)minimumBatteryLevelToRun
{
  return self->_minimumBatteryLevelToRun;
}

@end
