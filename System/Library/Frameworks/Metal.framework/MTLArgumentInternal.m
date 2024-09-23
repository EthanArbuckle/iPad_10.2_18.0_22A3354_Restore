@implementation MTLArgumentInternal

- (MTLArgumentInternal)initWithBinding:(id)a3
{
  MTLArgumentInternal *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTLArgumentInternal;
  v4 = -[MTLArgumentInternal init](&v6, sel_init);
  v4->_binding = (MTLBindingInternal *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLArgumentInternal;
  -[MTLArgumentInternal dealloc](&v3, sel_dealloc);
}

@end
