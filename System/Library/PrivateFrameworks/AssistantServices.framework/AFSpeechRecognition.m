@implementation AFSpeechRecognition

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSArray *v5;
  NSArray *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ((v5 = (NSArray *)v4[1], v5 == self->_phrases) || -[NSArray isEqualToArray:](v5, "isEqualToArray:")))
  {
    v6 = (NSArray *)v4[2];
    if (v6 == self->_utterances)
      v7 = 1;
    else
      v7 = -[NSArray isEqualToArray:](v6, "isEqualToArray:");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  v3 = -[NSArray hash](self->_phrases, "hash");
  -[NSArray firstObject](self->_phrases, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = v5 ^ v3 ^ -[NSArray hash](self->_utterances, "hash");
  -[NSArray firstObject](self->_utterances, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *phrases;
  id v5;

  phrases = self->_phrases;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", phrases, CFSTR("_phrases"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_utterances, CFSTR("_utterances"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_processedAudioDuration"), self->_processedAudioDuration);

}

- (AFSpeechRecognition)initWithCoder:(id)a3
{
  id v4;
  AFSpeechRecognition *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *phrases;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSArray *utterances;
  double v16;
  objc_super v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AFSpeechRecognition;
  v5 = -[AFSpeechRecognition init](&v18, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v20[0] = objc_opt_class();
    v20[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("_phrases"));
    v9 = objc_claimAutoreleasedReturnValue();
    phrases = v5->_phrases;
    v5->_phrases = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("_utterances"));
    v14 = objc_claimAutoreleasedReturnValue();
    utterances = v5->_utterances;
    v5->_utterances = (NSArray *)v14;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_processedAudioDuration"));
    v5->_processedAudioDuration = v16;
  }

  return v5;
}

- (id)oneBestTranscript
{
  void *v2;
  void *v3;

  -[AFSpeechRecognition oneBestTokenList](self, "oneBestTokenList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[AFSpeechRecognition transcriptFromTokens:](AFSpeechRecognition, "transcriptFromTokens:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)nBestTranscripts
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t i;
  void *v7;
  void *v8;

  -[AFSpeechRecognition nBestTokenListsFromSausage](self, "nBestTokenListsFromSausage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");
  if (v3)
  {
    v4 = v3;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v3);
    for (i = 0; i != v4; ++i)
    {
      objc_msgSend(v2, "objectAtIndex:", i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[AFSpeechRecognition transcriptFromTokens:](AFSpeechRecognition, "transcriptFromTokens:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v8);

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)oneBestTokenList
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[AFSpeechRecognition utterances](self, "utterances");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[AFSpeechRecognition phrases](self, "phrases");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[AFSpeechRecognition tokenListFromUtterance:phrases:](AFSpeechRecognition, "tokenListFromUtterance:phrases:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (double)averageOneBestConfidenceScore
{
  void *v2;
  uint64_t v3;
  unint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  double v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[AFSpeechRecognition oneBestTokenList](self, "oneBestTokenList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");
  if (v3)
  {
    v4 = v3;
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = v2;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      v9 = 0.0;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v9 = v9 + (double)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "confidenceScore", (_QWORD)v13);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }
    else
    {
      v9 = 0.0;
    }

    v11 = v9 / (double)v4;
  }
  else
  {
    v11 = 0.0;
  }

  return v11;
}

- (id)nBestTokenListsFromSausage
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[AFSpeechRecognition utterances](self, "utterances");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v4);
    for (i = 0; i != v4; ++i)
    {
      -[AFSpeechRecognition utterances](self, "utterances");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndex:", i);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[AFSpeechRecognition phrases](self, "phrases");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[AFSpeechRecognition tokenListFromUtterance:phrases:](AFSpeechRecognition, "tokenListFromUtterance:phrases:", v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
        objc_msgSend(v5, "addObject:", v10);

    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)nBestTokenListsLossless
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  __int128 v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[AFSpeechRecognition utterances](self, "utterances");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return 0;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v4);
  v6 = 0;
  *(_QWORD *)&v7 = 136315138;
  v17 = v7;
  do
  {
    -[AFSpeechRecognition utterances](self, "utterances", v17);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "interpretation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "tokens");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v9, "interpretation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "tokens");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v13);

    }
    else
    {
      v14 = AFSiriLogContextSpeech;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v17;
        v19 = "-[AFSpeechRecognition nBestTokenListsLossless]";
        _os_log_error_impl(&dword_19AF50000, v14, OS_LOG_TYPE_ERROR, "%s Nil tokens for utterance!", buf, 0xCu);
      }
    }

    ++v6;
  }
  while (v4 != v6);
  if (objc_msgSend(v5, "count"))
    v15 = v5;
  else
    v15 = 0;

  return v15;
}

