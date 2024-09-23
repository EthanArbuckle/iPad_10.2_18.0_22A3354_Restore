@implementation GCObservation

- (GCObservation)initWithObserver:(id)a3 options:(unint64_t)a4 context:(void *)a5
{
  id v8;
  GCObservation *v9;
  GCObservation *v10;
  objc_super v12;

  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GCObservation;
  v9 = -[GCObservation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak(&v9->_observer, v8);
    v10->_options = a4;
    v10->_context = a5;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "observer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCObservation observer](self, "observer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
    {
      v9 = (void *)objc_msgSend(v5, "context");
      v8 = v9 == -[GCObservation context](self, "context");
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;

  -[GCObservation observer](self, "observer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return (unint64_t)v2;
}

- (id)description
{
  unint64_t options;
  id WeakRetained;
  void *v5;

  options = self->_options;
  WeakRetained = objc_loadWeakRetained(&self->_observer);
  +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<GCObservation options:0x%02lx observer:%p context:%p>"), options, WeakRetained, self->_context);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)observer
{
  return objc_loadWeakRetained(&self->_observer);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak(&self->_observer, a3);
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (void)context
{
  return self->_context;
}

- (void)setContext:(void *)a3
{
  self->_context = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_observer);
}

@end
