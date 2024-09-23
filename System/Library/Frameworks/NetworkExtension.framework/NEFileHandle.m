@implementation NEFileHandle

- (id)initFromDictionary:(id)a3
{
  id v4;
  uint64_t v5;
  _BOOL8 v6;
  NEFileHandle *v7;

  v4 = a3;
  v5 = xpc_dictionary_dup_fd(v4, "file-descriptor");
  v6 = xpc_dictionary_get_BOOL(v4, "launch-owner-when-readable");

  if ((v5 & 0x80000000) != 0)
  {
    v7 = 0;
  }
  else
  {
    self = -[NEFileHandle initWithFileDescriptor:launchOwnerWhenReadable:](self, "initWithFileDescriptor:launchOwnerWhenReadable:", v5, v6);
    v7 = self;
  }

  return v7;
}

- (NEFileHandle)initWithFileDescriptor:(int)a3 launchOwnerWhenReadable:(BOOL)a4
{
  uint64_t v5;
  NEFileHandle *v6;
  uint64_t v7;
  NSFileHandle *handle;
  objc_super v10;

  v5 = *(_QWORD *)&a3;
  v10.receiver = self;
  v10.super_class = (Class)NEFileHandle;
  v6 = -[NEFileHandle init](&v10, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3608]), "initWithFileDescriptor:closeOnDealloc:", v5, 1);
    handle = v6->_handle;
    v6->_handle = (NSFileHandle *)v7;

    v6->_launchOwnerWhenReadable = a4;
  }
  return v6;
}

- (OS_xpc_object)dictionary
{
  void *v3;
  int v4;
  xpc_object_t v5;
  void *v6;

  -[NEFileHandle handle](self, "handle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fileDescriptor");

  if (v4 < 0)
  {
    v5 = 0;
  }
  else
  {
    v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v5, "type", -[NEFileHandle type](self, "type"));
    -[NEFileHandle handle](self, "handle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_set_fd(v5, "file-descriptor", objc_msgSend(v6, "fileDescriptor"));

    xpc_dictionary_set_BOOL(v5, "launch-owner-when-readable", -[NEFileHandle launchOwnerWhenReadable](self, "launchOwnerWhenReadable"));
  }
  return (OS_xpc_object *)v5;
}

- (unint64_t)type
{
  return 0;
}

- (BOOL)launchOwnerWhenReadable
{
  return self->_launchOwnerWhenReadable;
}

- (NSFileHandle)handle
{
  return (NSFileHandle *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handle, 0);
}

@end
