@implementation PHASERootObject

- (PHASERootObject)init
{
  -[PHASERootObject doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (id)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (PHASERootObject)initWithEngine:(id)a3 entityType:(unsigned int)a4 shapes:(id)a5
{
  -[PHASERootObject doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, *(_QWORD *)&a4, a5);

  return 0;
}

- (PHASERootObject)initWithEngine:(id)a3
{
  id v4;
  PHASERootObject *v5;
  PHASERootObject *v6;
  void *v7;
  uint64_t v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PHASERootObject;
  v5 = -[PHASEObject initWithEngine:entityType:shapes:](&v10, sel_initWithEngine_entityType_shapes_, v4, 0, 0);
  v6 = v5;
  if (v5)
  {
    -[PHASEObject engine](v5, "engine");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "implementation");
    -[PHASEObject setGeoEntityHandle:](v6, "setGeoEntityHandle:", (*(uint64_t (**)(_QWORD))(**(_QWORD **)(v8 + 368) + 72))(*(_QWORD *)(v8 + 368)));

  }
  return v6;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PHASERootObject;
  -[PHASEObject dealloc](&v2, sel_dealloc);
}

- (void)setParent:(id)a3
{
  NSObject *v3;
  std::runtime_error *exception;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)a3) + 432));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v5 = 136315394;
    v6 = "PHASERootObject.mm";
    v7 = 1024;
    v8 = 66;
    _os_log_impl(&dword_2164CC000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error): \"Error: Do not set the parent of a Root Object.\", (uint8_t *)&v5, 0x12u);
  }
  exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
  std::runtime_error::runtime_error(exception, "Error: Do not set the parent of a Root Object.");
}

- (void)setTransform:(Phase::Logger *)a1
{
  NSObject *v1;
  std::runtime_error *exception;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v1 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(a1) + 432));
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
  {
    v3 = 136315394;
    v4 = "PHASERootObject.mm";
    v5 = 1024;
    v6 = 71;
    _os_log_impl(&dword_2164CC000, v1, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error): \"Error: Do not set the transform of a Root Object.\", (uint8_t *)&v3, 0x12u);
  }
  exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
  std::runtime_error::runtime_error(exception, "Error: Do not set the transform of a Root Object.");
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSObject *v3;
  std::runtime_error *exception;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)self) + 432));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v5 = 136315394;
    v6 = "PHASERootObject.mm";
    v7 = 1024;
    v8 = 76;
    _os_log_impl(&dword_2164CC000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error): \"Error: Do not clone a PHASERootObject.\", (uint8_t *)&v5, 0x12u);
  }
  exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
  std::runtime_error::runtime_error(exception, "Error: Do not clone a PHASERootObject.");
}

@end
