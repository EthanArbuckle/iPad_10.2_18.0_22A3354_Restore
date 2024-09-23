@implementation _CNAutocompleteObservableBuilderBatchingHelper

- (_CNAutocompleteObservableBuilderBatchingHelper)initWithBatchCount:(unint64_t)a3
{
  _CNAutocompleteObservableBuilderBatchingHelper *v4;
  void *i;
  void *v6;
  uint64_t v7;
  NSArray *batches;
  _CNAutocompleteObservableBuilderBatchingHelper *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_CNAutocompleteObservableBuilderBatchingHelper;
  v4 = -[_CNAutocompleteObservableBuilderBatchingHelper init](&v11, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a3);
    for (i = (void *)objc_claimAutoreleasedReturnValue(); a3; --a3)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(i, "addObject:", v6);

    }
    v7 = objc_msgSend(i, "copy");
    batches = v4->_batches;
    v4->_batches = (NSArray *)v7;

    v9 = v4;
  }

  return v4;
}

- (void)addObservable:(id)a3 toBatchAtIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  -[_CNAutocompleteObservableBuilderBatchingHelper batches](self, "batches");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "_cn_addNonNilObject:", v6);
}

- (id)batchedObservables
{
  void *v2;
  void *v3;

  -[_CNAutocompleteObservableBuilderBatchingHelper batches](self, "batches");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (NSArray)batches
{
  return self->_batches;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batches, 0);
}

@end
