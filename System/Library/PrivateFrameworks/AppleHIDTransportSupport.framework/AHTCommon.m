@implementation AHTCommon

- (AHTCommon)initWithService:(unsigned int)a3
{
  AHTCommon *v4;
  AHTCommon *v5;
  objc_super v7;

  if (a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)AHTCommon;
    v4 = -[AHTCommon init](&v7, sel_init);
    v4->_service = a3;
    IOObjectRetain(a3);
    self = v4;
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[AHTCommon close](self, "close");
  IOObjectRelease(self->_service);
  v3.receiver = self;
  v3.super_class = (Class)AHTCommon;
  -[AHTCommon dealloc](&v3, sel_dealloc);
}

- (BOOL)open
{
  return IOServiceOpen(self->_service, *MEMORY[0x24BDAEC58], 0, &self->_connect) == 0;
}

- (void)close
{
  io_connect_t connect;

  connect = self->_connect;
  if (connect)
  {
    IOServiceClose(connect);
    self->_connect = 0;
  }
}

- (BOOL)setPower:(int64_t)a3
{
  return 0;
}

- (BOOL)getPower:(int64_t *)a3
{
  return 0;
}

- (BOOL)reset
{
  return 0;
}

- (id)getBootLoader
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  io_iterator_t iterator;

  iterator = 0;
  if (MEMORY[0x219A04F9C](self->_service, "IOService", 1, &iterator))
    return 0;
  while (1)
  {
    v4 = IOIteratorNext(iterator);
    if (!(_DWORD)v4)
      break;
    v5 = v4;
    if (IOObjectConformsTo(v4, "AppleHIDTransportBootloader"))
    {
      +[AHTBootLoader withParent:service:](AHTBootLoader, "withParent:service:", self, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
  }
  v6 = 0;
LABEL_7:
  IOObjectRelease(iterator);
  return v6;
}

- (unint64_t)registryID
{
  uint64_t entryID;

  entryID = 0;
  if (IORegistryEntryGetRegistryEntryID(self->_service, &entryID))
    return 0;
  else
    return entryID;
}

- (unsigned)service
{
  return self->_service;
}

- (unsigned)connect
{
  return self->_connect;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
