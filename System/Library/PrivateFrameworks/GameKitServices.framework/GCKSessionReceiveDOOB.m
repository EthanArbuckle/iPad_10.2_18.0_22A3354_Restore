@implementation GCKSessionReceiveDOOB

void __GCKSessionReceiveDOOB_block_invoke(uint64_t a1)
{
  void *v2;

  gckHandleRetryICEInit(*(_QWORD *)(a1 + 40), *(_DWORD *)(a1 + 48));
  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v2)
    free(v2);
}

void __GCKSessionReceiveDOOB_block_invoke_9(uint64_t a1)
{
  void *v2;

  gckHandleRetryICERequest(*(_QWORD *)(a1 + 48), *(_DWORD *)(a1 + 56));
  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v2)
    free(v2);
}

void __GCKSessionReceiveDOOB_block_invoke_11(uint64_t a1)
{
  void *v2;

  gckHandleRetryICEResponse(*(_QWORD *)(a1 + 48), *(_DWORD *)(a1 + 56));
  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v2)
    free(v2);
}

void __GCKSessionReceiveDOOB_block_invoke_13(uint64_t a1)
{
  void *v2;

  gckHandleRetryICEForce(*(_QWORD *)(a1 + 48), *(_DWORD *)(a1 + 56));
  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v2)
    free(v2);
}

void __GCKSessionReceiveDOOB_block_invoke_15(uint64_t a1)
{
  void *v2;

  gckHandleRetryICEEnforced(*(_QWORD *)(a1 + 48), *(_DWORD *)(a1 + 56));
  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v2)
    free(v2);
}

void __GCKSessionReceiveDOOB_block_invoke_17(uint64_t a1)
{
  void *v2;

  gckHandleRetryICEValidate(*(_QWORD *)(a1 + 40), *(_DWORD *)(a1 + 48));
  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v2)
    free(v2);
}

void __GCKSessionReceiveDOOB_block_invoke_19(uint64_t a1)
{
  void *v2;

  gckHandleRetryICEViable(*(_QWORD *)(a1 + 40), *(_DWORD *)(a1 + 48));
  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v2)
    free(v2);
}

void __GCKSessionReceiveDOOB_block_invoke_21(uint64_t a1)
{
  void *v2;

  gckHandleRetryICEValidationTimeout(*(_QWORD *)(a1 + 48), *(_DWORD *)(a1 + 56), *(int **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v2)
    free(v2);
}

void __GCKSessionReceiveDOOB_block_invoke_23(uint64_t a1)
{
  void *v2;

  gckHandleRetryICEPreparation(*(_QWORD *)(a1 + 48), *(_DWORD *)(a1 + 56), *(int **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v2)
    free(v2);
}

void __GCKSessionReceiveDOOB_block_invoke_25(uint64_t a1)
{
  void *v2;

  gckHandleRetryICEReport(*(_QWORD *)(a1 + 48), *(_DWORD *)(a1 + 56), *(char **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v2)
    free(v2);
}

@end
