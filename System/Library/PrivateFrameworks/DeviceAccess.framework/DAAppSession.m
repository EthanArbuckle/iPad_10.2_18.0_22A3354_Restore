@implementation DAAppSession

- (DAAppSession)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6;
  DAAppSession *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  DAAppSession *v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  objc_super v24;

  v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)DAAppSession;
  v7 = -[DAAppSession init](&v24, sel_init);
  if (!v7)
  {
    if (a4)
    {
      v23 = objc_opt_class();
      DAErrorF(350001, (uint64_t)"%@ init failed", v16, v17, v18, v19, v20, v21, v23);
LABEL_9:
      v14 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    }
LABEL_10:
    v14 = 0;
    goto LABEL_4;
  }
  if (MEMORY[0x2199CAB58](v6) != MEMORY[0x24BDACFA0])
  {
    if (a4)
    {
      DAErrorF(350004, (uint64_t)"XPC non-dict", v8, v9, v10, v11, v12, v13, v22);
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  v14 = v7;
LABEL_4:

  return v14;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
