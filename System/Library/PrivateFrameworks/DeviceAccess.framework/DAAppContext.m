@implementation DAAppContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DAAppContext)initWithCoder:(id)a3
{
  id v3;
  DAAppContext *v4;
  void *v5;
  uint64_t v6;
  OS_xpc_object *xpcEndpoint;
  DAAppContext *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)DAAppContext;
  v3 = a3;
  v4 = -[DAAppContext init](&v18, sel_init);
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v3;
    else
      v5 = 0;
    objc_msgSend(v5, "decodeXPCObjectOfType:forKey:", MEMORY[0x24BDACFB0], CFSTR("xpcE"));
    v6 = objc_claimAutoreleasedReturnValue();
    xpcEndpoint = v4->_xpcEndpoint;
    v4->_xpcEndpoint = (OS_xpc_object *)v6;

    v8 = v4;
  }
  else
  {
    v10 = objc_opt_class();
    DAErrorF(350001, (uint64_t)"%@ init failed", v11, v12, v13, v14, v15, v16, v10);
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "failWithError:", v17);

    v3 = (id)v17;
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  char isKindOfClass;
  BOOL v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (self->_xpcEndpoint)
  {
    v5 = (isKindOfClass & 1) == 0;
    v6 = v7;
    if (v5)
      v6 = 0;
    objc_msgSend(v6, "encodeXPCObject:forKey:");
  }

}

- (DAAppContext)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6;
  DAAppContext *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  DAAppContext *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  objc_super v32;

  v6 = a3;
  v32.receiver = self;
  v32.super_class = (Class)DAAppContext;
  v7 = -[DAAppContext init](&v32, sel_init);
  if (!v7)
  {
    if (a4)
    {
      v31 = objc_opt_class();
      DAErrorF(350001, (uint64_t)"%@ init failed", v24, v25, v26, v27, v28, v29, v31);
LABEL_13:
      v22 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
LABEL_14:
    v22 = 0;
    goto LABEL_8;
  }
  if (MEMORY[0x2199CAB58](v6) != MEMORY[0x24BDACFA0])
  {
    if (a4)
    {
      DAErrorF(350004, (uint64_t)"XPC non-dict", v8, v9, v10, v11, v12, v13, v30);
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  xpc_dictionary_get_value(v6, "xpcE");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
  {
    if (MEMORY[0x2199CAB58](v14) != MEMORY[0x24BDACFB0])
    {
      if (a4)
      {
        DAErrorF(350001, (uint64_t)"XPC non-endpoint", v16, v17, v18, v19, v20, v21, v30);
        v22 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v22 = 0;
      }
      goto LABEL_7;
    }
    objc_storeStrong((id *)&v7->_xpcEndpoint, v15);
  }
  v22 = v7;
LABEL_7:

LABEL_8:
  return v22;
}

- (void)encodeWithXPCObject:(id)a3
{
  OS_xpc_object *xpcEndpoint;

  xpcEndpoint = self->_xpcEndpoint;
  if (xpcEndpoint)
    xpc_dictionary_set_value(a3, "xpcE", xpcEndpoint);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (OS_xpc_object)xpcEndpoint
{
  return self->_xpcEndpoint;
}

- (void)setXpcEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_xpcEndpoint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcEndpoint, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
