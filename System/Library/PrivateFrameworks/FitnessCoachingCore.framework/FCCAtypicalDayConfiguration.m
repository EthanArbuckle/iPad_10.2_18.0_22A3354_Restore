@implementation FCCAtypicalDayConfiguration

- (FCCAtypicalDayConfiguration)initWithIdentifier:(id)a3 minimumAheadPercentage:(double)a4 minimumBehindPercentage:(double)a5 percentageOfDayRule:(id)a6 allowedGoalTypes:(id)a7
{
  id v12;
  id v13;
  id v14;
  FCCAtypicalDayConfiguration *v15;
  uint64_t v16;
  NSString *identifier;
  uint64_t v18;
  NSArray *allowedGoalTypes;
  objc_super v21;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  v21.receiver = self;
  v21.super_class = (Class)FCCAtypicalDayConfiguration;
  v15 = -[FCCAtypicalDayConfiguration init](&v21, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v12, "copy");
    identifier = v15->_identifier;
    v15->_identifier = (NSString *)v16;

    v15->_minimumAheadPercentage = a4;
    v15->_minimumBehindPercentage = a5;
    objc_storeStrong((id *)&v15->_percentageOfDayRule, a6);
    v18 = objc_msgSend(v14, "copy");
    allowedGoalTypes = v15->_allowedGoalTypes;
    v15->_allowedGoalTypes = (NSArray *)v18;

  }
  return v15;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FCCAtypicalDayConfiguration: { \n    identifier: %@, \n    minimumAheadPercentage: %.1f, \n    minimumBehindPercentage: %.1f, \n    allowedGoalTypes: %@ \n    percentageOfDayRule: %@ \n}"), self->_identifier, *(_QWORD *)&self->_minimumAheadPercentage, *(_QWORD *)&self->_minimumBehindPercentage, self->_allowedGoalTypes, self->_percentageOfDayRule);
}

- (FCCAtypicalDayConfiguration)initWithProtobuf:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  FCCPercentageOfDayRule *v10;
  void *v11;
  FCCPercentageOfDayRule *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  FCCAtypicalDayConfiguration *v17;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minimumAheadPercentage");
  v7 = v6;
  objc_msgSend(v4, "minimumBehindPercentage");
  v9 = v8;
  v10 = [FCCPercentageOfDayRule alloc];
  objc_msgSend(v4, "percentageOfDayRule");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[FCCPercentageOfDayRule initWithProtobuf:](v10, "initWithProtobuf:", v11);

  if (objc_msgSend(v4, "allowedGoalTypesCount"))
  {
    v13 = 0;
    v14 = (void *)MEMORY[0x1E0C9AA60];
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "allowedGoalTypesAtIndex:", v13));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "arrayByAddingObject:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      ++v13;
      v14 = v16;
    }
    while (objc_msgSend(v4, "allowedGoalTypesCount") > v13);
  }
  else
  {
    v16 = (void *)MEMORY[0x1E0C9AA60];
  }
  v17 = -[FCCAtypicalDayConfiguration initWithIdentifier:minimumAheadPercentage:minimumBehindPercentage:percentageOfDayRule:allowedGoalTypes:](self, "initWithIdentifier:minimumAheadPercentage:minimumBehindPercentage:percentageOfDayRule:allowedGoalTypes:", v5, v12, v16, v7, v9);

  return v17;
}

- (id)protobuf
{
  FCCAtypicalDayConfigurationProtobuf *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(FCCAtypicalDayConfigurationProtobuf);
  -[FCCAtypicalDayConfigurationProtobuf setIdentifier:](v3, "setIdentifier:", self->_identifier);
  -[FCCAtypicalDayConfigurationProtobuf setMinimumAheadPercentage:](v3, "setMinimumAheadPercentage:", self->_minimumAheadPercentage);
  -[FCCAtypicalDayConfigurationProtobuf setMinimumBehindPercentage:](v3, "setMinimumBehindPercentage:", self->_minimumBehindPercentage);
  -[FCCPercentageOfDayRule protobuf](self->_percentageOfDayRule, "protobuf");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCAtypicalDayConfigurationProtobuf setPercentageOfDayRule:](v3, "setPercentageOfDayRule:", v4);

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_allowedGoalTypes;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        -[FCCAtypicalDayConfigurationProtobuf addAllowedGoalTypes:](v3, "addAllowedGoalTypes:", objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9++), "unsignedIntValue", (_QWORD)v11));
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  return v3;
}

- (FCCAtypicalDayConfiguration)initWithTransportData:(id)a3
{
  id v4;
  FCCAtypicalDayConfigurationProtobuf *v5;
  FCCAtypicalDayConfiguration *v6;

  v4 = a3;
  v5 = -[FCCAtypicalDayConfigurationProtobuf initWithData:]([FCCAtypicalDayConfigurationProtobuf alloc], "initWithData:", v4);

  v6 = -[FCCAtypicalDayConfiguration initWithProtobuf:](self, "initWithProtobuf:", v5);
  return v6;
}

- (id)transportData
{
  void *v2;
  void *v3;

  -[FCCAtypicalDayConfiguration protobuf](self, "protobuf");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (double)minimumAheadPercentage
{
  return self->_minimumAheadPercentage;
}

- (double)minimumBehindPercentage
{
  return self->_minimumBehindPercentage;
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
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
