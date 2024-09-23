@implementation ASKImageRequest

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataConsumer, 0);
  objc_storeStrong((id *)&self->_loadOperation, 0);
  objc_storeStrong((id *)&self->_urlRequest, 0);
}

- (void)didLoadResource:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[ASKImageRequest delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
    objc_msgSend(v7, "imageRequest:didFailWithError:", self, v6);
  else
    objc_msgSend(v7, "imageRequest:didLoadImage:", self, v9);

}

- (ASKImageRequest)initWithURLRequest:(id)a3 loadOperation:(id)a4 dataConsumer:(id)a5 delegate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  ASKImageRequest *v14;
  uint64_t v15;
  NSURLRequest *urlRequest;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ASKImageRequest;
  v14 = -[ASKResourceRequest init](&v18, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    urlRequest = v14->_urlRequest;
    v14->_urlRequest = (NSURLRequest *)v15;

    objc_storeStrong((id *)&v14->_loadOperation, a4);
    objc_storeStrong((id *)&v14->_dataConsumer, a5);
    objc_storeWeak((id *)&v14->_delegate, v13);
  }

  return v14;
}

- (ASKLoadResourceOperation)loadOperation
{
  return self->_loadOperation;
}

- (ASKImageRequestDelegate)delegate
{
  return (ASKImageRequestDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (unint64_t)cacheOptions
{
  return 2;
}

- (ASKImageRequest)init
{
  -[ASKImageRequest doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

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
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASKImageRequest urlRequest](self, "urlRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASKImageRequest loadOperation](self, "loadOperation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASKImageRequest dataConsumer](self, "dataConsumer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p urlRequest = %@, loadOperation = %@, dataConsumer = %@>"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSURLRequest)urlRequest
{
  return self->_urlRequest;
}

- (ASKResourceDataConsumer)dataConsumer
{
  return self->_dataConsumer;
}

- (BOOL)isResourceRequest
{
  return self->_isResourceRequest;
}

@end
