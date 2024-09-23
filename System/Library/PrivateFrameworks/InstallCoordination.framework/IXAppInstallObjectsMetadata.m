@implementation IXAppInstallObjectsMetadata

- (IXAppInstallObjectsMetadata)init
{
  IXAppInstallObjectsMetadata *v2;
  IXAppInstallObjectsMetadata *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IXAppInstallObjectsMetadata;
  v2 = -[IXAppInstallObjectsMetadata init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[IXAppInstallObjectsMetadata setCount:](v2, "setCount:", 0);
    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[IXAppInstallObjectsMetadata setInstances:](v3, "setInstances:", v4);

  }
  return v3;
}

- (void)addObject:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[IXAppInstallObjectsMetadata setCount:](self, "setCount:", -[IXAppInstallObjectsMetadata count](self, "count") + 1);
  -[IXAppInstallObjectsMetadata instances](self, "instances");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (NSHashTable)instances
{
  return self->_instances;
}

- (void)setInstances:(id)a3
{
  objc_storeStrong((id *)&self->_instances, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instances, 0);
}

@end
