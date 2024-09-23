void OUTLINED_FUNCTION_4_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_4_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

const char *OUTLINED_FUNCTION_1_2(sqlite3 **a1)
{
  return sqlite3_errmsg(*a1);
}

void sub_215A551DC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

Class __getREMDatabaseMigrationContextClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!ReminderKitLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_24D3F48E8;
    v5 = 0;
    ReminderKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!ReminderKitLibraryCore_frameworkLibrary)
    __getREMDatabaseMigrationContextClass_block_invoke_cold_1(&v3);
  result = objc_getClass("REMDatabaseMigrationContext");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getREMDatabaseMigrationContextClass_block_invoke_cold_2();
  getREMDatabaseMigrationContextClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_215A5B508(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_215A5B5F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getREMSaveRequestClass_block_invoke(uint64_t a1)
{
  Class result;

  ReminderKitLibrary();
  result = objc_getClass("REMSaveRequest");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getREMSaveRequestClass_block_invoke_cold_1();
  getREMSaveRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void ReminderKitLibrary()
{
  void *v0;
  __int128 v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = 0;
  if (!ReminderKitLibraryCore_frameworkLibrary_0)
  {
    v1 = xmmword_24D3F4AB0;
    v2 = 0;
    ReminderKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!ReminderKitLibraryCore_frameworkLibrary_0)
    ReminderKitLibrary_cold_1(&v0);
}

Class __getREMUserDefaultsClass_block_invoke(uint64_t a1)
{
  Class result;

  ReminderKitLibrary();
  result = objc_getClass("REMUserDefaults");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getREMUserDefaultsClass_block_invoke_cold_1();
  getREMUserDefaultsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_215A5D62C(_Unwind_Exception *exception_object)
{
  char v1;

  if ((v1 & 1) != 0)
    objc_end_catch();
  _Unwind_Resume(exception_object);
}

void sub_215A5D6C8(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_215A5D6E8(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x215A5D69CLL);
}

void sub_215A5EBE0(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_215A5EC00(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x215A5EB10);
}

void sub_215A5EDF0(_Unwind_Exception *exception_object, int a2)
{
  void *v2;
  id v3;
  NSObject *v4;
  id v5;
  id v6;

  if (a2 == 1)
  {
    v3 = objc_begin_catch(exception_object);
    +[CalMigrationLog reminders](CalMigrationLog, "reminders");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      -[CalCalendarDatabaseReminderMigrator _attemptMigrationForDatabase:inCalendarDirectory:withContext:].cold.1();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v3;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v3;
        +[CalMigrationErrorUtils errorFromException:](CalMigrationErrorUtils, "errorFromException:", v6);
        v5 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v5 = 0;
      }
    }
    objc_msgSend(v2, "recordMigrationFailureWithDescription:inStage:underlyingError:", CFSTR("Exception thrown during migration"), 0, v5);
    objc_msgSend(v2, "finishMigrationWithSave:", 0);
    objc_exception_throw(objc_retainAutorelease(v3));
  }
  _Unwind_Resume(exception_object);
}

void sub_215A5F450(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_215A603BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_215A60A00(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

Class __getREMColorClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!ReminderKitLibraryCore_frameworkLibrary_1)
  {
    v4 = xmmword_24D3F4C60;
    v5 = 0;
    ReminderKitLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  if (!ReminderKitLibraryCore_frameworkLibrary_1)
    __getREMColorClass_block_invoke_cold_1(&v3);
  result = objc_getClass("REMColor");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getREMColorClass_block_invoke_cold_2();
  getREMColorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_9(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void sub_215A622A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void __getREMDatabaseMigrationContextClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *ReminderKitLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CalDefaultReminderKitDatabaseMigrationContext.m"), 16, CFSTR("%s"), *a1);

  __break(1u);
}

void __getREMDatabaseMigrationContextClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getREMDatabaseMigrationContextClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CalDefaultReminderKitDatabaseMigrationContext.m"), 17, CFSTR("Unable to find class %s"), "REMDatabaseMigrationContext");

  __break(1u);
}

void __getREMSaveRequestClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getREMSaveRequestClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CalDefaultReminderKitProvider.m"), 16, CFSTR("Unable to find class %s"), "REMSaveRequest");

  __break(1u);
}

void ReminderKitLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *ReminderKitLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CalDefaultReminderKitProvider.m"), 15, CFSTR("%s"), *a1);

  __break(1u);
}

void __getREMUserDefaultsClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getREMUserDefaultsClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CalDefaultReminderKitProvider.m"), 17, CFSTR("Unable to find class %s"), "REMUserDefaults");

  __break(1u);
}

void __getREMColorClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *ReminderKitLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CalCalendarDatabaseReminderMigrator.m"), 33, CFSTR("%s"), *a1);

  __break(1u);
}

void __getREMColorClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getREMColorClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CalCalendarDatabaseReminderMigrator.m"), 34, CFSTR("Unable to find class %s"), "REMColor");

  __break(1u);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

uint64_t CalAnalyticsSendEvent()
{
  return MEMORY[0x24BE13F00]();
}

