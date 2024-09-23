@implementation IOKIterator

- (IOKIterator)initWithIterator:(unsigned int)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IOKIterator;
  return -[IOKObject initWithIOObject:](&v4, sel_initWithIOObject_, *(_QWORD *)&a3);
}

- (void)enumerateWithBlock:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void (**v7)(id, void *);

  v7 = (void (**)(id, void *))a3;
  -[IOKIterator nextObject](self, "nextObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    do
    {
      v7[2](v7, v5);
      -[IOKIterator nextObject](self, "nextObject");
      v6 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v6;
    }
    while (v6);
  }

}

- (id)nextObject
{
  uint64_t v2;
  io_object_t v3;
  void *v4;

  v2 = IOIteratorNext(-[IOKObject object](self, "object"));
  if ((_DWORD)v2)
  {
    v3 = v2;
    v4 = (void *)objc_msgSend(objc_alloc(+[IOKObject classForRegistryEntry:](IOKObject, "classForRegistryEntry:", v2)), "initWithIOObject:", v2);
    IOObjectRelease(v3);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_enumerationBlock, 0);
}

- (IOKIterator)initWithIterator:(unsigned int)a3 enumerationBlock:(id)a4
{
  uint64_t v4;
  id v6;
  IOKIterator *v7;
  uint64_t v8;
  id enumerationBlock;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = -[IOKIterator initWithIterator:](self, "initWithIterator:", v4);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    enumerationBlock = v7->_enumerationBlock;
    v7->_enumerationBlock = (id)v8;

  }
  return v7;
}

- (void)reset
{
  -[IOKObject object](self, "object");
  JUMPOUT(0x2199DC710);
}

- (BOOL)isValid
{
  return IOIteratorIsValid(-[IOKObject object](self, "object")) != 0;
}

- (void)enumerate
{
  id enumerationBlock;

  enumerationBlock = self->_enumerationBlock;
  if (!enumerationBlock)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("To use -enumerate you must initialise with the initWithIterator:enumerationBlock: method."));
    enumerationBlock = self->_enumerationBlock;
  }
  -[IOKIterator enumerateWithBlock:](self, "enumerateWithBlock:", enumerationBlock);
}

@end
