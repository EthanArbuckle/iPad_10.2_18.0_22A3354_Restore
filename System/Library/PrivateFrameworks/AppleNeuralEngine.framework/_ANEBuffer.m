@implementation _ANEBuffer

+ (id)bufferWithIOSurfaceObject:(id)a3 symbolIndex:(id)a4 source:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIOSurfaceObject:symbolIndex:source:", v9, v8, a5);

  return v10;
}

+ (id)new
{
  return 0;
}

- (_ANEBuffer)init
{

  return 0;
}

- (_ANEBuffer)initWithIOSurfaceObject:(id)a3 symbolIndex:(id)a4 source:(int64_t)a5
{
  id v9;
  id v10;
  _ANEBuffer *v11;
  _ANEBuffer *v12;
  _ANEBuffer *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  if (v9)
  {
    v15.receiver = self;
    v15.super_class = (Class)_ANEBuffer;
    v11 = -[_ANEBuffer init](&v15, sel_init);
    v12 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_ioSurfaceObject, a3);
      objc_storeStrong((id *)&v12->_symbolIndex, a4);
      v12->_source = a5;
    }
    self = v12;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ANEBuffer ioSurfaceObject](self, "ioSurfaceObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ANEBuffer symbolIndex](self, "symbolIndex");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { ANEIOSurfaceObject=%@ ; symbolIndex=%@ ; ANEBufferProducerAgent=%lu}"),
    v5,
    v6,
    v7,
    -[_ANEBuffer source](self, "source"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_ANEBuffer ioSurfaceObject](self, "ioSurfaceObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("ioSurfaceObject"));

  -[_ANEBuffer symbolIndex](self, "symbolIndex");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeInteger:forKey:", objc_msgSend(v5, "longValue"), CFSTR("symbolIndex"));

  objc_msgSend(v6, "encodeInteger:forKey:", -[_ANEBuffer source](self, "source"), CFSTR("source"));
}

- (_ANEBuffer)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _ANEBuffer *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6, v13, v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("ioSurfaceObject"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("symbolIndex"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("source"));

  v11 = -[_ANEBuffer initWithIOSurfaceObject:symbolIndex:source:](self, "initWithIOSurfaceObject:symbolIndex:source:", v8, v9, v10);
  return v11;
}

- (_ANEIOSurfaceObject)ioSurfaceObject
{
  return self->_ioSurfaceObject;
}

- (NSNumber)symbolIndex
{
  return self->_symbolIndex;
}

- (int64_t)source
{
  return self->_source;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolIndex, 0);
  objc_storeStrong((id *)&self->_ioSurfaceObject, 0);
}

@end
