@implementation DTAssetHTTPRequestHandler

- (DTAssetHTTPRequestHandler)initWithSocket:(id)a3 channel:(id)a4
{
  id v6;
  id v7;
  DTAssetHTTPRequestHandler *v8;
  void *v9;
  uint64_t v10;
  NSString *identifier;
  void *v12;
  void *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)DTAssetHTTPRequestHandler;
  v8 = -[DTAssetHTTPRequestHandler init](&v15, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = objc_claimAutoreleasedReturnValue();
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v10;

    -[DTAssetHTTPRequestHandler setSocket:](v8, "setSocket:", v6);
    -[DTAssetHTTPRequestHandler socket](v8, "socket");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDelegate:", v8);

    -[DTAssetHTTPRequestHandler setChannel:](v8, "setChannel:", v7);
    -[DTAssetHTTPRequestHandler setDataSent:](v8, "setDataSent:", 0);
    +[DTAssetResponseBroker sharedBroker](DTAssetResponseBroker, "sharedBroker");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "registerHandler:", v8);

  }
  return v8;
}

- (void)dealloc
{
  __CFHTTPMessage *httpMessage;
  objc_super v4;

  httpMessage = self->_httpMessage;
  if (httpMessage)
  {
    CFRelease(httpMessage);
    self->_httpMessage = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)DTAssetHTTPRequestHandler;
  -[DTAssetHTTPRequestHandler dealloc](&v4, sel_dealloc);
}

- (void)startReading
{
  __CFHTTPMessage *httpMessage;
  id v4;

  httpMessage = self->_httpMessage;
  if (httpMessage)
    CFRelease(httpMessage);
  self->_httpMessage = CFHTTPMessageCreateEmpty(0, 1u);
  -[DTAssetHTTPRequestHandler socket](self, "socket");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "readDataWithTimeout:tag:", 0, 600.0);

}

- (void)requestAssetAtPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[DTAssetHTTPRequestHandler identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[DTAssetRequest requestWithIdentifier:path:](DTAssetRequest, "requestWithIdentifier:path:", v5, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[DTAssetHTTPRequestHandler channel](self, "channel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "message");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendMessage:replyHandler:", v7, 0);

}

- (void)receivedMessage:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  objc_msgSend(v14, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectWithAllowedClasses:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[DTAssetHTTPRequestHandler socket](self, "socket");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
        goto LABEL_12;
      objc_msgSend(v14, "objectWithAllowedClasses:", v5);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "data");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        -[DTAssetHTTPRequestHandler sendDataChunk:](self, "sendDataChunk:", v8);
LABEL_11:

        goto LABEL_12;
      }
      if (objc_msgSend(v8, "isCompleted"))
      {
        -[DTAssetHTTPRequestHandler identifier](self, "identifier");
        v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        syslog(5, "ODR: Request %s sent %llu bytes", (const char *)objc_msgSend(v10, "UTF8String"), -[DTAssetHTTPRequestHandler dataSent](self, "dataSent"));

        -[DTAssetHTTPRequestHandler socket](self, "socket");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(CFSTR("0\r\n\r\n"), "dataUsingEncoding:", 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "writeData:withTimeout:tag:", v12, 2, 600.0);

        -[DTAssetHTTPRequestHandler socket](self, "socket");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "disconnectAfterWriting");

        goto LABEL_11;
      }

    }
    objc_msgSend(v14, "description");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    syslog(3, "ODR: Got a message we're not sure how to handle: %s", (const char *)objc_msgSend(v8, "UTF8String"));
    goto LABEL_11;
  }
  objc_msgSend(v14, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DTAssetHTTPRequestHandler serveErrorMessageForError:](self, "serveErrorMessageForError:", v5);
LABEL_12:

}

- (void)sendDataChunk:(id)a3
{
  id v4;
  __CFHTTPMessage *Response;
  CFDataRef v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v4 = a3;
  if (!-[DTAssetHTTPRequestHandler sentHeader](self, "sentHeader"))
  {
    Response = CFHTTPMessageCreateResponse(0, 200, 0, (CFStringRef)*MEMORY[0x24BDB7698]);
    CFHTTPMessageSetHeaderFieldValue(Response, CFSTR("Transfer-Encoding"), CFSTR("chunked"));
    v6 = CFHTTPMessageCopySerializedMessage(Response);
    -[DTAssetHTTPRequestHandler socket](self, "socket");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "writeData:withTimeout:tag:", v6, 0, 600.0);

    CFRelease(Response);
    -[DTAssetHTTPRequestHandler setSentHeader:](self, "setSentHeader:", 1);

  }
  v8 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v4, "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%lx\r\n"), objc_msgSend(v9, "length"));
  v17 = (id)objc_claimAutoreleasedReturnValue();

  -[DTAssetHTTPRequestHandler socket](self, "socket");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "dataUsingEncoding:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "writeData:withTimeout:tag:", v11, 2, 600.0);

  -[DTAssetHTTPRequestHandler socket](self, "socket");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "data");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "writeData:withTimeout:tag:", v13, 1, 600.0);

  objc_msgSend(v4, "data");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[DTAssetHTTPRequestHandler setDataSent:](self, "setDataSent:", -[DTAssetHTTPRequestHandler dataSent](self, "dataSent") + objc_msgSend(v14, "length"));
  -[DTAssetHTTPRequestHandler socket](self, "socket");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("\r\n"), "dataUsingEncoding:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "writeData:withTimeout:tag:", v16, 2, 600.0);

}

