@implementation SASSpeechPartialResult(AFUserUtteranceAdditions)

- (AFUserUtterance)af_userUtteranceValue
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  AFUserUtterance *v11;
  void *v12;
  AFUserUtterance *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(a1, "tokens");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a1, "tokens", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v9), "af_speechToken");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v11 = [AFUserUtterance alloc];
  objc_msgSend(a1, "af_correctionContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[AFUserUtterance initWithTokens:correctionIdentifier:](v11, "initWithTokens:correctionIdentifier:", v4, v12);

  return v13;
}

- (id)af_bestTextInterpretation
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "af_userUtteranceValue");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bestTextInterpretation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
