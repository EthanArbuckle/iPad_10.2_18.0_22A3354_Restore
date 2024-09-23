@implementation NLNLPLanguageModelState

- (NLNLPLanguageModelState)initWithSession:(id)a3 options:(id)a4 context:(id)a5 modelState:(void *)a6
{
  NLNLPLanguageModelState *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NLNLPLanguageModelState;
  result = -[NLLanguageModelState initWithSession:options:context:](&v8, sel_initWithSession_options_context_, a3, a4, a5);
  if (result)
    result->_modelState = (CoreLanguageModelWithState *)a6;
  return result;
}

- (void)dealloc
{
  CoreLanguageModelWithState *modelState;
  objc_super v4;

  modelState = self->_modelState;
  if (modelState)
    CFRelease(modelState);
  v4.receiver = self;
  v4.super_class = (Class)NLNLPLanguageModelState;
  -[NLNLPLanguageModelState dealloc](&v4, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v7.receiver = self;
  v7.super_class = (Class)NLNLPLanguageModelState;
  -[NLLanguageModelState description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_modelState)
    objc_msgSend(v5, "appendFormat:", CFSTR("(NLP:%p)"), self->_modelState);
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  NLNLPLanguageModelState *v6;
  void *v7;
  void *v8;
  void *v9;
  NLNLPLanguageModelState *v10;

  if (!self->_modelState)
    return 0;
  v4 = CoreLMCreateCopy();
  if (!v4)
    return 0;
  v5 = v4;
  v6 = [NLNLPLanguageModelState alloc];
  -[NLLanguageModelState session](self, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLLanguageModelState options](self, "options");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLLanguageModelState context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[NLNLPLanguageModelState initWithSession:options:context:modelState:](v6, "initWithSession:options:context:modelState:", v7, v8, v9, v5);

  return v10;
}

- (void)addContext:(id)a3
{
  id v4;
  uint64_t v5;
  const void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NLNLPLanguageModelState;
  -[NLLanguageModelState addContext:](&v7, sel_addContext_, v4);
  if (self->_modelState)
  {
    v5 = CoreLMCopyTokenIdsForText();
    if (v5)
    {
      v6 = (const void *)v5;
      CoreLMUpdateWithContext();
      CFRelease(v6);
    }
  }

}

- (void)resetContext
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NLNLPLanguageModelState;
  -[NLLanguageModelState resetContext](&v3, sel_resetContext);
  if (self->_modelState)
    CoreLMReset();
}

- (id)conditionalProbabilityForToken:(id)a3
{
  id v4;
  const __CFArray *v5;
  const __CFArray *v6;
  const __CFArray *v7;
  const __CFArray *v8;
  const __CFNumber *ValueAtIndex;
  NLProbabilityInfo *v10;
  NLProbabilityInfo *v11;
  double valuePtr;

  v4 = a3;
  if (!self->_modelState)
    goto LABEL_9;
  v5 = (const __CFArray *)CoreLMCopyTokenIdsForText();
  if (!v5)
    goto LABEL_9;
  v6 = v5;
  if (CFArrayGetCount(v5) != 1 || (v7 = (const __CFArray *)CoreLMCopyConditionalProbabilities()) == 0)
  {
    CFRelease(v6);
LABEL_9:
    v11 = -[NLProbabilityInfo initWithInvalidProbability]([NLProbabilityInfo alloc], "initWithInvalidProbability");
    goto LABEL_10;
  }
  v8 = v7;
  if (CFArrayGetCount(v7) == 1
    && (ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(v8, 0),
        valuePtr = 0.0,
        CFNumberGetValue(ValueAtIndex, kCFNumberDoubleType, &valuePtr)))
  {
    v10 = [NLProbabilityInfo alloc];
    v11 = -[NLProbabilityInfo initWithProbability:flags:](v10, "initWithProbability:flags:", 0, valuePtr);
  }
  else
  {
    v11 = 0;
  }
  CFRelease(v8);
  CFRelease(v6);
  if (!v11)
    goto LABEL_9;
LABEL_10:

  return v11;
}

