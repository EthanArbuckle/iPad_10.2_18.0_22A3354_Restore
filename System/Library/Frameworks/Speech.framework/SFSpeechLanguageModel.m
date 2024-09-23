@implementation SFSpeechLanguageModel

- (SFSpeechLanguageModel)init
{

  return 0;
}

- (SFSpeechLanguageModel)initWithLocale:(id)a3 clientID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  SFSpeechLanguageModel *v10;
  uint64_t v11;
  NSLocale *v12;
  NSLocale *locale;
  void *v14;
  SFEntitledAssetConfig *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  __CFString *v19;
  __CFString *v20;
  void *v21;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "localeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFUtilities stringByReplacingUnderscoresWithHyphens:](SFUtilities, "stringByReplacingUnderscoresWithHyphens:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9 || (objc_msgSend((id)sSupportedLocaleIdentifiers, "containsObject:", v9) & 1) == 0)
  {
    AFDictationLanguageForKeyboardLanguage();
    v10 = (SFSpeechLanguageModel *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      NSLog(CFSTR("%@ is not a supported locale. Supported locales: %@"), v9, sSupportedLocaleIdentifiers);
      goto LABEL_14;
    }
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v11;
  }
  v23.receiver = self;
  v23.super_class = (Class)SFSpeechLanguageModel;
  self = -[SFSpeechLanguageModel init](&v23, sel_init);
  if (!self)
    goto LABEL_8;
  v12 = (NSLocale *)objc_msgSend(v6, "copy");
  locale = self->_locale;
  self->_locale = v12;

  +[SFUtilities localeCodeForLocale:](SFUtilities, "localeCodeForLocale:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[SFEntitledAssetConfig initWithLanguage:taskHint:]([SFEntitledAssetConfig alloc], "initWithLanguage:taskHint:", v14, 0);
  +[SFSpeechAssetManager pathToAssetWithConfig:clientIdentifier:](SFSpeechAssetManager, "pathToAssetWithConfig:clientIdentifier:", v15, v7);
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    self = -[SFSpeechLanguageModel initWithAssetPath:](self, "initWithAssetPath:", v16);

LABEL_8:
    self = self;
    v10 = self;
    goto LABEL_14;
  }
  v18 = -[SFEntitledAssetConfig assetType](v15, "assetType");
  if ((unint64_t)(v18 - 1) > 6)
    v19 = CFSTR("Unknown");
  else
    v19 = off_1E6485350[v18 - 1];
  v20 = v19;
  -[SFEntitledAssetConfig language](v15, "language");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("No %@ asset for language %@"), v20, v21);

  v10 = 0;
LABEL_14:

  return v10;
}

