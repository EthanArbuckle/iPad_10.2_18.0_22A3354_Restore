@implementation SCNAssetCatalogCacheEntry

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNAssetCatalogCacheEntry;
  -[SCNAssetCatalogCacheEntry dealloc](&v3, sel_dealloc);
}

- (id)item
{
  return self->item;
}

- (void)setItem:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (double)timestamp
{
  return self->timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->timestamp = a3;
}

@end
