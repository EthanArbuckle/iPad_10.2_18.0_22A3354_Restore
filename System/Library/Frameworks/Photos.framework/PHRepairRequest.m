@implementation PHRepairRequest

- (PHRepairRequest)initWithRequestID:(int)a3 requestIndex:(unint64_t)a4 contextType:(int64_t)a5 managerID:(unint64_t)a6 asset:(id)a7 assetResource:(id)a8 errorCodes:(id)a9 delegate:(id)a10
{
  uint64_t v15;
  id v17;
  PHRepairRequest *v18;
  PHRepairRequest *v19;
  id v21;
  objc_super v22;

  v15 = *(_QWORD *)&a3;
  v21 = a8;
  v17 = a9;
  v22.receiver = self;
  v22.super_class = (Class)PHRepairRequest;
  v18 = -[PHMediaRequest initWithRequestID:requestIndex:contextType:managerID:asset:delegate:](&v22, sel_initWithRequestID_requestIndex_contextType_managerID_asset_delegate_, v15, a4, a5, a6, a7, a10);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_resource, a8);
    objc_storeStrong((id *)&v19->_errorCodes, a9);
  }

  return v19;
}

- (void)dealloc
{
  objc_super v3;

  -[PLProgressFollower invalidate](self->_progressFollower, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PHRepairRequest;
  -[PHMediaRequest dealloc](&v3, sel_dealloc);
}

- (id)_sendRepairRequestWithReply:(id)a3
{
  PHAssetResource *resource;
  id v5;
  id v6;
  void *v7;
  NSSet *errorCodes;

  resource = self->_resource;
  if (resource)
  {
    v5 = a3;
    -[PHAssetResource backingResourceIdentity](resource, "backingResourceIdentity");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[PHMediaRequest sendResourceRepairRequestForResource:errorCodes:reply:](self, "sendResourceRepairRequestForResource:errorCodes:reply:", v6, self->_errorCodes, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    errorCodes = self->_errorCodes;
    v6 = a3;
    -[PHMediaRequest sendResourceRepairRequestWithErrorCodes:reply:](self, "sendResourceRepairRequestWithErrorCodes:reply:", errorCodes, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (BOOL)isSynchronous
{
  return 0;
}

- (void)startRequest
{
  uint64_t v3;
  void *v4;
  id v5;
  PLProgressFollower *v6;
  PLProgressFollower *progressFollower;
  _QWORD v8[4];
  id v9;
  id location;
  _QWORD v11[5];

  v3 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __31__PHRepairRequest_startRequest__block_invoke;
  v11[3] = &unk_1E35DC1B0;
  v11[4] = self;
  -[PHRepairRequest _sendRepairRequestWithReply:](self, "_sendRepairRequestWithReply:", v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v5 = objc_alloc(MEMORY[0x1E0D71A18]);
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __31__PHRepairRequest_startRequest__block_invoke_2;
  v8[3] = &unk_1E35DE530;
  objc_copyWeak(&v9, &location);
  v6 = (PLProgressFollower *)objc_msgSend(v5, "initWithSourceProgress:progressHandler:", v4, v8);
  progressFollower = self->_progressFollower;
  self->_progressFollower = v6;

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (PHAssetResource)resource
{
  return self->_resource;
}

- (NSSet)errorCodes
{
  return self->_errorCodes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorCodes, 0);
  objc_storeStrong((id *)&self->_resource, 0);
  objc_storeStrong((id *)&self->_progressFollower, 0);
}

void __31__PHRepairRequest_startRequest__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  PHCompositeMediaResult *v6;

  v4 = a3;
  v6 = -[PHCompositeMediaResult initWithRequestID:]([PHCompositeMediaResult alloc], "initWithRequestID:", objc_msgSend(*(id *)(a1 + 32), "requestID"));
  -[PHCompositeMediaResult setErrorIfNone:](v6, "setErrorIfNone:", v4);

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaRequest:didFinishWithResult:", *(_QWORD *)(a1 + 32), v6);

}

void __31__PHRepairRequest_startRequest__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaRequest:didReportProgress:", WeakRetained, v3);

}

@end
