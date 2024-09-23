@implementation FCSectionSupergroupKnobs

- (FCSectionSupergroupKnobs)initWithJSONString:(id)a3
{
  void *v4;
  FCSectionSupergroupKnobs *v5;

  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[FCSectionSupergroupKnobs initWithJSONData:](self, "initWithJSONData:", v4);

  return v5;
}

- (FCSectionSupergroupKnobs)initWithJSONData:(id)a3
{
  id v4;
  void *v5;
  id v6;
  FCSectionSupergroupKnobs *v7;
  void *v8;
  void *v9;
  FCSectionSupergroupKnobs *v10;
  FCSectionSupergroupKnobs *v11;
  NSString *v12;
  FCSectionSupergroupKnobs *v13;
  void *v15;
  void *v16;
  uint64_t v17;
  NSString *nameOverride;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  objc_super v25;
  objc_super v26;
  id v27;

  v4 = a3;
  if (v4)
  {
    v27 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v4, 0, &v27);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v27;
    if (!v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v26.receiver = self;
        v26.super_class = (Class)FCSectionSupergroupKnobs;
        v7 = -[FCSectionSupergroupKnobs init](&v26, sel_init);
        if (v7)
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isEligible"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          if (v8)
          {
            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isEligible"));
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v7->_isEligible = objc_msgSend(v9, "BOOLValue");

          }
          else
          {
            v7->_isEligible = 1;
          }
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("nameOverride"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("nameOverride"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "stringValue");
            v17 = objc_claimAutoreleasedReturnValue();
            nameOverride = v7->_nameOverride;
            v7->_nameOverride = (NSString *)v17;

          }
          else
          {
            v16 = v7->_nameOverride;
            v7->_nameOverride = 0;
          }

          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("rankMultiplier"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("rankMultiplier"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "doubleValue");
            v22 = v21;

            if (v22 <= 0.0)
            {
              v7->_rankMultiplier = 0.0;
            }
            else
            {
              objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("rankMultiplier"));
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "doubleValue");
              v7->_rankMultiplier = v24;

            }
          }
          else
          {
            v7->_rankMultiplier = 1.0;
          }
        }
        v13 = v7;

        goto LABEL_11;
      }
    }

  }
  v25.receiver = self;
  v25.super_class = (Class)FCSectionSupergroupKnobs;
  v10 = -[FCSectionSupergroupKnobs init](&v25, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_isEligible = 1;
    v12 = v10->_nameOverride;
    v10->_nameOverride = 0;

    v11->_rankMultiplier = 1.0;
  }
  v13 = v11;
LABEL_11:

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameOverride, 0);
}

- (BOOL)isEligible
{
  return self->_isEligible;
}

- (void)setIsEligible:(BOOL)a3
{
  self->_isEligible = a3;
}

- (NSString)nameOverride
{
  return self->_nameOverride;
}

- (double)rankMultiplier
{
  return self->_rankMultiplier;
}

@end
