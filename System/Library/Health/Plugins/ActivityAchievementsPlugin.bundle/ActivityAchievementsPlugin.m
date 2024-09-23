void sub_2322D5B08(uint64_t a1, int a2)
{
  NSObject *v4;
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  ACHLogDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = a2;
    _os_log_impl(&dword_2322D3000, v4, OS_LOG_TYPE_DEFAULT, "Plugin initial achievement load did finish with success= %d", (uint8_t *)v6, 8u);
  }

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_finishingUnleashingTheKrakenForDevice:", *(unsigned __int8 *)(a1 + 40));
  }
  else
  {
    ACHLogDefault();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v6[0]) = 0;
      _os_log_impl(&dword_2322D3000, v5, OS_LOG_TYPE_DEFAULT, "Aborting final phase of unleashing the Kraken", (uint8_t *)v6, 2u);
    }

  }
}

void sub_2322D6850(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  ACHLogDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2322D3000, v2, OS_LOG_TYPE_DEFAULT, "Plugin loading all achievements from database if necessary", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "achievementStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loadAllAchievementsFromDatabaseIfNecessaryWithCompletionHandler:", *(_QWORD *)(a1 + 40));

}

uint64_t sub_2322D6CE0(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t sub_2322D72F0(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t sub_2322D76D0()
{
  return ACHSetMobileAssetServerURL();
}

void sub_2322D7C80(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_2322D7C90(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_2322D7CBC()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_2322D7CA8();
  _os_log_error_impl(&dword_2322D3000, v0, OS_LOG_TYPE_ERROR, "AchievementsPlugin: an issue occurred while performing the migration.", v1, 2u);
  sub_2322D7CA0();
}

void sub_2322D7CF4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2322D7C80(&dword_2322D3000, a2, a3, "Plugin failed to load move minute move goal: %{public}@", a5, a6, a7, a8, 2u);
  sub_2322D7CB4();
}

void sub_2322D7D58(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2322D7C80(&dword_2322D3000, a2, a3, "Plugin failed to load calorie move goal: %{public}@", a5, a6, a7, a8, 2u);
  sub_2322D7CB4();
}

void sub_2322D7DBC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2322D7CA8();
  sub_2322D7C90(&dword_2322D3000, v0, v1, "Initial move goal fetch was already completed, and kraken is unleashed, skipping", v2, v3, v4, v5, v6);
  sub_2322D7CA0();
}

void sub_2322D7DE8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2322D7C80(&dword_2322D3000, a2, a3, "Unable to remove all earned instances. Reason: %{public}@", a5, a6, a7, a8, 2u);
  sub_2322D7CB4();
}

void sub_2322D7E4C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2322D7CA8();
  sub_2322D7C90(&dword_2322D3000, v0, v1, "Activity Challenge Assets URL explicitly choosen by user, skipping URL setting", v2, v3, v4, v5, v6);
  sub_2322D7CA0();
}

void sub_2322D7E78()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2322D7CA8();
  sub_2322D7C90(&dword_2322D3000, v0, v1, "Customer install, skipping Activity Challenge Assets URL setting", v2, v3, v4, v5, v6);
  sub_2322D7CA0();
}

uint64_t ACHCompanionHistoricalEvaluationPolicy()
{
  return MEMORY[0x24BE01968]();
}

uint64_t ACHGizmoHistoricalEvaluationPolicy()
{
  return MEMORY[0x24BE01978]();
}

uint64_t ACHIsActivityAchievementsAssetServerURLExplicitlySet()
{
  return MEMORY[0x24BE01400]();
}

uint64_t ACHLogDefault()
{
  return MEMORY[0x24BE01450]();
}

uint64_t ACHSetMobileAssetServerURL()
{
  return MEMORY[0x24BE01588]();
}

uint64_t ACHShouldUseNewAwardsSystem()
{
  return MEMORY[0x24BE01590]();
}

uint64_t ACHTinkerHistoricalEvaluationPolicy()
{
  return MEMORY[0x24BE01980]();
}

uint64_t FIAreFitnessAppsRestricted()
{
  return MEMORY[0x24BE32598]();
}

uint64_t FIIsActivePairedDeviceSatellitePaired()
{
  return MEMORY[0x24BE32668]();
}

uint64_t HDQuantitySampleEntityPredicateForQuantity()
{
  return MEMORY[0x24BE408F8]();
}

uint64_t HKCreateSerialDispatchQueue()
{
  return MEMORY[0x24BDD2B20]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

uint64_t _HKInitializeLogging()
{
  return MEMORY[0x24BDD4338]();
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
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

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
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

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

