void OUTLINED_FUNCTION_9(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

const __CFString *DCCredentialPayloadFormatToString(unint64_t a1)
{
  if (a1 > 4)
    return CFSTR("Unknown");
  else
    return off_24C305F60[a1];
}

const __CFString *DCCredentialPayloadProtectionPolicyToString(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("Unknown");
  if (a1 == 1)
    v1 = CFSTR("Biometric");
  if (a1)
    return v1;
  else
    return CFSTR("Standard");
}

const __CFString *DCCredentialPayloadProtectionTypeToString(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("Unknown");
  else
    return off_24C305F88[a1];
}

const __CFString *DCCredentialCryptoKeyTypeToString(unint64_t a1)
{
  if (a1 > 3)
    return CFSTR("Unknown");
  else
    return off_24C305FA0[a1];
}

const __CFString *DCCredentialCryptoKeyUsageToString(unint64_t a1)
{
  if (a1 > 5)
    return CFSTR("Unknown");
  else
    return off_24C305FC0[a1];
}

id DC_LOG_CLIENT()
{
  if (DC_LOG_CLIENT_once != -1)
    dispatch_once(&DC_LOG_CLIENT_once, &__block_literal_global);
  return (id)DC_LOG_CLIENT_log;
}

const __CFString *DCCredentialStateToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return CFSTR("Invalid");
  else
    return off_24C306130[a1 - 1];
}

const __CFString *DCCredentialReaderAuthenticationPolicyToString(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("Unknown");
  if (a1 == 1)
    v1 = CFSTR("Identity");
  if (a1)
    return v1;
  else
    return CFSTR("None");
}

const __CFString *DCCredentialPresentmentAuthPolicyToString(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("Unknown");
  else
    return off_24C306148[a1];
}

const __CFString *DCCredentialElementNumericTypeHintToString(unint64_t a1)
{
  if (a1 > 3)
    return CFSTR("Unknown");
  else
    return off_24C306160[a1];
}

const __CFString *DCPresentmentTypeToString(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("Unknown");
  if (a1 == 1)
    v1 = CFSTR("Digital");
  if (a1)
    return v1;
  else
    return CFSTR("Physical");
}

const __CFString *DCPresentmentSessionEncryptionModeToString(unint64_t a1)
{
  if (a1 > 3)
    return CFSTR("Unknown");
  else
    return off_24C306180[a1];
}

const __CFString *DCPresentmentSessionResponseEncryptionModeToString(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("Unknown");
  if (a1 == 1)
    v1 = CFSTR("Apple HPKE");
  if (a1)
    return v1;
  else
    return CFSTR("Disabled");
}

const __CFString *DCPresentmentResponseStatusToString(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("Unknown");
  else
    return off_24C3061A0[a1];
}

const __CFString *DCPresentmentElementRetentionIntentToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return CFSTR("Unknown");
  else
    return off_24C3061B8[a1 - 1];
}

const __CFString *DCPresentmentTransportKeySpecificationToString(uint64_t a1)
{
  if (a1 == 1)
    return CFSTR("ISO18013-5");
  else
    return CFSTR("Unknown");
}

id DCPresentmentElementFallbackModeToString(char a1)
{
  void *v2;
  const __CFString *v3;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("["));
  if ((a1 & 1) != 0)
  {
    v3 = CFSTR("ageOverToAgeInYears");
    goto LABEL_5;
  }
  if ((a1 & 2) != 0)
  {
    v3 = CFSTR("ageOverToNearestAgeOver");
LABEL_5:
    objc_msgSend(v2, "appendFormat:", v3);
  }
  objc_msgSend(v2, "appendFormat:", CFSTR("]"));
  return v2;
}

const __CFString *DCPresentmentMessageEncodingFormatToString(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("Unknown");
  if (a1 == 1)
    v1 = CFSTR("ACWG");
  if (a1)
    return v1;
  else
    return CFSTR("Standard");
}

id DC_LOG_CLIENT_0()
{
  if (DC_LOG_CLIENT_once_0 != -1)
    dispatch_once(&DC_LOG_CLIENT_once_0, &__block_literal_global_0);
  return (id)DC_LOG_CLIENT_log_0;
}

const __CFString *DCCredentialAuthACLTypeToString(unint64_t a1)
{
  if (a1 > 3)
    return CFSTR("Unknown");
  else
    return off_24C306610[a1];
}

id DC_LOG_CLIENT_1()
{
  if (DC_LOG_CLIENT_once_1 != -1)
    dispatch_once(&DC_LOG_CLIENT_once_1, &__block_literal_global_1);
  return (id)DC_LOG_CLIENT_log_1;
}

id DC_LOG_MILESTONE_LOG()
{
  if (DC_LOG_MILESTONE_LOG_once != -1)
    dispatch_once(&DC_LOG_MILESTONE_LOG_once, &__block_literal_global_176);
  return (id)DC_LOG_MILESTONE_LOG_log;
}

id DC_LOG_CLIENT_2()
{
  if (DC_LOG_CLIENT_once_2 != -1)
    dispatch_once(&DC_LOG_CLIENT_once_2, &__block_literal_global_2);
  return (id)DC_LOG_CLIENT_log_2;
}

id DC_LOG_CLIENT_3()
{
  if (DC_LOG_CLIENT_once_3 != -1)
    dispatch_once(&DC_LOG_CLIENT_once_3, &__block_literal_global_3);
  return (id)DC_LOG_CLIENT_log_3;
}

uint64_t sub_20A4233B4()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for BundleToken()
{
  return objc_opt_self();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
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

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
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

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

