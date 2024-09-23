@implementation _EFURLConnectionDelegate

- (_EFURLConnectionDelegate)init
{
  _EFURLConnectionDelegate *v2;
  EFPromise *v3;
  EFPromise *promise;
  _EFURLConnectionDelegate *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_EFURLConnectionDelegate;
  v2 = -[_EFURLConnectionDelegate init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(EFPromise);
    promise = v2->_promise;
    v2->_promise = v3;

    v5 = v2;
  }

  return v2;
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  void (**v7)(id, uint64_t);

  objc_storeStrong((id *)&self->_response, a5);
  v7 = (void (**)(id, uint64_t))a6;
  v7[2](v7, 1);

}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v6;
  NSMutableData *responseBody;
  NSMutableData *v8;
  NSMutableData *v9;
  id v10;

  v6 = a5;
  responseBody = self->_responseBody;
  v10 = v6;
  if (responseBody)
  {
    -[NSMutableData appendData:](responseBody, "appendData:", v6);
  }
  else
  {
    v8 = (NSMutableData *)objc_msgSend(v6, "mutableCopy");
    v9 = self->_responseBody;
    self->_responseBody = v8;

  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8;
  id v9;
  EFPromise *promise;
  NSMutableData *responseBody;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  promise = self->_promise;
  if (v9)
  {
    -[EFPromise finishWithError:](self->_promise, "finishWithError:", v9);
  }
  else
  {
    responseBody = self->_responseBody;
    v12 = responseBody;
    if (!responseBody)
      v12 = (void *)objc_opt_new();
    -[EFPromise finishWithResult:](promise, "finishWithResult:", v12);
    if (!responseBody)

  }
}

- (EFFuture)future
{
  return -[EFPromise future](self->_promise, "future");
}

- (NSURLResponse)response
{
  return self->_response;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_promise, 0);
  objc_storeStrong((id *)&self->_responseBody, 0);
}

@end
