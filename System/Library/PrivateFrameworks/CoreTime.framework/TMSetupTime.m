@implementation TMSetupTime

void __TMSetupTime_block_invoke(uint64_t a1, xpc_object_t object)
{
  NSObject *v4;
  uint64_t v5;
  _QWORD v6[6];

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    xpc_retain(object);
    v4 = *(NSObject **)(a1 + 32);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __TMSetupTime_block_invoke_2;
    v6[3] = &unk_1E664EF80;
    v5 = *(_QWORD *)(a1 + 48);
    v6[4] = object;
    v6[5] = v5;
    dispatch_async(v4, v6);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    dispatch_release(*(dispatch_object_t *)(a1 + 32));
  }
  _TMReleaseConnection(*(xpc_object_t *)(a1 + 40));
}

void __TMSetupTime_block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void (*v6)(void);
  void *v7;

  if (MEMORY[0x1B5E2AE70](*(_QWORD *)(a1 + 32)) != MEMORY[0x1E0C812F8])
  {
    v2 = (void *)MEMORY[0x1E0CB35C8];
    v3 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("Framework developer error"), *MEMORY[0x1E0CB2D50]);
    v4 = v2;
    v5 = 2;
LABEL_6:
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("com.apple.time"), v5, v3);
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    goto LABEL_7;
  }
  if (!xpc_dictionary_get_BOOL(*(xpc_object_t *)(a1 + 32), "TMSetupSuccessful"))
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v3 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("Error from timed"), *MEMORY[0x1E0CB2D50]);
    v4 = v7;
    v5 = 1;
    goto LABEL_6;
  }
  v6 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_7:
  v6();
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

void __TMSetupTime_block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __TMSetupTime_block_invoke_4;
    block[3] = &unk_1E664EFD0;
    v2 = *(NSObject **)(a1 + 32);
    block[4] = *(_QWORD *)(a1 + 40);
    dispatch_async(v2, block);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    dispatch_release(*(dispatch_object_t *)(a1 + 32));
  }
}

uint64_t __TMSetupTime_block_invoke_4(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.time"), 3, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("Client timeout error"), *MEMORY[0x1E0CB2D50]));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
