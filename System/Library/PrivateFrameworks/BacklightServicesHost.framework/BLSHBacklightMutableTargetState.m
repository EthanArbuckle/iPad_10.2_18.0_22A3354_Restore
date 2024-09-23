@implementation BLSHBacklightMutableTargetState

- (BLSHBacklightMutableTargetState)initWithState:(id)a3
{
  id v4;
  BLSHBacklightMutableTargetState *v5;
  BLSHBacklightMutableTargetState *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BLSHBacklightMutableTargetState;
  v5 = -[BLSHBacklightMutableTargetState init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[BLSHBacklightMutableTargetState setToState:](v5, "setToState:", v4);

  return v6;
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

- (void)setToState:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BLSHBacklightMutableTargetState setDisplayMode:](self, "setDisplayMode:", objc_msgSend(v4, "displayMode"));
  objc_msgSend(v4, "presentation");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[BLSHBacklightMutableTargetState setPresentation:](self, "setPresentation:", v5);
}

- (int64_t)displayMode
{
  return self->_displayMode;
}

- (void)setDisplayMode:(int64_t)a3
{
  self->_displayMode = a3;
}

- (BLSHBacklightEnvironmentPresentation)presentation
{
  return (BLSHBacklightEnvironmentPresentation *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPresentation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentation, 0);
}

@end
