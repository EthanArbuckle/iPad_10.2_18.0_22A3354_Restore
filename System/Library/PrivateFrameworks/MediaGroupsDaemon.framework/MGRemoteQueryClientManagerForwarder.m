@implementation MGRemoteQueryClientManagerForwarder

- (MGRemoteQueryClientManagerForwarder)initWithClientManager:(id)a3
{
  id v4;
  MGRemoteQueryClientManagerForwarder *v5;
  MGRemoteQueryClientManagerForwarder *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MGRemoteQueryClientManagerForwarder;
  v5 = -[MGRemoteQueryClientManagerForwarder init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_manager, v4);

  return v6;
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t, _QWORD);
  id WeakRetained;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = (void (**)(id, uint64_t, _QWORD))a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  v11 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "URLSession:didReceiveChallenge:completionHandler:", v12, v8, v9);
  else
    v9[2](v9, 2, 0);

}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD);
  id WeakRetained;
  void *v14;
  id v15;

  v15 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, _QWORD))a6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  v14 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "URLSession:dataTask:didReceiveResponse:completionHandler:", v15, v10, v11, v12);
  else
    v12[2](v12, 0);

}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a5;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  v11 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "URLSession:dataTask:didReceiveData:", v12, v9, v8);
  else
    objc_msgSend(v9, "cancel");

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  v11 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "URLSession:task:didCompleteWithError:", v12, v8, v9);

}

- (MGRemoteQueryClientManager)manager
{
  return (MGRemoteQueryClientManager *)objc_loadWeakRetained((id *)&self->_manager);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_manager);
}

@end
