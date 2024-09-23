@implementation NSArray

MRAVDistantOutputDevice *__49__NSArray_MRAVAdditions__mr_distantOutputDevices__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  MRAVDistantOutputDevice *v3;
  void *v4;
  MRAVDistantOutputDevice *v5;

  v2 = a2;
  v3 = [MRAVDistantOutputDevice alloc];
  objc_msgSend(v2, "descriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[MRAVDistantOutputDevice initWithDescriptor:](v3, "initWithDescriptor:", v4);
  return v5;
}

void __85__NSArray_MRAdditions__changeDescriptionTo_keyBlock_isUpdatedBlock_descriptionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 64) + 16))())
      v6 = *(void **)(a1 + 40);
    else
      v6 = *(void **)(a1 + 48);
    (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 72) + 16))(*(_QWORD *)(a1 + 72), v9);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = *(void **)(a1 + 56);
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
  objc_msgSend(v6, "addObject:", v7);

}

BOOL __54__NSArray_MRAVAdditions__mr_containsVideoOutputDevice__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "deviceSubtype") == 7
      || objc_msgSend(v2, "deviceSubtype") == 8
      || objc_msgSend(v2, "deviceSubtype") == 11
      || objc_msgSend(v2, "deviceSubtype") == 13
      || objc_msgSend(v2, "deviceSubtype") == 15 && objc_msgSend(v2, "clusterType") == 2
      || objc_msgSend(v2, "deviceSubtype") == 16
      || objc_msgSend(v2, "deviceSubtype") == 17
      || objc_msgSend(v2, "deviceSubtype") == 18;
  else
    v3 = 0;

  return v3;
}

MRAVDistantEndpoint *__45__NSArray_MRAVAdditions__mr_distantEndpoints__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  MRAVDistantEndpoint *v3;
  MRAVDistantEndpoint *v4;
  void *v5;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = (MRAVDistantEndpoint *)v2;
  }
  else
  {
    v4 = [MRAVDistantEndpoint alloc];
    objc_msgSend(v2, "descriptor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = -[MRAVDistantEndpoint initWithDescriptor:](v4, "initWithDescriptor:", v5);

  }
  return v3;
}

id __45__NSArray_MRAVAdditions__mr_allOutputDevices__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "activatedClusterMembersOutputDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v8[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v4;
  }
  else
  {
    v7 = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

uint64_t __57__NSArray_MRAVAdditions__mr_arrayByRemovingLocalEndpoint__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isLocalEndpoint") ^ 1;
}

MRAVDistantOutputDevice *__49__NSArray_MRAVAdditions__mr_redactClusterMembers__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  MRAVDistantOutputDevice *v3;

  objc_msgSend(a2, "descriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setActivatedClusterMembers:", 0);
  v3 = -[MRAVDistantOutputDevice initWithDescriptor:]([MRAVDistantOutputDevice alloc], "initWithDescriptor:", v2);

  return v3;
}

BOOL __57__NSArray_MRCommandInfoAdditions__mr_isCommandSupported___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "command") == *(_DWORD *)(a1 + 32);
}

uint64_t __67__NSArray_MRCommandInfoAdditions__mr_isCommandSupportedAndEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (objc_msgSend(v3, "command") == *(_DWORD *)(a1 + 32))
    v4 = objc_msgSend(v3, "isEnabled");
  else
    v4 = 0;

  return v4;
}

BOOL __60__NSArray_MRCommandInfoAdditions__mr_ifDisabledWhyDisabled___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "command") == *(_DWORD *)(a1 + 32);
}

@end
