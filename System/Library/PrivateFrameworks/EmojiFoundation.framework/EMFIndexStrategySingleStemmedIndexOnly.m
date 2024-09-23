@implementation EMFIndexStrategySingleStemmedIndexOnly

- (id)postingsForTerm:(id)a3
{
  void *v3;
  void *v4;

  -[EMFIndexStrategySingleStemmedIndexOnly _postingsForTerm:](self, "_postingsForTerm:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("postings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)termsForDocument:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMFIndexStrategySingleStemmedIndexOnly _termsForDocument:](self, "_termsForDocument:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)termWeightForTerm:(id)a3 inDocument:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a4, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMFIndexStrategySingleStemmedIndexOnly _termWeightForTerm:inDocument:](self, "_termWeightForTerm:inDocument:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_postingsForTerm:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[EMFAbstractIndexStrategy termIndex](self, "termIndex");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_postingsForTerms:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[EMFIndexStrategySingleStemmedIndexOnly _postingsForTerm:](self, "_postingsForTerm:", v11, (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  v13 = (void *)objc_msgSend(v5, "copy");
  return v13;
}

- (id)_termsForDocument:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[EMFAbstractIndexStrategy documentIndex](self, "documentIndex");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_termWeightForTerm:(id)a3 inDocument:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  -[EMFIndexStrategySingleStemmedIndexOnly _termsForDocument:](self, "_termsForDocument:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "objectForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "objectForKey:", CFSTR("weight_norm"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_commonDocumentsForTerms:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[EMFIndexStrategySingleStemmedIndexOnly _postingsForTerms:](self, "_postingsForTerms:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v20;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(obj);
        objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v11));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("postings"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "allKeys");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if ((v9 & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "intersectSet:", v15);

        }
        else
        {
          objc_msgSend(v6, "addObjectsFromArray:", v14);
        }

        ++v11;
        v9 = 1;
      }
      while (v8 != v11);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  v16 = (void *)objc_msgSend(v6, "copy");
  return v16;
}

- (id)_calculateDocumentWeightsForQueryTokenCounts:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t j;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  id obj;
  uint64_t v28;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  objc_msgSend(v30, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMFIndexStrategySingleStemmedIndexOnly _commonDocumentsForTerms:](self, "_commonDocumentsForTerms:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v6)
  {
    v7 = v6;
    v28 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v36 != v28)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v10 = v30;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v32;
          v14 = 0.0;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v32 != v13)
                objc_enumerationMutation(v10);
              v16 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j);
              objc_msgSend(v10, "objectForKeyedSubscript:", v16);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "doubleValue");
              v19 = v18;
              -[EMFIndexStrategySingleStemmedIndexOnly _termWeightForTerm:inDocument:](self, "_termWeightForTerm:inDocument:", v16, v9);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = v20;
              if (v20)
                objc_msgSend(v20, "doubleValue");
              else
                v22 = 0.0;
              v14 = v14 + v22 * v19;

            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
          }
          while (v12);
        }
        else
        {
          v14 = 0.0;
        }

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v9, "intValue"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setObject:forKey:", v23, v24);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v7);
  }

  v25 = (void *)objc_msgSend(v29, "copy");
  return v25;
}

@end
