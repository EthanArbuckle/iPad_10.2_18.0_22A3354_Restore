id BKLogMotionEvents()
{
  if (BKLogMotionEvents_onceToken != -1)
    dispatch_once(&BKLogMotionEvents_onceToken, &__block_literal_global_22);
  return (id)BKLogMotionEvents___logObj;
}

id BKLogBootUI()
{
  if (BKLogBootUI_onceToken != -1)
    dispatch_once(&BKLogBootUI_onceToken, &__block_literal_global_224);
  return (id)BKLogBootUI___logObj;
}

id BKLogButton()
{
  if (BKLogButton_onceToken != -1)
    dispatch_once(&BKLogButton_onceToken, &__block_literal_global_2);
  return (id)BKLogButton___logObj;
}

id BKLogDisplayAnnotations()
{
  if (BKLogDisplayAnnotations_onceToken != -1)
    dispatch_once(&BKLogDisplayAnnotations_onceToken, &__block_literal_global_4);
  return (id)BKLogDisplayAnnotations___logObj;
}

id BKLogDisplayMonitor()
{
  if (BKLogDisplayMonitor_onceToken != -1)
    dispatch_once(&BKLogDisplayMonitor_onceToken, &__block_literal_global_6);
  return (id)BKLogDisplayMonitor___logObj;
}

id BKLogGenericGesture()
{
  if (BKLogGenericGesture_onceToken != -1)
    dispatch_once(&BKLogGenericGesture_onceToken, &__block_literal_global_8);
  return (id)BKLogGenericGesture___logObj;
}

id BKLogHID()
{
  if (BKLogHID_onceToken != -1)
    dispatch_once(&BKLogHID_onceToken, &__block_literal_global_10);
  return (id)BKLogHID___logObj;
}

id BKLogIdleTimer()
{
  if (BKLogIdleTimer_onceToken != -1)
    dispatch_once(&BKLogIdleTimer_onceToken, &__block_literal_global_12);
  return (id)BKLogIdleTimer___logObj;
}

id BKLogRenderOverlay()
{
  if (BKLogRenderOverlay_onceToken != -1)
    dispatch_once(&BKLogRenderOverlay_onceToken, &__block_literal_global_14);
  return (id)BKLogRenderOverlay___logObj;
}

id BKLogHapticFeedback()
{
  if (BKLogHapticFeedback_onceToken != -1)
    dispatch_once(&BKLogHapticFeedback_onceToken, &__block_literal_global_16);
  return (id)BKLogHapticFeedback___logObj;
}

id BKLogAccelerometer()
{
  if (BKLogAccelerometer_onceToken != -1)
    dispatch_once(&BKLogAccelerometer_onceToken, &__block_literal_global_18);
  return (id)BKLogAccelerometer___logObj;
}

id BKLogKeyPresses()
{
  if (BKLogKeyPresses_onceToken != -1)
    dispatch_once(&BKLogKeyPresses_onceToken, &__block_literal_global_20);
  return (id)BKLogKeyPresses___logObj;
}

id BKLogSendHIDEvent()
{
  if (BKLogSendHIDEvent_onceToken != -1)
    dispatch_once(&BKLogSendHIDEvent_onceToken, &__block_literal_global_24);
  return (id)BKLogSendHIDEvent___logObj;
}

uint64_t BKSHIDEventGetConciseDescription()
{
  return MEMORY[0x24BE0B540]();
}

uint64_t BKSHIDEventSetAttributes()
{
  return MEMORY[0x24BE0B568]();
}

uint64_t BKSHIDEventSetSimpleDeliveryInfo()
{
  return MEMORY[0x24BE0B580]();
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

uint64_t IOHIDEventCreateCopy()
{
  return MEMORY[0x24BDD8188]();
}

uint64_t IOHIDEventCreateGenericGestureEvent()
{
  return MEMORY[0x24BDD81D0]();
}

uint64_t IOHIDEventGetEvent()
{
  return MEMORY[0x24BDD8278]();
}

uint64_t IOHIDEventGetFloatValue()
{
  return MEMORY[0x24BDD8290]();
}

uint64_t IOHIDEventGetIntegerValue()
{
  return MEMORY[0x24BDD8298]();
}

uint64_t IOHIDEventGetPhase()
{
  return MEMORY[0x24BDD82A8]();
}

uint64_t IOHIDEventGetSenderID()
{
  return MEMORY[0x24BDD82B8]();
}

uint64_t IOHIDEventGetType()
{
  return MEMORY[0x24BDD82D0]();
}

uint64_t IOHIDEventSetPhase()
{
  return MEMORY[0x24BDD8328]();
}

uint64_t IOHIDEventSetSenderID()
{
  return MEMORY[0x24BDD8340]();
}

uint64_t _BKHIDNoteUserEventOccurredOnDisplay()
{
  return MEMORY[0x24BE0B4D8]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
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

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

