@implementation IOBufferMutableData

- (IOBufferMutableData)initWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 bufferID:(unsigned int)a5 deallocator:(id)a6
{
  self->_bytes = a3;
  self->_length = a4;
  self->_bufferID = a5;
  -[IOBufferMutableData setDeallocator:](self, "setDeallocator:", a6);
  return self;
}

- (void)dealloc
{
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  objc_super v5;

  -[IOBufferMutableData deallocator](self, "deallocator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[IOBufferMutableData deallocator](self, "deallocator");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, IOBufferMutableData *, unint64_t))v4)[2](v4, self, self->_length);

  }
  v5.receiver = self;
  v5.super_class = (Class)IOBufferMutableData;
  -[IOBufferMutableData dealloc](&v5, sel_dealloc);
}

- (unint64_t)length
{
  return self->_length;
}

- (void)setLength:(unint64_t)a3
{
  id v3;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("ioDataSetLengthException"), CFSTR("Length can not be modified for ioData buffer"), 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (unsigned)bufferID
{
  return self->_bufferID;
}

- (void)setID:(unsigned int)a3
{
  id v3;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("ioDataSetIDException"), CFSTR("ID can not be modified for ioData buffer"), 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (const)bytes
{
  return self->_bytes;
}

- (void)mutableBytes
{
  return self->_bytes;
}

- (id)deallocator
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setDeallocator:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deallocator, 0);
}

@end
