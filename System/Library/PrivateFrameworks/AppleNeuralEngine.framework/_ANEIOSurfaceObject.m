@implementation _ANEIOSurfaceObject

+ (_ANEIOSurfaceObject)objectWithIOSurface:(__IOSurface *)a3
{
  return (_ANEIOSurfaceObject *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithIOSurface:startOffset:shouldRetain:", a3, &unk_1E951E748, 1);
}

- (_ANEIOSurfaceObject)initWithIOSurface:(__IOSurface *)a3 startOffset:(id)a4 shouldRetain:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  _ANEIOSurfaceObject *v10;
  _ANEIOSurfaceObject *v11;
  objc_super v13;

  v5 = a5;
  v9 = a4;
  if (a3)
  {
    v13.receiver = self;
    v13.super_class = (Class)_ANEIOSurfaceObject;
    v10 = -[_ANEIOSurfaceObject init](&v13, sel_init);
    if (v10)
    {
      if (v5)
        CFRetain(a3);
      v10->_ioSurface = a3;
      objc_storeStrong((id *)&v10->_startOffset, a4);
    }
    self = v10;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (__IOSurface)ioSurface
{
  return self->_ioSurface;
}

- (NSNumber)startOffset
{
  return self->_startOffset;
}

+ (_ANEIOSurfaceObject)objectWithIOSurface:(__IOSurface *)a3 startOffset:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIOSurface:startOffset:shouldRetain:", a3, v6, 1);

  return (_ANEIOSurfaceObject *)v7;
}

+ (_ANEIOSurfaceObject)objectWithIOSurfaceNoRetain:(__IOSurface *)a3 startOffset:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIOSurface:startOffset:shouldRetain:", a3, v6, 0);

  return (_ANEIOSurfaceObject *)v7;
}

+ (_ANEIOSurfaceObject)new
{
  return 0;
}

- (_ANEIOSurfaceObject)init
{

  return 0;
}

- (void)dealloc
{
  __IOSurface *ioSurface;
  objc_super v4;

  ioSurface = self->_ioSurface;
  if (ioSurface)
    CFRelease(ioSurface);
  v4.receiver = self;
  v4.super_class = (Class)_ANEIOSurfaceObject;
  -[_ANEIOSurfaceObject dealloc](&v4, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  __IOSurface *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_ANEIOSurfaceObject ioSurface](self, "ioSurface");
  -[_ANEIOSurfaceObject startOffset](self, "startOffset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { ioSurface=%p ; startOffset=%lu }"),
    v5,
    v6,
    objc_msgSend(v7, "unsignedIntegerValue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  xpc_object_t XPCObject;
  id v5;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && -[_ANEIOSurfaceObject ioSurface](self, "ioSurface"))
  {
    XPCObject = IOSurfaceCreateXPCObject(-[_ANEIOSurfaceObject ioSurface](self, "ioSurface"));
    objc_msgSend(v5, "encodeXPCObject:forKey:", XPCObject, CFSTR("_ANEIOSurface"));

  }
}

- (_ANEIOSurfaceObject)initWithCoder:(id)a3
{
  id v4;
  _ANEIOSurfaceObject *v5;
  _ANEIOSurfaceObject *v6;
  IOSurfaceRef v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "decodeXPCObjectForKey:", CFSTR("_ANEIOSurface"));
    v5 = (_ANEIOSurfaceObject *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = IOSurfaceLookupFromXPCObject(v5);
      self = -[_ANEIOSurfaceObject initWithIOSurface:startOffset:shouldRetain:](self, "initWithIOSurface:startOffset:shouldRetain:", v7, &unk_1E951E748, 1);
      CFRelease(v7);

      v6 = self;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (__IOSurface)createIOSurfaceWithWidth:(int)a3 pixel_size:(int)a4 height:(int)a5
{
  uint64_t v5;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFDictionary *Copy;
  __IOSurface *v14;

  v5 = *(_QWORD *)&a5;
  v7 = *(_QWORD *)&a3;
  v8 = (void *)MEMORY[0x1D824DB90](a1, a2);
  v9 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0CBC1E0]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0CBC008]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (a4 * v7));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0CBBF08]);

  Copy = CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFDictionaryRef)v9);
  v14 = IOSurfaceCreate(Copy);
  CFRelease(Copy);

  objc_autoreleasePoolPop(v8);
  return v14;
}

+ (__IOSurface)createIOSurfaceWithWidth:(int)a3 pixel_size:(int)a4 height:(int)a5 bytesPerElement:(int)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFDictionary *Copy;
  __IOSurface *v17;

  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a5;
  v9 = *(_QWORD *)&a3;
  v10 = (void *)MEMORY[0x1D824DB90](a1, a2);
  v11 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0CBBF00]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0CBC1E0]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0CBC008]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (a4 * v9 * v6));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0CBBF08]);

  Copy = CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFDictionaryRef)v11);
  v17 = IOSurfaceCreate(Copy);
  CFRelease(Copy);

  objc_autoreleasePoolPop(v10);
  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startOffset, 0);
}

@end
