@implementation NTKTimelineExtendDataOperation

- (void)setExtendsRightFromDate:(id)a3
{
  objc_storeStrong((id *)&self->_boundaryDate, a3);
}

- (void)_cancel
{
  id handler;

  handler = self->_handler;
  self->_handler = 0;

}

- (void)_invokeHandlerWithEntries:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__NTKTimelineExtendDataOperation__invokeHandlerWithEntries___block_invoke;
  v6[3] = &unk_1E6BCD778;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __60__NTKTimelineExtendDataOperation__invokeHandlerWithEntries___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(result + 48))
  {
    result = objc_msgSend((id)result, "canceled");
    if ((result & 1) == 0)
      return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) + 16))();
  }
  return result;
}

- (void)_extendRight
{
  uint64_t v3;
  void *v4;
  CLKCComplicationDataSource *localDataSource;
  NTKTimelineRemoteDataSourceProvider *v6;
  void *v7;
  void *v8;
  CLKComplication *remoteComplication;
  NSDate *boundaryDate;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  _QWORD aBlock[5];

  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__NTKTimelineExtendDataOperation__extendRight__block_invoke;
  aBlock[3] = &unk_1E6BCEC00;
  aBlock[4] = self;
  v4 = _Block_copy(aBlock);
  localDataSource = self->super._localDataSource;
  if (localDataSource)
  {
    -[CLKCComplicationDataSource getTimelineEntriesAfterDate:limit:withHandler:](localDataSource, "getTimelineEntriesAfterDate:limit:withHandler:", self->_boundaryDate, 100, v4);
  }
  else
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__2;
    v18 = __Block_byref_object_dispose__2;
    v19 = 0;
    v6 = -[NTKTimelineRemoteDataSourceProvider initWithDataSource:]([NTKTimelineRemoteDataSourceProvider alloc], "initWithDataSource:", self->super._remoteDataSource);
    v7 = (void *)v15[5];
    v15[5] = (uint64_t)v6;

    v8 = (void *)v15[5];
    remoteComplication = self->super._remoteComplication;
    boundaryDate = self->_boundaryDate;
    v11[0] = v3;
    v11[1] = 3221225472;
    v11[2] = __46__NTKTimelineExtendDataOperation__extendRight__block_invoke_2;
    v11[3] = &unk_1E6BCEC28;
    v12 = v4;
    v13 = &v14;
    objc_msgSend(v8, "getEntriesForComplication:afterDate:limit:completion:", remoteComplication, boundaryDate, 100, v11);

    _Block_object_dispose(&v14, 8);
  }

}

void __46__NTKTimelineExtendDataOperation__extendRight__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "_finalizedValidEntries:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_invokeHandlerWithEntries:", v3);

}

void __46__NTKTimelineExtendDataOperation__extendRight__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_boundaryDate, 0);
}

@end
