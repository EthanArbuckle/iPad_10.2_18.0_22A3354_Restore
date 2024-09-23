@implementation FCCAlmostThereConfiguration

- (FCCAlmostThereConfiguration)initWithIdentifier:(id)a3 minimumPercentageComplete:(double)a4 goalBufferPercentage:(double)a5 coalescingRules:(id)a6 timeOfDayRule:(id)a7 goalType:(int64_t)a8
{
  id v14;
  id v15;
  id v16;
  FCCAlmostThereConfiguration *v17;
  uint64_t v18;
  NSString *identifier;
  uint64_t v20;
  NSArray *coalescingRules;
  objc_super v23;

  v14 = a3;
  v15 = a6;
  v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)FCCAlmostThereConfiguration;
  v17 = -[FCCAlmostThereConfiguration init](&v23, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v14, "copy");
    identifier = v17->_identifier;
    v17->_identifier = (NSString *)v18;

    v17->_minimumPercentageComplete = a4;
    v17->_goalBufferPercentage = a5;
    v20 = objc_msgSend(v15, "copy");
    coalescingRules = v17->_coalescingRules;
    v17->_coalescingRules = (NSArray *)v20;

    objc_storeStrong((id *)&v17->_timeOfDayRule, a7);
    v17->_goalType = a8;
  }

  return v17;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FCCAlmostThereConfiguration: {\n    identifier: %@, \n    minimumPercentageComplete: %.1f, \n    goalBufferPercentage: %.1f, \n    goalType: %d \n    coalescingRules: %@ \n    timeOfDayRule: %@ \n}"), self->_identifier, *(_QWORD *)&self->_minimumPercentageComplete, *(_QWORD *)&self->_goalBufferPercentage, self->_goalType, self->_coalescingRules, self->_timeOfDayRule);
}

- (FCCAlmostThereConfiguration)initWithProtobuf:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  unint64_t v10;
  void *v11;
  FCCCoalescingRule *v12;
  void *v13;
  void *v14;
  FCCCoalescingRule *v15;
  void *v16;
  FCCTimeOfDayRule *v17;
  void *v18;
  FCCTimeOfDayRule *v19;
  FCCAlmostThereConfiguration *v20;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minimumPercentageComplete");
  v7 = v6;
  objc_msgSend(v4, "goalBufferPercentage");
  v9 = v8;
  if (objc_msgSend(v4, "coalescingRulesCount"))
  {
    v10 = 0;
    v11 = (void *)MEMORY[0x1E0C9AA60];
    do
    {
      v12 = [FCCCoalescingRule alloc];
      objc_msgSend(v4, "coalescingRulesAtIndex:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "data");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[FCCCoalescingRule initWithTransportData:](v12, "initWithTransportData:", v14);

      objc_msgSend(v11, "arrayByAddingObject:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      ++v10;
      v11 = v16;
    }
    while (objc_msgSend(v4, "coalescingRulesCount") > v10);
  }
  else
  {
    v16 = (void *)MEMORY[0x1E0C9AA60];
  }
  v17 = [FCCTimeOfDayRule alloc];
  objc_msgSend(v4, "timeOfDayRule");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[FCCTimeOfDayRule initWithProtobuf:](v17, "initWithProtobuf:", v18);

  v20 = -[FCCAlmostThereConfiguration initWithIdentifier:minimumPercentageComplete:goalBufferPercentage:coalescingRules:timeOfDayRule:goalType:](self, "initWithIdentifier:minimumPercentageComplete:goalBufferPercentage:coalescingRules:timeOfDayRule:goalType:", v5, v16, v19, (int)objc_msgSend(v4, "goalType"), v7, v9);
  return v20;
}

- (id)protobuf
{
  FCCAlmostThereConfigurationProtobuf *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(FCCAlmostThereConfigurationProtobuf);
  -[FCCAlmostThereConfigurationProtobuf setIdentifier:](v3, "setIdentifier:", self->_identifier);
  -[FCCAlmostThereConfigurationProtobuf setMinimumPercentageComplete:](v3, "setMinimumPercentageComplete:", self->_minimumPercentageComplete);
  -[FCCAlmostThereConfigurationProtobuf setGoalBufferPercentage:](v3, "setGoalBufferPercentage:", self->_goalBufferPercentage);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_coalescingRules;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "protobuf", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[FCCAlmostThereConfigurationProtobuf addCoalescingRules:](v3, "addCoalescingRules:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  -[FCCTimeOfDayRule protobuf](self->_timeOfDayRule, "protobuf");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCAlmostThereConfigurationProtobuf setTimeOfDayRule:](v3, "setTimeOfDayRule:", v10);

  -[FCCAlmostThereConfigurationProtobuf setGoalType:](v3, "setGoalType:", LODWORD(self->_goalType));
  return v3;
}

- (FCCAlmostThereConfiguration)initWithTransportData:(id)a3
{
  id v4;
  FCCAlmostThereConfigurationProtobuf *v5;
  FCCAlmostThereConfiguration *v6;

  v4 = a3;
  v5 = -[FCCAlmostThereConfigurationProtobuf initWithData:]([FCCAlmostThereConfigurationProtobuf alloc], "initWithData:", v4);

  v6 = -[FCCAlmostThereConfiguration initWithProtobuf:](self, "initWithProtobuf:", v5);
  return v6;
}

- (id)transportData
{
  void *v2;
  void *v3;

  -[FCCAlmostThereConfiguration protobuf](self, "protobuf");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (double)minimumPercentageComplete
{
  return self->_minimumPercentageComplete;
}

- (double)goalBufferPercentage
{
  return self->_goalBufferPercentage;
}

- (NSArray)coalescingRules
{
  return self->_coalescingRules;
}

- (FCCTimeOfDayRule)timeOfDayRule
{
  return self->_timeOfDayRule;
}

- (int64_t)goalType
{
  return self->_goalType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeOfDayRule, 0);
  objc_storeStrong((id *)&self->_coalescingRules, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
