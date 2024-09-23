@implementation ExampleEvent

- (ExampleEvent)initWithFoo:(id)a3
{
  id v4;
  ExampleEvent *v5;
  uint64_t v6;
  NSData *foo;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ExampleEvent;
  v5 = -[ExampleEvent init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    foo = v5->_foo;
    v5->_foo = (NSData *)v6;

  }
  return v5;
}

- (NSData)foo
{
  return self->_foo;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foo, 0);
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFoo:", v5);

  return v6;
}

@end
