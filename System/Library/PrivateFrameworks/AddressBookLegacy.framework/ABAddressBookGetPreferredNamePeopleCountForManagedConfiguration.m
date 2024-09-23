@implementation ABAddressBookGetPreferredNamePeopleCountForManagedConfiguration

uint64_t __ABAddressBookGetPreferredNamePeopleCountForManagedConfiguration_block_invoke(uint64_t a1, int a2)
{
  uint64_t v3;
  sqlite3_stmt *v4;
  uint64_t v5;
  int v6;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(_QWORD *)(v3 + 8);
  v6 = *(_DWORD *)(v5 + 24);
  *(_DWORD *)(v5 + 24) = v6 + 1;
  return sqlite3_bind_int(v4, v6, a2);
}

uint64_t __ABAddressBookGetPreferredNamePeopleCountForManagedConfiguration_block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v3;
  sqlite3_stmt *v4;
  uint64_t v5;
  int v6;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(_QWORD *)(v3 + 8);
  v6 = *(_DWORD *)(v5 + 24);
  *(_DWORD *)(v5 + 24) = v6 + 1;
  return sqlite3_bind_int(v4, v6, a2);
}

@end
