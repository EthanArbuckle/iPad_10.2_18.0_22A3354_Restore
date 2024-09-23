@implementation GKStashStackTrace

void __GKStashStackTrace_block_invoke()
{
  GKThreadsafeDictionary *v0;
  void *v1;

  v0 = -[GKThreadsafeDictionary initWithName:]([GKThreadsafeDictionary alloc], "initWithName:", CFSTR("stack-traces"));
  v1 = (void *)sStackTraces;
  sStackTraces = (uint64_t)v0;

}

void __GKStashStackTrace_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v8 = a2;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __GKStashStackTrace_block_invoke_3;
  v9[3] = &unk_1E75B1490;
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v10 = v3;
  v11 = v4;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v9);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), ++sTraceIdentifier);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    objc_msgSend(v8, "setObject:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  }

}

void __GKStashStackTrace_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(a3, "isEqual:", *(_QWORD *)(a1 + 32)))
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);

}

@end
