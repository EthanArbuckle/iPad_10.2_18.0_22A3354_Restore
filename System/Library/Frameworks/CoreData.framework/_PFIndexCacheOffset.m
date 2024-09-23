@implementation _PFIndexCacheOffset

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("range (%lu, %lu), offset %ld"), self->_range.location, self->_range.length, self->_offset);
}

@end
