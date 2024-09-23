@implementation LPFetcherImageResponse

+ (BOOL)isValidMIMEType:(id)a3
{
  return +[LPMIMETypeRegistry isImageType:](LPMIMETypeRegistry, "isImageType:", a3);
}

+ (id)imagePropertiesForFetcher:(id)a3
{
  return objc_alloc_init(LPImageProperties);
}

+ (id)responseForFetcher:(id)a3 withImage:(id)a4
{
  id v6;
  id v7;
  LPImage *v8;
  void *v9;
  LPImage *v10;
  LPFetcherImageResponse *v11;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = [LPImage alloc];
    objc_msgSend(a1, "imagePropertiesForFetcher:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[LPImage initWithPlatformImage:properties:](v8, "initWithPlatformImage:properties:", v7, v9);

    if (v10 && !-[LPImage _isImperceptible](v10, "_isImperceptible"))
      v11 = -[LPFetcherImageResponse initWithImage:fetcher:]([LPFetcherImageResponse alloc], "initWithImage:fetcher:", v10, v6);
    else
      v11 = 0;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)responseForFetcher:(id)a3 withData:(id)a4 MIMEType:(id)a5
{
  id v8;
  id v9;
  id v10;
  LPImage *v11;
  void *v12;
  LPImage *v13;
  LPFetcherImageResponse *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "length"))
  {
    v11 = [LPImage alloc];
    objc_msgSend(a1, "imagePropertiesForFetcher:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[LPImage initWithData:MIMEType:properties:](v11, "initWithData:MIMEType:properties:", v9, v10, v12);

    if (v13 && !-[LPImage _isImperceptible](v13, "_isImperceptible"))
      v14 = -[LPFetcherImageResponse initWithImage:fetcher:]([LPFetcherImageResponse alloc], "initWithImage:fetcher:", v13, v8);
    else
      v14 = 0;

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (LPFetcherImageResponse)initWithImage:(id)a3 fetcher:(id)a4
{
  id v7;
  LPFetcherImageResponse *v8;
  LPFetcherImageResponse *v9;
  LPFetcherImageResponse *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)LPFetcherImageResponse;
  v8 = -[LPFetcherResponse initWithState:fetcher:](&v12, sel_initWithState_fetcher_, 2, a4);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_image, a3);
    v10 = v9;
  }

  return v9;
}

- (LPImage)image
{
  return self->_image;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
}

@end
