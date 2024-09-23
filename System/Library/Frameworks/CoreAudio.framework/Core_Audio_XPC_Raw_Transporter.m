@implementation Core_Audio_XPC_Raw_Transporter

- (Core_Audio_XPC_Raw_Transporter)initWithObject:(id)a3
{
  id v5;
  Core_Audio_XPC_Raw_Transporter *v6;
  Core_Audio_XPC_Raw_Transporter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)Core_Audio_XPC_Raw_Transporter;
  v6 = -[Core_Audio_XPC_Raw_Transporter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_object, a3);

  return v7;
}

- (Core_Audio_XPC_Raw_Transporter)initWithCoder:(id)a3
{
  id v4;
  Core_Audio_XPC_Raw_Transporter *v5;
  id v6;
  uint64_t v7;
  OS_xpc_object *object;
  OS_xpc_object *v9;
  Core_Audio_XPC_Raw_Transporter *v10;
  objc_super v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99D98], "raise:format:", *MEMORY[0x1E0C99770], CFSTR("This object may only be decoded by an NSXPCCoder."));
  v12.receiver = self;
  v12.super_class = (Class)Core_Audio_XPC_Raw_Transporter;
  v5 = -[Core_Audio_XPC_Raw_Transporter init](&v12, sel_init);
  if (v5)
  {
    v6 = v4;
    objc_msgSend(v6, "decodeXPCObjectForKey:", CFSTR("Core_Audio_XPC_Raw_Transporter"));
    v7 = objc_claimAutoreleasedReturnValue();
    object = v5->_object;
    v5->_object = (OS_xpc_object *)v7;

    if (!v5->_object)
    {

      v10 = 0;
      goto LABEL_10;
    }
    if (MEMORY[0x1B5E5145C]() == MEMORY[0x1E0C81350])
    {
      v9 = v5->_object;
      v5->_object = 0;

    }
  }
  v10 = v5;
LABEL_10:

  return v10;
}

- (void)dealloc
{
  OS_xpc_object *object;
  objc_super v4;

  object = self->_object;
  self->_object = 0;

  v4.receiver = self;
  v4.super_class = (Class)Core_Audio_XPC_Raw_Transporter;
  -[Core_Audio_XPC_Raw_Transporter dealloc](&v4, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99D98], "raise:format:", *MEMORY[0x1E0C99770], CFSTR("This object may only be decoded by an NSXPCCoder."));
  v7 = v4;
  -[Core_Audio_XPC_Raw_Transporter object](self, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[Core_Audio_XPC_Raw_Transporter object](self, "object");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = xpc_null_create();
  }
  objc_msgSend(v7, "encodeXPCObject:forKey:", v6, CFSTR("Core_Audio_XPC_Raw_Transporter"));

}

- (OS_xpc_object)object
{
  return self->_object;
}

- (void)setObject:(id)a3
{
  objc_storeStrong((id *)&self->_object, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_object, 0);
}

+ (id)object:(id)a3
{
  id v3;
  Core_Audio_XPC_Raw_Transporter *v4;

  v3 = a3;
  v4 = -[Core_Audio_XPC_Raw_Transporter initWithObject:]([Core_Audio_XPC_Raw_Transporter alloc], "initWithObject:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
