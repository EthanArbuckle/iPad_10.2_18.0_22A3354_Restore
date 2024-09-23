@implementation WFGetExternalAddressOperation

- (void)start
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  _QWORD block[4];
  id v11;
  WFGetExternalAddressOperation *v12;
  id v13;

  v3 = (void *)MEMORY[0x24BDD1808];
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://www.icloud.com/shortcuts/api/external_ip"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsWithURL:resolvingAgainstBaseURL:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFNetworkInterface activeNetworkInterface](WFNetworkInterface, "activeNetworkInterface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __38__WFGetExternalAddressOperation_start__block_invoke;
    block[3] = &unk_24F8BB0A0;
    v11 = v6;
    v12 = self;
    v13 = v5;
    dispatch_async(v8, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 50, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFGetExternalAddressOperation setError:](self, "setError:", v9);

  }
}

- (void)setStream:(__CFReadStream *)a3
{
  __CFReadStream *stream;

  stream = self->_stream;
  if (a3)
    CFRetain(a3);
  self->_stream = a3;
  if (stream)
    CFRelease(stream);
}

- (void)dealloc
{
  __CFReadStream *stream;
  objc_super v4;

  stream = self->_stream;
  if (stream)
    CFRelease(stream);
  v4.receiver = self;
  v4.super_class = (Class)WFGetExternalAddressOperation;
  -[WFGetExternalAddressOperation dealloc](&v4, sel_dealloc);
}

- (void)handleStreamEvent:(unint64_t)a3
{
  CFIndex v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  UInt8 v12[1024];
  CFErrorRef v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  switch(a3)
  {
    case 0x10uLL:
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", self->_data, 4);
      -[WFGetExternalAddressOperation setResult:](self, "setResult:", v5);

      -[WFGetExternalAddressOperation result](self, "result");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        v7 = (void *)MEMORY[0x24BDD1540];
        v8 = *MEMORY[0x24BDD1128];
        v14 = *MEMORY[0x24BDD0FC8];
        WFLocalizedString(CFSTR("The response data was not a valid string."));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v15[0] = v9;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 79, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFGetExternalAddressOperation setError:](self, "setError:", v11);

      }
      break;
    case 8uLL:
      v13 = CFReadStreamCopyError(self->_stream);
      -[WFGetExternalAddressOperation setError:](self, "setError:");

      break;
    case 2uLL:
      v4 = CFReadStreamRead(self->_stream, v12, 1024);
      if (v4 >= 1)
        -[NSMutableData appendBytes:length:](self->_data, "appendBytes:length:", v12, v4);
      break;
  }
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
  -[WFGetExternalAddressOperation update](self, "update");
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
  -[WFGetExternalAddressOperation update](self, "update");
}

