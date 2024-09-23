@implementation _VNModelResourceDescriptor

- (_VNModelResourceDescriptor)initWithModelURL:(id)a3
{
  id v5;
  id *v6;
  _VNModelResourceDescriptor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_VNModelResourceDescriptor;
  v6 = -[VNResourceDescriptor _init](&v9, sel__init);
  v7 = (_VNModelResourceDescriptor *)v6;
  if (v6)
    objc_storeStrong(v6 + 1, a3);

  return v7;
}

- (id)modelURL
{
  return self->_modelURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelURL, 0);
}

@end