uint64_t CalCalendarCanContainEntityType()
{
  return MEMORY[0x24BE12AB0]();
}

uint64_t CalCalendarCopyColorStringForDisplay()
{
  return MEMORY[0x24BE12AC8]();
}

uint64_t CalCalendarCopyExternalID()
{
  return MEMORY[0x24BE12AD8]();
}

uint64_t CalCalendarCopyExternalModificationTag()
{
  return MEMORY[0x24BE12AE8]();
}

uint64_t CalCalendarCopyPushKey()
{
  return MEMORY[0x24BE12B30]();
}

uint64_t CalCalendarCopyStore()
{
  return MEMORY[0x24BE12B70]();
}

uint64_t CalCalendarCopySymbolicColorName()
{
  return MEMORY[0x24BE12B80]();
}

uint64_t CalCalendarCopyTasks()
{
  return MEMORY[0x24BE12B90]();
}

uint64_t CalCalendarCopyTitle()
{
  return MEMORY[0x24BE12B98]();
}

uint64_t CalCalendarCopyUUID()
{
  return MEMORY[0x24BE12BA8]();
}

uint64_t CalCalendarGetDisplayOrder()
{
  return MEMORY[0x24BE12BD0]();
}

uint64_t CalCalendarIsHidden()
{
  return MEMORY[0x24BE12C40]();
}

uint64_t CalCalendarIsInbox()
{
  return MEMORY[0x24BE12C50]();
}

uint64_t CalCalendarIsNotificationsCollection()
{
  return MEMORY[0x24BE12C68]();
}

uint64_t CalCalendarIsSharingInvitation()
{
  return MEMORY[0x24BE12C80]();
}

uint64_t CalCalendarIsSubscribed()
{
  return MEMORY[0x24BE12C88]();
}

uint64_t CalCalendarItemCopyUUID()
{
  return MEMORY[0x24BE12D50]();
}

uint64_t CalCalendarSetCanContainEntityType()
{
  return MEMORY[0x24BE12EE8]();
}

uint64_t CalCalendarSetSyncToken()
{
  return MEMORY[0x24BE13040]();
}

uint64_t CalCreateiCalendarDataFromCalEntities()
{
  return MEMORY[0x24BE13060]();
}

uint64_t CalDatabaseClearAllChangeHistoryForAllClients()
{
  return MEMORY[0x24BE13078]();
}

uint64_t CalDatabaseCopyDefaultCalendarForNewTasksForReminderMigration()
{
  return MEMORY[0x24BE13140]();
}

uint64_t CalDatabaseCopyDirectoryPathForDatabase()
{
  return MEMORY[0x24BE13158]();
}

uint64_t CalDatabaseCopyOfAllStores()
{
  return MEMORY[0x24BE13220]();
}

uint64_t CalDatabaseCreateWithConfiguration()
{
  return MEMORY[0x24BE13318]();
}

uint64_t CalDatabaseRemoveAllCalendarItemsWithCalendarAndEntityType()
{
  return MEMORY[0x24BE13388]();
}

uint64_t CalDatabaseSave()
{
  return MEMORY[0x24BE13398]();
}

uint64_t CalEventCopyDetachedEvents()
{
  return MEMORY[0x24BE134A8]();
}

uint64_t CalRemoveCalendar()
{
  return MEMORY[0x24BE13818]();
}

uint64_t CalRemoveStore()
{
  return MEMORY[0x24BE13848]();
}

uint64_t CalStoreAllowsEvents()
{
  return MEMORY[0x24BE138D8]();
}

uint64_t CalStoreAllowsTasksPrivate()
{
  return MEMORY[0x24BE138F0]();
}

uint64_t CalStoreCopyCalendars()
{
  return MEMORY[0x24BE13900]();
}

uint64_t CalStoreCopyName()
{
  return MEMORY[0x24BE13930]();
}

uint64_t CalStoreCopyUUID()
{
  return MEMORY[0x24BE13940]();
}

uint64_t CalStoreGetType()
{
  return MEMORY[0x24BE13988]();
}

uint64_t CalStoreIsEnabled()
{
  return MEMORY[0x24BE13998]();
}

uint64_t CalStoreSetAllowsTasksPrivate()
{
  return MEMORY[0x24BE13A38]();
}

uint64_t CalStoreSetWasMigrated()
{
  return MEMORY[0x24BE13BE8]();
}

uint64_t EKDatabasePerformMigrationIfNeeded()
{
  return MEMORY[0x24BDC7408]();
}

uint64_t EKSymbolicColorToRGBMapping()
{
  return MEMORY[0x24BE13F50]();
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x24BEDD070]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

void objc_terminate(void)
{
  MEMORY[0x24BEDD450]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x24BEDDF60](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x24BEDDF98](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x24BEDE010](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x24BEDE020](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE028](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE050](a1, *(_QWORD *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x24BEDE068](a1, *(_QWORD *)&iCol);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x24BEDE108](a1);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x24BEDE140](pStmt);
}

int sqlite3_open(const char *filename, sqlite3 **ppDb)
{
  return MEMORY[0x24BEDE1B8](filename, ppDb);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x24BEDE1D0](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x24BEDE2A8](a1);
}

