@implementation LBSetSyncEnabledForItem

void __LBSetSyncEnabledForItem_block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:", 22);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __LBSetSyncEnabledForItem_block_invoke_2(uint64_t a1)
{
  _BOOL4 v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  char v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  char v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  _QWORD block[4];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;

  v2 = *(_BYTE *)(a1 + 64) != 0;
  v3 = *(void **)(a1 + 56);
  v4 = *(id *)(a1 + 48);
  v5 = v3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (((v2 ^ objc_msgSend(v6, "isUbiquitousItemAtURL:", v4)) & 1) != 0)
  {
    v25 = 0;
    v7 = *MEMORY[0x1E0C99968];
    v24 = 0;
    v8 = objc_msgSend(v4, "getResourceValue:forKey:error:", &v25, v7, &v24);
    v9 = v25;
    v10 = v24;
    v11 = v10;
    if ((v8 & 1) != 0)
    {
      if ((objc_msgSend(v9, "isEqual:", *MEMORY[0x1E0C99960]) & 1) == 0
        && (objc_msgSend(v9, "isEqual:", *MEMORY[0x1E0C99978]) & 1) == 0)
      {
        _NSErrorWithFilePathErrnoAndVariant();
        v12 = objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
      if (objc_msgSend(v5, "checkResourceIsReachableAndReturnError:", 0))
      {
        _NSErrorWithFilePathAndErrno();
        v12 = objc_claimAutoreleasedReturnValue();
LABEL_13:
        v13 = (void *)v12;
        goto LABEL_14;
      }
      v23 = v11;
      v15 = objc_msgSend(v6, "moveItemAtURL:toURL:error:", v4, v5, &v23);
      v16 = v23;

      if ((v15 & 1) != 0)
      {
        v13 = 0;
        v11 = v16;
        goto LABEL_14;
      }
      v14 = v16;
    }
    else
    {
      v14 = v10;
    }
    v13 = v14;
    v11 = v14;
  }
  else
  {
    _NSErrorWithFilePathErrnoAndVariant();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v9 = 0;
  }
LABEL_14:

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __LBSetSyncEnabledForItem_block_invoke_3;
  block[3] = &unk_1E3DA5150;
  v17 = *(NSObject **)(a1 + 32);
  v18 = *(id *)(a1 + 40);
  v21 = v13;
  v22 = v18;
  v19 = v13;
  dispatch_async(v17, block);

}

uint64_t __LBSetSyncEnabledForItem_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end
