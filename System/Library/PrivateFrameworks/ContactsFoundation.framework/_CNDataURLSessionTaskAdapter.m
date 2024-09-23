@implementation _CNDataURLSessionTaskAdapter

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v6;
  void (**v7)(id, id);

  v6 = a5;
  -[_CNDataURLSessionTaskAdapter onDataReceived](self, "onDataReceived");
  v7 = (void (**)(id, id))objc_claimAutoreleasedReturnValue();
  v7[2](v7, v6);

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v6;
  void (**v7)(id, id);

  v6 = a5;
  -[_CNDataURLSessionTaskAdapter onCompletion](self, "onCompletion");
  v7 = (void (**)(id, id))objc_claimAutoreleasedReturnValue();
  v7[2](v7, v6);

}

- (id)onDataReceived
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setOnDataReceived:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (id)onCompletion
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setOnCompletion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_onCompletion, 0);
  objc_storeStrong(&self->_onDataReceived, 0);
}

@end
