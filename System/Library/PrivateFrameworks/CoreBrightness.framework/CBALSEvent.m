@implementation CBALSEvent

- (CBALSEvent)initWithHIDEvent:(__IOHIDEvent *)a3 andNode:(id)a4
{
  self->_node = (CBALSNode *)a4;
  return -[CBALSEvent initWithHIDEvent:andService:](self, "initWithHIDEvent:andService:", a3, objc_msgSend(a4, "alsService"));
}

- (int)orientation
{
  return self->_orientation;
}

- (BOOL)firstALSSample
{
  return self->_firstALSSample;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBALSEvent *v4;

  v4 = self;
  v3 = a2;
  if (self->_logHandle)
  {

    v4->_logHandle = 0;
  }
  if (v4->_event)
    CFRelease(v4->_event);

  v2.receiver = v4;
  v2.super_class = (Class)CBALSEvent;
  -[CBHIDEvent dealloc](&v2, sel_dealloc);
}

- (BOOL)obstructed
{
  return self->_obstructed;
}

- (BOOL)colorMitigationTriggered
{
  return self->_colorMitigationTriggered;
}

- ($924AC8E0FA23A5AC9EC0E1AB0C26E9F0)vendorData
{
  $924AC8E0FA23A5AC9EC0E1AB0C26E9F0 *result;

  objc_copyStruct(retstr, &self->_vendorData, 137, 1, 0);
  return result;
}

- (double)illuminance
{
  return self->_illuminance;
}

- (void)setColorMitigationTriggered:(BOOL)a3
{
  self->_colorMitigationTriggered = a3;
}

- ($19B4751B73AD1118B57C51FD5D878305)colorSample
{
  $19B4751B73AD1118B57C51FD5D878305 *result;

  objc_copyStruct(retstr, &self->_colorSample, 60, 1, 0);
  return result;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ALS event = [Orientation = %d; Illuminance = %f; xy = (%f,%f); XYZ = (%f,%f,%f); CCT1 = %f; Integration time = %f; Gain = %d; Obstructed = %d; First = %d, mitigation = %d, timestamp = %u]"),
               self->_orientation,
               *(_QWORD *)&self->_illuminance,
               self->_colorSample.xy.x,
               self->_colorSample.xy.y,
               self->_colorSample.XYZ[0],
               self->_colorSample.XYZ[1],
               self->_colorSample.XYZ[2],
               self->_colorSample.CCT1,
               self->_integrationTime,
               self->_vendorData.gain,
               self->_obstructed,
               self->_firstALSSample,
               self->_colorMitigationTriggered,
               self->_vendorData.sensorTimestamp,
               a2,
               self);
}

