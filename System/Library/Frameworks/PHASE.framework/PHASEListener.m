@implementation PHASEListener

- (PHASEListener)init
{
  -[PHASEListener doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (PHASEListener)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (PHASEListener)initWithEngine:(id)a3 entityType:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  PHASEListener *v7;
  PHASEListener *v8;
  NSObject *v9;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  PHASEListener *v17;
  uint64_t v18;

  v4 = *(_QWORD *)&a4;
  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PHASEListener;
  v7 = -[PHASEObject initWithEngine:entityType:shapes:](&v11, sel_initWithEngine_entityType_shapes_, v6, v4, 0);
  v8 = v7;
  if (v7)
  {
    v7->_gain = 1.0;
    v7->_dopplerFactor = 1.0;
    *(_OWORD *)v7->_velocity = 0u;
    v9 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)v7) + 432));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v13 = "PHASEListener.mm";
      v14 = 1024;
      v15 = 58;
      v16 = 2112;
      v17 = v8;
      _os_log_impl(&dword_2164CC000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Created %@", buf, 0x1Cu);
    }
  }

  return v8;
}

- (PHASEListener)initWithEngine:(PHASEEngine *)engine
{
  PHASEEngine *v4;
  PHASEListener *v5;
  PHASEListener *v6;
  NSObject *v7;
  objc_super v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  PHASEListener *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = engine;
  v9.receiver = self;
  v9.super_class = (Class)PHASEListener;
  v5 = -[PHASEObject initWithEngine:entityType:shapes:](&v9, sel_initWithEngine_entityType_shapes_, v4, 2, 0);
  v6 = v5;
  if (v5)
  {
    v5->_gain = 1.0;
    v5->_dopplerFactor = 1.0;
    *(_OWORD *)v5->_velocity = 0u;
    v7 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)v5) + 432));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v11 = "PHASEListener.mm";
      v12 = 1024;
      v13 = 72;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_2164CC000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Created %@", buf, 0x1Cu);
    }
  }

  return v6;
}

- (void)setAutomaticHeadTrackingFlags:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  -[PHASEObject engine](self, "engine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v8 = v5;
    v6 = objc_msgSend(v5, "implementation");
    if (v6)
    {
      v7 = *(_QWORD *)(v6 + 368);
      if (v7)
        (*(void (**)(uint64_t, uint64_t, unint64_t))(*(_QWORD *)v7 + 232))(v7, -[PHASEObject geoEntityHandle](self, "geoEntityHandle"), a3 & 1);
    }
    self->_automaticHeadTrackingFlags = a3;
    v5 = v8;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[PHASEObject engine](self, "engine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithEngine:", v5);

  objc_msgSend(v6, "setGain:", self->_gain);
  objc_msgSend(v6, "setDopplerFactor:", self->_dopplerFactor);
  objc_msgSend(v6, "setVelocity:", *(double *)self->_velocity);
  -[PHASEObject transform](self, "transform");
  objc_msgSend(v6, "setTransform:");
  return v6;
}

- (void)setGain:(double)gain
{
  objc_class *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  Handle64 v13;
  float v14;
  uint64_t v15;
  void *v16;
  void *v17;
  Phase::Logger *v18;
  NSObject *v19;
  id v20;
  int v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = PHASEGetPropertyBounded<double>(v7, v8, gain, 0.0, 1.0);

  -[PHASEObject engine](self, "engine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    if (self->_gain != v9)
    {
      v12 = *(_QWORD *)(objc_msgSend(v10, "implementation") + 368);
      v13.mData = (unint64_t)-[PHASEObject geoEntityHandle](self, "geoEntityHandle");
      v14 = v9;
      (*(void (**)(uint64_t, Handle64, float))(*(_QWORD *)v12 + 112))(v12, v13, v14);
      self->_gain = v9;
    }
  }
  else
  {
    v15 = *MEMORY[0x24BDD0FC8];
    v27 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid PHASEEngine"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v16;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v18)
                                                                                        + 432)));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v17, "objectForKeyedSubscript:", v15);
      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v21 = 136315650;
      v22 = "PHASEListener.mm";
      v23 = 1024;
      v24 = 119;
      v25 = 2080;
      v26 = objc_msgSend(v20, "UTF8String");
      _os_log_impl(&dword_2164CC000, v19, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", (uint8_t *)&v21, 0x1Cu);

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

- (double)gain
{
  return self->_gain;
}

- (unint64_t)automaticHeadTrackingFlags
{
  return self->_automaticHeadTrackingFlags;
}

- (double)dopplerFactor
{
  return self->_dopplerFactor;
}

- (__n128)velocity
{
  return a1[9];
}

- (void)setVelocity:(PHASEListener *)self
{
  __int128 v2;

  *(_OWORD *)self->_velocity = v2;
}

@end
