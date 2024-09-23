@implementation FAAcceptChildTransferRequest

- (BOOL)isUserInitiated
{
  return 1;
}

- (id)urlString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE04A78], "urlConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "acceptChildTransferURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)urlRequest
{
  void *v3;
  void *v4;
  NSString *requestCode;
  void *v6;
  objc_super v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v8.receiver = self;
  v8.super_class = (Class)FAAcceptChildTransferRequest;
  -[AAFamilyRequest urlRequest](&v8, sel_urlRequest);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  requestCode = self->_requestCode;
  if (requestCode)
  {
    v9 = CFSTR("request-code");
    v10[0] = requestCode;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "aa_setBodyWithParameters:", v6);

  }
  objc_msgSend(v4, "setValue:forHTTPHeaderField:", CFSTR("application/xml"), CFSTR("Content-Type"));
  return v4;
}

- (NSString)requestCode
{
  return self->_requestCode;
}

- (void)setRequestCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestCode, 0);
}

@end
