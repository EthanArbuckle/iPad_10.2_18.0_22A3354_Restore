@implementation WKFoundTextPosition

+ (id)textPositionWithOffset:(unint64_t)a3 order:(unint64_t)a4
{
  WKFoundTextPosition *v6;

  v6 = objc_alloc_init(WKFoundTextPosition);
  -[WKFoundTextPosition setOffset:](v6, "setOffset:", a3);
  -[WKFoundTextPosition setOrder:](v6, "setOrder:", a4);
  return (id)(id)CFMakeCollectable(v6);
}

- (unint64_t)offset
{
  return self->_offset;
}

- (void)setOffset:(unint64_t)a3
{
  self->_offset = a3;
}

- (unint64_t)order
{
  return self->_order;
}

- (void)setOrder:(unint64_t)a3
{
  self->_order = a3;
}

@end
