@implementation CPLEngineComponentEnumerator

- (CPLEngineComponentEnumerator)initWithComponents:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  CPLEngineComponentEnumerator *v8;
  uint64_t v9;
  NSEnumerator *enumerator;
  uint64_t v11;
  id handler;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CPLEngineComponentEnumerator;
  v8 = -[CPLEngineComponentEnumerator init](&v14, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "objectEnumerator");
    v9 = objc_claimAutoreleasedReturnValue();
    enumerator = v8->_enumerator;
    v8->_enumerator = (NSEnumerator *)v9;

    v11 = objc_msgSend(v7, "copy");
    handler = v8->_handler;
    v8->_handler = (id)v11;

  }
  return v8;
}

- (void)handleNextComponent
{
  void *v3;
  void *v4;
  id handler;

  if (self->_handler)
  {
    v3 = (void *)MEMORY[0x1B5E08BF0]();
    -[NSEnumerator nextObject](self->_enumerator, "nextObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void))self->_handler + 2))();
    if (!v4)
    {
      handler = self->_handler;
      self->_handler = 0;

    }
    objc_autoreleasePoolPop(v3);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_enumerator, 0);
}

@end
