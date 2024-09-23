@implementation VCSessionMessageBufferElement

- (VCSessionMessageBufferElement)initWithMessage:(id)a3 sequenceNumber:(unint64_t)a4 retryNumber:(unint64_t)a5
{
  VCSessionMessageBufferElement *v8;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)VCSessionMessageBufferElement;
  v8 = -[VCSessionMessageBufferElement init](&v10, sel_init);
  if (v8)
  {
    v8->_message = (VCControlChannelMessageProtocol *)a3;
    v8->_sequenceNumber = a4;
    v8->_retryNumber = a5;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCSessionMessageBufferElement;
  -[VCSessionMessageBufferElement dealloc](&v3, sel_dealloc);
}

- (VCControlChannelMessageProtocol)message
{
  return self->_message;
}

- (int64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (int64_t)retryNumber
{
  return self->_retryNumber;
}

@end
