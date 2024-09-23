@implementation DAABLegacyContainerProvider

__CFArray *__94___DAABLegacyContainerProvider_mergeAllRecordsIntoContainer_shouldInsertChangeHistoryRecords___block_invoke(uint64_t a1, __n128 a2)
{
  __CFArray *Mutable;
  CFIndex v4;
  os_log_type_t v5;
  const void *ValueAtIndex;
  ABRecordID RecordID;
  ABRecordID v8;
  const __CFArray *v9;
  const __CFArray *v10;
  const __CFArray *v11;
  const __CFArray *v12;
  NSObject *v13;
  int v14;
  __n128 v16;
  uint8_t buf[4];
  ABRecordID v18;
  __int16 v19;
  int v20;
  uint64_t v21;
  CFRange v22;
  CFRange v23;

  v21 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 68))
    Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
  else
    Mutable = 0;
  if (*(uint64_t *)(a1 + 40) >= 1)
  {
    v4 = 0;
    v5 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 5);
    a2.n128_u64[0] = 67240448;
    v16 = a2;
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 48), v4);
      RecordID = ABRecordGetRecordID(ValueAtIndex);
      if (*(_DWORD *)(a1 + 64) != RecordID)
      {
        v8 = RecordID;
        if (*(_BYTE *)(a1 + 68))
        {
          v9 = ABAddressBookCopyArrayOfAllPeopleInSource((ABAddressBookRef)objc_msgSend(*(id *)(a1 + 32), "addressBook"), ValueAtIndex);
          if (v9)
          {
            v10 = v9;
            v22.length = CFArrayGetCount(v9);
            v22.location = 0;
            CFArrayAppendArray(Mutable, v10, v22);
            CFRelease(v10);
          }
          v11 = ABAddressBookCopyArrayOfAllGroupsInSource((ABAddressBookRef)objc_msgSend(*(id *)(a1 + 32), "addressBook", *(_OWORD *)&v16), ValueAtIndex);
          if (v11)
          {
            v12 = v11;
            v23.length = CFArrayGetCount(v11);
            v23.location = 0;
            CFArrayAppendArray(Mutable, v12, v23);
            CFRelease(v12);
          }
        }
        DALoggingwithCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, v5))
        {
          v14 = *(_DWORD *)(a1 + 64);
          *(_DWORD *)buf = v16.n128_u32[0];
          v18 = v8;
          v19 = 1026;
          v20 = v14;
          _os_log_impl(&dword_1B51E4000, v13, v5, "[mergeAllRecords] Moving all records from source ID %{public}d into source ID %{public}d ", buf, 0xEu);
        }

        objc_msgSend(*(id *)(a1 + 32), "addressBook");
        ABAddressBookMoveAllRecordsInSourceToSource();
      }
      ++v4;
    }
    while (v4 < *(_QWORD *)(a1 + 40));
  }
  return Mutable;
}

@end
