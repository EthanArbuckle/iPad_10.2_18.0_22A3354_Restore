@implementation NTKTimelineSetupOperation

- (void)_cancel
{
  -[NTKTimelineSetupOperation setHandler:](self, "setHandler:", 0);
}

- (void)_getEndDate
{
  uint64_t v3;
  void *v4;
  void *v5;
  CLKCComplicationDataSource *localDataSource;
  _QWORD v7[5];
  _QWORD aBlock[5];

  if (!-[NTKTimelineDataOperation canceled](self, "canceled"))
  {
    v3 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __40__NTKTimelineSetupOperation__getEndDate__block_invoke;
    aBlock[3] = &unk_1E6BCEB38;
    aBlock[4] = self;
    v4 = _Block_copy(aBlock);
    v7[0] = v3;
    v7[1] = 3221225472;
    v7[2] = __40__NTKTimelineSetupOperation__getEndDate__block_invoke_2;
    v7[3] = &unk_1E6BCEB38;
    v7[4] = self;
    v5 = _Block_copy(v7);
    localDataSource = self->super._localDataSource;
    if (localDataSource)
      -[CLKCComplicationDataSource getTimelineEndDateWithHandler:](localDataSource, "getTimelineEndDateWithHandler:", v4);
    else
      -[CLKComplicationDataSource getTimelineEndDateForComplication:withHandler:](self->super._remoteDataSource, "getTimelineEndDateForComplication:withHandler:", self->super._remoteComplication, v5);

  }
}

void __40__NTKTimelineSetupOperation__getEndDate__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), a2);
  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_getCurrentEntry");

}

void __40__NTKTimelineSetupOperation__getEndDate__block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), a2);
  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_getPrivacyBehavior");

}

- (void)_getPrivacyBehavior
{
  void *v3;
  _QWORD aBlock[5];

  if (!-[NTKTimelineDataOperation canceled](self, "canceled"))
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __48__NTKTimelineSetupOperation__getPrivacyBehavior__block_invoke;
    aBlock[3] = &unk_1E6BCEB60;
    aBlock[4] = self;
    v3 = _Block_copy(aBlock);
    -[CLKComplicationDataSource getPrivacyBehaviorForComplication:withHandler:](self->super._remoteDataSource, "getPrivacyBehaviorForComplication:withHandler:", self->super._remoteComplication, v3);

  }
}

uint64_t __48__NTKTimelineSetupOperation__getPrivacyBehavior__block_invoke(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = a2;
  return objc_msgSend(*(id *)(a1 + 32), "_getTimelineAnimationBehavior");
}

- (void)_getTimelineAnimationBehavior
{
  void *v3;
  _QWORD aBlock[5];

  if (!-[NTKTimelineDataOperation canceled](self, "canceled"))
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__NTKTimelineSetupOperation__getTimelineAnimationBehavior__block_invoke;
    aBlock[3] = &unk_1E6BCEB60;
    aBlock[4] = self;
    v3 = _Block_copy(aBlock);
    -[CLKComplicationDataSource getTimelineAnimationBehaviorForComplication:withHandler:](self->super._remoteDataSource, "getTimelineAnimationBehaviorForComplication:withHandler:", self->super._remoteComplication, v3);

  }
}

uint64_t __58__NTKTimelineSetupOperation__getTimelineAnimationBehavior__block_invoke(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = a2;
  return objc_msgSend(*(id *)(a1 + 32), "_getCurrentEntry");
}

