@implementation FHExperiment

- (FHExperiment)initWithNamespaceName:(id)a3
{
  return -[FHExperiment initWithClient:namespaceName:setRefresh:delegate:](self, "initWithClient:namespaceName:setRefresh:delegate:", 0, a3, 0, 0);
}

- (FHExperiment)initWithClient:(id)a3 namespaceName:(id)a4
{
  return -[FHExperiment initWithClient:namespaceName:setRefresh:delegate:](self, "initWithClient:namespaceName:setRefresh:delegate:", a3, a4, 0, 0);
}

- (FHExperiment)initWithClient:(id)a3 namespaceName:(id)a4 setRefresh:(BOOL)a5 delegate:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  FHExperiment *v13;
  TRIClient *v14;
  TRIClient *triClient;
  uint64_t v16;
  NSString *namespaceName;
  NSDictionary *v18;
  NSDictionary *factorMetadatas;
  TRIClient *v20;
  id v21;
  _QWORD v23[4];
  id v24;
  id v25;
  id location;
  objc_super v27;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v27.receiver = self;
  v27.super_class = (Class)FHExperiment;
  v13 = -[FHExperiment init](&v27, sel_init);
  if (v13)
  {
    if (v10)
    {
      v14 = (TRIClient *)v10;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBA908], "clientWithIdentifier:", 326);
      v14 = (TRIClient *)objc_claimAutoreleasedReturnValue();
    }
    triClient = v13->_triClient;
    v13->_triClient = v14;

    v16 = objc_msgSend(v11, "copy");
    namespaceName = v13->_namespaceName;
    v13->_namespaceName = (NSString *)v16;

    v18 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCE70]);
    factorMetadatas = v13->_factorMetadatas;
    v13->_factorMetadatas = v18;

    objc_storeWeak((id *)&v13->_delegate, v12);
    if (v7)
    {
      objc_initWeak(&location, v13);
      v20 = v13->_triClient;
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __65__FHExperiment_initWithClient_namespaceName_setRefresh_delegate___block_invoke;
      v23[3] = &unk_250C66A38;
      objc_copyWeak(&v25, &location);
      v24 = v11;
      v21 = (id)-[TRIClient addUpdateHandlerForNamespaceName:usingBlock:](v20, "addUpdateHandlerForNamespaceName:usingBlock:", v24, v23);

      objc_destroyWeak(&v25);
      objc_destroyWeak(&location);
    }
  }

  return v13;
}

void __65__FHExperiment_initWithClient_namespaceName_setRefresh_delegate___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  FinHealthLogObject(CFSTR("FinHealthCore"));
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v10 = 136315394;
    v11 = "-[FHExperiment initWithClient:namespaceName:setRefresh:delegate:]_block_invoke";
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_23B4A2000, v3, OS_LOG_TYPE_DEBUG, "%s Trial update for namespace: %@", (uint8_t *)&v10, 0x16u);
  }

  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "refresh");
    objc_msgSend(WeakRetained, "delegate");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      objc_msgSend(WeakRetained, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_opt_respondsToSelector();

      if ((v8 & 1) != 0)
      {
        objc_msgSend(WeakRetained, "delegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "updateFactors");

      }
    }
  }

}

- (void)refresh
{
  -[TRIClient refresh](self->_triClient, "refresh");
}

- (id)getLevelForFactor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  NSString *namespaceName;
  void *v26;
  NSObject *v27;
  NSDictionary *v28;
  NSDictionary *factorMetadatas;
  void *v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  NSString *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[TRIClient levelForFactor:withNamespaceName:](self->_triClient, "levelForFactor:withNamespaceName:", v4, self->_namespaceName);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:", self->_factorMetadatas);
  v7 = v6;
  if (v5)
  {
    -[TRIClient experimentIdentifiersWithNamespaceName:](self->_triClient, "experimentIdentifiersWithNamespaceName:", self->_namespaceName);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");

    -[TRIClient rolloutIdentifiersWithNamespaceName:](self->_triClient, "rolloutIdentifiersWithNamespaceName:", self->_namespaceName);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");

    objc_msgSend(v5, "metadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v9
      && (objc_msgSend(v12, "objectForKey:", CFSTR("factorType")),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("exp")),
          v14,
          v15))
    {
      v31 = v11;
      v16 = (void *)MEMORY[0x24BDD17C8];
      -[NSObject experimentId](v9, "experimentId");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject treatmentId](v9, "treatmentId");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("e:%@:%@"), v17, v18);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v11)
      {
        v19 = &stru_250C67C70;
LABEL_14:
        objc_msgSend(v13, "setObject:forKey:", v19, CFSTR("trialId"));
        v26 = (void *)objc_msgSend(v13, "copy");
        objc_msgSend(v7, "setObject:forKey:", v26, v4);

        FinHealthLogObject(CFSTR("FinHealthCore"));
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          v33 = "-[FHExperiment getLevelForFactor:]";
          v34 = 2112;
          v35 = v4;
          v36 = 2112;
          v37 = (NSString *)v5;
          _os_log_impl(&dword_23B4A2000, v27, OS_LOG_TYPE_DEBUG, "%s Factor %@ level %@", buf, 0x20u);
        }

        goto LABEL_17;
      }
      v31 = v11;
      objc_msgSend(v5, "metadata");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKey:", CFSTR("factorType"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("rollout"));

      if (!v22)
      {
        v19 = &stru_250C67C70;
        goto LABEL_13;
      }
      v23 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v31, "rolloutId");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "factorPackId");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "rampId");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", CFSTR("r:%@:%@:%@"), v17, v18, v24);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
LABEL_13:
    v11 = v31;
    goto LABEL_14;
  }
  objc_msgSend(v6, "removeObjectForKey:", v4);
  FinHealthLogObject(CFSTR("FinHealthCore"));
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    namespaceName = self->_namespaceName;
    *(_DWORD *)buf = 136315650;
    v33 = "-[FHExperiment getLevelForFactor:]";
    v34 = 2112;
    v35 = v4;
    v36 = 2112;
    v37 = namespaceName;
    _os_log_impl(&dword_23B4A2000, v9, OS_LOG_TYPE_DEBUG, "%s No level found for factor %@ in namespace %@", buf, 0x20u);
  }
LABEL_17:

  v28 = (NSDictionary *)objc_msgSend(v7, "copy");
  factorMetadatas = self->_factorMetadatas;
  self->_factorMetadatas = v28;

  return v5;
}

- (id)getTrialIdForFactor:(id)a3
{
  void *v3;
  void *v4;

  -[NSDictionary objectForKey:](self->_factorMetadatas, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("trialId"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)getFactorMetadata:(id)a3
{
  return -[NSDictionary objectForKey:](self->_factorMetadatas, "objectForKey:", a3);
}

- (id)getFilePathForFactor:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[FHExperiment getLevelForFactor:](self, "getLevelForFactor:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "fileValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)getDirectoryForFactor:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[FHExperiment getLevelForFactor:](self, "getLevelForFactor:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "directoryValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (FHTRIClientUpdateDelegate)delegate
{
  return (FHTRIClientUpdateDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_factorMetadatas, 0);
  objc_storeStrong((id *)&self->_namespaceName, 0);
  objc_storeStrong((id *)&self->_triClient, 0);
}

@end
