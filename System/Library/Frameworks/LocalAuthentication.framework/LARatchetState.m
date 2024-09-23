@implementation LARatchetState

- (LARatchetState)initWithRawValue:(int64_t)a3 value:(id)a4 uuid:(id)a5
{
  id v9;
  id v10;
  LARatchetState *v11;
  LARatchetState *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)LARatchetState;
  v11 = -[LARatchetState init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_rawValue = a3;
    objc_storeStrong((id *)&v11->_value, a4);
    objc_storeStrong((id *)&v12->_uuid, a5);
  }

  return v12;
}

- (double)duration
{
  void *v2;
  double v3;
  double v4;

  -[LARatchetState value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "duration");
  v4 = v3;

  return v4;
}

- (LARatchetState)initWithState:(id)a3
{
  id v4;
  LARatchetStateValueWaitingForCoolOff *v5;
  void *v6;
  LARatchetState *v7;
  uint64_t v8;
  LARatchetState *v9;
  LARatchetStateValueWaitingForCoolOff *v10;
  LARatchetStateValueWaitingForSecondAuthentication *v11;
  LARatchetStateValueReady *v12;
  LARatchetStateValueCollapsed *v13;

  v4 = a3;
  if (objc_opt_class())
  {
    switch(objc_msgSend(v4, "rawValue"))
    {
      case 1:
        v10 = [LARatchetStateValueWaitingForCoolOff alloc];
        objc_msgSend(v4, "duration");
        v5 = -[LARatchetStateValue initWithDuration:](v10, "initWithDuration:");
        objc_msgSend(v4, "uuid");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = self;
        v8 = 1;
        break;
      case 2:
        v11 = [LARatchetStateValueWaitingForSecondAuthentication alloc];
        objc_msgSend(v4, "duration");
        v5 = -[LARatchetStateValue initWithDuration:](v11, "initWithDuration:");
        objc_msgSend(v4, "uuid");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = self;
        v8 = 2;
        break;
      case 3:
        v12 = [LARatchetStateValueReady alloc];
        objc_msgSend(v4, "duration");
        v5 = -[LARatchetStateValue initWithDuration:](v12, "initWithDuration:");
        objc_msgSend(v4, "uuid");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = self;
        v8 = 3;
        break;
      case 4:
        v13 = [LARatchetStateValueCollapsed alloc];
        objc_msgSend(v4, "duration");
        v5 = -[LARatchetStateValue initWithDuration:](v13, "initWithDuration:");
        objc_msgSend(v4, "uuid");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = self;
        v8 = 4;
        break;
      default:
        v5 = -[LARatchetStateValue initInternal]([LARatchetStateValueNotStarted alloc], "initInternal");
        objc_msgSend(v4, "uuid");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = self;
        v8 = 0;
        break;
    }
    self = -[LARatchetState initWithRawValue:value:uuid:](v7, "initWithRawValue:value:uuid:", v8, v5, v6);

    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = -[LARatchetState rawValue](self, "rawValue");
  if (v6 > 4)
    v7 = &stru_1E707B3F8;
  else
    v7 = off_1E707AA50[v6];
  objc_msgSend(v5, "stringWithFormat:", CFSTR("rawValue: %@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v8;
  v9 = (void *)MEMORY[0x1E0CB3940];
  -[LARatchetState duration](self, "duration");
  NSStringFromLARatchetStateDuration(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("duration: %@"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v12;
  v13 = (void *)MEMORY[0x1E0CB3940];
  -[LARatchetState uuid](self, "uuid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("uuid: %@"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "componentsJoinedByString:", CFSTR("; "));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p; %@>"), v4, self, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  char v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = objc_msgSend(v5, "rawValue");
    if (v6 == -[LARatchetState rawValue](self, "rawValue"))
    {
      objc_msgSend(v5, "value");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[LARatchetState value](self, "value");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v8)
      {

      }
      else
      {
        v9 = (void *)v8;
        objc_msgSend(v5, "value");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[LARatchetState value](self, "value");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

        if (!v12)
          goto LABEL_5;
      }
      objc_msgSend(v5, "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[LARatchetState uuid](self, "uuid");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 == (void *)v15)
      {
        v13 = 1;
        v16 = v14;
      }
      else
      {
        v16 = (void *)v15;
        objc_msgSend(v5, "uuid");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[LARatchetState uuid](self, "uuid");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v17, "isEqualToString:", v18);

      }
      goto LABEL_12;
    }
LABEL_5:
    v13 = 0;
LABEL_12:

    goto LABEL_13;
  }
  v13 = 0;
LABEL_13:

  return v13;
}

- (int64_t)rawValue
{
  return self->_rawValue;
}

- (LARatchetStateValue)value
{
  return self->_value;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

@end
