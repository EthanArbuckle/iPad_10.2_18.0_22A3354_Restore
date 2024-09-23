@implementation MTLSharedTextureHandle

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MTLSharedTextureHandle)initWithIOSurface:(__IOSurface *)a3 label:(id)a4
{
  MTLSharedTextureHandle *v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTLSharedTextureHandle;
  v6 = -[MTLSharedTextureHandle init](&v9, sel_init);
  if (v6)
  {
    v6->_priv = (MTLSharedTextureHandlePrivate *)malloc_type_calloc(0x18uLL, 1uLL, 0xDCE91AuLL);
    CFRetain(a3);
    *(_QWORD *)v6->_priv = a3;
    *((_QWORD *)v6->_priv + 2) = objc_msgSend(a4, "copy");
    v7 = _copyIOSurfaceDevice(a3);
    *((_QWORD *)v6->_priv + 1) = v7;
    if (!v7)
    {

      return 0;
    }
  }
  return v6;
}

- (MTLSharedTextureHandle)initWithCoder:(id)a3
{
  id v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTLSharedTextureHandle;
  v4 = -[MTLSharedTextureHandle init](&v7, sel_init);
  if (v4)
  {
    *((_QWORD *)v4 + 1) = malloc_type_calloc(0x18uLL, 1uLL, 0xA210A1FAuLL);
    **((_QWORD **)v4 + 1) = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ioSurface"));
    CFRetain(**((CFTypeRef **)v4 + 1));
    v5 = _copyIOSurfaceDevice(**((__IOSurface ***)v4 + 1));
    *(_QWORD *)(*((_QWORD *)v4 + 1) + 8) = v5;
    if (v5)
    {
      *(_QWORD *)(*((_QWORD *)v4 + 1) + 16) = (id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("label"));
    }
    else
    {

      return 0;
    }
  }
  return (MTLSharedTextureHandle *)v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", *(_QWORD *)self->_priv, CFSTR("ioSurface"));
  objc_msgSend(a3, "encodeObject:forKey:", *((_QWORD *)self->_priv + 2), CFSTR("label"));
}

- (MTLSharedTextureHandle)initWithMachPort:(unsigned int)a3
{
  id v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTLSharedTextureHandle;
  v4 = -[MTLSharedTextureHandle init](&v7, sel_init);
  if (v4)
  {
    *((_QWORD *)v4 + 1) = malloc_type_calloc(0x18uLL, 1uLL, 0xCAF127BCuLL);
    **((_QWORD **)v4 + 1) = IOSurfaceLookupFromMachPort(a3);
    v5 = _copyIOSurfaceDevice(**((__IOSurface ***)v4 + 1));
    *(_QWORD *)(*((_QWORD *)v4 + 1) + 8) = v5;
    if (!v5)
    {

      return 0;
    }
  }
  return (MTLSharedTextureHandle *)v4;
}

- (__IOSurface)ioSurface
{
  return *(__IOSurface **)self->_priv;
}

- (unsigned)createMachPort
{
  return IOSurfaceCreateMachPort(*(IOSurfaceRef *)self->_priv);
}

- (void)dealloc
{
  MTLSharedTextureHandlePrivate *priv;
  CFTypeRef *v4;
  objc_super v5;

  priv = self->_priv;
  if (priv)
  {

    v4 = (CFTypeRef *)self->_priv;
    if (*v4)
    {
      CFRelease(*v4);
      v4 = (CFTypeRef *)self->_priv;
    }
    free(v4);
  }
  v5.receiver = self;
  v5.super_class = (Class)MTLSharedTextureHandle;
  -[MTLSharedTextureHandle dealloc](&v5, sel_dealloc);
}

- (NSString)label
{
  return (NSString *)*((_QWORD *)self->_priv + 2);
}

- (id)device
{
  return (id)*((_QWORD *)self->_priv + 1);
}

@end
