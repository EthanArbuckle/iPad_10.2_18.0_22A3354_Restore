@implementation GKImageRequest

- (GKImageRequest)initWithURLRequest:(id)a3 dataConsumer:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  GKImageRequest *v11;
  uint64_t v12;
  NSURLRequest *urlRequest;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)GKImageRequest;
  v11 = -[GKResourceRequest init](&v15, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    urlRequest = v11->_urlRequest;
    v11->_urlRequest = (NSURLRequest *)v12;

    objc_storeStrong((id *)&v11->_dataConsumer, a4);
    objc_storeWeak((id *)&v11->_delegate, v10);
  }

  return v11;
}

- (GKImageRequest)init
{
  -[GKImageRequest doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKImageRequest urlRequest](self, "urlRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKImageRequest dataConsumer](self, "dataConsumer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p urlRequest = %@, dataConsumer = %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isResourceRequest
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[GKImageRequest urlRequest](self, "urlRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(CFSTR("resource"), "isEqual:", v4);

  return v5;
}

- (BOOL)isSystemImageRequest
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[GKImageRequest urlRequest](self, "urlRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(CFSTR("systemimage"), "isEqual:", v4);

  return v5;
}

- (BOOL)isAvatarImageRequest
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[GKImageRequest urlRequest](self, "urlRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(CFSTR("avatarimage"), "isEqual:", v4);

  return v5;
}

- (BOOL)isContactImageRequest
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[GKImageRequest urlRequest](self, "urlRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(CFSTR("contactimage"), "isEqual:", v4);

  return v5;
}

- (unint64_t)cacheOptions
{
  if (-[GKImageRequest isResourceRequest](self, "isResourceRequest"))
    return 6;
  if (-[GKImageRequest isSystemImageRequest](self, "isSystemImageRequest"))
    return 0;
  return 2;
}

+ (void)setSearchBundles:(id)a3
{
  uint64_t v3;
  void *v4;

  v3 = objc_msgSend(a3, "copy");
  v4 = (void *)_searchBundles;
  _searchBundles = v3;

}

+ (NSArray)searchBundles
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  if (_searchBundles)
    return (NSArray *)(id)objc_msgSend((id)_searchBundles, "copy");
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.GameCenterUI"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (id)makeLoadOperation
{
  GKLoadBundleResourceOperation *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  GKLoadBundleResourceOperation *v8;
  GKLoadSystemImageResourceOperation *v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  GKLoadAvatarResourceOperation *v21;
  void *v22;
  void *v23;
  void *v24;
  GKLoadImageResourceOperation *v25;

  if (-[GKImageRequest isResourceRequest](self, "isResourceRequest"))
  {
    v3 = [GKLoadBundleResourceOperation alloc];
    -[GKImageRequest urlRequest](self, "urlRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "host");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "searchBundles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[GKLoadBundleResourceOperation initWithResourceName:searchBundles:](v3, "initWithResourceName:searchBundles:", v6, v7);

  }
  else
  {
    if (!-[GKImageRequest isSystemImageRequest](self, "isSystemImageRequest"))
    {
      if (-[GKImageRequest isAvatarImageRequest](self, "isAvatarImageRequest"))
      {
        -[GKImageRequest urlRequest](self, "urlRequest");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "URL");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "host");
        v4 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v4, "isEqualToString:", CFSTR("G")))
        {
          -[GKImageRequest urlRequest](self, "urlRequest");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "URL");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "port");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            v16 = (void *)MEMORY[0x1E0CB3940];
            -[GKImageRequest urlRequest](self, "urlRequest");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "URL");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "port");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "stringWithFormat:", CFSTR("G:%@"), v19);
            v20 = objc_claimAutoreleasedReturnValue();

            v4 = (void *)v20;
          }
        }
        v21 = -[GKLoadAvatarResourceOperation initWithPlayerId:]([GKLoadAvatarResourceOperation alloc], "initWithPlayerId:", v4);
      }
      else
      {
        if (!-[GKImageRequest isContactImageRequest](self, "isContactImageRequest"))
        {
          v25 = [GKLoadImageResourceOperation alloc];
          -[GKImageRequest urlRequest](self, "urlRequest");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          -[GKImageRequest dataConsumer](self, "dataConsumer");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = -[GKLoadImageResourceOperation initWithURLRequest:dataConsumer:](v25, "initWithURLRequest:dataConsumer:", v4, v5);
          goto LABEL_6;
        }
        -[GKImageRequest urlRequest](self, "urlRequest");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "URL");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "host");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "stringByRemovingPercentEncoding");
        v4 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = -[GKLoadContactResourceOperation initWithContactId:]([GKLoadContactResourceOperation alloc], "initWithContactId:", v4);
      }
      v8 = (GKLoadBundleResourceOperation *)v21;
      goto LABEL_7;
    }
    v9 = [GKLoadSystemImageResourceOperation alloc];
    -[GKImageRequest urlRequest](self, "urlRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "host");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[GKLoadSystemImageResourceOperation initWithSystemImageName:](v9, "initWithSystemImageName:", v6);
  }

LABEL_6:
LABEL_7:

  return v8;
}

- (void)didLoadResource:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[GKImageRequest delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
    objc_msgSend(v7, "imageRequest:didFailWithError:", self, v6);
  else
    objc_msgSend(v7, "imageRequest:didLoadImage:", self, v9);

}

- (GKResourceDataConsumer)dataConsumer
{
  return self->_dataConsumer;
}

- (NSURLRequest)urlRequest
{
  return self->_urlRequest;
}

- (GKImageRequestDelegate)delegate
{
  return (GKImageRequestDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_urlRequest, 0);
  objc_storeStrong((id *)&self->_dataConsumer, 0);
}

@end
