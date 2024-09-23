@implementation INFGrammarCollection

- (INFGrammarCollection)init
{
  INFGrammarCollection *v2;
  uint64_t v3;
  NSMutableDictionary *tokensDictionary;
  uint64_t v5;
  NSMutableDictionary *sentencesDictionary;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)INFGrammarCollection;
  v2 = -[INFGrammarCollection init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    tokensDictionary = v2->_tokensDictionary;
    v2->_tokensDictionary = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    sentencesDictionary = v2->_sentencesDictionary;
    v2->_sentencesDictionary = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (INFGrammarCollection)initWithGrammarCollectionNamed:(id)a3 bundle:(id)a4 language:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  INFGrammarCollection *v21;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;
  v13 = (void *)MEMORY[0x1E0CB34D0];
  objc_msgSend(v11, "localizations");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v23[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "preferredLocalizationsFromArray:forPreferences:", v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v13, "preferredLocalizationsFromArray:forPreferences:", v14, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v16, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pathForResource:ofType:inDirectory:forLocalization:", v8, CFSTR("xcgrammar"), 0, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v19, 0, 0, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[INFGrammarCollection initWithDictionary:](self, "initWithDictionary:", v20);

    v21 = self;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (INFGrammarCollection)initWithDictionary:(id)a3
{
  id v4;
  INFGrammarCollection *v5;
  void *v6;
  uint64_t v7;
  INFGrammarCollection *v8;
  void *v9;
  _QWORD v11[4];
  INFGrammarCollection *v12;
  _QWORD v13[4];
  INFGrammarCollection *v14;

  v4 = a3;
  v5 = -[INFGrammarCollection init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LOCSentenceTokens"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __43__INFGrammarCollection_initWithDictionary___block_invoke;
    v13[3] = &unk_1E97787C8;
    v8 = v5;
    v14 = v8;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v13);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LOCSentences"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __43__INFGrammarCollection_initWithDictionary___block_invoke_2;
    v11[3] = &unk_1E97787C8;
    v12 = v8;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v11);

  }
  return v5;
}

- (id)createSentenceWithIdentifier:(id)a3
{
  void *v4;

  +[INFSentence sentenceWithIdentifier:](INFSentence, "sentenceWithIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[INFGrammarCollection addSentence:](self, "addSentence:", v4);
  return v4;
}

- (id)sentenceWithIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sentencesDictionary, "objectForKeyedSubscript:", a3);
}

- (void)addSentence:(id)a3
{
  id v4;
  NSMutableDictionary *sentencesDictionary;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "setCollection:", self);
  sentencesDictionary = self->_sentencesDictionary;
  objc_msgSend(v4, "identifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](sentencesDictionary, "setObject:forKeyedSubscript:", v4, v6);

}

- (NSArray)sentences
{
  void *v3;
  NSMutableDictionary *sentencesDictionary;
  id v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sentencesDictionary = self->_sentencesDictionary;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33__INFGrammarCollection_sentences__block_invoke;
  v7[3] = &unk_1E97787F0;
  v5 = v3;
  v8 = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](sentencesDictionary, "enumerateKeysAndObjectsUsingBlock:", v7);

  return (NSArray *)v5;
}

- (id)createNounWithIdentifier:(id)a3 language:(id)a4
{
  void *v5;

  +[INFPartOfSpeech nounWithIdentifier:language:](INFPartOfSpeech, "nounWithIdentifier:language:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INFGrammarCollection addToken:](self, "addToken:", v5);
  return v5;
}

- (id)createNounWithGender:(unint64_t)a3 identifier:(id)a4 language:(id)a5
{
  void *v6;

  +[INFPartOfSpeech nounWithGender:identifier:language:](INFPartOfSpeech, "nounWithGender:identifier:language:", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INFGrammarCollection addToken:](self, "addToken:", v6);
  return v6;
}

- (id)createAdjectiveWithIdentifier:(id)a3 language:(id)a4
{
  void *v5;

  +[INFPartOfSpeech adjectiveWithIdentifier:language:](INFPartOfSpeech, "adjectiveWithIdentifier:language:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INFGrammarCollection addToken:](self, "addToken:", v5);
  return v5;
}

- (void)addToken:(id)a3
{
  NSMutableDictionary *tokensDictionary;
  id v4;
  id v5;

  tokensDictionary = self->_tokensDictionary;
  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](tokensDictionary, "setObject:forKeyedSubscript:", v4, v5);

}

- (id)tokenWithIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_tokensDictionary, "objectForKeyedSubscript:", a3);
}

