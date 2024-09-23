@implementation FCCCompletionOffTrackConfiguration

- (FCCCompletionOffTrackConfiguration)initWithIdentifier:(id)a3 goalBufferPercentage:(double)a4 coalescingRules:(id)a5 percentageOfDayRule:(id)a6 allowedGoalTypes:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  FCCCompletionOffTrackConfiguration *v16;
  uint64_t v17;
  NSString *identifier;
  uint64_t v19;
  NSArray *coalescingRules;
  uint64_t v21;
  NSArray *allowedGoalTypes;
  objc_super v24;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v24.receiver = self;
  v24.super_class = (Class)FCCCompletionOffTrackConfiguration;
  v16 = -[FCCCompletionOffTrackConfiguration init](&v24, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    identifier = v16->_identifier;
    v16->_identifier = (NSString *)v17;

    v16->_goalBufferPercentage = a4;
    v19 = objc_msgSend(v13, "copy");
    coalescingRules = v16->_coalescingRules;
    v16->_coalescingRules = (NSArray *)v19;

    objc_storeStrong((id *)&v16->_percentageOfDayRule, a6);
    v21 = objc_msgSend(v15, "copy");
    allowedGoalTypes = v16->_allowedGoalTypes;
    v16->_allowedGoalTypes = (NSArray *)v21;

  }
  return v16;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FCCCompletionOffTrackConfiguration: { \n    identifier: %@, \n    goalBufferPercentage: %.1f, \n    allowedGoalTypes: %@, \n    coalescingRules: %@ \n    percentageOfDayRule: %@ \n}"), self->_identifier, *(_QWORD *)&self->_goalBufferPercentage, self->_allowedGoalTypes, self->_coalescingRules, self->_percentageOfDayRule);
}

- (FCCCompletionOffTrackConfiguration)initWithProtobuf:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  unint64_t v8;
  void *v9;
  FCCCoalescingRule *v10;
  void *v11;
  void *v12;
  FCCCoalescingRule *v13;
  void *v14;
  FCCPercentageOfDayRule *v15;
  void *v16;
  FCCPercentageOfDayRule *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  FCCCompletionOffTrackConfiguration *v22;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "goalBufferPercentage");
  v7 = v6;
  if (objc_msgSend(v4, "coalescingRulesCount"))
  {
    v8 = 0;
    v9 = (void *)MEMORY[0x1E0C9AA60];
    do
    {
      v10 = [FCCCoalescingRule alloc];
      objc_msgSend(v4, "coalescingRulesAtIndex:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "data");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[FCCCoalescingRule initWithTransportData:](v10, "initWithTransportData:", v12);

      objc_msgSend(v9, "arrayByAddingObject:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      ++v8;
      v9 = v14;
    }
    while (objc_msgSend(v4, "coalescingRulesCount") > v8);
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0C9AA60];
  }
  v15 = [FCCPercentageOfDayRule alloc];
  objc_msgSend(v4, "percentageOfDayRule");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[FCCPercentageOfDayRule initWithProtobuf:](v15, "initWithProtobuf:", v16);

  if (objc_msgSend(v4, "allowedGoalTypesCount"))
  {
    v18 = 0;
    v19 = (void *)MEMORY[0x1E0C9AA60];
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "allowedGoalTypesAtIndex:", v18));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "arrayByAddingObject:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      ++v18;
      v19 = v21;
    }
    while (objc_msgSend(v4, "allowedGoalTypesCount") > v18);
  }
  else
  {
    v21 = (void *)MEMORY[0x1E0C9AA60];
  }
  v22 = -[FCCCompletionOffTrackConfiguration initWithIdentifier:goalBufferPercentage:coalescingRules:percentageOfDayRule:allowedGoalTypes:](self, "initWithIdentifier:goalBufferPercentage:coalescingRules:percentageOfDayRule:allowedGoalTypes:", v5, v14, v17, v21, v7);

  return v22;
}

- (id)protobuf
{
  FCCCompletionOffTrackConfigurationProtobuf *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(FCCCompletionOffTrackConfigurationProtobuf);
  -[FCCCompletionOffTrackConfigurationProtobuf setIdentifier:](v3, "setIdentifier:", self->_identifier);
  -[FCCCompletionOffTrackConfigurationProtobuf setGoalBufferPercentage:](v3, "setGoalBufferPercentage:", self->_goalBufferPercentage);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = self->_coalescingRules;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v8), "protobuf");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[FCCCompletionOffTrackConfigurationProtobuf addCoalescingRules:](v3, "addCoalescingRules:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v6);
  }

  -[FCCPercentageOfDayRule protobuf](self->_percentageOfDayRule, "protobuf");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCCompletionOffTrackConfigurationProtobuf setPercentageOfDayRule:](v3, "setPercentageOfDayRule:", v10);

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = self->_allowedGoalTypes;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        -[FCCCompletionOffTrackConfigurationProtobuf addAllowedGoalTypes:](v3, "addAllowedGoalTypes:", objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v15++), "unsignedIntValue", (_QWORD)v17));
      }
      while (v13 != v15);
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v13);
  }

  return v3;
}

- (FCCCompletionOffTrackConfiguration)initWithTransportData:(id)a3
{
  id v4;
  FCCCompletionOffTrackConfigurationProtobuf *v5;
  FCCCompletionOffTrackConfiguration *v6;

  v4 = a3;
  v5 = -[FCCCompletionOffTrackConfigurationProtobuf initWithData:]([FCCCompletionOffTrackConfigurationProtobuf alloc], "initWithData:", v4);

  v6 = -[FCCCompletionOffTrackConfiguration initWithProtobuf:](self, "initWithProtobuf:", v5);
  return v6;
}

- (id)transportData
{
  void *v2;
  void *v3;

  -[FCCCompletionOffTrackConfiguration protobuf](self, "protobuf");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (double)goalBufferPercentage
{
  return self->_goalBufferPercentage;
}

- (NSArray)coalescingRules
{
  return self->_coalescingRules;
}

- (FCCPercentageOfDayRule)percentageOfDayRule
{
  return self->_percentageOfDayRule;
}

- (NSArray)allowedGoalTypes
{
  return self->_allowedGoalTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedGoalTypes, 0);
  objc_storeStrong((id *)&self->_percentageOfDayRule, 0);
  objc_storeStrong((id *)&self->_coalescingRules, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
