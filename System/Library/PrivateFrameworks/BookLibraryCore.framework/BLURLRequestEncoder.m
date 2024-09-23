@implementation BLURLRequestEncoder

- (BLURLRequestEncoder)initWithBag:(id)a3 withURLRequest:(id)a4
{
  id v6;
  BLURLRequestEncoder *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BLURLRequestEncoder;
  v7 = -[AMSURLRequestEncoder initWithBag:](&v14, sel_initWithBag_, a3);
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BE0FBE8], "sharedProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activeStoreAccount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSURLRequestEncoder setAccount:](v7, "setAccount:", v9);

    -[AMSURLRequestEncoder setIncludeClientVersions:](v7, "setIncludeClientVersions:", 0);
    -[AMSURLRequestEncoder setUrlKnownToBeTrusted:](v7, "setUrlKnownToBeTrusted:", 1);
    -[AMSURLRequestEncoder setMescalType:](v7, "setMescalType:", 1);
    objc_msgSend(MEMORY[0x24BE08328], "currentProcess");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");

    objc_msgSend(v11, "setBundleIdentifier:", CFSTR("com.apple.iBooks"));
    objc_msgSend(v11, "setExecutableName:", CFSTR("com.apple.iBooks"));
    -[AMSURLRequestEncoder setClientInfo:](v7, "setClientInfo:", v11);
    -[BLURLRequestEncoder setContentType:](v7, "setContentType:", objc_msgSend(v6, "contentType"));
    objc_msgSend(v6, "DSID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLURLRequestEncoder setDsid:](v7, "setDsid:", v12);

    -[BLURLRequestEncoder setReason:](v7, "setReason:", objc_msgSend(v6, "reason"));
    -[AMSURLRequestEncoder setDialogOptions:](v7, "setDialogOptions:", 1);
    if (objc_msgSend(v6, "dataEncoding"))
      -[AMSURLRequestEncoder setRequestEncoding:](v7, "setRequestEncoding:", objc_msgSend(v6, "dataEncoding"));

  }
  return v7;
}

- (id)requestByEncodingRequest:(id)a3 parameters:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  objc_super v25;

  v6 = a4;
  v7 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[BLURLRequestEncoder reason](self, "reason"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forHTTPHeaderField:", v9, CFSTR("Client-Cloud-DAAP-Request-Reason"));

  +[BLURLRequestEncoder DAAPPurchaseVersionString](BLURLRequestEncoder, "DAAPPurchaseVersionString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forHTTPHeaderField:", v10, CFSTR("Client-Cloud-Purchase-Daap-Version"));

  +[BLURLRequestEncoder DAAPClientVersionString](BLURLRequestEncoder, "DAAPClientVersionString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forHTTPHeaderField:", v11, CFSTR("Client-DAAP-Version"));

  -[AMSURLRequestEncoder account](self, "account");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[BLURLRequestEncoder dsid](self, "dsid");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      objc_msgSend(MEMORY[0x24BE0FBE8], "sharedProvider");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "activeStoreAccount");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "ams_DSID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[BLURLRequestEncoder dsid](self, "dsid");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "isEqualToNumber:", v18);

      if ((v19 & 1) == 0)
      {
        -[BLURLRequestEncoder dsid](self, "dsid");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringValue");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setValue:forHTTPHeaderField:", v21, CFSTR("X-FM-Dsid"));

      }
    }
  }
  if (-[BLURLRequestEncoder contentType](self, "contentType") == 1)
    v22 = CFSTR("application/x-www-form-urlencoded");
  else
    v22 = CFSTR("application/x-dmap-tagged");
  objc_msgSend(v7, "setValue:forHTTPHeaderField:", v22, *MEMORY[0x24BE07D70]);
  v25.receiver = self;
  v25.super_class = (Class)BLURLRequestEncoder;
  -[AMSURLRequestEncoder requestByEncodingRequest:parameters:](&v25, sel_requestByEncodingRequest_parameters_, v7, v6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

+ (id)DAAPPurchaseVersionString
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_212CAC10C;
  block[3] = &unk_24CE8A448;
  block[4] = a1;
  if (qword_253DB1F98 != -1)
    dispatch_once(&qword_253DB1F98, block);
  return (id)qword_253DB1F90;
}

+ (id)DAAPClientVersionString
{
  if (qword_253DB1F88 != -1)
    dispatch_once(&qword_253DB1F88, &unk_24CE8BA18);
  return (id)qword_253DB1F80;
}

- (NSNumber)dsid
{
  return self->_dsid;
}

- (void)setDsid:(id)a3
{
  objc_storeStrong((id *)&self->_dsid, a3);
}

- (int64_t)reason
{
  return self->_reason;
}

- (void)setReason:(int64_t)a3
{
  self->_reason = a3;
}

- (unint64_t)contentType
{
  return self->_contentType;
}

- (void)setContentType:(unint64_t)a3
{
  self->_contentType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dsid, 0);
}

@end
