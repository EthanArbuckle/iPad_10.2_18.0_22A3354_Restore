@implementation MCMXPCMessageWithURLBase

- (MCMXPCMessageWithURLBase)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  id v8;
  MCMXPCMessageWithURLBase *v9;
  const char *string;
  NSURL *v11;
  NSURL *url;
  MCMXPCMessageWithURLBase *v13;
  objc_super v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MCMXPCMessageWithURLBase;
  v9 = -[MCMXPCMessageBase initWithXPCObject:context:error:](&v15, sel_initWithXPCObject_context_error_, v8, a4, a5);
  if (v9)
  {
    string = xpc_dictionary_get_string(v8, "Path");
    if (string
      && (objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", string, 1, 0), (v11 = (NSURL *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      url = v9->_url;
      v9->_url = v11;
      v13 = v11;

    }
    else
    {
      if (a5)
        *a5 = 38;
      v13 = v9;
      v9 = 0;
    }

  }
  return v9;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

@end