- (SFSpeechLanguageModel)initWithAssetPath:(id)a3
{
  id v4;
  SFSpeechLanguageModel *v5;
  SFLocalSpeechRecognitionClient *v6;
  SFLocalSpeechRecognitionClient *lsrClient;
  SFLocalSpeechRecognitionClient *v8;
  void *v9;
  SFSpeechLanguageModel *v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  SFSpeechLanguageModel *v18;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SFSpeechLanguageModel;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__625;
  v17 = __Block_byref_object_dispose__626;
  v5 = -[SFSpeechLanguageModel init](&v19, sel_init);
  v18 = v5;
  if (v5)
  {
    v6 = objc_alloc_init(SFLocalSpeechRecognitionClient);
    lsrClient = v5->_lsrClient;
    v5->_lsrClient = v6;

    v8 = v5->_lsrClient;
    if (v8)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __43__SFSpeechLanguageModel_initWithAssetPath___block_invoke;
      v12[3] = &unk_1E6486520;
      v12[4] = &v13;
      -[SFLocalSpeechRecognitionClient initializeLmWithAssetPath:completion:](v8, "initializeLmWithAssetPath:completion:", v4, v12);
    }
    else
    {
      v9 = (void *)v14[5];
      v14[5] = 0;

    }
  }
  v10 = (SFSpeechLanguageModel *)(id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[SFLocalSpeechRecognitionClient invalidate](self->_lsrClient, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SFSpeechLanguageModel;
  -[SFSpeechLanguageModel dealloc](&v3, sel_dealloc);
}

- (void)addSentence:(id)a3
{
  -[SFLocalSpeechRecognitionClient addSentenceToNgramCounts:](self->_lsrClient, "addSentenceToNgramCounts:", a3);
}

- (void)addSentences:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[SFSpeechLanguageModel addSentence:](self, "addSentence:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (id)addOovsFromSentence:(id)a3
{
  id v4;
  SFLocalSpeechRecognitionClient *lsrClient;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__625;
  v13 = __Block_byref_object_dispose__626;
  v14 = (id)MEMORY[0x1E0C9AA60];
  lsrClient = self->_lsrClient;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__SFSpeechLanguageModel_addOovsFromSentence___block_invoke;
  v8[3] = &unk_1E6486548;
  v8[4] = &v9;
  -[SFLocalSpeechRecognitionClient addSentenceToNgramCounts:completion:](lsrClient, "addSentenceToNgramCounts:completion:", v4, v8);
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (NSArray)outOfVocabularyWords
{
  void *v2;
  void *v3;

  -[SFSpeechLanguageModel outOfVocabularyWordsAndFrequencies](self, "outOfVocabularyWordsAndFrequencies");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSDictionary)outOfVocabularyWordsAndFrequencies
{
  SFLocalSpeechRecognitionClient *lsrClient;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__625;
  v10 = __Block_byref_object_dispose__626;
  v11 = 0;
  lsrClient = self->_lsrClient;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__SFSpeechLanguageModel_outOfVocabularyWordsAndFrequencies__block_invoke;
  v5[3] = &unk_1E64864F8;
  v5[4] = &v6;
  -[SFLocalSpeechRecognitionClient oovWordsAndFrequenciesWithCompletion:](lsrClient, "oovWordsAndFrequenciesWithCompletion:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

- (void)trainFromPlainTextAndWriteToDirectory:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  _QWORD aBlock[4];
  id v19;

  v6 = a3;
  v7 = a4;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__SFSpeechLanguageModel_trainFromPlainTextAndWriteToDirectory_completion___block_invoke;
  aBlock[3] = &unk_1E6485540;
  v8 = v7;
  v19 = v8;
  v9 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v11 = objc_msgSend(v10, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v6, 1, 0, &v17);
  v12 = v17;
  v13 = v12;
  if ((v11 & 1) == 0)
  {
    NSLog(CFSTR("Write failed error:%@"), v12);
LABEL_6:
    (*((void (**)(void *, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);
    goto LABEL_7;
  }
  NSLog(CFSTR("Write successfull"));
  if (!v6)
    goto LABEL_6;
  objc_msgSend(v6, "path");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  +[SFUtilities issueReadWriteSandboxExtensionForDirectoryPath:error:](SFUtilities, "issueReadWriteSandboxExtensionForDirectoryPath:error:", v14, &v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
    goto LABEL_6;
  -[SFLocalSpeechRecognitionClient trainFromPlainTextAndWriteToDirectory:sandboxExtension:completion:](self->_lsrClient, "trainFromPlainTextAndWriteToDirectory:sandboxExtension:completion:", v6, v15, v8);

LABEL_7:
}

- (BOOL)trainFromPlainTextAndWriteToDirectory:(id)a3
{
  return 0;
}

- (void)generateNgramsSerializeDataAndWriteToFile:(id)a3
{
  id v4;
  SFLocalSpeechRecognitionClient *lsrClient;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  lsrClient = self->_lsrClient;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__SFSpeechLanguageModel_generateNgramsSerializeDataAndWriteToFile___block_invoke;
  v7[3] = &unk_1E6486300;
  v8 = v4;
  v6 = v4;
  -[SFLocalSpeechRecognitionClient generateNgramCountsSerializeDataWithCompletion:](lsrClient, "generateNgramCountsSerializeDataWithCompletion:", v7);

}

- (id)deserializeModelData:(id)a3
{
  id v4;
  SFLocalSpeechRecognitionClient *lsrClient;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__625;
  v13 = __Block_byref_object_dispose__626;
  v14 = 0;
  lsrClient = self->_lsrClient;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__SFSpeechLanguageModel_deserializeModelData___block_invoke;
  v8[3] = &unk_1E64864F8;
  v8[4] = &v9;
  -[SFLocalSpeechRecognitionClient deserializeNgramCountsData:completion:](lsrClient, "deserializeNgramCountsData:completion:", v4, v8);
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (void)addPronsFromFile:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F160]), "initWithFilePath:", v17);
  objc_msgSend(v16, "lexemes");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v21;
    v18 = *MEMORY[0x1E0C99778];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("grapheme"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)MEMORY[0x1E0C99E60];
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("phoneme"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "componentsSeparatedByString:", CFSTR("/"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setWithArray:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!-[SFSpeechLanguageModel addProns:forWord:](self, "addProns:forWord:", v13, v9))
        {
          v14 = (void *)MEMORY[0x1E0C99DA0];
          objc_msgSend(v13, "allObjects");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "raise:format:", v18, CFSTR("Invalid prons: %@ for word: %@"), v15, v9);

        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v5);
  }

}

- (BOOL)addProns:(id)a3 forWord:(id)a4
{
  id v6;
  id v7;
  SFLocalSpeechRecognitionClient *lsrClient;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v6 = a3;
  v7 = a4;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  lsrClient = self->_lsrClient;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __42__SFSpeechLanguageModel_addProns_forWord___block_invoke;
  v10[3] = &unk_1E6485568;
  v10[4] = &v11;
  -[SFLocalSpeechRecognitionClient addProns:forWord:completion:](lsrClient, "addProns:forWord:completion:", v6, v7, v10);
  LOBYTE(self) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)self;
}

- (int64_t)lmeThreshold
{
  SFLocalSpeechRecognitionClient *lsrClient;
  int64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lsrClient = self->_lsrClient;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__SFSpeechLanguageModel_lmeThreshold__block_invoke;
  v5[3] = &unk_1E6485590;
  v5[4] = &v6;
  -[SFLocalSpeechRecognitionClient lmeThresholdWithCompletion:](lsrClient, "lmeThresholdWithCompletion:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)metrics
{
  SFLocalSpeechRecognitionClient *lsrClient;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__625;
  v10 = __Block_byref_object_dispose__626;
  v11 = 0;
  lsrClient = self->_lsrClient;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__SFSpeechLanguageModel_metrics__block_invoke;
  v5[3] = &unk_1E64864F8;
  v5[4] = &v6;
  -[SFLocalSpeechRecognitionClient metricsWithCompletion:](lsrClient, "metricsWithCompletion:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)createPhraseCountsArtifactWithIdentifier:(id)a3 rawPhraseCountsPath:(id)a4 customPronunciationsPath:(id)a5 writeDirectory:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  SFLocalSpeechRecognitionClient *lsrClient;
  id v24;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__625;
  v34 = __Block_byref_object_dispose__626;
  v35 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    NSLog(CFSTR("No write directory provided"));
LABEL_17:
    v24 = 0;
    goto LABEL_18;
  }
  objc_msgSend(v13, "path");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  +[SFUtilities issueReadWriteSandboxExtensionForDirectoryPath:error:](SFUtilities, "issueReadWriteSandboxExtensionForDirectoryPath:error:", v15, &v29);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v29;

  if (!v16)
  {
    objc_msgSend(v13, "path");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Could not issue sandbox extension for path:%@"), v22);
LABEL_16:

    goto LABEL_17;
  }
  objc_msgSend(v14, "addObject:", v16);

  if (!v11)
  {
    NSLog(CFSTR("No rawPhraseCountsPath provided"));
    goto LABEL_17;
  }
  objc_msgSend(v11, "path");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  +[SFUtilities issueReadSandboxExtensionForFilePath:error:](SFUtilities, "issueReadSandboxExtensionForFilePath:error:", v18, &v28);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v28;

  if (!v19)
  {
    objc_msgSend(v11, "path");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Could not issue sandbox extension for path:%@"), v22);
    goto LABEL_16;
  }
  objc_msgSend(v14, "addObject:", v19);

  if (!v12)
  {
    NSLog(CFSTR("No customPronunciationsPath provided but will continue.."));
    goto LABEL_14;
  }
  objc_msgSend(v12, "path");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  +[SFUtilities issueReadSandboxExtensionForFilePath:error:](SFUtilities, "issueReadSandboxExtensionForFilePath:error:", v20, &v27);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v27;

  if (!v21)
  {
    objc_msgSend(v12, "path");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Could not issue sandbox extension for path:%@"), v22);
    goto LABEL_16;
  }
  objc_msgSend(v14, "addObject:", v21);

LABEL_14:
  lsrClient = self->_lsrClient;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __126__SFSpeechLanguageModel_createPhraseCountsArtifactWithIdentifier_rawPhraseCountsPath_customPronunciationsPath_writeDirectory___block_invoke;
  v26[3] = &unk_1E64855E0;
  v26[4] = &v30;
  -[SFLocalSpeechRecognitionClient createPhraseCountsArtifactWithIdentifier:rawPhraseCountsPath:customPronunciationsPath:writeToDirectory:sandboxExtensions:completion:](lsrClient, "createPhraseCountsArtifactWithIdentifier:rawPhraseCountsPath:customPronunciationsPath:writeToDirectory:sandboxExtensions:completion:", v10, v11, v12, v13, v14, v26);
  v24 = (id)v31[5];
LABEL_18:

  _Block_object_dispose(&v30, 8);
  return v24;
}

- (id)createNgramCountsArtifactFromPhraseCountArtifact:(id)a3 writeDirectory:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  SFLocalSpeechRecognitionClient *lsrClient;
  id v15;
  _QWORD v17[5];
  id v18;
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  v7 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__625;
  v24 = __Block_byref_object_dispose__626;
  v25 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    NSLog(CFSTR("No write directory provided"));
LABEL_12:
    v15 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v7, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  +[SFUtilities issueReadWriteSandboxExtensionForDirectoryPath:error:](SFUtilities, "issueReadWriteSandboxExtensionForDirectoryPath:error:", v9, &v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v19;

  if (!v10)
  {
    NSLog(CFSTR("Could not issue sandbox extension for path:%@"), 0);
LABEL_11:

    goto LABEL_12;
  }
  objc_msgSend(v8, "addObject:", v10);

  if (!v6)
  {
    NSLog(CFSTR("No phraseCountArtifact provided"));
    goto LABEL_12;
  }
  objc_msgSend(v6, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  +[SFUtilities issueReadSandboxExtensionForFilePath:error:](SFUtilities, "issueReadSandboxExtensionForFilePath:error:", v12, &v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v18;

  if (!v13)
  {
    NSLog(CFSTR("Could not issue sandbox extension for path:%@"), 0);
    goto LABEL_11;
  }
  objc_msgSend(v8, "addObject:", v13);

  lsrClient = self->_lsrClient;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __89__SFSpeechLanguageModel_createNgramCountsArtifactFromPhraseCountArtifact_writeDirectory___block_invoke;
  v17[3] = &unk_1E64855E0;
  v17[4] = &v20;
  -[SFLocalSpeechRecognitionClient createNgramCountsArtifactFromPhraseCountArtifact:writeToDirectory:sandboxExtensions:completion:](lsrClient, "createNgramCountsArtifactFromPhraseCountArtifact:writeToDirectory:sandboxExtensions:completion:", v6, v7, v8, v17);
  v15 = (id)v21[5];
LABEL_13:

  _Block_object_dispose(&v20, 8);
  return v15;
}

- (id)createNgramCountsArtifactWithIdentifier:(id)a3 rawPhraseCountsPath:(id)a4 customPronunciationsPath:(id)a5 writeDirectory:(id)a6
{
  id v10;
  void *v11;
  void *v12;

  v10 = a6;
  -[SFSpeechLanguageModel createPhraseCountsArtifactWithIdentifier:rawPhraseCountsPath:customPronunciationsPath:writeDirectory:](self, "createPhraseCountsArtifactWithIdentifier:rawPhraseCountsPath:customPronunciationsPath:writeDirectory:", a3, a4, a5, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFSpeechLanguageModel createNgramCountsArtifactFromPhraseCountArtifact:writeDirectory:](self, "createNgramCountsArtifactFromPhraseCountArtifact:writeDirectory:", v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_lsrClient, 0);
}

void __89__SFSpeechLanguageModel_createNgramCountsArtifactFromPhraseCountArtifact_writeDirectory___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __126__SFSpeechLanguageModel_createPhraseCountsArtifactWithIdentifier_rawPhraseCountsPath_customPronunciationsPath_writeDirectory___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __32__SFSpeechLanguageModel_metrics__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __37__SFSpeechLanguageModel_lmeThreshold__block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

uint64_t __42__SFSpeechLanguageModel_addProns_forWord___block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __46__SFSpeechLanguageModel_deserializeModelData___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __67__SFSpeechLanguageModel_generateNgramsSerializeDataAndWriteToFile___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  if (a2)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v6 = 0;
    objc_msgSend(a2, "writeToURL:options:error:", v3, 1, &v6);
    v4 = v6;
    v5 = v4;
    if (v4)
      NSLog(CFSTR("There was a problem writing data to the file! Error:  %@"), v4);
    else
      NSLog(CFSTR("Ngram counts and OOV list serialized and saved to: %@"), *(_QWORD *)(a1 + 32));

  }
  else
  {
    NSLog(CFSTR("Failed to generate ngram counts"));
  }
}

uint64_t __74__SFSpeechLanguageModel_trainFromPlainTextAndWriteToDirectory_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __59__SFSpeechLanguageModel_outOfVocabularyWordsAndFrequencies__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __45__SFSpeechLanguageModel_addOovsFromSentence___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __43__SFSpeechLanguageModel_initWithAssetPath___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;

  if (a2)
  {
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v3 = *(void **)(v2 + 40);
    *(_QWORD *)(v2 + 40) = 0;

  }
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    +[SFUtilities supportedLocalesWithCompletion:](SFUtilities, "supportedLocalesWithCompletion:", &__block_literal_global_691);
}

+ (id)supportedLocales
{
  return (id)sSupportedLocales;
}

+ (void)trainAppLmFromNgramsSerializedDataFile:(id)a3 customPronsFile:(id)a4 language:(id)a5 writeToDirectory:(id)a6 modelOverride:(id)a7 completion:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  char v30;
  id v31;
  SFLocalSpeechRecognitionClient *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  SFLocalSpeechRecognitionClient *v39;
  SFLocalSpeechRecognitionClient *v40;
  id v41;
  void *v42;
  _QWORD v43[4];
  SFLocalSpeechRecognitionClient *v44;
  id v45;
  uint64_t v46;
  _QWORD v47[5];
  _QWORD v48[5];
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  id v55;
  _QWORD aBlock[4];
  id v57;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __131__SFSpeechLanguageModel_trainAppLmFromNgramsSerializedDataFile_customPronsFile_language_writeToDirectory_modelOverride_completion___block_invoke;
  aBlock[3] = &unk_1E6485540;
  v19 = v18;
  v57 = v19;
  v20 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13
    && (objc_msgSend(v13, "path"),
        v22 = (void *)objc_claimAutoreleasedReturnValue(),
        v23 = objc_msgSend(v21, "fileExistsAtPath:", v22),
        v22,
        (v23 & 1) != 0))
  {
    v41 = v17;
    v24 = v15;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v13);
    v25 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "path");
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v26;
    v42 = (void *)v25;
    if (v25)
    {
      NSLog(CFSTR("Successfully read the file: %@"), v26);

      if (v14)
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v14);
        v28 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "path");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = (void *)v28;
        if (v28)
          NSLog(CFSTR("Successfully read the file: %@"), v29);
        else
          NSLog(CFSTR("Failed to read the pronunciation file: %@"), v29);

      }
      else
      {
        v38 = 0;
      }
      v15 = v24;
      v55 = 0;
      v30 = objc_msgSend(v21, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v16, 1, 0, &v55);
      v31 = v55;
      v17 = v41;
      v37 = v31;
      if ((v30 & 1) != 0)
        NSLog(CFSTR("Created directory: %@"), v16);
      else
        NSLog(CFSTR("Failed to create directory error:%@"), v31);
      v32 = objc_alloc_init(SFLocalSpeechRecognitionClient);
      v49 = 0;
      v50 = &v49;
      v51 = 0x3032000000;
      v52 = __Block_byref_object_copy__625;
      v53 = __Block_byref_object_dispose__626;
      v54 = 0;
      if (!v41)
        goto LABEL_20;
      if (SFIsInternalInstall_onceToken != -1)
        dispatch_once(&SFIsInternalInstall_onceToken, &__block_literal_global_1717);
      if (SFIsInternalInstall_isInternal)
      {
        v48[0] = MEMORY[0x1E0C809B0];
        v48[1] = 3221225472;
        v48[2] = __131__SFSpeechLanguageModel_trainAppLmFromNgramsSerializedDataFile_customPronsFile_language_writeToDirectory_modelOverride_completion___block_invoke_2;
        v48[3] = &unk_1E6486520;
        v48[4] = &v49;
        -[SFLocalSpeechRecognitionClient initializeLmWithAssetPath:completion:](v32, "initializeLmWithAssetPath:completion:", v41, v48);
      }
      else
      {
LABEL_20:
        v39 = v32;
        +[SFUtilities defaultClientID](SFUtilities, "defaultClientID");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v15);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v47[0] = MEMORY[0x1E0C809B0];
        v47[1] = 3221225472;
        v47[2] = __131__SFSpeechLanguageModel_trainAppLmFromNgramsSerializedDataFile_customPronsFile_language_writeToDirectory_modelOverride_completion___block_invoke_3;
        v47[3] = &unk_1E6486520;
        v47[4] = &v49;
        -[SFLocalSpeechRecognitionClient initializeLmWithLocale:clientID:completion:](v39, "initializeLmWithLocale:clientID:completion:", v34, v33, v47);

        v32 = v39;
      }
      if (v50[5])
      {
        NSLog(CFSTR("Failed to initialize language model: %@"), v50[5], v37);
        (*((void (**)(void *, _QWORD, _QWORD))v20 + 2))(v20, 0, 0);
      }
      else
      {
        if (!v16)
          goto LABEL_26;
        v40 = v32;
        objc_msgSend(v16, "path");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = 0;
        +[SFUtilities issueReadWriteSandboxExtensionForDirectoryPath:error:](SFUtilities, "issueReadWriteSandboxExtensionForDirectoryPath:error:", v35, &v46);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        v32 = v40;
        if (v36)
        {
          v43[0] = MEMORY[0x1E0C809B0];
          v43[1] = 3221225472;
          v43[2] = __131__SFSpeechLanguageModel_trainAppLmFromNgramsSerializedDataFile_customPronsFile_language_writeToDirectory_modelOverride_completion___block_invoke_4;
          v43[3] = &unk_1E64855B8;
          v45 = v19;
          v44 = v40;
          -[SFLocalSpeechRecognitionClient trainAppLmFromNgramsSerializedData:customPronsData:language:writeToDirectory:sandboxExtension:completion:](v44, "trainAppLmFromNgramsSerializedData:customPronsData:language:writeToDirectory:sandboxExtension:completion:", v42, v38, v15, v16, v36, v43);

        }
        else
        {
LABEL_26:
          (*((void (**)(void *, _QWORD, _QWORD))v20 + 2))(v20, 0, 0);
        }
      }
      _Block_object_dispose(&v49, 8);

    }
    else
    {
      NSLog(CFSTR("Failed to read the file: %@"), v26);

      (*((void (**)(void *, _QWORD, _QWORD))v20 + 2))(v20, 0, 0);
      v17 = v41;
    }

  }
  else
  {
    NSLog(CFSTR("Could not find ngrams serialized data file: %@ "), v13);
    (*((void (**)(void *, _QWORD, _QWORD))v20 + 2))(v20, 0, 0);
  }

}

