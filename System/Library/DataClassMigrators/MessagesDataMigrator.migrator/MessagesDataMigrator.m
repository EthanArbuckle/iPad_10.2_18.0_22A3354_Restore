void sub_21E1E9AC4(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  IMDSMSRecordStoreSave();
  IMDSystemMigrationSetHasMigrated();
  objc_msgSend(*(id *)(a1 + 32), "setiCloudBackupsAndRestoresEnabledForSMSDirectory");
  objc_msgSend(*(id *)(a1 + 32), "saveDeviceState:isMigrating:", 1, 0);
  objc_msgSend(*(id *)(a1 + 32), "clearMOCDefaultsForRestoreFromBackupIfNeeded");
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_21E1E8000, v2, OS_LOG_TYPE_INFO, "Finished iMessage data migration", v3, 2u);
    }
  }
}

void sub_21E1E9C1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E1E9C34(uint64_t a1)
{
  const __CFString *v2;
  const __CFString *v3;
  CFIndex Length;
  int MaximumSizeForEncoding;
  UInt8 *v6;
  float v7;
  stat usedBufLen;
  CFRange v9;

  v2 = (const __CFString *)IMDSMSRecordStoreCopySMSDBPath();
  if (v2)
  {
    v3 = v2;
    Length = (int)CFStringGetLength(v2);
    MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
    *(_QWORD *)&usedBufLen.st_dev = 0;
    v6 = (UInt8 *)malloc_type_malloc(MaximumSizeForEncoding + 1, 0x471A7865uLL);
    v9.location = 0;
    v9.length = Length;
    CFStringGetBytes(v3, v9, 0x8000100u, 0, 0, v6, MaximumSizeForEncoding, (CFIndex *)&usedBufLen.st_dev);
    v6[*(_QWORD *)&usedBufLen.st_dev] = 0;
    memset(&usedBufLen, 0, sizeof(usedBufLen));
    if (!stat((const char *)v6, &usedBufLen))
    {
      v7 = (double)usedBufLen.st_size * 0.000114746094;
      *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v7;
    }
    free(v6);
    CFRelease(v3);
  }
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x24BDBC5F8](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC660](length, *(_QWORD *)&encoding);
}

uint64_t IMClearDidPerformInitialChatVocabularyUpdate()
{
  return MEMORY[0x24BE50BB8]();
}

uint64_t IMDPersistencePerformBlock()
{
  return MEMORY[0x24BE50548]();
}

uint64_t IMDSMSRecordStoreCopySMSDBPath()
{
  return MEMORY[0x24BE50550]();
}

uint64_t IMDSMSRecordStoreSave()
{
  return MEMORY[0x24BE50558]();
}

uint64_t IMDSystemMigrationSetHasMigrated()
{
  return MEMORY[0x24BE50560]();
}

uint64_t IMGetDomainBoolForKey()
{
  return MEMORY[0x24BE506B8]();
}

uint64_t IMOSLoggingEnabled()
{
  return MEMORY[0x24BE50790]();
}

uint64_t IMSaveDeviceState()
{
  return MEMORY[0x24BE50578]();
}

uint64_t IMSetDomainBoolForKey()
{
  return MEMORY[0x24BE507C8]();
}

uint64_t IMSetDomainValueForKey()
{
  return MEMORY[0x24BE507D0]();
}

uint64_t OSLogHandleForIMFoundationCategory()
{
  return MEMORY[0x24BE50908]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAFEA8](a1, a2);
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          -[MessagesDataMigrator _printCriticalDefaultsWithMessage:](self, "_printCriticalDefaultsWithMessage:", CFSTR("Finished clearing with new values"));
    IMClearDidPerformInitialChatVocabularyUpdate();
  }
  else if (IMGetDomainBoolForKey())
  {
    IMSetDomainValueForKey();
  }
}

@end
