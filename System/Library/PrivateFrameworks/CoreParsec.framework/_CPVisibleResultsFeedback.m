@implementation _CPVisibleResultsFeedback

- (_CPVisibleResultsFeedback)initWithFacade:(id)a3
{
  id v4;
  _CPVisibleResultsFeedback *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  _CPSearchResultForFeedback *v13;
  void *v14;
  _CPSearchResultForFeedback *v15;
  void *v16;
  _CPSearchResultForFeedback *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  _CPVisibleResultsFeedback *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  objc_super v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)_CPVisibleResultsFeedback;
  v5 = -[_CPVisibleResultsFeedback init](&v46, sel_init);
  if (v5)
  {
    -[_CPVisibleResultsFeedback setTimestamp:](v5, "setTimestamp:", objc_msgSend(v4, "timestamp"));
    objc_msgSend(v4, "results");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    objc_msgSend(v4, "results");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v43 != v11)
            objc_enumerationMutation(v8);
          v13 = -[_CPSearchResultForFeedback initWithFacade:]([_CPSearchResultForFeedback alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i));
          objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
      }
      while (v10);
    }

    -[_CPVisibleResultsFeedback setResults:](v5, "setResults:", v7);
    -[_CPVisibleResultsFeedback setTriggerEvent:](v5, "setTriggerEvent:", objc_msgSend(v4, "triggerEvent"));
    objc_msgSend(v4, "goTakeoverResult");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = [_CPSearchResultForFeedback alloc];
      objc_msgSend(v4, "goTakeoverResult");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[_CPSearchResultForFeedback initWithFacade:](v15, "initWithFacade:", v16);
      -[_CPVisibleResultsFeedback setGoTakeoverResult:](v5, "setGoTakeoverResult:", v17);

    }
    objc_msgSend(v4, "uniqueIdsOfVisibleButtons");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
      v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v19 = 0;

    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    objc_msgSend(v4, "uniqueIdsOfVisibleButtons");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v39;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v39 != v23)
            objc_enumerationMutation(v20);
          if (*(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * j))
            objc_msgSend(v19, "addObject:");
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
      }
      while (v22);
    }

    -[_CPVisibleResultsFeedback setUniqueIdsOfVisibleButtons:](v5, "setUniqueIdsOfVisibleButtons:", v19);
    objc_msgSend(v4, "uniqueIdentifiersOfVisibleCardSections");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
      v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v26 = 0;

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend(v4, "uniqueIdentifiersOfVisibleCardSections", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v35;
      do
      {
        for (k = 0; k != v29; ++k)
        {
          if (*(_QWORD *)v35 != v30)
            objc_enumerationMutation(v27);
          if (*(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * k))
            objc_msgSend(v26, "addObject:");
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
      }
      while (v29);
    }

    -[_CPVisibleResultsFeedback setUniqueIdentifiersOfVisibleCardSections:](v5, "setUniqueIdentifiersOfVisibleCardSections:", v26);
    v32 = v5;

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
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[_CPVisibleResultsFeedback timestamp](self, "timestamp"))
    PBDataWriterWriteUint64Field();
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v5 = self->_results;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v31;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v7);
  }

  if (-[_CPVisibleResultsFeedback triggerEvent](self, "triggerEvent"))
    PBDataWriterWriteInt32Field();
  -[_CPVisibleResultsFeedback goTakeoverResult](self, "goTakeoverResult");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_CPVisibleResultsFeedback goTakeoverResult](self, "goTakeoverResult");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v12 = self->_uniqueIdsOfVisibleButtons;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v27;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v16), "unsignedLongLongValue");
        PBDataWriterWriteUint64Field();
        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    }
    while (v14);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v17 = self->_uniqueIdentifiersOfVisibleCardSections;
  v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v23;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v23 != v20)
          objc_enumerationMutation(v17);
        PBDataWriterWriteStringField();
        ++v21;
      }
      while (v19 != v21);
      v19 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
    }
    while (v19);
  }

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int)triggerEvent
{
  return self->_triggerEvent;
}

