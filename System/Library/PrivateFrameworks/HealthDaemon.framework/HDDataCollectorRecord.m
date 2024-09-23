@implementation HDDataCollectorRecord

- (void)setCollector:(id)a3
{
  objc_storeWeak((id *)&self->_collector, a3);
}

- (void)setState:(id)a3
{
  objc_storeStrong((id *)&self->_state, a3);
}

- (HDDataCollector)collector
{
  return (HDDataCollector *)objc_loadWeakRetained((id *)&self->_collector);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
  objc_destroyWeak((id *)&self->_collector);
}

- (HKDataCollectorState)state
{
  return self->_state;
}

- (id)description
{
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)HDDataCollectorRecord;
  -[HDDataCollectorRecord description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_collector);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %@, %@>"), v4, WeakRetained, self->_state);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
