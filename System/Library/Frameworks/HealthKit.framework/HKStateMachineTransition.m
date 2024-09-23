@implementation HKStateMachineTransition

- (HKStateMachineTransition)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKStateMachineTransition)initWithEvent:(int64_t)a3 label:(id)a4 from:(id)a5 to:(id)a6
{
  id v10;
  id v11;
  id v12;
  HKStateMachineTransition *v13;
  HKStateMachineTransition *v14;
  uint64_t v15;
  NSString *label;
  objc_super v18;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HKStateMachineTransition;
  v13 = -[HKStateMachineTransition init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_event = a3;
    v15 = objc_msgSend(v10, "copy");
    label = v14->_label;
    v14->_label = (NSString *)v15;

    objc_storeWeak((id *)&v14->_fromState, v11);
    objc_storeWeak((id *)&v14->_toState, v12);
  }

  return v14;
}

- (id)description
{
  void *v3;
  NSString *label;
  int64_t event;
  id WeakRetained;
  id v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  event = self->_event;
  label = self->_label;
  WeakRetained = objc_loadWeakRetained((id *)&self->_fromState);
  v7 = objc_loadWeakRetained((id *)&self->_toState);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@(%ld): %@ -> %@>"), label, event, WeakRetained, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id *v4;
  int64_t event;
  id WeakRetained;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  BOOL v11;

  v4 = (id *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    event = self->_event;
    if (v4[1] && -[NSString isEqualToString:](self->_label, "isEqualToString:", v4[2]))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_toState);
      v7 = objc_loadWeakRetained(v4 + 4);
      if (objc_msgSend(WeakRetained, "isEqual:", v7))
      {
        v8 = objc_loadWeakRetained((id *)&self->_fromState);
        v9 = objc_loadWeakRetained(v4 + 3);
        v10 = objc_msgSend(v8, "isEqual:", v9);

      }
      else
      {
        v10 = 0;
      }
      v11 = event == v10;

    }
    else
    {
      v11 = event == 0;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (int64_t)event
{
  return self->_event;
}

- (NSString)label
{
  return self->_label;
}

- (HKStateMachineState)fromState
{
  return (HKStateMachineState *)objc_loadWeakRetained((id *)&self->_fromState);
}

- (HKStateMachineState)toState
{
  return (HKStateMachineState *)objc_loadWeakRetained((id *)&self->_toState);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_toState);
  objc_destroyWeak((id *)&self->_fromState);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
