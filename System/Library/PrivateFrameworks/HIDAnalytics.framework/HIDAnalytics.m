uint64_t HIDAnalyticsEventSetIntegerValueForField(void *a1, const char *a2, uint64_t a3)
{
  return objc_msgSend(a1, "setIntegerValue:forField:", a3, a2);
}

uint64_t HIDAnalyticsHistogramEventSetIntegerValue(void *a1, const char *a2)
{
  return objc_msgSend(a1, "setIntegerValue:", a2);
}

HIDAnalyticsEvent *HIDAnalyticsEventCreate(uint64_t a1, void *DeepCopy)
{
  HIDAnalyticsEvent *v3;
  HIDAnalyticsEvent *v4;
  HIDAnalyticsEvent *v5;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", a1);
  v3 = (HIDAnalyticsEvent *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    if (DeepCopy)
      DeepCopy = (void *)CFPropertyListCreateDeepCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], DeepCopy, 2uLL);
    v3 = -[HIDAnalyticsEvent initWithAttributes:description:]([HIDAnalyticsEvent alloc], "initWithAttributes:description:", v4, DeepCopy);
  }
  else
  {
    DeepCopy = 0;
  }
  v5 = v3;

  return v5;
}

HIDAnalyticsHistogramEvent *HIDAnalyticsHistogramEventCreate(uint64_t a1, void *DeepCopy, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  HIDAnalyticsHistogramEvent *v13;
  HIDAnalyticsHistogramEvent *v14;
  HIDAnalyticsHistogramEvent *v15;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", a3);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v9)
    v12 = v10 == 0;
  else
    v12 = 1;
  if (v12)
  {
    v14 = 0;
    DeepCopy = 0;
  }
  else
  {
    if (DeepCopy)
      DeepCopy = (void *)CFPropertyListCreateDeepCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], DeepCopy, 2uLL);
    v13 = -[HIDAnalyticsHistogramEvent initWithAttributes:description:]([HIDAnalyticsHistogramEvent alloc], "initWithAttributes:description:", v9, DeepCopy);
    v14 = v13;
    if (v13)
      -[HIDAnalyticsHistogramEvent addHistogramFieldWithSegments:segments:count:](v13, "addHistogramFieldWithSegments:segments:count:", v11, a4, a5);
  }
  v15 = v14;

  return v15;
}

void HIDAnalyticsEventAddHistogramField(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = v7;
    objc_msgSend(a1, "addHistogramFieldWithSegments:segments:count:", v7, a3, a4);
    v7 = v8;
  }

}

void sub_215A502B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_215A50D64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void HIDAnalyticsEventAddField(void *a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(a1, "addField:", v3);
    v3 = v4;
  }

}

uint64_t HIDAnalyticsEventSetStringValueForField(void *a1, const char *a2, uint64_t a3)
{
  return objc_msgSend(a1, "setStringValue:forField:", a3, a2);
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

CFPropertyListRef CFPropertyListCreateDeepCopy(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC1C8](allocator, propertyList, mutabilityOption);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
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

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
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

