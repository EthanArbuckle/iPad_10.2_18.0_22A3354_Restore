@implementation ACAccount

uint64_t __49__ACAccount_CalAdditions__calCalDAVChildAccounts__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "calIsCalDAVAccount");
}

uint64_t __72__ACAccount_CalAdditions___diffPropertiesWithAccount_firstPropertyOnly___block_invoke(uint64_t a1)
{
  uint64_t result;
  BOOL v3;

  result = objc_msgSend(*(id *)(a1 + 32), "count");
  if (result)
    v3 = *(_BYTE *)(a1 + 48) == 0;
  else
    v3 = 1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

void __53__ACAccount_CalAdditions___calDAVDataclassProperties__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("CalAccountPropertyCalDAVSyncHasTakenPlace");
  v4[1] = CFSTR("CalAccountPropertyCalDAVAttachmentDownloadHasTakenPlace");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_calDAVDataclassProperties_calDAVDataclassProperties;
  _calDAVDataclassProperties_calDAVDataclassProperties = v2;

}

@end
