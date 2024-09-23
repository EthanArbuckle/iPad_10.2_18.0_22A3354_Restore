@implementation LiveFSMemoryMap

- (LiveFSMemoryMap)initWithPort:(unsigned int)a3 address:(unint64_t)a4 andSize:(unint64_t)a5
{
  LiveFSMemoryMap *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)LiveFSMemoryMap;
  result = -[LiveFSMemoryMap init](&v9, sel_init);
  if (result)
  {
    result->_port = a3;
    result->_address = a4;
    result->_size = a5;
  }
  return result;
}

+ (id)newWithPort:(unsigned int)a3 address:(unint64_t)a4 andSize:(unint64_t)a5
{
  return -[LiveFSMemoryMap initWithPort:address:andSize:]([LiveFSMemoryMap alloc], "initWithPort:address:andSize:", *(_QWORD *)&a3, a4, a5);
}

- (void)dealloc
{
  OUTLINED_FUNCTION_4_1(&dword_22BD61000, a2, a3, "LiveFSMemoryMap: dealloc: error %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3_1();
}

- (unint64_t)address
{
  return self->_address;
}

- (unint64_t)size
{
  return self->_size;
}

- (unsigned)port
{
  return self->_port;
}

- (void)setPort:(unsigned int)a3
{
  self->_port = a3;
}

@end