- (void)serveErrorMessageForError:(id)a3
{
  id v4;
  CFIndex v5;
  __CFHTTPMessage *Response;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "code");
  Response = CFHTTPMessageCreateResponse(0, v5, 0, (CFStringRef)*MEMORY[0x24BDB7690]);
  v7 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v4, "localizedDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringWithFormat:", CFSTR("Error retrieving requested asset: %@"), v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  CFHTTPMessageSetBody(Response, (CFDataRef)objc_msgSend(v9, "dataUsingEncoding:", 4));
  -[DTAssetHTTPRequestHandler serveResponseAndDisconnect:](self, "serveResponseAndDisconnect:", Response);
  CFRelease(Response);

}

- (void)serveResponseAndDisconnect:(__CFHTTPMessage *)a3
{
  void *v4;
  void *v5;
  CFDataRef v6;

  v6 = CFHTTPMessageCopySerializedMessage(a3);
  -[DTAssetHTTPRequestHandler socket](self, "socket");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "writeData:withTimeout:tag:", v6, 0, 600.0);

  -[DTAssetHTTPRequestHandler socket](self, "socket");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "disconnectAfterWriting");

}

- (void)socket:(id)a3 didReadData:(id)a4 withTag:(int64_t)a5
{
  id v7;
  __CFHTTPMessage *httpMessage;
  id v9;
  const UInt8 *v10;
  CFIndex v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  const char *v18;
  id v19;
  void *v20;
  CFHTTPMessageRef Response;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  httpMessage = self->_httpMessage;
  v9 = objc_retainAutorelease(a4);
  v10 = (const UInt8 *)objc_msgSend(v9, "bytes");
  v11 = objc_msgSend(v9, "length");

  CFHTTPMessageAppendBytes(httpMessage, v10, v11);
  if (CFHTTPMessageIsHeaderComplete(self->_httpMessage))
  {
    v12 = (__CFString *)CFHTTPMessageCopyRequestMethod(self->_httpMessage);
    if (objc_msgSend(CFSTR("GET"), "isEqualToString:", v12))
    {
      v13 = CFHTTPMessageCopyRequestURL(self->_httpMessage);
      -[DTAssetHTTPRequestHandler allowedResources](self, "allowedResources");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "absoluteString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "containsObject:", v15);

      if (v16)
      {
        -[DTAssetHTTPRequestHandler identifier](self, "identifier");
        v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v18 = (const char *)objc_msgSend(v17, "UTF8String");
        objc_msgSend(v13, "absoluteString");
        v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        syslog(5, "ODR: Received GET request %s for asset pack %s. Requesting from Xcode.", v18, (const char *)objc_msgSend(v19, "UTF8String"));

        objc_msgSend(v13, "path");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[DTAssetHTTPRequestHandler requestAssetAtPath:](self, "requestAssetAtPath:", v20);
LABEL_11:

        goto LABEL_12;
      }
      v22 = (void *)MEMORY[0x24BDD1540];
      v29 = *MEMORY[0x24BDD0FC8];
      v30[0] = CFSTR("Not found.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v22;
      v25 = 404;
    }
    else
    {
      if (objc_msgSend(CFSTR("HEAD"), "isEqualToString:", v12))
      {
        syslog(5, "ODR: Received HEAD request for asset pack. Sending default 200 response.");
        Response = CFHTTPMessageCreateResponse(0, 200, 0, (CFStringRef)*MEMORY[0x24BDB7690]);
        -[DTAssetHTTPRequestHandler serveResponseAndDisconnect:](self, "serveResponseAndDisconnect:", Response);
        CFRelease(Response);
LABEL_12:

        goto LABEL_13;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("This server does not handle %@ requests."), v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)MEMORY[0x24BDD1540];
      v27 = *MEMORY[0x24BDD0FC8];
      v28 = v13;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v26;
      v25 = 500;
    }
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("DTAssetHTTPRequestHandler"), v25, v23);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[DTAssetHTTPRequestHandler serveErrorMessageForError:](self, "serveErrorMessageForError:", v20);
    goto LABEL_11;
  }
  objc_msgSend(v7, "readDataWithTimeout:tag:", 0, 600.0);
LABEL_13:

}

- (void)socketDidDisconnect:(id)a3 withError:(id)a4
{
  id v5;
  const char *v6;
  id v7;
  void *v8;
  id v9;

  v9 = a4;
  -[DTAssetHTTPRequestHandler setSocket:](self, "setSocket:", 0);
  -[DTAssetHTTPRequestHandler identifier](self, "identifier");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = (const char *)objc_msgSend(v5, "UTF8String");
  if (v9)
  {
    objc_msgSend(v9, "description");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    syslog(4, "ODR: Socket %s disconnected with error: %s", v6, (const char *)objc_msgSend(v7, "UTF8String"));

  }
  else
  {
    syslog(6, "ODR: Socket %s disconnected without error.", v6);
  }

  +[DTAssetResponseBroker sharedBroker](DTAssetResponseBroker, "sharedBroker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unregisterHandler:", self);

}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSSet)allowedResources
{
  return self->_allowedResources;
}

- (void)setAllowedResources:(id)a3
{
  objc_storeStrong((id *)&self->_allowedResources, a3);
}

- (DTXChannel)channel
{
  return (DTXChannel *)objc_getProperty(self, a2, 40, 1);
}

- (void)setChannel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (_DT_GCDAsyncSocket)socket
{
  return (_DT_GCDAsyncSocket *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSocket:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (id)completion
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (BOOL)sentHeader
{
  return self->_sentHeader;
}

- (void)setSentHeader:(BOOL)a3
{
  self->_sentHeader = a3;
}

- (unint64_t)dataSent
{
  return self->_dataSent;
}

- (void)setDataSent:(unint64_t)a3
{
  self->_dataSent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_socket, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_allowedResources, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
