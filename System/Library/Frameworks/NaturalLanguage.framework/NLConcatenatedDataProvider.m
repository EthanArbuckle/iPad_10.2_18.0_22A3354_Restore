@implementation NLConcatenatedDataProvider

- (NLConcatenatedDataProvider)initWithDataProviders:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *dataProviders;
  objc_super v8;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v8.receiver = self;
    v8.super_class = (Class)NLConcatenatedDataProvider;
    self = -[NLConcatenatedDataProvider init](&v8, sel_init);
    if (self)
    {
      v5 = (NSArray *)objc_msgSend(v4, "copy");
      dataProviders = self->_dataProviders;
      self->_dataProviders = v5;

    }
  }

  return self;
}

- (id)configuration
{
  void *v2;
  void *v3;

  -[NSArray firstObject](self->_dataProviders, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)numberOfInstances
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_dataProviders;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "numberOfInstances", (_QWORD)v9);
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)instanceAtIndex:(unint64_t)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_dataProviders;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      v8 = 0;
      v9 = a3;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v8);
        v11 = objc_msgSend(v10, "numberOfInstances", (_QWORD)v14);
        a3 = v9 - v11;
        if (v9 < v11)
        {
          objc_msgSend(v10, "instanceAtIndex:", v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
        ++v8;
        v9 -= v11;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (__CFStringTokenizer)tokenizer
{
  void *v2;
  __CFStringTokenizer *v3;

  -[NSArray firstObject](self->_dataProviders, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (__CFStringTokenizer *)objc_msgSend(v2, "tokenizer");

  return v3;
}

- (id)labelMap
{
  void *v2;
  void *v3;

  -[NSArray firstObject](self->_dataProviders, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "labelMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)inverseLabelMap
{
  void *v2;
  void *v3;

  -[NSArray firstObject](self->_dataProviders, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inverseLabelMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)vocabularyMap
{
  void *v2;
  void *v3;

  -[NSArray firstObject](self->_dataProviders, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "vocabularyMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)documentFrequencyMap
{
  void *v2;
  void *v3;

  -[NSArray firstObject](self->_dataProviders, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "documentFrequencyMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)numberOfLabels
{
  void *v2;
  unint64_t v3;

  -[NSArray firstObject](self->_dataProviders, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfLabels");

  return v3;
}

- (unint64_t)numberOfVocabularyEntries
{
  void *v2;
  unint64_t v3;

  -[NSArray firstObject](self->_dataProviders, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfVocabularyEntries");

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataProviders, 0);
}

@end
