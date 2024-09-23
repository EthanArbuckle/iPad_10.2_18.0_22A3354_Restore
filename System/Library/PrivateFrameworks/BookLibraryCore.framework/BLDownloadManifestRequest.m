@implementation BLDownloadManifestRequest

- (BLDownloadManifestRequest)initWithURLRequest:(id)a3
{
  id v4;
  BLDownloadManifestRequest *v5;
  uint64_t v6;
  NSURLRequest *urlRequest;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BLDownloadManifestRequest;
  v5 = -[BLDownloadManifestRequest init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    urlRequest = v5->_urlRequest;
    v5->_urlRequest = (NSURLRequest *)v6;

  }
  return v5;
}

- (void)startWithManifestResponseBlock:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  BLDownloadManifestRequest *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  BLServiceLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[BLDownloadManifestRequest URLRequest](self, "URLRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v12 = self;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_212C78000, v5, OS_LOG_TYPE_DEFAULT, "[DownloadManifestRequest] Start download manifest request %p: urlRequest=%@", buf, 0x16u);

  }
  +[BLDownloadQueueNonUI sharedInstance](BLDownloadQueueNonUI, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_212CA5C7C;
  v9[3] = &unk_24CE8B948;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "addDownloadsWithManifestRequest:completion:", self, v9);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BLDownloadManifestRequest)initWithCoder:(id)a3
{
  id v4;
  BLDownloadManifestRequest *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BLDownloadManifestRequest;
  v5 = -[BLDownloadManifestRequest init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("URLRequest"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLDownloadManifestRequest setURLRequest:](v5, "setURLRequest:", v6);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BLDownloadManifestRequest URLRequest](self, "URLRequest");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("URLRequest"));

}

- (NSURLRequest)URLRequest
{
  return self->_urlRequest;
}

- (void)setURLRequest:(id)a3
{
  objc_storeStrong((id *)&self->_urlRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlRequest, 0);
}

@end
