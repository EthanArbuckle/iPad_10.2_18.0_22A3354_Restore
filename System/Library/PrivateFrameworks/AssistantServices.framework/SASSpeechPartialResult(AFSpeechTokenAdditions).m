@implementation SASSpeechPartialResult(AFSpeechTokenAdditions)

+ (id)createUsingPhrases:()AFSpeechTokenAdditions andUtterances:
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, uint64_t);
  void *v18;
  id v19;
  id v20;

  v5 = a3;
  v6 = (void *)MEMORY[0x1E0C99DE8];
  v7 = a4;
  objc_msgSend(v6, "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "interpretationIndices");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __83__SASSpeechPartialResult_AFSpeechTokenAdditions__createUsingPhrases_andUtterances___block_invoke;
  v18 = &unk_1E3A2E498;
  v19 = v5;
  v20 = v8;
  v11 = v8;
  v12 = v5;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", &v15);

  v13 = objc_alloc_init(MEMORY[0x1E0D883D8]);
  objc_msgSend(v13, "setTokens:", v11, v15, v16, v17, v18);

  return v13;
}

@end
