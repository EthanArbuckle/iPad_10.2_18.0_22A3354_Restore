@implementation MFMessageURLConnectionDelegate

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFMessageURLConnectionDelegate;
  -[MFMessageURLConnectionDelegate dealloc](&v3, sel_dealloc);
}

- (MFMessageURLConnectionDelegate)init
{
  MFMessageURLConnectionDelegate *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MFMessageURLConnectionDelegate;
  v2 = -[MFMessageURLConnectionDelegate init](&v4, sel_init);
  if (v2)
    v2->_promise = (EFPromise *)objc_alloc_init(MEMORY[0x1E0D1EF60]);
  return v2;
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  self->_response = (NSURLResponse *)a5;
  (*((void (**)(id, uint64_t))a6 + 2))(a6, 1);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  NSMutableData *responseBody;

  responseBody = self->_responseBody;
  if (responseBody)
    -[NSMutableData appendData:](responseBody, "appendData:", a5, a4);
  else
    self->_responseBody = (NSMutableData *)objc_msgSend(a5, "mutableCopy", a3, a4);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  EFPromise *promise;

  promise = self->_promise;
  if (a5)
    -[EFPromise finishWithError:](promise, "finishWithError:", a5, a4);
  else
    -[EFPromise finishWithResult:](promise, "finishWithResult:", self->_responseBody, a4);
}

- (EFFuture)future
{
  return (EFFuture *)-[EFPromise future](self->_promise, "future");
}

- (NSURLResponse)response
{
  return self->_response;
}

@end
