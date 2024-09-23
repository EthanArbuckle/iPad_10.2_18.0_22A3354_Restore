@implementation GKPlayerActivityInternal

- (GKPlayerActivityInternal)initWithServerResponse:(id)a3
{
  id v4;
  GKPlayerActivityInternal *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  GKPlayerActivitySectionInternal *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)GKPlayerActivityInternal;
  v5 = -[GKPlayerActivityInternal init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sections"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v17;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v17 != v11)
              objc_enumerationMutation(v8);
            v13 = -[GKPlayerActivitySectionInternal initWithDictionary:]([GKPlayerActivitySectionInternal alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12));
            objc_msgSend(v6, "addObject:", v13);

            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
        }
        while (v10);
      }
    }
    -[GKPlayerActivityInternal setSections:](v5, "setSections:", v6);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("continuation-key"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKPlayerActivityInternal setContinuationToken:](v5, "setContinuationToken:", v14);

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[GKPlayerActivityInternal sections](self, "sections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKPlayerActivityInternal continuationToken](self, "continuationToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("sections: %@, continuationKey: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_214 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_214, &__block_literal_global_215);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_213;
}

void __51__GKPlayerActivityInternal_secureCodedPropertyKeys__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("sections");
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, objc_opt_class(), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = CFSTR("continuationToken");
  v6[0] = v2;
  v6[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v3 = objc_claimAutoreleasedReturnValue();

  v4 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_213;
  secureCodedPropertyKeys_sSecureCodedKeys_213 = v3;

}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_storeStrong((id *)&self->_sections, a3);
}

- (NSString)continuationToken
{
  return self->_continuationToken;
}

- (void)setContinuationToken:(id)a3
{
  objc_storeStrong((id *)&self->_continuationToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continuationToken, 0);
  objc_storeStrong((id *)&self->_sections, 0);
}

@end
