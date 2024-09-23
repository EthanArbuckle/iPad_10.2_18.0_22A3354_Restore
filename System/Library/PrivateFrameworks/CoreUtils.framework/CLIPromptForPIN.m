@implementation CLIPromptForPIN

uint64_t __CLIPromptForPIN_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v14;
  void *v15;

  v2 = mach_absolute_time();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = v3 >= v2;
  v5 = v3 - v2;
  if (v5 != 0 && v4)
  {
    UpTicksToSeconds(v5);
    return CLIProgressUpdate((uint64_t)"Throttling for %llu seconds...", v6, v7, v8, v9, v10, v11, v12);
  }
  else
  {
    if (gCLIPINTimer)
    {
      v14 = (id)gCLIPINTimer;
      dispatch_source_cancel(v14);
      v15 = (void *)gCLIPINTimer;
      gCLIPINTimer = 0;

    }
    return CLIPromptForPIN(0, 0xFFFFFFFFLL, *(_QWORD *)(a1 + 32));
  }
}

void __CLIPromptForPIN_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;

  if (!a2 || (a3 & 1) != 0)
  {
    FPrintF((uint64_t (*)(unsigned __int8 *, int64_t, _QWORD))*MEMORY[0x1E0C80C10], "User canceled\n", a3, a4, a5, a6, a7, a8, v12);
    if (gCLIPINTimer)
    {
      v10 = (id)gCLIPINTimer;
      dispatch_source_cancel(v10);
      v11 = (void *)gCLIPINTimer;
      gCLIPINTimer = 0;

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v13);

  }
}

@end
