@implementation PHAssetResourceValidatedContext

- (PHAssetResourceValidatedContext)initWithResource:(id)a3 validatedURL:(id)a4 validatedData:(id)a5
{
  id v9;
  id v10;
  id v11;
  PHAssetResourceValidatedContext *v12;
  PHAssetResourceValidatedContext *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PHAssetResourceValidatedContext;
  v12 = -[PHAssetResourceValidatedContext init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_resource, a3);
    objc_storeStrong((id *)&v13->_validatedURL, a4);
    objc_storeStrong((id *)&v13->_validatedData, a5);
  }

  return v13;
}

- (PHExternalAssetResource)resource
{
  return self->_resource;
}

- (NSURL)validatedURL
{
  return self->_validatedURL;
}

- (NSData)validatedData
{
  return self->_validatedData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validatedData, 0);
  objc_storeStrong((id *)&self->_validatedURL, 0);
  objc_storeStrong((id *)&self->_resource, 0);
}

@end
