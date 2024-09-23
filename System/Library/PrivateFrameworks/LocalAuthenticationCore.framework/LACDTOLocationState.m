@implementation LACDTOLocationState

- (LACDTOLocationState)initWithIsInFamiliarLocation:(BOOL)a3 confirmed:(BOOL)a4 createdAt:(id)a5
{
  id v9;
  LACDTOLocationState *v10;
  LACDTOLocationState *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)LACDTOLocationState;
  v10 = -[LACDTOLocationState init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_isInFamiliarLocation = a3;
    v10->_confirmed = a4;
    objc_storeStrong((id *)&v10->_createdAt, a5);
  }

  return v11;
}

- (LACDTOLocationState)initWithIsInFamiliarLocation:(BOOL)a3 confirmed:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  LACDTOLocationState *v8;

  v4 = a4;
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[LACDTOLocationState initWithIsInFamiliarLocation:confirmed:createdAt:](self, "initWithIsInFamiliarLocation:confirmed:createdAt:", v5, v4, v7);

  return v8;
}

+ (id)nullInstance
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithIsInFamiliarLocation:confirmed:", 0, 0);
}

+ (id)strictLocationState
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithIsInFamiliarLocation:confirmed:", 0, 0);
}

- (BOOL)isValid:(id)a3
{
  id v4;
  BOOL v5;
  double v6;

  v4 = a3;
  if (-[NSDate compare:](self->_createdAt, "compare:", v4) == NSOrderedDescending)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v4, "timeIntervalSinceDate:", self->_createdAt);
    v5 = v6 <= 5.0;
  }

  return v5;
}

- (id)description
{
  int v3;
  void *v4;
  _BOOL4 v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  void *v26;
  void *v27;
  _QWORD v28[6];

  v28[5] = *MEMORY[0x24BDAC8D0];
  v3 = os_variant_allows_internal_security_policies();
  v26 = (void *)MEMORY[0x24BDD17C8];
  v25 = objc_opt_class();
  v4 = (void *)MEMORY[0x24BDD17C8];
  if (v3)
  {
    v5 = -[LACDTOLocationState isInFamiliarLocation](self, "isInFamiliarLocation");
    v6 = CFSTR("OFF");
    if (v5)
      v6 = CFSTR("ON");
  }
  else
  {
    v6 = CFSTR("<private>");
  }
  objc_msgSend(v4, "stringWithFormat:", CFSTR("DSLMode: %@"), v6);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v27;
  v7 = (void *)MEMORY[0x24BDD17C8];
  if (-[LACDTOLocationState confirmed](self, "confirmed"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  objc_msgSend(v7, "stringWithFormat:", CFSTR("confirmed: %@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v9;
  v10 = (void *)MEMORY[0x24BDD17C8];
  -[LACDTOLocationState createdAt](self, "createdAt");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("createdAt: %@"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v12;
  v13 = (void *)MEMORY[0x24BDD17C8];
  -[LACDTOLocationState createdAt](self, "createdAt");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "timeIntervalSince1970");
  objc_msgSend(v13, "stringWithFormat:", CFSTR("createdAtTimestamp: %.2f"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v16;
  v17 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[LACDTOLocationState isValid:](self, "isValid:", v18))
    v19 = CFSTR("YES");
  else
    v19 = CFSTR("NO");
  objc_msgSend(v17, "stringWithFormat:", CFSTR("isValid: %@"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v28[4] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "componentsJoinedByString:", CFSTR("; "));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stringWithFormat:", CFSTR("<%@ %p; %@>"), v25, self, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  BOOL v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[LACDTOLocationState isInFamiliarLocation](self, "isInFamiliarLocation");
    if (v6 == objc_msgSend(v5, "isInFamiliarLocation"))
    {
      -[LACDTOLocationState createdAt](self, "createdAt");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "createdAt");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v8 == v9;

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isInFamiliarLocation
{
  return self->_isInFamiliarLocation;
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
