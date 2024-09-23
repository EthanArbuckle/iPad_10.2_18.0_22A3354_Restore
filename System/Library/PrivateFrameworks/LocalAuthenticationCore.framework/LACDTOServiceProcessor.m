@implementation LACDTOServiceProcessor

- (LACDTOServiceProcessor)initWithSubprocessors:(id)a3
{
  id v4;
  LACDTOServiceProcessor *v5;
  uint64_t v6;
  LACEvaluationRequestProcessor *compoundProcessor;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LACDTOServiceProcessor;
  v5 = -[LACDTOServiceProcessor init](&v9, sel_init);
  if (v5)
  {
    +[LACEvaluationRequestProcessorFactory makeProcessorWithSubprocessors:](LACEvaluationRequestProcessorFactory, "makeProcessorWithSubprocessors:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    compoundProcessor = v5->_compoundProcessor;
    v5->_compoundProcessor = (LACEvaluationRequestProcessor *)v6;

  }
  return v5;
}

- (BOOL)canProcessRequest:(id)a3
{
  id v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (LACPolicyIsLocationBasedPolicy(objc_msgSend(v3, "policy")))
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(v3, "options");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1068);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v7, "BOOLValue");

  }
  return v4;
}

- (void)processRequest:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v21 = a4;
  v9 = (void (**)(id, void *))a5;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[LACDTOServiceProcessor _entitlementsForRequest:](self, "_entitlementsForRequest:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v23;
    while (2)
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v14);
        objc_msgSend(v8, "client");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "checkEntitlement:", v15);

        if ((v17 & 1) == 0)
        {
          +[LACError missingEntitlementError:](LACError, "missingEntitlementError:", v15);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          +[LACEvaluationResult resultWithFailure:](LACEvaluationResult, "resultWithFailure:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v9[2](v9, v20);

          v18 = v21;
          goto LABEL_11;
        }
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v12)
        continue;
      break;
    }
  }

  v18 = v21;
  -[LACEvaluationRequestProcessor processRequest:configuration:completion:](self->_compoundProcessor, "processRequest:configuration:completion:", v8, v21, v9);
LABEL_11:

}

- (void)postProcessRequest:(id)a3 result:(id)a4 completion:(id)a5
{
  void (**v8)(id, id);
  id v9;
  id v10;

  v10 = a3;
  v8 = (void (**)(id, id))a5;
  v9 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[LACEvaluationRequestProcessor postProcessRequest:result:completion:](self->_compoundProcessor, "postProcessRequest:result:completion:", v10, v9, v8);
  else
    v8[2](v8, v9);

}

- (id)_entitlementsForRequest:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v17[0] = CFSTR("com.apple.private.CoreAuthentication.SPI");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithArray:", v5);

  if (objc_msgSend(v3, "policy") == 1026)
    objc_msgSend(v6, "addObject:", CFSTR("com.apple.private.LocalAuthentication.DTO"));
  objc_msgSend(v3, "options");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1061);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v6, "addObject:", CFSTR("com.apple.private.LocalAuthentication.DTO.ShortExpiration"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1062);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v6, "addObject:", CFSTR("com.apple.private.LocalAuthentication.DTO.FallbackToNoAuth"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1068);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    objc_msgSend(v6, "addObject:", CFSTR("com.apple.private.LocalAuthentication.DTO.FallbackToNoAuth"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1085);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    objc_msgSend(v6, "addObject:", CFSTR("com.apple.private.LocalAuthentication.DTO.AllowUnapprovedSensor"));

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compoundProcessor, 0);
}

@end
