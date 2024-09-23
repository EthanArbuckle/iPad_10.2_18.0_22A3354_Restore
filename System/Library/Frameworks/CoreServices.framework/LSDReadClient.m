@implementation LSDReadClient

uint64_t __50___LSDReadClient_invokeServiceInvocation_isReply___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invoke");
}

uint64_t __65___LSDReadClient_getServerStoreNonBlockingWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __49___LSDReadClient_getDiskUsage_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "XPCConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  LODWORD(v2) = objc_msgSend(v2, "_fetchWithXPCConnection:error:", v3, &v8);
  v4 = v8;

  if ((_DWORD)v2)
  {
    v5 = 0;
    v6 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v6 = 0;
    v5 = v4;
  }
  v7 = (*(uint64_t (**)(_QWORD, uint64_t, id))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v6, v5);
  MEMORY[0x186DAF214](v7);

}

void __80___LSDReadClient_getExtensionPointRecordForCurrentProcessWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "extensionPointRecord");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __98___LSDReadClient_getRelatedTypesOfTypeWithIdentifier_maximumDegreeOfSeparation_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "addObject:");
  v5 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

}

void __90___LSDReadClient_getResourceValuesForKeys_mimic_preferredLocalizations_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  _LSReplaceURLPropertyValueForEncoding(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v7);
}

void __70___LSDReadClient_mapBundleIdentifiers_orMachOUUIDs_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = (void *)_CSStringCopyCFString();
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v3);
    if (v4)
    {
      v5 = *(void **)(a1 + 32);
      if (!v5 || objc_msgSend(v5, "containsObject:", v4))
      {
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
        objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);
      }
    }

  }
}

void __70___LSDReadClient_mapBundleIdentifiers_orMachOUUIDs_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  v5 = *(id *)(a1 + 32);
  v4 = v3;
  _CSArrayEnumerateAllValues();

}

uint64_t __70___LSDReadClient_mapBundleIdentifiers_orMachOUUIDs_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __70___LSDReadClient_mapBundleIdentifiers_orMachOUUIDs_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  v5 = *(id *)(a1 + 32);
  v4 = v3;
  _CSArrayEnumerateAllValues();

}

uint64_t __70___LSDReadClient_mapBundleIdentifiers_orMachOUUIDs_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __70___LSDReadClient_mapBundleIdentifiers_orMachOUUIDs_completionHandler___block_invoke_6(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t result;

  result = _LSGetPlugin(**(_QWORD **)(a1 + 48), a3);
  if (result)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return result;
}

uint64_t __70___LSDReadClient_mapBundleIdentifiers_orMachOUUIDs_completionHandler___block_invoke_7(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t result;

  result = _LSBundleGet(**(void ***)(a1 + 48), a3);
  if (result)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return result;
}

void __70___LSDReadClient_mapBundleIdentifiers_orMachOUUIDs_completionHandler___block_invoke_8(uint64_t a1)
{
  id v2;

  v2 = (id)_CSStringCopyCFString();
  if (v2)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __70___LSDReadClient_mapBundleIdentifiers_orMachOUUIDs_completionHandler___block_invoke_9(uint64_t a1)
{
  id v2;

  v2 = (id)_CSStringCopyCFString();
  if (v2)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __92___LSDReadClient_mapPlugInBundleIdentifiersToContainingBundleIdentifiers_completionHandler___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  v4 = _LSGetPlugin(**(_QWORD **)(a1 + 48), a3);
  if (v4 && _LSBundleGet(**(void ***)(a1 + 48), *(_DWORD *)(v4 + 224)) && (v5 = _CSStringCopyCFString()) != 0)
  {
    v6 = (id)v5;
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, *(_QWORD *)(a1 + 40));
  }
  else
  {
    v6 = 0;
  }

}

@end
