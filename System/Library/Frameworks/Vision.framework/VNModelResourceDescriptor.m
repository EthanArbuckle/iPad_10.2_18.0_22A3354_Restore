@implementation VNModelResourceDescriptor

- (NSURL)modelURL
{
  return 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VNModelResourceDescriptor;
  -[VNModelResourceDescriptor description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNModelResourceDescriptor modelURL](self, "modelURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[VNModelResourceDescriptor modelURL](self, "modelURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  VNModelResourceDescriptor *v4;
  VNModelResourceDescriptor *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (VNModelResourceDescriptor *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[VNModelResourceDescriptor modelURL](self, "modelURL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNModelResourceDescriptor modelURL](v5, "modelURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqual:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

+ (id)descriptorForModelURL:(id)a3
{
  id v3;
  _VNModelResourceDescriptor *v4;

  v3 = a3;
  v4 = -[_VNModelResourceDescriptor initWithModelURL:]([_VNModelResourceDescriptor alloc], "initWithModelURL:", v3);

  return v4;
}

+ (id)descriptorForVisionCoreInferenceNetworkDescriptor:(id)a3
{
  id v3;
  _VNVisionCoreInferenceNetworkResourceDescriptor *v4;

  v3 = a3;
  v4 = -[_VNVisionCoreInferenceNetworkResourceDescriptor initWithDescriptor:]([_VNVisionCoreInferenceNetworkResourceDescriptor alloc], "initWithDescriptor:", v3);

  return v4;
}

@end
