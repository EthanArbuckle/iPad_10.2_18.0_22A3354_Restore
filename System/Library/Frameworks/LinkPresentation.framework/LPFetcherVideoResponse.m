@implementation LPFetcherVideoResponse

+ (id)videoPropertiesForFetcher:(id)a3
{
  return objc_alloc_init(LPVideoProperties);
}

- (LPFetcherVideoResponse)initWithVideo:(id)a3 fetcher:(id)a4
{
  id v7;
  LPFetcherVideoResponse *v8;
  LPFetcherVideoResponse *v9;
  LPFetcherVideoResponse *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)LPFetcherVideoResponse;
  v8 = -[LPFetcherResponse initWithState:fetcher:](&v12, sel_initWithState_fetcher_, 2, a4);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_video, a3);
    v10 = v9;
  }

  return v9;
}

- (LPVideo)video
{
  return self->_video;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_video, 0);
}

@end
