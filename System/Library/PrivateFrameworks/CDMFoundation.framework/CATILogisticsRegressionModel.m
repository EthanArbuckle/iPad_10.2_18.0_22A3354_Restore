@implementation CATILogisticsRegressionModel

- (id)getBestIntent:()vector<float numberOfModels:(std:(unint64_t)a4 :(void *)a5 allocator<float>> *)a3 weightMatrix:(id)a6 guids:(id)a7 usoEdgeKey:
{
  id v11;
  id v12;
  int64_t v13;
  vDSP_Length __P;
  _DWORD *v15;
  float *v16;
  float *var0;
  _DWORD *v18;
  int v19;
  float *v20;
  float *v21;
  float *v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  float v26;
  uint64_t v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;

  v11 = a6;
  v12 = a7;
  v13 = a3->var1 - a3->var0;
  __P = v13 + 1;
  v15 = malloc_type_calloc(v13 + 1, 4uLL, 0x100004052888210uLL);
  v16 = (float *)v15;
  *v15 = 1065353216;
  if ((unint64_t)(v13 + 1) >= 2)
  {
    var0 = a3->var0;
    v18 = v15 + 1;
    do
    {
      v19 = *(_DWORD *)var0++;
      *v18++ = v19;
      --v13;
    }
    while (v13);
  }
  v20 = (float *)malloc_type_calloc(a4, 4uLL, 0x100004052888210uLL);
  vDSP_mmul(*(const float **)a5, 1, v16, 1, v20, 1, a4, 1uLL, __P);
  v21 = (float *)malloc_type_calloc(a4, 4uLL, 0x100004052888210uLL);
  v22 = v21;
  if (a4)
  {
    v23 = 0;
    do
    {
      v22[v23] = 1.0 / (float)(expf(-v20[v23]) + 1.0);
      ++v23;
    }
    while (a4 != v23);
    v24 = 0;
    v25 = 0;
    v26 = *v22;
    do
    {
      if (v22[v24] > v26)
      {
        v26 = v22[v24];
        v25 = v24;
      }
      ++v24;
    }
    while (a4 != v24);
    v27 = v25;
  }
  else
  {
    v27 = 0;
    v26 = *v21;
  }
  objc_msgSend(v11, "objectAtIndex:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_opt_new();
  objc_msgSend(v29, "setValue:forKey:", v28, v12);
  *(float *)&v30 = v26;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setValue:forKey:", v31, CFSTR("confidence_score"));

  free(v16);
  free(v22);
  free(v20);

  return v29;
}

@end
