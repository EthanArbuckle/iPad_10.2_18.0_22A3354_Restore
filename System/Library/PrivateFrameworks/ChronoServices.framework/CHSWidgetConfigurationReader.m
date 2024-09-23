@implementation CHSWidgetConfigurationReader

- (CHSWidgetConfigurationReader)init
{
  CHSWidgetConfigurationReader *v2;
  uint64_t v3;
  CHSChronoServicesConnection *connection;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CHSWidgetConfigurationReader;
  v2 = -[CHSWidgetConfigurationReader init](&v6, sel_init);
  if (v2)
  {
    +[CHSChronoServicesConnection sharedInstance](CHSChronoServicesConnection, "sharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    connection = v2->_connection;
    v2->_connection = (CHSChronoServicesConnection *)v3;

  }
  return v2;
}

- (void)allConfiguredWidgetsWithCompletion:(id)a3
{
  id v4;
  CHSChronoServicesConnection *connection;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  connection = self->_connection;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__CHSWidgetConfigurationReader_allConfiguredWidgetsWithCompletion___block_invoke;
  v7[3] = &unk_1E2A5B008;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[CHSChronoServicesConnection allWidgetConfigurationsByHostWithCompletion:](connection, "allWidgetConfigurationsByHostWithCompletion:", v7);

}

void __67__CHSWidgetConfigurationReader_allConfiguredWidgetsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(a2, "configurationsByHost");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_transformResults:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v7, v8);
  if (v5)

}

- (id)_transformResults:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v9;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CHSWidgetConfigurationReader.m"), 43, CFSTR("Must have results to parse results."));

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__CHSWidgetConfigurationReader__transformResults___block_invoke;
  v10[3] = &unk_1E2A5B030;
  v7 = v6;
  v11 = v7;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v10);

  return v7;
}

void __50__CHSWidgetConfigurationReader__transformResults___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _CHSWidgetConfigurationHost *v13;
  void *v14;
  _CHSWidgetConfigurationHost *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v6, "containerDescriptors", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v11), "widgets");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObjectsFromArray:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  v13 = [_CHSWidgetConfigurationHost alloc];
  objc_msgSend(v6, "metricsSpecification");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[_CHSWidgetConfigurationHost initWithIdentifier:configurations:metricsSpecification:](v13, "initWithIdentifier:configurations:metricsSpecification:", v5, v7, v14);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v15);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
