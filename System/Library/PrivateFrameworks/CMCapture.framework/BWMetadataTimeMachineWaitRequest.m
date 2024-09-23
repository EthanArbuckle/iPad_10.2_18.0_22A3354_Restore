@implementation BWMetadataTimeMachineWaitRequest

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p>: Capacity:%d, completion capacity:%d"), objc_opt_class(), self, self->_capacity, self->_completionCapacity);
}

@end
