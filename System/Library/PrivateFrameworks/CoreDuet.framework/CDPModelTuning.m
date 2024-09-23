@implementation CDPModelTuning

float __34___CDPModelTuning_fScoreWithBeta___block_invoke(uint64_t a1, float a2, float a3)
{
  return (float)((float)(a2 * a3) * (float)((float)(*(float *)(a1 + 32) * *(float *)(a1 + 32)) + 1.0))
       / (float)(a3 + (float)((float)(*(float *)(a1 + 32) * *(float *)(a1 + 32)) * a2));
}

float __43___CDPModelTuning__testModelWithThreshold___block_invoke(uint64_t a1, int a2)
{
  return *(float *)(a1 + 32) + (float)((float)a2 * *(float *)(a1 + 36));
}

uint64_t __43___CDPModelTuning__testModelWithThreshold___block_invoke_2(uint64_t a1, float a2)
{
  unint64_t v2;

  v2 = vcvtms_s32_f32((float)(a2 - *(float *)(a1 + 40)) / *(float *)(a1 + 44));
  if (*(_QWORD *)(a1 + 32) - 1 >= v2)
    return v2;
  else
    return *(_QWORD *)(a1 + 32) - 1;
}

void __43___CDPModelTuning__testModelWithThreshold___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;

  v21 = 0;
  v22 = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "getEmail:emailLength:atIndex:", &v22, &v21, a2);
  v4 = (void *)objc_opt_class();
  v6 = v21;
  v5 = v22;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __43___CDPModelTuning__testModelWithThreshold___block_invoke_4;
  v11[3] = &unk_1E26E44C0;
  v7 = *(void **)(a1 + 40);
  v11[4] = *(_QWORD *)(a1 + 32);
  v14 = a2;
  v15 = v21;
  v8 = *(_QWORD *)(a1 + 56);
  v16 = v22;
  v17 = v8;
  v9 = v7;
  v18 = *(_OWORD *)(a1 + 64);
  v20 = *(_DWORD *)(a1 + 88);
  v19 = *(_QWORD *)(a1 + 80);
  v10 = *(_QWORD *)(a1 + 48);
  v12 = v9;
  v13 = v10;
  objc_msgSend(v4, "_enumerateSubsetsOfSet:setLength:withSize:callback:", v5, v6, 2, v11);

}

void __43___CDPModelTuning__testModelWithThreshold___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  float *v6;
  uint64_t v7;
  int *v8;
  float *v9;
  int *v10;
  int v11;
  uint64_t v12;
  float *v13;
  unint64_t v14;
  unint64_t v15;
  float *v16;
  uint64_t v17;

  v6 = (float *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "_newPredictionResultWithSeed:seedLength:realSeedLength:maxTrainingEmailID:", a2, a3, a3, (*(_DWORD *)(a1 + 56) - 1));
  v7 = *(_QWORD *)(a1 + 64) - a3;
  v8 = (int *)objc_msgSend((id)objc_opt_class(), "_newSetDifference:setLength:subset:subsetLength:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 64), a2, a3);
  v9 = (float *)malloc_type_calloc(*(_QWORD *)(a1 + 80), 4uLL, 0x100004052888210uLL);
  if (v7 >= 1)
  {
    v10 = v8;
    do
    {
      v11 = *v10++;
      v12 = (*(uint64_t (**)(float))(*(_QWORD *)(a1 + 40) + 16))(v6[4 * v11 + 1]);
      v9[v12] = v9[v12] + 1.0;
    }
    while (v10 < &v8[v7]);
  }
  objc_msgSend((id)objc_opt_class(), "_cumulativeSumOfArray:size:reverse:", v9, *(_QWORD *)(a1 + 80), 1);
  objc_msgSend((id)objc_opt_class(), "_addArray:size:inArray:", v9, *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88));
  free(v9);
  free(v8);
  v13 = (float *)malloc_type_calloc(*(_QWORD *)(a1 + 80), 4uLL, 0x100004052888210uLL);
  v14 = *(_QWORD *)(a1 + 96);
  if (v14)
  {
    v15 = 0;
    v16 = v6 + 1;
    do
    {
      if (*v16 >= 0.0)
      {
        if (*v16 >= *(float *)(a1 + 112))
        {
          v17 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
          v13[v17] = v13[v17] + 1.0;
          v14 = *(_QWORD *)(a1 + 96);
        }
        else
        {
          *v13 = *v13 + 1.0;
        }
      }
      ++v15;
      v16 += 4;
    }
    while (v14 > v15);
  }
  objc_msgSend((id)objc_opt_class(), "_cumulativeSumOfArray:size:reverse:", v13, *(_QWORD *)(a1 + 80), 1);
  objc_msgSend((id)objc_opt_class(), "_addArray:size:inArray:", v13, *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 104));
  free(v13);
  free(v6);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += v7;
}

@end
