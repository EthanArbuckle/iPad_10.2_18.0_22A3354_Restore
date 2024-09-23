@implementation CLSNLP

+ (id)wordEmbeddingNeighborsWithDistanceForNgram:(id)a3 locale:(id)a4 limit:(unint64_t)a5 distance:(float)a6
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  objc_msgSend(a3, "lowercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0D17478];
  v10 = *MEMORY[0x1E0D17460];
  v16[0] = *MEMORY[0x1E0D17470];
  v16[1] = v10;
  v17[0] = v9;
  v17[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (const void *)NLStringEmbeddingCreateWithOptions();
  v13 = NLStringEmbeddingCopyNeighborsWithDistances();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {

    v14 = (void *)v13;
  }
  if (v12)
    CFRelease(v12);

  return v14;
}

@end