- (void)_getCurrentEntry
{
  uint64_t v3;
  void *v4;
  CLKCComplicationDataSource *localDataSource;
  NTKTimelineRemoteDataSourceProvider *v6;
  void *v7;
  void *v8;
  CLKComplication *remoteComplication;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  _QWORD aBlock[5];

  if (!-[NTKTimelineDataOperation canceled](self, "canceled"))
  {
    v3 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __45__NTKTimelineSetupOperation__getCurrentEntry__block_invoke;
    aBlock[3] = &unk_1E6BCEB88;
    aBlock[4] = self;
    v4 = _Block_copy(aBlock);
    localDataSource = self->super._localDataSource;
    if (localDataSource)
    {
      -[CLKCComplicationDataSource getCurrentTimelineEntryWithHandler:](localDataSource, "getCurrentTimelineEntryWithHandler:", v4);
    }
    else
    {
      v13 = 0;
      v14 = &v13;
      v15 = 0x3032000000;
      v16 = __Block_byref_object_copy__2;
      v17 = __Block_byref_object_dispose__2;
      v18 = 0;
      v6 = -[NTKTimelineRemoteDataSourceProvider initWithDataSource:]([NTKTimelineRemoteDataSourceProvider alloc], "initWithDataSource:", self->super._remoteDataSource);
      v7 = (void *)v14[5];
      v14[5] = (uint64_t)v6;

      v8 = (void *)v14[5];
      remoteComplication = self->super._remoteComplication;
      v10[0] = v3;
      v10[1] = 3221225472;
      v10[2] = __45__NTKTimelineSetupOperation__getCurrentEntry__block_invoke_33;
      v10[3] = &unk_1E6BCEBB0;
      v11 = v4;
      v12 = &v13;
      objc_msgSend(v8, "getCurrentEntryForComplication:completion:", remoteComplication, v10);

      _Block_object_dispose(&v13, 8);
    }

  }
}

void __45__NTKTimelineSetupOperation__getCurrentEntry__block_invoke(uint64_t a1, void *a2)
{
  int v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "_validateEntry:");
  if (v3)
  {
    objc_msgSend(v5, "finalizedCopy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), v4);
  if (v3)

  objc_msgSend(*(id *)(a1 + 32), "_getAlwaysOnTemplate");
}

void __45__NTKTimelineSetupOperation__getCurrentEntry__block_invoke_33(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

- (void)_getAlwaysOnTemplate
{
  void *v3;
  void *v4;
  void (**v5)(void *, void *);
  CLKCComplicationDataSource *localDataSource;
  void *v7;
  _QWORD aBlock[5];

  if (!-[NTKTimelineDataOperation canceled](self, "canceled"))
  {
    +[CLKRenderingContext sharedRenderingContext](NTKFaceViewRenderingContext, "sharedRenderingContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "device");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v4, "supportsTritium") & 1) != 0)
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __49__NTKTimelineSetupOperation__getAlwaysOnTemplate__block_invoke;
      aBlock[3] = &unk_1E6BCEBD8;
      aBlock[4] = self;
      v5 = (void (**)(void *, void *))_Block_copy(aBlock);
      localDataSource = self->super._localDataSource;
      if (localDataSource)
      {
        -[CLKCComplicationDataSource alwaysOnTemplate](localDataSource, "alwaysOnTemplate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v5[2](v5, v7);

      }
      else
      {
        -[CLKComplicationDataSource getAlwaysOnTemplateForComplication:withHandler:](self->super._remoteDataSource, "getAlwaysOnTemplateForComplication:withHandler:", self->super._remoteComplication, v5);
      }

    }
    else
    {
      -[NTKTimelineSetupOperation _invokeHandler](self, "_invokeHandler");
    }

  }
}

void __49__NTKTimelineSetupOperation__getAlwaysOnTemplate__block_invoke(uint64_t a1, void *a2)
{
  int v3;
  void *v4;
  id v5;

  v5 = a2;
  if (v5)
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "_validateTemplate:", v5);
    if (v3)
    {
      objc_msgSend(v5, "finalizedCopy");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 72), v4);
    if (v3)

  }
  objc_msgSend(*(id *)(a1 + 32), "_invokeHandler");

}

- (void)_invokeHandler
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__NTKTimelineSetupOperation__invokeHandler__block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __43__NTKTimelineSetupOperation__invokeHandler__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(result + 80))
  {
    result = objc_msgSend((id)result, "canceled");
    if ((result & 1) == 0)
      return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) + 16))();
  }
  return result;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_alwaysOnTemplate, 0);
  objc_storeStrong((id *)&self->_currentEntry, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
}

@end