- (CBALSEvent)initWithHIDEvent:(__IOHIDEvent *)a3 andService:(__IOHIDServiceClient *)a4
{
  os_log_t v4;
  unint64_t v5;
  unint64_t v6;
  mach_timebase_info v7;
  double v8;
  int v9;
  double v10;
  double v11;
  double v12;
  double v13;
  float illuminance;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t inited;
  NSObject *logHandle;
  int orientation;
  $ADDDEAB278A19E0920CB41046CEA3ACE *__dst;
  double IntegerValue;
  uint8_t v29[7];
  os_log_type_t v30;
  os_log_t v31;
  uint8_t v32[7];
  os_log_type_t v33;
  os_log_t v34;
  os_log_type_t type;
  os_log_t oslog;
  _BYTE __b[137];
  mach_timebase_info info;
  objc_super v39;
  __IOHIDServiceClient *v40;
  __IOHIDEvent *v41;
  SEL v42;
  CBALSEvent *v43;
  uint8_t v45[56];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v43 = self;
  v42 = a2;
  v41 = a3;
  v40 = a4;
  v39.receiver = self;
  v39.super_class = (Class)CBALSEvent;
  v43 = -[CBHIDEvent initWithHIDEvent:andService:](&v39, sel_initWithHIDEvent_andService_, a3, a4);
  if (!v43)
    return v43;
  v4 = os_log_create("com.apple.CoreBrightness.CBALSEvent", "default");
  v43->_logHandle = (OS_os_log *)v4;
  if (v41 && IOHIDEventGetType() == 12)
  {
    CFRetain(v41);
    v43->_event = v41;
    info = 0;
    mach_timebase_info(&info);
    v7 = info;
    LODWORD(v6) = v7.denom;
    LODWORD(v5) = v7.numer;
    v43->super._sMachTimebaseFactor = (double)v5 / (double)v6 * 0.000000001;
    if (v43->_node && -[CBALSNode supportsFloatLux](v43->_node, "supportsFloatLux"))
    {
      IOHIDEventGetDoubleValue();
      IntegerValue = v8;
    }
    else
    {
      IntegerValue = (double)IOHIDEventGetIntegerValue();
    }
    v43->_illuminance = IntegerValue;
    v9 = -[CBALSEvent getServiceOrientation:](v43, "getServiceOrientation:", v40);
    v43->_orientation = v9;
    if (IOHIDEventGetIntegerValue() == 1)
    {
      IOHIDEventGetDoubleValue();
      *(float *)&v10 = v10 / 3.14159265;
      v43->_colorSample.XYZ[0] = *(float *)&v10;
      IOHIDEventGetDoubleValue();
      *(float *)&v11 = v11 / 3.14159265;
      v43->_colorSample.XYZ[1] = *(float *)&v11;
      IOHIDEventGetDoubleValue();
      *(float *)&v12 = v12 / 3.14159265;
      v43->_colorSample.XYZ[2] = *(float *)&v12;
      IOHIDEventGetFloatValue();
      *(float *)&v13 = v13;
      v43->_colorSample.CCT1 = *(float *)&v13;
      if (v43->_colorSample.XYZ[0] == 0.0 || v43->_colorSample.XYZ[1] == 0.0)
      {
        LODWORD(v13) = 0;
        v43->_colorSample.xy.y = 0.0;
        v43->_colorSample.xy.x = 0.0;
      }
      else
      {
        *(float *)&v13 = CFXTristimulus2Chromaticity(v43->_colorSample.XYZ, (float *)&v43->_colorSample.xy);
      }
      __dst = &v43->_vendorData;
      if (v43)
        -[CBALSEvent copyVendorDataFromEvent:](v43, "copyVendorDataFromEvent:", v41, v13);
      else
        memset(__b, 0, sizeof(__b));
      memcpy(__dst, __b, 0x89uLL);
      v43->_integrationTime = (float)v43->_vendorData.integrationTime / 1000000.0;
      illuminance = v43->_illuminance;
      v43->_colorSample.extra.brightness = illuminance;
      if (v40)
        orientation = v43->_orientation;
      else
        orientation = v43->_vendorData.orientation;
      v43->_colorSample.extra.orientation = orientation;
      v43->_colorSample.extra.nChannels = v43->_vendorData.nChannels;
      __memcpy_chk();
      v43->_supportColor = 1;
      oslog = 0;
      if (v43->_logHandle)
      {
        logHandle = v43->_logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          inited = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          inited = init_default_corebrightness_log();
        logHandle = inited;
      }
      oslog = logHandle;
      type = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_0_4_8_0_8_0_8_0_8_0((uint64_t)v45, COERCE__INT64(v43->_colorSample.XYZ[0]), COERCE__INT64(v43->_colorSample.XYZ[1]), COERCE__INT64(v43->_colorSample.XYZ[2]), COERCE__INT64(v43->_colorSample.CCT1));
        _os_log_debug_impl(&dword_1B5291000, oslog, type, "Tristimulus values: XYZ[0]=%f, XYZ[1]=%f, XYZ[2]=%f | CCT1=%f", v45, 0x2Au);
      }
    }
    else
    {
      v43->_supportColor = 0;
      v34 = 0;
      if (v43->_logHandle)
      {
        v23 = v43->_logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v22 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v22 = init_default_corebrightness_log();
        v23 = v22;
      }
      v34 = v23;
      v33 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        v20 = v34;
        v21 = v33;
        __os_log_helper_16_0_0(v32);
        _os_log_debug_impl(&dword_1B5291000, v20, v21, "error: invalid Color space, can't load harmony data", v32, 2u);
      }
    }
    v43->_obstructed = 0;
    v43->_firstALSSample = 0;
    v43->_colorMitigationTriggered = 0;
    return v43;
  }
  v31 = 0;
  if (v43->_logHandle)
  {
    v19 = v43->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      v18 = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      v18 = init_default_corebrightness_log();
    v19 = v18;
  }
  v31 = v19;
  v30 = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    v16 = v31;
    v17 = v30;
    __os_log_helper_16_0_0(v29);
    _os_log_error_impl(&dword_1B5291000, v16, v17, "HID Event type is not ALS", v29, 2u);
  }

  v43 = 0;
  return 0;
}