- (_CPSearchResultForFeedback)goTakeoverResult
{
  return self->_goTakeoverResult;
}

- (void)setTriggerEvent:(int)a3
{
  self->_triggerEvent = a3;
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

- (void)setUniqueIdsOfVisibleButtons:(id)a3
{
  NSArray *v4;
  NSArray *uniqueIdsOfVisibleButtons;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  uniqueIdsOfVisibleButtons = self->_uniqueIdsOfVisibleButtons;
  self->_uniqueIdsOfVisibleButtons = v4;

}

- (void)setUniqueIdentifiersOfVisibleCardSections:(id)a3
{
  NSArray *v4;
  NSArray *uniqueIdentifiersOfVisibleCardSections;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  uniqueIdentifiersOfVisibleCardSections = self->_uniqueIdentifiersOfVisibleCardSections;
  self->_uniqueIdentifiersOfVisibleCardSections = v4;

}

- (void)setResults:(id)a3
{
  NSArray *v4;
  NSArray *results;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  results = self->_results;
  self->_results = v4;

}

- (NSArray)results
{
  return self->_results;
}

- (_CPVisibleResultsFeedback)init
{
  _CPVisibleResultsFeedback *v2;
  _CPVisibleResultsFeedback *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_CPVisibleResultsFeedback;
  v2 = -[_CPVisibleResultsFeedback init](&v5, sel_init);
  if (v2)
  {
    -[_CPVisibleResultsFeedback setTimestamp:](v2, "setTimestamp:", mach_absolute_time());
    v3 = v2;
  }

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifiersOfVisibleCardSections, 0);
  objc_storeStrong((id *)&self->_uniqueIdsOfVisibleButtons, 0);
  objc_storeStrong((id *)&self->_goTakeoverResult, 0);
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

- (void)clearUniqueIdsOfVisibleButtons
{
  -[NSArray removeAllObjects](self->_uniqueIdsOfVisibleButtons, "removeAllObjects");
}

- (void)addUniqueIdsOfVisibleButtons:(unint64_t)a3
{
  NSArray *uniqueIdsOfVisibleButtons;
  NSArray *v6;
  NSArray *v7;
  id v8;

  uniqueIdsOfVisibleButtons = self->_uniqueIdsOfVisibleButtons;
  if (!uniqueIdsOfVisibleButtons)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_uniqueIdsOfVisibleButtons;
    self->_uniqueIdsOfVisibleButtons = v6;

    uniqueIdsOfVisibleButtons = self->_uniqueIdsOfVisibleButtons;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](uniqueIdsOfVisibleButtons, "addObject:", v8);

}

- (unint64_t)uniqueIdsOfVisibleButtonsCount
{
  return -[NSArray count](self->_uniqueIdsOfVisibleButtons, "count");
}

- (unint64_t)uniqueIdsOfVisibleButtonsAtIndex:(unint64_t)a3
{
  void *v3;
  unint64_t v4;

  -[NSArray objectAtIndexedSubscript:](self->_uniqueIdsOfVisibleButtons, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedLongLongValue");

  return v4;
}

- (void)clearUniqueIdentifiersOfVisibleCardSections
{
  -[NSArray removeAllObjects](self->_uniqueIdentifiersOfVisibleCardSections, "removeAllObjects");
}

- (void)addUniqueIdentifiersOfVisibleCardSections:(id)a3
{
  id v4;
  NSArray *uniqueIdentifiersOfVisibleCardSections;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  uniqueIdentifiersOfVisibleCardSections = self->_uniqueIdentifiersOfVisibleCardSections;
  v8 = v4;
  if (!uniqueIdentifiersOfVisibleCardSections)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_uniqueIdentifiersOfVisibleCardSections;
    self->_uniqueIdentifiersOfVisibleCardSections = v6;

    v4 = v8;
    uniqueIdentifiersOfVisibleCardSections = self->_uniqueIdentifiersOfVisibleCardSections;
  }
  -[NSArray addObject:](uniqueIdentifiersOfVisibleCardSections, "addObject:", v4);

}

