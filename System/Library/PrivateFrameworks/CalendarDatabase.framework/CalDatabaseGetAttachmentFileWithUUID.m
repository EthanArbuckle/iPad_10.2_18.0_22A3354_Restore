@implementation CalDatabaseGetAttachmentFileWithUUID

uint64_t ___CalDatabaseGetAttachmentFileWithUUID_block_invoke(uint64_t a1, uint64_t a2)
{
  return sqlite3_bind_text(*(sqlite3_stmt **)(a2 + 8), 1, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"), -1, 0);
}

void ___CalDatabaseGetAttachmentFileWithUUID_block_invoke_2(uint64_t a1, const void *a2, _BYTE *a3)
{
  void *v6;
  int v7;
  CFTypeRef v8;
  void *v9;

  _CalCalendarItemGetDescription((uint64_t)a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v9 = v6;
    v7 = objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", v6);
    v6 = v9;
    if (v7)
    {
      v8 = CFRetain(a2);
      v6 = v9;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v8;
      *a3 = 1;
    }
  }

}

@end
