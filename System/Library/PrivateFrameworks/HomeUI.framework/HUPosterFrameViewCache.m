@implementation HUPosterFrameViewCache

+ (id)sharedCache
{
  if (_MergedGlobals_613 != -1)
    dispatch_once(&_MergedGlobals_613, &__block_literal_global_15);
  return (id)qword_1ED580A48;
}

void __37__HUPosterFrameViewCache_sharedCache__block_invoke()
{
  HUPosterFrameViewCache *v0;
  void *v1;

  v0 = objc_alloc_init(HUPosterFrameViewCache);
  v1 = (void *)qword_1ED580A48;
  qword_1ED580A48 = (uint64_t)v0;

}

- (HUPosterFrameViewCache)init
{
  HUPosterFrameViewCache *v2;
  NSMutableArray *v3;
  NSMutableArray *posterFrameViewQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUPosterFrameViewCache;
  v2 = -[HUPosterFrameViewCache init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    posterFrameViewQueue = v2->_posterFrameViewQueue;
    v2->_posterFrameViewQueue = v3;

  }
  return v2;
}

+ (id)dequeuePosterFrameViewForWidth:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  objc_msgSend(a1, "sharedCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "posterFrameViewQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(a1, "sharedCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "posterFrameViewQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeLastObject");

    v10 = v7;
  }
  else
  {
    +[HUPosterFrameView posterFrameViewForWidth:](HUPosterFrameView, "posterFrameViewForWidth:", a3);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

+ (void)enqueuePosterFrameView:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "prepareForReuse");
  objc_msgSend(a1, "sharedCache");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "posterFrameViewQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

+ (void)purgeCache
{
  void *v2;
  id v3;

  objc_msgSend(a1, "sharedCache");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "posterFrameViewQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (NSMutableArray)posterFrameViewQueue
{
  return self->_posterFrameViewQueue;
}

- (void)setPosterFrameViewQueue:(id)a3
{
  objc_storeStrong((id *)&self->_posterFrameViewQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_posterFrameViewQueue, 0);
}

@end
