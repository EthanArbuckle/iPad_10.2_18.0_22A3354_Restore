@implementation CHSProactiveService

- (CHSProactiveService)init
{
  void *v3;
  CHSProactiveService *v4;

  +[CHSChronoServicesConnection sharedInstance](CHSChronoServicesConnection, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CHSProactiveService initWithConnection:](self, "initWithConnection:", v3);

  return v4;
}

- (CHSProactiveService)initWithConnection:(id)a3
{
  id v5;
  CHSProactiveService *v6;
  CHSProactiveService *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHSProactiveService;
  v6 = -[CHSProactiveService init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_connection, a3);

  return v7;
}

- (void)loadSuggestedWidget:(id)a3 metrics:(id)a4 stackIdentifier:(id)a5 completion:(id)a6
{
  -[CHSChronoServicesConnection loadSuggestedWidget:metrics:stackIdentifier:reason:completion:](self->_connection, "loadSuggestedWidget:metrics:stackIdentifier:reason:completion:", a3, a4, a5, CFSTR("ProactiveService"), a6);
}

- (void)suggestionBudgetsForStackIdentifiers:(id)a3 completion:(id)a4
{
  -[CHSChronoServicesConnection suggestionBudgetsForStackIdentifiers:completion:](self->_connection, "suggestionBudgetsForStackIdentifiers:completion:", a3, a4);
}

- (void)loadSuggestedWidget:(id)a3 withMetrics:(id)a4 completion:(id)a5
{
  id v8;
  CHSChronoServicesConnection *connection;
  id v10;
  _QWORD v11[4];
  id v12;

  v8 = a5;
  connection = self->_connection;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__CHSProactiveService_loadSuggestedWidget_withMetrics_completion___block_invoke;
  v11[3] = &unk_1E2A5B650;
  v12 = v8;
  v10 = v8;
  -[CHSChronoServicesConnection loadSuggestedWidget:metrics:stackIdentifier:reason:completion:](connection, "loadSuggestedWidget:metrics:stackIdentifier:reason:completion:", a3, a4, CFSTR("deprecatedMethodUsed"), CFSTR("ProactiveService"), v11);

}

uint64_t __66__CHSProactiveService_loadSuggestedWidget_withMetrics_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
