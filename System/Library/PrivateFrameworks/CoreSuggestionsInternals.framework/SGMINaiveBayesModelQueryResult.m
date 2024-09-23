@implementation SGMINaiveBayesModelQueryResult

- (SGMINaiveBayesModelQueryResult)initWithMailCount:(id)a3 unigramTokenCounts:(id)a4 bigramTokenCounts:(id)a5 unigramQueriedTokensCount:(id)a6 bigramQueriedTokensCount:(id)a7 oldestTokenAge:(double)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  SGMINaiveBayesModelQueryResult *v19;
  SGMINaiveBayesModelQueryResult *v20;
  id v22;
  objc_super v23;

  v22 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v23.receiver = self;
  v23.super_class = (Class)SGMINaiveBayesModelQueryResult;
  v19 = -[SGMINaiveBayesModelQueryResult init](&v23, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_mailCount, a3);
    objc_storeStrong((id *)&v20->_unigramTokenCounts, a4);
    objc_storeStrong((id *)&v20->_bigramTokenCounts, a5);
    objc_storeStrong((id *)&v20->_unigramQueriedTokensCount, a6);
    objc_storeStrong((id *)&v20->_bigramQueriedTokensCount, a7);
    v20->_oldestTokenAge = a8;
  }

  return v20;
}

- (id)inferProbability
{
  void *v3;
  double v4;
  long double v5;
  void *v6;
  double v7;
  long double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  unint64_t v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  NSArray *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  NSArray *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  void *v50;
  void *v51;
  double v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  long double v59;
  long double v60;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  -[SGMITokenCounts salientCount](self->_mailCount, "salientCount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  -[SGMITokenCounts regularCount](self->_mailCount, "regularCount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  if (v5 + v8 < 0.00001)
    goto LABEL_2;
  -[SGMITokenCounts salientCount](self->_unigramTokenCounts, "salientCount");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  v12 = v11;

  if (v12 < 0.00001)
  {
    v9 = &unk_1E7E0CE10;
    return v9;
  }
  if (-[NSArray count](self->_unigramQueriedTokensCount, "count"))
  {
    v13 = log(v5 + v8);
    v14 = log(v5);
    v15 = log(v8);
    v16 = -[NSArray count](self->_unigramQueriedTokensCount, "count");
    v17 = (double)v16;
    v18 = -(double)v16;
    -[SGMITokenCounts salientCount](self->_unigramTokenCounts, "salientCount");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "doubleValue");
    v21 = log(v20 + 0.00001);
    v22 = v21;
    if (v16 <= 1)
    {
      v25 = v21 * v18;
    }
    else
    {
      -[SGMITokenCounts salientCount](self->_bigramTokenCounts, "salientCount");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "doubleValue");
      v25 = v18 * v22 - (v17 + -1.0) * log(v24 + 0.00001);

    }
    -[SGMITokenCounts regularCount](self->_unigramTokenCounts, "regularCount");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "doubleValue");
    v28 = log(v27 + 0.00001);
    v29 = v28;
    if (v16 <= 1)
    {
      v32 = v28 * v18;
    }
    else
    {
      -[SGMITokenCounts regularCount](self->_bigramTokenCounts, "regularCount");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "doubleValue");
      v32 = v18 * v29 - (v17 + -1.0) * log(v31 + 0.00001);

    }
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v33 = self->_unigramQueriedTokensCount;
    v34 = -[NSArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v67;
      do
      {
        for (i = 0; i != v35; ++i)
        {
          if (*(_QWORD *)v67 != v36)
            objc_enumerationMutation(v33);
          v38 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
          objc_msgSend(v38, "salientCount");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "doubleValue");
          v25 = v25 + log(v40 + 0.00001);

          objc_msgSend(v38, "regularCount");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "doubleValue");
          v32 = v32 + log(v42 + 0.00001);

        }
        v35 = -[NSArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
      }
      while (v35);
    }
    v43 = v14 - v13;
    v44 = v15 - v13;

    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v45 = self->_bigramQueriedTokensCount;
    v46 = -[NSArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
    if (v46)
    {
      v47 = v46;
      v48 = *(_QWORD *)v63;
      do
      {
        for (j = 0; j != v47; ++j)
        {
          if (*(_QWORD *)v63 != v48)
            objc_enumerationMutation(v45);
          v50 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * j);
          objc_msgSend(v50, "salientCount", (_QWORD)v62);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "doubleValue");
          v25 = v25 + log(v52 + 0.00001);

          objc_msgSend(v50, "regularCount");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "doubleValue");
          v32 = v32 + log(v54 + 0.00001);

        }
        v47 = -[NSArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
      }
      while (v47);
    }

    v55 = v43 + v25;
    v56 = v44 + v32;
    if (v55 >= v44 + v32)
      v57 = v55;
    else
      v57 = v44 + v32;
    v58 = exp(v55 - v57);
    v59 = exp(v56 - v57);
    v60 = log(v58 + v59);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)exp(v55 - (v57 + v60)));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_2:
    v9 = &unk_1E7E0CA88;
  }
  return v9;
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

- (NSArray)unigramQueriedTokensCount
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)bigramQueriedTokensCount
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (double)oldestTokenAge
{
  return self->_oldestTokenAge;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bigramQueriedTokensCount, 0);
  objc_storeStrong((id *)&self->_unigramQueriedTokensCount, 0);
  objc_storeStrong((id *)&self->_bigramTokenCounts, 0);
  objc_storeStrong((id *)&self->_unigramTokenCounts, 0);
  objc_storeStrong((id *)&self->_mailCount, 0);
}

@end
