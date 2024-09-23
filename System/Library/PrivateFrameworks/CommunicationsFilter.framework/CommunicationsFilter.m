void sub_20849E9AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20849EB24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void CMFBlockListCopyItemsForAllServicesService(_QWORD *a1)
{
  void *v2;
  CommunicationsFilterBlockList *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = (void *)MEMORY[0x20BD09AC4]();
  if (a1)
  {
    v3 = +[CommunicationsFilterBlockList sharedInstance](CommunicationsFilterBlockList, "sharedInstance");
    v4 = objc_sync_enter(v3);
    v5 = (void *)MEMORY[0x20BD09AC4](v4);
    v6 = -[CommunicationsFilterBlockList copyAllItems](+[CommunicationsFilterBlockList sharedInstance](CommunicationsFilterBlockList, "sharedInstance"), "copyAllItems");
    objc_autoreleasePoolPop(v5);
    *a1 = v6;
    objc_sync_exit(v3);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_20849EC1C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL CMFBlockListIsItemBlocked(uint64_t a1)
{
  void *v2;
  CommunicationsFilterBlockList *v3;
  _BOOL8 v4;
  NSObject *v5;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0;
  v2 = (void *)MEMORY[0x20BD09AC4]();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = +[CommunicationsFilterBlockList sharedInstance](CommunicationsFilterBlockList, "sharedInstance");
    objc_sync_enter(v3);
    v4 = -[CommunicationsFilterBlockList isItemInList:](+[CommunicationsFilterBlockList sharedInstance](CommunicationsFilterBlockList, "sharedInstance"), "isItemInList:", a1);
    objc_sync_exit(v3);
  }
  else
  {
    v5 = CMFDefaultLog();
    v4 = 0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = a1;
      _os_log_impl(&dword_20849D000, v5, OS_LOG_TYPE_DEFAULT, "[WARN] received invalid object = %@", (uint8_t *)&v7, 0xCu);
      v4 = 0;
    }
  }
  objc_autoreleasePoolPop(v2);
  return v4;
}

void sub_20849ED48(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_20849EFB4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t CMFDefaultLog()
{
  if (CMFDefaultLog_onceToken != -1)
    dispatch_once(&CMFDefaultLog_onceToken, &__block_literal_global);
  return CMFDefaultLog_CMFDefaultLog;
}

void sub_20849F5C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20849F7E4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

CommunicationFilterItem *CMFItemCreateWithEmailAddress(uint64_t a1)
{
  return -[CommunicationFilterItem initWithEmailAddress:]([CommunicationFilterItem alloc], "initWithEmailAddress:", a1);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void CMFBlockListAddItemForAllServices(uint64_t a1)
{
  void *v2;
  CommunicationsFilterBlockList *v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x20BD09AC4]();
  if (a1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v3 = +[CommunicationsFilterBlockList sharedInstance](CommunicationsFilterBlockList, "sharedInstance");
    objc_sync_enter(v3);
    -[CommunicationsFilterBlockList addItemForAllServices:](+[CommunicationsFilterBlockList sharedInstance](CommunicationsFilterBlockList, "sharedInstance"), "addItemForAllServices:", a1);
    objc_sync_exit(v3);
  }
  else
  {
    v4 = CMFDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138412290;
      v6 = a1;
      _os_log_impl(&dword_20849D000, v4, OS_LOG_TYPE_DEFAULT, "[WARN] received invalid object = %@", (uint8_t *)&v5, 0xCu);
    }
  }
  objc_autoreleasePoolPop(v2);
}

void sub_2084A0400(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void CMFBlockListRemoveItemFromAllServices(uint64_t a1)
{
  void *v2;
  CommunicationsFilterBlockList *v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x20BD09AC4]();
  if (a1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v3 = +[CommunicationsFilterBlockList sharedInstance](CommunicationsFilterBlockList, "sharedInstance");
    objc_sync_enter(v3);
    -[CommunicationsFilterBlockList removeItemForAllServices:](+[CommunicationsFilterBlockList sharedInstance](CommunicationsFilterBlockList, "sharedInstance"), "removeItemForAllServices:", a1);
    objc_sync_exit(v3);
  }
  else
  {
    v4 = CMFDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138412290;
      v6 = a1;
      _os_log_impl(&dword_20849D000, v4, OS_LOG_TYPE_DEFAULT, "[WARN] received invalid object = %@", (uint8_t *)&v5, 0xCu);
    }
  }
  objc_autoreleasePoolPop(v2);
}

