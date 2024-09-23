@implementation AXObserverElementPair

- (id)observer
{
  return self->_observer;
}

- (AXObserverElementPair)initWithObserver:(id)a3
{
  id v4;
  AXObserverElementPair *v5;
  AXObserverElementPair *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AXObserverElementPair;
  v5 = -[AXObserverElementPair init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[AXObserverElementPair setObserver:](v5, "setObserver:", v4);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "observer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXObserverElementPair observer](self, "observer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[AXObserverElementPair observer](self, "observer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Pair (%@) "), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setObserver:(id)a3
{
  objc_storeStrong(&self->_observer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_observer, 0);
}

@end
