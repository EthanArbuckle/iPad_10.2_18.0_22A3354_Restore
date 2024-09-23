@implementation FCCGoalProgressContent

- (FCCGoalProgressContent)initWithEventIdentifier:(id)a3 goalTypesToDisplay:(id)a4 goalTypeToHighlight:(int64_t)a5 expectedGoalValue:(double)a6
{
  id v10;
  id v11;
  FCCGoalProgressContent *v12;
  uint64_t v13;
  NSString *eventIdentifier;
  uint64_t v15;
  NSArray *goalTypesToDisplay;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v18.receiver = self;
  v18.super_class = (Class)FCCGoalProgressContent;
  v12 = -[FCCGoalProgressContent init](&v18, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    eventIdentifier = v12->_eventIdentifier;
    v12->_eventIdentifier = (NSString *)v13;

    v15 = objc_msgSend(v11, "copy");
    goalTypesToDisplay = v12->_goalTypesToDisplay;
    v12->_goalTypesToDisplay = (NSArray *)v15;

    v12->_goalTypeToHighlight = a5;
    v12->_expectedGoalValue = a6;
  }

  return v12;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FCCGoalProgressContent: {\n    eventIdentifier: %@, \n    goalTypesToDisplay: %@, \n    goalTypeToHighlight: %d, \n    expectedGoalValue: %.1f \n}"), self->_eventIdentifier, self->_goalTypesToDisplay, self->_goalTypeToHighlight, *(_QWORD *)&self->_expectedGoalValue);
}

- (FCCGoalProgressContent)initWithTransportData:(id)a3
{
  id v4;
  FCCGoalProgressContentProtobuf *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  FCCGoalProgressContent *v12;

  v4 = a3;
  v5 = -[FCCGoalProgressContentProtobuf initWithData:]([FCCGoalProgressContentProtobuf alloc], "initWithData:", v4);
  -[FCCGoalProgressContentProtobuf eventIdentifier](v5, "eventIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[FCCGoalProgressContentProtobuf goalTypesToDisplaysCount](v5, "goalTypesToDisplaysCount"))
  {
    v7 = 0;
    v8 = (void *)MEMORY[0x1E0C9AA60];
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[FCCGoalProgressContentProtobuf goalTypesToDisplayAtIndex:](v5, "goalTypesToDisplayAtIndex:", v7));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "arrayByAddingObject:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      ++v7;
      v8 = v10;
    }
    while (-[FCCGoalProgressContentProtobuf goalTypesToDisplaysCount](v5, "goalTypesToDisplaysCount") > v7);
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C9AA60];
  }
  v11 = -[FCCGoalProgressContentProtobuf goalTypeToHighlight](v5, "goalTypeToHighlight");
  -[FCCGoalProgressContentProtobuf expectedGoalValue](v5, "expectedGoalValue");
  v12 = -[FCCGoalProgressContent initWithEventIdentifier:goalTypesToDisplay:goalTypeToHighlight:expectedGoalValue:](self, "initWithEventIdentifier:goalTypesToDisplay:goalTypeToHighlight:expectedGoalValue:", v6, v10, v11);

  return v12;
}

- (id)transportData
{
  FCCGoalProgressContentProtobuf *v3;
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
  v3 = objc_alloc_init(FCCGoalProgressContentProtobuf);
  -[FCCGoalProgressContentProtobuf setEventIdentifier:](v3, "setEventIdentifier:", self->_eventIdentifier);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_goalTypesToDisplay;
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
        -[FCCGoalProgressContentProtobuf addGoalTypesToDisplay:](v3, "addGoalTypesToDisplay:", objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8++), "unsignedIntValue", (_QWORD)v11));
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  -[FCCGoalProgressContentProtobuf setGoalTypeToHighlight:](v3, "setGoalTypeToHighlight:", LODWORD(self->_goalTypeToHighlight));
  -[FCCGoalProgressContentProtobuf setExpectedGoalValue:](v3, "setExpectedGoalValue:", self->_expectedGoalValue);
  -[FCCGoalProgressContentProtobuf data](v3, "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)eventIdentifier
{
  return self->_eventIdentifier;
}

- (NSArray)goalTypesToDisplay
{
  return self->_goalTypesToDisplay;
}

- (int64_t)goalTypeToHighlight
{
  return self->_goalTypeToHighlight;
}

- (double)expectedGoalValue
{
  return self->_expectedGoalValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_goalTypesToDisplay, 0);
  objc_storeStrong((id *)&self->_eventIdentifier, 0);
}

@end
