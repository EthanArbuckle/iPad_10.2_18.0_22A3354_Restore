@implementation BMSocialMediaHandle

- (BMSocialMediaHandle)initWithBundleId:(id)a3 handle:(id)a4
{
  id v7;
  id v8;
  BMSocialMediaHandle *v9;
  BMSocialMediaHandle *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BMSocialMediaHandle;
  v9 = -[BMSocialMediaHandle init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bundleId, a3);
    objc_storeStrong((id *)&v10->_handle, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  NSString *bundleId;
  void *v7;
  NSString *handle;
  void *v9;
  BOOL v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    bundleId = self->_bundleId;
    objc_msgSend(v5, "bundleId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqualToString:](bundleId, "isEqualToString:", v7))
    {
      handle = self->_handle;
      objc_msgSend(v5, "handle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[NSString isEqualToString:](handle, "isEqualToString:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[BMSocialMediaHandle proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMSocialMediaHandle)initWithProto:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  BMSocialMediaHandle *v8;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    objc_msgSend(v5, "bundleId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    self = -[BMSocialMediaHandle initWithBundleId:handle:](self, "initWithBundleId:handle:", v6, v7);
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BMSocialMediaHandle)initWithProtoData:(id)a3
{
  id v4;
  BMPBSocialMediaHandle *v5;
  BMSocialMediaHandle *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBSocialMediaHandle initWithData:]([BMPBSocialMediaHandle alloc], "initWithData:", v4);

    self = -[BMSocialMediaHandle initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proto
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_new();
  -[BMSocialMediaHandle bundleId](self, "bundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBundleId:", v4);

  -[BMSocialMediaHandle handle](self, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHandle:", v5);

  return v3;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSString)handle
{
  return self->_handle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end
