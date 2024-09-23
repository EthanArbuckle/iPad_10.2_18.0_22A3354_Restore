@implementation BMSource

- (NSString)identifier
{
  return self->_identifier;
}

- (void)sendEvent:(id)a3 timestamp:(double)a4
{
  objc_opt_class();
  OUTLINED_FUNCTION_0_13();
}

- (BMSource)initWithIdentifier:(id)a3
{
  id v4;
  BMSource *v5;
  uint64_t v6;
  NSString *identifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BMSource;
  v5 = -[BMSource init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)sendEvent:(id)a3
{
  objc_opt_class();
  OUTLINED_FUNCTION_0_13();
}

- (void)sendEvent:(id)a3 date:(id)a4
{
  id v6;

  v6 = a3;
  objc_msgSend(a4, "timeIntervalSinceReferenceDate");
  -[BMSource sendEvent:timestamp:](self, "sendEvent:timestamp:", v6);

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)BMSource;
  -[BMSource description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSource identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
