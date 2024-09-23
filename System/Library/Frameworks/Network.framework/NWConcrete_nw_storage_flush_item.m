@implementation NWConcrete_nw_storage_flush_item

- (void)dealloc
{
  char *key;
  objc_super v4;

  key = self->_key;
  if (key)
  {
    free(key);
    self->_key = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)NWConcrete_nw_storage_flush_item;
  -[NWConcrete_nw_storage_flush_item dealloc](&v4, sel_dealloc);
}

@end
