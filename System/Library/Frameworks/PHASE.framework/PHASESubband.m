@implementation PHASESubband

- (PHASESubband)init
{
  -[PHASESubband doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (id)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (PHASESubband)initWithFrequency:(float)a3 value:(float)a4
{
  PHASESubband *v5;
  PHASESubband *v7;
  PHASESubband *v8;
  NSObject *v9;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  double v17;
  uint64_t v18;

  v5 = self;
  v18 = *MEMORY[0x24BDAC8D0];
  if (a3 <= 0.0)
  {
    v9 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)self) + 432));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v13 = "PHASEMaterial.mm";
      v14 = 1024;
      v15 = 102;
      v16 = 2048;
      v17 = a3;
      _os_log_impl(&dword_2164CC000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d [PHASESubband:initWithFrequency:value]: Invalid frequency: %2.2f. Values must be positive.", buf, 0x1Cu);
    }
    v8 = 0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)PHASESubband;
    v7 = -[PHASESubband init](&v11, sel_init);
    if (v7)
    {
      v7->_frequency = a3;
      v7->_value = a4;
    }
    v5 = v7;
    v8 = v5;
  }

  return v8;
}

- (float)frequency
{
  return self->_frequency;
}

- (float)value
{
  return self->_value;
}

@end
