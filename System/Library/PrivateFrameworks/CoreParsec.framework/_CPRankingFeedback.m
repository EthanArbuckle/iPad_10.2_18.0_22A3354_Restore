@implementation _CPRankingFeedback

- (void)addSections:(id)a3
{
  id v4;
  NSArray *sections;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  sections = self->_sections;
  v8 = v4;
  if (!sections)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_sections;
    self->_sections = v6;

    v4 = v8;
    sections = self->_sections;
  }
  -[NSArray addObject:](sections, "addObject:", v4);

}

- (_CPRankingFeedback)initWithFacade:(id)a3
{
  id v4;
  _CPRankingFeedback *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  _CPSectionRankingFeedback *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  _CPSearchResultForFeedback *v21;
  _CPRankingFeedback *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)_CPRankingFeedback;
  v5 = -[_CPRankingFeedback init](&v32, sel_init);
  if (v5)
  {
    -[_CPRankingFeedback setTimestamp:](v5, "setTimestamp:", objc_msgSend(v4, "timestamp"));
    objc_msgSend(v4, "blendingDuration");
    -[_CPRankingFeedback setBlendingDuration:](v5, "setBlendingDuration:");
    objc_msgSend(v4, "sections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v4, "sections");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v29 != v11)
            objc_enumerationMutation(v8);
          v13 = -[_CPSectionRankingFeedback initWithFacade:]([_CPSectionRankingFeedback alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i));
          objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      }
      while (v10);
    }

    -[_CPRankingFeedback setSections:](v5, "setSections:", v7);
    objc_msgSend(v4, "hiddenResults");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v15 = 0;

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v4, "hiddenResults", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v25;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v25 != v19)
            objc_enumerationMutation(v16);
          v21 = -[_CPSearchResultForFeedback initWithFacade:]([_CPSearchResultForFeedback alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j));
          objc_msgSend(v15, "addObject:", v21);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
      }
      while (v18);
    }

    -[_CPRankingFeedback setHiddenResults:](v5, "setHiddenResults:", v15);
    -[_CPRankingFeedback setSpotlightQueryIntent:](v5, "setSpotlightQueryIntent:", objc_msgSend(v4, "spotlightQueryIntent"));
    v22 = v5;

  }
  return v5;
}

- (void)writeTo:(id)a3
{
  id v4;
  double v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[_CPRankingFeedback timestamp](self, "timestamp"))
    PBDataWriterWriteUint64Field();
  -[_CPRankingFeedback blendingDuration](self, "blendingDuration");
  if (v5 != 0.0)
    PBDataWriterWriteDoubleField();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = self->_sections;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v8);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = self->_hiddenResults;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteSubmessage();
        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
  }

  if (-[_CPRankingFeedback spotlightQueryIntent](self, "spotlightQueryIntent", v16))
    PBDataWriterWriteInt32Field();

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (double)blendingDuration
{
  return self->_blendingDuration;
}

- (void)setSections:(id)a3
{
  NSArray *v4;
  NSArray *sections;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  sections = self->_sections;
  self->_sections = v4;

}

- (void)setBlendingDuration:(double)a3
{
  self->_blendingDuration = a3;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (_CPRankingFeedback)init
{
  _CPRankingFeedback *v2;
  _CPRankingFeedback *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_CPRankingFeedback;
  v2 = -[_CPRankingFeedback init](&v5, sel_init);
  if (v2)
  {
    -[_CPRankingFeedback setTimestamp:](v2, "setTimestamp:", mach_absolute_time());
    v3 = v2;
  }

  return v2;
}

- (NSArray)sections
{
  return self->_sections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hiddenResults, 0);
  objc_storeStrong((id *)&self->_sections, 0);
}

- (void)clearSections
{
  -[NSArray removeAllObjects](self->_sections, "removeAllObjects");
}

- (unint64_t)sectionsCount
{
  return -[NSArray count](self->_sections, "count");
}

- (id)sectionsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", a3);
}

- (void)setHiddenResults:(id)a3
{
  NSArray *v4;
  NSArray *hiddenResults;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  hiddenResults = self->_hiddenResults;
  self->_hiddenResults = v4;

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

- (BOOL)readFrom:(id)a3
{
  return _CPRankingFeedbackReadFrom(self, (uint64_t)a3);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t timestamp;
  double blendingDuration;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  BOOL v20;
  int spotlightQueryIntent;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  timestamp = self->_timestamp;
  if (timestamp != objc_msgSend(v4, "timestamp"))
    goto LABEL_14;
  blendingDuration = self->_blendingDuration;
  objc_msgSend(v4, "blendingDuration");
  if (blendingDuration != v7)
    goto LABEL_14;
  -[_CPRankingFeedback sections](self, "sections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v8 == 0) == (v9 != 0))
    goto LABEL_13;
  -[_CPRankingFeedback sections](self, "sections");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    -[_CPRankingFeedback sections](self, "sections");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sections");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqual:", v13);

    if (!v14)
      goto LABEL_14;
  }
  else
  {

  }
  -[_CPRankingFeedback hiddenResults](self, "hiddenResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hiddenResults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v8 == 0) != (v9 != 0))
  {
    -[_CPRankingFeedback hiddenResults](self, "hiddenResults");
    v15 = objc_claimAutoreleasedReturnValue();
    if (!v15)
    {

LABEL_17:
      spotlightQueryIntent = self->_spotlightQueryIntent;
      v20 = spotlightQueryIntent == objc_msgSend(v4, "spotlightQueryIntent");
      goto LABEL_15;
    }
    v16 = (void *)v15;
    -[_CPRankingFeedback hiddenResults](self, "hiddenResults");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hiddenResults");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "isEqual:", v18);

    if (v19)
      goto LABEL_17;
  }
  else
  {
LABEL_13:

  }
LABEL_14:
  v20 = 0;
LABEL_15:

  return v20;
}

- (unint64_t)hash
{
  double blendingDuration;
  unint64_t v4;
  double v5;
  long double v6;
  unint64_t v7;
  uint64_t v8;

  blendingDuration = self->_blendingDuration;
  v4 = 2654435761u * self->_timestamp;
  v5 = -blendingDuration;
  if (blendingDuration >= 0.0)
    v5 = self->_blendingDuration;
  v6 = round(v5);
  v7 = (unint64_t)(fmod(v6, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v5 - v6, 0x40uLL);
  v8 = -[NSArray hash](self->_sections, "hash");
  return v8 ^ -[NSArray hash](self->_hiddenResults, "hash") ^ v4 ^ (2654435761 * self->_spotlightQueryIntent) ^ v7;
}

- (NSArray)hiddenResults
{
  return self->_hiddenResults;
}

- (int)spotlightQueryIntent
{
  return self->_spotlightQueryIntent;
}

- (void)setSpotlightQueryIntent:(int)a3
{
  self->_spotlightQueryIntent = a3;
}

@end
