@implementation DESDediscoKey

- (DESDediscoKey)initWithPrivacyID:(id)a3 environment:(id)a4 recipeID:(id)a5
{
  id v9;
  id v10;
  id v11;
  DESDediscoKey *v12;
  DESDediscoKey *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)DESDediscoKey;
  v12 = -[DESDediscoKey init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_privacyID, a3);
    objc_storeStrong((id *)&v13->_environment, a4);
    objc_storeStrong((id *)&v13->_recipeID, a5);
  }

  return v13;
}

- (id)resultsKeyString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  -[DESDediscoKey privacyID](self, "privacyID", CFSTR("pfl"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  v9[2] = CFSTR("results");
  -[DESDediscoKey environment](self, "environment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v4;
  -[DESDediscoKey recipeID](self, "recipeID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[4] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(":"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)resultsKeyStringForChunk:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[7];

  v11[6] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("pfl");
  v4 = a3;
  -[DESDediscoKey privacyID](self, "privacyID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v5;
  v11[2] = CFSTR("results");
  v11[3] = v4;
  -[DESDediscoKey environment](self, "environment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v6;
  -[DESDediscoKey recipeID](self, "recipeID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "componentsJoinedByString:", CFSTR(":"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)metricsKeyString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  -[DESDediscoKey privacyID](self, "privacyID", CFSTR("pfl"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  v9[2] = CFSTR("metrics");
  -[DESDediscoKey environment](self, "environment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v4;
  -[DESDediscoKey recipeID](self, "recipeID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[4] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(":"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)metadataKeyString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  -[DESDediscoKey privacyID](self, "privacyID", CFSTR("pfl"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  v9[2] = CFSTR("metadata");
  -[DESDediscoKey environment](self, "environment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v4;
  -[DESDediscoKey recipeID](self, "recipeID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[4] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(":"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)metadataEncodedMetricsKeyString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  -[DESDediscoKey privacyID](self, "privacyID", CFSTR("pfl"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  v9[2] = CFSTR("encoded-metrics");
  -[DESDediscoKey environment](self, "environment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v4;
  -[DESDediscoKey recipeID](self, "recipeID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[4] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(":"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)environment
{
  return self->_environment;
}

- (NSString)privacyID
{
  return self->_privacyID;
}

- (NSString)recipeID
{
  return self->_recipeID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipeID, 0);
  objc_storeStrong((id *)&self->_privacyID, 0);
  objc_storeStrong((id *)&self->_environment, 0);
}

@end
