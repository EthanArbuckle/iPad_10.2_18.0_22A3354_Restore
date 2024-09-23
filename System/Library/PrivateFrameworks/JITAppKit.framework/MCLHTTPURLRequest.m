@implementation MCLHTTPURLRequest

- (MCLHTTPURLRequest)init
{
  MCLHTTPURLRequest *v3;
  objc_super v4;
  SEL v5;
  MCLHTTPURLRequest *v6;

  v5 = a2;
  v6 = 0;
  v4.receiver = self;
  v4.super_class = (Class)MCLHTTPURLRequest;
  v6 = -[MCLHTTPURLRequest init](&v4, sel_init);
  objc_storeStrong((id *)&v6, v6);
  if (v6)
    objc_storeStrong((id *)&v6->_httpMethod, CFSTR("GET"));
  v3 = v6;
  objc_storeStrong((id *)&v6, 0);
  return v3;
}

- (void)send
{
  -[MCLHTTPURLRequest sendData:](self, "sendData:", 0, a2, self);
}

- (void)sendData:(id)a3
{
  id v3;
  id v4;
  int v5;
  id location[2];
  MCLHTTPURLRequest *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[MCLHTTPURLRequest setStatusCode:](v7, "setStatusCode:", 0);
  if (v7->_url)
  {
    -[MCLHTTPURLRequest cancel](v7, "cancel");
    v4 = (id)objc_msgSend(MEMORY[0x24BDD16B0], "requestWithURL:cachePolicy:timeoutInterval:", v7->_url, 1, v7->_timeout);
    objc_msgSend(v4, "setNetworkServiceType:", 0);
    if (-[NSDictionary count](v7->_httpHeaders, "count"))
      objc_msgSend(v4, "setAllHTTPHeaderFields:", v7->_httpHeaders);
    objc_msgSend(v4, "setHTTPMethod:", v7->_httpMethod);
    if (location[0])
    {
      v3 = (id)objc_msgSend(location[0], "copy");
      objc_msgSend(v4, "setHTTPBody:");

    }
    -[MCLHTTPURLRequest loadRequest:](v7, "loadRequest:", v4);
    objc_storeStrong(&v4, 0);
    v5 = 0;
  }
  else
  {
    v5 = 1;
  }
  objc_storeStrong(location, 0);
}

- (void)sendText:(id)a3
{
  MCLHTTPURLRequest *v3;
  id v4;
  id location[2];
  MCLHTTPURLRequest *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v6;
  v4 = (id)objc_msgSend(location[0], "dataUsingEncoding:", 4);
  -[MCLHTTPURLRequest sendData:](v3, "sendData:");

  objc_storeStrong(location, 0);
}

- (void)cancel
{
  id v2;

  if (self->_task)
  {
    v2 = +[MCLURLDataLoader shared](MCLURLDataLoader, "shared");
    objc_msgSend(v2, "cancelTask:", self->_task);

    objc_storeStrong((id *)&self->_task, 0);
  }
}

- (void)loadRequest:(id)a3
{
  MCLURLDataLoaderTask *v3;
  MCLURLDataLoaderTask *task;
  id v5;
  id v6;
  uint64_t v7;
  int v8;
  int v9;
  void (*v10)(id *, void *, void *);
  void *v11;
  id v12[3];
  id from;
  id location[2];
  MCLHTTPURLRequest *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_initWeak(&from, v15);
  v5 = +[MCLURLDataLoader shared](MCLURLDataLoader, "shared");
  v6 = location[0];
  v7 = MEMORY[0x24BDAC760];
  v8 = -1073741824;
  v9 = 0;
  v10 = __33__MCLHTTPURLRequest_loadRequest___block_invoke;
  v11 = &unk_24E099EB0;
  objc_copyWeak(v12, &from);
  v3 = (MCLURLDataLoaderTask *)(id)objc_msgSend(v5, "loadRequest:category:completionHandler:", v6, CFSTR("high"), &v7);
  task = v15->_task;
  v15->_task = v3;

  objc_destroyWeak(v12);
  objc_destroyWeak(&from);
  objc_storeStrong(location, 0);
}

void __33__MCLHTTPURLRequest_loadRequest___block_invoke(id *a1, void *a2, void *a3)
{
  id WeakRetained;
  id v6;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v6 = 0;
  objc_storeStrong(&v6, a3);
  WeakRetained = objc_loadWeakRetained(a1 + 4);
  objc_msgSend(WeakRetained, "handleCompletion:", v6);

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)handleCompletion:(id)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  id v9;
  MCLHTTPURLRequest *v10;
  id location[2];
  MCLHTTPURLRequest *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = MEMORY[0x24BDAC9B8];
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __38__MCLHTTPURLRequest_handleCompletion___block_invoke;
  v8 = &unk_24E099990;
  v9 = location[0];
  v10 = v12;
  dispatch_async(queue, &v4);

  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

uint64_t __38__MCLHTTPURLRequest_handleCompletion___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "setError:", *(_QWORD *)(a1 + 32));
    return objc_msgSend(*(id *)(a1 + 40), "emitTMLSignal:withArguments:", CFSTR("error"), 0);
  }
  else
  {
    v2 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "response");
    objc_msgSend(*(id *)(a1 + 40), "setStatusCode:", objc_msgSend(v2, "statusCode"));

    v4 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "responseData");
    v3 = (id)objc_msgSend(v4, "copy");
    objc_msgSend(*(id *)(a1 + 40), "setData:");

    return objc_msgSend(*(id *)(a1 + 40), "emitTMLSignal:withArguments:", CFSTR("load"), 0);
  }
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)httpMethod
{
  return self->_httpMethod;
}

- (void)setHttpMethod:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDictionary)httpHeaders
{
  return self->_httpHeaders;
}

- (void)setHttpHeaders:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (unint64_t)statusCode
{
  return self->_statusCode;
}

- (void)setStatusCode:(unint64_t)a3
{
  self->_statusCode = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_httpHeaders, 0);
  objc_storeStrong((id *)&self->_httpMethod, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_task, 0);
}

@end
