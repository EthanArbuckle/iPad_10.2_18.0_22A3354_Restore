@implementation MADServiceProxy

- (MADServiceProxy)initWithService:(id)a3
{
  id v4;
  MADServiceProxy *v5;
  MADServiceProxy *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MADServiceProxy;
  v5 = -[MADServiceProxy init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_service, v4);

  return v6;
}

- (void)reportProgress:(double)a3 forRequest:(int)a4
{
  uint64_t v4;
  id WeakRetained;

  v4 = *(_QWORD *)&a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  if (WeakRetained)
    objc_msgSend(WeakRetained, "reportProgress:forRequest:", v4, a3);

}

- (void)handleResult:(id)a3 atRequestIdx:(unint64_t)a4 forRequestID:(int)a5
{
  uint64_t v5;
  id WeakRetained;
  void *v9;
  id v10;

  v5 = *(_QWORD *)&a5;
  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  v9 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "handleResult:atRequestIdx:forRequestID:", v10, a4, v5);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_service);
}

@end
