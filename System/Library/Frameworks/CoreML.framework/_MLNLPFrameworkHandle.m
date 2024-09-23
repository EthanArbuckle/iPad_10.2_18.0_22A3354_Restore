@implementation _MLNLPFrameworkHandle

- (_MLNLPFrameworkHandle)init
{
  _MLNLPFrameworkHandle *v2;
  void *v3;
  void *v4;
  BOOL v5;
  BOOL v6;
  void *NLPGazetteerModelCopyLabelForStringImpl;
  void *NLPEmbeddingModelCopyVectorForStringImpl;
  char v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_MLNLPFrameworkHandle;
  v2 = -[_MLNLPFrameworkHandle init](&v11, sel_init);
  if (v2)
  {
    v3 = dlopen("/System/Library/Frameworks/NaturalLanguage.framework/NaturalLanguage", 4);
    if (v3)
    {
      v4 = v3;
      v2->_NLPSequenceModelCopyPredictedTokensAndLabelsForTextImpl = dlsym(v3, "NLPSequenceModelCopyPredictedTokensAndLabelsForText");
      v2->_NLPSequenceModelCreateWithDataImpl = dlsym(v4, "NLPSequenceModelCreateWithData");
      v2->_NLPSequenceModelGetRevisionImpl = dlsym(v4, "NLPSequenceModelGetRevision");
      v2->_NLPSequenceModelIsRevisionSupportedImpl = dlsym(v4, "NLPSequenceModelIsRevisionSupported");
      v2->_NLPSequenceModelGetCurrentRevisionImpl = dlsym(v4, "NLPSequenceModelGetCurrentRevision");
      v2->_NLPClassifierModelCopyPredictedLabelForTextImpl = dlsym(v4, "NLPClassifierModelCopyPredictedLabelForText");
      v2->_NLPClassifierModelCreateWithDataImpl = dlsym(v4, "NLPClassifierModelCreateWithData");
      v2->_NLPClassifierModelGetRevisionImpl = dlsym(v4, "NLPClassifierModelGetRevision");
      v2->_NLPClassifierModelIsRevisionSupportedImpl = dlsym(v4, "NLPClassifierModelIsRevisionSupported");
      v2->_NLPClassifierModelGetCurrentRevisionImpl = dlsym(v4, "NLPClassifierModelGetCurrentRevision");
      v2->_NLPGazetteerModelCopyLabelForStringImpl = dlsym(v4, "NLPGazetteerModelCopyLabelForString");
      v2->_NLPGazetteerModelCreateWithDataImpl = dlsym(v4, "NLPGazetteerModelCreateWithData");
      v2->_NLPGazetteerModelGetRevisionImpl = dlsym(v4, "NLPGazetteerModelGetRevision");
      v2->_NLPGazetteerModelIsRevisionSupportedImpl = dlsym(v4, "NLPGazetteerModelIsRevisionSupported");
      v2->_NLPGazetteerModelGetCurrentRevisionImpl = dlsym(v4, "NLPGazetteerModelGetCurrentRevision");
      v2->_NLPEmbeddingModelCopyVectorForStringImpl = dlsym(v4, "NLPEmbeddingModelCopyVectorForString");
      v2->_NLPEmbeddingModelCreateWithDataImpl = dlsym(v4, "NLPEmbeddingModelCreateWithData");
      v2->_NLPEmbeddingModelGetRevisionImpl = dlsym(v4, "NLPEmbeddingModelGetRevision");
      v2->_NLPEmbeddingModelIsRevisionSupportedImpl = dlsym(v4, "NLPEmbeddingModelIsRevisionSupported");
      v2->_NLPEmbeddingModelGetCurrentRevisionImpl = dlsym(v4, "NLPEmbeddingModelGetCurrentRevision");
    }
    v5 = !v2->_NLPSequenceModelCopyPredictedTokensAndLabelsForTextImpl
      || !v2->_NLPSequenceModelCreateWithDataImpl
      || !v2->_NLPSequenceModelGetRevisionImpl
      || !v2->_NLPSequenceModelIsRevisionSupportedImpl
      || v2->_NLPSequenceModelGetCurrentRevisionImpl == 0;
    v6 = !v2->_NLPClassifierModelCopyPredictedLabelForTextImpl
      || !v2->_NLPClassifierModelCreateWithDataImpl
      || !v2->_NLPClassifierModelGetRevisionImpl
      || !v2->_NLPClassifierModelIsRevisionSupportedImpl
      || v2->_NLPClassifierModelGetCurrentRevisionImpl == 0;
    NLPGazetteerModelCopyLabelForStringImpl = v2->_NLPGazetteerModelCopyLabelForStringImpl;
    if (NLPGazetteerModelCopyLabelForStringImpl)
    {
      NLPGazetteerModelCopyLabelForStringImpl = v2->_NLPGazetteerModelCreateWithDataImpl;
      if (NLPGazetteerModelCopyLabelForStringImpl)
      {
        NLPGazetteerModelCopyLabelForStringImpl = v2->_NLPGazetteerModelGetRevisionImpl;
        if (NLPGazetteerModelCopyLabelForStringImpl)
        {
          NLPGazetteerModelCopyLabelForStringImpl = v2->_NLPGazetteerModelIsRevisionSupportedImpl;
          if (NLPGazetteerModelCopyLabelForStringImpl)
            LOBYTE(NLPGazetteerModelCopyLabelForStringImpl) = v2->_NLPGazetteerModelGetCurrentRevisionImpl != 0;
        }
      }
    }
    NLPEmbeddingModelCopyVectorForStringImpl = v2->_NLPEmbeddingModelCopyVectorForStringImpl;
    if (NLPEmbeddingModelCopyVectorForStringImpl)
    {
      NLPEmbeddingModelCopyVectorForStringImpl = v2->_NLPEmbeddingModelCreateWithDataImpl;
      if (NLPEmbeddingModelCopyVectorForStringImpl)
      {
        NLPEmbeddingModelCopyVectorForStringImpl = v2->_NLPEmbeddingModelGetRevisionImpl;
        if (NLPEmbeddingModelCopyVectorForStringImpl)
        {
          NLPEmbeddingModelCopyVectorForStringImpl = v2->_NLPEmbeddingModelIsRevisionSupportedImpl;
          if (NLPEmbeddingModelCopyVectorForStringImpl)
            LOBYTE(NLPEmbeddingModelCopyVectorForStringImpl) = v2->_NLPEmbeddingModelGetCurrentRevisionImpl != 0;
        }
      }
    }
    if (v5 || v6)
      v9 = 0;
    else
      v9 = NLPGazetteerModelCopyLabelForStringImpl & NLPEmbeddingModelCopyVectorForStringImpl;
    v2->_valid = v9;
  }
  return v2;
}

