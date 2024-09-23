@implementation CATHTTPMessageParser

- (void)dealloc
{
  __CFHTTPMessage *mCurrentMessage;
  objc_super v4;

  mCurrentMessage = self->mCurrentMessage;
  if (mCurrentMessage)
  {
    CFRelease(mCurrentMessage);
    self->mCurrentMessage = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CATHTTPMessageParser;
  -[CATHTTPMessageParser dealloc](&v4, sel_dealloc);
}

- (BOOL)appendBytes:(const char *)a3 length:(unint64_t)a4
{
  __CFHTTPMessage *mCurrentMessage;
  int v8;
  NSDictionary *mCurrentHeaderFields;
  NSDictionary *v10;
  NSDictionary *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  CFDataRef v16;
  id v17;
  int v18;
  void *v19;
  void *v20;
  NSDictionary *v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  NSDictionary *v26;
  CFURLRef v27;

  if (!a4)
    goto LABEL_16;
  mCurrentMessage = self->mCurrentMessage;
  if (!mCurrentMessage)
  {
    mCurrentMessage = CFHTTPMessageCreateEmpty((CFAllocatorRef)*MEMORY[0x24BDBD240], *a3 != 72);
    self->mCurrentMessage = mCurrentMessage;
  }
  if (CFHTTPMessageIsHeaderComplete(mCurrentMessage) && !CFHTTPMessageIsRequest(self->mCurrentMessage))
  {
    v8 = 0;
  }
  else
  {
    if (!CFHTTPMessageAppendBytes(self->mCurrentMessage, (const UInt8 *)a3, a4))
      goto LABEL_38;
    v8 = 1;
  }
  mCurrentHeaderFields = self->mCurrentHeaderFields;
  if (mCurrentHeaderFields)
    goto LABEL_13;
  if (CFHTTPMessageIsHeaderComplete(self->mCurrentMessage))
  {
    v10 = (NSDictionary *)CFHTTPMessageCopyAllHeaderFields(self->mCurrentMessage);
    v11 = self->mCurrentHeaderFields;
    self->mCurrentHeaderFields = v10;

    -[NSDictionary objectForKeyedSubscript:](self->mCurrentHeaderFields, "objectForKeyedSubscript:", CFSTR("Content-Length"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "length");

    if (!v13)
    {
      if (CFHTTPMessageIsRequest(self->mCurrentMessage))
      {
        v17 = (id)CFHTTPMessageCopyRequestMethod(self->mCurrentMessage);
        v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("GET"));
        if (v18)
        {
          v27 = CFHTTPMessageCopyRequestURL(self->mCurrentMessage);
          -[CATHTTPMessageParser delegateDidReceiveRequestWithURL:](self, "delegateDidReceiveRequestWithURL:", v27);

        }
        goto LABEL_34;
      }
LABEL_38:
      LOBYTE(v18) = 0;
      return v18;
    }
  }
  mCurrentHeaderFields = self->mCurrentHeaderFields;
  if (mCurrentHeaderFields)
  {
LABEL_13:
    -[NSDictionary objectForKeyedSubscript:](mCurrentHeaderFields, "objectForKeyedSubscript:", CFSTR("Content-Length"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "integerValue");

    if (CFHTTPMessageIsRequest(self->mCurrentMessage))
    {
      v16 = CFHTTPMessageCopyBody(self->mCurrentMessage);
      if (-[__CFData length](v16, "length") < v15)
      {
        v17 = 0;
        goto LABEL_31;
      }
      -[__CFData subdataWithRange:](v16, "subdataWithRange:", 0, v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFData subdataWithRange:](v16, "subdataWithRange:", v15, -[__CFData length](v16, "length") - v15);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      CFRelease(self->mCurrentMessage);
      self->mCurrentMessage = 0;
      -[CATHTTPMessageParser delegateDidReceiveRequestData:](self, "delegateDidReceiveRequestData:", v19);
      v21 = self->mCurrentHeaderFields;
      self->mCurrentHeaderFields = 0;

      if (objc_msgSend(v20, "length"))
      {
        v17 = objc_retainAutorelease(v20);
        LOBYTE(v18) = -[CATHTTPMessageParser appendBytes:length:](self, "appendBytes:length:", objc_msgSend(v17, "bytes"), objc_msgSend(v17, "length"));

LABEL_34:
        return v18;
      }
      v17 = v16;
    }
    else
    {
      if (v8)
      {
        v17 = CFHTTPMessageCopyBody(self->mCurrentMessage);
        if (!objc_msgSend(v17, "length"))
          goto LABEL_33;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a3, a4);
        v17 = (id)objc_claimAutoreleasedReturnValue();
      }
      v22 = v15 - self->mCurrentBytesReceived;
      v23 = objc_msgSend(v17, "length");
      if (v22 >= v23)
        v24 = v23;
      else
        v24 = v22;
      objc_msgSend(v17, "subdataWithRange:", 0, v24);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "subdataWithRange:", objc_msgSend(v19, "length"), objc_msgSend(v17, "length") - objc_msgSend(v19, "length"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = self->mCurrentBytesReceived + objc_msgSend(v19, "length");
      self->mCurrentBytesReceived = v25;
      if (v25 >= v15)
      {
        CFRelease(self->mCurrentMessage);
        self->mCurrentMessage = 0;
        -[CATHTTPMessageParser delegateDidReceiveResponseData:moreComing:](self, "delegateDidReceiveResponseData:moreComing:", v19, 0);
        v26 = self->mCurrentHeaderFields;
        self->mCurrentHeaderFields = 0;

        self->mCurrentBytesReceived = 0;
      }
      else
      {
        -[CATHTTPMessageParser delegateDidReceiveResponseData:moreComing:](self, "delegateDidReceiveResponseData:moreComing:", v19, 1);
      }
    }

    v16 = (CFDataRef)v17;
    v17 = v20;
LABEL_31:

    if (objc_msgSend(v17, "length"))
    {
      v17 = objc_retainAutorelease(v17);
      LOBYTE(v18) = -[CATHTTPMessageParser appendBytes:length:](self, "appendBytes:length:", objc_msgSend(v17, "bytes"), objc_msgSend(v17, "length"));
      goto LABEL_34;
    }
LABEL_33:
    LOBYTE(v18) = 1;
    goto LABEL_34;
  }
LABEL_16:
  LOBYTE(v18) = 1;
  return v18;
}

+ (id)encodeRequestData:(id)a3
{
  uint64_t v3;
  id v4;
  __CFHTTPMessage *Request;
  __CFString *v6;
  CFDataRef v7;

  v3 = encodeRequestData__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&encodeRequestData__onceToken, &__block_literal_global_2);
  Request = CFHTTPMessageCreateRequest((CFAllocatorRef)*MEMORY[0x24BDBD240], CFSTR("POST"), (CFURLRef)encodeRequestData__postURL, CFSTR("1.1"));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v4, "length"));
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFHTTPMessageSetHeaderFieldValue(Request, CFSTR("Content-Length"), v6);
  CFHTTPMessageSetBody(Request, (CFDataRef)v4);

  v7 = CFHTTPMessageCopySerializedMessage(Request);
  CFRelease(Request);

  return v7;
}

