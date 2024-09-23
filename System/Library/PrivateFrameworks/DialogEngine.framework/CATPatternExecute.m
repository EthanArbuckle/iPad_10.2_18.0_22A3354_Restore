@implementation CATPatternExecute

void __CATPatternExecute_block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  __int128 v11;
  _QWORD v12[4];
  __int128 v13;
  uint64_t v14;

  v2 = (void *)MEMORY[0x1E0C99E98];
  v3 = (_QWORD *)(a1 + 72);
  if (*(char *)(a1 + 95) < 0)
    v3 = (_QWORD *)*v3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (_QWORD *)(a1 + 96);
  if (*(char *)(a1 + 119) < 0)
    v6 = (_QWORD *)*v6;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __CATPatternExecute_block_invoke_2;
  v12[3] = &unk_1E7930F98;
  v14 = *(_QWORD *)(a1 + 64);
  v11 = *(_OWORD *)(a1 + 48);
  v10 = (id)v11;
  v13 = v11;
  +[CATPattern execute:templateDir:patternId:parameters:globals:options:completion:](CATPattern, "execute:templateDir:patternId:parameters:globals:options:completion:", 0, v5, v7, v8, v9, 0, v12);

}

void __CATPatternExecute_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
