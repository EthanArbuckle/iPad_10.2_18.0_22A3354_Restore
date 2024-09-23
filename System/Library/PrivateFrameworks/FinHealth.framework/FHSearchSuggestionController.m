@implementation FHSearchSuggestionController

- (FHSearchSuggestionController)initWithDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  FHSearchSuggestionController *v6;
  FHSearchSuggestionController *v7;
  objc_super v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  FinHealthLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[FHSearchSuggestionController initWithDelegate:]";
    _os_log_impl(&dword_228295000, v5, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  v9.receiver = self;
  v9.super_class = (Class)FHSearchSuggestionController;
  v6 = -[FHSearchSuggestionController init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_delegate, v4);
    -[FHSearchSuggestionController _init](v7, "_init");
  }

  return v7;
}

- (FHSearchSuggestionController)init
{
  NSObject *v3;
  FHSearchSuggestionController *v4;
  FHSearchSuggestionController *v5;
  objc_super v7;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  FinHealthLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[FHSearchSuggestionController init]";
    _os_log_impl(&dword_228295000, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  v7.receiver = self;
  v7.super_class = (Class)FHSearchSuggestionController;
  v4 = -[FHSearchSuggestionController init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[FHSearchSuggestionController _init](v4, "_init");
  return v5;
}

- (void)_init
{
  NSMutableArray *v3;
  NSMutableArray *instrumentationCache;

  self->_lockConnection._os_unfair_lock_opaque = 0;
  self->_lockCache._os_unfair_lock_opaque = 0;
  v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  instrumentationCache = self->_instrumentationCache;
  self->_instrumentationCache = v3;

}

- (void)dealloc
{
  NSObject *v3;
  NSXPCConnection *connection;
  objc_super v5;
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  FinHealthLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[FHSearchSuggestionController dealloc]";
    _os_log_impl(&dword_228295000, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  connection = self->_connection;
  if (connection)
    -[NSXPCConnection invalidate](connection, "invalidate");
  v5.receiver = self;
  v5.super_class = (Class)FHSearchSuggestionController;
  -[FHSearchSuggestionController dealloc](&v5, sel_dealloc);
}

- (void)transactionUpdated:(id)a3 deferFeatureComputation:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v5 = a4;
  v17 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = a3;
  FinHealthLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[FHSearchSuggestionController transactionUpdated:deferFeatureComputation:completion:]";
    _os_log_impl(&dword_228295000, v10, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  -[FHSearchSuggestionController _remoteObjectProxyWithErrorHandler](self, "_remoteObjectProxyWithErrorHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __86__FHSearchSuggestionController_transactionUpdated_deferFeatureComputation_completion___block_invoke;
  v13[3] = &unk_24F0DD920;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v11, "transactionUpdated:deferFeatureComputation:completion:", v9, v5, v13);

}

uint64_t __86__FHSearchSuggestionController_transactionUpdated_deferFeatureComputation_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)deleteDataForPassesWithSourceIdentifiers:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  FinHealthLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[FHSearchSuggestionController deleteDataForPassesWithSourceIdentifiers:completion:]";
    _os_log_impl(&dword_228295000, v8, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  -[FHSearchSuggestionController _remoteObjectProxyWithErrorHandler](self, "_remoteObjectProxyWithErrorHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __84__FHSearchSuggestionController_deleteDataForPassesWithSourceIdentifiers_completion___block_invoke;
  v11[3] = &unk_24F0DD948;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "deleteDataForPasses:completion:", v7, v11);

}

uint64_t __84__FHSearchSuggestionController_deleteDataForPassesWithSourceIdentifiers_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)deleteTransactionByTransactionIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  FinHealthLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[FHSearchSuggestionController deleteTransactionByTransactionIdentifier:completion:]";
    _os_log_impl(&dword_228295000, v8, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  -[FHSearchSuggestionController _remoteObjectProxyWithErrorHandler](self, "_remoteObjectProxyWithErrorHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __84__FHSearchSuggestionController_deleteTransactionByTransactionIdentifier_completion___block_invoke;
  v11[3] = &unk_24F0DD970;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "deleteTransactionById:completion:", v7, v11);

}

uint64_t __84__FHSearchSuggestionController_deleteTransactionByTransactionIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)deleteAllData:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  FinHealthLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[FHSearchSuggestionController deleteAllData:]";
    _os_log_impl(&dword_228295000, v5, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  -[FHSearchSuggestionController _remoteObjectProxyWithErrorHandler](self, "_remoteObjectProxyWithErrorHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __46__FHSearchSuggestionController_deleteAllData___block_invoke;
  v8[3] = &unk_24F0DD948;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "deleteAllData:", v8);

}

