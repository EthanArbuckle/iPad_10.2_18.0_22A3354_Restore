@implementation _CPResultRankingFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_duplicateResults, 0);
  objc_storeStrong((id *)&self->_hiddenResults, 0);
  objc_storeStrong((id *)&self->_result, 0);
}

- (_CPResultRankingFeedback)initWithFacade:(id)a3
{
  id v4;
  _CPResultRankingFeedback *v5;
  void *v6;
  _CPSearchResultForFeedback *v7;
  void *v8;
  _CPSearchResultForFeedback *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  _CPSearchResultForFeedback *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  _CPSearchResultForFeedback *v25;
  _CPResultRankingFeedback *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)_CPResultRankingFeedback;
  v5 = -[_CPResultRankingFeedback init](&v36, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "result");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [_CPSearchResultForFeedback alloc];
      objc_msgSend(v4, "result");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_CPSearchResultForFeedback initWithFacade:](v7, "initWithFacade:", v8);
      -[_CPResultRankingFeedback setResult:](v5, "setResult:", v9);

    }
    objc_msgSend(v4, "hiddenResults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v11 = 0;

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    objc_msgSend(v4, "hiddenResults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v33 != v15)
            objc_enumerationMutation(v12);
          v17 = -[_CPSearchResultForFeedback initWithFacade:]([_CPSearchResultForFeedback alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i));
          objc_msgSend(v11, "addObject:", v17);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
      }
      while (v14);
    }

    -[_CPResultRankingFeedback setHiddenResults:](v5, "setHiddenResults:", v11);
    objc_msgSend(v4, "duplicateResults");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
      v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v19 = 0;

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v4, "duplicateResults", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v29;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v29 != v23)
            objc_enumerationMutation(v20);
          v25 = -[_CPSearchResultForFeedback initWithFacade:]([_CPSearchResultForFeedback alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j));
          objc_msgSend(v19, "addObject:", v25);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
      }
      while (v22);
    }

    -[_CPResultRankingFeedback setDuplicateResults:](v5, "setDuplicateResults:", v19);
    -[_CPResultRankingFeedback setLocalResultPosition:](v5, "setLocalResultPosition:", objc_msgSend(v4, "localResultPosition"));
    objc_msgSend(v4, "personalizationScore");
    -[_CPResultRankingFeedback setPersonalizationScore:](v5, "setPersonalizationScore:");
    v26 = v5;

  }
  return v5;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[_CPResultRankingFeedback timestamp](self, "timestamp"))
    PBDataWriterWriteUint64Field();
  -[_CPResultRankingFeedback result](self, "result");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_CPResultRankingFeedback result](self, "result");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = self->_hiddenResults;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v9);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = self->_duplicateResults;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        PBDataWriterWriteSubmessage();
        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v14);
  }

  if (-[_CPResultRankingFeedback localResultPosition](self, "localResultPosition", v18))
    PBDataWriterWriteUint32Field();
  -[_CPResultRankingFeedback personalizationScore](self, "personalizationScore");
  if (v17 != 0.0)
    PBDataWriterWriteDoubleField();

}

- (_CPSearchResultForFeedback)result
{
  return self->_result;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (double)personalizationScore
{
  return self->_personalizationScore;
}

- (unsigned)localResultPosition
{
  return self->_localResultPosition;
}

- (void)setPersonalizationScore:(double)a3
{
  self->_personalizationScore = a3;
}

- (void)setLocalResultPosition:(unsigned int)a3
{
  self->_localResultPosition = a3;
}

- (void)setHiddenResults:(id)a3
{
  NSArray *v4;
  NSArray *hiddenResults;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  hiddenResults = self->_hiddenResults;
  self->_hiddenResults = v4;

}

- (void)setDuplicateResults:(id)a3
{
  NSArray *v4;
  NSArray *duplicateResults;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  duplicateResults = self->_duplicateResults;
  self->_duplicateResults = v4;

}

- (_CPResultRankingFeedback)init
{
  _CPResultRankingFeedback *v2;
  _CPResultRankingFeedback *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_CPResultRankingFeedback;
  v2 = -[_CPResultRankingFeedback init](&v5, sel_init);
  if (v2)
  {
    -[_CPResultRankingFeedback setTimestamp:](v2, "setTimestamp:", mach_absolute_time());
    v3 = v2;
  }

  return v2;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (void)clearHiddenResults
{
  -[NSArray removeAllObjects](self->_hiddenResults, "removeAllObjects");
}

- (void)addHiddenResults:(id)a3
{
  id v4;
  NSArray *hiddenResults;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  hiddenResults = self->_hiddenResults;
  v8 = v4;
  if (!hiddenResults)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_hiddenResults;
    self->_hiddenResults = v6;

    v4 = v8;
    hiddenResults = self->_hiddenResults;
  }
  -[NSArray addObject:](hiddenResults, "addObject:", v4);

}

- (unint64_t)hiddenResultsCount
{
  return -[NSArray count](self->_hiddenResults, "count");
}

- (id)hiddenResultsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_hiddenResults, "objectAtIndexedSubscript:", a3);
}

