@implementation MobileInstallationICLRecordsUninstallForInstallCoordinationWithError

void __MobileInstallationICLRecordsUninstallForInstallCoordinationWithError_block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  void (**v11)(_QWORD, _QWORD);

  v3 = a2;
  v4 = v3;
  if (!*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    v8 = v3;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Error"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    v6 = (void (**)(_QWORD, _QWORD))a1[5];
    v4 = v8;
    if (v6)
    {
      v7 = a1[4];
      if (v7)
      {
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __MobileInstallationICLRecordsUninstallForInstallCoordinationWithError_block_invoke_2;
        block[3] = &unk_1E6163B18;
        v11 = v6;
        v10 = v8;
        dispatch_sync(v7, block);

      }
      else
      {
        ((void (**)(_QWORD, id))v6)[2](v6, v8);
      }
      v4 = v8;
    }
  }

}

uint64_t __MobileInstallationICLRecordsUninstallForInstallCoordinationWithError_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __MobileInstallationICLRecordsUninstallForInstallCoordinationWithError_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;

  v7 = a2;
  v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    _SendError(*(void **)(a1 + 32), v6);
  }
  else if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  }

}

@end
