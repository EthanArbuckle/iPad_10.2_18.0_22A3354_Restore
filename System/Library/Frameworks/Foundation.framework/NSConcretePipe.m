@implementation NSConcretePipe

- (id)fileHandleForReading
{
  return self->_readHandle;
}

- (id)fileHandleForWriting
{
  return self->_writeHandle;
}

- (NSConcretePipe)init
{
  NSConcretePipe *v2;
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  objc_super *v7;
  NSConcretePipe *v9;
  objc_super v10;
  NSConcretePipe *v11;
  objc_super v12;
  int v13[2];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)NSConcretePipe;
  v2 = -[NSPipe init](&v12, sel_init);
  if (v2)
  {
    if (pipe(v13) < 0)
    {
      v11 = v2;
      v7 = (objc_super *)&v11;
      goto LABEL_8;
    }
    v3 = objc_allocWithZone((Class)NSConcreteFileHandle);
    v4 = objc_msgSend(v3, "initWithFileDescriptor:closeOnDealloc:", v13[0], 1);
    v2->_readHandle = (NSFileHandle *)v4;
    if (!v4)
    {
      close(v13[0]);
      close(v13[1]);
      v10.receiver = v2;
      v7 = &v10;
      goto LABEL_8;
    }
    v5 = objc_allocWithZone((Class)NSConcreteFileHandle);
    v6 = objc_msgSend(v5, "initWithFileDescriptor:closeOnDealloc:", v13[1], 1);
    v2->_writeHandle = (NSFileHandle *)v6;
    if (!v6)
    {

      close(v13[1]);
      v9 = v2;
      v7 = (objc_super *)&v9;
LABEL_8:
      v7->super_class = (Class)NSConcretePipe;
      -[objc_super dealloc](v7, sel_dealloc, v9);
      return 0;
    }
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSConcretePipe;
  -[NSConcretePipe dealloc](&v3, sel_dealloc);
}

- (void)_closeOnDealloc
{
  -[NSFileHandle _closeOnDealloc](self->_writeHandle, "_closeOnDealloc");
  -[NSFileHandle _closeOnDealloc](self->_readHandle, "_closeOnDealloc");
}

@end
