@implementation _CPSectionRankingFeedback

- (_CPSectionRankingFeedback)initWithFacade:(id)a3
{
  id v4;
  _CPSectionRankingFeedback *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  _CPResultRankingFeedback *v13;
  void *v14;
  _CPResultSectionForFeedback *v15;
  void *v16;
  _CPResultSectionForFeedback *v17;
  _CPSectionRankingFeedback *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)_CPSectionRankingFeedback;
  v5 = -[_CPSectionRankingFeedback init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "results");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v4, "results", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v8);
          v13 = -[_CPResultRankingFeedback initWithFacade:]([_CPResultRankingFeedback alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
          objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v10);
    }

    -[_CPSectionRankingFeedback setResults:](v5, "setResults:", v7);
    objc_msgSend(v4, "section");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = [_CPResultSectionForFeedback alloc];
      objc_msgSend(v4, "section");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[_CPResultSectionForFeedback initWithFacade:](v15, "initWithFacade:", v16);
      -[_CPSectionRankingFeedback setSection:](v5, "setSection:", v17);

    }
    -[_CPSectionRankingFeedback setLocalSectionPosition:](v5, "setLocalSectionPosition:", objc_msgSend(v4, "localSectionPosition"));
    objc_msgSend(v4, "personalizationScore");
    -[_CPSectionRankingFeedback setPersonalizationScore:](v5, "setPersonalizationScore:");
    v18 = v5;

  }
  return v5;
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[_CPSectionRankingFeedback timestamp](self, "timestamp"))
    PBDataWriterWriteUint64Field();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_results;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  -[_CPSectionRankingFeedback section](self, "section", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_CPSectionRankingFeedback section](self, "section");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_CPSectionRankingFeedback localSectionPosition](self, "localSectionPosition"))
    PBDataWriterWriteUint32Field();
  -[_CPSectionRankingFeedback personalizationScore](self, "personalizationScore");
  if (v12 != 0.0)
    PBDataWriterWriteDoubleField();

}

- (_CPResultSectionForFeedback)section
{
  return self->_section;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (double)personalizationScore
{
  return self->_personalizationScore;
}

- (unsigned)localSectionPosition
{
  return self->_localSectionPosition;
}

- (void)setResults:(id)a3
{
  NSArray *v4;
  NSArray *results;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  results = self->_results;
  self->_results = v4;

}

- (void)setPersonalizationScore:(double)a3
{
  self->_personalizationScore = a3;
}

- (void)setLocalSectionPosition:(unsigned int)a3
{
  self->_localSectionPosition = a3;
}

- (void)addResults:(id)a3
{
  id v4;
  NSArray *results;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  results = self->_results;
  v8 = v4;
  if (!results)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_results;
    self->_results = v6;

    v4 = v8;
    results = self->_results;
  }
  -[NSArray addObject:](results, "addObject:", v4);

}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (void)setSection:(id)a3
{
  objc_storeStrong((id *)&self->_section, a3);
}

- (_CPSectionRankingFeedback)init
{
  _CPSectionRankingFeedback *v2;
  _CPSectionRankingFeedback *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_CPSectionRankingFeedback;
  v2 = -[_CPSectionRankingFeedback init](&v5, sel_init);
  if (v2)
  {
    -[_CPSectionRankingFeedback setTimestamp:](v2, "setTimestamp:", mach_absolute_time());
    v3 = v2;
  }

  return v2;
}

- (NSArray)results
{
  return self->_results;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_section, 0);
  objc_storeStrong((id *)&self->_results, 0);
}

- (void)clearResults
{
  -[NSArray removeAllObjects](self->_results, "removeAllObjects");
}

- (unint64_t)resultsCount
{
  return -[NSArray count](self->_results, "count");
}

- (id)resultsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_results, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return _CPSectionRankingFeedbackReadFrom(self, (uint64_t)a3);
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
  BOOL v18;
  unsigned int localSectionPosition;
  double personalizationScore;
  double v22;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  timestamp = self->_timestamp;
  if (timestamp != objc_msgSend(v4, "timestamp"))
    goto LABEL_13;
  -[_CPSectionRankingFeedback results](self, "results");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "results");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_12;
  -[_CPSectionRankingFeedback results](self, "results");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[_CPSectionRankingFeedback results](self, "results");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "results");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_13;
  }
  else
  {

  }
  -[_CPSectionRankingFeedback section](self, "section");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "section");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_12:

    goto LABEL_13;
  }
  -[_CPSectionRankingFeedback section](self, "section");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[_CPSectionRankingFeedback section](self, "section");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "section");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_13;
  }
  else
  {

  }
  localSectionPosition = self->_localSectionPosition;
  if (localSectionPosition == objc_msgSend(v4, "localSectionPosition"))
  {
    personalizationScore = self->_personalizationScore;
    objc_msgSend(v4, "personalizationScore");
    v18 = personalizationScore == v22;
    goto LABEL_14;
  }
LABEL_13:
  v18 = 0;
LABEL_14:

  return v18;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  double personalizationScore;
  uint64_t v7;
  double v8;
  long double v9;

  v3 = 2654435761u * self->_timestamp;
  v4 = -[NSArray hash](self->_results, "hash");
  v5 = -[_CPResultSectionForFeedback hash](self->_section, "hash");
  personalizationScore = self->_personalizationScore;
  v7 = v4 ^ v5 ^ (2654435761 * self->_localSectionPosition) ^ v3;
  v8 = -personalizationScore;
  if (personalizationScore >= 0.0)
    v8 = personalizationScore;
  v9 = round(v8);
  return v7 ^ ((unint64_t)(fmod(v9, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v8 - v9, 0x40uLL));
}

@end
