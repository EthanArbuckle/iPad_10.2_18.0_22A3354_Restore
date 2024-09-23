@implementation NLNLPLanguageModelSession

- (NLNLPLanguageModelSession)initWithLanguageModel:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t *v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  NLNLPLanguageModelSession *v15;
  objc_super v17;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(v7, "granularity");
  v9 = objc_alloc(MEMORY[0x1E0C99D80]);
  objc_msgSend(v7, "localization");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (uint64_t *)MEMORY[0x1E0D17330];
  if (v8 != 1)
    v11 = (uint64_t *)MEMORY[0x1E0D17338];
  v12 = *v11;
  v13 = (_QWORD *)MEMORY[0x1E0D17390];
  if (v8 != 1)
    v13 = (_QWORD *)MEMORY[0x1E0D17398];
  v14 = (void *)objc_msgSend(v9, "initWithObjectsAndKeys:", v10, *MEMORY[0x1E0D17368], v12, *MEMORY[0x1E0D17328], *v13, *MEMORY[0x1E0D173A0], 0);

  v17.receiver = self;
  v17.super_class = (Class)NLNLPLanguageModelSession;
  v15 = -[NLLanguageModelSession initWithLanguageModel:options:](&v17, sel_initWithLanguageModel_options_, v7, v6);

  if (v15)
    v15->_model = (CoreLanguageModelWithState *)CoreLMCreate();

  return v15;
}

