@implementation GDEntityResolutionTextClient

- (GDEntityResolutionTextClient)init
{
  GDEntityResolutionTextClient *v2;
  GDXPCEntityResolutionService *v3;
  GDXPCEntityResolutionService *xpcClient;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GDEntityResolutionTextClient;
  v2 = -[GDEntityResolutionTextClient init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(GDXPCEntityResolutionService);
    xpcClient = v2->xpcClient;
    v2->xpcClient = v3;

  }
  return v2;
}

- (BOOL)warmupForMode:(int64_t)a3 error:(id *)a4
{
  return objc_msgSend_warmupForMode_error_(self->xpcClient, a2, a3, a4);
}

- (id)resolveEntitiesForRequest:(id)a3 error:(id *)a4
{
  return (id)MEMORY[0x1E0DE7D20](self->xpcClient, sel_submitQuery_withError_, a3);
}

- (id)generateMentionsForQuery:(id)a3 error:(id *)a4
{
  return (id)MEMORY[0x1E0DE7D20](self->xpcClient, sel_generateMentionsForQuery_error_, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->xpcClient, 0);
}

@end
