@implementation GDEntityResolutionInProcessTextClient

- (GDEntityResolutionInProcessTextClient)initWithMode:(int64_t)a3 warmup:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  GDEntityResolutionInProcessTextClient *v8;
  GDEntityResolutionTextClientInner *v9;
  const char *v10;
  uint64_t v11;
  GDEntityResolutionTextClientInner *ecrClient;
  objc_super v14;

  v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)GDEntityResolutionInProcessTextClient;
  v8 = -[GDEntityResolutionInProcessTextClient init](&v14, sel_init);
  if (v8)
  {
    v9 = [GDEntityResolutionTextClientInner alloc];
    v11 = objc_msgSend_initFor_warmup_error_(v9, v10, a3, v6, a5);
    ecrClient = v8->ecrClient;
    v8->ecrClient = (GDEntityResolutionTextClientInner *)v11;

  }
  return v8;
}

- (void)warmupForMode:(int64_t)a3 completionHandler:(id)a4
{
  void (**v6)(id, uint64_t, id);
  const char *v7;
  uint64_t v8;
  id v9;
  id v10;

  v10 = 0;
  v6 = (void (**)(id, uint64_t, id))a4;
  v8 = objc_msgSend_warmupForMode_error_(self, v7, a3, &v10);
  v9 = v10;
  v6[2](v6, v8, v9);

}

- (BOOL)warmupForMode:(int64_t)a3 error:(id *)a4
{
  return MEMORY[0x1E0DE7D20](self->ecrClient, sel_warmupSyncFor_error_, a3);
}

- (GDEntityResolutionInProcessTextClient)initWithMode:(int64_t)a3 error:(id)a4
{
  GDEntityResolutionInProcessTextClient *v5;
  GDEntityResolutionTextClientInner *v6;
  const char *v7;
  uint64_t v8;
  GDEntityResolutionTextClientInner *ecrClient;
  objc_super v11;
  id v12;

  v11.receiver = self;
  v11.super_class = (Class)GDEntityResolutionInProcessTextClient;
  v12 = a4;
  v5 = -[GDEntityResolutionInProcessTextClient init](&v11, sel_init);
  if (v5)
  {
    v6 = [GDEntityResolutionTextClientInner alloc];
    v8 = objc_msgSend_initFor_warmup_error_(v6, v7, a3, 1, &v12);
    ecrClient = v5->ecrClient;
    v5->ecrClient = (GDEntityResolutionTextClientInner *)v8;

  }
  return v5;
}

- (id)initForMode:(int64_t)a3 error:(id *)a4
{
  GDEntityResolutionInProcessTextClient *v6;
  GDEntityResolutionTextClientInner *v7;
  const char *v8;
  uint64_t v9;
  GDEntityResolutionTextClientInner *ecrClient;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)GDEntityResolutionInProcessTextClient;
  v6 = -[GDEntityResolutionInProcessTextClient init](&v12, sel_init);
  if (v6)
  {
    v7 = [GDEntityResolutionTextClientInner alloc];
    v9 = objc_msgSend_initFor_warmup_error_(v7, v8, a3, 1, a4);
    ecrClient = v6->ecrClient;
    v6->ecrClient = (GDEntityResolutionTextClientInner *)v9;

  }
  return v6;
}

- (BOOL)cooldownWithError:(id *)a3
{
  return MEMORY[0x1E0DE7D20](self->ecrClient, sel_cooldownSyncAndReturnError_, a3);
}

- (id)resolveEntitiesForRequest:(id)a3 error:(id *)a4
{
  return (id)MEMORY[0x1E0DE7D20](self->ecrClient, sel_resolveEntitiesSyncForRequest_error_, a3);
}

- (id)resolveEntitiesForBatchRequests:(id)a3 error:(id *)a4
{
  return (id)MEMORY[0x1E0DE7D20](self->ecrClient, sel_resolveEntitiesSyncForBatchRequests_error_, a3);
}

- (id)generateMentionsForQuery:(id)a3 error:(id *)a4
{
  return (id)MEMORY[0x1E0DE7D20](self->ecrClient, sel_generateMentionsForQuery_error_, a3);
}

- (void)resolveEntitiesForRequest:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, void *, id);
  const char *v7;
  void *v8;
  id v9;
  id v10;

  v10 = 0;
  v6 = (void (**)(id, void *, id))a4;
  objc_msgSend_resolveEntitiesForRequest_error_(self, v7, (uint64_t)a3, &v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v10;
  v6[2](v6, v8, v9);

}

- (void)resolveEntitiesForBatchRequests:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, void *, id);
  const char *v7;
  void *v8;
  id v9;
  id v10;

  v10 = 0;
  v6 = (void (**)(id, void *, id))a4;
  objc_msgSend_resolveEntitiesForBatchRequests_error_(self, v7, (uint64_t)a3, &v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v10;
  v6[2](v6, v8, v9);

}

- (BOOL)recordDirectFeedbackWithEngagedIds:(id)a3 rejectedIds:(id)a4 ignored:(id)a5 neverPresented:(id)a6 error:(id *)a7
{
  return MEMORY[0x1E0DE7D20](self->ecrClient, sel_recordDirectFeedbackWithEngagedIds_rejectedIds_ignoredIds_neverPresentedIds_error_, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->ecrClient, 0);
}

@end
