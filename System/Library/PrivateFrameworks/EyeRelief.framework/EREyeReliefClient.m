@implementation EREyeReliefClient

- (BOOL)toggleDistanceSampling:(id *)a3
{
  void *v4;
  void *v5;
  char v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  +[EREyeReliefConnection sharedConnection](EREyeReliefConnection, "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  v14 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __44__EREyeReliefClient_toggleDistanceSampling___block_invoke;
  v8[3] = &unk_250BBBA30;
  v8[4] = &v15;
  v8[5] = &v9;
  objc_msgSend(v4, "toggleDistanceSampling:", v8);
  if (a3)
  {
    v5 = (void *)v10[5];
    if (v5)
      *a3 = objc_retainAutorelease(v5);
  }
  v6 = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

void __44__EREyeReliefClient_toggleDistanceSampling___block_invoke(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)isDistanceSamplingEnabledWithError:(id *)a3
{
  void *v4;
  void *v5;
  char v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  +[EREyeReliefConnection sharedConnection](EREyeReliefConnection, "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  v14 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __56__EREyeReliefClient_isDistanceSamplingEnabledWithError___block_invoke;
  v8[3] = &unk_250BBBA30;
  v8[4] = &v15;
  v8[5] = &v9;
  objc_msgSend(v4, "isDistanceSamplingEnabled:", v8);
  if (a3)
  {
    v5 = (void *)v10[5];
    if (v5)
      *a3 = objc_retainAutorelease(v5);
  }
  v6 = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

void __56__EREyeReliefClient_isDistanceSamplingEnabledWithError___block_invoke(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

@end