void __46__FHSearchSuggestionController_deleteAllData___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t, id);
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  if ((a2 & 1) != 0)
  {
    v4 = *(void (**)(uint64_t, uint64_t, id))(v3 + 16);
    v5 = a3;
    v4(v3, 1, v5);
  }
  else
  {
    v6 = (void *)MEMORY[0x24BDD1540];
    v7 = *MEMORY[0x24BE31440];
    v11 = *MEMORY[0x24BDD1398];
    v12[0] = a3;
    v8 = (void *)MEMORY[0x24BDBCE70];
    v9 = a3;
    objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 20002, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v10);

  }
}

- (void)featuresWithCompletion:(id)a3
{
  -[FHSearchSuggestionController featuresForApplication:withCompletion:](self, "featuresForApplication:withCompletion:", 0, a3);
}

- (void)featuresForApplication:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "processName");
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  FinHealthLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[FHSearchSuggestionController featuresForApplication:withCompletion:]";
    v17 = 2112;
    v18 = v8;
    _os_log_impl(&dword_228295000, v10, OS_LOG_TYPE_DEBUG, "%s process/application name: %@", buf, 0x16u);
  }

  -[FHSearchSuggestionController _remoteObjectProxyWithErrorHandler](self, "_remoteObjectProxyWithErrorHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __70__FHSearchSuggestionController_featuresForApplication_withCompletion___block_invoke;
  v13[3] = &unk_24F0DD998;
  v13[4] = self;
  v14 = v7;
  v12 = v7;
  objc_msgSend(v11, "featuresForApplication:withCompletion:", v8, v13);

}

uint64_t __70__FHSearchSuggestionController_featuresForApplication_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)fetchUserProperties:(id)a3 withParameters:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  FHSearchSuggestionController *v13;
  id v14;

  v7 = a3;
  v8 = a5;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __78__FHSearchSuggestionController_fetchUserProperties_withParameters_completion___block_invoke;
  v11[3] = &unk_24F0DD9C0;
  v13 = self;
  v14 = v8;
  v12 = v7;
  v9 = v8;
  v10 = v7;
  -[FHSearchSuggestionController featuresForApplication:withCompletion:](self, "featuresForApplication:withCompletion:", CFSTR("Messaging"), v11);

}

void __78__FHSearchSuggestionController_fetchUserProperties_withParameters_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  v5 = (void *)MEMORY[0x24BDD1758];
  v6 = *(_QWORD *)(a1 + 32);
  v7 = a2;
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("self IN %@"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "filteredArrayUsingPredicate:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryWithValuesForKeys:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = *(_QWORD *)(a1 + 48);
  if (v12)
    (*(void (**)(uint64_t, void *, id))(v12 + 16))(v12, v11, v13);

}

- (void)paymentRingSuggestionsFromSearchFeatures:(id)a3 startDate:(id)a4 endDate:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, void *);
  NSObject *v14;
  void *v15;
  void *v16;
  void (**v17)(id, void *);
  _QWORD v18[4];
  void (**v19)(id, void *);
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, void *))a6;
  if (!v10)
  {
    FinHealthLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[FHSearchSuggestionController paymentRingSuggestionsFromSearchFeatures:startDate:endDate:completion:]";
      _os_log_impl(&dword_228295000, v14, OS_LOG_TYPE_DEBUG, "applicationName cannot be nil %s", buf, 0xCu);
    }

    v15 = (void *)objc_opt_new();
    v13[2](v13, v15);

  }
  -[FHSearchSuggestionController _remoteObjectProxyWithErrorHandler](self, "_remoteObjectProxyWithErrorHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __102__FHSearchSuggestionController_paymentRingSuggestionsFromSearchFeatures_startDate_endDate_completion___block_invoke;
  v18[3] = &unk_24F0DD9E8;
  v19 = v13;
  v17 = v13;
  objc_msgSend(v16, "paymentRingSuggestionsFromSearchFeatures:startDate:endDate:completion:", v10, v11, v12, v18);

}

uint64_t __102__FHSearchSuggestionController_paymentRingSuggestionsFromSearchFeatures_startDate_endDate_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)featureResponsesForApplication:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "processName");
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  FinHealthLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[FHSearchSuggestionController featureResponsesForApplication:withCompletion:]";
    v19 = 2112;
    v20 = v8;
    _os_log_impl(&dword_228295000, v10, OS_LOG_TYPE_DEBUG, "%s %@", buf, 0x16u);
  }

  -[FHSearchSuggestionController _remoteObjectProxyWithErrorHandler](self, "_remoteObjectProxyWithErrorHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __78__FHSearchSuggestionController_featureResponsesForApplication_withCompletion___block_invoke;
  v14[3] = &unk_24F0DDA10;
  v15 = v6;
  v16 = v7;
  v14[4] = self;
  v12 = v6;
  v13 = v7;
  objc_msgSend(v11, "featureResponsesForApplication:completion:", v8, v14);

}

