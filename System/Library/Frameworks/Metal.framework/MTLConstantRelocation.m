@implementation MTLConstantRelocation

- (MTLConstantRelocation)initWithSymbolName:(id)a3 data:(id)a4
{
  MTLConstantRelocation *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTLConstantRelocation;
  v6 = -[MTLConstantRelocation init](&v8, sel_init);
  if (v6)
  {
    v6->_symbolName = (NSString *)a3;
    v6->_data = (OS_dispatch_data *)a4;
  }
  return v6;
}

- (MTLConstantRelocation)initWithSymbolName:(id)a3 bytes:(void *)a4 length:(unint64_t)a5
{
  MTLConstantRelocation *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTLConstantRelocation;
  v8 = -[MTLConstantRelocation init](&v10, sel_init);
  if (v8)
  {
    v8->_symbolName = (NSString *)a3;
    v8->_data = (OS_dispatch_data *)dispatch_data_create(a4, a5, 0, 0);
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLConstantRelocation;
  -[MTLConstantRelocation dealloc](&v3, sel_dealloc);
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (OS_dispatch_data)data
{
  return self->_data;
}

@end