- (AFSpeechRecognition)initWithPhrases:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  AFSpeechRecognition *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "fakeOneBestFromPhrases:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AFSpeechRecognition initWithPhrases:utterances:](self, "initWithPhrases:utterances:", v4, v6);

  return v7;
}

- (AFSpeechRecognition)initWithPhrases:(id)a3 utterances:(id)a4
{
  return -[AFSpeechRecognition initWithPhrases:utterances:processedAudioDuration:](self, "initWithPhrases:utterances:processedAudioDuration:", a3, a4, 0.0);
}

- (AFSpeechRecognition)initWithPhrases:(id)a3 utterances:(id)a4 processedAudioDuration:(double)a5
{
  id v8;
  id v9;
  AFSpeechRecognition *v10;
  uint64_t v11;
  NSArray *phrases;
  uint64_t v13;
  NSArray *utterances;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AFSpeechRecognition;
  v10 = -[AFSpeechRecognition init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    phrases = v10->_phrases;
    v10->_phrases = (NSArray *)v11;

    v13 = objc_msgSend(v9, "copy");
    utterances = v10->_utterances;
    v10->_utterances = (NSArray *)v13;

    v10->_processedAudioDuration = a5;
  }

  return v10;
}

- (id)aceRecognition
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  uint64_t v20;
  void *v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0D883D0]);
  -[NSArray _sa_mappedArrayWithBlock:](self->_phrases, "_sa_mappedArrayWithBlock:", &__block_literal_global_9331);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPhrases:", v4);

  -[NSArray _sa_mappedArrayWithBlock:](self->_utterances, "_sa_mappedArrayWithBlock:", &__block_literal_global_23_9332);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUtterances:", v5);

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v22 = v3;
  objc_msgSend(v3, "phrases");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    v9 = 1000;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        objc_msgSend(v11, "interpretations");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "firstObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "tokens");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v25;
          do
          {
            for (j = 0; j != v16; ++j)
            {
              if (*(_QWORD *)v25 != v17)
                objc_enumerationMutation(v14);
              objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "confidenceScore");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v19, "integerValue");

              if (v20 < v9)
                v9 = v20;
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          }
          while (v16);
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v7);
  }
  else
  {
    v9 = 1000;
  }

  objc_msgSend(v22, "setSentenceConfidence:", v9);
  return v22;
}

- (AFSpeechRecognition)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  id v8;
  uint64_t v9;
  AFSpeechRecognition *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  id v14;
  NSString *v15;
  NSString *v16;
  _QWORD v18[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  _QWORD v25[6];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("phrases"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  if (v8 && (NSClassFromString((NSString *)v7), (objc_opt_isKindOfClass() & 1) != 0))
  {

    v32 = 0;
    v33 = &v32;
    v34 = 0x2020000000;
    v35 = 0;
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__9326;
    v30 = __Block_byref_object_dispose__9327;
    v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v9 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __42__AFSpeechRecognition_initWithDictionary___block_invoke;
    v25[3] = &unk_1E3A2F110;
    v25[4] = &v32;
    v25[5] = &v26;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v25);
    if (*((_BYTE *)v33 + 24) || !objc_msgSend((id)v27[5], "count"))
    {
      v10 = 0;
    }
    else
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("utterances"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v11;
      v15 = v13;
      v16 = v15;
      if (v14 && (NSClassFromString(v15), (objc_opt_isKindOfClass() & 1) != 0))
      {

        *((_BYTE *)v33 + 24) = 0;
        v19 = 0;
        v20 = &v19;
        v21 = 0x3032000000;
        v22 = __Block_byref_object_copy__9326;
        v23 = __Block_byref_object_dispose__9327;
        v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v18[0] = v9;
        v18[1] = 3221225472;
        v18[2] = __42__AFSpeechRecognition_initWithDictionary___block_invoke_2;
        v18[3] = &unk_1E3A2F110;
        v18[4] = &v32;
        v18[5] = &v19;
        objc_msgSend(v14, "enumerateObjectsUsingBlock:", v18);
        if (*((_BYTE *)v33 + 24) || !objc_msgSend((id)v20[5], "count"))
        {
          v10 = 0;
        }
        else
        {
          self = -[AFSpeechRecognition initWithPhrases:utterances:](self, "initWithPhrases:utterances:", v27[5], v20[5]);
          v10 = self;
        }
        _Block_object_dispose(&v19, 8);

      }
      else
      {

        v10 = 0;
      }

    }
    _Block_object_dispose(&v26, 8);

    _Block_object_dispose(&v32, 8);
  }
  else
  {

    v10 = 0;
  }

  return v10;
}

