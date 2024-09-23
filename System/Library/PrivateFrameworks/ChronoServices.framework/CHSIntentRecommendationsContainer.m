@implementation CHSIntentRecommendationsContainer

- (CHSIntentRecommendationsContainer)initWithSchemaIntent:(id)a3 recommendations:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  CHSIntentRecommendationsContainer *v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  id (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v18 = 0;
  +[CHSIntentReference _schemaDataFromIntent:error:](CHSIntentReference, "_schemaDataFromIntent:error:", v6, &v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v18;
  if (v9)
  {
    v10 = 0;
  }
  else
  {
    if (v8)
    {
      v13 = MEMORY[0x1E0C809B0];
      v14 = 3221225472;
      v15 = __74__CHSIntentRecommendationsContainer_initWithSchemaIntent_recommendations___block_invoke;
      v16 = &unk_1E2A5AB70;
      v17 = v8;
      objc_msgSend(v7, "bs_map:", &v13);
      v11 = objc_claimAutoreleasedReturnValue();

      v7 = (id)v11;
    }
    self = (CHSIntentRecommendationsContainer *)-[CHSIntentRecommendationsContainer _initWithSchemaData:recommendations:](self, "_initWithSchemaData:recommendations:", v8, v7, v13, v14, v15, v16);
    v10 = self;
  }

  return v10;
}

id __74__CHSIntentRecommendationsContainer_initWithSchemaIntent_recommendations___block_invoke(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "_copyFillingInSchema:", *(_QWORD *)(a1 + 32));
}

- (id)_initWithSchemaData:(id)a3 recommendations:(id)a4
{
  id v7;
  id v8;
  CHSIntentRecommendationsContainer *v9;
  CHSIntentRecommendationsContainer *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  objc_super v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CHSIntentRecommendationsContainer;
  v9 = -[CHSIntentRecommendationsContainer init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_schemaData, a3);
    if ((unint64_t)objc_msgSend(v8, "count") >= 0x10)
    {
      CHSLogChronoServices();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v17 = v12;
        _os_log_impl(&dword_18FB18000, v11, OS_LOG_TYPE_DEFAULT, "A large number of intent recommendations detected %{public}@; filtering to a reasonable number.",
          buf,
          0xCu);

      }
      v10->_didAdjustRecommendationCount = 1;
      objc_msgSend(v8, "subarrayWithRange:", 0, 15);
      v13 = objc_claimAutoreleasedReturnValue();

      v8 = (id)v13;
    }
    objc_storeStrong((id *)&v10->_recommendations, v8);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  CHSIntentRecommendationsContainer *v4;
  void *v5;
  char v6;

  v4 = (CHSIntentRecommendationsContainer *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CHSIntentRecommendationsContainer recommendations](v4, "recommendations");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = BSEqualObjects();

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  return 7 * -[NSArray count](self->_recommendations, "count");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_recommendationsWithoutSchemaData
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_recommendations;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        v8 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "_copyWithoutSchemaDataIfNecessary", (_QWORD)v10);
        objc_msgSend(v3, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", self->_schemaData, CFSTR("schema"));
  -[CHSIntentRecommendationsContainer _recommendationsWithoutSchemaData](self, "_recommendationsWithoutSchemaData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("recommendations"));

}

- (CHSIntentRecommendationsContainer)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  CHSIntentRecommendationsContainer *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("schema"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v22[0] = objc_opt_class();
  v22[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("recommendations"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v13), "intentReference", (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "_setPartialSchemaData:", v5);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  if (v10)
  {
    self = (CHSIntentRecommendationsContainer *)-[CHSIntentRecommendationsContainer _initWithSchemaData:recommendations:](self, "_initWithSchemaData:recommendations:", v5, v10);
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", self->_schemaData, CFSTR("schema"));
  -[CHSIntentRecommendationsContainer _recommendationsWithoutSchemaData](self, "_recommendationsWithoutSchemaData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeCollection:forKey:", v4, CFSTR("recommendations"));

}

- (CHSIntentRecommendationsContainer)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  CHSIntentRecommendationsContainer *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("schema"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v6, objc_opt_class(), CFSTR("recommendations"));
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "intentReference", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_setPartialSchemaData:", v5);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  if (v7)
  {
    self = (CHSIntentRecommendationsContainer *)-[CHSIntentRecommendationsContainer _initWithSchemaData:recommendations:](self, "_initWithSchemaData:recommendations:", v5, v7);
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSArray)recommendations
{
  return self->_recommendations;
}

- (BOOL)_didAdjustRecommendationCount
{
  return self->_didAdjustRecommendationCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recommendations, 0);
  objc_storeStrong((id *)&self->_schemaData, 0);
}

@end