- (void)clearDuplicateResults
{
  -[NSArray removeAllObjects](self->_duplicateResults, "removeAllObjects");
}

- (void)addDuplicateResults:(id)a3
{
  id v4;
  NSArray *duplicateResults;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  duplicateResults = self->_duplicateResults;
  v8 = v4;
  if (!duplicateResults)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_duplicateResults;
    self->_duplicateResults = v6;

    v4 = v8;
    duplicateResults = self->_duplicateResults;
  }
  -[NSArray addObject:](duplicateResults, "addObject:", v4);

}

- (unint64_t)duplicateResultsCount
{
  return -[NSArray count](self->_duplicateResults, "count");
}

- (id)duplicateResultsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_duplicateResults, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return _CPResultRankingFeedbackReadFrom(self, (uint64_t)a3);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t timestamp;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  BOOL v23;
  unsigned int localResultPosition;
  double personalizationScore;
  double v27;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  timestamp = self->_timestamp;
  if (timestamp != objc_msgSend(v4, "timestamp"))
    goto LABEL_18;
  -[_CPResultRankingFeedback result](self, "result");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "result");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_17;
  -[_CPResultRankingFeedback result](self, "result");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[_CPResultRankingFeedback result](self, "result");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "result");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_18;
  }
  else
  {

  }
  -[_CPResultRankingFeedback hiddenResults](self, "hiddenResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hiddenResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_17;
  -[_CPResultRankingFeedback hiddenResults](self, "hiddenResults");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[_CPResultRankingFeedback hiddenResults](self, "hiddenResults");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hiddenResults");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_18;
  }
  else
  {

  }
  -[_CPResultRankingFeedback duplicateResults](self, "duplicateResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "duplicateResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_17:

    goto LABEL_18;
  }
  -[_CPResultRankingFeedback duplicateResults](self, "duplicateResults");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[_CPResultRankingFeedback duplicateResults](self, "duplicateResults");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "duplicateResults");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_18;
  }
  else
  {

  }
  localResultPosition = self->_localResultPosition;
  if (localResultPosition == objc_msgSend(v4, "localResultPosition"))
  {
    personalizationScore = self->_personalizationScore;
    objc_msgSend(v4, "personalizationScore");
    v23 = personalizationScore == v27;
    goto LABEL_19;
  }
LABEL_18:
  v23 = 0;
LABEL_19:

  return v23;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double personalizationScore;
  uint64_t v8;
  double v9;
  long double v10;

  v3 = 2654435761u * self->_timestamp;
  v4 = -[_CPSearchResultForFeedback hash](self->_result, "hash");
  v5 = v4 ^ -[NSArray hash](self->_hiddenResults, "hash");
  v6 = -[NSArray hash](self->_duplicateResults, "hash");
  personalizationScore = self->_personalizationScore;
  v8 = v5 ^ v6 ^ (2654435761 * self->_localResultPosition) ^ v3;
  v9 = -personalizationScore;
  if (personalizationScore >= 0.0)
    v9 = personalizationScore;
  v10 = round(v9);
  return v8 ^ ((unint64_t)(fmod(v10, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v9 - v10, 0x40uLL));
}

- (NSArray)hiddenResults
{
  return self->_hiddenResults;
}

- (NSArray)duplicateResults
{
  return self->_duplicateResults;
}

@end
