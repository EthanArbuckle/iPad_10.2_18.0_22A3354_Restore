@implementation _OSLogDirectoryReference

- (int)fileDescriptor
{
  return self->_fd;
}

- (_OSLogDirectoryReference)initWithDescriptor:(int)a3 sandboxExtensionToken:(const char *)a4
{
  _OSLogDirectoryReference *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_OSLogDirectoryReference;
  v6 = -[_OSLogDirectoryReference init](&v8, sel_init);
  if (v6)
  {
    v6->_fd = dup(a3);
    v6->_etk = -1;
    if (a4)
      v6->_etk = sandbox_extension_consume();
  }
  return v6;
}

- (void)close
{
  int fd;
  int v4;
  uint64_t v5;

  fd = self->_fd;
  if (fd < 0 || close(fd) != -1)
    goto LABEL_3;
  v4 = *__error();
  v5 = *__error();
  if (v4 != 9)
  {
    _os_assumes_log();
LABEL_3:
    self->_fd = -1;
    return;
  }
  qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1EE52EA88 = v5;
  __break(1u);
}

- (void)dealloc
{
  uint64_t fd;
  objc_super v4;

  fd = self->_fd;
  if ((_DWORD)fd == -1)
  {
    if (self->_etk != -1)
    {
      sandbox_extension_release();
      self->_etk = -1;
    }
    v4.receiver = self;
    v4.super_class = (Class)_OSLogDirectoryReference;
    -[_OSLogDirectoryReference dealloc](&v4, sel_dealloc);
  }
  else
  {
    qword_1EE52EA58 = (uint64_t)"BUG IN LIBTRACE: _OSLogDirectoryReference released before close";
    qword_1EE52EA88 = fd;
    __break(1u);
  }
}

- (_OSLogDirectoryReference)initWithDescriptor:(int)a3
{
  return -[_OSLogDirectoryReference initWithDescriptor:sandboxExtensionToken:](self, "initWithDescriptor:sandboxExtensionToken:", *(_QWORD *)&a3, 0);
}

@end
