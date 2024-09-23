@implementation PHASEOccluder

- (PHASEOccluder)init
{
  -[PHASEOccluder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (PHASEOccluder)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (PHASEOccluder)initWithEngine:(PHASEEngine *)engine shapes:(NSArray *)shapes
{
  PHASEEngine *v6;
  NSArray *v7;
  NSArray *v8;
  PHASEOccluder *v9;
  PHASEOccluder *v10;
  uint64_t v11;
  NSArray *v12;
  PHASEOccluder *v13;
  objc_super v15;

  v6 = engine;
  v7 = shapes;
  v8 = v7;
  if (v7 && -[NSArray count](v7, "count"))
  {
    v15.receiver = self;
    v15.super_class = (Class)PHASEOccluder;
    v9 = -[PHASEObject initWithEngine:entityType:shapes:](&v15, sel_initWithEngine_entityType_shapes_, v6, 4, v8);
    v10 = v9;
    if (v9)
    {
      v9->_materialScaleFactor = 1.0;
      v9->_isStatic = 0;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v8);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v10->_shapes;
      v10->_shapes = (NSArray *)v11;

    }
    self = v10;
    v13 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("API Misuse"), CFSTR("Cannot create a PHASEOccluder with nil or empty shape array"));
    v13 = 0;
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[PHASEObject engine](self, "engine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHASEOccluder shapes](self, "shapes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithEngine:shapes:", v5, v6);

  *(float *)&v8 = self->_materialScaleFactor;
  objc_msgSend(v7, "setMaterialScaleFactor:", v8);
  objc_msgSend(v7, "setIsStatic:", self->_isStatic);
  -[PHASEObject transform](self, "transform");
  objc_msgSend(v7, "setTransform:");
  return v7;
}

- (void)setIsStatic:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  Phase::Logger *v11;
  NSObject *v12;
  id v13;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[2];

  v3 = a3;
  v21[1] = *MEMORY[0x24BDAC8D0];
  -[PHASEObject engine](self, "engine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if (self->_isStatic != v3)
    {
      v7 = *(_QWORD *)(objc_msgSend(v5, "implementation") + 368);
      (*(void (**)(uint64_t, uint64_t, _BOOL8))(*(_QWORD *)v7 + 224))(v7, -[PHASEObject geoEntityHandle](self, "geoEntityHandle"), v3);
      self->_isStatic = v3;
    }
  }
  else
  {
    v8 = *MEMORY[0x24BDD0FC8];
    v20 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid PHASEEngine"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v11)
                                                                                        + 432)));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", v8);
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v14 = 136315650;
      v15 = "PHASEOccluder.mm";
      v16 = 1024;
      v17 = 83;
      v18 = 2080;
      v19 = objc_msgSend(v13, "UTF8String");
      _os_log_impl(&dword_2164CC000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", (uint8_t *)&v14, 0x1Cu);

    }
  }

}

- (NSArray)shapes
{
  return self->_shapes;
}

- (float)materialScaleFactor
{
  return self->_materialScaleFactor;
}

- (void)setMaterialScaleFactor:(float)a3
{
  self->_materialScaleFactor = a3;
}

- (BOOL)isStatic
{
  return self->_isStatic;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shapes, 0);
}

@end