- (void)dealloc
{
  CoreLanguageModelWithState *model;
  objc_super v4;

  model = self->_model;
  if (model)
    CFRelease(model);
  v4.receiver = self;
  v4.super_class = (Class)NLNLPLanguageModelSession;
  -[NLNLPLanguageModelSession dealloc](&v4, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v9.receiver = self;
  v9.super_class = (Class)NLNLPLanguageModelSession;
  -[NLNLPLanguageModelSession description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLLanguageModelSession languageModel](self, "languageModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localization");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(%@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_model)
    objc_msgSend(v7, "appendFormat:", CFSTR(":NLP:%p"), self->_model);
  objc_msgSend(v7, "appendString:", CFSTR(")"));
  return v7;
}

- (id)conditionalProbabilityForToken:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  const void *v8;
  const __CFArray *v9;
  const __CFArray *v10;
  BOOL v11;
  NLProbabilityInfo *v12;
  const __CFArray *v14;
  const __CFArray *v15;
  const __CFNumber *ValueAtIndex;
  NLProbabilityInfo *v17;
  double valuePtr;

  v6 = a3;
  v7 = a4;
  if (!self->_model)
    goto LABEL_11;
  v8 = (const void *)CoreLMCopyTokenIdsForText();
  v9 = (const __CFArray *)CoreLMCopyTokenIdsForText();
  v10 = v9;
  if (v8)
    v11 = v9 == 0;
  else
    v11 = 1;
  if (v11)
  {
    v12 = 0;
    if (!v8)
    {
      if (!v9)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  else if (CFArrayGetCount(v9) == 1 && CoreLMUpdateWithContext())
  {
    v14 = (const __CFArray *)CoreLMCopyConditionalProbabilities();
    if (v14)
    {
      v15 = v14;
      if (CFArrayGetCount(v14) == 1
        && (ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(v15, 0),
            valuePtr = 0.0,
            CFNumberGetValue(ValueAtIndex, kCFNumberDoubleType, &valuePtr)))
      {
        v17 = [NLProbabilityInfo alloc];
        v12 = -[NLProbabilityInfo initWithProbability:flags:](v17, "initWithProbability:flags:", 0, valuePtr);
      }
      else
      {
        v12 = 0;
      }
      CFRelease(v15);
    }
    else
    {
      v12 = 0;
    }
    CoreLMReset();
  }
  else
  {
    v12 = 0;
  }
  CFRelease(v8);
  if (v10)
LABEL_9:
    CFRelease(v10);
LABEL_10:
  if (!v12)
LABEL_11:
    v12 = -[NLProbabilityInfo initWithInvalidProbability]([NLProbabilityInfo alloc], "initWithInvalidProbability");

  return v12;
}

- (id)conditionalProbabilityForString:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  const void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  NLProbabilityInfo *v12;
  unint64_t v13;
  unint64_t v15;
  double v16;
  void *v17;
  const __CFArray *v18;
  const __CFArray *v19;
  const __CFNumber *ValueAtIndex;
  int Value;
  int v22;
  double v23;
  id v25;
  double valuePtr;
  void *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!self->_model)
    goto LABEL_30;
  v8 = (const void *)CoreLMCopyTokenIdsForText();
  v9 = (void *)CoreLMCopyTokenIdsForText();
  v10 = objc_msgSend(v9, "count");
  if (v8)
    v11 = v9 == 0;
  else
    v11 = 1;
  if (v11)
  {
    v12 = 0;
    if (!v8)
      goto LABEL_29;
LABEL_28:
    CFRelease(v8);
    goto LABEL_29;
  }
  v13 = v10;
  if (!CoreLMUpdateWithContext())
  {
    v12 = 0;
    goto LABEL_28;
  }
  v25 = v6;
  v15 = 0;
  v16 = 1.0;
  while (1)
  {
    if (v13 == v15)
    {
      v12 = -[NLProbabilityInfo initWithProbability:flags:]([NLProbabilityInfo alloc], "initWithProbability:flags:", 0, v16);
      goto LABEL_27;
    }
    objc_msgSend(v9, "objectAtIndex:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
    v18 = (const __CFArray *)CoreLMCopyConditionalProbabilities();
    if (!v18)
      break;
    v19 = v18;
    if (CFArrayGetCount(v18) == 1)
    {
      ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(v19, 0);
      valuePtr = 0.0;
      Value = CFNumberGetValue(ValueAtIndex, kCFNumberDoubleType, &valuePtr);
      v22 = Value != 0;
      v23 = valuePtr;
      if (!Value)
        v23 = 1.0;
      v16 = v16 * v23;
    }
    else
    {
      v22 = 0;
    }
    CFRelease(v19);
    ++v15;
    if (v22 && v15 < v13)
    {
      v27 = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
      v22 = CoreLMUpdateWithContext();
    }

    if (!v22)
      goto LABEL_26;
  }

LABEL_26:
  v12 = 0;
LABEL_27:
  v6 = v25;
  CoreLMReset();
  if (v8)
    goto LABEL_28;
LABEL_29:

  if (!v12)
LABEL_30:
    v12 = -[NLProbabilityInfo initWithInvalidProbability]([NLProbabilityInfo alloc], "initWithInvalidProbability");

  return v12;
}

- (id)conditionalProbabilitiesForStrings:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  const void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if (self->_model && (v8 = CoreLMCopyTokenIdsForText()) != 0)
  {
    v9 = (const void *)v8;
    if (CoreLMUpdateWithContext())
    {
      +[NLNLPLanguageModelNode conditionalProbabilitiesForStrings:modelState:copyRequired:](NLNLPLanguageModelNode, "conditionalProbabilitiesForStrings:modelState:copyRequired:", v6, self->_model, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      CoreLMReset();
    }
    else
    {
      +[NLNLPLanguageModelNode conditionalProbabilitiesForStrings:modelState:copyRequired:](NLNLPLanguageModelNode, "conditionalProbabilitiesForStrings:modelState:copyRequired:", v6, 0, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    CFRelease(v9);
  }
  else
  {
    +[NLNLPLanguageModelNode conditionalProbabilitiesForStrings:modelState:copyRequired:](NLNLPLanguageModelNode, "conditionalProbabilitiesForStrings:modelState:copyRequired:", v6, 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)stateWithOptions:(id)a3
{
  id v4;
  uint64_t v5;
  NLNLPLanguageModelState *v6;

  v4 = a3;
  if (self->_model && (v5 = CoreLMCreateCopy()) != 0)
    v6 = -[NLNLPLanguageModelState initWithSession:options:context:modelState:]([NLNLPLanguageModelState alloc], "initWithSession:options:context:modelState:", self, v4, &stru_1E4A3BA10, v5);
  else
    v6 = 0;

  return v6;
}

- (id)predictionOptionsForMaximumPredictions:(unint64_t)a3 maximumTokensPerPrediction:(unint64_t)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  if (a3 <= 0xA)
    a3 = 10;
  v11[0] = *MEMORY[0x1E0D17378];
  v5 = *MEMORY[0x1E0D17388];
  v10[0] = *MEMORY[0x1E0D17380];
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  v10[2] = *MEMORY[0x1E0D17370];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)predictionInitialCharacterSet
{
  if (predictionInitialCharacterSet_onceToken != -1)
    dispatch_once(&predictionInitialCharacterSet_onceToken, &__block_literal_global_259);
  return (id)predictionInitialCharacterSet_initialSet;
}

void __58__NLNLPLanguageModelSession_predictionInitialCharacterSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "letterCharacterSet");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)predictionInitialCharacterSet_initialSet;
  predictionInitialCharacterSet_initialSet = v0;

}

- (void)enumeratePredictionsForContext:(id)a3 maximumPredictions:(unint64_t)a4 maximumTokensPerPrediction:(unint64_t)a5 withBlock:(id)a6
{
  id v9;
  void (**v10)(id, NLPredictionInfo *, _BYTE *);
  uint64_t v11;
  const void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  uint64_t v25;
  NLProbabilityInfo *v26;
  id v27;
  void *v28;
  NLPredictionInfo *v29;
  void *v30;
  const void *v31;
  id v32;
  id obj;
  char v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (void (**)(id, NLPredictionInfo *, _BYTE *))a6;
  if (self->_model)
  {
    v11 = CoreLMCopyTokenIdsForText();
    if (v11)
    {
      v12 = (const void *)v11;
      if (CoreLMUpdateWithContext())
      {
        v31 = v12;
        v32 = v9;
        -[NLNLPLanguageModelSession predictionOptionsForMaximumPredictions:maximumTokensPerPrediction:](self, "predictionOptionsForMaximumPredictions:maximumTokensPerPrediction:", a4, a5);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)CoreLMCopyPredictions();
        objc_msgSend(v13, "keysSortedByValueUsingComparator:", &__block_literal_global_261);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NLNLPLanguageModelSession predictionInitialCharacterSet](self, "predictionInitialCharacterSet");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        obj = v14;
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
        if (v16)
        {
          v17 = v16;
          v18 = 0;
          v19 = *(_QWORD *)v37;
LABEL_6:
          v20 = 0;
          while (1)
          {
            if (*(_QWORD *)v37 != v19)
              objc_enumerationMutation(obj);
            v21 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v20);
            objc_msgSend(v13, "objectForKey:", v21, v30);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "doubleValue");
            v24 = v23;

            v35 = 0;
            objc_msgSend(v21, "rangeOfCharacterFromSet:options:", v15, 8);
            if (v25)
            {
              v26 = -[NLProbabilityInfo initWithProbability:flags:]([NLProbabilityInfo alloc], "initWithProbability:flags:", 0, v24);
              if ((unint64_t)objc_msgSend(v21, "length") >= 2
                && (objc_msgSend(v21, "hasSuffix:", CFSTR(" ")) & 1) != 0)
              {
                objc_msgSend(v21, "substringToIndex:", objc_msgSend(v21, "length") - 1);
                v27 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v27 = v21;
              }
              v28 = v27;
              v29 = -[NLPredictionInfo initWithPrediction:probabilityInfo:]([NLPredictionInfo alloc], "initWithPrediction:probabilityInfo:", v27, v26);
              v10[2](v10, v29, &v35);
              ++v18;

            }
            if (v35 || v18 >= a4)
              break;
            if (v17 == ++v20)
            {
              v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
              if (v17)
                goto LABEL_6;
              break;
            }
          }
        }

        CoreLMReset();
        v9 = v32;
        v12 = v31;
      }
      CFRelease(v12);
    }
  }

}

uint64_t __116__NLNLPLanguageModelSession_enumeratePredictionsForContext_maximumPredictions_maximumTokensPerPrediction_withBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(a2, "doubleValue");
  v6 = v5;
  objc_msgSend(v4, "doubleValue");
  v8 = v7;

  if (v6 > v8)
    return -1;
  else
    return v6 < v8;
}

@end
