@implementation LACDTORatchetStateComposite

- (LACDTORatchetStateComposite)initWithRatchetState:(id)a3 gracePeriodState:(id)a4 watchdogs:(id)a5
{
  id v9;
  id v10;
  id v11;
  LACDTORatchetStateComposite *v12;
  LACDTORatchetStateComposite *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)LACDTORatchetStateComposite;
  v12 = -[LACDTORatchetStateComposite init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_ratchetState, a3);
    objc_storeStrong((id *)&v13->_gracePeriodState, a4);
    objc_storeStrong((id *)&v13->_watchdogs, a5);
  }

  return v13;
}

+ (id)nullInstance
{
  LACDTORatchetStateComposite *v2;
  void *v3;
  void *v4;
  void *v5;
  LACDTORatchetStateComposite *v6;

  v2 = [LACDTORatchetStateComposite alloc];
  +[LACDTORatchetState nullInstance](LACDTORatchetState, "nullInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[LACDTOGracePeriodState nullInstance](LACDTOGracePeriodState, "nullInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[LACDTOBiometryWatchdogPack nullInstance](LACDTOBiometryWatchdogPack, "nullInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[LACDTORatchetStateComposite initWithRatchetState:gracePeriodState:watchdogs:](v2, "initWithRatchetState:gracePeriodState:watchdogs:", v3, v4, v5);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[LACDTORatchetStateComposite ratchetState](self, "ratchetState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_ratchetState);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[LACDTORatchetStateComposite gracePeriodState](self, "gracePeriodState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_gracePeriodState);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[LACDTORatchetStateComposite watchdogs](self, "watchdogs");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_watchdogs);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, v9);

}

- (LACDTORatchetStateComposite)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  LACDTORatchetStateComposite *v14;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_ratchetState);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  NSStringFromSelector(sel_gracePeriodState);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_opt_class();
  NSStringFromSelector(sel_watchdogs);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[LACDTORatchetStateComposite initWithRatchetState:gracePeriodState:watchdogs:](self, "initWithRatchetState:gracePeriodState:watchdogs:", v7, v10, v13);
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "ratchetState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LACDTORatchetStateComposite ratchetState](self, "ratchetState");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      objc_msgSend(v5, "ratchetState");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[LACDTORatchetStateComposite ratchetState](self, "ratchetState");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_9;
    }
    objc_msgSend(v5, "gracePeriodState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[LACDTORatchetStateComposite gracePeriodState](self, "gracePeriodState");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      objc_msgSend(v5, "gracePeriodState");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[LACDTORatchetStateComposite gracePeriodState](self, "gracePeriodState");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
      {
LABEL_9:
        v12 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    objc_msgSend(v5, "watchdogs");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[LACDTORatchetStateComposite watchdogs](self, "watchdogs");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {
      v12 = 1;
      v21 = v19;
    }
    else
    {
      v21 = (void *)v20;
      objc_msgSend(v5, "watchdogs");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[LACDTORatchetStateComposite watchdogs](self, "watchdogs");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v22, "isEqual:", v23);

    }
    goto LABEL_15;
  }
  v12 = 0;
LABEL_16:

  return v12;
}

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  _QWORD v18[4];

  v18[3] = *MEMORY[0x24BDAC8D0];
  v17 = (void *)MEMORY[0x24BDD17C8];
  v3 = objc_opt_class();
  v4 = (void *)MEMORY[0x24BDD17C8];
  -[LACDTORatchetStateComposite ratchetState](self, "ratchetState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("ratchetState: %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v6;
  v7 = (void *)MEMORY[0x24BDD17C8];
  -[LACDTORatchetStateComposite gracePeriodState](self, "gracePeriodState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("gracePeriodState: %@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v9;
  v10 = (void *)MEMORY[0x24BDD17C8];
  -[LACDTORatchetStateComposite watchdogs](self, "watchdogs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("watchdogs: %@"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "componentsJoinedByString:", CFSTR("; "));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("<%@ %p; %@>"), v3, self, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (LACDTORatchetState)ratchetState
{
  return self->_ratchetState;
}

- (LACDTOGracePeriodState)gracePeriodState
{
  return self->_gracePeriodState;
}

- (LACDTOBiometryWatchdogPack)watchdogs
{
  return self->_watchdogs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchdogs, 0);
  objc_storeStrong((id *)&self->_gracePeriodState, 0);
  objc_storeStrong((id *)&self->_ratchetState, 0);
}

@end