void __78__FHSearchSuggestionController_featureResponsesForApplication_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = *(_QWORD *)(a1 + 48);
    if (v7)
      (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
    FinHealthLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = 136315138;
      v10 = "-[FHSearchSuggestionController featureResponsesForApplication:withCompletion:]_block_invoke";
      _os_log_impl(&dword_228295000, v8, OS_LOG_TYPE_DEBUG, "%s sending next batch", (uint8_t *)&v9, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "featureResponsesForApplication:withCompletion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }

}

- (void)getDisputeDocumentSuggestionsForTransactionId:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[FHSearchSuggestionController _remoteObjectProxyWithErrorHandler](self, "_remoteObjectProxyWithErrorHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __89__FHSearchSuggestionController_getDisputeDocumentSuggestionsForTransactionId_completion___block_invoke;
  v10[3] = &unk_24F0DDA38;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "getDisputeDocumentSuggestionsForTransactionId:completion:", v7, v10);

}

uint64_t __89__FHSearchSuggestionController_getDisputeDocumentSuggestionsForTransactionId_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)sendAllTransactionFeatures
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  FinHealthLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = 136315138;
    v5 = "-[FHSearchSuggestionController sendAllTransactionFeatures]";
    _os_log_impl(&dword_228295000, v3, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v4, 0xCu);
  }

  -[FHSearchSuggestionController _sendAllTransactionFeatures:](self, "_sendAllTransactionFeatures:", 1);
}

- (void)reevaluateTransactionFeatures
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[6];
  _QWORD v8[5];
  id v9;
  id location;
  __int128 buf;
  uint64_t v12;
  char v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  FinHealthLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[FHSearchSuggestionController reevaluateTransactionFeatures]";
    _os_log_impl(&dword_228295000, v3, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&buf, 0xCu);
  }

  objc_initWeak(&location, self);
  -[FHSearchSuggestionController _clientConnection](self, "_clientConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __61__FHSearchSuggestionController_reevaluateTransactionFeatures__block_invoke;
  v8[3] = &unk_24F0DDA60;
  objc_copyWeak(&v9, &location);
  v8[4] = self;
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v12 = 0x2020000000;
  v13 = 1;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __61__FHSearchSuggestionController_reevaluateTransactionFeatures__block_invoke_64;
  v7[3] = &unk_24F0DDAB0;
  v7[4] = self;
  v7[5] = &buf;
  objc_msgSend(v6, "recomputeFeaturesForTransactions:", v7);
  _Block_object_dispose(&buf, 8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __61__FHSearchSuggestionController_reevaluateTransactionFeatures__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  FinHealthLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v3, "localizedDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412546;
    v14 = v6;
    v15 = 2112;
    v16 = (id)objc_opt_class();
    v7 = v16;
    _os_log_impl(&dword_228295000, v5, OS_LOG_TYPE_DEBUG, "Error getting remote proxy object: %@, [%@]", (uint8_t *)&v13, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "didUpdateFeatures:moreComing:readyForNextBatch:error:", 0, 0, 0, v3);

    }
  }

}

void __61__FHSearchSuggestionController_reevaluateTransactionFeatures__block_invoke_64(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  id v15;
  uint64_t v16;
  _QWORD v17[5];

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "count");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v7 == *MEMORY[0x24BE31598];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      {
        v17[0] = MEMORY[0x24BDAC760];
        v17[1] = 3221225472;
        v17[2] = __61__FHSearchSuggestionController_reevaluateTransactionFeatures__block_invoke_2;
        v17[3] = &unk_24F0DDA88;
        v17[4] = *(_QWORD *)(a1 + 32);
        v14 = v17;
        v15 = v5;
        v16 = 1;
      }
      else
      {
        v15 = v5;
        v16 = 0;
        v14 = 0;
      }
      objc_msgSend(v12, "didUpdateFeatures:moreComing:readyForNextBatch:error:", v15, v16, v14, v6);

    }
  }

}

uint64_t __61__FHSearchSuggestionController_reevaluateTransactionFeatures__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendAllTransactionFeatures:", 0);
}

