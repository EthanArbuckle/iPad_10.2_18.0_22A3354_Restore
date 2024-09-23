@implementation REXPCObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REXPCObject)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)REXPCObject;
  return -[REXPCObject init](&v3, sel_init);
}

- (REXPCObject)initWithObject:(id)a3
{
  id v5;
  REXPCObject *v6;
  REXPCObject *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REXPCObject;
  v6 = -[REXPCObject init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_object, a3);

  return v7;
}

- (REXPCObject)initWithCoder:(id)a3
{
  id v4;
  REXPCObject *v5;
  uint64_t v6;
  OS_xpc_object *object;
  REXPCObject *v8;
  __CFString *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)REXPCObject;
  v5 = -[REXPCObject init](&v12, sel_init);
  if (!v5)
    goto LABEL_5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = CFSTR("REXPCObject requires an NSXPCCoder");
LABEL_8:
    objectDecodeError(&v9->isa);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v10);

    v8 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v4, "decodeXPCObjectOfType:forKey:", MEMORY[0x24BDACFA0], CFSTR("object"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v9 = CFSTR("REXPCObject failed to load");
    goto LABEL_8;
  }
  object = v5->_object;
  v5->_object = (OS_xpc_object *)v6;

LABEL_5:
  v8 = v5;
LABEL_9:

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "encodeXPCObject:forKey:", self->_object, CFSTR("object"));
  }
  else
  {
    objectDecodeError(CFSTR("REXPCObject requires an NSXPCCoder"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "failWithError:", v4);

  }
}

- (OS_xpc_object)object
{
  return self->_object;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_object, 0);
}

@end
