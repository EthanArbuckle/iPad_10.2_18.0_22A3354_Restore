@implementation ABAddressBookMovePersonToSource

sqlite3_stmt *__ABAddressBookMovePersonToSource_block_invoke(uint64_t a1, const __CFString *a2)
{
  sqlite3_stmt *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v2 = removeSyncImagesForRecord(a2, (uint64_t)a2, *(_QWORD *)(a1 + 32));
  if ((v2 & 1) == 0)
  {
    ABDiagnosticsEnabled();
    _ABLog2(3, (uint64_t)"_Bool ABAddressBookMovePersonToSource(ABAddressBookRef, ABRecordRef, ABRecordRef, _Bool, CFErrorRef *)_block_invoke", 898, 0, (uint64_t)CFSTR("removeSyncImagesForRecord returned an error while moving contacts between sources. Continuing with move anyway."), v3, v4, v5, v7);
  }
  return v2;
}

@end
