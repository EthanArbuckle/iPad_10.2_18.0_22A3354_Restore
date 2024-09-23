@implementation BRQueryStitchingContext

- (BRQueryStitchingContext)initWithQuery:(id)a3
{
  id v5;
  BRQueryStitchingContext *v6;
  BRQueryStitchingContext *v7;
  uint64_t v8;
  BRNotificationReceiver *receiver;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BRQueryStitchingContext;
  v6 = -[BRQueryStitchingContext init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_query, a3);
    objc_msgSend(v5, "receiver");
    v8 = objc_claimAutoreleasedReturnValue();
    receiver = v7->_receiver;
    v7->_receiver = (BRNotificationReceiver *)v8;

  }
  return v7;
}

- (void)performAsyncOnReceiver:(id)a3
{
  id v4;
  BRQuery *query;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  query = self->_query;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__BRQueryStitchingContext_performAsyncOnReceiver___block_invoke;
  v7[3] = &unk_1E3DA5150;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[BRQuery _performBlockAsync:](query, "_performBlockAsync:", v7);

}

uint64_t __50__BRQueryStitchingContext_performAsyncOnReceiver___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 8), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 16));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receiver, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

@end
