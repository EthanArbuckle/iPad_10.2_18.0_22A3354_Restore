@implementation IOAccelMemoryPoolTotals

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IOAccelMemoryPoolTotals;
  -[IOAccelMemoryPoolTotals dealloc](&v3, sel_dealloc);
}

- (NSString)device_name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDevice_name:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)pool
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPool:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (unint64_t)allocatedSize
{
  return self->allocatedSize;
}

- (void)setAllocatedSize:(unint64_t)a3
{
  self->allocatedSize = a3;
}

- (unint64_t)residentSize
{
  return self->residentSize;
}

- (void)setResidentSize:(unint64_t)a3
{
  self->residentSize = a3;
}

- (unint64_t)wiredSize
{
  return self->wiredSize;
}

- (void)setWiredSize:(unint64_t)a3
{
  self->wiredSize = a3;
}

- (unint64_t)dirtySize
{
  return self->dirtySize;
}

- (void)setDirtySize:(unint64_t)a3
{
  self->dirtySize = a3;
}

- (unint64_t)purgeableSize
{
  return self->purgeableSize;
}

- (void)setPurgeableSize:(unint64_t)a3
{
  self->purgeableSize = a3;
}

- (unint64_t)nonpurgeableSize
{
  return self->nonpurgeableSize;
}

- (void)setNonpurgeableSize:(unint64_t)a3
{
  self->nonpurgeableSize = a3;
}

- (unint64_t)orphanedSize
{
  return self->orphanedSize;
}

- (void)setOrphanedSize:(unint64_t)a3
{
  self->orphanedSize = a3;
}

@end
