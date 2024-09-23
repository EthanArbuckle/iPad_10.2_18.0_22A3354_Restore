@implementation SSUMatcherBuildParams

- (SSUMatcherBuildParams)initWithModelAssetsDirectoryURL:(id)a3 datasetAssetsDirectoryURL:(id)a4 cacheDirectoryURL:(id)a5
{
  NSURL *v8;
  NSURL *v9;
  NSURL *v10;
  SSUMatcherBuildParams *v11;
  NSURL *modelAssetsDirectoryURL;
  NSURL *v13;
  NSURL *datasetAssetsDirectoryURL;
  NSURL *v15;
  NSURL *cacheDirectoryURL;
  objc_super v18;

  v8 = (NSURL *)a3;
  v9 = (NSURL *)a4;
  v10 = (NSURL *)a5;
  v18.receiver = self;
  v18.super_class = (Class)SSUMatcherBuildParams;
  v11 = -[SSUMatcherBuildParams init](&v18, sel_init);
  modelAssetsDirectoryURL = v11->_modelAssetsDirectoryURL;
  v11->_modelAssetsDirectoryURL = v8;
  v13 = v8;

  datasetAssetsDirectoryURL = v11->_datasetAssetsDirectoryURL;
  v11->_datasetAssetsDirectoryURL = v9;
  v15 = v9;

  cacheDirectoryURL = v11->_cacheDirectoryURL;
  v11->_cacheDirectoryURL = v10;

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSURL *modelAssetsDirectoryURL;
  void *v6;
  NSURL *datasetAssetsDirectoryURL;
  void *v8;
  NSURL *cacheDirectoryURL;
  void *v10;
  char v11;

  v4 = a3;
  modelAssetsDirectoryURL = self->_modelAssetsDirectoryURL;
  objc_msgSend(v4, "modelAssetsDirectoryURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSURL isEqual:](modelAssetsDirectoryURL, "isEqual:", v6))
  {
    datasetAssetsDirectoryURL = self->_datasetAssetsDirectoryURL;
    objc_msgSend(v4, "datasetAssetsDirectoryURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSURL isEqual:](datasetAssetsDirectoryURL, "isEqual:", v8))
    {
      cacheDirectoryURL = self->_cacheDirectoryURL;
      objc_msgSend(v4, "cacheDirectoryURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[NSURL isEqual:](cacheDirectoryURL, "isEqual:", v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSURL hash](self->_modelAssetsDirectoryURL, "hash");
  v4 = -[NSURL hash](self->_datasetAssetsDirectoryURL, "hash") - v3 + 32 * v3;
  return -[NSURL hash](self->_cacheDirectoryURL, "hash") - v4 + 32 * v4 + 29791;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithModelAssetsDirectoryURL:datasetAssetsDirectoryURL:cacheDirectoryURL:", self->_modelAssetsDirectoryURL, self->_datasetAssetsDirectoryURL, self->_cacheDirectoryURL);
}

- (NSURL)modelAssetsDirectoryURL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (NSURL)datasetAssetsDirectoryURL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (NSURL)cacheDirectoryURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheDirectoryURL, 0);
  objc_storeStrong((id *)&self->_datasetAssetsDirectoryURL, 0);
  objc_storeStrong((id *)&self->_modelAssetsDirectoryURL, 0);
}

@end
