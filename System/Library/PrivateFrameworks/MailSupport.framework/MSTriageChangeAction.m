@implementation MSTriageChangeAction

- (MSTriageChangeAction)initWithChangeAction:(int64_t)a3 flagState:(BOOL)a4
{
  return -[MSTriageChangeAction initWithChangeAction:flagState:flagColors:readLaterDate:](self, "initWithChangeAction:flagState:flagColors:readLaterDate:", a3, a4, 0, 0);
}

- (MSTriageChangeAction)initWithChangeAction:(int64_t)a3 flagState:(BOOL)a4 flagColors:(id)a5
{
  return -[MSTriageChangeAction initWithChangeAction:flagState:flagColors:readLaterDate:](self, "initWithChangeAction:flagState:flagColors:readLaterDate:", a3, a4, a5, 0);
}

- (MSTriageChangeAction)initWithChangeAction:(int64_t)a3 flagState:(BOOL)a4 readLaterDate:(id)a5
{
  return -[MSTriageChangeAction initWithChangeAction:flagState:flagColors:readLaterDate:](self, "initWithChangeAction:flagState:flagColors:readLaterDate:", a3, a4, 0, a5);
}

- (MSTriageChangeAction)initWithChangeAction:(int64_t)a3 flagState:(BOOL)a4 flagColors:(id)a5 readLaterDate:(id)a6
{
  id v10;
  id v11;
  MSTriageChangeAction *v12;
  MSTriageChangeAction *v13;
  uint64_t v14;
  NSIndexSet *flagColors;
  objc_super v17;

  v10 = a5;
  v11 = a6;
  v17.receiver = self;
  v17.super_class = (Class)MSTriageChangeAction;
  v12 = -[MSTriageChangeAction init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_action = a3;
    v12->_flagState = a4;
    v14 = objc_msgSend(v10, "copy");
    flagColors = v13->_flagColors;
    v13->_flagColors = (NSIndexSet *)v14;

    objc_storeStrong((id *)&v13->_readLaterDate, a6);
  }

  return v13;
}

- (NSString)ef_publicDescription
{
  void *v3;
  int64_t v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[MSTriageChangeAction action](self, "action");
  v5 = -[MSTriageChangeAction flagState](self, "flagState");
  -[MSTriageChangeAction flagColors](self, "flagColors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSTriageChangeAction readLaterDate](self, "readLaterDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Action: %ld, flagState: %d, flagColors: %@, readLaterDate: %@"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (int64_t)action
{
  return self->_action;
}

- (BOOL)flagState
{
  return self->_flagState;
}

- (NSIndexSet)flagColors
{
  return self->_flagColors;
}

- (NSDate)readLaterDate
{
  return self->_readLaterDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readLaterDate, 0);
  objc_storeStrong((id *)&self->_flagColors, 0);
}

@end
