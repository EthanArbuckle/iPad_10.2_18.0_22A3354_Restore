@implementation NTKTimelineUpdateEndDateOperation

- (void)_getEndDate
{
  void *v3;
  CLKCComplicationDataSource *localDataSource;
  _QWORD aBlock[5];

  if (!-[NTKTimelineDataOperation canceled](self, "canceled"))
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __48__NTKTimelineUpdateEndDateOperation__getEndDate__block_invoke;
    aBlock[3] = &unk_1E6BCEB38;
    aBlock[4] = self;
    v3 = _Block_copy(aBlock);
    localDataSource = self->super._localDataSource;
    if (localDataSource)
      -[CLKCComplicationDataSource getTimelineEndDateWithHandler:](localDataSource, "getTimelineEndDateWithHandler:", v3);
    else
      -[CLKComplicationDataSource getTimelineEndDateForComplication:withHandler:](self->super._remoteDataSource, "getTimelineEndDateForComplication:withHandler:", self->super._remoteComplication, v3);

  }
}

void __48__NTKTimelineUpdateEndDateOperation__getEndDate__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), a2);
  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_invokeHandler");

}

- (void)_cancel
{
  -[NTKTimelineUpdateEndDateOperation setHandler:](self, "setHandler:", 0);
}

- (void)_invokeHandler
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__NTKTimelineUpdateEndDateOperation__invokeHandler__block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __51__NTKTimelineUpdateEndDateOperation__invokeHandler__block_invoke(uint64_t a1)
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
  objc_storeStrong((id *)&self->_endDate, 0);
}

@end
