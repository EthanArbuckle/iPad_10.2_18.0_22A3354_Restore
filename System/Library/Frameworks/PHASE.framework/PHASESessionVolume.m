@implementation PHASESessionVolume

- (PHASESessionVolume)initWithValue:(float)a3 unit:(int64_t)a4
{
  return -[PHASESessionVolume initWithValue:unit:muted:](self, "initWithValue:unit:muted:", a4, 0);
}

- (PHASESessionVolume)initWithValue:(float)a3 unit:(int64_t)a4 muted:(BOOL)a5
{
  PHASESessionVolume *v8;
  PHASESessionVolume *v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  float v14;
  float v15;
  NSObject *v16;
  objc_super v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  double v24;
  __int16 v25;
  double v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v18.receiver = self;
  v18.super_class = (Class)PHASESessionVolume;
  v8 = -[PHASESessionVolume init](&v18, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_value = a3;
    v8->_unit = a4;
    v8->_muted = a5;
    if (a4)
    {
      v10 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)v8) + 432));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        v20 = "PHASESessionVolume.mm";
        v21 = 1024;
        v22 = 48;
        v23 = 2048;
        v24 = *(double *)&a4;
        v25 = 2048;
        v26 = a3;
        v11 = "%25s:%-5d Error: unimplemented volume unit %ld, value %f";
        v12 = v10;
        v13 = OS_LOG_TYPE_ERROR;
LABEL_13:
        _os_log_impl(&dword_2164CC000, v12, v13, v11, buf, 0x26u);
      }
    }
    else
    {
      v14 = 1.0;
      if (a3 <= 1.0)
        v14 = a3;
      if (a3 >= 0.0)
        v15 = v14;
      else
        v15 = 0.0;
      if (v15 != a3)
      {
        v16 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)v8) + 432));
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          v20 = "PHASESessionVolume.mm";
          v21 = 1024;
          v22 = 41;
          v23 = 2048;
          v24 = a3;
          v25 = 2048;
          v26 = v15;
          v11 = "%25s:%-5d Warning: clamping scalar volume %f to %f";
          v12 = v16;
          v13 = OS_LOG_TYPE_DEFAULT;
          goto LABEL_13;
        }
      }
    }
  }
  return v9;
}

- (id)description
{
  const char *v2;

  if (self->_unit)
    v2 = "unknown";
  else
    v2 = "scalar";
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.3f %s"), self->_value, v2);
}

- (float)value
{
  return self->_value;
}

- (int64_t)unit
{
  return self->_unit;
}

- (BOOL)muted
{
  return self->_muted;
}

@end
