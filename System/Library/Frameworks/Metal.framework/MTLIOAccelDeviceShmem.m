@implementation MTLIOAccelDeviceShmem

- (MTLIOAccelDeviceShmem)initWithDevice:(id)a3 shmemSize:(unsigned int)a4
{
  MTLIOAccelDeviceShmem *v5;
  MTLIOAccelDeviceShmem *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTLIOAccelDeviceShmem;
  v5 = -[MTLIOAccelDeviceShmem init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_device = (MTLIOAccelDevice *)a3;
    objc_msgSend(a3, "sharedRef");
    if (IOAccelSharedCreateDeviceShmem())
    {

      return 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_shmemID)
  {
    -[MTLIOAccelDevice sharedRef](self->_device, "sharedRef");
    IOAccelSharedDestroyDeviceShmem();
    self->_shmemID = 0;
  }
  self->_device = 0;
  v3.receiver = self;
  v3.super_class = (Class)MTLIOAccelDeviceShmem;
  -[MTLIOAccelDeviceShmem dealloc](&v3, sel_dealloc);
}

- (void)virtualAddress
{
  return self->_virtualAddress;
}

- (unsigned)shmemID
{
  return self->_shmemID;
}

- (unsigned)shmemSize
{
  return self->_shmemSize;
}

@end
