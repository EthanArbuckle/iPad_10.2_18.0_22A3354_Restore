@implementation VSFileReadOperation

- (VSFileReadOperation)init
{
  VSFileReadOperation *v2;
  VSOptional *v3;
  VSOptional *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VSFileReadOperation;
  v2 = -[VSFileReadOperation init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(VSOptional);
    v4 = v2->_result;
    v2->_result = v3;

  }
  return v2;
}

- (void)executionDidBegin
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v3 = objc_alloc(MEMORY[0x1E0C99D50]);
  -[VSFileReadOperation source](self, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v5 = (void *)objc_msgSend(v3, "initWithContentsOfURL:options:error:", v4, 0, &v10);
  v6 = v10;

  if (v5)
  {
    +[VSFailable failableWithObject:](VSFailable, "failableWithObject:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v6)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The readErrorOrNil parameter must not be nil."));
    +[VSFailable failableWithError:](VSFailable, "failableWithError:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
  +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSFileReadOperation setResult:](self, "setResult:", v9);

  -[VSAsyncOperation finishExecutionIfPossible](self, "finishExecutionIfPossible");
}

- (NSURL)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (VSOptional)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

@end