- (void)_sendAllTransactionFeatures:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[6];
  _QWORD v10[5];
  id v11;
  id location;
  __int128 buf;
  uint64_t v14;
  char v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  FinHealthLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[FHSearchSuggestionController _sendAllTransactionFeatures:]";
    _os_log_impl(&dword_228295000, v5, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&buf, 0xCu);
  }

  objc_initWeak(&location, self);
  -[FHSearchSuggestionController _clientConnection](self, "_clientConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __60__FHSearchSuggestionController__sendAllTransactionFeatures___block_invoke;
  v10[3] = &unk_24F0DDA60;
  objc_copyWeak(&v11, &location);
  v10[4] = self;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v14 = 0x2020000000;
  v15 = 1;
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __60__FHSearchSuggestionController__sendAllTransactionFeatures___block_invoke_66;
  v9[3] = &unk_24F0DDAB0;
  v9[4] = self;
  v9[5] = &buf;
  objc_msgSend(v8, "getComputedFeaturesForTransactions:completion:", v3, v9);
  _Block_object_dispose(&buf, 8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __60__FHSearchSuggestionController__sendAllTransactionFeatures___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  FinHealthLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v3, "localizedDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412546;
    v14 = v6;
    v15 = 2112;
    v16 = (id)objc_opt_class();
    v7 = v16;
    _os_log_impl(&dword_228295000, v5, OS_LOG_TYPE_DEBUG, "Error getting remote proxy object: %@, [%@]", (uint8_t *)&v13, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "didUpdateFeatures:moreComing:readyForNextBatch:error:", 0, 0, 0, v3);

    }
  }

}

void __60__FHSearchSuggestionController__sendAllTransactionFeatures___block_invoke_66(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  id v15;
  uint64_t v16;
  _QWORD v17[5];

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "count");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v7 == *MEMORY[0x24BE31598];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      {
        v17[0] = MEMORY[0x24BDAC760];
        v17[1] = 3221225472;
        v17[2] = __60__FHSearchSuggestionController__sendAllTransactionFeatures___block_invoke_2;
        v17[3] = &unk_24F0DDA88;
        v17[4] = *(_QWORD *)(a1 + 32);
        v14 = v17;
        v15 = v5;
        v16 = 1;
      }
      else
      {
        v15 = v5;
        v16 = 0;
        v14 = 0;
      }
      objc_msgSend(v12, "didUpdateFeatures:moreComing:readyForNextBatch:error:", v15, v16, v14, v6);

    }
  }

}

uint64_t __60__FHSearchSuggestionController__sendAllTransactionFeatures___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendAllTransactionFeatures:", 0);
}

- (void)transactionsRequireSyncing
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  FinHealthLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315138;
    v6 = "-[FHSearchSuggestionController transactionsRequireSyncing]";
    _os_log_impl(&dword_228295000, v3, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v5, 0xCu);
  }

  -[FHSearchSuggestionController _remoteObjectProxyWithErrorHandler](self, "_remoteObjectProxyWithErrorHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transactionsRequireSyncing:", &__block_literal_global);

}

void __58__FHSearchSuggestionController_transactionsRequireSyncing__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  FinHealthLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v2, "localizedDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_228295000, v3, OS_LOG_TYPE_DEBUG, "transactionsRequireSyncing error :%@", (uint8_t *)&v5, 0xCu);

  }
}

- (void)recordUserInteraction:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  -[FHSearchSuggestionController _validateInstrumentationRecord:](self, "_validateInstrumentationRecord:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHSearchSuggestionController _remoteObjectProxyWithErrorHandler](self, "_remoteObjectProxyWithErrorHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordUserInteraction:completion:", v4, &__block_literal_global_67);
  FinHealthLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = 136315138;
    v8 = "-[FHSearchSuggestionController recordUserInteraction:]";
    _os_log_impl(&dword_228295000, v6, OS_LOG_TYPE_DEBUG, "Ended %s", (uint8_t *)&v7, 0xCu);
  }

}

