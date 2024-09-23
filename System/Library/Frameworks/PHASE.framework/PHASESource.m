@implementation PHASESource

- (PHASESource)init
{
  -[PHASESource doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (PHASESource)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (PHASESource)initWithEngine:(PHASEEngine *)engine
{
  PHASEEngine *v4;
  PHASESource *v5;
  uint64_t v6;
  NSArray *shapes;
  objc_super v9;

  v4 = engine;
  v9.receiver = self;
  v9.super_class = (Class)PHASESource;
  v5 = -[PHASEObject initWithEngine:entityType:shapes:](&v9, sel_initWithEngine_entityType_shapes_, v4, 3, 0);
  if (v5)
  {
    v6 = objc_opt_new();
    shapes = v5->_shapes;
    v5->_shapes = (NSArray *)v6;

    v5->_gain = 1.0;
    v5->_dopplerFactor = 1.0;
    v5->_spatialResolution = 1.0;
    *(_OWORD *)v5->_velocity = 0u;
  }

  return v5;
}

- (PHASESource)initWithEngine:(PHASEEngine *)engine shapes:(NSArray *)shapes
{
  PHASEEngine *v6;
  NSArray *v7;
  NSArray *v8;
  PHASESource *v9;
  PHASESource *v10;
  uint64_t v11;
  NSArray *v12;
  PHASESource *v13;
  objc_super v15;

  v6 = engine;
  v7 = shapes;
  v8 = v7;
  if (v7 && -[NSArray count](v7, "count"))
  {
    v15.receiver = self;
    v15.super_class = (Class)PHASESource;
    v9 = -[PHASEObject initWithEngine:entityType:shapes:](&v15, sel_initWithEngine_entityType_shapes_, v6, 3, v8);
    v10 = v9;
    if (v9)
    {
      v9->_gain = 1.0;
      v9->_dopplerFactor = 1.0;
      v9->_spatialResolution = 1.0;
      *(_OWORD *)v9->_velocity = 0u;
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
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("API Misuse"), CFSTR("Cannot create a volumetric PHASESource with nil or empty shape array"));
    v13 = 0;
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (-[NSArray count](self->_shapes, "count"))
  {
    v5 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
    -[PHASEObject engine](self, "engine");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHASESource shapes](self, "shapes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithEngine:shapes:", v6, v7);

  }
  else
  {
    v9 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
    -[PHASEObject engine](self, "engine");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v9, "initWithEngine:", v6);
  }

  objc_msgSend(v8, "setGain:", self->_gain);
  objc_msgSend(v8, "setDopplerFactor:", self->_dopplerFactor);
  objc_msgSend(v8, "setVelocity:", *(double *)self->_velocity);
  -[PHASEObject transform](self, "transform");
  objc_msgSend(v8, "setTransform:");
  return v8;
}

- (void)setGain:(double)gain
{
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  double v10;
  uint64_t v11;
  Handle64 v12;
  float v13;
  uint64_t v14;
  void *v15;
  void *v16;
  Phase::Logger *v17;
  NSObject *v18;
  id v19;
  int v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  -[PHASEObject engine](self, "engine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = PHASEGetPropertyBounded<double>(v8, v9, gain, 0.0, 1.0);

    if (self->_gain != v10)
    {
      v11 = *(_QWORD *)(objc_msgSend(v6, "implementation") + 368);
      v12.mData = (unint64_t)-[PHASEObject geoEntityHandle](self, "geoEntityHandle");
      v13 = v10;
      (*(void (**)(uint64_t, Handle64, float))(*(_QWORD *)v11 + 104))(v11, v12, v13);
      self->_gain = v10;
    }
  }
  else
  {
    v14 = *MEMORY[0x24BDD0FC8];
    v26 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid PHASEEngine"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v17)
                                                                                        + 432)));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v16, "objectForKeyedSubscript:", v14);
      v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v20 = 136315650;
      v21 = "PHASESource.mm";
      v22 = 1024;
      v23 = 116;
      v24 = 2080;
      v25 = objc_msgSend(v19, "UTF8String");
      _os_log_impl(&dword_2164CC000, v18, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", (uint8_t *)&v20, 0x1Cu);

    }
  }

}

- (void)setDopplerFactor:(double)a3
{
  objc_class *v6;
  void *v7;
  id v8;

  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_dopplerFactor = PHASEGetPropertyBounded<double>(v8, v7, a3, 0.0, 1.79769313e308);

}

- (void)setSpatialResolution:(double)a3
{
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)self) + 432));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "PHASESource.mm";
    v6 = 1024;
    v7 = 140;
    _os_log_impl(&dword_2164CC000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d This value is deprecated. It no longer has any effect on the engine. Ignoring request.", (uint8_t *)&v4, 0x12u);
  }
}

- (double)spatialResolution
{
  return self->_spatialResolution;
}

- (double)gain
{
  return self->_gain;
}

- (NSArray)shapes
{
  return self->_shapes;
}

- (double)dopplerFactor
{
  return self->_dopplerFactor;
}

- (__n128)velocity
{
  return a1[10];
}

- (void)setVelocity:(PHASESource *)self
{
  __int128 v2;

  *(_OWORD *)self->_velocity = v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shapes, 0);
}

@end
