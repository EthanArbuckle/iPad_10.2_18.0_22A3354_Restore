@implementation FMDRemoteAssetValidator

- (FMDRemoteAssetValidator)initWithRequestURL:(id)a3 mimeTypeProvider:(id)a4
{
  id v7;
  id v8;
  FMDRemoteAssetValidator *v9;
  FMDRemoteAssetValidator *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FMDRemoteAssetValidator;
  v9 = -[FMDRemoteAssetValidator init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_requestURL, a3);
    objc_storeStrong((id *)&v10->_mimeTypeProvider, a4);
  }

  return v10;
}

- (BOOL)isValidReponse:(id)a3 validationError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  uint64_t v19;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRemoteAssetValidator mimeTypeProvider](self, "mimeTypeProvider"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRemoteAssetValidator requestURL](self, "requestURL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pathExtension"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mimeTypeForFileExtension:", v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "MIMEType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRemoteAssetValidator requestURL](self, "requestURL"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "pathExtension"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URL"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "pathExtension"));

  if (v10 && v11 && objc_msgSend(v10, "length") && objc_msgSend(v11, "length"))
  {
    v16 = v10;
    v17 = v11;
LABEL_11:
    v18 = objc_msgSend(v16, "isEqualToString:", v17);
    goto LABEL_25;
  }
  if (v13 && v15 && objc_msgSend(v13, "length") && objc_msgSend(v15, "length"))
  {
    v16 = v13;
    v17 = v15;
    goto LABEL_11;
  }
  if (a4)
  {
    if (v10 && v13 && objc_msgSend(v10, "length") && objc_msgSend(v13, "length"))
    {
      if (v11 && v15 && objc_msgSend(v11, "length") && objc_msgSend(v15, "length"))
        v19 = 2;
      else
        v19 = 1;
    }
    else
    {
      v19 = 0;
    }
    v18 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.icloud.findmydevice.RemoteAssetValidation"), v19, 0));
  }
  else
  {
    v18 = 0;
  }
LABEL_25:

  return v18;
}

- (NSURL)requestURL
{
  return self->_requestURL;
}

- (void)setRequestURL:(id)a3
{
  objc_storeStrong((id *)&self->_requestURL, a3);
}

- (FMDRemoteAssetMIMETypeProviderType)mimeTypeProvider
{
  return self->_mimeTypeProvider;
}

- (void)setMimeTypeProvider:(id)a3
{
  objc_storeStrong((id *)&self->_mimeTypeProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mimeTypeProvider, 0);
  objc_storeStrong((id *)&self->_requestURL, 0);
}

@end
