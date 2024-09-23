@implementation CARPrototypeBoolPref

+ (CARPrototypeBoolPref)prefWithDomain:(id)a3 key:(id)a4 title:(id)a5 invertValueForState:(BOOL)a6 valueChangedBlock:(id)a7
{
  _BOOL8 v7;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;

  v7 = a6;
  v12 = (void *)MEMORY[0x1E0CB37E8];
  v13 = a7;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  objc_msgSend(v12, "numberWithBool:", v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "prefWithDomain:key:title:defaultValue:valueChangedBlock:", v16, v15, v14, v17, v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return (CARPrototypeBoolPref *)v18;
}

- (BOOL)invertValueForState
{
  void *v2;
  char v3;

  -[CARPrototypePref defaultValue](self, "defaultValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)valueBool
{
  void *v2;
  char v3;

  -[CARPrototypePref valueOrDefault](self, "valueOrDefault");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)cachedValueBool
{
  void *v2;
  char v3;

  -[CARPrototypePref cachedValueOrDefault](self, "cachedValueOrDefault");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)state
{
  BOOL v3;

  v3 = -[CARPrototypeBoolPref valueBool](self, "valueBool");
  return v3 ^ -[CARPrototypeBoolPref invertValueForState](self, "invertValueForState");
}

- (void)setState:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  id v6;

  v3 = a3;
  v5 = -[CARPrototypeBoolPref invertValueForState](self, "invertValueForState");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5 ^ v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CARPrototypePref setValue:](self, "setValue:", v6);

}

- (BOOL)cachedState
{
  BOOL v3;

  v3 = -[CARPrototypeBoolPref cachedValueBool](self, "cachedValueBool");
  return v3 ^ -[CARPrototypeBoolPref invertValueForState](self, "invertValueForState");
}

- (void)setCachedState:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  id v6;

  v3 = a3;
  v5 = -[CARPrototypeBoolPref invertValueForState](self, "invertValueForState");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5 ^ v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CARPrototypePref setCachedValue:](self, "setCachedValue:", v6);

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[CARPrototypePref domain](self, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARPrototypePref key](self, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CARPrototypeBoolPref valueBool](self, "valueBool"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  if (-[CARPrototypeBoolPref invertValueForState](self, "invertValueForState"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  if (-[CARPrototypeBoolPref state](self, "state"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@-%@=%@ invertValueForState=%@ state=%@>"), v4, self, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
