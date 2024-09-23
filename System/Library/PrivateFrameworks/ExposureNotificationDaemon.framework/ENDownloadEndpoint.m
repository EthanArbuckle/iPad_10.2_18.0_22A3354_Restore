@implementation ENDownloadEndpoint

- (ENDownloadEndpoint)initWithBaseURL:(id)a3 indexURL:(id)a4 interval:(double)a5 enabled:(BOOL)a6 region:(id)a7
{
  id v12;
  id v13;
  id v14;
  ENDownloadEndpoint *v15;
  uint64_t v16;
  NSURL *serverBaseURL;
  uint64_t v18;
  NSURL *serverIndexURL;
  uint64_t v20;
  ENRegion *region;
  objc_super v23;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  v23.receiver = self;
  v23.super_class = (Class)ENDownloadEndpoint;
  v15 = -[ENDownloadEndpoint init](&v23, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v12, "copy");
    serverBaseURL = v15->_serverBaseURL;
    v15->_serverBaseURL = (NSURL *)v16;

    v18 = objc_msgSend(v13, "copy");
    serverIndexURL = v15->_serverIndexURL;
    v15->_serverIndexURL = (NSURL *)v18;

    v15->_downloadInterval = a5;
    v15->_enabled = a6;
    v20 = objc_msgSend(v14, "copy");
    region = v15->_region;
    v15->_region = (ENRegion *)v20;

  }
  return v15;
}

- (id)serverURLForFileWithRelativePath:(id)a3
{
  return -[NSURL URLByAppendingPathComponent:](self->_serverBaseURL, "URLByAppendingPathComponent:", a3);
}

- (double)downloadInterval
{
  return self->_downloadInterval;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (ENRegion)region
{
  return self->_region;
}

- (NSURL)serverBaseURL
{
  return self->_serverBaseURL;
}

- (NSURL)serverIndexURL
{
  return self->_serverIndexURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverIndexURL, 0);
  objc_storeStrong((id *)&self->_serverBaseURL, 0);
  objc_storeStrong((id *)&self->_region, 0);
}

@end
