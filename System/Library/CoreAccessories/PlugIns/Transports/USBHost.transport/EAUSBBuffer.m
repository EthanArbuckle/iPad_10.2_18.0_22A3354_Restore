@implementation EAUSBBuffer

- (EAUSBBuffer)initWithSession:(id)a3 bufferSize:(unint64_t)a4
{
  id v6;
  EAUSBBuffer *v7;
  objc_super v9;

  v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EAUSBBuffer;
  v7 = -[EAUSBBuffer init](&v9, sel_init);
  if (v7)
  {
    v7->_bufPtr = (char *)malloc_type_malloc(a4, 0x5AD18188uLL);
    objc_storeWeak((id *)&v7->_eaInterface, v6);
    v7->_bufferLength = a4;
    -[EAUSBBuffer reset](v7, "reset");
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_bufPtr);
  v3.receiver = self;
  v3.super_class = (Class)EAUSBBuffer;
  -[EAUSBBuffer dealloc](&v3, sel_dealloc);
}

- (void)reset
{
  char *bufPtr;

  self->_usbError = 0;
  bufPtr = self->_bufPtr;
  self->_readPtr = 0;
  self->_writePtr = bufPtr;
  self->_writeAttempts = 10;
}

- (unint64_t)writeSpaceRemaining
{
  if (&self->_bufPtr[self->_bufferLength] == self->_writePtr)
    return 0;
  else
    return &self->_bufPtr[self->_bufferLength] - self->_writePtr;
}

- (unint64_t)dataLength
{
  char *readPtr;

  readPtr = self->_readPtr;
  if (readPtr)
    return self->_writePtr - readPtr;
  else
    return 0;
}

- (void)moveReadPtr:(unint64_t)a3
{
  char *readPtr;
  char *writePtr;

  readPtr = self->_readPtr;
  if (readPtr)
  {
    writePtr = &readPtr[a3];
    if (writePtr > self->_writePtr)
      writePtr = self->_writePtr;
    self->_readPtr = writePtr;
  }
}

- (void)moveWritePtr:(unint64_t)a3
{
  char *bufPtr;
  char *v4;

  if (a3)
  {
    bufPtr = self->_bufPtr;
    if (!self->_readPtr)
      self->_readPtr = bufPtr;
    v4 = &bufPtr[self->_bufferLength];
    if (&self->_writePtr[a3] < v4)
      v4 = &self->_writePtr[a3];
    self->_writePtr = v4;
  }
}

- (void)attemptWrite
{
  unint64_t writeAttempts;

  writeAttempts = self->_writeAttempts;
  if (writeAttempts)
    self->_writeAttempts = writeAttempts - 1;
}

- (AccessoryEAInterface)eaInterface
{
  return (AccessoryEAInterface *)objc_loadWeakRetained((id *)&self->_eaInterface);
}

- (void)setEaInterface:(id)a3
{
  objc_storeWeak((id *)&self->_eaInterface, a3);
}

- (int)usbError
{
  return self->_usbError;
}

- (void)setUsbError:(int)a3
{
  self->_usbError = a3;
}

- (char)readPtr
{
  return self->_readPtr;
}

- (char)writePtr
{
  return self->_writePtr;
}

- (unint64_t)writeAttempts
{
  return self->_writeAttempts;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_eaInterface);
}

@end