- (void)initializeWordTaggingModelWithData:(id)a3 error:(id *)a4
{
  void *result;
  id v6;
  id v7;

  v7 = 0;
  result = (void *)((uint64_t (*)(id, id *))self->_NLPSequenceModelCreateWithDataImpl)(a3, &v7);
  if (v7)
  {
    if (a4)
    {
      v6 = objc_retainAutorelease(v7);
      result = 0;
      *a4 = v6;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)initializeSentenceClassifierModelWithData:(id)a3 error:(id *)a4
{
  void *result;
  id v6;
  id v7;

  v7 = 0;
  result = (void *)((uint64_t (*)(id, id *))self->_NLPClassifierModelCreateWithDataImpl)(a3, &v7);
  if (v7)
  {
    if (a4)
    {
      v6 = objc_retainAutorelease(v7);
      result = 0;
      *a4 = v6;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)initializeGazetteerModelWithData:(id)a3 error:(id *)a4
{
  void *result;
  id v6;
  id v7;

  v7 = 0;
  result = (void *)((uint64_t (*)(id, id *))self->_NLPGazetteerModelCreateWithDataImpl)(a3, &v7);
  if (v7)
  {
    if (a4)
    {
      v6 = objc_retainAutorelease(v7);
      result = 0;
      *a4 = v6;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)initializeEmbeddingModelWithData:(id)a3 error:(id *)a4
{
  void *result;
  id v6;
  id v7;

  v7 = 0;
  result = (void *)((uint64_t (*)(id, id *))self->_NLPEmbeddingModelCreateWithDataImpl)(a3, &v7);
  if (v7)
  {
    if (a4)
    {
      v6 = objc_retainAutorelease(v7);
      result = 0;
      *a4 = v6;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)predictTokensLabelsLocationsLengthsForString:(void *)a3 inputString:(id)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = ((uint64_t (*)(void *))self->_NLPSequenceModelGetRevisionImpl)(a3);
  if (((unsigned int (*)(void))self->_NLPSequenceModelIsRevisionSupportedImpl)())
  {
    v10 = (void *)((uint64_t (*)(void *, id))self->_NLPSequenceModelCopyPredictedTokensAndLabelsForTextImpl)(a3, v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Model revision %ld not supported by NaturalLanguage framwork on this OS version (support revision %ld)."), v9, ((uint64_t (*)(void))self->_NLPSequenceModelGetCurrentRevisionImpl)());
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (a5)
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0CB2D50];
      v17[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple"), 0, v14);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    v10 = 0;
  }

  return v10;
}

- (id)predictLabelsForSentenceString:(void *)a3 inputString:(id)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = ((uint64_t (*)(void *))self->_NLPClassifierModelGetRevisionImpl)(a3);
  if (((unsigned int (*)(void))self->_NLPClassifierModelIsRevisionSupportedImpl)())
  {
    v10 = (void *)((uint64_t (*)(void *, id))self->_NLPClassifierModelCopyPredictedLabelForTextImpl)(a3, v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Model revision %ld not supported by NaturalLanguage framwork on this OS version (support revision %ld)."), v9, ((uint64_t (*)(void))self->_NLPClassifierModelGetCurrentRevisionImpl)());
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (a5)
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0CB2D50];
      v17[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple"), 0, v14);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    v10 = 0;
  }

  return v10;
}

- (id)predictLabelForWordString:(void *)a3 inputString:(id)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = ((uint64_t (*)(void *))self->_NLPGazetteerModelGetRevisionImpl)(a3);
  if (((unsigned int (*)(void))self->_NLPGazetteerModelIsRevisionSupportedImpl)())
  {
    v10 = (void *)((uint64_t (*)(void *, id))self->_NLPGazetteerModelCopyLabelForStringImpl)(a3, v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Model revision %ld not supported by NaturalLanguage framwork on this OS version (support revision %ld)."), v9, ((uint64_t (*)(void))self->_NLPGazetteerModelGetCurrentRevisionImpl)());
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (a5)
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0CB2D50];
      v17[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple"), 0, v14);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    v10 = 0;
  }

  return v10;
}

- (id)predictVectorForString:(void *)a3 inputString:(id)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = ((uint64_t (*)(void *))self->_NLPEmbeddingModelGetRevisionImpl)(a3);
  if (((unsigned int (*)(void))self->_NLPEmbeddingModelIsRevisionSupportedImpl)())
  {
    v10 = (void *)((uint64_t (*)(void *, id))self->_NLPEmbeddingModelCopyVectorForStringImpl)(a3, v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Model revision %ld not supported by NaturalLanguage framwork on this OS version (support revision %ld)."), v9, ((uint64_t (*)(void))self->_NLPEmbeddingModelGetCurrentRevisionImpl)());
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (a5)
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0CB2D50];
      v17[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple"), 0, v14);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    v10 = 0;
  }

  return v10;
}

- (BOOL)isValid
{
  return self->_valid;
}

- (void)NLPSequenceModelCopyPredictedTokensAndLabelsForTextImpl
{
  return self->_NLPSequenceModelCopyPredictedTokensAndLabelsForTextImpl;
}

- (void)NLPSequenceModelCreateWithDataImpl
{
  return self->_NLPSequenceModelCreateWithDataImpl;
}

- (void)NLPSequenceModelGetRevisionImpl
{
  return self->_NLPSequenceModelGetRevisionImpl;
}

- (void)NLPSequenceModelIsRevisionSupportedImpl
{
  return self->_NLPSequenceModelIsRevisionSupportedImpl;
}

- (void)NLPSequenceModelGetCurrentRevisionImpl
{
  return self->_NLPSequenceModelGetCurrentRevisionImpl;
}

- (void)NLPClassifierModelCopyPredictedLabelForTextImpl
{
  return self->_NLPClassifierModelCopyPredictedLabelForTextImpl;
}

- (void)NLPClassifierModelCreateWithDataImpl
{
  return self->_NLPClassifierModelCreateWithDataImpl;
}

- (void)NLPClassifierModelGetRevisionImpl
{
  return self->_NLPClassifierModelGetRevisionImpl;
}

- (void)NLPClassifierModelIsRevisionSupportedImpl
{
  return self->_NLPClassifierModelIsRevisionSupportedImpl;
}

- (void)NLPClassifierModelGetCurrentRevisionImpl
{
  return self->_NLPClassifierModelGetCurrentRevisionImpl;
}

- (void)NLPGazetteerModelCopyLabelForStringImpl
{
  return self->_NLPGazetteerModelCopyLabelForStringImpl;
}

- (void)NLPGazetteerModelCreateWithDataImpl
{
  return self->_NLPGazetteerModelCreateWithDataImpl;
}

- (void)NLPGazetteerModelGetRevisionImpl
{
  return self->_NLPGazetteerModelGetRevisionImpl;
}

- (void)NLPGazetteerModelIsRevisionSupportedImpl
{
  return self->_NLPGazetteerModelIsRevisionSupportedImpl;
}

- (void)NLPGazetteerModelGetCurrentRevisionImpl
{
  return self->_NLPGazetteerModelGetCurrentRevisionImpl;
}

- (void)NLPEmbeddingModelCopyVectorForStringImpl
{
  return self->_NLPEmbeddingModelCopyVectorForStringImpl;
}

- (void)NLPEmbeddingModelCreateWithDataImpl
{
  return self->_NLPEmbeddingModelCreateWithDataImpl;
}

- (void)NLPEmbeddingModelGetRevisionImpl
{
  return self->_NLPEmbeddingModelGetRevisionImpl;
}

- (void)NLPEmbeddingModelIsRevisionSupportedImpl
{
  return self->_NLPEmbeddingModelIsRevisionSupportedImpl;
}

- (void)NLPEmbeddingModelGetCurrentRevisionImpl
{
  return self->_NLPEmbeddingModelGetCurrentRevisionImpl;
}

+ (id)sharedHandle
{
  if (sharedHandle_onceToken_21102 != -1)
    dispatch_once(&sharedHandle_onceToken_21102, &__block_literal_global_21103);
  return (id)sharedHandle_singleton_21104;
}

@end
