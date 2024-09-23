@implementation CalDatabaseCopyAttachmentFileInStoreWithLocalPath

uint64_t __CalDatabaseCopyAttachmentFileInStoreWithLocalPath_block_invoke(uint64_t a1, uint64_t a2)
{
  sqlite3_bind_int(*(sqlite3_stmt **)(a2 + 8), 1, *(_DWORD *)(a1 + 40));
  return sqlite3_bind_text(*(sqlite3_stmt **)(a2 + 8), 2, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"), -1, 0);
}

@end
