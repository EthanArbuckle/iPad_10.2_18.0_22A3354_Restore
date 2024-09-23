@implementation PHAnimatedImage

- (PHAnimatedImage)init
{
  abort();
}

- (PHAnimatedImage)initWithURL:(id)a3
{
  return -[PHAnimatedImage initWithURL:cachingStrategy:useSharedDecoding:](self, "initWithURL:cachingStrategy:useSharedDecoding:", a3, 2, 0);
}

- (PHAnimatedImage)initWithURL:(id)a3 cachingStrategy:(int64_t)a4 useSharedDecoding:(BOOL)a5
{
  _BOOL8 v5;
  objc_class *v8;
  id v9;
  void *v10;
  PHAnimatedImage *v11;
  PHAnimatedImage *v12;
  PHAnimatedImage *v13;
  objc_super v15;

  v5 = a5;
  v8 = (objc_class *)MEMORY[0x1E0D75090];
  v9 = a3;
  v10 = (void *)objc_msgSend([v8 alloc], "initWithURL:cachingStrategy:useGlobalDecodeQueue:", v9, a4, v5);

  if (v10)
  {
    v15.receiver = self;
    v15.super_class = (Class)PHAnimatedImage;
    v11 = -[PHAnimatedImage init](&v15, sel_init);
    v12 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_pf_animatedImage, v10);
      -[PHAnimatedImage _initializePropertiesWithAnimatedImage:](v12, "_initializePropertiesWithAnimatedImage:", v12->_pf_animatedImage);
    }
    self = v12;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)_initializePropertiesWithAnimatedImage:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v4 = a3;
  self->_frameCount = objc_msgSend(v4, "frameCount");
  self->_loopCount = objc_msgSend(v4, "loopCount");
  objc_msgSend(v4, "duration");
  self->_duration = v5;
  objc_msgSend(v4, "pixelSize");
  v7 = v6;
  v9 = v8;

  self->_pixelWidth = (unint64_t)v7;
  self->_pixelHeight = (unint64_t)v9;
}

- (unint64_t)frameCount
{
  return self->_frameCount;
}

- (unint64_t)loopCount
{
  return self->_loopCount;
}

- (double)duration
{
  return self->_duration;
}

- (unint64_t)pixelWidth
{
  return self->_pixelWidth;
}

- (unint64_t)pixelHeight
{
  return self->_pixelHeight;
}

- (PFAnimatedImage)pf_animatedImage
{
  return self->_pf_animatedImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pf_animatedImage, 0);
}

+ (int64_t)requestAnimatedImageWithURL:(id)a3 completion:(id)a4
{
  return objc_msgSend(a1, "requestAnimatedImageWithURL:options:completion:", a3, 0, a4);
}

+ (int64_t)requestAnimatedImageWithURL:(id)a3 options:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  PHAnimatedImageRequestOptions *v12;
  void *v13;
  uint64_t v14;
  _PHAnimatedImageLoadOperation *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  id v22[2];
  id location;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  v11 = 0;
  if (v7 && v9)
  {
    v12 = (PHAnimatedImageRequestOptions *)v8;
    if (!v12)
      v12 = objc_alloc_init(PHAnimatedImageRequestOptions);
    +[_PHAnimatedImageLoadOperation _animatedImageSharedLoadingQueue](_PHAnimatedImageLoadOperation, "_animatedImageSharedLoadingQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = +[_PHAnimatedImageLoadOperation nextRequestID](_PHAnimatedImageLoadOperation, "nextRequestID");
    if (-[PHAnimatedImageRequestOptions allowPreCaching](v12, "allowPreCaching"))
      v14 = 2;
    else
      v14 = 0;
    v15 = -[_PHAnimatedImageLoadOperation initWithURL:cachingStrategy:useSharedDecoding:]([_PHAnimatedImageLoadOperation alloc], "initWithURL:cachingStrategy:useSharedDecoding:", v7, v14, -[PHAnimatedImageRequestOptions useSharedImageDecoding](v12, "useSharedImageDecoding"));
    objc_initWeak(&location, v15);
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __66__PHAnimatedImage_requestAnimatedImageWithURL_options_completion___block_invoke;
    v20 = &unk_1E35D6548;
    v22[1] = v11;
    v21 = v10;
    objc_copyWeak(v22, &location);
    -[_PHAnimatedImageLoadOperation setCompletionBlock:](v15, "setCompletionBlock:", &v17);
    +[_PHAnimatedImageLoadOperation _registerOperation:forRequestID:](_PHAnimatedImageLoadOperation, "_registerOperation:forRequestID:", v15, v11, v17, v18, v19, v20);
    objc_msgSend(v13, "addOperation:", v15);
    objc_destroyWeak(v22);

    objc_destroyWeak(&location);
  }

  return (int64_t)v11;
}

+ (void)cancelAnimatedImageRequest:(int64_t)a3
{
  id v3;

  +[_PHAnimatedImageLoadOperation _removeOperation:](_PHAnimatedImageLoadOperation, "_removeOperation:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

}

void __66__PHAnimatedImage_requestAnimatedImageWithURL_options_completion___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;

  v2 = +[_PHAnimatedImageLoadOperation _removeOperation:](_PHAnimatedImageLoadOperation, "_removeOperation:", *(_QWORD *)(a1 + 48));
  v3 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "animatedImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

}

@end
