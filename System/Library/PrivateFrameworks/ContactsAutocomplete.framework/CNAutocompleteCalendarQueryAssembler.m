@implementation CNAutocompleteCalendarQueryAssembler

- (CNAutocompleteCalendarQueryAssembler)initWithRawCachedObservable:(id)a3 rawUncachedObservable:(id)a4
{
  id v7;
  id v8;
  CNAutocompleteCalendarQueryAssembler *v9;
  CNAutocompleteCalendarQueryAssembler *v10;
  CNAutocompleteCalendarQueryAssembler *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNAutocompleteCalendarQueryAssembler;
  v9 = -[CNAutocompleteCalendarQueryAssembler init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_rawCachedObservable, a3);
    objc_storeStrong((id *)&v10->_rawUncachedObservable, a4);
    v11 = v10;
  }

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteCalendarQueryAssembler rawCachedObservable](self, "rawCachedObservable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("rawCachedObservable"), v4);

  -[CNAutocompleteCalendarQueryAssembler rawUncachedObservable](self, "rawUncachedObservable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("rawUncachedObservable"), v6);

  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)assemble
{
  void *v3;
  CNObservable *v4;
  void *v5;
  CNObservable *v6;
  CNObservable *cachedObservable;
  CNObservable *uncachedObservable;
  CNObservable *v9;

  -[CNAutocompleteCalendarQueryAssembler rawCachedObservable](self, "rawCachedObservable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteCalendarQueryAssembler rawUncachedObservable](self, "rawUncachedObservable");
  v4 = (CNObservable *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "onEmpty:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "onError:", v4);
  v6 = (CNObservable *)objc_claimAutoreleasedReturnValue();

  cachedObservable = self->_cachedObservable;
  self->_cachedObservable = v6;
  v9 = v6;

  uncachedObservable = self->_uncachedObservable;
  self->_uncachedObservable = v4;

}

- (CNObservable)cachedObservable
{
  return (CNObservable *)objc_getProperty(self, a2, 8, 1);
}

- (CNObservable)uncachedObservable
{
  return (CNObservable *)objc_getProperty(self, a2, 16, 1);
}

- (CNObservable)rawCachedObservable
{
  return (CNObservable *)objc_getProperty(self, a2, 24, 1);
}

- (CNObservable)rawUncachedObservable
{
  return (CNObservable *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawUncachedObservable, 0);
  objc_storeStrong((id *)&self->_rawCachedObservable, 0);
  objc_storeStrong((id *)&self->_uncachedObservable, 0);
  objc_storeStrong((id *)&self->_cachedObservable, 0);
}

@end
