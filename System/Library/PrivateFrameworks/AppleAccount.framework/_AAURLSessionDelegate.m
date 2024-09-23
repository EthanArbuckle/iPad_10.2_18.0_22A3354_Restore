@implementation _AAURLSessionDelegate

- (_AAURLSessionDelegate)initWithDelegate:(id)a3
{
  id v4;
  _AAURLSessionDelegate *v5;
  _AAURLSessionDelegate *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_AAURLSessionDelegate;
  v5 = -[_AAURLSessionDelegate init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (_AAURLSessionDelegate)init
{
  return -[_AAURLSessionDelegate initWithDelegate:](self, "initWithDelegate:", 0);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v8;
  id v9;
  id WeakRetained;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "URLSession:dataTask:didReceiveData:", v11, v8, v9);

}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v6;
  id WeakRetained;
  id v8;

  v8 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "URLSession:didBecomeInvalidWithError:", v8, v6);

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8;
  id v9;
  id WeakRetained;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "URLSession:task:didCompleteWithError:", v11, v8, v9);

}

- (NSURLSessionDataDelegate)delegate
{
  return (NSURLSessionDataDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
