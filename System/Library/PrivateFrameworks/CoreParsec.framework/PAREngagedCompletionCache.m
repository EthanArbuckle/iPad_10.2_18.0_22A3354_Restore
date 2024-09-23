@implementation PAREngagedCompletionCache

- (void)addCompletion:(id)a3 forInput:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[PARSession sharedSession](PARSession, "sharedSession");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addCompletion:forInput:", v6, v5);

}

- (void)clearEngagementsFromDate:(id)a3 toDate:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[PARSession sharedSession](PARSession, "sharedSession");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clearEngagementsFromDate:toDate:", v6, v5);

}

- (void)clearAllEngagements
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PAREngagedCompletionCache clearEngagementsFromDate:toDate:](self, "clearEngagementsFromDate:toDate:", v4, v3);

}

- (void)clearEngagementsWithTitle:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[PARSession sharedSession](PARSession, "sharedSession");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearEngagementsWithTitle:type:", v3, 0);

}

- (void)clearEngagementsWithTitle:(id)a3 type:(int)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  +[PARSession sharedSession](PARSession, "sharedSession");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clearEngagementsWithTitle:type:", v5, v6);

}

- (void)addEngagedResults:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[PARSession sharedSession](PARSession, "sharedSession");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEngagedResults:completion:", v3, 0);

}

- (void)topEngagedResultsForInput:(id)a3 maxAmount:(int64_t)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a3;
  +[PARSession sharedSession](PARSession, "sharedSession");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "topEngagedResultsForInput:maxAmount:completion:", v8, a4, v7);

}

- (void)updateParametersForSmartSearchV1:(id)a3 smartSearchV2:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[PARSession sharedSession](PARSession, "sharedSession");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateParametersForSmartSearchV1:smartSearchV2:", v6, v5);

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  return (id)sharedInstance_sharedInstance;
}

void __43__PAREngagedCompletionCache_sharedInstance__block_invoke()
{
  PAREngagedCompletionCache *v0;
  void *v1;

  v0 = objc_alloc_init(PAREngagedCompletionCache);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

@end
