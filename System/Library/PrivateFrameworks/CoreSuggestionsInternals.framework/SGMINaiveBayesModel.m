@implementation SGMINaiveBayesModel

- (SGMINaiveBayesModel)init
{
  SGMINaiveBayesModel *v2;
  uint64_t v3;
  SGMITokenCounts *mailCount;
  uint64_t v5;
  SGMITokenCounts *unigramTokenCounts;
  uint64_t v7;
  SGMITokenCounts *bigramTokenCounts;
  uint64_t v9;
  NSMutableDictionary *unigramTokensCount;
  uint64_t v11;
  NSMutableDictionary *bigramTokensCount;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SGMINaiveBayesModel;
  v2 = -[SGMINaiveBayesModel init](&v14, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    mailCount = v2->_mailCount;
    v2->_mailCount = (SGMITokenCounts *)v3;

    v5 = objc_opt_new();
    unigramTokenCounts = v2->_unigramTokenCounts;
    v2->_unigramTokenCounts = (SGMITokenCounts *)v5;

    v7 = objc_opt_new();
    bigramTokenCounts = v2->_bigramTokenCounts;
    v2->_bigramTokenCounts = (SGMITokenCounts *)v7;

    v9 = objc_opt_new();
    unigramTokensCount = v2->_unigramTokensCount;
    v2->_unigramTokensCount = (NSMutableDictionary *)v9;

    v11 = objc_opt_new();
    bigramTokensCount = v2->_bigramTokensCount;
    v2->_bigramTokensCount = (NSMutableDictionary *)v11;

  }
  return v2;
}

- (SGMINaiveBayesModel)initWithMailCount:(id)a3 unigramTokenCounts:(id)a4 bigramTokenCounts:(id)a5 unigramTokensCount:(id)a6 bigramTokensCount:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  SGMINaiveBayesModel *v18;
  SGMINaiveBayesModel *v19;
  uint64_t v20;
  NSMutableDictionary *unigramTokensCount;
  uint64_t v22;
  NSMutableDictionary *bigramTokensCount;
  objc_super v25;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v25.receiver = self;
  v25.super_class = (Class)SGMINaiveBayesModel;
  v18 = -[SGMINaiveBayesModel init](&v25, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_mailCount, a3);
    objc_storeStrong((id *)&v19->_unigramTokenCounts, a4);
    objc_storeStrong((id *)&v19->_bigramTokenCounts, a5);
    v20 = objc_msgSend(v16, "mutableCopy");
    unigramTokensCount = v19->_unigramTokensCount;
    v19->_unigramTokensCount = (NSMutableDictionary *)v20;

    v22 = objc_msgSend(v17, "mutableCopy");
    bigramTokensCount = v19->_bigramTokensCount;
    v19->_bigramTokensCount = (NSMutableDictionary *)v22;

  }
  return v19;
}

- (void)ingestUnigramTokens:(id)a3 bigramTokens:(id)a4 asSalient:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  SGMITokenCounts *v10;
  SGMITokenCounts *mailCount;
  SGMITokenCounts *unigramTokenCounts;
  void *v13;
  SGMITokenCounts *v14;
  SGMITokenCounts *v15;
  SGMITokenCounts *bigramTokenCounts;
  void *v17;
  SGMITokenCounts *v18;
  SGMITokenCounts *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  void *v27;
  SGMITokenCounts *v28;
  SGMITokenCounts *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  uint64_t v35;
  void *v36;
  void *v37;
  SGMITokenCounts *v38;
  SGMITokenCounts *v39;
  void *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v5 = a5;
  v52 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = -[SGMITokenCounts newByAdding:asSalient:](self->_mailCount, "newByAdding:asSalient:", &unk_1E7E0CAA0, v5);
  mailCount = self->_mailCount;
  self->_mailCount = v10;

  unigramTokenCounts = self->_unigramTokenCounts;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[SGMITokenCounts newByAdding:asSalient:](unigramTokenCounts, "newByAdding:asSalient:", v13, v5);
  v15 = self->_unigramTokenCounts;
  self->_unigramTokenCounts = v14;

  bigramTokenCounts = self->_bigramTokenCounts;
  v40 = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[SGMITokenCounts newByAdding:asSalient:](bigramTokenCounts, "newByAdding:asSalient:", v17, v5);
  v19 = self->_bigramTokenCounts;
  self->_bigramTokenCounts = v18;

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v20 = v8;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v47 != v23)
          objc_enumerationMutation(v20);
        v25 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_unigramTokensCount, "objectForKeyedSubscript:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v26;
        if (v26)
          v28 = (SGMITokenCounts *)objc_msgSend(v26, "newByAdding:asSalient:", &unk_1E7E0CAA0, v5);
        else
          v28 = -[SGMITokenCounts initWithCount:asSalient:token:]([SGMITokenCounts alloc], "initWithCount:asSalient:token:", &unk_1E7E0CAA0, v5, v25);
        v29 = v28;
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_unigramTokensCount, "setObject:forKeyedSubscript:", v28, v25);

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    }
    while (v22);
  }
  v41 = v20;

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v30 = v40;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v43;
    do
    {
      for (j = 0; j != v32; ++j)
      {
        if (*(_QWORD *)v43 != v33)
          objc_enumerationMutation(v30);
        v35 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * j);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_bigramTokensCount, "objectForKeyedSubscript:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v36;
        if (v36)
          v38 = (SGMITokenCounts *)objc_msgSend(v36, "newByAdding:asSalient:", &unk_1E7E0CAA0, v5);
        else
          v38 = -[SGMITokenCounts initWithCount:asSalient:token:]([SGMITokenCounts alloc], "initWithCount:asSalient:token:", &unk_1E7E0CAA0, v5, v35);
        v39 = v38;
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_bigramTokensCount, "setObject:forKeyedSubscript:", v38, v35);

      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    }
    while (v32);
  }

}

- (SGMITokenCounts)mailCount
{
  return (SGMITokenCounts *)objc_getProperty(self, a2, 8, 1);
}

- (SGMITokenCounts)unigramTokenCounts
{
  return (SGMITokenCounts *)objc_getProperty(self, a2, 16, 1);
}

- (SGMITokenCounts)bigramTokenCounts
{
  return (SGMITokenCounts *)objc_getProperty(self, a2, 24, 1);
}

- (NSMutableDictionary)unigramTokensCount
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (NSMutableDictionary)bigramTokensCount
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bigramTokensCount, 0);
  objc_storeStrong((id *)&self->_unigramTokensCount, 0);
  objc_storeStrong((id *)&self->_bigramTokenCounts, 0);
  objc_storeStrong((id *)&self->_unigramTokenCounts, 0);
  objc_storeStrong((id *)&self->_mailCount, 0);
}

@end
