@implementation FSMetadataBlockRange

- (FSMetadataBlockRange)initWithOffset:(int64_t)a3 blockLength:(unsigned int)a4 numberOfBlocks:(unsigned int)a5
{
  FSMetadataBlockRange *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FSMetadataBlockRange;
  result = -[FSMetadataBlockRange init](&v9, sel_init);
  if (result)
  {
    result->_startBlockOffset = a3;
    result->_blockLength = a4;
    result->_numberOfBlocks = a5;
  }
  return result;
}

+ (id)rangeWithOffset:(int64_t)a3 blockLength:(unsigned int)a4 numberOfBlocks:(unsigned int)a5
{
  return -[FSMetadataBlockRange initWithOffset:blockLength:numberOfBlocks:]([FSMetadataBlockRange alloc], "initWithOffset:blockLength:numberOfBlocks:", a3, *(_QWORD *)&a4, *(_QWORD *)&a5);
}

- (int64_t)startBlockOffset
{
  return self->_startBlockOffset;
}

- (unsigned)blockLength
{
  return self->_blockLength;
}

- (unsigned)numberOfBlocks
{
  return self->_numberOfBlocks;
}

@end
