@implementation _CDEventStream

- (_CDEventStreamProperties)eventStreamProperties
{
  return (_CDEventStreamProperties *)objc_getProperty(self, a2, 8, 1);
}

+ (id)eventStreamWithProperties:(id)a3
{
  id v3;
  _CDEventStream *v4;

  v3 = a3;
  v4 = -[_CDEventStream initWithProperties:]([_CDEventStream alloc], "initWithProperties:", v3);

  return v4;
}

- (_CDEventStream)initWithProperties:(id)a3
{
  id v5;
  _CDEventStream *v6;
  _CDEventStream *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_CDEventStream;
  v6 = -[_CDEventStream init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->eventStreamProperties, a3);

  return v7;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[_CDEventStream eventStreamProperties](self, "eventStreamProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Event Stream Properties: %@ \n"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->eventStreamProperties, 0);
}

@end
