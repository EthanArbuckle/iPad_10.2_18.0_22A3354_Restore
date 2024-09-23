@implementation _ICInputContextManager

+ (id)sharedManager
{
  if (sharedManager_pred != -1)
    dispatch_once(&sharedManager_pred, &__block_literal_global);
  return (id)sharedManager_sharedInstance;
}

- (void)doInitLexiconManager
{
  void *v3;
  _ICLexiconManager *v4;
  _ICLexiconManaging *lexiconManager;
  id v6;

  if (!self->_lexiconManager)
  {
    v6 = (id)objc_opt_new();
    v3 = (void *)objc_opt_new();
    objc_msgSend(v6, "addObject:", v3);

    v4 = -[_ICLexiconManager initWithLexiconSources:]([_ICLexiconManager alloc], "initWithLexiconSources:", v6);
    lexiconManager = self->_lexiconManager;
    self->_lexiconManager = (_ICLexiconManaging *)v4;

  }
}

- (void)initLexiconManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44___ICInputContextManager_initLexiconManager__block_invoke;
  block[3] = &unk_24EF71548;
  block[4] = self;
  if (initLexiconManager_pred != -1)
    dispatch_once(&initLexiconManager_pred, block);
}

- (void)doInitPredictionManager
{
  void *v3;
  void *v4;
  void *v5;
  _ICPredictionManager *v6;
  _ICPredictionManager *predictionManager;
  id v8;

  if (!self->_predictionManager)
  {
    v8 = (id)objc_opt_new();
    v3 = (void *)objc_opt_new();
    objc_msgSend(v8, "addObject:", v3);

    v4 = (void *)objc_opt_new();
    objc_msgSend(v8, "addObject:", v4);

    v5 = (void *)objc_opt_new();
    objc_msgSend(v8, "addObject:", v5);

    v6 = -[_ICPredictionManager initWithPredictionSources:]([_ICPredictionManager alloc], "initWithPredictionSources:", v8);
    predictionManager = self->_predictionManager;
    self->_predictionManager = v6;

  }
}

- (void)initPredictionManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47___ICInputContextManager_initPredictionManager__block_invoke;
  block[3] = &unk_24EF71548;
  block[4] = self;
  if (initPredictionManager_pred != -1)
    dispatch_once(&initPredictionManager_pred, block);
}

- (id)getPredictionManager
{
  -[_ICInputContextManager initPredictionManager](self, "initPredictionManager");
  return self->_predictionManager;
}

- (id)getLexiconManager
{
  -[_ICInputContextManager initLexiconManager](self, "initLexiconManager");
  return self->_lexiconManager;
}

- (id)searchWithTriggers:(id)a3 application:(id)a4 recipient:(id)a5 localeIdentifier:(id)a6 timeoutInMilliseconds:(int)a7 resultLimit:(int)a8 error:(id *)a9
{
  uint64_t v9;
  uint64_t v10;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;

  v9 = *(_QWORD *)&a8;
  v10 = *(_QWORD *)&a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  -[_ICInputContextManager getPredictionManager](self, "getPredictionManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "searchWithTriggers:application:recipient:localeIdentifier:timeoutInMilliseconds:resultLimit:error:", v18, v17, v16, v15, v10, v9, a9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)lastCachedResultWithInitialCharacters:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[_ICInputContextManager getPredictionManager](self, "getPredictionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastCachedResultWithInitialCharacters:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)predictedItemSelected:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_ICInputContextManager getPredictionManager](self, "getPredictionManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predictedItemSelected:", v4);

}

- (void)reset
{
  id v2;

  -[_ICInputContextManager getPredictionManager](self, "getPredictionManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reset");

}