- (id)dictionaryRepresentation
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[2];
  _QWORD v28[2];
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v4 = self->_phrases;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v24;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v8), "dictionaryRepresentation");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
    }
    while (v6);
  }

  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = self->_utterances;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v15), "dictionaryRepresentation", (_QWORD)v19);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
    }
    while (v13);
  }

  v27[0] = CFSTR("phrases");
  v27[1] = CFSTR("utterances");
  v28[0] = v3;
  v28[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (NSArray)phrases
{
  return self->_phrases;
}

- (NSArray)utterances
{
  return self->_utterances;
}

- (double)processedAudioDuration
{
  return self->_processedAudioDuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utterances, 0);
  objc_storeStrong((id *)&self->_phrases, 0);
}

void __42__AFSpeechRecognition_initWithDictionary___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  objc_class *v7;
  void *v8;
  id v9;
  char isKindOfClass;
  AFSpeechPhrase *v11;
  id v12;

  v6 = a2;
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  v12 = v9;
  if (v9
    && (NSClassFromString((NSString *)v8), isKindOfClass = objc_opt_isKindOfClass(), v9 = v12, (isKindOfClass & 1) != 0))
  {

  }
  else
  {

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  v11 = -[AFSpeechPhrase initWithDictionary:]([AFSpeechPhrase alloc], "initWithDictionary:", v12);
  if (!v11)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v11);

}

void __42__AFSpeechRecognition_initWithDictionary___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  objc_class *v7;
  void *v8;
  id v9;
  char isKindOfClass;
  AFSpeechUtterance *v11;
  id v12;

  v6 = a2;
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  v12 = v9;
  if (v9
    && (NSClassFromString((NSString *)v8), isKindOfClass = objc_opt_isKindOfClass(), v9 = v12, (isKindOfClass & 1) != 0))
  {

  }
  else
  {

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  v11 = -[AFSpeechUtterance initWithDictionary:]([AFSpeechUtterance alloc], "initWithDictionary:", v12);
  if (!v12)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v11);

}

id __37__AFSpeechRecognition_aceRecognition__block_invoke_4(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;

  v2 = (objc_class *)MEMORY[0x1E0D88410];
  v3 = a2;
  v4 = objc_alloc_init(v2);
  objc_msgSend(v3, "interpretationIndices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setInterpretationIndices:", v5);
  return v4;
}

id __37__AFSpeechRecognition_aceRecognition__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;

  v2 = (objc_class *)MEMORY[0x1E0D883C0];
  v3 = a2;
  v4 = objc_alloc_init(v2);
  objc_msgSend(v3, "interpretations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_sa_mappedArrayWithBlock:", &__block_literal_global_18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInterpretations:", v6);

  return v4;
}

id __37__AFSpeechRecognition_aceRecognition__block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;

  v2 = (objc_class *)MEMORY[0x1E0D883B8];
  v3 = a2;
  v4 = objc_alloc_init(v2);
  objc_msgSend(v3, "tokens");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_sa_mappedArrayWithBlock:", &__block_literal_global_21_9339);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTokens:", v6);

  return v4;
}

uint64_t __37__AFSpeechRecognition_aceRecognition__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "aceToken");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)transcriptFromTokens:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      v9 = 1;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (((v9 | objc_msgSend(v11, "removeSpaceBefore", (_QWORD)v14)) & 1) == 0)
            objc_msgSend(v4, "appendString:", CFSTR(" "));
          objc_msgSend(v11, "text");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
            objc_msgSend(v4, "appendString:", v12);
          v9 = objc_msgSend(v11, "removeSpaceAfter");

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)tokenListFromUtterance:(id)a3 phrases:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v5 = a4;
  objc_msgSend(a3, "interpretationIndices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  if (v7 && (v8 = v7, objc_msgSend(v5, "count")))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v8);
    for (i = 0; i != v8; ++i)
    {
      objc_msgSend(v5, "objectAtIndex:", i);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "interpretations");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v12, "count"))
      {
        objc_msgSend(v6, "objectAtIndex:", i);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "unsignedIntegerValue");

        objc_msgSend(v12, "objectAtIndex:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "tokens");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObjectsFromArray:", v16);

      }
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)fakeOneBestFromPhrases:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  AFSpeechUtterance *v13;

  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v4);
  if (v4)
  {
    v6 = 0;
    v7 = 0;
    for (i = 0; i != v4; ++i)
    {
      objc_msgSend(v5, "addObject:", &unk_1E3AA5E78);
      objc_msgSend(v3, "objectAtIndex:", i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "interpretations");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10 && objc_msgSend(v10, "count"))
      {
        objc_msgSend(v11, "firstObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v6 += objc_msgSend(v12, "averageConfidenceScore");

        ++v7;
      }

    }
    if (v7)
      v4 = v6 / v7;
    else
      v4 = 0;
  }
  v13 = -[AFSpeechUtterance initWithInterpretationIndices:confidenceScore:]([AFSpeechUtterance alloc], "initWithInterpretationIndices:confidenceScore:", v5, v4);

  return v13;
}

@end
