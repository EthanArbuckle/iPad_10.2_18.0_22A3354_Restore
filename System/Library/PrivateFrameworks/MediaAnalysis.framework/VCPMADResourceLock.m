@implementation VCPMADResourceLock

- (VCPMADResourceLock)initWithResourceManager:(id)a3 andResource:(id)a4
{
  id v7;
  id v8;
  VCPMADResourceLock *v9;
  VCPMADResourceLock *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VCPMADResourceLock;
  v9 = -[VCPMADResourceLock init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_resourceManager, a3);
    objc_storeStrong((id *)&v10->_resource, a4);
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[VCPMADResourceLock reset](self, "reset");
  v3.receiver = self;
  v3.super_class = (Class)VCPMADResourceLock;
  -[VCPMADResourceLock dealloc](&v3, sel_dealloc);
}

- (void)reset
{
  VCPMADResource *resource;

  if (self->_resource)
  {
    -[VCPMADResourceManager deactivateResource:](self->_resourceManager, "deactivateResource:");
    resource = self->_resource;
    self->_resource = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resource, 0);
  objc_storeStrong((id *)&self->_resourceManager, 0);
}

@end