+ (void)trainAppLmFromNgramCountsArtifact:(id)a3 language:(id)a4 clientIdentifier:(id)a5 writeToDirectory:(id)a6 modelOverride:(id)a7 completion:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  char v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  void *v39;
  SFLocalSpeechRecognitionClient *v40;
  id v41;
  SFLocalSpeechRecognitionClient *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  SFLocalSpeechRecognitionClient *v53;
  void *v54;
  void *v55;
  _QWORD v56[4];
  SFLocalSpeechRecognitionClient *v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  _QWORD aBlock[4];
  id v67;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __127__SFSpeechLanguageModel_trainAppLmFromNgramCountsArtifact_language_clientIdentifier_writeToDirectory_modelOverride_completion___block_invoke;
  aBlock[3] = &unk_1E6485540;
  v19 = v18;
  v67 = v19;
  v20 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v13, "path");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "fileExistsAtPath:", v22);

    if ((v23 & 1) != 0)
    {
      v65 = 0;
      v24 = objc_msgSend(v21, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v16, 1, 0, &v65);
      v25 = v65;
      v26 = v25;
      if ((v24 & 1) != 0)
        NSLog(CFSTR("Created directory: %@"), v16);
      else
        NSLog(CFSTR("Failed to create directory error:%@"), v25);
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = (void *)v27;
      if (v16)
      {
        v54 = v14;
        v55 = (void *)v27;
        v52 = v26;
        objc_msgSend(v16, "path");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = 0;
        +[SFUtilities issueReadWriteSandboxExtensionForDirectoryPath:error:](SFUtilities, "issueReadWriteSandboxExtensionForDirectoryPath:error:", v29, &v64);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v64;

        if (v30)
        {
          v51 = v15;
          objc_msgSend(v55, "addObject:", v30);

          objc_msgSend(v13, "path");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = 0;
          +[SFUtilities issueReadSandboxExtensionForFilePath:error:](SFUtilities, "issueReadSandboxExtensionForFilePath:error:", v32, &v63);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v63;

          if (v33)
          {
            objc_msgSend(v55, "addObject:", v33);

            NSTemporaryDirectory();
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v62 = 0;
            +[SFUtilities issueReadWriteSandboxExtensionForDirectoryPath:error:](SFUtilities, "issueReadWriteSandboxExtensionForDirectoryPath:error:", v35, &v62);
            v36 = objc_claimAutoreleasedReturnValue();
            v37 = v62;

            v49 = v17;
            v50 = (void *)v36;
            if (v36)
            {
              v48 = v37;
              objc_msgSend(v55, "addObject:", v36);
              +[SFUtilities sandboxExtensionsForUsingANEAndAssets](SFUtilities, "sandboxExtensionsForUsingANEAndAssets");
              v38 = objc_claimAutoreleasedReturnValue();
              v15 = v51;
              v47 = (void *)v38;
              if (v38)
                objc_msgSend(v55, "addObjectsFromArray:", v38);
              else
                NSLog(CFSTR("Did not issue sandbox extension for ANE dirs; it's possible that they aren't needed"));
              v26 = v52;
              v40 = objc_alloc_init(SFLocalSpeechRecognitionClient);
              -[SFLocalSpeechRecognitionClient initializeWithSandboxExtensions:](v40, "initializeWithSandboxExtensions:", v55);
              v56[0] = MEMORY[0x1E0C809B0];
              v56[1] = 3221225472;
              v56[2] = __127__SFSpeechLanguageModel_trainAppLmFromNgramCountsArtifact_language_clientIdentifier_writeToDirectory_modelOverride_completion___block_invoke_2;
              v56[3] = &unk_1E6485608;
              v61 = v20;
              v53 = v40;
              v57 = v53;
              v58 = v13;
              v14 = v54;
              v41 = v54;
              v59 = v41;
              v60 = v16;
              v46 = _Block_copy(v56);
              if (!v17)
                goto LABEL_24;
              if (SFIsInternalInstall_onceToken != -1)
                dispatch_once(&SFIsInternalInstall_onceToken, &__block_literal_global_1717);
              if (SFIsInternalInstall_isInternal)
              {
                v42 = v53;
                v43 = v17;
                v44 = v46;
                -[SFLocalSpeechRecognitionClient initializeLmWithAssetPath:completion:](v53, "initializeLmWithAssetPath:completion:", v43, v46);
              }
              else
              {
LABEL_24:
                objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v41);
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                v42 = v53;
                v44 = v46;
                -[SFLocalSpeechRecognitionClient initializeLmWithLocale:clientID:completion:](v53, "initializeLmWithLocale:clientID:completion:", v45, v51, v46);

                v14 = v54;
              }

              v28 = v55;
              v39 = v48;
            }
            else
            {
              NSLog(CFSTR("Could not issue sandbox extension for temp dir: %@"), v37);
              (*((void (**)(void *, _QWORD, _QWORD))v20 + 2))(v20, 0, 0);
              v26 = v52;
              v14 = v54;
              v15 = v51;
              v39 = v37;
              v28 = v55;
            }

            v17 = v49;
            goto LABEL_27;
          }
          NSLog(CFSTR("Could not issue sandbox extension for path:%@"), 0);
          (*((void (**)(void *, _QWORD, _QWORD))v20 + 2))(v20, 0, 0);

          v14 = v54;
          v15 = v51;
        }
        else
        {
          NSLog(CFSTR("Could not issue sandbox extension for path:%@"), 0);
          (*((void (**)(void *, _QWORD, _QWORD))v20 + 2))(v20, 0, 0);

          v14 = v54;
        }
        v26 = v52;
        v28 = v55;
      }
      else
      {
        NSLog(CFSTR("No write directory provided"));
        (*((void (**)(void *, _QWORD, _QWORD))v20 + 2))(v20, 0, 0);
      }
