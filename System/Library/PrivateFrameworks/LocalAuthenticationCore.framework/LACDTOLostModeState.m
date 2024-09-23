@implementation LACDTOLostModeState

- (LACDTOLostModeState)initWithIsInLostMode:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  LACDTOLostModeState *v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[LACDTOLostModeState initWithIsInLostMode:confirmed:createdAt:](self, "initWithIsInLostMode:confirmed:createdAt:", v3, 0, v5);

  return v6;
}

- (LACDTOLostModeState)initWithIsInLostMode:(BOOL)a3 confirmed:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  LACDTOLostModeState *v8;

  v4 = a4;
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[LACDTOLostModeState initWithIsInLostMode:confirmed:createdAt:](self, "initWithIsInLostMode:confirmed:createdAt:", v5, v4, v7);

  return v8;
}

- (LACDTOLostModeState)initWithIsInLostMode:(BOOL)a3 confirmed:(BOOL)a4 createdAt:(id)a5
{
  id v9;
  LACDTOLostModeState *v10;
  LACDTOLostModeState *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)LACDTOLostModeState;
  v10 = -[LACDTOLostModeState init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_isInLostMode = a3;
    objc_storeStrong((id *)&v10->_createdAt, a5);
    v11->_confirmed = a4;
  }

  return v11;
}

+ (id)nullInstance
{
  return -[LACDTOLostModeState initWithIsInLostMode:]([LACDTOLostModeState alloc], "initWithIsInLostMode:", 1);
}

- (BOOL)isValid:(id)a3
{
  id v4;
  BOOL v5;
  uint64_t v6;
  double v7;

  v4 = a3;
  if (self->_confirmed && -[NSDate compare:](self->_createdAt, "compare:", v4) != NSOrderedDescending)
  {
    v6 = objc_msgSend(v4, "timeIntervalSinceDate:", self->_createdAt);
    v5 = v7 <= LACDTOLostModeStateMaxAgeSeconds(v6);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  int v7;
  BOOL v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = objc_msgSend(v5, "isInLostMode");
    if (v6 == -[LACDTOLostModeState isInLostMode](self, "isInLostMode")
      && (v7 = objc_msgSend(v5, "confirmed"), v7 == -[LACDTOLostModeState confirmed](self, "confirmed")))
    {
      objc_msgSend(v5, "createdAt");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[LACDTOLostModeState createdAt](self, "createdAt");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v9 == v10;

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)description
{
  int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[7];

  v29[6] = *MEMORY[0x24BDAC8D0];
  v3 = os_variant_allows_internal_security_policies();
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = objc_opt_class();
  v6 = v5;
  if (v3)
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    if (-[LACDTOLostModeState isInLostMode](self, "isInLostMode"))
      v8 = CFSTR("YES");
    else
      v8 = CFSTR("NO");
    objc_msgSend(v7, "stringWithFormat:", CFSTR("isInLostMode: %@"), v8);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v28;
    v9 = (void *)MEMORY[0x24BDD17C8];
    if (-[LACDTOLostModeState confirmed](self, "confirmed"))
      v10 = CFSTR("YES");
    else
      v10 = CFSTR("NO");
    objc_msgSend(v9, "stringWithFormat:", CFSTR("confirmed: %@"), v10);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v27;
    v11 = (void *)MEMORY[0x24BDD17C8];
    -[LACDTOLostModeState createdAt](self, "createdAt");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("createdAt: %@"), v26);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v29[2] = v25;
    v12 = (void *)MEMORY[0x24BDD17C8];
    -[LACDTOLostModeState createdAt](self, "createdAt");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSince1970");
    objc_msgSend(v12, "stringWithFormat:", CFSTR("createdAtTimestamp: %.2f"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v29[3] = v15;
    v16 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[LACDTOLostModeState isValid:](self, "isValid:", v17))
      v18 = CFSTR("YES");
    else
      v18 = CFSTR("NO");
    objc_msgSend(v16, "stringWithFormat:", CFSTR("isValid: %@"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v29[4] = v19;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("maxAge: %.2f"), LACDTOLostModeStateMaxAgeSeconds((uint64_t)v19));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v29[5] = v20;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "componentsJoinedByString:", CFSTR("; "));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@ %p; %@>"), v6, self, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    return v23;
  }
  else
  {
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@ %p>"), v5, self);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (BOOL)isInLostMode
{
  return self->_isInLostMode;
}

- (NSDate)createdAt
{
  return self->_createdAt;
}

- (BOOL)confirmed
{
  return self->_confirmed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_createdAt, 0);
}

@end
