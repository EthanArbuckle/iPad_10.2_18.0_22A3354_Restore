@implementation NSSQLBindIntarray

- (void)setTableName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (void)setIndex:(unsigned int)a3
{
  self->_index = a3;
}

- (NSSQLBindIntarray)initWithValue:(id)a3
{
  NSSQLBindIntarray *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSSQLBindIntarray;
  v4 = -[NSSQLBindIntarray init](&v6, sel_init);
  if (v4)
    v4->_value = a3;
  return v4;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (id)value
{
  return self->_value;
}

- (unsigned)index
{
  return self->_index;
}

- (void)setValue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (void)dealloc
{
  objc_super v3;

  self->_value = 0;
  self->_tableName = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLBindIntarray;
  -[NSSQLBindIntarray dealloc](&v3, sel_dealloc);
}

@end
