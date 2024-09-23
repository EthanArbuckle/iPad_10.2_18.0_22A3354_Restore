@implementation GDViewService

+ (id)clientService
{
  if (qword_1ED327078 != -1)
    dispatch_once(&qword_1ED327078, &unk_1E5DD9A38);
  return (id)qword_1ED327220;
}

- (id)visualIdentifierViewWithError:(id *)a3
{
  return (id)MEMORY[0x1E0DE7D20](self->_swiftViewService, sel_visualIdentifierViewAndReturnError_, a3);
}

- (GDViewService)initWithSwiftViewService:(id)a3
{
  id v5;
  GDViewService *v6;
  GDViewService *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GDViewService;
  v6 = -[GDViewService init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_swiftViewService, a3);

  return v7;
}

- (id)personViewWithError:(id *)a3
{
  return (id)MEMORY[0x1E0DE7D20](self->_swiftViewService, sel_personViewAndReturnError_, a3);
}

- (id)donationViewWithError:(id *)a3
{
  return (id)MEMORY[0x1E0DE7D20](self->_swiftViewService, sel_donationViewAndReturnError_, a3);
}

- (id)pageRankViewWithError:(id *)a3
{
  return (id)MEMORY[0x1E0DE7D20](self->_swiftViewService, sel_pageRankViewAndReturnError_, a3);
}

- (id)featureViewWithError:(id *)a3
{
  return (id)MEMORY[0x1E0DE7D20](self->_swiftViewService, sel_gdFeatureViewAndReturnError_, a3);
}

- (id)firstPartyLongTermTopicViewWithError:(id *)a3
{
  return (id)MEMORY[0x1E0DE7D20](self->_swiftViewService, sel_firstPartyLongTermTopicViewAndReturnError_, a3);
}

- (id)firstPartyShortTermTopicViewWithError:(id *)a3
{
  return (id)MEMORY[0x1E0DE7D20](self->_swiftViewService, sel_firstPartyShortTermTopicViewAndReturnError_, a3);
}

- (id)subgraphViewContextWithViewName:(id)a3 tableName:(id)a4 error:(id *)a5
{
  void *v5;
  GDSubgraphViewContext *v6;
  const char *v7;
  void *v8;

  objc_msgSend_gdSwiftSubgraphViewContextWithName_tableName_error_(self->_swiftViewService, a2, (uint64_t)a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = [GDSubgraphViewContext alloc];
    v8 = (void *)objc_msgSend_initWithInner_(v6, v7, (uint64_t)v5);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)autonamingViewWithViewName:(id)a3 error:(id *)a4
{
  void *v4;
  GDAutonamingView *v5;
  const char *v6;
  void *v7;

  objc_msgSend_autonamingViewWithViewName_error_(self->_swiftViewService, a2, (uint64_t)a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = [GDAutonamingView alloc];
    v7 = (void *)objc_msgSend_initWithInner_(v5, v6, (uint64_t)v4);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swiftViewService, 0);
}

@end
