@implementation MTLBufferRelocation

- (MTLBufferRelocation)initWithSymbolName:(id)a3 buffer:(id)a4 offset:(unint64_t)a5
{
  MTLBufferRelocation *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTLBufferRelocation;
  v8 = -[MTLBufferRelocation init](&v10, sel_init);
  if (v8)
  {
    v8->_symbolName = (NSString *)a3;
    v8->_buffer = (MTLBuffer *)a4;
    v8->_offset = a5;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLBufferRelocation;
  -[MTLBufferRelocation dealloc](&v3, sel_dealloc);
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (MTLBuffer)buffer
{
  return self->_buffer;
}

- (unint64_t)offset
{
  return self->_offset;
}

@end
