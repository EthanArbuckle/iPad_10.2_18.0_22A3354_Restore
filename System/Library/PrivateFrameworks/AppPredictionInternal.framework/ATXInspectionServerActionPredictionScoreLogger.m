@implementation ATXInspectionServerActionPredictionScoreLogger

void __70___ATXInspectionServerActionPredictionScoreLogger_actionMetaDataItems__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __106___ATXInspectionServerActionPredictionScoreLogger_storeMetaDataFromActionContainerForKey_actionContainer___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 32), "setObject:forKeyedSubscript:", a1[6], a1[5]);
}

@end
