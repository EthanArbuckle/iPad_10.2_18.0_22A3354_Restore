@implementation CHSControlConfigurationReader

- (CHSControlConfigurationReader)init
{
  CHSControlConfigurationReader *v2;
  uint64_t v3;
  CHSControlService *connection;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CHSControlConfigurationReader;
  v2 = -[CHSControlConfigurationReader init](&v6, sel_init);
  if (v2)
  {
    +[CHSControlService sharedInstance](CHSControlService, "sharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    connection = v2->_connection;
    v2->_connection = (CHSControlService *)v3;

  }
  return v2;
}

- (void)allConfiguredControlsWithCompletion:(id)a3
{
  id v4;
  CHSControlService *connection;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  connection = self->_connection;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__CHSControlConfigurationReader_allConfiguredControlsWithCompletion___block_invoke;
  v7[3] = &unk_1E2A5AF90;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[CHSControlService allControlConfigurationsByHostWithCompletion:](connection, "allControlConfigurationsByHostWithCompletion:", v7);

}

void __69__CHSControlConfigurationReader_allConfiguredControlsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 40);
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "_transformResults:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v7, v5);
  if (v8)

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
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CHSControlConfigurationReader.m"), 44, CFSTR("Must have results to parse results."));

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__CHSControlConfigurationReader__transformResults___block_invoke;
  v10[3] = &unk_1E2A5AFB8;
  v7 = v6;
  v11 = v7;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v10);

  return v7;
}

void __51__CHSControlConfigurationReader__transformResults___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _CHSControlConfigurationReference *v11;
  void *v12;
  void *v13;
  _CHSControlConfigurationReference *v14;
  _CHSControlConfigurationHost *v15;
  id v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v17 = a2;
  v16 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v16, "controlItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v19;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v9);
        v11 = [_CHSControlConfigurationReference alloc];
        objc_msgSend(v10, "controlIdentity");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "uniqueIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[_CHSControlConfigurationReference initWithControlIdentity:uniqueIdentifier:](v11, "initWithControlIdentity:uniqueIdentifier:", v12, v13);
        objc_msgSend(v5, "addObject:", v14);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  v15 = -[_CHSControlConfigurationHost initWithIdentifier:configurations:]([_CHSControlConfigurationHost alloc], "initWithIdentifier:configurations:", v17, v5);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v15);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
