@implementation PHAdjustmentDataRequestContext

- (PHAdjustmentDataRequestContext)initWithRequestID:(int)a3 managerID:(unint64_t)a4 asset:(id)a5 options:(id)a6 resultHandler:(id)a7
{
  uint64_t v11;
  id v13;
  PHAdjustmentDataRequestContext *v14;
  PHAdjustmentDataRequestContext *v15;
  objc_super v17;

  v11 = *(_QWORD *)&a3;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)PHAdjustmentDataRequestContext;
  v14 = -[PHMediaRequestContext initWithRequestID:managerID:asset:displaySpec:resultHandler:](&v17, sel_initWithRequestID_managerID_asset_displaySpec_resultHandler_, v11, a4, a5, 0, a7);
  v15 = v14;
  if (v14)
    objc_storeStrong((id *)&v14->_options, a6);

  return v15;
}

- (int64_t)type
{
  return 3;
}

- (BOOL)isNetworkAccessAllowed
{
  return -[PHImageRequestOptions isNetworkAccessAllowed](self->_options, "isNetworkAccessAllowed");
}

- (id)initialRequests
{
  PHAdjustmentDataRequestBehaviorSpec *v3;
  PHAdjustmentDataRequest *v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  unint64_t v8;
  void *v9;
  PHAdjustmentDataRequest *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(PHAdjustmentDataRequestBehaviorSpec);
  -[PHAdjustmentDataRequestBehaviorSpec setNetworkAccessAllowed:](v3, "setNetworkAccessAllowed:", -[PHImageRequestOptions isNetworkAccessAllowed](self->_options, "isNetworkAccessAllowed"));
  -[PHAdjustmentDataRequestBehaviorSpec setSynchronous:](v3, "setSynchronous:", -[PHImageRequestOptions isSynchronous](self->_options, "isSynchronous"));
  v4 = [PHAdjustmentDataRequest alloc];
  v5 = -[PHMediaRequestContext requestID](self, "requestID");
  v6 = -[PHMediaRequestContext nextRequestIndex](self, "nextRequestIndex");
  v7 = -[PHAdjustmentDataRequestContext type](self, "type");
  v8 = -[PHMediaRequestContext managerID](self, "managerID");
  -[PHMediaRequestContext asset](self, "asset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PHAdjustmentDataRequest initWithRequestID:requestIndex:contextType:managerID:asset:behaviorSpec:delegate:](v4, "initWithRequestID:requestIndex:contextType:managerID:asset:behaviorSpec:delegate:", v5, v6, v7, v8, v9, v3, self);

  v13[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)processMediaResult:(id)a3 forRequest:(id)a4
{
  void (**resultHandler)(id, id, id, PHAdjustmentDataRequestContext *);

  resultHandler = (void (**)(id, id, id, PHAdjustmentDataRequestContext *))self->super._resultHandler;
  if (resultHandler)
    resultHandler[2](resultHandler, a3, a4, self);
}

- (PHImageRequestOptions)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
}

@end
