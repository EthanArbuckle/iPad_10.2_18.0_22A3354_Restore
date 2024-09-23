@implementation MSVProcessCopyMediaFrameworksDescriptions

void __MSVProcessCopyMediaFrameworksDescriptions_block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, const char *a4)
{
  void *v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  MSVFrameworkDescription *v21;
  id v22;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", a4, 4);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "lastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)MSVProcessCopyMediaFrameworksDescriptions_frameworkNames, "containsObject:", v7))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", a3);
    if (*(_BYTE *)(a1 + 40)
      && (objc_msgSend((id)MSVProcessCopyMediaFrameworksDescriptions_frameworkUUIDs, "objectForKeyedSubscript:", v22),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "isEqual:", v8),
          v9,
          (v10 & 1) == 0))
    {
      v13 = dlopen(a4, 277);
      v14 = dlsym(v13, "_DebugMarker");
      dlclose(v13);
      v12 = v14 != 0;
      v11 = 1;
    }
    else
    {
      v11 = 0;
      v12 = 0;
    }
    v15 = (void *)MEMORY[0x1E0CB34D0];
    objc_msgSend(v22, "stringByDeletingLastPathComponent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bundleWithPath:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "infoDictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AE90]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = *(void **)(a1 + 32);
    v21 = -[MSVFrameworkDescription initWithName:uuid:version:root:debug:]([MSVFrameworkDescription alloc], "initWithName:uuid:version:root:debug:", v7, v8, v19, v11, v12);
    objc_msgSend(v20, "addObject:", v21);

  }
}

void __MSVProcessCopyMediaFrameworksDescriptions_block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", *(_QWORD *)(a2 + 40), 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MSVProcessCopyMediaFrameworksDescriptions_frameworkNames;
  v8 = v4;
  objc_msgSend(v4, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "containsObject:", v6);

  if ((_DWORD)v5)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", a2 + 24);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v8);

  }
}

void __MSVProcessCopyMediaFrameworksDescriptions_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E43FC688);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)MSVProcessCopyMediaFrameworksDescriptions_frameworkNames;
  MSVProcessCopyMediaFrameworksDescriptions_frameworkNames = v0;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend((id)MSVProcessCopyMediaFrameworksDescriptions_frameworkNames, "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_dyld_get_shared_cache_uuid())
  {
    v5 = MEMORY[0x1E0C809B0];
    v6 = 3221225472;
    v7 = __MSVProcessCopyMediaFrameworksDescriptions_block_invoke_2;
    v8 = &unk_1E43E8AB8;
    v9 = v2;
    dyld_shared_cache_iterate_text();

  }
  v3 = objc_msgSend(v2, "copy", v5, v6, v7, v8);
  v4 = (void *)MSVProcessCopyMediaFrameworksDescriptions_frameworkUUIDs;
  MSVProcessCopyMediaFrameworksDescriptions_frameworkUUIDs = v3;

}

@end
