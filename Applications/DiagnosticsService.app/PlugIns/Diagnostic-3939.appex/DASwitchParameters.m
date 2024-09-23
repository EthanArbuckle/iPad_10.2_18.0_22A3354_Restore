@implementation DASwitchParameters

- (DASwitchParameters)initWithDictionary:(id)a3
{
  id v4;
  DASwitchParameters *v5;
  void *v6;
  void *v7;
  int v8;
  BOOL v9;
  NSSet *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSArray *states;
  objc_super v16;
  char v17;

  v4 = a3;
  v17 = 0;
  v16.receiver = self;
  v16.super_class = (Class)DASwitchParameters;
  v5 = -[DAParameters initWithDictionary:](&v16, "initWithDictionary:", v4);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("on"), CFSTR("off"), 0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_stringFromRequiredKey:inSet:failed:", CFSTR("startingState"), v6, &v17));

    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("on")) & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      if (!objc_msgSend(v7, "isEqualToString:", CFSTR("off")))
      {
LABEL_8:
        v10 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(NSDictionary));
        v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_arrayFromRequiredKey:types:maxLength:failed:", CFSTR("states"), v11, 100, &v17));

        v13 = objc_claimAutoreleasedReturnValue(+[DASpecification specificationFromArray:](DASwitchState, "specificationFromArray:", v12));
        states = v5->_states;
        v5->_states = (NSArray *)v13;

        v9 = v17 == 0;
        goto LABEL_9;
      }
      v8 = 0;
    }
    v5->_startingState = v8;
    goto LABEL_8;
  }
  v9 = 1;
LABEL_9:
  if (!v5->_states || !v9)
  {

    v5 = 0;
  }

  return v5;
}

- (int)startingState
{
  return self->_startingState;
}

- (void)setStartingState:(int)a3
{
  self->_startingState = a3;
}

- (NSArray)states
{
  return self->_states;
}

- (void)setStates:(id)a3
{
  objc_storeStrong((id *)&self->_states, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_states, 0);
}

@end
