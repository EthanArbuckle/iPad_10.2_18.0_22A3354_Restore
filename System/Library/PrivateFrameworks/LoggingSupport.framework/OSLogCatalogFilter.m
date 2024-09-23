@implementation OSLogCatalogFilter

void __37___OSLogCatalogFilter_isKeptCatalog___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;

  v4 = *(void **)(a1 + 32);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", a3);
  LODWORD(v4) = objc_msgSend(v4, "containsUUID:", v5);

  if ((_DWORD)v4)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
}

void __37___OSLogCatalogFilter_isKeptCatalog___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v3, "containsSubsystemSubstr:", v4);

  if ((_DWORD)v3)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
}

void __37___OSLogCatalogFilter_isKeptCatalog___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a2 + 4));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v3, "containsProcessID:", v4);

  if ((_DWORD)v3)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
}

uint64_t __35___OSLogCatalogFilter_readDSCUUIDs__block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __35___OSLogCatalogFilter_readDSCUUIDs__block_invoke_2;
  v3[3] = &unk_1E41573D0;
  v3[4] = *(_QWORD *)(a1 + 32);
  return _os_trace_uuiddb_dsc_foreach_uuid(a2, (uint64_t)v3);
}

uint64_t __35___OSLogCatalogFilter_readDSCUUIDs__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "containsSenderLookupSubstr:", v5);

  if ((_DWORD)v4)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 57) = 1;
    v6 = *(void **)(a1 + 32);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", a2);
    objc_msgSend(v6, "addUUID:", v7);

  }
  return 1;
}

@end