LABEL_27:

      goto LABEL_28;
    }
  }
  NSLog(CFSTR("Could not find ngrams serialized data file: %@ "), v13);
  (*((void (**)(void *, _QWORD, _QWORD))v20 + 2))(v20, 0, 0);
LABEL_28:

}

+ (void)appLmNeedsRebuild:(id)a3 language:(id)a4 clientIdentifier:(id)a5 modelOverride:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  void (**v17)(void *, uint64_t, _QWORD);
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  SFLocalSpeechRecognitionClient *v38;
  SFLocalSpeechRecognitionClient *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  _QWORD v49[4];
  SFLocalSpeechRecognitionClient *v50;
  id v51;
  id v52;
  void (**v53)(void *, uint64_t, _QWORD);
  id v54;
  id v55;
  _QWORD aBlock[4];
  id v57;
  uint64_t v58;
  _QWORD v59[3];

  v59[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v48 = a5;
  v13 = a6;
  v14 = a7;
  v15 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __94__SFSpeechLanguageModel_appLmNeedsRebuild_language_clientIdentifier_modelOverride_completion___block_invoke;
  aBlock[3] = &unk_1E6485630;
  v16 = v14;
  v57 = v16;
  v17 = (void (**)(void *, uint64_t, _QWORD))_Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "path");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v19, "fileExistsAtPath:", v20);

  if ((v21 & 1) == 0)
  {
    v17[2](v17, 1, 0);
LABEL_8:
    v34 = v48;
    goto LABEL_21;
  }
  if (!v11)
  {
    v26 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("Error issuing sandbox extension for %@: %s"), &stru_1E6486C88, CFSTR("Localizable"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = __error();
    objc_msgSend(v26, "localizedStringWithFormat:", v28, 0, strerror(*v29));
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = (void *)MEMORY[0x1E0CB35C8];
    v58 = *MEMORY[0x1E0CB2D50];
    v59[0] = v30;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, &v58, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "errorWithDomain:code:userInfo:", CFSTR("SFSpeechErrorDomain"), 1, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(void *, uint64_t, void *))v17)[2](v17, 1, v33);

    goto LABEL_8;
  }
  v47 = v12;
  objc_msgSend(v11, "path");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0;
  +[SFUtilities issueReadSandboxExtensionForFilePath:error:](SFUtilities, "issueReadSandboxExtensionForFilePath:error:", v22, &v55);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v55;

  if (v23)
  {
    objc_msgSend(v18, "addObject:", v23);

    +[SFUtilities sandboxExtensionsForUsingANEAndAssets](SFUtilities, "sandboxExtensionsForUsingANEAndAssets");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
      objc_msgSend(v18, "addObjectsFromArray:", v25);
    else
      NSLog(CFSTR("Did not issue sandbox extension for ANE dirs; it could be that they aren't needed"));
    NSTemporaryDirectory();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = 0;
    +[SFUtilities issueReadWriteSandboxExtensionForDirectoryPath:error:](SFUtilities, "issueReadWriteSandboxExtensionForDirectoryPath:error:", v35, &v54);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v54;

    if (v36)
    {
      v44 = v37;
      v45 = v36;
      v46 = v25;
      objc_msgSend(v18, "addObject:", v36);
      v38 = objc_alloc_init(SFLocalSpeechRecognitionClient);
      -[SFLocalSpeechRecognitionClient initializeWithSandboxExtensions:](v38, "initializeWithSandboxExtensions:", v18);
      v49[0] = v15;
      v49[1] = 3221225472;
      v49[2] = __94__SFSpeechLanguageModel_appLmNeedsRebuild_language_clientIdentifier_modelOverride_completion___block_invoke_2;
      v49[3] = &unk_1E6485680;
      v53 = v17;
      v39 = v38;
      v50 = v39;
      v51 = v11;
      v12 = v47;
      v40 = v47;
      v52 = v40;
      v41 = _Block_copy(v49);
      v34 = v48;
      if (!v13)
        goto LABEL_17;
      if (SFIsInternalInstall_onceToken != -1)
        dispatch_once(&SFIsInternalInstall_onceToken, &__block_literal_global_1717);
      if (SFIsInternalInstall_isInternal)
      {
        -[SFLocalSpeechRecognitionClient initializeLmWithAssetPath:completion:](v39, "initializeLmWithAssetPath:completion:", v13, v41);
      }
      else
      {
LABEL_17:
        objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v40);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFLocalSpeechRecognitionClient initializeLmWithLocale:clientID:completion:](v39, "initializeLmWithLocale:clientID:completion:", v42, v48, v41);

      }
      v36 = v45;
      v25 = v46;
      v43 = v44;
    }
    else
    {
      NSLog(CFSTR("Could not issue sandbox extension for temp dir: %@"), v37);
      ((void (**)(void *, uint64_t, id))v17)[2](v17, 1, v37);
      v43 = v37;
      v12 = v47;
      v34 = v48;
    }

  }
  else
  {
    ((void (**)(void *, uint64_t, id))v17)[2](v17, 1, v24);

    v34 = v48;
  }
