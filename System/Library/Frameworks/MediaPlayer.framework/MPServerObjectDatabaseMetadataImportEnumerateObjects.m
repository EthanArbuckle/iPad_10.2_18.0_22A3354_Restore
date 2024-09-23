@implementation MPServerObjectDatabaseMetadataImportEnumerateObjects

void ___MPServerObjectDatabaseMetadataImportEnumerateObjects_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  id *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(&unk_1E31E58C0, "containsObject:", v5))
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
    v7 = *(unsigned __int8 *)(a1 + 96);
    if (*(_BYTE *)(a1 + 96))
      v8 = &v12;
    else
      v8 = 0;
    if (*(_BYTE *)(a1 + 96))
      v12 = 0;
    v9 = *(_QWORD *)(a1 + 56);
    if (!v9)
      v9 = *(_QWORD *)(a1 + 64);
    v10 = *(_QWORD *)(a1 + 72);
    if (!v10)
      v10 = *(_QWORD *)(a1 + 80);
    _MPServerObjectDatabaseMetadataImportEnumerateObjects(v6, v8, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), v9, v10, 0, *(_QWORD *)(a1 + 88));
    if (v7)
      v11 = v12;
    else
      v11 = 0;
    objc_msgSend(*(id *)(a1 + 40), "removeLastObject");
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v11, v5);

  }
}

@end
