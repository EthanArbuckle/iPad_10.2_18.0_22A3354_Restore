@implementation PKAutoRefineQuery

- (PKAutoRefineQuery)initWithRecognitionSessionManager:(id)a3
{
  id v4;
  PKAutoRefineQuery *v5;
  id v6;
  void *v7;
  uint64_t v8;
  CHAutoRefineQuery *query;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKAutoRefineQuery;
  v5 = -[PKQuery initWithRecognitionSessionManager:](&v12, sel_initWithRecognitionSessionManager_, v4);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0D167E8]);
    -[PKRecognitionSessionManager session](v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "initWithRecognitionSession:", v7);
    query = v5->_query;
    v5->_query = (CHAutoRefineQuery *)v8;

  }
  -[PKAutoRefineQuery query](v5, "query");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDelegate:", v5);

  return v5;
}

- (void)start
{
  id v2;

  -[PKAutoRefineQuery query](self, "query");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "start");

}

- (void)pause
{
  id v2;

  -[PKAutoRefineQuery query](self, "query");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pause");

}

- (void)teardown
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__PKAutoRefineQuery_teardown__block_invoke;
  block[3] = &unk_1E7776F38;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __29__PKAutoRefineQuery_teardown__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setDelegate:", 0);
}

- (void)dealloc
{
  objc_super v3;

  objc_storeWeak((id *)&self->_autoRefineDelegate, 0);
  -[CHAutoRefineQuery setDelegate:](self->_query, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PKAutoRefineQuery;
  -[PKAutoRefineQuery dealloc](&v3, sel_dealloc);
}

- (void)queryDidUpdateResult:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (self)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_autoRefineDelegate);
    if (WeakRetained)
    {
      objc_msgSend(v7, "autoRefinedItem");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CHAutoRefineQuery lastProcessedStrokeProviderVersion](self->_query, "lastProcessedStrokeProviderVersion");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "autoRefineQuery:didUpdateWithQueryItem:validProviderVersion:", self, v5, v6);

    }
  }
  else
  {
    WeakRetained = 0;
  }

}

- (CHAutoRefineQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
  objc_storeStrong((id *)&self->_query, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
  objc_destroyWeak((id *)&self->_autoRefineDelegate);
}

@end
