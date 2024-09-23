@implementation MTLSharedEventHandle

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unsigned)eventPort
{
  return *(_DWORD *)self->_priv;
}

- (NSString)label
{
  return (NSString *)*((_QWORD *)self->_priv + 1);
}

- (unint64_t)labelTraceID
{
  return *((_QWORD *)self->_priv + 2);
}

- (MTLSharedEventHandle)initWithSharedEvent:(id)a3
{
  MTLSharedEventHandle *v4;
  mach_port_name_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTLSharedEventHandle;
  v4 = -[MTLSharedEventHandle init](&v7, sel_init);
  if (v4)
  {
    v4->_priv = (MTLSharedEventHandlePrivate *)malloc_type_calloc(0x18uLL, 1uLL, 0x19336689uLL);
    v5 = objc_msgSend(a3, "eventPort");
    *(_DWORD *)v4->_priv = v5;
    if (mach_port_mod_refs(*MEMORY[0x1E0C83DA0], v5, 0, 1))
    {
      *(_DWORD *)v4->_priv = 0;

      return 0;
    }
    else
    {
      *((_QWORD *)v4->_priv + 1) = objc_msgSend((id)objc_msgSend(a3, "label"), "copy");
      *((_QWORD *)v4->_priv + 2) = objc_msgSend(a3, "labelTraceID");
    }
  }
  return v4;
}

- (void)dealloc
{
  MTLSharedEventHandlePrivate *priv;
  objc_super v4;

  priv = self->_priv;
  if (priv)
  {
    if (*(_DWORD *)priv)
    {
      mach_port_mod_refs(*MEMORY[0x1E0C83DA0], *(_DWORD *)priv, 0, -1);
      priv = self->_priv;
    }

    free(self->_priv);
  }
  v4.receiver = self;
  v4.super_class = (Class)MTLSharedEventHandle;
  -[MTLSharedEventHandle dealloc](&v4, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  void *v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("This object may only be encoded by an NSXPCCoder."));
  v5 = (void *)xpc_mach_send_create();
  objc_msgSend(a3, "encodeXPCObject:forKey:", v5, CFSTR("Port"));
  xpc_release(v5);
  objc_msgSend(a3, "encodeObject:forKey:", *((_QWORD *)self->_priv + 1), CFSTR("Label"));
}

- (MTLSharedEventHandle)initWithCoder:(id)a3
{
  MTLSharedEventHandle *v4;
  int v5;

  v4 = self;
  self->_priv = (MTLSharedEventHandlePrivate *)malloc_type_calloc(0x18uLL, 1uLL, 0x1ACCD444uLL);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("This object may only be decoded by an NSXPCCoder."));
  if (objc_msgSend(a3, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C81338], CFSTR("Port"))
    && (v5 = xpc_mach_send_copy_right()) != 0)
  {
    *(_DWORD *)v4->_priv = v5;
    *((_QWORD *)v4->_priv + 1) = (id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Label"));
  }
  else
  {

    return 0;
  }
  return v4;
}

@end
