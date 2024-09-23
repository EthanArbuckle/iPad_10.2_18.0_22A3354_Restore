@implementation ATXInspectionServerPredictionScoreLogger

void __63___ATXInspectionServerPredictionScoreLogger_inputsAndSubscores__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 16));
}

void __56___ATXInspectionServerPredictionScoreLogger_stageScores__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __77___ATXInspectionServerPredictionScoreLogger_logInputs_subscores_forBundleId___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("inputs");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", a1[6]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = CFSTR("subscores");
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", a1[7]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1[4] + 16), "setObject:forKeyedSubscript:", v4, a1[5]);

}

_QWORD *__73___ATXInspectionServerPredictionScoreLogger_logStageScores_forStageType___block_invoke(_QWORD *result)
{
  unint64_t v1;

  v1 = result[6];
  if (v1 <= 2)
    return (_QWORD *)objc_msgSend(*(id *)(result[4] + 24), "setObject:forKey:", result[5], off_1E82E7A48[v1]);
  return result;
}

@end
