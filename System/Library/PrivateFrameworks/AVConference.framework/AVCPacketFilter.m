@implementation AVCPacketFilter

- (BOOL)isMatchedPacket:(const void *)a3 size:(int)a4
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), *(_QWORD *)&a4, "-[AVCPacketFilter isMatchedPacket:size:]"), 0));
}

- (BOOL)isRTPFilter
{
  return self->_isRTPFilter;
}

@end
