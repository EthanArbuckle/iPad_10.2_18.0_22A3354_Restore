@implementation FCCGoalCompletionContent

- (FCCGoalCompletionContent)initWithActivitySummaryIndex:(int64_t)a3 identifier:(id)a4 completedGoalTypes:(id)a5
{
  id v8;
  id v9;
  FCCGoalCompletionContent *v10;
  FCCGoalCompletionContent *v11;
  uint64_t v12;
  NSString *identifier;
  uint64_t v14;
  NSArray *completedGoalTypes;
  objc_super v17;

  v8 = a4;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)FCCGoalCompletionContent;
  v10 = -[FCCGoalCompletionContent init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_activitySummaryIndex = a3;
    v12 = objc_msgSend(v8, "copy");
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    completedGoalTypes = v11->_completedGoalTypes;
    v11->_completedGoalTypes = (NSArray *)v14;

  }
  return v11;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FCCGoalCompletionContent: activitySummaryIndex: %lld, identifier: %@, completedGoalTypes: %@"), self->_activitySummaryIndex, self->_identifier, self->_completedGoalTypes);
}

- (FCCGoalCompletionContent)initWithTransportData:(id)a3
{
  id v4;
  FCCGoalCompletionProtobuf *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  FCCGoalCompletionContent *v12;

  v4 = a3;
  v5 = -[FCCGoalCompletionProtobuf initWithData:]([FCCGoalCompletionProtobuf alloc], "initWithData:", v4);
  v6 = -[FCCGoalCompletionProtobuf activitySummaryIndex](v5, "activitySummaryIndex");
  -[FCCGoalCompletionProtobuf identifier](v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[FCCGoalCompletionProtobuf completedGoalTypesCount](v5, "completedGoalTypesCount"))
  {
    v8 = 0;
    v9 = (void *)MEMORY[0x1E0C9AA60];
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[FCCGoalCompletionProtobuf completedGoalTypesAtIndex:](v5, "completedGoalTypesAtIndex:", v8));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "arrayByAddingObject:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      ++v8;
      v9 = v11;
    }
    while (-[FCCGoalCompletionProtobuf completedGoalTypesCount](v5, "completedGoalTypesCount") > v8);
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C9AA60];
  }
  v12 = -[FCCGoalCompletionContent initWithActivitySummaryIndex:identifier:completedGoalTypes:](self, "initWithActivitySummaryIndex:identifier:completedGoalTypes:", v6, v7, v11);

  return v12;
}

- (id)transportData
{
  FCCGoalCompletionProtobuf *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(FCCGoalCompletionProtobuf);
  -[FCCGoalCompletionProtobuf setActivitySummaryIndex:](v3, "setActivitySummaryIndex:", self->_activitySummaryIndex);
  -[FCCGoalCompletionProtobuf setIdentifier:](v3, "setIdentifier:", self->_identifier);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_completedGoalTypes;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        -[FCCGoalCompletionProtobuf addCompletedGoalTypes:](v3, "addCompletedGoalTypes:", objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8++), "unsignedIntValue", (_QWORD)v11));
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  -[FCCGoalCompletionProtobuf data](v3, "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int64_t)activitySummaryIndex
{
  return self->_activitySummaryIndex;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSArray)completedGoalTypes
{
  return self->_completedGoalTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completedGoalTypes, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
