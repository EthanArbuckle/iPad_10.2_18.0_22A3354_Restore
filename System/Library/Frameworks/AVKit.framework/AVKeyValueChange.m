@implementation AVKeyValueChange

- (void).cxx_destruct
{
  objc_storeStrong(&self->_observationToken, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_storeStrong(&self->_oldValue, 0);
  objc_storeStrong(&self->_value, 0);
}

- (AVKeyValueChange)initWithValue:(id)a3 oldValue:(id)a4 keyPath:(id)a5 observationToken:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  AVKeyValueChange *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  NSString *keyPath;
  uint64_t v21;
  id observationToken;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)AVKeyValueChange;
  v14 = -[AVKeyValueChange init](&v24, sel_init);
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (v15 == v10)
      v16 = 0;
    else
      v16 = v10;
    objc_storeStrong(&v14->_value, v16);

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (v17 == v11)
      v18 = 0;
    else
      v18 = v11;
    objc_storeStrong(&v14->_oldValue, v18);

    v19 = objc_msgSend(v12, "copy");
    keyPath = v14->_keyPath;
    v14->_keyPath = (NSString *)v19;

    v21 = objc_msgSend(v13, "copy");
    observationToken = v14->_observationToken;
    v14->_observationToken = (id)v21;

  }
  return v14;
}

- (id)value
{
  return self->_value;
}

- (id)oldValue
{
  return self->_oldValue;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (id)observationToken
{
  return self->_observationToken;
}

@end