- (id)searchForMeCardRegions
{
  void *v2;
  void *v3;

  -[_ICInputContextManager getPredictionManager](self, "getPredictionManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchForMeCardRegions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)searchForMeCardEmailAddresses
{
  void *v2;
  void *v3;

  -[_ICInputContextManager getPredictionManager](self, "getPredictionManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchForMeCardEmailAddresses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)addContactObserver:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[_ICInputContextManager getLexiconManager](self, "getLexiconManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addContactObserver:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)removeContactObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_ICInputContextManager getLexiconManager](self, "getLexiconManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeContactObserver:", v4);

}

- (id)addNamedEntitiesUpdateObserver:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[_ICInputContextManager getLexiconManager](self, "getLexiconManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addNamedEntitiesUpdateObserver:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)removeNamedEntitiesUpdateObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_ICInputContextManager getLexiconManager](self, "getLexiconManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeNamedEntitiesUpdateObserver:", v4);

}

- (id)loadLexicons:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[_ICInputContextManager getLexiconManager](self, "getLexiconManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loadLexicons:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)loadLexiconsUsingFilter:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[_ICInputContextManager getLexiconManager](self, "getLexiconManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loadLexiconsUsingFilter:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)loadLexicons
{
  void *v2;
  void *v3;

  -[_ICInputContextManager getLexiconManager](self, "getLexiconManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "loadLexicons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)unloadLexicons
{
  id v2;

  -[_ICInputContextManager getLexiconManager](self, "getLexiconManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unloadLexicons");

}

- (void)warmUp
{
  void *v3;
  id v4;

  -[_ICInputContextManager getPredictionManager](self, "getPredictionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "warmUp");

  -[_ICInputContextManager getLexiconManager](self, "getLexiconManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "warmUp");

}

- (void)hibernate
{
  void *v3;
  id v4;

  -[_ICInputContextManager getPredictionManager](self, "getPredictionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hibernate");

  -[_ICInputContextManager getLexiconManager](self, "getLexiconManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hibernate");

}

- (_ICInputContextManager)initWithPredictionSource:(id)a3
{
  id v4;
  _ICInputContextManager *v5;
  _ICPredictionManager *v6;
  void *v7;
  uint64_t v8;
  _ICPredictionManager *predictionManager;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[_ICInputContextManager init](self, "init");
  if (v5)
  {
    v6 = [_ICPredictionManager alloc];
    v11[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[_ICPredictionManager initWithPredictionSources:](v6, "initWithPredictionSources:", v7);
    predictionManager = v5->_predictionManager;
    v5->_predictionManager = (_ICPredictionManager *)v8;

  }
  return v5;
}

- (id)initForIntegrationTesting
{
  _ICInputContextManager *v2;
  _ICInputContextManager *v3;

  v2 = -[_ICInputContextManager init](self, "init");
  v3 = v2;
  if (v2)
  {
    -[_ICInputContextManager doInitLexiconManager](v2, "doInitLexiconManager");
    -[_ICInputContextManager doInitPredictionManager](v3, "doInitPredictionManager");
  }
  return v3;
}

- (void)provideLexiconFeedbackForString:(id)a3 type:(unsigned __int8)a4 style:(unsigned __int8)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[_ICLexiconManaging provideFeedbackForString:type:style:](self->_lexiconManager, "provideFeedbackForString:type:style:", v8, v6, v5);

}

- (void)providePredictionFeedbackForString:(id)a3 type:(unsigned __int8)a4 style:(unsigned __int8)a5
{
  -[_ICPredictionManager provideFeedbackForString:type:style:](self->_predictionManager, "provideFeedbackForString:type:style:", a3, a4, a5);
}

- (id)searchWithTriggers:(id)a3 application:(id)a4 recipient:(id)a5 localeIdentifier:(id)a6 isResponseDenyListed:(BOOL)a7 shouldDisableAutoCaps:(BOOL)a8 timeoutInMilliseconds:(int)a9 resultLimit:(int)a10 error:(id *)a11
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictionManager, 0);
  objc_storeStrong((id *)&self->_lexiconManager, 0);
}

@end
