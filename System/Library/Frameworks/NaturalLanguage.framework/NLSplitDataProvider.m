@implementation NLSplitDataProvider

- (NLSplitDataProvider)initWithDataProvider:(id)a3 indexes:(id)a4
{
  id v7;
  id v8;
  NLSplitDataProvider *v9;
  NLSplitDataProvider *v10;
  uint64_t v11;
  NSArray *indexes;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NLSplitDataProvider;
  v9 = -[NLSplitDataProvider init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dataProvider, a3);
    v11 = objc_msgSend(v8, "copy");
    indexes = v10->_indexes;
    v10->_indexes = (NSArray *)v11;

  }
  return v10;
}

- (id)configuration
{
  return -[NLDataProvider configuration](self->_dataProvider, "configuration");
}

- (unint64_t)numberOfInstances
{
  return -[NSArray count](self->_indexes, "count");
}

- (id)instanceAtIndex:(unint64_t)a3
{
  NLDataProvider *dataProvider;
  void *v4;
  void *v5;

  dataProvider = self->_dataProvider;
  -[NSArray objectAtIndex:](self->_indexes, "objectAtIndex:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLDataProvider instanceAtIndex:](dataProvider, "instanceAtIndex:", objc_msgSend(v4, "unsignedIntegerValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (__CFStringTokenizer)tokenizer
{
  return -[NLDataProvider tokenizer](self->_dataProvider, "tokenizer");
}

- (id)labelMap
{
  return -[NLDataProvider labelMap](self->_dataProvider, "labelMap");
}

- (id)inverseLabelMap
{
  return -[NLDataProvider inverseLabelMap](self->_dataProvider, "inverseLabelMap");
}

- (id)vocabularyMap
{
  return -[NLDataProvider vocabularyMap](self->_dataProvider, "vocabularyMap");
}

- (id)documentFrequencyMap
{
  return -[NLDataProvider documentFrequencyMap](self->_dataProvider, "documentFrequencyMap");
}

- (unint64_t)numberOfLabels
{
  return -[NLDataProvider numberOfLabels](self->_dataProvider, "numberOfLabels");
}

- (unint64_t)numberOfVocabularyEntries
{
  return -[NLDataProvider numberOfVocabularyEntries](self->_dataProvider, "numberOfVocabularyEntries");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexes, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
}

@end
