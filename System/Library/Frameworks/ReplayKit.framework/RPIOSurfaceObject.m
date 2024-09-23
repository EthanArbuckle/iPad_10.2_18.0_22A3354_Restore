@implementation RPIOSurfaceObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  __IOSurface *ioSurface;
  xpc_object_t XPCObject;
  id v6;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    ioSurface = self->_ioSurface;
    if (ioSurface)
    {
      XPCObject = IOSurfaceCreateXPCObject(ioSurface);
      objc_msgSend(v6, "encodeXPCObject:forKey:", XPCObject, CFSTR("ioSurface"));

    }
  }

}

- (RPIOSurfaceObject)initWithCoder:(id)a3
{
  id v4;
  RPIOSurfaceObject *v5;
  void *v6;
  void *v7;
  IOSurfaceRef v8;
  RPIOSurfaceObject *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RPIOSurfaceObject;
  v5 = -[RPIOSurfaceObject init](&v11, sel_init);
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "decodeXPCObjectForKey:", CFSTR("ioSurface"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        v8 = IOSurfaceLookupFromXPCObject(v6);
        -[RPIOSurfaceObject setIOSurface:](v5, "setIOSurface:", v8);
        CFRelease(v8);
      }

    }
    v9 = v5;
  }

  return v5;
}

- (void)setIOSurface:(__IOSurface *)a3
{
  __IOSurface *ioSurface;

  ioSurface = self->_ioSurface;
  if (ioSurface != a3)
  {
    if (ioSurface)
      CFRelease(ioSurface);
    self->_ioSurface = a3;
    if (a3)
      CFRetain(a3);
  }
}

- (__IOSurface)ioSurface
{
  return self->_ioSurface;
}

- (void)dealloc
{
  __IOSurface *ioSurface;
  objc_super v4;

  ioSurface = self->_ioSurface;
  if (ioSurface)
    CFRelease(ioSurface);
  v4.receiver = self;
  v4.super_class = (Class)RPIOSurfaceObject;
  -[RPIOSurfaceObject dealloc](&v4, sel_dealloc);
}

@end