- (id)conditionalProbabilityForString:(id)a3
{
  id v4;
  const void *modelState;
  void *v6;
  unint64_t v7;
  _BOOL4 v8;
  uint64_t v10;
  double v11;
  void *v12;
  const __CFArray *v13;
  const __CFArray *v14;
  const __CFNumber *ValueAtIndex;
  int Value;
  int v17;
  double v18;
  NLProbabilityInfo *v19;
  double v21;
  void *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  modelState = self->_modelState;
  if (!modelState)
    goto LABEL_28;
  v6 = (void *)CoreLMCopyTokenIdsForText();
  v7 = objc_msgSend(v6, "count");
  if (v7 < 2)
  {
    v8 = 0;
  }
  else
  {
    modelState = (const void *)CoreLMCreateCopy();
    v8 = modelState != 0;
  }
  if (!v6 || modelState == 0)
  {
LABEL_25:
    v19 = 0;
    if (v8)
LABEL_26:
      CFRelease(modelState);
  }
  else
  {
    v10 = 0;
    v11 = 1.0;
    while (v7 != v10)
    {
      objc_msgSend(v6, "objectAtIndex:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
      v13 = (const __CFArray *)CoreLMCopyConditionalProbabilities();
      if (!v13)
      {

        goto LABEL_25;
      }
      v14 = v13;
      if (CFArrayGetCount(v13) == 1)
      {
        ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(v14, 0);
        v21 = 0.0;
        Value = CFNumberGetValue(ValueAtIndex, kCFNumberDoubleType, &v21);
        v17 = Value != 0;
        v18 = v21;
        if (!Value)
          v18 = 1.0;
        v11 = v11 * v18;
      }
      else
      {
        v17 = 0;
      }
      CFRelease(v14);
      if (++v10 < v7 && v17)
      {
        v22 = v12;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
        v17 = CoreLMUpdateWithContext();
      }

      if (!v17)
        goto LABEL_25;
    }
    v19 = -[NLProbabilityInfo initWithProbability:flags:]([NLProbabilityInfo alloc], "initWithProbability:flags:", 0, v11);
    if (v8)
      goto LABEL_26;
  }

  if (!v19)
LABEL_28:
    v19 = -[NLProbabilityInfo initWithInvalidProbability]([NLProbabilityInfo alloc], "initWithInvalidProbability");

  return v19;
}

- (id)conditionalProbabilitiesForStrings:(id)a3
{
  return +[NLNLPLanguageModelNode conditionalProbabilitiesForStrings:modelState:copyRequired:](NLNLPLanguageModelNode, "conditionalProbabilitiesForStrings:modelState:copyRequired:", a3, self->_modelState, 1);
}

- (void)enumeratePredictions:(unint64_t)a3 maximumTokensPerPrediction:(unint64_t)a4 withBlock:(id)a5
{
  void (**v8)(id, NLPredictionInfo *, _BYTE *);
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
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
  id obj;
  unint64_t v32;
  char v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(id, NLPredictionInfo *, _BYTE *))a5;
  if (self->_modelState)
  {
    -[NLLanguageModelState session](self, "session");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "predictionOptionsForMaximumPredictions:maximumTokensPerPrediction:", a3, a4);
    v10 = objc_claimAutoreleasedReturnValue();

    v30 = (void *)v10;
    v11 = (void *)CoreLMCopyPredictions();
    objc_msgSend(v11, "keysSortedByValueUsingComparator:", &__block_literal_global_318);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NLLanguageModelState session](self, "session");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "predictionInitialCharacterSet");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    obj = v12;
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v15)
    {
      v16 = v15;
      v17 = a3;
      v18 = 0;
      v19 = *(_QWORD *)v35;
      v32 = v17;
LABEL_4:
      v20 = 0;
      while (1)
      {
        if (*(_QWORD *)v35 != v19)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v20);
        objc_msgSend(v11, "objectForKey:", v21, v30);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "doubleValue");
        v24 = v23;

        v33 = 0;
        objc_msgSend(v21, "rangeOfCharacterFromSet:options:", v14, 8);
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
          v8[2](v8, v29, &v33);
          ++v18;

          v17 = v32;
        }
        if (v33 || v18 >= v17)
          break;
        if (v16 == ++v20)
        {
          v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
          if (v16)
            goto LABEL_4;
          break;
        }
      }
    }

  }
}

uint64_t __85__NLNLPLanguageModelState_enumeratePredictions_maximumTokensPerPrediction_withBlock___block_invoke(uint64_t a1, void *a2, void *a3)
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
