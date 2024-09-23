@implementation NSArray

uint64_t __96__NSArray_UpcomingMedia__atx_filterPlayMediaIntentsWithUnavailableAppDestinationGivenSBAppList___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v15;
  void *v16;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("ATXMediaActionPrediction.mm"), 38, CFSTR("element of the array should comform to ATXActionPredictionContainer"));

  }
  objc_msgSend(v3, "scoredAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predictedItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "intent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("ATXMediaActionPrediction.mm"), 42, CFSTR("intent should be INPlayMediaIntent"));

  }
  objc_msgSend(v5, "intent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "proxiedBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (v10)
  {
    v11 = (void *)a1[5];
    objc_msgSend(v8, "proxiedBundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "containsObject:", v12);

  }
  else
  {
    v13 = 1;
  }

  return v13;
}

@end
