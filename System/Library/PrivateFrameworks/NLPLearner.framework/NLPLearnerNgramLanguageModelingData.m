@implementation NLPLearnerNgramLanguageModelingData

+ (void)initialize
{
  os_log_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = os_log_create("com.apple.NLP", "NLPLearnerNgramLanguageModelingData");
    v3 = (void *)sLogNgramLM;
    sLogNgramLM = (uint64_t)v2;

  }
}

+ (unint64_t)defaultMaxSequenceLength
{
  return 256;
}

- (NLPLearnerNgramLanguageModelingData)initWithLocale:(id)a3
{
  id v4;
  NLPLearnerNgramLanguageModelingData *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NLPLearnerNgramLanguageModelingData;
  v5 = -[NLPLearnerLanguageModelingData initWithLocale:](&v7, sel_initWithLocale_, v4);
  if (v5)
    -[NLPLearnerTextData setMaxSequenceLength:](v5, "setMaxSequenceLength:", objc_msgSend((id)objc_opt_class(), "defaultMaxSequenceLength"));

  return v5;
}

- (void)addPreprocessedExample:(void *)a3
{
  size_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = *((_QWORD *)a3 + 1) - *(_QWORD *)a3;
  v6 = malloc_type_malloc(v5, 0x4F6992F2uLL);
  if (v6)
  {
    v7 = v6;
    memcpy(v6, *(const void **)a3, v5);
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v7, v5, 1);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[NLPLearnerTextData sentences](self, "sentences");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

  }
}

@end
