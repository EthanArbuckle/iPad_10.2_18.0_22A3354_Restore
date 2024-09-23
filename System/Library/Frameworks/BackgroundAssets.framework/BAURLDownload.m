@implementation BAURLDownload

- (void)syncTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("Non BAURLDownload passed to syncTo for BAURLDownload"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "raise");

  }
  objc_msgSend(v4, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BAURLDownload setRequest:](self, "setRequest:", v6);

  v7.receiver = self;
  v7.super_class = (Class)BAURLDownload;
  -[BADownload syncTo:](&v7, sel_syncTo_, v4);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BAURLDownload)init
{
  BAURLDownload *result;
  int v3;
  const char *v4;

  result = (BAURLDownload *)os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
  if ((_DWORD)result)
  {
    v3 = 136315138;
    v4 = "BAURLDownload cannot be constructed using -init.";
    _os_log_fault_impl(&dword_21ABD8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "BUG IN CLIENT OF BackgroundAssets: %s", (uint8_t *)&v3, 0xCu);
  }
  qword_255111848 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: BAURLDownload cannot be constructed using -init.";
  __break(1u);
  return result;
}

- (BAURLDownload)initWithIdentifier:(NSString *)identifier request:(NSURLRequest *)request fileSize:(NSUInteger)fileSize applicationGroupIdentifier:(NSString *)applicationGroupIdentifier
{
  return -[BAURLDownload initWithIdentifier:request:essential:fileSize:applicationGroupIdentifier:priority:](self, "initWithIdentifier:request:essential:fileSize:applicationGroupIdentifier:priority:", identifier, request, 0, fileSize, applicationGroupIdentifier, 0);
}

- (BAURLDownload)initWithIdentifier:(NSString *)identifier request:(NSURLRequest *)request essential:(BOOL)essential fileSize:(NSUInteger)fileSize applicationGroupIdentifier:(NSString *)applicationGroupIdentifier priority:(BADownloaderPriority)priority
{
  _BOOL4 v11;
  NSString *v14;
  NSURLRequest *v15;
  NSString *v16;
  void *v17;
  char isKindOfClass;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  const __CFString *v24;
  void *v25;
  BAURLDownload *v26;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  objc_super v32;

  v11 = essential;
  v14 = identifier;
  v15 = request;
  v16 = applicationGroupIdentifier;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v22 = (void *)MEMORY[0x24BDBCE88];
    v23 = *MEMORY[0x24BDBCAB8];
    v24 = CFSTR("request must be a URLRequest.");
    goto LABEL_7;
  }
  -[NSURLRequest URL](v15, "URL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v22 = (void *)MEMORY[0x24BDBCE88];
    v23 = *MEMORY[0x24BDBCAB8];
    v24 = CFSTR("request must have a valid URL.");
    goto LABEL_7;
  }
  -[NSURLRequest URL](v15, "URL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "scheme");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "caseInsensitiveCompare:", CFSTR("https"));

  if (v21)
  {
    v22 = (void *)MEMORY[0x24BDBCE88];
    v23 = *MEMORY[0x24BDBCAB8];
    v24 = CFSTR("request can only download over HTTPS.");
LABEL_7:
    objc_msgSend(v22, "exceptionWithName:reason:userInfo:", v23, v24, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "raise");

    v26 = 0;
    goto LABEL_8;
  }
  if ((objc_msgSend((id)objc_opt_class(), "supportsSecureCoding") & 1) == 0)
  {
    v22 = (void *)MEMORY[0x24BDBCE88];
    v23 = *MEMORY[0x24BDBCAB8];
    v24 = CFSTR("request must be secure coding compliant.");
    goto LABEL_7;
  }
  if (!v14)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("identifier can not be nil"), 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "raise");

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("identifier must be a string."), 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "raise");

  }
  v32.receiver = self;
  v32.super_class = (Class)BAURLDownload;
  v30 = -[BADownload initPrivatelyWithApplicationGroupIdentifier:](&v32, sel_initPrivatelyWithApplicationGroupIdentifier_, v16);
  v31 = v30;
  if (v30)
  {
    objc_msgSend(v30, "setRequest:", v15);
    objc_msgSend(v31, "setIdentifier:", v14);
    objc_msgSend(v31, "setNecessity:", v11);
    objc_msgSend(v31, "setPriority:", priority);
    -[BADownload setClientSpecifiedFileSize:](v31, fileSize);
  }
  self = v31;
  v26 = self;
LABEL_8:

  return v26;
}

- (BAURLDownload)initWithCoder:(id)a3
{
  id v4;
  BAURLDownload *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BAURLDownload;
  v5 = -[BADownload initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("request"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BAURLDownload setRequest:](v5, "setRequest:", v6);

  }
  return v5;
}

- (BAURLDownload)initWithIdentifier:(NSString *)identifier request:(NSURLRequest *)request applicationGroupIdentifier:(NSString *)applicationGroupIdentifier
{
  return -[BAURLDownload initWithIdentifier:request:essential:fileSize:applicationGroupIdentifier:priority:](self, "initWithIdentifier:request:essential:fileSize:applicationGroupIdentifier:priority:", identifier, request, 0, 0, applicationGroupIdentifier, 0);
}

- (BAURLDownload)initWithIdentifier:(NSString *)identifier request:(NSURLRequest *)request applicationGroupIdentifier:(NSString *)applicationGroupIdentifier priority:(BADownloaderPriority)priority
{
  return -[BAURLDownload initWithIdentifier:request:essential:fileSize:applicationGroupIdentifier:priority:](self, "initWithIdentifier:request:essential:fileSize:applicationGroupIdentifier:priority:", identifier, request, 0, 0, applicationGroupIdentifier, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BAURLDownload;
  v4 = -[BADownload copyWithZone:](&v7, sel_copyWithZone_, a3);
  -[BAURLDownload request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRequest:", v5);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[BAURLDownload request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("request"));

  v6.receiver = self;
  v6.super_class = (Class)BAURLDownload;
  -[BADownload encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);

}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BAURLDownload;
  -[BADownload debugDescription](&v8, sel_debugDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[BAURLDownload request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("URL: %@\n"), v6);

  return v4;
}

- (NSURLRequest)request
{
  return (NSURLRequest *)objc_getProperty(self, a2, 72, 1);
}

- (void)setRequest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
}

@end
