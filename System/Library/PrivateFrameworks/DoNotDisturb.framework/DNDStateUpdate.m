@implementation DNDStateUpdate

- (DNDStateUpdate)initWithPreviousState:(id)a3 state:(id)a4 reason:(unint64_t)a5 source:(int64_t)a6 options:(int64_t)a7
{
  id v12;
  id v13;
  DNDStateUpdate *v14;
  uint64_t v15;
  DNDState *previousState;
  uint64_t v17;
  DNDState *state;
  objc_super v20;

  v12 = a3;
  v13 = a4;
  v20.receiver = self;
  v20.super_class = (Class)DNDStateUpdate;
  v14 = -[DNDStateUpdate init](&v20, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v12, "copy");
    previousState = v14->_previousState;
    v14->_previousState = (DNDState *)v15;

    v17 = objc_msgSend(v13, "copy");
    state = v14->_state;
    v14->_state = (DNDState *)v17;

    v14->_reason = a5;
    v14->_source = a6;
    v14->_options = a7;
  }

  return v14;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  unint64_t v9;

  -[DNDStateUpdate previousState](self, "previousState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[DNDStateUpdate state](self, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = -[DNDStateUpdate reason](self, "reason");
  v8 = v7 ^ -[DNDStateUpdate source](self, "source");
  v9 = v6 ^ v8 ^ -[DNDStateUpdate options](self, "options");

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  DNDStateUpdate *v6;
  DNDStateUpdate *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  unint64_t v20;
  int64_t v21;
  int64_t v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v6 = (DNDStateUpdate *)a3;
  if (self == v6)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      -[DNDStateUpdate previousState](self, "previousState");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDStateUpdate previousState](v7, "previousState");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 != v9)
      {
        -[DNDStateUpdate previousState](self, "previousState");
        v10 = objc_claimAutoreleasedReturnValue();
        if (!v10)
        {
          v13 = 0;
          goto LABEL_34;
        }
        v3 = (void *)v10;
        -[DNDStateUpdate previousState](v7, "previousState");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          v13 = 0;
LABEL_33:

          goto LABEL_34;
        }
        -[DNDStateUpdate previousState](self, "previousState");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDStateUpdate previousState](v7, "previousState");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v12, "isEqual:", v4))
        {
          v13 = 0;
LABEL_32:

          goto LABEL_33;
        }
        v28 = v4;
        v29 = v12;
        v30 = v11;
      }
      -[DNDStateUpdate state](self, "state");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDStateUpdate state](v7, "state");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 != v15)
      {
        -[DNDStateUpdate state](self, "state");
        v16 = objc_claimAutoreleasedReturnValue();
        if (!v16)
          goto LABEL_22;
        v4 = (void *)v16;
        -[DNDStateUpdate state](v7, "state");
        v17 = objc_claimAutoreleasedReturnValue();
        if (!v17)
        {
          v13 = 0;
LABEL_29:

          goto LABEL_30;
        }
        v18 = (void *)v17;
        v24 = v3;
        -[DNDStateUpdate state](self, "state");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDStateUpdate state](v7, "state");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v19;
        if (!objc_msgSend(v19, "isEqual:"))
        {
          v13 = 0;
          v3 = v24;
LABEL_28:

          goto LABEL_29;
        }
        v25 = v18;
        v3 = v24;
      }
      v20 = -[DNDStateUpdate reason](self, "reason");
      if (v20 == -[DNDStateUpdate reason](v7, "reason"))
      {
        v21 = -[DNDStateUpdate source](self, "source");
        if (v21 == -[DNDStateUpdate source](v7, "source"))
        {
          v22 = -[DNDStateUpdate options](self, "options");
          v13 = v22 == -[DNDStateUpdate options](v7, "options");
          v18 = v25;
          if (v14 == v15)
            goto LABEL_30;
          goto LABEL_28;
        }
      }
      if (v14 == v15)
      {
        v13 = 0;
LABEL_30:

LABEL_31:
        v12 = v29;
        v11 = v30;
        v4 = v28;
        if (v8 != v9)
          goto LABEL_32;
LABEL_34:

        goto LABEL_35;
      }

LABEL_22:
      v13 = 0;
      goto LABEL_31;
    }
    v13 = 0;
  }
LABEL_35:

  return v13;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  DNDStateUpdateReasonToString(-[DNDStateUpdate reason](self, "reason"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  DNDStateUpdateSourceToString(-[DNDStateUpdate source](self, "source"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  DNDStateUpdateOptionsToString(-[DNDStateUpdate options](self, "options"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDStateUpdate state](self, "state");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDStateUpdate previousState](self, "previousState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; reason: %@; source: %@; options: %@; state: %@; previousState: %@>"),
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
    v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDStateUpdate)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  DNDStateUpdate *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("previousState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("state"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("reason"));
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("options"));
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("source")))
    v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("source"));
  else
    v9 = 0;
  v10 = -[DNDStateUpdate initWithPreviousState:state:reason:source:options:](self, "initWithPreviousState:state:reason:source:options:", v5, v6, v7, v9, v8);

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[DNDStateUpdate previousState](self, "previousState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("previousState"));

  -[DNDStateUpdate state](self, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("state"));

  objc_msgSend(v6, "encodeInteger:forKey:", -[DNDStateUpdate reason](self, "reason"), CFSTR("reason"));
  objc_msgSend(v6, "encodeInteger:forKey:", -[DNDStateUpdate source](self, "source"), CFSTR("source"));
  objc_msgSend(v6, "encodeInteger:forKey:", -[DNDStateUpdate options](self, "options"), CFSTR("options"));

}

- (DNDState)previousState
{
  return self->_previousState;
}

- (DNDState)state
{
  return self->_state;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (int64_t)source
{
  return self->_source;
}

- (int64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_previousState, 0);
}

@end