- (unint64_t)uniqueIdentifiersOfVisibleCardSectionsCount
{
  return -[NSArray count](self->_uniqueIdentifiersOfVisibleCardSections, "count");
}

- (id)uniqueIdentifiersOfVisibleCardSectionsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_uniqueIdentifiersOfVisibleCardSections, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return _CPVisibleResultsFeedbackReadFrom(self, (uint64_t)a3);
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
  int triggerEvent;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  BOOL v29;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  timestamp = self->_timestamp;
  if (timestamp != objc_msgSend(v4, "timestamp"))
    goto LABEL_24;
  -[_CPVisibleResultsFeedback results](self, "results");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "results");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_23;
  -[_CPVisibleResultsFeedback results](self, "results");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[_CPVisibleResultsFeedback results](self, "results");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "results");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_24;
  }
  else
  {

  }
  triggerEvent = self->_triggerEvent;
  if (triggerEvent != objc_msgSend(v4, "triggerEvent"))
    goto LABEL_24;
  -[_CPVisibleResultsFeedback goTakeoverResult](self, "goTakeoverResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "goTakeoverResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_23;
  -[_CPVisibleResultsFeedback goTakeoverResult](self, "goTakeoverResult");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    -[_CPVisibleResultsFeedback goTakeoverResult](self, "goTakeoverResult");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "goTakeoverResult");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if (!v18)
      goto LABEL_24;
  }
  else
  {

  }
  -[_CPVisibleResultsFeedback uniqueIdsOfVisibleButtons](self, "uniqueIdsOfVisibleButtons");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdsOfVisibleButtons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_23;
  -[_CPVisibleResultsFeedback uniqueIdsOfVisibleButtons](self, "uniqueIdsOfVisibleButtons");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    -[_CPVisibleResultsFeedback uniqueIdsOfVisibleButtons](self, "uniqueIdsOfVisibleButtons");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueIdsOfVisibleButtons");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if (!v23)
      goto LABEL_24;
  }
  else
  {

  }
  -[_CPVisibleResultsFeedback uniqueIdentifiersOfVisibleCardSections](self, "uniqueIdentifiersOfVisibleCardSections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifiersOfVisibleCardSections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_23:

    goto LABEL_24;
  }
  -[_CPVisibleResultsFeedback uniqueIdentifiersOfVisibleCardSections](self, "uniqueIdentifiersOfVisibleCardSections");
  v24 = objc_claimAutoreleasedReturnValue();
  if (!v24)
  {

LABEL_27:
    v29 = 1;
    goto LABEL_25;
  }
  v25 = (void *)v24;
  -[_CPVisibleResultsFeedback uniqueIdentifiersOfVisibleCardSections](self, "uniqueIdentifiersOfVisibleCardSections");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifiersOfVisibleCardSections");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v26, "isEqual:", v27);

  if ((v28 & 1) != 0)
    goto LABEL_27;
LABEL_24:
  v29 = 0;
LABEL_25:

  return v29;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v3 = 2654435761u * self->_timestamp;
  v4 = -[NSArray hash](self->_results, "hash") ^ v3;
  v5 = 2654435761 * self->_triggerEvent;
  v6 = v4 ^ v5 ^ -[_CPSearchResultForFeedback hash](self->_goTakeoverResult, "hash");
  v7 = -[NSArray hash](self->_uniqueIdsOfVisibleButtons, "hash");
  return v6 ^ v7 ^ -[NSArray hash](self->_uniqueIdentifiersOfVisibleCardSections, "hash");
}

- (void)setGoTakeoverResult:(id)a3
{
  objc_storeStrong((id *)&self->_goTakeoverResult, a3);
}

- (NSArray)uniqueIdsOfVisibleButtons
{
  return self->_uniqueIdsOfVisibleButtons;
}

- (NSArray)uniqueIdentifiersOfVisibleCardSections
{
  return self->_uniqueIdentifiersOfVisibleCardSections;
}

@end
