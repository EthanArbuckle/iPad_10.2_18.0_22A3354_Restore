@implementation _GEOLocationShiftLocation

- (_GEOLocationShiftLocation)initWithLatLng:(id)a3 accuracy:(double)a4 completionHandler:(id)a5 errorHandler:(id)a6 mustGoToNetworkCallback:(id)a7 callbackQueue:(id)a8 auditToken:(id)a9
{
  id v17;
  id *v18;
  _GEOLocationShiftLocation *v19;
  _GEOLocationShiftLocation *v20;

  v17 = a9;
  v18 = -[_GEOLocationShiftLocation _initWithLatLng:accuracy:callbackQueue:completionHandler:errorHandler:mustGoToNetworkCallback:](self, "_initWithLatLng:accuracy:callbackQueue:completionHandler:errorHandler:mustGoToNetworkCallback:", a3, a8, a5, a6, a7, a4);
  v19 = (_GEOLocationShiftLocation *)v18;
  if (v18)
  {
    objc_storeStrong(v18 + 2, a9);
    v20 = v19;
  }

  return v19;
}

- (id)_initWithLatLng:(id)a3 accuracy:(double)a4 callbackQueue:(id)a5 completionHandler:(id)a6 errorHandler:(id)a7 mustGoToNetworkCallback:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _GEOLocationShiftLocation *v20;
  _GEOLocationShiftLocation *v21;
  uint64_t v22;
  id completionHandler;
  uint64_t v24;
  id errorHandler;
  uint64_t v26;
  id mustGoToNetworkCallback;
  _GEOLocationShiftLocation *v28;
  objc_super v30;

  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v30.receiver = self;
  v30.super_class = (Class)_GEOLocationShiftLocation;
  v20 = -[_GEOLocationShiftLocation init](&v30, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_latLng, a3);
    v21->_accuracy = a4;
    objc_storeStrong((id *)&v21->_callbackQueue, a5);
    v22 = objc_msgSend(v17, "copy");
    completionHandler = v21->_completionHandler;
    v21->_completionHandler = (id)v22;

    v24 = objc_msgSend(v18, "copy");
    errorHandler = v21->_errorHandler;
    v21->_errorHandler = (id)v24;

    v26 = objc_msgSend(v19, "copy");
    mustGoToNetworkCallback = v21->_mustGoToNetworkCallback;
    v21->_mustGoToNetworkCallback = (id)v26;

    v28 = v21;
  }

  return v21;
}

- (void)performCompletionHandlerWithShiftedCoordinate:(id)a3 accuracy:(double)a4 function:(id)a5
{
  double var1;
  double var0;
  id v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  double v13;
  double v14;
  double v15;

  var1 = a3.var1;
  var0 = a3.var0;
  v9 = a5;
  v10 = v9;
  if (self->_completionHandler || self->_functionHandler)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __93___GEOLocationShiftLocation_performCompletionHandlerWithShiftedCoordinate_accuracy_function___block_invoke;
    v11[3] = &unk_1E1C06FD8;
    v11[4] = self;
    v13 = var0;
    v14 = var1;
    v15 = a4;
    v12 = v9;
    -[_GEOLocationShiftLocation _performOnCallbackQueue:](self, "_performOnCallbackQueue:", v11);

  }
}

- (GEOLatLng)latLng
{
  return self->_latLng;
}

- (double)accuracy
{
  return self->_accuracy;
}

- (void)_performOnCallbackQueue:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *callbackQueue;
  void (**block)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  if (v4)
  {
    callbackQueue = self->_callbackQueue;
    block = v4;
    if (callbackQueue)
      dispatch_async(callbackQueue, v4);
    else
      v4[2](v4);
    v4 = block;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong(&self->_functionHandler, 0);
  objc_storeStrong(&self->_mustGoToNetworkCallback, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_latLng, 0);
}

- (_GEOLocationShiftLocation)initWithLatLng:(id)a3 accuracy:(double)a4 completionHandler:(id)a5 errorHandler:(id)a6 mustGoToNetworkCallback:(id)a7 callbackQueue:(id)a8
{
  _GEOLocationShiftLocation *v8;
  _GEOLocationShiftLocation *v9;
  _GEOLocationShiftLocation *v10;

  v8 = -[_GEOLocationShiftLocation _initWithLatLng:accuracy:callbackQueue:completionHandler:errorHandler:mustGoToNetworkCallback:](self, "_initWithLatLng:accuracy:callbackQueue:completionHandler:errorHandler:mustGoToNetworkCallback:", a3, a8, a5, a6, a7, a4);
  v9 = v8;
  if (v8)
    v10 = v8;

  return v9;
}

- (_GEOLocationShiftLocation)initWithLatLng:(id)a3 auditToken:(id)a4 functionHandler:(id)a5 errorHandler:(id)a6 callbackQueue:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _GEOLocationShiftLocation *v18;
  _GEOLocationShiftLocation *v19;
  uint64_t v20;
  id functionHandler;
  uint64_t v22;
  id errorHandler;
  _GEOLocationShiftLocation *v24;
  objc_super v26;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v26.receiver = self;
  v26.super_class = (Class)_GEOLocationShiftLocation;
  v18 = -[_GEOLocationShiftLocation init](&v26, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_latLng, a3);
    objc_storeStrong((id *)&v19->_auditToken, a4);
    v20 = objc_msgSend(v15, "copy");
    functionHandler = v19->_functionHandler;
    v19->_functionHandler = (id)v20;

    v22 = objc_msgSend(v16, "copy");
    errorHandler = v19->_errorHandler;
    v19->_errorHandler = (id)v22;

    objc_storeStrong((id *)&v19->_callbackQueue, a7);
    v24 = v19;
  }

  return v19;
}

- (void)performErrorHandler:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v5 = v4;
  if (self->_errorHandler)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __49___GEOLocationShiftLocation_performErrorHandler___block_invoke;
    v6[3] = &unk_1E1C00738;
    v6[4] = self;
    v7 = v4;
    -[_GEOLocationShiftLocation _performOnCallbackQueue:](self, "_performOnCallbackQueue:", v6);

  }
}

- (void)performMustGoToNetwork
{
  _QWORD v2[5];

  if (self->_mustGoToNetworkCallback)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __51___GEOLocationShiftLocation_performMustGoToNetwork__block_invoke;
    v2[3] = &unk_1E1BFF6F8;
    v2[4] = self;
    -[_GEOLocationShiftLocation _performOnCallbackQueue:](self, "_performOnCallbackQueue:", v2);
  }
}

- (GEOApplicationAuditToken)auditToken
{
  return self->_auditToken;
}

@end
