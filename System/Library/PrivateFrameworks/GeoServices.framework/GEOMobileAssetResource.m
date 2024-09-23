@implementation GEOMobileAssetResource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURL, 0);
}

- (GEOMobileAssetResource)initWithURL:(id)a3 sandboxExtensionData:(id)a4
{
  id v7;
  id v8;
  GEOMobileAssetResource *v9;
  GEOMobileAssetResource *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GEOMobileAssetResource;
  v9 = -[GEOMobileAssetResource init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fileURL, a3);
    objc_msgSend(objc_retainAutorelease(v8), "bytes");
    v10->_sandboxExtension = sandbox_extension_consume();
  }

  return v10;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_sandboxExtension != -1)
    sandbox_extension_release();
  v3.receiver = self;
  v3.super_class = (Class)GEOMobileAssetResource;
  -[GEOMobileAssetResource dealloc](&v3, sel_dealloc);
}

@end