LABEL_21:

}

+ (void)prepareCustomLanguageModelForUrl:(NSURL *)asset clientIdentifier:(NSString *)clientIdentifier configuration:(SFSpeechLanguageModelConfiguration *)configuration completion:(void *)completion
{
  objc_msgSend(a1, "prepareCustomLanguageModelForUrl:clientIdentifier:configuration:ignoresCache:completion:", asset, clientIdentifier, configuration, 0, completion);
}

+ (void)prepareCustomLanguageModelForUrl:(NSURL *)asset clientIdentifier:(NSString *)clientIdentifier configuration:(SFSpeechLanguageModelConfiguration *)configuration ignoresCache:(BOOL)ignoresCache completion:(void *)completion
{
  NSURL *v11;
  SFSpeechLanguageModelConfiguration *v12;
  id v13;
  uint64_t v14;
  id v15;
  void (**v16)(void *, void *);
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  NSString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSString *v39;
  _QWORD v40[4];
  SFSpeechLanguageModelConfiguration *v41;
  NSURL *v42;
  id v43;
  NSString *v44;
  void (**v45)(void *, void *);
  BOOL v46;
  _QWORD aBlock[4];
  id v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  _QWORD v52[3];

  v52[1] = *MEMORY[0x1E0C80C00];
  v11 = asset;
  v39 = clientIdentifier;
  v12 = configuration;
  v13 = completion;
  v14 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __113__SFSpeechLanguageModel_prepareCustomLanguageModelForUrl_clientIdentifier_configuration_ignoresCache_completion___block_invoke;
  aBlock[3] = &unk_1E6485980;
  v15 = v13;
  v48 = v15;
  v16 = (void (**)(void *, void *))_Block_copy(aBlock);
  v17 = objc_alloc(MEMORY[0x1E0D1F118]);
  -[NSURL path](v11, "path");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithPath:", v18);

  if (!v19)
  {
    v26 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("Error reading asset from %@"), &stru_1E6486C88, CFSTR("Localizable"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSURL path](v11, "path");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "localizedStringWithFormat:", v28, v29);
    v23 = (id)objc_claimAutoreleasedReturnValue();

    v30 = (void *)MEMORY[0x1E0CB35C8];
    v51 = *MEMORY[0x1E0CB2D50];
    v52[0] = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "errorWithDomain:code:userInfo:", CFSTR("SFSpeechErrorDomain"), 8, v25);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2](v16, v31);

