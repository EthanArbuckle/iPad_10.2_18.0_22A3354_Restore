@implementation _ANEIOSurfaceOutputSets

+ (id)objectWithstatsSurRef:(__IOSurface *)a3 outputBuffer:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithstatsSurRef:outputBuffer:", a3, v6);

  return v7;
}

+ (id)new
{
  return 0;
}

- (_ANEIOSurfaceOutputSets)init
{

  return 0;
}

- (_ANEIOSurfaceOutputSets)initWithstatsSurRef:(__IOSurface *)a3 outputBuffer:(id)a4
{
  id v7;
  void *v8;
  _ANEIOSurfaceOutputSets *v9;
  _ANEIOSurfaceOutputSets *v10;
  _ANEIOSurfaceOutputSets *v11;
  objc_super v13;

  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (a3 && v7)
  {
    v13.receiver = self;
    v13.super_class = (Class)_ANEIOSurfaceOutputSets;
    v10 = -[_ANEIOSurfaceOutputSets init](&v13, sel_init);
    v11 = v10;
    if (v10)
    {
      v10->_statsSurRef = a3;
      objc_storeStrong((id *)&v10->_outputBuffer, a4);
    }
    self = v11;
    v9 = self;
  }

  return v9;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)_ANEIOSurfaceOutputSets;
  -[_ANEIOSurfaceOutputSets dealloc](&v2, sel_dealloc);
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
  v6 = -[_ANEIOSurfaceOutputSets statsSurRef](self, "statsSurRef");
  -[_ANEIOSurfaceOutputSets outputBuffer](self, "outputBuffer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { statsSurRef=%@ ; outputBuffer=%@}"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id XPCObject;

  v4 = a3;
  XPCObject = IOSurfaceCreateXPCObject(-[_ANEIOSurfaceOutputSets statsSurRef](self, "statsSurRef"));
  objc_msgSend(v4, "encodeXPCObject:forKey:", XPCObject, CFSTR("statsSurRef"));
  -[_ANEIOSurfaceOutputSets outputBuffer](self, "outputBuffer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("outputs"));

}

- (_ANEIOSurfaceOutputSets)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  IOSurfaceRef v10;
  _ANEIOSurfaceOutputSets *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("outputs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeXPCObjectForKey:", CFSTR("statsSurRef"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = IOSurfaceLookupFromXPCObject(v9);
    self = -[_ANEIOSurfaceOutputSets initWithstatsSurRef:outputBuffer:](self, "initWithstatsSurRef:outputBuffer:", v10, v8);
    CFRelease(v10);
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (__IOSurface)statsSurRef
{
  return self->_statsSurRef;
}

- (NSArray)outputBuffer
{
  return self->_outputBuffer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputBuffer, 0);
}

@end