- (id)_validateInstrumentationRecord:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    v9 = *MEMORY[0x24BE314D0];
    v10 = *MEMORY[0x24BE314D8];
    v19 = *MEMORY[0x24BE314C8];
    v18 = *MEMORY[0x24BE314B8];
    v17 = *MEMORY[0x24BE314B0];
    v16 = *MEMORY[0x24BE314C0];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v12, v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "isEqualToString:", v9)
          && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || objc_msgSend(v12, "isEqualToString:", v10)
          && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || objc_msgSend(v12, "isEqualToString:", v19)
          && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || objc_msgSend(v12, "isEqualToString:", v18)
          && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || objc_msgSend(v12, "isEqualToString:", v17)
          && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || objc_msgSend(v12, "isEqualToString:", v16)
          && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          objc_msgSend(v4, "setObject:forKey:", v13, v12);
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)_updateOrRecordCacheEntries:(id)a3 instrumentationCacheSize:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  os_unfair_lock_lock(&self->_lockCache);
  FinHealthLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v11 = 136315138;
    v12 = "-[FHSearchSuggestionController _updateOrRecordCacheEntries:instrumentationCacheSize:]";
    _os_log_impl(&dword_228295000, v7, OS_LOG_TYPE_DEBUG, "Started %s", (uint8_t *)&v11, 0xCu);
  }

  if (v6)
    -[NSMutableArray addObject:](self->_instrumentationCache, "addObject:", v6);
  if (-[NSMutableArray count](self->_instrumentationCache, "count") == a4)
  {
    self->_cacheConnectionInitiated = 1;
    -[FHSearchSuggestionController _remoteObjectProxyWithErrorHandler](self, "_remoteObjectProxyWithErrorHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)-[NSMutableArray copy](self->_instrumentationCache, "copy");
    objc_msgSend(v8, "recordUserInteractions:completion:", v9, &__block_literal_global_71);

    FinHealthLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = 136315138;
      v12 = "-[FHSearchSuggestionController _updateOrRecordCacheEntries:instrumentationCacheSize:]";
      _os_log_impl(&dword_228295000, v10, OS_LOG_TYPE_DEBUG, "Ended %s", (uint8_t *)&v11, 0xCu);
    }

    -[NSMutableArray removeAllObjects](self->_instrumentationCache, "removeAllObjects");
  }
  os_unfair_lock_unlock(&self->_lockCache);

}

void __85__FHSearchSuggestionController__updateOrRecordCacheEntries_instrumentationCacheSize___block_invoke()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  FinHealthLogObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    v1 = 136315138;
    v2 = "-[FHSearchSuggestionController _updateOrRecordCacheEntries:instrumentationCacheSize:]_block_invoke";
    _os_log_impl(&dword_228295000, v0, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v1, 0xCu);
  }

}

- (void)peerPaymentForecastingSignals:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  FinHealthLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[FHSearchSuggestionController peerPaymentForecastingSignals:withCompletion:]";
    _os_log_impl(&dword_228295000, v8, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  -[FHSearchSuggestionController _remoteObjectProxyWithErrorHandler](self, "_remoteObjectProxyWithErrorHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __77__FHSearchSuggestionController_peerPaymentForecastingSignals_withCompletion___block_invoke;
  v11[3] = &unk_24F0DDA38;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "peerPaymentForecastingSignals:withCompletion:", v7, v11);

}

uint64_t __77__FHSearchSuggestionController_peerPaymentForecastingSignals_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)allPeerPaymentForecastingSignals:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  FinHealthLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[FHSearchSuggestionController allPeerPaymentForecastingSignals:]";
    _os_log_impl(&dword_228295000, v5, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  -[FHSearchSuggestionController _remoteObjectProxyWithErrorHandler](self, "_remoteObjectProxyWithErrorHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __65__FHSearchSuggestionController_allPeerPaymentForecastingSignals___block_invoke;
  v9[3] = &unk_24F0DDA38;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v6, "peerPaymentForecastingSignals:withCompletion:", v7, v9);

}

uint64_t __65__FHSearchSuggestionController_allPeerPaymentForecastingSignals___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)updatePeerPaymentForecastingSuggestionStatus:(unint64_t)a3 counterpartHandle:(id)a4 amount:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  FinHealthLogObject();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[FHSearchSuggestionController updatePeerPaymentForecastingSuggestionStatus:counterpartHandle:amount:completion:]";
    _os_log_impl(&dword_228295000, v13, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  -[FHSearchSuggestionController _remoteObjectProxyWithErrorHandler](self, "_remoteObjectProxyWithErrorHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __113__FHSearchSuggestionController_updatePeerPaymentForecastingSuggestionStatus_counterpartHandle_amount_completion___block_invoke;
  v16[3] = &unk_24F0DD948;
  v17 = v10;
  v15 = v10;
  objc_msgSend(v14, "updatePeerPaymentForecastingSuggestionStatus:counterpartHandle:amount:completion:", a3, v12, v11, v16);

}

uint64_t __113__FHSearchSuggestionController_updatePeerPaymentForecastingSuggestionStatus_counterpartHandle_amount_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)updatePeerPaymentAccountBalanceWithTransactionSourceId:(id)a3 amount:(id)a4 currencyCode:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  FinHealthLogObject();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[FHSearchSuggestionController updatePeerPaymentAccountBalanceWithTransactionSourceId:amount:currencyCode:completion:]";
    _os_log_impl(&dword_228295000, v14, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  -[FHSearchSuggestionController _remoteObjectProxyWithErrorHandler](self, "_remoteObjectProxyWithErrorHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __118__FHSearchSuggestionController_updatePeerPaymentAccountBalanceWithTransactionSourceId_amount_currencyCode_completion___block_invoke;
  v17[3] = &unk_24F0DD948;
  v18 = v10;
  v16 = v10;
  objc_msgSend(v15, "updatePeerPaymentAccountBalanceWithTransactionSourceId:amount:currencyCode:completion:", v13, v12, v11, v17);

}

uint64_t __118__FHSearchSuggestionController_updatePeerPaymentAccountBalanceWithTransactionSourceId_amount_currencyCode_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)allFeatureInsightsWithStartDate:(id)a3 endDate:(id)a4 insightTypeItems:(id)a5 trendWindow:(int64_t)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v12 = a7;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  -[FHSearchSuggestionController _remoteObjectProxyWithErrorHandler](self, "_remoteObjectProxyWithErrorHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __112__FHSearchSuggestionController_allFeatureInsightsWithStartDate_endDate_insightTypeItems_trendWindow_completion___block_invoke;
  v18[3] = &unk_24F0DD9E8;
  v19 = v12;
  v17 = v12;
  objc_msgSend(v16, "allInsightsForDateRange:endDate:insightTypeItems:trendWindow:completion:", v15, v14, v13, a6, v18);

}

