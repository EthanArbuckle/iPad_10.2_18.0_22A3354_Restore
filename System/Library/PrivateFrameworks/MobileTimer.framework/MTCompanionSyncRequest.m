@implementation MTCompanionSyncRequest

+ (MTCompanionSyncRequest)requestWithType:(unint64_t)a3
{
  return (MTCompanionSyncRequest *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithRequestType:", a3);
}

- (MTCompanionSyncRequest)initWithRequestType:(unint64_t)a3
{
  MTCompanionSyncRequest *v4;
  MTCompanionSyncRequest *v5;
  uint64_t v6;
  NSMutableArray *completionBlocks;
  uint64_t v8;
  NAScheduler *serializer;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MTCompanionSyncRequest;
  v4 = -[MTCompanionSyncRequest init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_requestType = a3;
    v6 = objc_opt_new();
    completionBlocks = v5->_completionBlocks;
    v5->_completionBlocks = (NSMutableArray *)v6;

    +[MTScheduler serialSchedulerWithName:priority:](MTScheduler, "serialSchedulerWithName:priority:", CFSTR("com.apple.MTCompanionSyncRequest.serialqueue"), +[MTScheduler defaultPriority](MTScheduler, "defaultPriority"));
    v8 = objc_claimAutoreleasedReturnValue();
    serializer = v5->_serializer;
    v5->_serializer = (NAScheduler *)v8;

  }
  return v5;
}

- (void)complete:(id)a3
{
  id v4;
  NAScheduler *serializer;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  serializer = self->_serializer;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__MTCompanionSyncRequest_complete___block_invoke;
  v7[3] = &unk_1E39CB7B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NAScheduler performBlock:](serializer, "performBlock:", v7);

}

void __35__MTCompanionSyncRequest_complete___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 8))
  {
    v3 = *(void **)(v1 + 32);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __35__MTCompanionSyncRequest_complete___block_invoke_2;
    v5[3] = &unk_1E39CEF08;
    v6 = *(id *)(a1 + 40);
    objc_msgSend(v3, "na_each:", v5);
    v4 = *(void **)(a1 + 40);
    if (!v4)
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
      v4 = *(void **)(a1 + 40);
    }
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), v4);

  }
}

uint64_t __35__MTCompanionSyncRequest_complete___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32));
}

- (void)addCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  NAScheduler *serializer;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    serializer = self->_serializer;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __45__MTCompanionSyncRequest_addCompletionBlock___block_invoke;
    v7[3] = &unk_1E39CB880;
    v7[4] = self;
    v8 = v4;
    -[NAScheduler performBlock:](serializer, "performBlock:", v7);

  }
}

void __45__MTCompanionSyncRequest_addCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 8)
    || (v3 = *(void **)(v2 + 32),
        v4 = (void *)MEMORY[0x19AED0080](*(_QWORD *)(a1 + 40)),
        objc_msgSend(v3, "addObject:", v4),
        v4,
        v5 = *(_QWORD *)(a1 + 32),
        *(_BYTE *)(v5 + 8))
    || *(_QWORD *)(v5 + 24))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MTCompanionSyncRequest requestDescription](self, "requestDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@ >"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)requestDescription
{
  return CFSTR("DELTA");
}

- (unint64_t)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(unint64_t)a3
{
  self->_requestType = a3;
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (NSMutableArray)completionBlocks
{
  return self->_completionBlocks;
}

- (void)setCompletionBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_completionBlocks, a3);
}

- (NAScheduler)serializer
{
  return self->_serializer;
}

- (void)setSerializer:(id)a3
{
  objc_storeStrong((id *)&self->_serializer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializer, 0);
  objc_storeStrong((id *)&self->_completionBlocks, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
