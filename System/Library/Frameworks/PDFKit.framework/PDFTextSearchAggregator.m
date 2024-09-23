@implementation PDFTextSearchAggregator

- (PDFTextSearchAggregator)initWithSearchString:(id)a3 aggregator:(id)a4
{
  id v7;
  id v8;
  PDFTextSearchAggregator *v9;
  PDFTextSearchAggregator *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PDFTextSearchAggregator;
  v9 = -[PDFTextSearchAggregator init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_searchString, a3);
    objc_storeStrong((id *)&v10->_aggregator, a4);
    v10->_isActive = 1;
  }

  return v10;
}

- (void)invalidate
{
  self->_isActive = 0;
}

- (BOOL)cancelFind
{
  return !self->_isActive;
}

- (void)foundResults:(id)a3 forPage:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        +[PDFTextRange textRangeFromSelection:](PDFTextRange, "textRangeFromSelection:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          -[UITextSearchAggregator foundRange:forSearchString:inDocument:](self->_aggregator, "foundRange:forSearchString:inDocument:", v10, self->_searchString, 0);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)foundResults:(id)a3 forDocument:(id)a4
{
  -[UITextSearchAggregator finishedSearching](self->_aggregator, "finishedSearching", a3, a4);
}

- (NSString)searchString
{
  return self->_searchString;
}

- (UITextSearchAggregator)aggregator
{
  return self->_aggregator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggregator, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
}

@end
