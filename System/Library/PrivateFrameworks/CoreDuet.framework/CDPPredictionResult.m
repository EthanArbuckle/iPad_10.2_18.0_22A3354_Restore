@implementation CDPPredictionResult

uint64_t __38___CDPPredictionResult_rankedMembers___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", a2);
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", v6);
  v8 = objc_claimAutoreleasedReturnValue();

  if (v8 | v7)
    v9 = -1;
  else
    v9 = 0;
  if (v8)
    v10 = 1;
  else
    v10 = v9;
  if (v8)
    v11 = v7 == 0;
  else
    v11 = 1;
  if (!v11)
    v10 = objc_msgSend((id)v8, "compare:", v7);

  return v10;
}

BOOL __54___CDPPredictionResult_rankedMembersPassingThreshold___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  double v4;
  _BOOL8 v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4 >= *(double *)(a1 + 40);

  return v5;
}

@end
