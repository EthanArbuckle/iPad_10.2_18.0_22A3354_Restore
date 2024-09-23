@implementation _PHAnimatedImageLoadOperation

- (_PHAnimatedImageLoadOperation)initWithURL:(id)a3 cachingStrategy:(int64_t)a4 useSharedDecoding:(BOOL)a5
{
  id v8;
  _PHAnimatedImageLoadOperation *v9;
  uint64_t v10;
  NSURL *animatedImageURL;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_PHAnimatedImageLoadOperation;
  v9 = -[_PHAnimatedImageLoadOperation init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    animatedImageURL = v9->_animatedImageURL;
    v9->_animatedImageURL = (NSURL *)v10;

    v9->_cacheStrategy = a4;
    v9->_useSharedImageDecoding = a5;
  }

  return v9;
}

- (void)main
{
  PHAnimatedImage *v3;

  if ((-[_PHAnimatedImageLoadOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    v3 = -[PHAnimatedImage initWithURL:cachingStrategy:useSharedDecoding:]([PHAnimatedImage alloc], "initWithURL:cachingStrategy:useSharedDecoding:", self->_animatedImageURL, self->_cacheStrategy, self->_useSharedImageDecoding);
    -[_PHAnimatedImageLoadOperation setAnimatedImage:](self, "setAnimatedImage:", v3);

  }
}

- (PHAnimatedImage)animatedImage
{
  return (PHAnimatedImage *)objc_getProperty(self, a2, 272, 1);
}

- (void)setAnimatedImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 272);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animatedImage, 0);
  objc_storeStrong((id *)&self->_animatedImageURL, 0);
}

+ (int64_t)nextRequestID
{
  int64_t result;

  do
    result = __ldaxr(&nextRequestID__lastRequestID);
  while (__stlxr(result + 1, &nextRequestID__lastRequestID));
  return result;
}

+ (void)_registerOperation:(id)a3 forRequestID:(int64_t)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  int64_t v12;

  v6 = a3;
  objc_msgSend(a1, "_requestIsolationQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65___PHAnimatedImageLoadOperation__registerOperation_forRequestID___block_invoke;
  block[3] = &unk_1E35DB398;
  v10 = v6;
  v11 = a1;
  v12 = a4;
  v8 = v6;
  dispatch_sync(v7, block);

}

+ (id)_removeOperation:(int64_t)a3
{
  NSObject *v5;
  id v6;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__2760;
  v13 = __Block_byref_object_dispose__2761;
  v14 = 0;
  objc_msgSend(a1, "_requestIsolationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50___PHAnimatedImageLoadOperation__removeOperation___block_invoke;
  block[3] = &unk_1E35DBF50;
  block[4] = &v9;
  block[5] = a1;
  block[6] = a3;
  dispatch_sync(v5, block);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

+ (id)_animatedImageSharedLoadingQueue
{
  if (_animatedImageSharedLoadingQueue_onceToken != -1)
    dispatch_once(&_animatedImageSharedLoadingQueue_onceToken, &__block_literal_global_2758);
  return (id)_animatedImageSharedLoadingQueue__loadingQueue;
}

+ (id)_inq_animatedImageLoadingOperations
{
  if (_inq_animatedImageLoadingOperations_onceToken != -1)
    dispatch_once(&_inq_animatedImageLoadingOperations_onceToken, &__block_literal_global_2);
  return (id)_inq_animatedImageLoadingOperations__loadingOperations;
}

+ (id)_requestIsolationQueue
{
  if (_requestIsolationQueue_onceToken != -1)
    dispatch_once(&_requestIsolationQueue_onceToken, &__block_literal_global_4);
  return (id)_requestIsolationQueue__requestIsolation;
}

@end
