@implementation CBHIDEvent

- (__IOHIDServiceClient)service
{
  return self->_service;
}

- (unsigned)eventType
{
  return IOHIDEventGetType();
}

- (float)timestamp
{
  return (double)(unint64_t)IOHIDEventGetTimeStamp() * self->_sMachTimebaseFactor;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBHIDEvent *v4;

  v4 = self;
  v3 = a2;
  if (self->_event)
    CFRelease(v4->_event);
  if (v4->_service)
    CFRelease(v4->_service);

  if (v4->_logHandle)
  {

    v4->_logHandle = 0;
  }
  v2.receiver = v4;
  v2.super_class = (Class)CBHIDEvent;
  -[CBHIDEvent dealloc](&v2, sel_dealloc);
}

+ (id)newEvent:(__IOHIDEvent *)a3 andService:(__IOHIDServiceClient *)a4
{
  if (IOHIDEventGetType() == 12)
    return -[CBALSEvent initWithHIDEvent:andService:]([CBALSEvent alloc], "initWithHIDEvent:andService:", a3, a4);
  else
    return -[CBHIDEvent initWithHIDEvent:andService:]([CBHIDEvent alloc], "initWithHIDEvent:andService:", a3, a4);
}

- (NSNumber)serviceRegistryID
{
  return self->_serviceRegistryID;
}

- (__IOHIDEvent)event
{
  return self->_event;
}

- (CBHIDEvent)initWithHIDEvent:(__IOHIDEvent *)a3 andService:(__IOHIDServiceClient *)a4
{
  os_log_t v4;
  char isKindOfClass;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  mach_timebase_info info;
  uint8_t v23[15];
  char v24;
  NSObject *v25;
  id RegistryID;
  uint8_t v27[7];
  char v28;
  NSObject *v29;
  uint8_t v30[15];
  char v31;
  NSObject *v32;
  objc_super v33;
  __IOHIDServiceClient *v34;
  __IOHIDEvent *v35;
  SEL v36;
  CBHIDEvent *v37;

  v37 = self;
  v36 = a2;
  v35 = a3;
  v34 = a4;
  v33.receiver = self;
  v33.super_class = (Class)CBHIDEvent;
  v37 = -[CBHIDEvent init](&v33, sel_init);
  if (!v37)
    return v37;
  v4 = os_log_create("com.apple.CoreBrightness.CBHIDEvent", "default");
  v37->_logHandle = (OS_os_log *)v4;
  if (!v35)
  {
    v32 = 0;
    if (v37->_logHandle)
    {
      logHandle = v37->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      logHandle = inited;
    }
    v32 = logHandle;
    v31 = 16;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
    {
      log = v32;
      type = v31;
      __os_log_helper_16_0_0(v30);
      _os_log_error_impl(&dword_1B5291000, log, type, "error: invalid HID event", v30, 2u);
    }
    goto LABEL_36;
  }
  CFRetain(v35);
  v37->_event = v35;
  if (!v34)
  {
    v29 = 0;
    if (v37->_logHandle)
    {
      v17 = v37->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v16 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v16 = init_default_corebrightness_log();
      v17 = v16;
    }
    v29 = v17;
    v28 = 16;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v14 = v29;
      v15 = v28;
      __os_log_helper_16_0_0(v27);
      _os_log_error_impl(&dword_1B5291000, v14, v15, "error: invalid HID service", v27, 2u);
    }
    goto LABEL_36;
  }
  CFRetain(v34);
  v37->_service = v34;
  RegistryID = (id)IOHIDServiceClientGetRegistryID(v34);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) == 0)
  {
    v25 = 0;
    if (v37->_logHandle)
    {
      v13 = v37->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v12 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v12 = init_default_corebrightness_log();
      v13 = v12;
    }
    v25 = v13;
    v24 = 16;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v10 = v25;
      v11 = v24;
      __os_log_helper_16_0_0(v23);
      _os_log_error_impl(&dword_1B5291000, v10, v11, "error: invalid service registry ID", v23, 2u);
    }
LABEL_36:

    v37 = 0;
    return 0;
  }
  v6 = objc_msgSend(RegistryID, "copy");
  v37->_serviceRegistryID = (NSNumber *)v6;
  info = 0;
  mach_timebase_info(&info);
  LODWORD(v8) = info.denom;
  LODWORD(v7) = info.numer;
  v37->_sMachTimebaseFactor = (double)v7 / (double)v8 * 0.000000001;
  return v37;
}

- (NSArray)copyChildren
{
  id v3;
  int i;
  const __CFArray *Children;
  NSArray *v6;

  v6 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  Children = (const __CFArray *)IOHIDEventGetChildren();
  if (Children)
  {
    for (i = 0; i < CFArrayGetCount(Children); ++i)
    {
      v3 = +[CBHIDEvent newEvent:andService:](CBHIDEvent, "newEvent:andService:", CFArrayGetValueAtIndex(Children, i), self->_service);
      -[NSArray addObject:](v6, "addObject:", v3);

    }
  }
  return v6;
}

- (int)integerValueForKey:(unsigned int)a3
{
  return IOHIDEventGetIntegerValue();
}

- (float)floatValueForKey:(unsigned int)a3
{
  double v3;

  IOHIDEventGetFloatValue();
  return v3;
}

- (void)setEvent:(__IOHIDEvent *)a3
{
  self->_event = a3;
}

- (void)setService:(__IOHIDServiceClient *)a3
{
  self->_service = a3;
}

@end