- (NSArray)tokens
{
  void *v3;
  NSMutableDictionary *tokensDictionary;
  id v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  tokensDictionary = self->_tokensDictionary;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __30__INFGrammarCollection_tokens__block_invoke;
  v7[3] = &unk_1E9778818;
  v5 = v3;
  v8 = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](tokensDictionary, "enumerateKeysAndObjectsUsingBlock:", v7);

  return (NSArray *)v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSMutableDictionary *tokensDictionary;
  id v7;
  void *v8;
  NSMutableDictionary *sentencesDictionary;
  id v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *);
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  tokensDictionary = self->_tokensDictionary;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __48__INFGrammarCollection_dictionaryRepresentation__block_invoke;
  v17[3] = &unk_1E9778818;
  v18 = v4;
  v7 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](tokensDictionary, "enumerateKeysAndObjectsUsingBlock:", v17);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("LOCSentenceTokens"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  sentencesDictionary = self->_sentencesDictionary;
  v12 = v5;
  v13 = 3221225472;
  v14 = __48__INFGrammarCollection_dictionaryRepresentation__block_invoke_2;
  v15 = &unk_1E97787F0;
  v16 = v8;
  v10 = v8;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](sentencesDictionary, "enumerateKeysAndObjectsUsingBlock:", &v12);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("LOCSentences"), v12, v13, v14, v15);

  return v3;
}

- (void)writeToFileAtPath:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB38B0];
  v5 = a3;
  -[INFGrammarCollection dictionaryRepresentation](self, "dictionaryRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataWithPropertyList:format:options:error:", v6, 100, 0, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "writeToFile:atomically:", v5, 1);
}

- (NSMutableDictionary)tokensDictionary
{
  return self->_tokensDictionary;
}

- (void)setTokensDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_tokensDictionary, a3);
}

- (NSMutableDictionary)sentencesDictionary
{
  return self->_sentencesDictionary;
}

- (void)setSentencesDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_sentencesDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sentencesDictionary, 0);
  objc_storeStrong((id *)&self->_tokensDictionary, 0);
}

void __48__INFGrammarCollection_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  objc_msgSend(a3, "dictionaryRepresentation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

void __48__INFGrammarCollection_dictionaryRepresentation__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  objc_msgSend(a3, "dictionaryRepresentation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

uint64_t __30__INFGrammarCollection_tokens__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

uint64_t __33__INFGrammarCollection_sentences__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

void __43__INFGrammarCollection_initWithDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  INFPartOfSpeech *v7;

  v5 = a3;
  v6 = a2;
  v7 = -[INFPartOfSpeech initWithDictionary:identifier:]([INFPartOfSpeech alloc], "initWithDictionary:identifier:", v5, v6);

  objc_msgSend(*(id *)(a1 + 32), "addToken:", v7);
}

void __43__INFGrammarCollection_initWithDictionary___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  INFSentence *v7;

  v5 = a3;
  v6 = a2;
  v7 = -[INFSentence initWithDictionary:identifier:]([INFSentence alloc], "initWithDictionary:identifier:", v5, v6);

  objc_msgSend(*(id *)(a1 + 32), "addSentence:", v7);
}

+ (id)grammarCollection
{
  return objc_alloc_init((Class)a1);
}

+ (id)grammarCollectionNamed:(id)a3 bundle:(id)a4
{
  return (id)objc_msgSend(a1, "grammarCollectionNamed:bundle:language:", a3, a4, 0);
}

+ (id)grammarCollectionNamed:(id)a3 bundle:(id)a4 language:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithGrammarCollectionNamed:bundle:language:", v10, v9, v8);

  return v11;
}

@end
