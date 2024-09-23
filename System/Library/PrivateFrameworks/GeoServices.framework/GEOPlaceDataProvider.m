@implementation GEOPlaceDataProvider

- (void)dealloc
{
  objc_super v3;

  if (-[GEOPlaceDataProvider isLoading](self, "isLoading"))
    -[GEOPlaceDataProvider cancelRequest](self, "cancelRequest");
  v3.receiver = self;
  v3.super_class = (Class)GEOPlaceDataProvider;
  -[GEOPlaceDataProvider dealloc](&v3, sel_dealloc);
}

- (void)requestCompleted
{
  -[GEOPlaceDataProvider setIsLoading:](self, "setIsLoading:", 0);
  -[GEOPlaceDataProvider setFinishedHandler:](self, "setFinishedHandler:", 0);
  -[GEOPlaceDataProvider setErrorHandler:](self, "setErrorHandler:", 0);
}

- (void)startRequest:(id)a3 appIdentifier:(id)a4 finished:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  if (-[GEOPlaceDataProvider isLoading](self, "isLoading"))
    -[GEOPlaceDataProvider cancelRequest](self, "cancelRequest");
  -[GEOPlaceDataProvider setIsLoading:](self, "setIsLoading:", 1);
  -[GEOPlaceDataProvider setFinishedHandler:](self, "setFinishedHandler:", v11);

  -[GEOPlaceDataProvider setErrorHandler:](self, "setErrorHandler:", v10);
  -[GEOPlaceDataProvider startProviderWithRequest:appIdentifier:](self, "startProviderWithRequest:appIdentifier:", v13, v12);

}

- (void)providerReceivedResponse:(id)a3 userInfo:(id)a4
{
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;

  v7 = a3;
  -[GEOPlaceDataProvider finishedHandler](self, "finishedHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[GEOPlaceDataProvider finishedHandler](self, "finishedHandler");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v6)[2](v6, v7);

  }
  -[GEOPlaceDataProvider requestCompleted](self, "requestCompleted");

}

- (void)providerReceivedErrorCode:(int64_t)a3 userInfo:(id)a4
{
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  id v9;

  v9 = a4;
  -[GEOPlaceDataProvider errorHandler](self, "errorHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:userInfo:", a3, v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPlaceDataProvider errorHandler](self, "errorHandler");
    v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v8)[2](v8, v7);

  }
  -[GEOPlaceDataProvider requestCompleted](self, "requestCompleted");

}

- (void)providerDidCancel
{
  -[GEOPlaceDataProvider providerReceivedErrorCode:userInfo:](self, "providerReceivedErrorCode:userInfo:", -2, 0);
}

- (BOOL)isLoading
{
  return self->_isLoading;
}

- (void)setIsLoading:(BOOL)a3
{
  self->_isLoading = a3;
}

- (id)finishedHandler
{
  return self->_finishedHandler;
}

- (void)setFinishedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong(&self->_finishedHandler, 0);
}

@end
