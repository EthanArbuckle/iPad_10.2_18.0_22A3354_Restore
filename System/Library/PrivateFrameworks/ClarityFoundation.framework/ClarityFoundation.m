void sub_20D4EBA00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a39, 8);
  _Unwind_Resume(a1);
}

void __getPHAssetCollectionClass_block_invoke(uint64_t a1)
{
  PhotosLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("PHAssetCollection");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPHAssetCollectionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getPHAssetCollectionClass_block_invoke_cold_1();
    PhotosLibrary();
  }
}

void PhotosLibrary()
{
  void *v0;

  if (!PhotosLibraryCore_frameworkLibrary)
    PhotosLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!PhotosLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getPHPhotoLibraryClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  PhotosLibrary();
  result = objc_getClass("PHPhotoLibrary");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPHPhotoLibraryClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getPHPhotoLibraryClass_block_invoke_cold_1();
    return (Class)__51__CLFSystemShellSwitcher_sharedSystemShellSwitcher__block_invoke(v3);
  }
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x16u);
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  return NSRequestConcreteImplementation();
}

id CLFSortedCommunicationLimits()
{
  if (CLFSortedCommunicationLimits_onceToken != -1)
    dispatch_once(&CLFSortedCommunicationLimits_onceToken, &__block_literal_global_0);
  return (id)CLFSortedCommunicationLimits_SortedCommunicationLimits;
}

id CLFLegacyAppIconsDirectory()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", AXCPSharedResourcesDirectory());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library/Accessibility/ClarityBoardAppIcons"), 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id CLFAppIconsDirectory()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", AXCPSharedResourcesDirectory());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library/Accessibility/ClarityBoard/AppIcons"), 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id CLFWallpaperDirectory()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", AXCPSharedResourcesDirectory());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library/Accessibility/ClarityBoard/Wallpaper"), 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id CLFWallpaperURL()
{
  void *v0;
  void *v1;

  CLFWallpaperDirectory();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLByAppendingPathComponent:", CFSTR("clarityBoardWallpaper.jpeg"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id CLFAppIconURLForBundleIdentifier(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = a1;
  CLFAppIconsDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "URLByAppendingPathExtension:", CFSTR("png"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void sub_20D4EEA10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D4EEC78(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_20D4EEE8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D4EEF94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAPSubjectClass_block_invoke(uint64_t a1)
{
  Class result;

  AppProtectionLibrary();
  result = objc_getClass("APSubject");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAPSubjectClass_block_invoke_cold_1();
  getAPSubjectClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void AppProtectionLibrary()
{
  void *v0;

  if (!AppProtectionLibraryCore_frameworkLibrary)
    AppProtectionLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!AppProtectionLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getPDCPreflightManagerClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!PrivacyDisclosureCoreLibraryCore_frameworkLibrary)
  {
    PrivacyDisclosureCoreLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!PrivacyDisclosureCoreLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_6:
      __getPDCPreflightManagerClass_block_invoke_cold_1();
    }
  }
  result = objc_getClass("PDCPreflightManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_6;
  getPDCPreflightManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getLSApplicationRecordClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!CoreServicesLibraryCore_frameworkLibrary)
  {
    CoreServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!CoreServicesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_6:
      __getLSApplicationRecordClass_block_invoke_cold_1();
    }
  }
  result = objc_getClass("LSApplicationRecord");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_6;
  getLSApplicationRecordClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAPApplicationClass_block_invoke(uint64_t a1)
{
  Class result;

  AppProtectionLibrary();
  result = objc_getClass("APApplication");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAPApplicationClass_block_invoke_cold_1();
  getAPApplicationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t CLFListLayout.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v13;

  v0 = 1684632167;
  v1 = sub_20D4F0AA0();
  v3 = v2;
  if (v1 == sub_20D4F0AA0() && v3 == v4)
    goto LABEL_7;
  v6 = sub_20D4F0AD0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v6 & 1) != 0)
    return v0;
  v0 = 0x6B63617473;
  v8 = sub_20D4F0AA0();
  v10 = v9;
  if (v8 == sub_20D4F0AA0() && v10 == v11)
  {
LABEL_7:
    swift_bridgeObjectRelease_n();
    return v0;
  }
  v13 = sub_20D4F0AD0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v13 & 1) != 0)
    return v0;
  result = sub_20D4F0AB8();
  __break(1u);
  return result;
}

