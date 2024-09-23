@implementation LARatchetObserverWrapper

- (LARatchetObserverWrapper)initWithObserver:(id)a3
{
  id v4;
  LARatchetObserverWrapper *v5;
  LARatchetObserverWrapper *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LARatchetObserverWrapper;
  v5 = -[LARatchetObserverWrapper init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_observer, v4);

  return v6;
}

- (void)ratchetStateDidChange:(id)a3
{
  id v4;
  id WeakRetained;
  LARatchetState *v6;

  v4 = a3;
  v6 = -[LARatchetState initWithState:]([LARatchetState alloc], "initWithState:", v4);

  WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  objc_msgSend(WeakRetained, "ratchetStateDidChange:", v6);

}

- (unint64_t)hash
{
  id WeakRetained;
  unint64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  v3 = objc_msgSend(WeakRetained, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  id WeakRetained;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
    objc_msgSend(v5, "observer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(WeakRetained, "isEqual:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (LARatchetObserver)observer
{
  return (LARatchetObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
}

@end
