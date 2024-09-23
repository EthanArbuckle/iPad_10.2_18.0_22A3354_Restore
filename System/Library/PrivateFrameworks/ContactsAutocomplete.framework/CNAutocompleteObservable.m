@implementation CNAutocompleteObservable

- (CNAutocompleteObservable)initWithBlock:(id)a3
{
  id v4;
  CNAutocompleteObservable *v5;
  uint64_t v6;
  CNObservable *observable;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNAutocompleteObservable;
  v5 = -[CNAutocompleteObservable init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D13AE8], "observableWithBlock:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    observable = v5->_observable;
    v5->_observable = (CNObservable *)v6;

  }
  return v5;
}

- (id)subscribe:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CNAutocompleteObservable observable](self, "observable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subscribe:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)debugDescription
{
  return self->_debugDescription;
}

- (void)setDebugDescription:(id)a3
{
  objc_storeStrong((id *)&self->_debugDescription, a3);
}

- (CNObservable)observable
{
  return self->_observable;
}

- (void)setObservable:(id)a3
{
  objc_storeStrong((id *)&self->_observable, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observable, 0);
  objc_storeStrong((id *)&self->_debugDescription, 0);
}

@end
