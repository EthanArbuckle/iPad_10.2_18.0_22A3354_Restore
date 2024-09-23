@implementation BUZipFileDescriptorWrapper

- (BUZipFileDescriptorWrapper)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  id v6;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("%@: %s"), CFSTR("Do not call method"), "-[BUZipFileDescriptorWrapper init]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_exceptionWithName_reason_userInfo_(v2, v5, v3, v4, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (BUZipFileDescriptorWrapper)initWithFileDescriptor:(int)a3 queue:(id)a4
{
  uint64_t v4;
  id v6;
  BUZipFileDescriptorWrapper *v7;
  BUFileIOChannel *v8;
  const char *v9;
  BUReadChannel *v10;
  BUReadChannel *readChannel;
  OS_dispatch_group *v12;
  OS_dispatch_group *accessGroup;
  BUZipFileDescriptorWrapper *v14;
  _QWORD v16[4];
  int v17;
  objc_super v18;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  if ((v4 & 0x80000000) == 0)
  {
    v18.receiver = self;
    v18.super_class = (Class)BUZipFileDescriptorWrapper;
    v7 = -[BUZipFileDescriptorWrapper init](&v18, sel_init);
    self = v7;
    if (!v7)
    {
      close(v4);
      goto LABEL_7;
    }
    v7->_fileDescriptor = v4;
    v8 = [BUFileIOChannel alloc];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = sub_212E599A4;
    v16[3] = &unk_24CEDA3F8;
    v17 = v4;
    v10 = (BUReadChannel *)objc_msgSend_initForReadingDescriptor_queue_cleanupHandler_(v8, v9, v4, v6, v16);
    readChannel = self->_readChannel;
    self->_readChannel = v10;

    if (self->_readChannel)
    {
      v12 = (OS_dispatch_group *)dispatch_group_create();
      accessGroup = self->_accessGroup;
      self->_accessGroup = v12;

LABEL_7:
      self = self;
      v14 = self;
      goto LABEL_8;
    }
  }
  v14 = 0;
LABEL_8:

  return v14;
}

- (void)dealloc
{
  uint64_t v2;
  objc_super v4;

  objc_msgSend_close(self->_readChannel, a2, v2);
  v4.receiver = self;
  v4.super_class = (Class)BUZipFileDescriptorWrapper;
  -[BUZipFileDescriptorWrapper dealloc](&v4, sel_dealloc);
}

- (void)beginAccess
{
  dispatch_group_enter((dispatch_group_t)self->_accessGroup);
}

- (void)endAccess
{
  dispatch_group_leave((dispatch_group_t)self->_accessGroup);
}

- (void)waitForAccessToEnd
{
  dispatch_group_wait((dispatch_group_t)self->_accessGroup, 0xFFFFFFFFFFFFFFFFLL);
}

- (int)fileDescriptor
{
  return self->_fileDescriptor;
}

- (BUReadChannel)readChannel
{
  return self->_readChannel;
}

- (OS_dispatch_group)accessGroup
{
  return self->_accessGroup;
}

- (void)setAccessGroup:(id)a3
{
  objc_storeStrong((id *)&self->_accessGroup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessGroup, 0);
  objc_storeStrong((id *)&self->_readChannel, 0);
}

@end
