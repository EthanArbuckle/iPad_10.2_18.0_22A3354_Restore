@implementation NSXPCRow

- (NSXPCRow)initWithNode:(id)a3
{
  NSXPCRow *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSXPCRow;
  v4 = -[NSPersistentCacheRow initWithOptions:andTimestamp:](&v6, sel_initWithOptions_andTimestamp_, 0, 0.0);
  if (v4)
    v4->_node = a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->_node = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSXPCRow;
  -[NSPersistentCacheRow dealloc](&v3, sel_dealloc);
}

- (id)objectID
{
  return (id)objc_msgSend(self->_node, "objectID");
}

@end
