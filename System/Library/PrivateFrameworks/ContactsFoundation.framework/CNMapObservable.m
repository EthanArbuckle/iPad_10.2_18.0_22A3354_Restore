@implementation CNMapObservable

+ (id)observableWithBlock:(id)a3
{
  id v3;
  CNMapObservable *v4;
  void *v5;

  v3 = a3;
  v4 = -[_CNBlockObservable initWithBlock:]([CNMapObservable alloc], "initWithBlock:", v3);

  -[CNObservable pipelineDescription:](v4, "pipelineDescription:", &__block_literal_global_35);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __39__CNMapObservable_observableWithBlock___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Map Observable"));
}

@end
