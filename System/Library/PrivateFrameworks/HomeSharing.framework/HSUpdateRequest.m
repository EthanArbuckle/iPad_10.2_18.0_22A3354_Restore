@implementation HSUpdateRequest

- (HSUpdateRequest)initWithDatabaseRevision:(unsigned int)a3 sessionID:(unsigned int)a4 connectionType:(int64_t)a5
{
  uint64_t v6;
  HSUpdateRequest *v7;
  HSUpdateRequest *v8;
  void *v9;

  v6 = *(_QWORD *)&a3;
  v7 = -[HSRequest initWithAction:](self, "initWithAction:", CFSTR("update"), *(_QWORD *)&a4);
  v8 = v7;
  if (v7)
  {
    v7->_connectionType = a5;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%u"), v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HSRequest setValue:forArgument:](v8, "setValue:forArgument:", v9, CFSTR("revision-number"));

  }
  return v8;
}

- (id)canonicalResponseForResponse:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  +[HSResponse responseWithResponse:](HSUpdateResponse, "responseWithResponse:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "responseData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HSResponseDataParser parseResponseData:](HSResponseDataParser, "parseResponseData:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setDatabaseRevision:", objc_msgSend(v5, "unsignedIntValue"));
  return v3;
}

- (BOOL)isConcurrent
{
  objc_super v3;

  if (!self->_connectionType)
    return 1;
  v3.receiver = self;
  v3.super_class = (Class)HSUpdateRequest;
  return -[HSRequest isConcurrent](&v3, sel_isConcurrent);
}

- (double)timeoutInterval
{
  double result;
  void *v3;
  double v4;
  double v5;
  objc_super v6;

  if (self->_connectionType)
  {
    v6.receiver = self;
    v6.super_class = (Class)HSUpdateRequest;
    -[HSRequest timeoutInterval](&v6, sel_timeoutInterval);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeIntervalSinceNow");
    v5 = v4;

    return v5;
  }
  return result;
}

- (id)_bodyDataForDatabaseRevision:(unsigned int)a3 sessionID:(unsigned int)a4
{
  void *v6;
  unsigned int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  unsigned int v13;

  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0x4000000;
  v12 = 1684630637;
  v13 = bswap32(a4);
  objc_msgSend(v6, "appendBytes:length:", &v12, 4);
  objc_msgSend(v6, "appendBytes:length:", &v11, 4);
  objc_msgSend(v6, "appendBytes:length:", &v13, 4);
  v9 = 0x4000000;
  v10 = 1920169325;
  v8 = bswap32(a3);
  objc_msgSend(v6, "appendBytes:length:", &v10, 4);
  objc_msgSend(v6, "appendBytes:length:", &v9, 4);
  objc_msgSend(v6, "appendBytes:length:", &v8, 4);
  return v6;
}

+ (id)requestWithDatabaseRevision:(unsigned int)a3 sessionID:(unsigned int)a4 connectionType:(int64_t)a5
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithDatabaseRevision:sessionID:connectionType:", *(_QWORD *)&a3, *(_QWORD *)&a4, a5);
}

@end
