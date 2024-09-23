@implementation FPResumeSyncForFileAtURLWithBehavior

void __FPResumeSyncForFileAtURLWithBehavior_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void (*v9)(void);
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v10[0] = CFSTR("NSFileProviderInternalErrorDomain");
    v10[1] = CFSTR("NSFileProviderErrorDomain");
    v4 = *MEMORY[0x1E0CB2FE0];
    v10[2] = *MEMORY[0x1E0CB28A8];
    v10[3] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fp_unwrappedErrorForDomains:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("NSFileProviderInternalErrorDomain")))
    {
      v8 = objc_msgSend(v6, "code");

      if (v8 != 17)
      {
        v9 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
LABEL_8:
        v9();

        goto LABEL_9;
      }
    }
    else
    {

    }
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    goto LABEL_8;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_9:

}

@end