LABEL_6:
    v24 = v39;
    goto LABEL_7;
  }
  objc_msgSend(v19, "getLocale");
  v20 = objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    v32 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("Error reading asset language for %@"), &stru_1E6486C88, CFSTR("Localizable"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSURL path](v11, "path");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "localizedStringWithFormat:", v34, v35);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = (void *)MEMORY[0x1E0CB35C8];
    v49 = *MEMORY[0x1E0CB2D50];
    v50 = v25;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "errorWithDomain:code:userInfo:", CFSTR("SFSpeechErrorDomain"), 8, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2](v16, v38);

    v23 = 0;
    goto LABEL_6;
  }
  v21 = (void *)v20;
  -[SFSpeechLanguageModelConfiguration languageModel](v12, "languageModel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v14;
  v40[1] = 3221225472;
  v40[2] = __113__SFSpeechLanguageModel_prepareCustomLanguageModelForUrl_clientIdentifier_configuration_ignoresCache_completion___block_invoke_2;
  v40[3] = &unk_1E64856D0;
  v45 = v16;
  v46 = ignoresCache;
  v41 = v12;
  v42 = v11;
  v23 = v21;
  v43 = v23;
  v24 = v39;
  v44 = v39;
  +[SFSpeechLanguageModel appLmNeedsRebuild:language:clientIdentifier:modelOverride:completion:](SFSpeechLanguageModel, "appLmNeedsRebuild:language:clientIdentifier:modelOverride:completion:", v22, v23, v44, 0, v40);

  v25 = v45;
LABEL_7:

}

