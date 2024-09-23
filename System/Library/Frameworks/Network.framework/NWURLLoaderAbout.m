@implementation NWURLLoaderAbout

- (void)start:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (void)readResponse:(id)a3
{
  objc_class *v4;
  void (**v5)(id, id, _QWORD);
  id v6;
  NSURL *URL;
  id v8;

  v4 = (objc_class *)MEMORY[0x1E0C92C88];
  v5 = (void (**)(id, id, _QWORD))a3;
  v6 = [v4 alloc];
  if (self)
    URL = self->_URL;
  else
    URL = 0;
  v8 = (id)objc_msgSend(v6, "initWithURL:MIMEType:expectedContentLength:textEncodingName:", URL, CFSTR("text/html"), 0, 0);
  v5[2](v5, v8, 0);

}

- (void)readDataOfMinimumIncompleteLength:(unint64_t)a3 maximumLength:(unint64_t)a4 completionHandler:(id)a5
{
  (*((void (**)(id, _QWORD, uint64_t, _QWORD))a5 + 2))(a5, 0, 1, 0);
}

- (NSString)multipartMixedReplaceBoundary
{
  return 0;
}

- (OS_sec_trust)peerTrust
{
  return 0;
}

- (BOOL)requestComplete
{
  return 1;
}

- (void)notifyRequestCompletion:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (id)takeCachedResponse
{
  return 0;
}

- (OS_nw_http_fields)trailerFields
{
  return 0;
}

- (BOOL)allowsWrite
{
  return 0;
}

- (void)writeData:(id)a3 complete:(BOOL)a4 completionHandler:(id)a5
{
  id v6;
  id v7;

  v6 = a3;
  v7 = a5;
  _os_crash();
  __break(1u);
}

- (OS_nw_connection)underlyingConnection
{
  OS_nw_connection *result;

  result = (OS_nw_connection *)_os_crash();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
}

- (id)initWithURL:(id *)a1
{
  id v4;
  id *v5;
  objc_super v7;

  v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)NWURLLoaderAbout;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5)
      objc_storeStrong(v5 + 1, a2);
  }

  return a1;
}

@end
