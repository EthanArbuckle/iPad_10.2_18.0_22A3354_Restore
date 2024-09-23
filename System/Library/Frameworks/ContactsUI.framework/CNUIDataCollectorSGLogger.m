@implementation CNUIDataCollectorSGLogger

+ (id)loggerWithSGSuggestionsServiceProvider:(id)a3 schedulerProvider:(id)a4
{
  id v5;
  id v6;
  _CNUIDataCollectorSGLogger *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[_CNUIDataCollectorSGLogger initWithSuggestionsServiceProvider:schedulerProvider:]([_CNUIDataCollectorSGLogger alloc], "initWithSuggestionsServiceProvider:schedulerProvider:", v6, v5);

  return v7;
}

uint64_t __82___CNUIDataCollectorSGLogger_logSearchResultsIncludedPureSuggestionsWithBundleID___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "logMetricSearchResultsIncludedPureSuggestionWithBundleId:", *(_QWORD *)(a1 + 32));
}

uint64_t __75___CNUIDataCollectorSGLogger_logContactCreated_contactIdentifier_bundleID___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "logMetricContactCreated:contactIdentifier:bundleId:", a1[4], a1[5], a1[6]);
}

uint64_t __87___CNUIDataCollectorSGLogger_logSuggestedContactDetailUsed_contactIdentifier_bundleID___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "logMetricSuggestedContactDetailUsed:contactIdentifier:bundleId:", a1[4], a1[5], a1[6]);
}

uint64_t __88___CNUIDataCollectorSGLogger_logSuggestedContactDetailShown_contactIdentifier_bundleID___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "logMetricSuggestedContactDetailShown:contactIdentifier:bundleId:", a1[4], a1[5], a1[6]);
}

uint64_t __88___CNUIDataCollectorSGLogger_logContactSearchResultSelected_contactIdentifier_bundleID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;

  if (*(_QWORD *)(a1 + 40))
    v2 = (8 * (*(_QWORD *)(a1 + 32) != 0)) | 4u;
  else
    v2 = 8 * (*(_QWORD *)(a1 + 32) != 0);
  return objc_msgSend(a2, "logMetricContactSearchResult:recordId:contactIdentifier:bundleId:", v2);
}

void __54___CNUIDataCollectorSGLogger_performBlockWithService___block_invoke(uint64_t a1)
{
  id v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
