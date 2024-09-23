@implementation MRServiceClientRemoteResolvedPlayerPathCommandCallbacks

void ___MRServiceClientRemoteResolvedPlayerPathCommandCallbacks_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___MRServiceClientRemoteResolvedPlayerPathCommandCallbacks_block_invoke_2;
  block[3] = &unk_1E30C5F40;
  v4 = *(NSObject **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = v3;
  v5 = v3;
  dispatch_sync(v4, block);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

uint64_t ___MRServiceClientRemoteResolvedPlayerPathCommandCallbacks_block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", *(_QWORD *)(a1 + 40));
}

void ___MRServiceClientRemoteResolvedPlayerPathCommandCallbacks_block_invoke_3(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD);
  MRCommandResult *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  MRCommandResult *v7;
  _QWORD v8[4];
  int v9;

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = ___MRServiceClientRemoteResolvedPlayerPathCommandCallbacks_block_invoke_4;
  v8[3] = &__block_descriptor_36_e26___NSArray_16__0__NSArray_8l;
  v9 = *(_DWORD *)(a1 + 56);
  v2 = (void (**)(_QWORD, _QWORD))MEMORY[0x194036C44](v8);
  v3 = [MRCommandResult alloc];
  v2[2](v2, *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(unsigned int *)(a1 + 60);
  objc_msgSend(*(id *)(a1 + 40), "playerPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MRCommandResult initWithResultStatuses:sendError:playerPath:](v3, "initWithResultStatuses:sendError:playerPath:", v4, v5, v6);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

id ___MRServiceClientRemoteResolvedPlayerPathCommandCallbacks_block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v3 = a2;
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = ___MRServiceClientRemoteResolvedPlayerPathCommandCallbacks_block_invoke_5;
  v11 = &unk_1E30CB188;
  v5 = v4;
  v12 = v5;
  v13 = &v14;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", &v8);
  if (*((_BYTE *)v15 + 24) && !objc_msgSend(v5, "count", v8, v9, v10, v11))
  {
    +[MRSendCommandResultStatus statusWithCode:](MRSendCommandResultStatus, "statusWithCode:", 2 * (MRMediaRemoteCommandIsLegacy(*(_DWORD *)(a1 + 32)) == 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
  _Block_object_dispose(&v14, 8);

  return v5;
}

void ___MRServiceClientRemoteResolvedPlayerPathCommandCallbacks_block_invoke_5(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "statusCode") == 3)
  {
    objc_msgSend(*(id *)(a1 + 32), "removeObject:", v3);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

@end
