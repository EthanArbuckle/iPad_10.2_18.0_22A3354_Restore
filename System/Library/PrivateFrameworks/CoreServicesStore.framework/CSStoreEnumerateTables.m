@implementation CSStoreEnumerateTables

void ___CSStoreEnumerateTables_block_invoke(uint64_t a1, CSStore2::Table *this, _BYTE *a3)
{
  CFStringRef v5;
  CFStringRef v6;

  v5 = CSStore2::Table::copyCFName(this);
  if (v5)
  {
    v6 = v5;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    *a3 = 0;
    CFRelease(v6);
  }
}

@end
