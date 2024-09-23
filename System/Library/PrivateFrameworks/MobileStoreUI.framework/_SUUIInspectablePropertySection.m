@implementation _SUUIInspectablePropertySection

- (_SUUIInspectablePropertySection)init
{
  _SUUIInspectablePropertySection *v2;
  NSMutableArray *v3;
  NSMutableArray *properties;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_SUUIInspectablePropertySection;
  v2 = -[_SUUIInspectablePropertySection init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    properties = v2->_properties;
    v2->_properties = v3;

  }
  return v2;
}

- (NSString)friendlyName
{
  return self->_friendlyName;
}

- (void)setFriendlyName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSMutableArray)properties
{
  return self->_properties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_friendlyName, 0);
}

@end