void __42__CATHTTPMessageParser_encodeRequestData___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("http://localhost/"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)encodeRequestData__postURL;
  encodeRequestData__postURL = v0;

}

+ (id)responseHeaderForContentWithLength:(unint64_t)a3
{
  __CFHTTPMessage *Response;
  __CFString *v5;
  CFDataRef v6;

  Response = CFHTTPMessageCreateResponse((CFAllocatorRef)*MEMORY[0x24BDBD240], 200, 0, (CFStringRef)*MEMORY[0x24BDB7698]);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), a3);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFHTTPMessageSetHeaderFieldValue(Response, CFSTR("Content-Length"), v5);
  v6 = CFHTTPMessageCopySerializedMessage(Response);
  CFRelease(Response);

  return v6;
}

- (void)delegateDidReceiveRequestData:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CATHTTPMessageParser delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CATHTTPMessageParser delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "messageParser:didParseRequestData:", self, v7);

  }
}

- (void)delegateDidReceiveResponseData:(id)a3 moreComing:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v4 = a4;
  v9 = a3;
  -[CATHTTPMessageParser delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[CATHTTPMessageParser delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "messageParser:didParseResponseData:moreComing:", self, v9, v4);

  }
}

- (void)delegateDidReceiveRequestWithURL:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CATHTTPMessageParser delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CATHTTPMessageParser delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "messageParser:didParseRequestWithURL:", self, v7);

  }
}

- (CATHTTPMessageParserDelegate)delegate
{
  return (CATHTTPMessageParserDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->mCurrentHeaderFields, 0);
}

@end
