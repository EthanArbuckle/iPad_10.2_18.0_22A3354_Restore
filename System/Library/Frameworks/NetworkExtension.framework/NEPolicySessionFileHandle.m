@implementation NEPolicySessionFileHandle

- (NEPolicySessionFileHandle)initWithPolicySession:(id)a3
{
  return -[NEPolicySessionFileHandle initWithPolicySession:name:](self, "initWithPolicySession:name:", a3, CFSTR("default"));
}

- (NEPolicySessionFileHandle)initWithPolicySession:(id)a3 name:(id)a4
{
  id v7;
  uint64_t v8;
  NEPolicySessionFileHandle *v9;
  NEPolicySessionFileHandle *v10;
  NEPolicySessionFileHandle *v11;
  objc_super v13;

  v7 = a4;
  v8 = objc_msgSend(a3, "dupSocket");
  if ((v8 & 0x80000000) != 0)
  {
    v11 = 0;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)NEPolicySessionFileHandle;
    v9 = -[NEFileHandle initWithFileDescriptor:launchOwnerWhenReadable:](&v13, sel_initWithFileDescriptor_launchOwnerWhenReadable_, v8, 0);
    v10 = v9;
    if (v9)
      objc_storeStrong((id *)&v9->_name, a4);
    self = v10;
    v11 = self;
  }

  return v11;
}

- (id)initFromDictionary:(id)a3
{
  id v4;
  _QWORD *v5;
  const char *string;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NEPolicySessionFileHandle;
  v5 = -[NEFileHandle initFromDictionary:](&v10, sel_initFromDictionary_, v4);
  if (v5)
  {
    string = xpc_dictionary_get_string(v4, "session-name");
    if (string)
    {
      v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", string, 4);
      v8 = (void *)v5[3];
      v5[3] = v7;

    }
  }

  return v5;
}

- (id)dictionary
{
  void *v3;
  NSString *name;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NEPolicySessionFileHandle;
  -[NEFileHandle dictionary](&v6, sel_dictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    name = self->_name;
    if (name)
      xpc_dictionary_set_string(v3, "session-name", -[NSString UTF8String](name, "UTF8String"));
  }
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NEPolicySessionFileHandle name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEFileHandle handle](self, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Policy Session %@ socket (%d)"), v4, objc_msgSend(v5, "fileDescriptor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)type
{
  return 1;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