- ($924AC8E0FA23A5AC9EC0E1AB0C26E9F0)copyVendorDataFromEvent:(SEL)a3
{
  $924AC8E0FA23A5AC9EC0E1AB0C26E9F0 *result;

  memset(retstr, 0, 0x89uLL);
  result = ($924AC8E0FA23A5AC9EC0E1AB0C26E9F0 *)IOHIDEventGetChildren();
  if (result)
  {
    result = ($924AC8E0FA23A5AC9EC0E1AB0C26E9F0 *)CFArrayGetValueAtIndex((CFArrayRef)result, 0);
    if (result)
    {
      result = ($924AC8E0FA23A5AC9EC0E1AB0C26E9F0 *)IOHIDEventGetDataValue();
      if (result)
      {
        IOHIDEventGetIntegerValue();
        return ($924AC8E0FA23A5AC9EC0E1AB0C26E9F0 *)__memcpy_chk();
      }
    }
  }
  return result;
}

- (int)getServiceOrientation:(__IOHIDServiceClient *)a3
{
  void *cf;
  int v5;

  v5 = 0;
  if (self->_node)
    return -[CBALSNode orientation](self->_node, "orientation");
  if (a3)
  {
    cf = (void *)IOHIDServiceClientCopyProperty(a3, CFSTR("Orientation"));
    if (cf)
    {
      v5 = objc_msgSend(cf, "intValue");
      CFRelease(cf);
    }
  }
  return v5;
}

- (float)strength
{
  return self->_strength;
}

- (void)setStrength:(float)a3
{
  self->_strength = a3;
}

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

- (float)confidence
{
  return self->_confidence;
}

- (int64_t)compare:(id)a3
{
  double v3;
  double v4;
  double v6;
  double illuminance;

  illuminance = self->_illuminance;
  objc_msgSend(a3, "illuminance");
  if (illuminance > v3 && !self->_obstructed)
    return -1;
  v6 = self->_illuminance;
  objc_msgSend(a3, "illuminance");
  return v6 < v4 || self->_obstructed;
}

+ (void)replaceLuxWithFilteredLux:(__IOHIDEvent *)a3
{
  double v3;
  uint64_t DataValue;
  const __CFArray *theArray;
  double v6;

  theArray = (const __CFArray *)IOHIDEventGetChildren();
  if (theArray)
  {
    if (CFArrayGetValueAtIndex(theArray, 0))
    {
      if (IOHIDEventGetIntegerValue() == 137)
      {
        DataValue = IOHIDEventGetDataValue();
        if (DataValue)
        {
          if ((*(_BYTE *)(DataValue + 136) & 1) != 0)
          {
            IOHIDEventSetDoubleValue();
            IOHIDEventSetIntegerValue();
            IOHIDEventGetDoubleValue();
            IOHIDEventGetDoubleValue();
            v6 = v3;
            IOHIDEventGetDoubleValue();
            if (v6 > 0.0)
            {
              IOHIDEventSetDoubleValue();
              IOHIDEventSetDoubleValue();
              IOHIDEventSetDoubleValue();
            }
          }
        }
      }
    }
  }
}

- (void)setIlluminance:(double)a3
{
  self->_illuminance = a3;
}

- (void)setColorSample:(id *)a3
{
  objc_copyStruct(&self->_colorSample, a3, 60, 1, 0);
}

- (BOOL)supportColor
{
  return self->_supportColor;
}

- (void)setSupportColor:(BOOL)a3
{
  self->_supportColor = a3;
}

- (void)setObstructed:(BOOL)a3
{
  self->_obstructed = a3;
}

- (void)setOrientation:(int)a3
{
  self->_orientation = a3;
}

- (void)setVendorData:(id *)a3
{
  objc_copyStruct(&self->_vendorData, a3, 137, 1, 0);
}

- (float)integrationTime
{
  return self->_integrationTime;
}

- (void)setIntegrationTime:(float)a3
{
  self->_integrationTime = a3;
}

- (void)setFirstALSSample:(BOOL)a3
{
  self->_firstALSSample = a3;
}

@end