uint64_t __112__FHSearchSuggestionController_allFeatureInsightsWithStartDate_endDate_insightTypeItems_trendWindow_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getTopTransactionCategoriesWithTimeWindow:(unint64_t)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __85__FHSearchSuggestionController_getTopTransactionCategoriesWithTimeWindow_completion___block_invoke;
  v8[3] = &unk_24F0DDB78;
  v9 = v6;
  v7 = v6;
  -[FHSearchSuggestionController getTopTransactionCategoriesWithCountryCode:timeWindow:minRegularTransactionRatio:discretizedTimeOfDay:completion:](self, "getTopTransactionCategoriesWithCountryCode:timeWindow:minRegularTransactionRatio:discretizedTimeOfDay:completion:", 0, a3, 0, v8, 0.0);

}

uint64_t __85__FHSearchSuggestionController_getTopTransactionCategoriesWithTimeWindow_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getTopTransactionCategoriesWithCountryCode:(id)a3 timeWindow:(unint64_t)a4 minRegularTransactionRatio:(double)a5 discretizedTimeOfDay:(unint64_t)a6 completion:(id)a7
{
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v12 = a7;
  v13 = a3;
  -[FHSearchSuggestionController _remoteObjectProxyWithErrorHandler](self, "_remoteObjectProxyWithErrorHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __145__FHSearchSuggestionController_getTopTransactionCategoriesWithCountryCode_timeWindow_minRegularTransactionRatio_discretizedTimeOfDay_completion___block_invoke;
  v16[3] = &unk_24F0DDB78;
  v17 = v12;
  v15 = v12;
  objc_msgSend(v14, "getTopTransactionCategoriesWithCountryCode:timeWindow:minRegularTransactionRatio:discretizedTimeOfDay:completion:", v13, a4, a6, v16, a5);

}

uint64_t __145__FHSearchSuggestionController_getTopTransactionCategoriesWithCountryCode_timeWindow_minRegularTransactionRatio_discretizedTimeOfDay_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_clientConnection
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  FinHealthLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v8 = 136315138;
    v9 = "-[FHSearchSuggestionController _clientConnection]";
    _os_log_impl(&dword_228295000, v3, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v8, 0xCu);
  }

  os_unfair_lock_lock(&self->_lockConnection);
  -[FHSearchSuggestionController connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  FinHealthLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v6)
    {
      v8 = 136315138;
      v9 = "-[FHSearchSuggestionController _clientConnection]";
      _os_log_impl(&dword_228295000, v5, OS_LOG_TYPE_DEBUG, "%s, reusing _clientConnection", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    if (v6)
    {
      v8 = 136315138;
      v9 = "-[FHSearchSuggestionController _clientConnection]";
      _os_log_impl(&dword_228295000, v5, OS_LOG_TYPE_DEBUG, "%s, _clientConnection nil", (uint8_t *)&v8, 0xCu);
    }

    v5 = -[FHSearchSuggestionController _newClientConnection](self, "_newClientConnection");
    -[FHSearchSuggestionController setConnection:](self, "setConnection:", v5);
  }

  os_unfair_lock_unlock(&self->_lockConnection);
  -[FHSearchSuggestionController connection](self, "connection");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_newClientConnection
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  FinHealthLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[FHSearchSuggestionController _newClientConnection]";
    _os_log_impl(&dword_228295000, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", CFSTR("com.apple.FinHealth.FinHealthXPCServices"));
  -[FHSearchSuggestionController _remoteObjectInterface](self, "_remoteObjectInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRemoteObjectInterface:", v5);

  objc_initWeak((id *)buf, self);
  v6 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __52__FHSearchSuggestionController__newClientConnection__block_invoke;
  v13[3] = &unk_24F0DDBA0;
  objc_copyWeak(&v14, (id *)buf);
  objc_msgSend(v4, "setInvalidationHandler:", v13);
  v8 = v6;
  v9 = 3221225472;
  v10 = __52__FHSearchSuggestionController__newClientConnection__block_invoke_77;
  v11 = &unk_24F0DDBA0;
  objc_copyWeak(&v12, (id *)buf);
  objc_msgSend(v4, "setInterruptionHandler:", &v8);
  objc_msgSend(v4, "resume", v8, v9, v10, v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
  return v4;
}

void __52__FHSearchSuggestionController__newClientConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  FinHealthLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = 136315138;
    v4 = "-[FHSearchSuggestionController _newClientConnection]_block_invoke";
    _os_log_impl(&dword_228295000, v2, OS_LOG_TYPE_DEBUG, "[%s]: connection invalidated", (uint8_t *)&v3, 0xCu);
  }

  objc_msgSend(WeakRetained, "setConnection:", 0);
}

