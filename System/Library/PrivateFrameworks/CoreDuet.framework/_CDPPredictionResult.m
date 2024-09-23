@implementation _CDPPredictionResult

- (void)commonInit
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[_CDPPredictionResult setScoresForMembers:](self, "setScoresForMembers:", v3);

  -[_CDPPredictionResult setWeight:](self, "setWeight:", 1.0);
}

- (_CDPPredictionResult)initWithMembers:(id)a3 andScores:(id)a4
{
  id v6;
  id v7;
  _CDPPredictionResult *v8;
  _CDPPredictionResult *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  NSMutableDictionary *scoresForMembers;
  void *v14;
  void *v15;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_CDPPredictionResult;
  v8 = -[_CDPPredictionResult init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    -[_CDPPredictionResult commonInit](v8, "commonInit");
    v10 = objc_msgSend(v6, "count");
    if (v10 >= 1)
    {
      v11 = v10;
      for (i = 0; i != v11; ++i)
      {
        scoresForMembers = v9->_scoresForMembers;
        objc_msgSend(v7, "objectAtIndexedSubscript:", i);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectAtIndexedSubscript:", i);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](scoresForMembers, "setObject:forKey:", v14, v15);

      }
    }
  }

  return v9;
}

- (id)initByMergingPredictionResults:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  double v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  uint64_t m;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  uint64_t n;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  NSMutableDictionary *scoresForMembers;
  void *v40;
  id v42;
  uint64_t v43;
  _CDPPredictionResult *v44;
  uint64_t v45;
  id obj;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  objc_super v67;
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v67.receiver = self;
  v67.super_class = (Class)_CDPPredictionResult;
  v44 = -[_CDPPredictionResult init](&v67, sel_init);
  if (v44)
  {
    -[_CDPPredictionResult commonInit](v44, "commonInit");
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
    if (!v6)
    {
LABEL_43:

      goto LABEL_44;
    }
    v7 = v6;
    v8 = *(_QWORD *)v64;
    v9 = 0.0;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v64 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * i), "weight");
        v9 = v9 + v11;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
    }
    while (v7);

    if (v9 > 0.0)
    {
      v42 = v4;
      v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v59 = 0u;
      v60 = 0u;
      v61 = 0u;
      v62 = 0u;
      obj = v5;
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v60;
        do
        {
          for (j = 0; j != v14; ++j)
          {
            if (*(_QWORD *)v60 != v15)
              objc_enumerationMutation(obj);
            v17 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * j);
            v55 = 0u;
            v56 = 0u;
            v57 = 0u;
            v58 = 0u;
            objc_msgSend(v17, "scoresForMembers");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "allKeys");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v55, v70, 16);
            if (v20)
            {
              v21 = v20;
              v22 = *(_QWORD *)v56;
              do
              {
                for (k = 0; k != v21; ++k)
                {
                  if (*(_QWORD *)v56 != v22)
                    objc_enumerationMutation(v19);
                  v24 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * k);
                  if (objc_msgSend(v24, "length"))
                    objc_msgSend(v12, "addObject:", v24);
                }
                v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v55, v70, 16);
              }
              while (v21);
            }

          }
          v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
        }
        while (v14);
      }

      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v5 = v12;
      v45 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v51, v69, 16);
      if (v45)
      {
        v43 = *(_QWORD *)v52;
        do
        {
          for (m = 0; m != v45; ++m)
          {
            if (*(_QWORD *)v52 != v43)
              objc_enumerationMutation(v5);
            v26 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * m);
            v47 = 0u;
            v48 = 0u;
            v49 = 0u;
            v50 = 0u;
            v27 = obj;
            v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v47, v68, 16);
            if (v28)
            {
              v29 = v28;
              v30 = *(_QWORD *)v48;
              v31 = 0.0;
              do
              {
                for (n = 0; n != v29; ++n)
                {
                  if (*(_QWORD *)v48 != v30)
                    objc_enumerationMutation(v27);
                  v33 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * n);
                  objc_msgSend(v33, "scoresForMembers");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v34, "objectForKeyedSubscript:", v26);
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v35, "doubleValue");
                  v37 = v36;
                  objc_msgSend(v33, "weight");
                  v31 = v31 + v37 * v38;

                }
                v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v47, v68, 16);
              }
              while (v29);
            }
            else
            {
              v31 = 0.0;
            }

            scoresForMembers = v44->_scoresForMembers;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v31 / v9);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKey:](scoresForMembers, "setObject:forKey:", v40, v26);

          }
          v45 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v51, v69, 16);
        }
        while (v45);
      }

      v4 = v42;
      goto LABEL_43;
    }
  }
LABEL_44:

  return v44;
}

- (id)rankedMembers:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __38___CDPPredictionResult_rankedMembers___block_invoke;
  v4[3] = &unk_1E26E4190;
  v4[4] = self;
  objc_msgSend(a3, "sortedArrayUsingComparator:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)rankedMembers
{
  NSArray *rankedMembers;
  void *v4;
  NSArray *v5;
  NSArray *v6;

  rankedMembers = self->_rankedMembers;
  if (!rankedMembers)
  {
    -[NSMutableDictionary allKeys](self->_scoresForMembers, "allKeys");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDPPredictionResult rankedMembers:](self, "rankedMembers:", v4);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v6 = self->_rankedMembers;
    self->_rankedMembers = v5;

    rankedMembers = self->_rankedMembers;
  }
  return rankedMembers;
}

- (id)rankedMembersPassingThreshold:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[6];

  -[NSMutableDictionary allKeys](self->_scoresForMembers, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54___CDPPredictionResult_rankedMembersPassingThreshold___block_invoke;
  v10[3] = &unk_1E26E41B8;
  v10[4] = self;
  *(double *)&v10[5] = a3;
  objc_msgSend(v5, "indexesOfObjectsPassingTest:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectsAtIndexes:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDPPredictionResult rankedMembers:](self, "rankedMembers:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSMutableDictionary)scoresForMembers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setScoresForMembers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (double)weight
{
  return self->_weight;
}

- (void)setWeight:(double)a3
{
  self->_weight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rankedMembers, 0);
  objc_storeStrong((id *)&self->_scoresForMembers, 0);
}

@end
