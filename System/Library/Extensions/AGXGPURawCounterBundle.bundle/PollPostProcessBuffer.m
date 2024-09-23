@implementation PollPostProcessBuffer

- (PollPostProcessBuffer)init
{
  PollPostProcessBuffer *v2;
  uint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PollPostProcessBuffer;
  v2 = -[PollPostProcessBuffer init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", 0x100000);
    v2->_dstBuffer = (NSMutableData *)v3;
    if (v3)
    {
      -[PollPostProcessBuffer reset](v2, "reset");
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PollPostProcessBuffer;
  -[PollPostProcessBuffer dealloc](&v3, sel_dealloc);
}

- (void)reset
{
  *(_QWORD *)&self->_srcBufferPrevOffset = 0;
}

- (unsigned)srcBufferPrevOffset
{
  return self->_srcBufferPrevOffset;
}

- (void)setSrcBufferPrevOffset:(unsigned int)a3
{
  self->_srcBufferPrevOffset = a3;
}

- (unsigned)srcBufferPrevSize
{
  return self->_srcBufferPrevSize;
}

- (void)setSrcBufferPrevSize:(unsigned int)a3
{
  self->_srcBufferPrevSize = a3;
}

- (NSMutableData)dstBuffer
{
  return self->_dstBuffer;
}

@end
