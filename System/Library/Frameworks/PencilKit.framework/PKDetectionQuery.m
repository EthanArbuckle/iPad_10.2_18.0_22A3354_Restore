@implementation PKDetectionQuery

- (void)start
{
  id v2;

  -[PKDetectionQuery query](self, "query");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "start");

}

- (void)pause
{
  id v2;

  -[PKDetectionQuery query](self, "query");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pause");

}

- (void)teardown
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__PKDetectionQuery_teardown__block_invoke;
  block[3] = &unk_1E7778020;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __28__PKDetectionQuery_teardown__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setDelegate:", 0);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKDetectionQuery;
  -[PKDetectionQuery dealloc](&v2, sel_dealloc);
}

- (CHQuery)query
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
}

@end