uint64_t __113__SFSpeechLanguageModel_prepareCustomLanguageModelForUrl_clientIdentifier_configuration_ignoresCache_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __113__SFSpeechLanguageModel_prepareCustomLanguageModelForUrl_clientIdentifier_configuration_ignoresCache_completion___block_invoke_2(uint64_t a1, _BOOL4 a2, void *a3)
{
  id v5;
  void (*v6)(void);
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v5 = a3;
  if (v5)
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
  }
  else
  {
    v7 = *(unsigned __int8 *)(a1 + 72);
    if (!*(_BYTE *)(a1 + 72) && !a2)
    {
      objc_msgSend(*(id *)(a1 + 32), "languageModel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      __113__SFSpeechLanguageModel_prepareCustomLanguageModelForUrl_clientIdentifier_configuration_ignoresCache_completion___block_invoke_3(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      __113__SFSpeechLanguageModel_prepareCustomLanguageModelForUrl_clientIdentifier_configuration_ignoresCache_completion___block_invoke_3(*(void **)(a1 + 40));
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      a2 = 1;
      if (v9 && v10)
        a2 = objc_msgSend(v9, "compare:", v10) == -1;

      v7 = *(unsigned __int8 *)(a1 + 72);
    }
    if (v7 || a2)
    {
      v12 = *(_QWORD *)(a1 + 40);
      v13 = *(_QWORD *)(a1 + 48);
      v14 = *(_QWORD *)(a1 + 56);
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "temporaryDirectory");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __113__SFSpeechLanguageModel_prepareCustomLanguageModelForUrl_clientIdentifier_configuration_ignoresCache_completion___block_invoke_4;
      v17[3] = &unk_1E64856A8;
      v18 = *(id *)(a1 + 40);
      v20 = *(id *)(a1 + 64);
      v19 = *(id *)(a1 + 32);
      +[SFSpeechLanguageModel trainAppLmFromNgramCountsArtifact:language:clientIdentifier:writeToDirectory:modelOverride:completion:](SFSpeechLanguageModel, "trainAppLmFromNgramCountsArtifact:language:clientIdentifier:writeToDirectory:modelOverride:completion:", v12, v13, v14, v16, 0, v17);

      goto LABEL_13;
    }
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
  }
  v6();
