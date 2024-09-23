@implementation SCNMTLBuffer

- (void)setOffset:(unint64_t)a3
{
  self->_offset = a3;
}

- (void)setBuffer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (void)setUsedCount:(int64_t)a3
{
  self->_usedCount = a3;
}

- (void)setDataSource:(id)a3
{
  self->_dataSource = a3;
}

- (void)incrementUsedCount
{
  -[SCNMTLBuffer setUsedCount:](self, "setUsedCount:", -[SCNMTLBuffer usedCount](self, "usedCount") + 1);
}

- (int64_t)usedCount
{
  return self->_usedCount;
}

- (unint64_t)offset
{
  return self->_offset;
}

- (MTLBuffer)buffer
{
  return self->_buffer;
}

- (void)contents
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNMTLBuffer;
  -[SCNMTLBuffer dealloc](&v3, sel_dealloc);
}

- (int64_t)decrementUsedCount
{
  -[SCNMTLBuffer setUsedCount:](self, "setUsedCount:", -[SCNMTLBuffer usedCount](self, "usedCount") - 1);
  return -[SCNMTLBuffer usedCount](self, "usedCount");
}

- (id)dataSource
{
  return self->_dataSource;
}

@end
