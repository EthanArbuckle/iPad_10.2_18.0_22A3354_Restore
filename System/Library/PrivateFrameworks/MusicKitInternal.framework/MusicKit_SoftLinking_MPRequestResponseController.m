@implementation MusicKit_SoftLinking_MPRequestResponseController

- (MusicKit_SoftLinking_MPRequestResponseController)init
{
  MusicKit_SoftLinking_MPRequestResponseController *v2;
  void *v3;
  objc_class *v4;
  MPRequestResponseController *v5;
  MPRequestResponseController *underlyingRequestResponseController;
  objc_super v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v8.receiver = self;
  v8.super_class = (Class)MusicKit_SoftLinking_MPRequestResponseController;
  v2 = -[MusicKit_SoftLinking_MPRequestResponseController init](&v8, sel_init);
  if (v2)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v3 = (void *)getMPRequestResponseControllerClass_softClass;
    v13 = getMPRequestResponseControllerClass_softClass;
    if (!getMPRequestResponseControllerClass_softClass)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __getMPRequestResponseControllerClass_block_invoke;
      v9[3] = &unk_1E9C05688;
      v9[4] = &v10;
      __getMPRequestResponseControllerClass_block_invoke((uint64_t)v9);
      v3 = (void *)v11[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v10, 8);
    v5 = (MPRequestResponseController *)objc_alloc_init(v4);
    underlyingRequestResponseController = v2->_underlyingRequestResponseController;
    v2->_underlyingRequestResponseController = v5;

    -[MPRequestResponseController setDelegate:](v2->_underlyingRequestResponseController, "setDelegate:", v2);
  }
  return v2;
}

- (MusicKit_SoftLinking_MPRequestResponseController)initWithUnderlyingRequestResponseController:(id)a3
{
  id v5;
  MusicKit_SoftLinking_MPRequestResponseController *v6;
  MusicKit_SoftLinking_MPRequestResponseController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MusicKit_SoftLinking_MPRequestResponseController;
  v6 = -[MusicKit_SoftLinking_MPRequestResponseController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_underlyingRequestResponseController, a3);

  return v7;
}

- (MusicKit_SoftLinking_MPCPlayerRequest)request
{
  MusicKit_SoftLinking_MPCPlayerRequest *v3;
  void *v4;
  MusicKit_SoftLinking_MPCPlayerRequest *v5;

  v3 = [MusicKit_SoftLinking_MPCPlayerRequest alloc];
  -[MPRequestResponseController request](self->_underlyingRequestResponseController, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MusicKit_SoftLinking_MPCPlayerRequest initWithUnderlyingPlayerRequest:](v3, "initWithUnderlyingPlayerRequest:", v4);

  return v5;
}

- (void)setRequest:(id)a3
{
  MPRequestResponseController *underlyingRequestResponseController;
  id v4;

  underlyingRequestResponseController = self->_underlyingRequestResponseController;
  objc_msgSend(a3, "_underlyingPlayerRequest");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MPRequestResponseController setRequest:](underlyingRequestResponseController, "setRequest:", v4);

}

- (MusicKit_SoftLinking_MPCPlayerResponse)response
{
  return (MusicKit_SoftLinking_MPCPlayerResponse *)-[MPRequestResponseController response](self->_underlyingRequestResponseController, "response");
}

- (void)beginAutomaticResponseLoading
{
  -[MPRequestResponseController beginAutomaticResponseLoading](self->_underlyingRequestResponseController, "beginAutomaticResponseLoading");
}

- (void)endAutomaticResponseLoading
{
  -[MPRequestResponseController endAutomaticResponseLoading](self->_underlyingRequestResponseController, "endAutomaticResponseLoading");
}

- (void)setNeedsReload
{
  -[MPRequestResponseController setNeedsReload](self->_underlyingRequestResponseController, "setNeedsReload");
}

- (void)setNeedsReloadForSignificantRequestChange
{
  -[MPRequestResponseController setNeedsReloadForSignificantRequestChange](self->_underlyingRequestResponseController, "setNeedsReloadForSignificantRequestChange");
}

- (void)reloadIfNeeded
{
  -[MPRequestResponseController reloadIfNeeded](self->_underlyingRequestResponseController, "reloadIfNeeded");
}

- (void)controller:(id)a3 defersResponseReplacement:(id)a4
{
  void *v6;
  id v7;

  v7 = a3;
  (*((void (**)(id))a4 + 2))(a4);
  if (self->_responseHandler)
  {
    objc_msgSend(v7, "response");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void))self->_responseHandler + 2))();

  }
}

- (BOOL)controller:(id)a3 shouldRetryFailedRequestWithError:(id)a4
{
  uint64_t (**shouldRetryFailedRequestWithErrorHandler)(id, id);

  shouldRetryFailedRequestWithErrorHandler = (uint64_t (**)(id, id))self->_shouldRetryFailedRequestWithErrorHandler;
  if (shouldRetryFailedRequestWithErrorHandler)
    return shouldRetryFailedRequestWithErrorHandler[2](shouldRetryFailedRequestWithErrorHandler, a4);
  else
    return 1;
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)shouldRetryFailedRequestWithErrorHandler
{
  return self->_shouldRetryFailedRequestWithErrorHandler;
}

- (void)setShouldRetryFailedRequestWithErrorHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_shouldRetryFailedRequestWithErrorHandler, 0);
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_underlyingRequestResponseController, 0);
}

@end
