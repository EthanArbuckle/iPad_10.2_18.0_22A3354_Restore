@implementation CPLRUDictionaryNode

- (CPLRUDictionaryNode)initWithKey:(id)a3 object:(id)a4
{
  CPLRUDictionaryNode *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CPLRUDictionaryNode;
  v6 = -[CPLRUDictionaryNode init](&v8, sel_init);
  if (v6)
  {
    v6->_key = a3;
    v6->_object = a4;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CPLRUDictionaryNode;
  -[CPLRUDictionaryNode dealloc](&v3, sel_dealloc);
}

- (id)key
{
  return self->_key;
}

- (id)object
{
  return self->_object;
}

- (void)setObject:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
