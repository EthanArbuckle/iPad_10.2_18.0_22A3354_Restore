@implementation ISCompositorResourceProviderKey

+ (id)resourceKeyWithName:(id)a3 flags:(unint64_t)a4
{
  id v5;
  ISCompositorResourceProviderKey *v6;
  uint64_t v7;
  NSString *name;

  v5 = a3;
  v6 = objc_alloc_init(ISCompositorResourceProviderKey);
  v7 = objc_msgSend(v5, "copy");

  name = v6->_name;
  v6->_name = (NSString *)v7;

  v6->_flags = a4;
  return v6;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
