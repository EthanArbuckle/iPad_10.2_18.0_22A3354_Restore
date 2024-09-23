@implementation GEOTileDBSetPragmas

void __GEOTileDBSetPragmas_block_invoke(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  sqlite3 *v13;
  id v14;
  int v15;
  id v16;

  v16 = a3;
  v7 = (void *)a1[4];
  v8 = a2;
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v10 = v9;
  else
    v10 = v16;
  v11 = v10;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PRAGMA %@ = %@;"), v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (sqlite3 *)a1[6];
  v14 = objc_retainAutorelease(v12);
  *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = sqlite3_exec(v13, (const char *)objc_msgSend(v14, "UTF8String"), 0, 0, 0);
  v15 = *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  if (v15 && v15 != 101)
    *a4 = 1;

}

@end