void sub_2084A051C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

CommunicationFilterItem *CreateCMFItemFromString(void *a1)
{
  void *v2;
  int v3;
  int v4;
  uint64_t v5;
  const void *v6;
  CommunicationFilterItem *v7;
  NSObject *v8;
  int v10;
  void *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0;
  v2 = (void *)MEMORY[0x20BD09AC4]();
  v3 = objc_msgSend(a1, "_appearsToBeEmail");
  v4 = objc_msgSend(a1, "_appearsToBePhoneNumber");
  if (v4)
  {
    v5 = IMPhoneNumberRefCopyForPhoneNumber();
    if (v5)
    {
      v6 = (const void *)v5;
      v7 = -[CommunicationFilterItem initWithPhoneNumber:]([CommunicationFilterItem alloc], "initWithPhoneNumber:", v5);
      CFRelease(v6);
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = -[CommunicationFilterItem initWithEmailAddress:]([CommunicationFilterItem alloc], "initWithEmailAddress:", a1);
  }
  v8 = CMFDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134218496;
    v11 = a1;
    v12 = 1024;
    v13 = v3;
    v14 = 1024;
    v15 = v4;
    _os_log_impl(&dword_20849D000, v8, OS_LOG_TYPE_DEFAULT, "identifier:%p, isEmail:%d isPhone:%d", (uint8_t *)&v10, 0x18u);
  }
  objc_autoreleasePoolPop(v2);
  return v7;
}

CommunicationFilterItem *CMFItemCreateWithPhoneNumber(uint64_t a1)
{
  return -[CommunicationFilterItem initWithPhoneNumber:]([CommunicationFilterItem alloc], "initWithPhoneNumber:", a1);
}

uint64_t CMFItemGetType(void *a1)
{
  if ((objc_msgSend(a1, "isPhoneNumber") & 1) != 0)
    return 0;
  if (MEMORY[0x20BD099B0](objc_msgSend(a1, "emailAddress")))
    return 2;
  return 1;
}

void *CMFItemCopyPhoneNumber(void *result, _QWORD *a2)
{
  const void *v3;

  if (a2)
  {
    v3 = (const void *)objc_msgSend(result, "phoneNumber");
    *a2 = v3;
    return (void *)CFRetain(v3);
  }
  return result;
}

void *CMFItemCopyEmailAddress(void *result, _QWORD *a2)
{
  if (a2)
  {
    result = (void *)objc_msgSend((id)objc_msgSend(result, "emailAddress"), "copy");
    *a2 = result;
  }
  return result;
}

CommunicationFilterItem *CMFItemCreateWithBusinessID(uint64_t a1)
{
  return -[CommunicationFilterItem initWithEmailAddress:]([CommunicationFilterItem alloc], "initWithEmailAddress:", a1);
}

void *CMFItemCopyBusinessID(void *result, _QWORD *a2)
{
  if (a2)
  {
    result = (void *)objc_msgSend((id)objc_msgSend(result, "emailAddress"), "copy");
    *a2 = result;
  }
  return result;
}

void sub_2084A0A74(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2084A0C24(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2084A0DB8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

uint64_t IMCountryCodeCFPhoneNumberRef()
{
  return MEMORY[0x24BE50660]();
}

uint64_t IMGetXPCCodableFromDictionaryWithStandardAllowlist()
{
  return MEMORY[0x24BE506E0]();
}

uint64_t IMGetXPCDictionaryFromDictionary()
{
  return MEMORY[0x24BE506F0]();
}

uint64_t IMInsertDictionariesToXPCDictionary()
{
  return MEMORY[0x24BE50738]();
}

uint64_t IMPhoneNumberRefCopyForPhoneNumber()
{
  return MEMORY[0x24BE507A0]();
}

uint64_t IMStringIsBusinessID()
{
  return MEMORY[0x24BE507F8]();
}

uint64_t IMUnformattedPhoneNumberForCFPhoneNumberRef()
{
  return MEMORY[0x24BE50830]();
}

uint64_t IMXPCConfigureConnection()
{
  return MEMORY[0x24BE50850]();
}

uint64_t IMXPCCreateConnectionForServiceWithQueue()
{
  return MEMORY[0x24BE50858]();
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x24BDAC728](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x24BDAF148](*(_QWORD *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x24BDB0718](connection);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x24BDB07B8](connection, message);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x24BDB09A8](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x24BDB0AE0](object);
}

