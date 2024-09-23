@implementation MADComputeServiceProxy

- (MADComputeServiceProxy)initWithCoordinator:(id)a3
{
  id v4;
  MADComputeServiceProxy *v5;
  MADComputeServiceProxy *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MADComputeServiceProxy;
  v5 = -[MADComputeServiceProxy init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_coordinator, v4);

  return v6;
}

- (void)reportProgress:(double)a3 requestID:(id)a4
{
  id WeakRetained;
  void *v7;
  id v8;

  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);
  v7 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "reportProgress:requestID:", v8, a3);

}

- (void)handleResults:(id)a3 assetRepresentation:(id)a4 requestID:(id)a5 error:(id)a6 acknowledgement:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id WeakRetained;
  void *v17;
  id v18;

  v18 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);
  v17 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "handleResults:assetRepresentation:requestID:error:acknowledgement:", v18, v12, v13, v14, v15);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_coordinator);
}

@end
