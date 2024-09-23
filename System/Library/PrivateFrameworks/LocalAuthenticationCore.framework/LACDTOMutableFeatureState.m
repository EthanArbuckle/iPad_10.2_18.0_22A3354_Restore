@implementation LACDTOMutableFeatureState

+ (id)nullInstance
{
  LACDTOMutableFeatureState *v2;
  void *v3;

  v2 = objc_alloc_init(LACDTOMutableFeatureState);
  -[LACDTOMutableFeatureState setIsSupported:](v2, "setIsSupported:", 0);
  -[LACDTOMutableFeatureState setIsAvailable:](v2, "setIsAvailable:", 0);
  -[LACDTOMutableFeatureState setIsEnabled:](v2, "setIsEnabled:", 0);
  -[LACDTOMutableFeatureState setIsStrictModeEnabled:](v2, "setIsStrictModeEnabled:", 0);
  +[LACDTOMutableFeatureRequirements nullInstance](LACDTOMutableFeatureRequirements, "nullInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACDTOMutableFeatureState setRequirements:](v2, "setRequirements:", v3);

  return v2;
}

- (NSString)description
{
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  _QWORD v24[6];

  v24[5] = *MEMORY[0x24BDAC8D0];
  v23 = (void *)MEMORY[0x24BDD17C8];
  v3 = objc_opt_class();
  v4 = (void *)MEMORY[0x24BDD17C8];
  if (-[LACDTOMutableFeatureState isSupported](self, "isSupported"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  objc_msgSend(v4, "stringWithFormat:", CFSTR("isSupported: %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v6;
  v7 = (void *)MEMORY[0x24BDD17C8];
  if (-[LACDTOMutableFeatureState isAvailable](self, "isAvailable"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  objc_msgSend(v7, "stringWithFormat:", CFSTR("isAvailable: %@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v9;
  v10 = (void *)MEMORY[0x24BDD17C8];
  if (-[LACDTOMutableFeatureState isEnabled](self, "isEnabled"))
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  objc_msgSend(v10, "stringWithFormat:", CFSTR("isEnabled: %@"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v12;
  v13 = (void *)MEMORY[0x24BDD17C8];
  if (-[LACDTOMutableFeatureState isStrictModeEnabled](self, "isStrictModeEnabled"))
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  objc_msgSend(v13, "stringWithFormat:", CFSTR("isStrictModeEnabled: %@"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v15;
  v16 = (void *)MEMORY[0x24BDD17C8];
  -[LACDTOMutableFeatureState requirements](self, "requirements");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("requirements: %@"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "componentsJoinedByString:", CFSTR("; "));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringWithFormat:", CFSTR("<%@ %p; %@>"), v3, self, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v21;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  int v7;
  int v8;
  int v9;
  char v10;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[LACDTOMutableFeatureState isSupported](self, "isSupported");
    if (v6 == objc_msgSend(v5, "isSupported")
      && (v7 = -[LACDTOMutableFeatureState isAvailable](self, "isAvailable"),
          v7 == objc_msgSend(v5, "isAvailable"))
      && (v8 = -[LACDTOMutableFeatureState isEnabled](self, "isEnabled"),
          v8 == objc_msgSend(v5, "isEnabled"))
      && (v9 = -[LACDTOMutableFeatureState isStrictModeEnabled](self, "isStrictModeEnabled"),
          v9 == objc_msgSend(v5, "isStrictModeEnabled")))
    {
      -[LACDTOMutableFeatureState requirements](self, "requirements");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "requirements");
      v13 = objc_claimAutoreleasedReturnValue();
      if (v12 == (void *)v13)
      {
        v10 = 1;
        v14 = v12;
      }
      else
      {
        v14 = (void *)v13;
        -[LACDTOMutableFeatureState requirements](self, "requirements");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "requirements");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v15, "isEqual:", v16);

      }
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isSupported
{
  return self->_isSupported;
}

- (void)setIsSupported:(BOOL)a3
{
  self->_isSupported = a3;
}

- (BOOL)isAvailable
{
  return self->_isAvailable;
}

- (void)setIsAvailable:(BOOL)a3
{
  self->_isAvailable = a3;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (void)setIsEnabled:(BOOL)a3
{
  self->_isEnabled = a3;
}

- (BOOL)isStrictModeEnabled
{
  return self->_isStrictModeEnabled;
}

- (void)setIsStrictModeEnabled:(BOOL)a3
{
  self->_isStrictModeEnabled = a3;
}

- (LACDTOFeatureRequirements)requirements
{
  return self->_requirements;
}

- (void)setRequirements:(id)a3
{
  objc_storeStrong((id *)&self->_requirements, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requirements, 0);
}

@end