- (void)update
{
  -[WFGetExternalAddressOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
  -[WFGetExternalAddressOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
  -[WFGetExternalAddressOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
  -[WFGetExternalAddressOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
}

- (BOOL)isReady
{
  return 1;
}

- (BOOL)isExecuting
{
  return !-[WFGetExternalAddressOperation isFinished](self, "isFinished");
}

- (BOOL)isFinished
{
  return self->_error || self->_result != 0;
}

- (BOOL)useIPv6
{
  return self->_useIPv6;
}

- (void)setUseIPv6:(BOOL)a3
{
  self->_useIPv6 = a3;
}

- (NSString)result
{
  return self->_result;
}

- (NSError)error
{
  return self->_error;
}

- (NSMutableData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (__CFReadStream)stream
{
  return self->_stream;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_result, 0);
}

void __38__WFGetExternalAddressOperation_start__block_invoke(id *a1)
{
  const char *v2;
  int v3;
  hostent *v4;
  hostent *v5;
  char *v6;
  int h_addrtype;
  int *v8;
  const char *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void **v15;
  uint64_t *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFAllocator *v20;
  const __CFURL *v21;
  __CFHTTPMessage *Request;
  __CFReadStream *v23;
  const __CFString *v24;
  id v25;
  void *v26;
  __CFRunLoop *Main;
  void *v28;
  void *v29;
  CFStreamClientContext clientContext;
  uint64_t v31;
  id v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x24BDAC8D0];
  v2 = (const char *)objc_msgSend(objc_retainAutorelease(a1[4]), "UTF8String");
  if (objc_msgSend(a1[5], "useIPv6"))
    v3 = 30;
  else
    v3 = 2;
  v4 = gethostbyname2(v2, v3);
  if (!v4)
  {
    v8 = (int *)MEMORY[0x24BDAE7D8];
    v9 = hstrerror(*MEMORY[0x24BDAE7D8]);
    if (v9)
    {
      v37 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = v10;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("WFNetDBErrorDomain"), *v8, v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "setError:", v17);

    goto LABEL_26;
  }
  v5 = v4;
  v6 = *v4->h_addr_list;
  if (!v6)
  {
    v12 = (void *)MEMORY[0x24BDD1540];
    v13 = (int)*MEMORY[0x24BDAE7D8];
    v35 = *MEMORY[0x24BDD0FC8];
    WFLocalizedString(CFSTR("The domain could not be found."));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v11;
    v14 = (void *)MEMORY[0x24BDBCE70];
    v15 = &v36;
    v16 = &v35;
LABEL_25:
    objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v15, v16, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("WFNetDBErrorDomain"), v13, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "setError:", v29);

    goto LABEL_26;
  }
  h_addrtype = v4->h_addrtype;
  if (h_addrtype == 2)
  {
    clientContext.info = 0;
    clientContext.version = 528;
    HIDWORD(clientContext.version) = *(_DWORD *)v6;
  }
  else
  {
    if (h_addrtype != 30)
    {
LABEL_24:
      v12 = (void *)MEMORY[0x24BDD1540];
      v13 = (int)*MEMORY[0x24BDAE7D8];
      v33 = *MEMORY[0x24BDD0FC8];
      WFLocalizedString(CFSTR("The domain could not be found. (Error 2)"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v11;
      v14 = (void *)MEMORY[0x24BDBCE70];
      v15 = &v34;
      v16 = &v33;
      goto LABEL_25;
    }
    memset(&clientContext.info, 0, 20);
    clientContext.version = 28;
    *(_OWORD *)&clientContext.info = *(_OWORD *)v6;
    BYTE1(clientContext.version) = 30;
  }
  WFStringFromIPSocketAddress((unsigned __int8 *)&clientContext);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_24;
  if (v5->h_addrtype == 30)
    v18 = CFSTR("[%@]");
  else
    v18 = CFSTR("%@");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v18, v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "setPercentEncodedHost:", v19);

  v20 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  objc_msgSend(a1[6], "URL");
  v21 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  Request = CFHTTPMessageCreateRequest(v20, CFSTR("GET"), v21, (CFStringRef)*MEMORY[0x24BDB7698]);

  CFHTTPMessageSetHeaderFieldValue(Request, CFSTR("Host"), (CFStringRef)a1[4]);
  v23 = CFReadStreamCreateForHTTPRequest(v20, Request);
  CFReadStreamSetProperty(v23, (CFStreamPropertyKey)*MEMORY[0x24BDB7750], (CFTypeRef)*MEMORY[0x24BDBD270]);
  v24 = (const __CFString *)*MEMORY[0x24BDB77B0];
  v25 = a1[4];
  v31 = *MEMORY[0x24BDB7810];
  v32 = v25;
  CFReadStreamSetProperty(v23, v24, (CFTypeRef)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
  objc_msgSend(a1[5], "setStream:", v23);
  v26 = (void *)objc_opt_new();
  objc_msgSend(a1[5], "setData:", v26);

  if (v23)
    CFRelease(v23);
  if (Request)
    CFRelease(Request);
  memset(&clientContext, 0, sizeof(clientContext));
  clientContext.info = a1[5];
  CFReadStreamSetClient(v23, 0x1AuLL, (CFReadStreamClientCallBack)WFStreamClientCallback, &clientContext);
  Main = CFRunLoopGetMain();
  CFReadStreamScheduleWithRunLoop(v23, Main, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
  CFReadStreamOpen(v23);
LABEL_26:

}

@end
