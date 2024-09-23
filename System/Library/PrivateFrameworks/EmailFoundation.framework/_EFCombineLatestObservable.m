@implementation _EFCombineLatestObservable

- (id)subscribe:(id)a3
{
  id v4;
  _EFCombineLatestObservableSubscription *v5;
  void *v6;
  _EFCombineLatestObservableSubscription *v7;
  void *v8;

  v4 = a3;
  v5 = [_EFCombineLatestObservableSubscription alloc];
  -[_EFCombineLatestObservable observables](self, "observables");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_EFCombineLatestObservableSubscription initWithObservables:](v5, "initWithObservables:", v6);
  -[_EFCombineLatestObservableSubscription subscribe:](v7, "subscribe:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSArray)observables
{
  return self->_observables;
}

- (_EFCombineLatestObservable)initWithObservables:(id)a3
{
  id v4;
  _EFCombineLatestObservable *v5;
  uint64_t v6;
  NSArray *observables;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_EFCombineLatestObservable;
  v5 = -[_EFCombineLatestObservable init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    observables = v5->_observables;
    v5->_observables = (NSArray *)v6;

  }
  return v5;
}

- (void)setObservables:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observables, 0);
}

@end
