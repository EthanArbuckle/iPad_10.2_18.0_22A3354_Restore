@implementation PHAnimatedImageLoadOperation

void __55___PHAnimatedImageLoadOperation__requestIsolationQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.PHAnimatedImage.isolation", v2);
  v1 = (void *)_requestIsolationQueue__requestIsolation;
  _requestIsolationQueue__requestIsolation = (uint64_t)v0;

}

void __68___PHAnimatedImageLoadOperation__inq_animatedImageLoadingOperations__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_inq_animatedImageLoadingOperations__loadingOperations;
  _inq_animatedImageLoadingOperations__loadingOperations = v0;

}

uint64_t __65___PHAnimatedImageLoadOperation__animatedImageSharedLoadingQueue__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v1 = (void *)_animatedImageSharedLoadingQueue__loadingQueue;
  _animatedImageSharedLoadingQueue__loadingQueue = (uint64_t)v0;

  objc_msgSend((id)_animatedImageSharedLoadingQueue__loadingQueue, "setQualityOfService:", 25);
  return objc_msgSend((id)_animatedImageSharedLoadingQueue__loadingQueue, "setMaxConcurrentOperationCount:", 3);
}

void __50___PHAnimatedImageLoadOperation__removeOperation___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 40), "_inq_animatedImageLoadingOperations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  objc_msgSend(*(id *)(a1 + 40), "_inq_animatedImageLoadingOperations");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectForKey:", v7);

}

void __65___PHAnimatedImageLoadOperation__registerOperation_forRequestID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 40), "_inq_animatedImageLoadingOperations");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v2, v3);

}

@end
