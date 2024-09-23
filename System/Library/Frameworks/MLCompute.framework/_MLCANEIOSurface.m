@implementation _MLCANEIOSurface

+ (void)initialize
{
  if (initialize_onceToken != -1)
    dispatch_once(&initialize_onceToken, &__block_literal_global_0);
}

+ (id)objectWithDataLength:(unint64_t)a3 liveIOStatus:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDataLength:liveIOStatus:", a3, v6);

  return v7;
}

- (_MLCANEIOSurface)initWithDataLength:(unint64_t)a3 liveIOStatus:(id)a4
{
  id v8;
  NSObject *v9;
  _MLCANEIOSurface *v10;
  id *p_isa;
  _MLCANEIOSurface *v12;
  NSObject *v13;
  objc_super v15;

  v8 = a4;
  if (!gIsAppleNeuralEngineAvailable)
  {
    +[MLCLog framework](MLCLog, "framework");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[_MLCANEIOSurface initWithDataLength:liveIOStatus:].cold.1(a2);
    goto LABEL_11;
  }
  -[_MLCANEIOSurface aneIOSurfaceObjectWithDataLength:](self, "aneIOSurfaceObjectWithDataLength:", a3);
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    +[MLCLog framework](MLCLog, "framework");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[_MLCANEIOSurface initWithDataLength:liveIOStatus:].cold.2(a2);

LABEL_11:
    v12 = 0;
    goto LABEL_12;
  }
  v15.receiver = self;
  v15.super_class = (Class)_MLCANEIOSurface;
  v10 = -[_MLCANEIOSurface init](&v15, sel_init);
  p_isa = (id *)&v10->super.isa;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_ioSurfaceObject, v9);
    objc_storeStrong(p_isa + 2, a4);
  }
  self = p_isa;
  v12 = self;
LABEL_12:

  return v12;
}

- (__IOSurface)createIOSurface1x1WithLength:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFDictionary *Copy;
  __IOSurface *v9;

  v4 = (void *)MEMORY[0x1D8263D2C](self, a2);
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CBC1E0]);

  objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E98441A0, *MEMORY[0x1E0CBC008]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CBBF08]);

  Copy = CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFDictionaryRef)v5);
  v9 = IOSurfaceCreate(Copy);
  CFRelease(Copy);

  objc_autoreleasePoolPop(v4);
  return v9;
}

- (id)aneIOSurfaceObjectWithDataLength:(unint64_t)a3
{
  __IOSurface *v4;
  __IOSurface *v5;
  void *v6;
  NSObject *v7;

  v4 = -[_MLCANEIOSurface createIOSurface1x1WithLength:](self, "createIOSurface1x1WithLength:", a3);
  if (v4)
  {
    v5 = v4;
    objc_msgSend(softLinkClass_ANEIOSurfaceObject(), "objectWithIOSurface:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v5);
  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[_MLCANEIOSurface aneIOSurfaceObjectWithDataLength:].cold.1(a2);

    v6 = 0;
  }
  return v6;
}

- (_ANEIOSurfaceObject)ioSurfaceObject
{
  return self->_ioSurfaceObject;
}

- (NSDictionary)liveIOStatus
{
  return self->_liveIOStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_liveIOStatus, 0);
  objc_storeStrong((id *)&self->_ioSurfaceObject, 0);
}

- (void)initWithDataLength:(const char *)a1 liveIOStatus:.cold.1(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: AppleNeuralEngine framework is not available", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithDataLength:(const char *)a1 liveIOStatus:.cold.2(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: failed to create an IOSurface object", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

- (void)aneIOSurfaceObjectWithDataLength:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: failed to allocate an IOSurface", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

@end
