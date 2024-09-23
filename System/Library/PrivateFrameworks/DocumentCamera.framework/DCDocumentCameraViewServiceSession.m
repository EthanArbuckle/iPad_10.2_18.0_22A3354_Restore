@implementation DCDocumentCameraViewServiceSession

- (DCDocumentCameraViewServiceSession)initWithSessionRequest:(id)a3
{
  id v5;
  DCDocumentCameraViewServiceSession *v6;
  objc_super v8;

  v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DCDocumentCameraViewServiceSession;
  v6 = -[DCDocumentCameraViewServiceSession init](&v8, sel_init);
  if (v6)
  {
    v6->_viewServicePid = getpid();
    objc_storeStrong((id *)&v6->_sessionRequest, a3);
    -[DCDocumentCameraViewServiceSession setup](v6, "setup");
  }

  return v6;
}

- (void)setup
{
  void *v3;
  void *v4;
  ICDocCamImageCache *v5;
  ICDocCamImageCache *docCamImageCache;
  id v7;

  -[DCDocumentCameraViewServiceSession sessionRequest](self, "sessionRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cachesDirectorySandboxExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileURL");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v5 = -[ICDocCamImageCache initWithDataCryptorDelegate:cachesDirectoryURL:]([ICDocCamImageCache alloc], "initWithDataCryptorDelegate:cachesDirectoryURL:", 0, v7);
  docCamImageCache = self->_docCamImageCache;
  self->_docCamImageCache = v5;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DCDocumentCameraViewServiceSession)initWithCoder:(id)a3
{
  id v4;
  DCDocumentCameraViewServiceSession *v5;
  uint64_t v6;
  DCDocumentCameraViewServiceSessionRequest *sessionRequest;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DCDocumentCameraViewServiceSession;
  v5 = -[DCDocumentCameraViewServiceSession init](&v9, sel_init);
  if (v5)
  {
    v5->_viewServicePid = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("kPIDFieldCodingKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kSessionRequestFieldCodingKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    sessionRequest = v5->_sessionRequest;
    v5->_sessionRequest = (DCDocumentCameraViewServiceSessionRequest *)v6;

    -[DCDocumentCameraViewServiceSession setup](v5, "setup");
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", -[DCDocumentCameraViewServiceSession viewServicePid](self, "viewServicePid"), CFSTR("kPIDFieldCodingKey"));
  -[DCDocumentCameraViewServiceSession sessionRequest](self, "sessionRequest");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kSessionRequestFieldCodingKey"));

}

- (DCDocumentCameraViewServiceSessionRequest)sessionRequest
{
  return self->_sessionRequest;
}

- (int)viewServicePid
{
  return self->_viewServicePid;
}

- (ICDocCamImageCache)docCamImageCache
{
  return self->_docCamImageCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_docCamImageCache, 0);
  objc_storeStrong((id *)&self->_sessionRequest, 0);
}

@end