void __52__FHSearchSuggestionController__newClientConnection__block_invoke_77(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  FinHealthLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = 136315138;
    v4 = "-[FHSearchSuggestionController _newClientConnection]_block_invoke";
    _os_log_impl(&dword_228295000, v2, OS_LOG_TYPE_DEBUG, "[%s]: connection interrupted", (uint8_t *)&v3, 0xCu);
  }

  objc_msgSend(WeakRetained, "setConnection:", 0);
}

- (id)_remoteObjectInterface
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  void *v91;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2559761B8);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x24BDBCF20];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_featuresWithCompletion_, 0, 1);

  v13 = (void *)MEMORY[0x24BDBCF20];
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  v19 = objc_opt_class();
  v20 = objc_opt_class();
  v21 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v14, v15, v16, v17, v18, v19, v20, v21, objc_opt_class(), 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "setClasses:forSelector:argumentIndex:ofReply:", v22, sel_featuresForApplication_withCompletion_, 0, 1);

  v23 = (void *)MEMORY[0x24BDBCF20];
  v24 = objc_opt_class();
  v25 = objc_opt_class();
  v26 = objc_opt_class();
  v27 = objc_opt_class();
  v28 = objc_opt_class();
  v29 = objc_opt_class();
  objc_msgSend(v23, "setWithObjects:", v24, v25, v26, v27, v28, v29, objc_opt_class(), 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "setClasses:forSelector:argumentIndex:ofReply:", v30, sel_featureResponsesForApplication_completion_, 0, 1);

  v31 = (void *)MEMORY[0x24BDBCF20];
  v32 = objc_opt_class();
  v33 = objc_opt_class();
  v34 = objc_opt_class();
  v35 = objc_opt_class();
  v36 = objc_opt_class();
  v37 = objc_opt_class();
  objc_msgSend(v31, "setWithObjects:", v32, v33, v34, v35, v36, v37, objc_opt_class(), 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "setClasses:forSelector:argumentIndex:ofReply:", v38, sel_paymentRingSuggestionsFromSearchFeatures_startDate_endDate_completion_, 0, 1);

  v39 = (void *)MEMORY[0x24BDBCF20];
  v40 = objc_opt_class();
  v41 = objc_opt_class();
  v42 = objc_opt_class();
  v43 = objc_opt_class();
  v44 = objc_opt_class();
  v45 = objc_opt_class();
  objc_msgSend(v39, "setWithObjects:", v40, v41, v42, v43, v44, v45, objc_opt_class(), 0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "setClasses:forSelector:argumentIndex:ofReply:", v46, sel_recomputeFeaturesForTransactions_, 0, 1);

  v47 = (void *)MEMORY[0x24BDBCF20];
  v48 = objc_opt_class();
  v49 = objc_opt_class();
  v50 = objc_opt_class();
  v51 = objc_opt_class();
  v52 = objc_opt_class();
  v53 = objc_opt_class();
  objc_msgSend(v47, "setWithObjects:", v48, v49, v50, v51, v52, v53, objc_opt_class(), 0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "setClasses:forSelector:argumentIndex:ofReply:", v54, sel_getComputedFeaturesForTransactions_completion_, 0, 1);

  v90 = (void *)MEMORY[0x24BDBCF20];
  v89 = objc_opt_class();
  v88 = objc_opt_class();
  v87 = objc_opt_class();
  v86 = objc_opt_class();
  v85 = objc_opt_class();
  v55 = objc_opt_class();
  v56 = objc_opt_class();
  v57 = objc_opt_class();
  v58 = objc_opt_class();
  v59 = objc_opt_class();
  v60 = objc_opt_class();
  v61 = objc_opt_class();
  v62 = objc_opt_class();
  v63 = objc_opt_class();
  objc_msgSend(v90, "setWithObjects:", v89, v88, v87, v86, v85, v55, v56, v57, v58, v59, v60, v61, v62, v63, objc_opt_class(), 0);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "setClasses:forSelector:argumentIndex:ofReply:", v64, sel_peerPaymentForecastingSignals_withCompletion_, 0, 1);

  v65 = (void *)MEMORY[0x24BDBCF20];
  v66 = objc_opt_class();
  v67 = objc_opt_class();
  v68 = objc_opt_class();
  objc_msgSend(v65, "setWithObjects:", v66, v67, v68, objc_opt_class(), 0);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "setClasses:forSelector:argumentIndex:ofReply:", v69, sel_getDisputeDocumentSuggestionsForTransactionId_completion_, 0, 1);

  v70 = (void *)MEMORY[0x24BDBCF20];
  v71 = objc_opt_class();
  v72 = objc_opt_class();
  v73 = objc_opt_class();
  v74 = objc_opt_class();
  v75 = objc_opt_class();
  v76 = objc_opt_class();
  v77 = objc_opt_class();
  objc_msgSend(v70, "setWithObjects:", v71, v72, v73, v74, v75, v76, v77, objc_opt_class(), 0);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "setClasses:forSelector:argumentIndex:ofReply:", v78, sel_allInsightsForDateRange_endDate_insightTypeItems_trendWindow_completion_, 0, 1);

  v79 = (void *)MEMORY[0x24BDBCF20];
  v80 = objc_opt_class();
  v81 = objc_opt_class();
  v82 = objc_opt_class();
  objc_msgSend(v79, "setWithObjects:", v80, v81, v82, objc_opt_class(), 0);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "setClasses:forSelector:argumentIndex:ofReply:", v83, sel_getTopTransactionCategoriesWithCountryCode_timeWindow_minRegularTransactionRatio_discretizedTimeOfDay_completion_, 0, 1);

  return v91;
}

