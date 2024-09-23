@implementation CoreDAVPostOrPutTask

- (CoreDAVPostOrPutTask)initWithURL:(id)a3
{
  return -[CoreDAVPostOrPutTask initWithDataPayload:dataContentType:atURL:previousETag:](self, "initWithDataPayload:dataContentType:atURL:previousETag:", 0, 0, a3, 0);
}

- (CoreDAVPostOrPutTask)initWithDataPayload:(id)a3 dataContentType:(id)a4 atURL:(id)a5 previousETag:(id)a6
{
  id v11;
  id v12;
  id v13;
  CoreDAVPostOrPutTask *v14;
  CoreDAVPostOrPutTask *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)CoreDAVPostOrPutTask;
  v14 = -[CoreDAVTask initWithURL:](&v17, sel_initWithURL_, a5);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_requestDataPayload, a3);
    objc_storeStrong((id *)&v15->_requestDataContentType, a4);
    v15->_forceToServer = 0;
    objc_storeStrong((id *)&v15->_previousETag, a6);
  }

  return v15;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v11.receiver = self;
  v11.super_class = (Class)CoreDAVPostOrPutTask;
  -[CoreDAVActionBackedTask description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("[%@ "), v4);

  -[CoreDAVPostOrPutTask previousETag](self, "previousETag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("| Previous ETag: [%@]"), v5);

  v6 = -[CoreDAVPostOrPutTask forceToServer](self, "forceToServer");
  v7 = CFSTR("NO");
  if (v6)
    v7 = CFSTR("YES");
  objc_msgSend(v3, "appendFormat:", CFSTR("| Force to server: [%@]"), v7);
  -[CoreDAVPostOrPutTask requestDataPayload](self, "requestDataPayload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("| Request data payload length in bytes: [%lu]"), objc_msgSend(v8, "length"));

  -[CoreDAVPostOrPutTask requestDataContentType](self, "requestDataContentType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("| Request data content type: [%@]"), v9);

  objc_msgSend(v3, "appendFormat:", CFSTR("]"));
  return v3;
}

- (id)additionalHeaderValues
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  __CFString **v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v16.receiver = self;
  v16.super_class = (Class)CoreDAVPostOrPutTask;
  -[CoreDAVTask additionalHeaderValues](&v16, sel_additionalHeaderValues);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v4);

  -[CoreDAVPostOrPutTask requestDataContentType](self, "requestDataContentType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("Content-Type"));
  if (!-[CoreDAVPostOrPutTask forceToServer](self, "forceToServer"))
  {
    -[CoreDAVPostOrPutTask previousETag](self, "previousETag");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (const __CFString *)v6;
    else
      v8 = CFSTR("*");
    v9 = CoreDAVHTTPHeader_IfNoneMatch;
    if (v6)
      v9 = CoreDAVHTTPHeader_IfMatch;
    objc_msgSend(v3, "setObject:forKey:", v8, *v9);

  }
  if (self->_sendOrder)
  {
    -[NSURL CDVRawLastPathComponent](self->_priorOrderedURL, "CDVRawLastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
    {
      v11 = (void *)MEMORY[0x24BDD17C8];
      CDVRelativeOrderHeaderString();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%@%@"), v12, v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_absoluteOrder);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringValue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
LABEL_15:

        goto LABEL_16;
      }
    }
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("Position"));
    goto LABEL_15;
  }
LABEL_16:

  return v3;
}

- (void)setAbsoluteOrder:(int)a3
{
  self->_sendOrder = 1;
  self->_absoluteOrder = a3;
}

- (void)setPriorOrderedURL:(id)a3
{
  NSURL *v5;
  NSURL *v6;

  v5 = (NSURL *)a3;
  if (self->_priorOrderedURL != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_priorOrderedURL, a3);
    v5 = v6;
    if (self->_priorOrderedURL)
      self->_sendOrder = 1;
  }

}

- (BOOL)forceToServer
{
  return self->_forceToServer;
}

- (void)setForceToServer:(BOOL)a3
{
  self->_forceToServer = a3;
}

- (NSString)previousETag
{
  return self->_previousETag;
}

- (void)setPreviousETag:(id)a3
{
  objc_storeStrong((id *)&self->_previousETag, a3);
}

- (NSString)requestDataContentType
{
  return self->_requestDataContentType;
}

- (void)setRequestDataContentType:(id)a3
{
  objc_storeStrong((id *)&self->_requestDataContentType, a3);
}

- (NSData)requestDataPayload
{
  return self->_requestDataPayload;
}

- (void)setRequestDataPayload:(id)a3
{
  objc_storeStrong((id *)&self->_requestDataPayload, a3);
}

- (int)absoluteOrder
{
  return self->_absoluteOrder;
}

- (NSURL)priorOrderedURL
{
  return self->_priorOrderedURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_priorOrderedURL, 0);
  objc_storeStrong((id *)&self->_requestDataPayload, 0);
  objc_storeStrong((id *)&self->_requestDataContentType, 0);
  objc_storeStrong((id *)&self->_previousETag, 0);
}

@end
