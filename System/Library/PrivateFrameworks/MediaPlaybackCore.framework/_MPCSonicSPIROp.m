@implementation _MPCSonicSPIROp

- (_MPCSonicSPIROp)initWithRequest:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  _MPCSonicSPIROp *v8;
  uint64_t v9;
  MPCModelStorePlaybackItemsRequest *request;
  uint64_t v11;
  id responseHandler;

  v6 = a3;
  v7 = a4;
  v8 = -[MPAsyncOperation init](self, "init");
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    request = v8->_request;
    v8->_request = (MPCModelStorePlaybackItemsRequest *)v9;

    v11 = objc_msgSend(v7, "copy");
    responseHandler = v8->_responseHandler;
    v8->_responseHandler = (id)v11;

  }
  return v8;
}

- (void)execute
{
  void *v3;
  void *v4;
  uint64_t v5;
  MPCModelStorePlaybackItemsResponse *v6;
  void *v7;
  MPCModelStorePlaybackItemsResponse *v8;
  void (**v9)(id, void *, _QWORD);

  -[_MPCSonicSPIROp responseHandler](self, "responseHandler");
  v9 = (void (**)(id, void *, _QWORD))objc_claimAutoreleasedReturnValue();
  -[_MPCSonicSPIROp request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "totalItemCount");

  if (v5)
  {
    v6 = [MPCModelStorePlaybackItemsResponse alloc];
    -[_MPCSonicSPIROp request](self, "request");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[MPCModelStorePlaybackItemsResponse initWithRequest:personalizationResponse:results:performanceMetrics:](v6, "initWithRequest:personalizationResponse:results:performanceMetrics:", v7, 0, 0, 0);

    -[MPCModelStorePlaybackItemsResponse setFinalResponse:](v8, "setFinalResponse:", 1);
    v9[2](v9, v8, 0);
    -[MPAsyncOperation finish](self, "finish");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("SonicSPIROp"), 400, CFSTR("No identifiers provided"));
    v8 = (MPCModelStorePlaybackItemsResponse *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, MPCModelStorePlaybackItemsResponse *))v9)[2](v9, 0, v8);
    -[MPAsyncOperation finishWithError:](self, "finishWithError:", v8);
  }

}

- (MPCModelStorePlaybackItemsRequest)request
{
  return self->_request;
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
