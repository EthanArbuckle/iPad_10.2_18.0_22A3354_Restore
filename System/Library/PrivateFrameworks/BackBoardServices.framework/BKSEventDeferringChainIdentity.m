@implementation BKSEventDeferringChainIdentity

- (id)_initWithCopyOf:(id *)a1
{
  id *v3;
  id *v4;

  v3 = a2;
  if (a1)
  {
    v4 = (id *)-[BKSEventDeferringChainIdentity _init](a1);
    a1 = v4;
    if (v4)
    {
      objc_storeStrong(v4 + 1, v3[1]);
      objc_storeStrong(a1 + 2, v3[2]);
    }
  }

  return a1;
}

- (id)_init
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  objc_super v5;

  if (result)
  {
    v1 = result;
    v2 = objc_opt_class();
    if (v2 != objc_opt_class())
    {
      v3 = objc_opt_class();
      if (v3 != objc_opt_class())
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", sel__init, v1, CFSTR("BKSEventDeferringChainIdentity.m"), 63, CFSTR("BKSEventDeferringChainIdentity cannot be subclassed"));

      }
    }
    v5.receiver = v1;
    v5.super_class = (Class)BKSEventDeferringChainIdentity;
    return objc_msgSendSuper2(&v5, sel_init);
  }
  return result;
}

- (BKSEventDeferringChainIdentity)initWithDisplay:(id)a3 environment:(id)a4
{
  id v6;
  id v7;
  BKSEventDeferringChainIdentity *v8;

  v6 = a3;
  v7 = a4;
  v8 = (BKSEventDeferringChainIdentity *)-[BKSEventDeferringChainIdentity _init](self);
  if (v8)
  {
    if (!v6)
    {
      +[BKSHIDEventDisplay nullDisplay](BKSHIDEventDisplay, "nullDisplay");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v8->_display, v6);
    objc_storeStrong((id *)&v8->_environment, a4);
  }

  return v8;
}

- (BKSEventDeferringChainIdentity)init
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[BKSEventDeferringChainIdentity init]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("BKSEventDeferringChainIdentity.m"), 52, CFSTR("cannot directly allocate BKSEventDeferringChainIdentity"));

  return 0;
}

- (BKSEventDeferringChainIdentity)initWithCoder:(id)a3
{
  id v3;
  BKSEventDeferringChainIdentity *v4;
  uint64_t v5;
  BKSHIDEventDisplay *display;
  uint64_t v7;
  BKSHIDEventDeferringEnvironment *environment;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BKSEventDeferringChainIdentity;
  v3 = a3;
  v4 = -[BKSEventDeferringChainIdentity init](&v10, sel_init);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("display"), v10.receiver, v10.super_class);
  v5 = objc_claimAutoreleasedReturnValue();
  display = v4->_display;
  v4->_display = (BKSHIDEventDisplay *)v5;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("environment"));
  v7 = objc_claimAutoreleasedReturnValue();

  environment = v4->_environment;
  v4->_environment = (BKSHIDEventDeferringEnvironment *)v7;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  BKSHIDEventDisplay *display;
  BKSHIDEventDeferringEnvironment *environment;
  id v7;

  v4 = a3;
  display = self->_display;
  v7 = v4;
  if (display)
  {
    objc_msgSend(v4, "encodeObject:forKey:", display, CFSTR("display"));
    v4 = v7;
  }
  environment = self->_environment;
  if (environment)
  {
    objc_msgSend(v7, "encodeObject:forKey:", environment, CFSTR("environment"));
    v4 = v7;
  }

}

- (unint64_t)hash
{
  -[BKSHIDEventDisplay hash](self->_display, "hash");
  -[BKSHIDEventDeferringEnvironment hash](self->_environment, "hash");
  return BSHashPurifyNS();
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  id v4;
  char v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    if (BSEqualObjects())
      v5 = BSEqualObjects();
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[BKSEventDeferringChainIdentity _initWithCopyOf:]((id *)[BKSMutableEventDeferringChainIdentity alloc], self);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;
  id v6;

  v6 = a3;
  v4 = (id)objc_msgSend(v6, "appendObject:withName:", self->_environment, 0);
  v5 = (id)objc_msgSend(v6, "appendObject:withName:", self->_display, CFSTR("display"));

}

- (id)didFinishProtobufDecodingWithError:(id *)a3
{
  BKSEventDeferringChainIdentity *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  if (!self->_display)
  {
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v6 = *MEMORY[0x1E0CB2FE0];
    v7 = &unk_1E1EBC598;
LABEL_6:
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, 5, v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v4 = 0;
    *a3 = v8;
    return v4;
  }
  if (!self->_environment)
  {
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v6 = *MEMORY[0x1E0CB2FE0];
    v7 = &unk_1E1EBC5C0;
    goto LABEL_6;
  }
  v4 = self;
  return v4;
}

- (BKSHIDEventDisplay)display
{
  return self->_display;
}

- (BKSHIDEventDeferringEnvironment)environment
{
  return self->_environment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_display, 0);
}

+ (id)build:(id)a3
{
  void (**v3)(id, id);
  id v4;
  void *v5;

  v3 = (void (**)(id, id))a3;
  v4 = -[BKSEventDeferringChainIdentity _init]([BKSMutableEventDeferringChainIdentity alloc]);
  v3[2](v3, v4);

  v5 = (void *)objc_msgSend(v4, "copy");
  return v5;
}

+ (BKSEventDeferringChainIdentity)new
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[BKSEventDeferringChainIdentity new]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("BKSEventDeferringChainIdentity.m"), 57, CFSTR("cannot directly allocate BKSEventDeferringChainIdentity"));

  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)protobufSchema
{
  return (id)objc_msgSend(MEMORY[0x1E0D01838], "buildSchemaForClass:builder:", a1, &__block_literal_global_8794);
}

void __48__BKSEventDeferringChainIdentity_protobufSchema__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "addField:", "_display");
  objc_msgSend(v2, "addField:", "_environment");

}

@end