- (void)aggregateFeaturesWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  FinHealthLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[FHSearchSuggestionController aggregateFeaturesWithHandler:]";
    _os_log_impl(&dword_228295000, v5, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  -[FHSearchSuggestionController _remoteObjectProxyWithErrorHandler](self, "_remoteObjectProxyWithErrorHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __61__FHSearchSuggestionController_aggregateFeaturesWithHandler___block_invoke;
  v8[3] = &unk_24F0DDBC8;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "aggregateFeaturesWithHandler:", v8);

}

uint64_t __61__FHSearchSuggestionController_aggregateFeaturesWithHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)_remoteObjectProxyWithErrorHandler
{
  void *v3;
  void *v4;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  -[FHSearchSuggestionController _clientConnection](self, "_clientConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __66__FHSearchSuggestionController__remoteObjectProxyWithErrorHandler__block_invoke;
  v6[3] = &unk_24F0DDBF0;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);
  return v4;
}

void __66__FHSearchSuggestionController__remoteObjectProxyWithErrorHandler__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  id v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  FinHealthLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v3, "localizedDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v6;
    v10 = 2112;
    v11 = (id)objc_opt_class();
    v7 = v11;
    _os_log_impl(&dword_228295000, v5, OS_LOG_TYPE_DEBUG, "Error getting remote proxy object: %@, [%@]", (uint8_t *)&v8, 0x16u);

  }
}

- (FHSuggestionDelegate)delegate
{
  return (FHSuggestionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (os_unfair_lock_s)lockConnection
{
  return self->_lockConnection;
}

- (void)setLockConnection:(os_unfair_lock_s)a3
{
  self->_lockConnection = a3;
}

- (os_unfair_lock_s)lockCache
{
  return self->_lockCache;
}

- (void)setLockCache:(os_unfair_lock_s)a3
{
  self->_lockCache = a3;
}

- (BOOL)cacheConnectionInitiated
{
  return self->_cacheConnectionInitiated;
}

- (void)setCacheConnectionInitiated:(BOOL)a3
{
  self->_cacheConnectionInitiated = a3;
}

- (NSMutableArray)instrumentationCache
{
  return self->_instrumentationCache;
}

- (void)setInstrumentationCache:(id)a3
{
  objc_storeStrong((id *)&self->_instrumentationCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instrumentationCache, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
