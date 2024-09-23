@implementation PHASENumberMetaParameterDefinition

- (double)rangeMin
{
  return self->_minimum;
}

- (double)rangeMax
{
  return self->_maximum;
}

- (PHASENumberMetaParameterDefinition)init
{
  -[PHASENumberMetaParameterDefinition doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (PHASENumberMetaParameterDefinition)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (PHASENumberMetaParameterDefinition)initWithValue:(double)value identifier:(NSString *)identifier
{
  NSString *v6;
  PHASENumberMetaParameterDefinition *v7;
  PHASENumberMetaParameterDefinition *v8;
  PHASENumberMetaParameterDefinition *v9;

  v6 = identifier;
  v7 = -[PHASENumberMetaParameterDefinition initWithValue:minimum:maximum:](self, "initWithValue:minimum:maximum:", value, -INFINITY, INFINITY);
  v8 = v7;
  if (v7)
  {
    -[PHASEDefinition setIdentifier:](v7, "setIdentifier:", v6);
    v9 = v8;
  }

  return v8;
}

- (PHASENumberMetaParameterDefinition)initWithValue:(double)value
{
  PHASENumberMetaParameterDefinition *v3;
  PHASENumberMetaParameterDefinition *v4;
  PHASENumberMetaParameterDefinition *v5;

  v3 = -[PHASENumberMetaParameterDefinition initWithValue:minimum:maximum:](self, "initWithValue:minimum:maximum:", value, -INFINITY, INFINITY);
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

- (PHASENumberMetaParameterDefinition)initWithValue:(double)value minimum:(double)minimum maximum:(double)maximum identifier:(NSString *)identifier
{
  NSString *v10;
  PHASENumberMetaParameterDefinition *v11;
  PHASENumberMetaParameterDefinition *v12;
  PHASENumberMetaParameterDefinition *v13;

  v10 = identifier;
  v11 = -[PHASENumberMetaParameterDefinition initWithValue:minimum:maximum:](self, "initWithValue:minimum:maximum:", value, minimum, maximum);
  v12 = v11;
  if (v11)
  {
    -[PHASEDefinition setIdentifier:](v11, "setIdentifier:", v10);
    v13 = v12;
  }

  return v12;
}

- (PHASENumberMetaParameterDefinition)initWithValue:(double)value minimum:(double)minimum maximum:(double)maximum
{
  void *v9;
  PHASENumberMetaParameterDefinition *v10;
  Phase::Logger *v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  PHASENumberMetaParameterDefinition *v16;
  NSObject *v17;
  objc_super v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  double v25;
  __int16 v26;
  double v27;
  __int16 v28;
  double v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19.receiver = self;
  v19.super_class = (Class)PHASENumberMetaParameterDefinition;
  v10 = -[PHASEMetaParameterDefinition initWithValue:](&v19, sel_initWithValue_, v9);

  if (!v10)
    goto LABEL_11;
  if (minimum > maximum)
  {
    v12 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v11) + 432));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v21 = "PHASEMetaParameter.mm";
      v22 = 1024;
      v23 = 123;
      v24 = 2048;
      v25 = minimum;
      v26 = 2048;
      v27 = maximum;
      v13 = "%25s:%-5d PHASENumberMetaParameterDefinition:initWithValue: was called with a minimum %f > maximum %f";
      v14 = v12;
      v15 = 38;
LABEL_10:
      _os_log_impl(&dword_2164CC000, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if (value < minimum || value > maximum)
  {
    v17 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v11) + 432));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v21 = "PHASEMetaParameter.mm";
      v22 = 1024;
      v23 = 131;
      v24 = 2048;
      v25 = value;
      v26 = 2048;
      v27 = minimum;
      v28 = 2048;
      v29 = maximum;
      v13 = "%25s:%-5d PHASENumberMetaParameterDefinition:initWithValue: was called with a value %f out-of-range [%f, %f]";
      v14 = v17;
      v15 = 48;
      goto LABEL_10;
    }
LABEL_11:
    v16 = 0;
    goto LABEL_12;
  }
  v10->_minimum = minimum;
  v10->_maximum = maximum;
  v16 = v10;
LABEL_12:

  return v16;
}

- (double)minimum
{
  return self->_minimum;
}

- (double)maximum
{
  return self->_maximum;
}

@end
