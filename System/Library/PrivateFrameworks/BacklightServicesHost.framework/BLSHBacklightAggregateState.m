@implementation BLSHBacklightAggregateState

- (BLSHBacklightAggregateState)initWithDisplayModeSource:(id)a3
{
  id v5;
  BLSHBacklightAggregateState *v6;
  BLSHBacklightAggregateState *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BLSHBacklightAggregateState;
  v6 = -[BLSHBacklightAggregateState init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_displayModeSource, a3);

  return v7;
}

- (int64_t)displayMode
{
  return -[BLSHBacklightDisplayStateMachine displayMode](self->_displayModeSource, "displayMode");
}

- (BLSHBacklightEnvironmentPresentation)presentation
{
  void *v2;
  void *v3;

  -[BLSHBacklightAggregateState presentationSource](self, "presentationSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (BLSHBacklightEnvironmentPresentation *)v3;
}

- (BOOL)isEqual:(id)a3
{
  return +[BLSHBacklightAggregateState isState:equalToObject:](BLSHBacklightAggregateState, "isState:equalToObject:", self, a3);
}

- (unint64_t)hash
{
  return +[BLSHBacklightAggregateState stateHash:](BLSHBacklightAggregateState, "stateHash:", self);
}

- (NSString)description
{
  return (NSString *)+[BLSHBacklightAggregateState bls_loggingStringForState:](BLSHBacklightAggregateState, "bls_loggingStringForState:", self);
}

- (NSString)debugDescription
{
  return (NSString *)+[BLSHBacklightAggregateState bls_debugLoggingDescriptionForState:](BLSHBacklightAggregateState, "bls_debugLoggingDescriptionForState:", self);
}

- (id)bls_loggingString
{
  return +[BLSHBacklightAggregateState bls_loggingStringForState:](BLSHBacklightAggregateState, "bls_loggingStringForState:", self);
}

- (id)bls_shortLoggingString
{
  return +[BLSHBacklightAggregateState bls_shortLoggingStringForState:](BLSHBacklightAggregateState, "bls_shortLoggingStringForState:", self);
}

+ (BOOL)isState:(id)a3 equalToObject:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;

  v5 = a3;
  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = v6;
    v8 = objc_msgSend(v5, "displayMode");
    if (v8 == objc_msgSend(v7, "displayMode"))
    {
      objc_msgSend(v5, "presentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "presentation");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      if (v9)
        v12 = objc_msgSend(v9, "isEqual:", v10);
      else
        v12 = v10 == 0;

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (unint64_t)stateHash:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  unint64_t v9;

  v3 = (void *)MEMORY[0x24BE0BE28];
  v4 = a3;
  objc_msgSend(v3, "builder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "appendInteger:", objc_msgSend(v4, "displayMode"));
  objc_msgSend(v4, "presentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (id)objc_msgSend(v5, "appendObject:", v7);
  v9 = objc_msgSend(v5, "hash");

  return v9;
}

+ (id)bls_loggingStringForState:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BE0BE08];
  v4 = a3;
  objc_msgSend(v3, "builderWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromBLSBacklightDisplayMode(objc_msgSend(v4, "displayMode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:withName:", v6, CFSTR("displayMode"));

  objc_msgSend(v4, "presentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (id)objc_msgSend(v5, "appendObject:withName:", v7, CFSTR("presentation"));
  objc_msgSend(v5, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)bls_shortLoggingStringForState:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BE0BE08];
  v4 = a3;
  objc_msgSend(v3, "builderWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "displayMode");

  NSStringFromBLSBacklightDisplayMode(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:withName:", v7, CFSTR("displayMode"));

  objc_msgSend(v5, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)bls_debugLoggingDescriptionForState:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BE0BE08];
  v4 = a3;
  objc_msgSend(v3, "builderWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromBLSBacklightDisplayMode(objc_msgSend(v4, "displayMode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:withName:", v6, CFSTR("displayMode"));

  objc_msgSend(v4, "presentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "debugDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v5, "appendObject:withName:", v8, CFSTR("presentation"));

  objc_msgSend(v5, "build");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BLSHBacklightEnvironmentStateMachine)presentationSource
{
  return (BLSHBacklightEnvironmentStateMachine *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPresentationSource:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationSource, 0);
  objc_storeStrong((id *)&self->_displayModeSource, 0);
}

@end
