@implementation NSObject(EFKVOAdditions)

- (id)ef_observeKeyPath:()EFKVOAdditions options:usingBlock:
{
  objc_msgSend(a1, "ef_observeKeyPath:options:autoCancelToken:usingBlock:", a3, a4, 0, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)ef_observeKeyPath:()EFKVOAdditions options:autoCancelToken:usingBlock:
{
  id v10;
  id v11;
  _EFKeyValueObserverHandler *v12;
  _QWORD *v13;
  uint64_t v14;
  void *v15;
  _QWORD v17[5];
  _QWORD v18[5];

  v10 = a3;
  v11 = a6;
  v12 = -[_EFKeyValueObserverHandler initWithObject:keyPath:usingBlock:]([_EFKeyValueObserverHandler alloc], "initWithObject:keyPath:usingBlock:", a1, v10, v11);
  -[_EFKeyValueObserverHandler startObservingWithOptions:](v12, "startObservingWithOptions:", a4);
  if (a5)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __81__NSObject_EFKVOAdditions__ef_observeKeyPath_options_autoCancelToken_usingBlock___block_invoke;
    v18[3] = &unk_1E62A5860;
    v13 = v18;
    v18[4] = v12;
    +[EFCancelationToken tokenWithCancelationBlock:](EFAutoCancelationToken, "tokenWithCancelationBlock:", v18);
    v14 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __81__NSObject_EFKVOAdditions__ef_observeKeyPath_options_autoCancelToken_usingBlock___block_invoke_2;
    v17[3] = &unk_1E62A5860;
    v13 = v17;
    v17[4] = v12;
    +[EFCancelationToken tokenWithCancelationBlock:](EFCancelationToken, "tokenWithCancelationBlock:", v17);
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)v14;

  return v15;
}

@end
