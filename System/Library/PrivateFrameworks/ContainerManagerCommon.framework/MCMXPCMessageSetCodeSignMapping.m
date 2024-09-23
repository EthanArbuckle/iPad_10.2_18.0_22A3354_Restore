@implementation MCMXPCMessageSetCodeSignMapping

- (MCMXPCMessageSetCodeSignMapping)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  id v8;
  MCMXPCMessageSetCodeSignMapping *v9;
  MCMXPCMessageSetCodeSignMapping *v10;
  uint64_t v11;
  id info;
  unint64_t v13;
  uint64_t v15;
  id options;
  MCMXPCMessageSetCodeSignMapping *v18;
  uint64_t v20;
  objc_super v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MCMXPCMessageSetCodeSignMapping;
  v9 = -[MCMXPCMessageWithIdentifierBase initWithXPCObject:context:error:](&v21, sel_initWithXPCObject_context_error_, v8, a4, a5);
  v10 = v9;
  if (!v9)
    goto LABEL_12;
  v20 = 1;
  -[MCMXPCMessageBase nsObjectFromXPCObject:key:error:](v9, "nsObjectFromXPCObject:key:error:", v8, "CodeSigningInfo", &v20);
  v11 = objc_claimAutoreleasedReturnValue();
  info = v10->_info;
  v10->_info = (id)v11;

  v13 = v20;
  if (!v10->_info && v20 != 1)
    goto LABEL_13;
  v20 = 1;
  -[MCMXPCMessageBase nsObjectFromXPCObject:key:error:](v10, "nsObjectFromXPCObject:key:error:", v8, "OptionsDictionary", &v20);
  v15 = objc_claimAutoreleasedReturnValue();
  options = v10->_options;
  v10->_options = (id)v15;

  v13 = v20;
  if (v10->_options || v20 == 1)
  {
LABEL_12:
    v18 = v10;
  }
  else
  {
LABEL_13:
    if (a5)
      *a5 = v13;
    v18 = 0;
  }

  return v18;
}

- (id)info
{
  return self->_info;
}

- (id)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_options, 0);
  objc_storeStrong(&self->_info, 0);
}

@end