LABEL_13:

}

id __113__SFSpeechLanguageModel_prepareCustomLanguageModelForUrl_clientIdentifier_configuration_ignoresCache_completion___block_invoke_3(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v1 = (void *)MEMORY[0x1E0CB3620];
  v2 = a1;
  objc_msgSend(v1, "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "attributesOfItemAtPath:error:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "fileModificationDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __113__SFSpeechLanguageModel_prepareCustomLanguageModelForUrl_clientIdentifier_configuration_ignoresCache_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  void (*v21)(void);
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "languageModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeItemAtURL:error:", v9, 0);

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "languageModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    v12 = objc_msgSend(v10, "moveItemAtURL:toURL:error:", v5, v11, &v31);
    v13 = v31;

    if ((v12 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "vocabulary");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "vocabulary");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "removeItemAtURL:error:", v16, 0);

        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "vocabulary");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v13;
        v19 = objc_msgSend(v17, "moveItemAtURL:toURL:error:", v7, v18, &v30);
        v20 = v30;

        if ((v19 & 1) == 0)
        {
          (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
          v13 = v20;
          goto LABEL_11;
        }
        v13 = v20;
      }
      v21 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    }
    else
    {
      v21 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    }
    v21();
  }
  else
  {
    v22 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("Error building custom language model at %@"), &stru_1E6486C88, CFSTR("Localizable"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "path");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringWithFormat:", v24, v25);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    v26 = *(_QWORD *)(a1 + 48);
    v27 = (void *)MEMORY[0x1E0CB35C8];
    v32 = *MEMORY[0x1E0CB2D50];
    v33[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("SFSpeechErrorDomain"), 1, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v26 + 16))(v26, v29);

  }
LABEL_11:

}

uint64_t __94__SFSpeechLanguageModel_appLmNeedsRebuild_language_clientIdentifier_modelOverride_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __94__SFSpeechLanguageModel_appLmNeedsRebuild_language_clientIdentifier_modelOverride_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __94__SFSpeechLanguageModel_appLmNeedsRebuild_language_clientIdentifier_modelOverride_completion___block_invoke_3;
    v6[3] = &unk_1E6485658;
    v5 = *(_QWORD *)(a1 + 48);
    v8 = *(id *)(a1 + 56);
    v7 = *(id *)(a1 + 32);
    objc_msgSend(v3, "appLmNeedsRebuild:language:sandboxExtensions:completion:", v4, v5, MEMORY[0x1E0C9AA60], v6);

  }
}

uint64_t __94__SFSpeechLanguageModel_appLmNeedsRebuild_language_clientIdentifier_modelOverride_completion___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

uint64_t __127__SFSpeechLanguageModel_trainAppLmFromNgramCountsArtifact_language_clientIdentifier_writeToDirectory_modelOverride_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __127__SFSpeechLanguageModel_trainAppLmFromNgramCountsArtifact_language_clientIdentifier_writeToDirectory_modelOverride_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;

  if (a2)
  {
    NSLog(CFSTR("Failed to initialize language model: %@"), a2);
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 56);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __127__SFSpeechLanguageModel_trainAppLmFromNgramCountsArtifact_language_clientIdentifier_writeToDirectory_modelOverride_completion___block_invoke_3;
    v9[3] = &unk_1E64855B8;
    v11 = *(id *)(a1 + 64);
    v10 = *(id *)(a1 + 32);
    objc_msgSend(v3, "trainAppLmFromNgramCountsArtifact:forApp:language:writeToDirectory:sandboxExtensions:completion:", v4, v6, v7, v8, MEMORY[0x1E0C9AA60], v9);

  }
}

uint64_t __127__SFSpeechLanguageModel_trainAppLmFromNgramCountsArtifact_language_clientIdentifier_writeToDirectory_modelOverride_completion___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

uint64_t __131__SFSpeechLanguageModel_trainAppLmFromNgramsSerializedDataFile_customPronsFile_language_writeToDirectory_modelOverride_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __131__SFSpeechLanguageModel_trainAppLmFromNgramsSerializedDataFile_customPronsFile_language_writeToDirectory_modelOverride_completion___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __131__SFSpeechLanguageModel_trainAppLmFromNgramsSerializedDataFile_customPronsFile_language_writeToDirectory_modelOverride_completion___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __131__SFSpeechLanguageModel_trainAppLmFromNgramsSerializedDataFile_customPronsFile_language_writeToDirectory_modelOverride_completion___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __35__SFSpeechLanguageModel_initialize__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  v5 = objc_msgSend(a2, "copy");
  v6 = (void *)sSupportedLocales;
  sSupportedLocales = v5;

  v7 = objc_msgSend(v4, "copy");
  v8 = (void *)sSupportedLocaleIdentifiers;
  sSupportedLocaleIdentifiers = v7;

}

@end
