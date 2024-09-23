@implementation EXPromise

uint64_t __35___EXPromise_initWithPromiseBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __28___EXPromise_initWithCoder___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;

  v5 = a2;
  +[_EXPromiseManager sharedInstance](_EXPromiseManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resolveObjectOfClasses:forIdentifier:endpoint:error:", v5, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __43___EXPromise_resolveObjectOfClasses_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __48___EXPromise_resolveObjectOfClasses_completion___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

@end