uint64_t sub_20D4F0094()
{
  return CLFListLayout.description.getter();
}

void type metadata accessor for CLFListLayout()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_2549B2680)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_2549B2680);
  }
}

uint64_t sub_20D4F00F0(uint64_t a1, uint64_t a2)
{
  return sub_20D4F0404(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_20D4F00FC(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_20D4F0A88();
  *a2 = 0;
  return result;
}

uint64_t sub_20D4F0170(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_20D4F0A94();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_20D4F01EC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_20D4F0AA0();
  v2 = sub_20D4F0A7C();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_20D4F022C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_20D4F0AA0();
  v2 = v1;
  if (v0 == sub_20D4F0AA0() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_20D4F0AD0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_20D4F02B4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_20D4F0A7C();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_20D4F02F8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_20D4F0AA0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_20D4F0320()
{
  sub_20D4F04F0(&qword_2549B26A0, (uint64_t)&unk_20D4F187C);
  sub_20D4F04F0(&qword_2549B26A8, (uint64_t)&unk_20D4F181C);
  return sub_20D4F0AC4();
}

uint64_t sub_20D4F038C()
{
  return sub_20D4F04F0(&qword_2549B2688, (uint64_t)&unk_20D4F17E0);
}

uint64_t sub_20D4F03B0()
{
  return sub_20D4F04F0(&qword_2549B2690, (uint64_t)&unk_20D4F17B4);
}

uint64_t sub_20D4F03D4()
{
  return sub_20D4F04F0(&qword_2549B2698, (uint64_t)&unk_20D4F1850);
}

uint64_t sub_20D4F03F8(uint64_t a1, uint64_t a2)
{
  return sub_20D4F0404(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_20D4F0404(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_20D4F0AA0();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_20D4F0440()
{
  sub_20D4F0AA0();
  sub_20D4F0AAC();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20D4F0480()
{
  uint64_t v0;

  sub_20D4F0AA0();
  sub_20D4F0ADC();
  sub_20D4F0AAC();
  v0 = sub_20D4F0AE8();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_20D4F04F0(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for CLFListLayout();
    result = MEMORY[0x212BA2E00](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t __getPHAssetCollectionClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getPHPhotoLibraryClass_block_invoke_cold_1(v0);
}

uint64_t __getPHPhotoLibraryClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[CLFSystemShellSwitcher setClarityBoardEnabled:error:].cold.1(v0);
}

void __getAPSubjectClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getPDCPreflightManagerClass_block_invoke_cold_1(v0);
}

void __getPDCPreflightManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getLSApplicationRecordClass_block_invoke_cold_1(v0);
}

void __getLSApplicationRecordClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getAPApplicationClass_block_invoke_cold_1(v0);
}

void __getAPApplicationClass_block_invoke_cold_1()
{
  abort_report_np();
  sub_20D4F0A7C();
}

uint64_t sub_20D4F0A7C()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_20D4F0A88()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_20D4F0A94()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_20D4F0AA0()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_20D4F0AAC()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_20D4F0AB8()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_20D4F0AC4()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_20D4F0AD0()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_20D4F0ADC()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_20D4F0AE8()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t AXCPSharedResourcesDirectory()
{
  return MEMORY[0x24BED1FD8]();
}

uint64_t AXPerformBlockAsynchronouslyOnMainThread()
{
  return MEMORY[0x24BDFE240]();
}

uint64_t CLFLogCommon()
{
  return MEMORY[0x24BDFE448]();
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x24BDD11E8]();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x24BDD1218](aSelectorName);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

uint64_t _AXSClarityBoardEnabled()
{
  return MEMORY[0x24BED2120]();
}

uint64_t _AXSClarityBoardEnabledDirectory()
{
  return MEMORY[0x24BED2128]();
}

uint64_t _AXSClarityBundleIdentifierForStandardBundleIdentifier()
{
  return MEMORY[0x24BED2130]();
}

uint64_t _AXSStandardBundleIdentifierForClarityBundleIdentifier()
{
  return MEMORY[0x24BED2540]();
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

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
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

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t reboot3()
{
  return MEMORY[0x24BDAFAD0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

