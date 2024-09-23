@implementation MLFeatureValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectValue, 0);
  objc_storeStrong(&self->_value, 0);
}

+ (id)featureValueOfType:(int64_t)a3 fromObject:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  int64_t v12;
  int64_t v13;
  MLSequence *v14;
  void *v15;
  int64_t v16;
  MLSequence *v17;
  void *v18;
  MLSequence *v19;

  v8 = a4;
  if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(a1, "undefinedFeatureValueWithType:", a3);
    v9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_4:
    v10 = v9;
    goto LABEL_5;
  }
  v12 = +[MLFeatureTypeUtils featureTypeForObject:](MLFeatureTypeUtils, "featureTypeForObject:", v8);
  v13 = v12;
  if (v12 == a3 || a3 == 2 && v12 == 1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v8;
      goto LABEL_4;
    }
    if (v13 != 7)
    {
      if (v13 == 6)
      {
        +[MLFeatureValue featureValueWithDictionary:error:](MLFeatureValue, "featureValueWithDictionary:error:", v8, a5);
        v9 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = (id)objc_msgSend(objc_alloc((Class)a1), "initWithValue:type:", v8, a3);
      }
      goto LABEL_4;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = -[MLSequence initWithArray:type:]([MLSequence alloc], "initWithArray:type:", v8, +[MLFeatureTypeUtils featureTypeForValuesInArray:error:](MLFeatureTypeUtils, "featureTypeForValuesInArray:error:", v8, a5));
      +[MLFeatureValue featureValueWithSequence:](MLFeatureValue, "featureValueWithSequence:", v14);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v8, "values");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = +[MLFeatureTypeUtils featureTypeForValuesInArray:error:](MLFeatureTypeUtils, "featureTypeForValuesInArray:error:", v15, a5);

      v17 = [MLSequence alloc];
      objc_msgSend(v8, "values");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[MLSequence initWithArray:type:](v17, "initWithArray:type:", v18, v16);
      +[MLFeatureValue featureValueWithSequence:](MLFeatureValue, "featureValueWithSequence:", v19);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else if (a5)
  {
    +[MLModelErrorUtils featureTypeErrorWithFormat:](MLModelErrorUtils, "featureTypeErrorWithFormat:", CFSTR("Object not consistent with type supplied"));
    v10 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
LABEL_5:

  return v10;
}

+ (MLFeatureValue)featureValueWithMultiArray:(MLMultiArray *)value
{
  MLMultiArray *v4;
  void *v5;

  v4 = value;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithValue:type:", v4, 5);

  return (MLFeatureValue *)v5;
}

- (MLFeatureValue)initWithValue:(id)a3 type:(int64_t)a4
{
  __CVBuffer *v7;
  MLFeatureValue *v8;
  char isKindOfClass;
  _QWORD *v10;
  NSObject *v11;
  __CVBuffer *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  uint8_t v17[16];
  objc_super v18;

  v7 = (__CVBuffer *)a3;
  v18.receiver = self;
  v18.super_class = (Class)MLFeatureValue;
  v8 = -[MLFeatureValue init](&v18, sel_init);
  if (v8)
  {
    if (v7 && a4 == 4)
    {
      CVPixelBufferRetain(v7);
    }
    else if (a4 == 8)
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v10 = (_QWORD *)MEMORY[0x1E0C99778];
      if ((isKindOfClass & 1) == 0)
      {
        +[MLLogging coreChannel](MLLogging, "coreChannel");
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v17 = 0;
        }

      }
      v12 = v7;
      -[__CVBuffer backings](v12, "backings");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

      if (v14 != 1)
      {
        +[MLLogging coreChannel](MLLogging, "coreChannel");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v17 = 0;
          _os_log_error_impl(&dword_19C486000, v15, OS_LOG_TYPE_ERROR, "MLState must have one and only one state buffer when it is stored in MLFeatureValue.", v17, 2u);
        }

        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v10, CFSTR("MLState must have one and only one state buffer when it is stored in MLFeatureValue."));
      }

    }
    objc_storeStrong(&v8->_value, a3);
    v8->_type = a4;
    v8->_undefined = v7 == 0;
  }

  return v8;
}

- (void)dealloc
{
  id value;
  objc_super v4;

  if (self->_type == 4 && !self->_undefined)
  {
    value = self->_value;
    if (value)
      CFRelease(value);
  }
  v4.receiver = self;
  v4.super_class = (Class)MLFeatureValue;
  -[MLFeatureValue dealloc](&v4, sel_dealloc);
}

- (MLMultiArray)multiArrayValue
{
  if (self->_type == 5 && !self->_undefined)
    return (MLMultiArray *)self->_value;
  else
    return (MLMultiArray *)0;
}

- (BOOL)isUndefined
{
  return self->_undefined;
}

- (MLFeatureType)type
{
  return self->_type;
}

- (int64_t)int64Value
{
  if (self->_type == 1 && !self->_undefined)
    return objc_msgSend(self->_value, "longLongValue");
  else
    return 0;
}

- (double)doubleValue
{
  double result;

  if (self->_type != 2 || self->_undefined)
    return 0.0;
  objc_msgSend(self->_value, "doubleValue");
  return result;
}

+ (MLFeatureValue)featureValueWithDouble:(double)value
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", value);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithValue:type:", v5, 2);

  return (MLFeatureValue *)v6;
}

- (MLFeatureValue)initWithUndefinedValueAndType:(int64_t)a3
{
  MLFeatureValue *v4;
  MLFeatureValue *v5;
  id value;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MLFeatureValue;
  v4 = -[MLFeatureValue init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    value = v4->_value;
    v4->_value = 0;

    v5->_type = a3;
    v5->_undefined = 1;
  }
  return v5;
}

- (NSString)stringValue
{
  if (self->_type == 3 && !self->_undefined)
    return (NSString *)self->_value;
  else
    return (NSString *)0;
}

- (NSDictionary)dictionaryValue
{
  if (self->_type == 6 && !self->_undefined)
    return (NSDictionary *)self->_value;
  else
    return (NSDictionary *)0;
}

- (CVPixelBufferRef)imageBufferValue
{
  if (self->_type == 4 && !self->_undefined)
    return (CVPixelBufferRef)self->_value;
  else
    return 0;
}

- (MLSequence)sequenceValue
{
  if (self->_type == 7 && !self->_undefined)
    return (MLSequence *)self->_value;
  else
    return (MLSequence *)0;
}

- (id)internalStateValue
{
  if (self->_type == 8 && !self->_undefined)
    return self->_value;
  else
    return 0;
}

- (NSObject)objectValue
{
  return self->_value;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  +[MLFeatureTypeUtils descriptionForType:](MLFeatureTypeUtils, "descriptionForType:", self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ : %@"), v4, self->_value);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isEqualToFeatureValue:(MLFeatureValue *)value
{
  MLFeatureValue *v4;
  char v5;
  void *v6;
  char v7;
  __CVBuffer *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = value;
  if (-[MLFeatureValue isUndefined](v4, "isUndefined") && self->_undefined)
  {
    v5 = 1;
    goto LABEL_16;
  }
  if (-[MLFeatureValue type](v4, "type") == self->_type)
  {
    if (self->_undefined == -[MLFeatureValue isUndefined](v4, "isUndefined"))
    {
      switch(-[MLFeatureValue type](v4, "type"))
      {
        case 1:
        case 2:
          goto LABEL_12;
        case 3:
          -[MLFeatureValue value](v4, "value");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = objc_msgSend(v6, "isEqualToString:", self->_value);
          goto LABEL_13;
        case 4:
          v9 = -[MLFeatureValue imageBufferValue](self, "imageBufferValue");
          v5 = v9 == -[MLFeatureValue imageBufferValue](v4, "imageBufferValue");
          break;
        case 5:
          -[MLFeatureValue value](v4, "value");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = objc_msgSend(v6, "isEqualToMultiArray:", self->_value);
          goto LABEL_13;
        case 6:
          -[MLFeatureValue value](v4, "value");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = objc_msgSend(v6, "isEqualToDictionary:", self->_value);
          goto LABEL_13;
        case 7:
          -[MLFeatureValue value](v4, "value");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "values");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(self->_value, "values");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = objc_msgSend(v10, "isEqualToArray:", v11);

          goto LABEL_14;
        case 8:
          -[MLFeatureValue value](v4, "value");
          v12 = (id)objc_claimAutoreleasedReturnValue();
          v5 = v12 == self->_value;

          break;
        default:
          goto LABEL_15;
      }
      goto LABEL_16;
    }
LABEL_15:
    v5 = 0;
    goto LABEL_16;
  }
  if ((-[MLFeatureValue type](v4, "type") != MLFeatureTypeInt64 || self->_type != 2)
    && (-[MLFeatureValue type](v4, "type") != MLFeatureTypeDouble || self->_type != 1))
  {
    goto LABEL_15;
  }
LABEL_12:
  -[MLFeatureValue value](v4, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToNumber:", self->_value);
LABEL_13:
  v5 = v7;
LABEL_14:

LABEL_16:
  return v5;
}

- (unint64_t)hash
{
  int64_t type;
  uint64_t v4;

  if (self->_undefined)
    return 0;
  type = self->_type;
  v4 = objc_msgSend(self->_value, "hash");
  if ((unint64_t)(type - 1) <= 1)
    return v4 ^ 3;
  else
    return v4 ^ type;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[MLFeatureValue isEqualToFeatureValue:](self, "isEqualToFeatureValue:", v4);

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _BOOL4 v5;
  MLFeatureValue *v6;
  void *v8;
  MLFeatureValue *v9;

  v5 = -[MLFeatureValue isUndefined](self, "isUndefined");
  v6 = +[MLFeatureValue allocWithZone:](MLFeatureValue, "allocWithZone:", a3);
  if (v5)
    return -[MLFeatureValue initWithUndefinedValueAndType:](v6, "initWithUndefinedValueAndType:", -[MLFeatureValue type](self, "type"));
  -[MLFeatureValue value](self, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MLFeatureValue initWithValue:type:](v6, "initWithValue:type:", v8, -[MLFeatureValue type](self, "type"));

  return v9;
}

- (id)getFeatureSize:(id *)a3
{
  return -[MLFeatureValue getFeatureSize:ndArrayMode:](self, "getFeatureSize:ndArrayMode:", a3, 0);
}

- (id)getFeatureSize:(id *)a3 ndArrayMode:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  int64_t type;
  void *v10;
  void *v11;
  id v12;
  __CVBuffer *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void **v21;
  uint64_t *v22;
  NSObject *v23;
  void *v24;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  NSObject *v45;
  __int16 v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  _QWORD v52[2];

  v4 = a4;
  v52[1] = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 5);
  v8 = v7;
  type = self->_type;
  if (type == 4)
  {
    objc_msgSend(v7, "setObject:atIndexedSubscript:", &unk_1E3DA2050, 0);
    objc_msgSend(v8, "setObject:atIndexedSubscript:", &unk_1E3DA2050, 1);
    v13 = -[MLFeatureValue imageBufferValue](self, "imageBufferValue");
    if (CVPixelBufferGetPixelFormatType(v13) == 1278226488)
      v14 = &unk_1E3DA2050;
    else
      v14 = &unk_1E3DA2068;
    objc_msgSend(v8, "setObject:atIndexedSubscript:", v14, 2);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", CVPixelBufferGetHeight(v13));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:atIndexedSubscript:", v15, 3);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", CVPixelBufferGetWidth(v13));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:atIndexedSubscript:", v16, 4);
    goto LABEL_10;
  }
  if (type == 8)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v46 = 0;
      _os_log_error_impl(&dword_19C486000, v17, OS_LOG_TYPE_ERROR, "Attempting to getFeatureSize: for an MLState MLFeatureValue.", (uint8_t *)&v46, 2u);
    }

    if (!a3)
      goto LABEL_21;
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v49 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Attempting to getFeatureSize: for an MLState MLFeatureValue."));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v19;
    v20 = (void *)MEMORY[0x1E0C99D80];
    v21 = &v50;
    v22 = &v49;
    goto LABEL_20;
  }
  if (type != 5)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v46 = 0;
      _os_log_error_impl(&dword_19C486000, v23, OS_LOG_TYPE_ERROR, "Attempting to hash an MLFeatureValue that is not an image or multi array.", (uint8_t *)&v46, 2u);
    }

    if (!a3)
      goto LABEL_21;
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v47 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Attempting to hash an MLFeatureValue that is not an image or multi array."));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v19;
    v20 = (void *)MEMORY[0x1E0C99D80];
    v21 = &v48;
    v22 = &v47;
    goto LABEL_20;
  }
  -[MLFeatureValue multiArrayValue](self, "multiArrayValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "shape");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v4)
  {
    v26 = objc_msgSend(v11, "count");

    if (v26 == 1)
    {
      objc_msgSend(v8, "setObject:atIndexedSubscript:", &unk_1E3DA2050, 0);
      objc_msgSend(v8, "setObject:atIndexedSubscript:", &unk_1E3DA2050, 1);
      -[MLFeatureValue multiArrayValue](self, "multiArrayValue");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "shape");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectAtIndexedSubscript:", 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:atIndexedSubscript:", v29, 2);

      objc_msgSend(v8, "setObject:atIndexedSubscript:", &unk_1E3DA2050, 3);
      objc_msgSend(v8, "setObject:atIndexedSubscript:", &unk_1E3DA2050, 4);
      goto LABEL_11;
    }
    -[MLFeatureValue multiArrayValue](self, "multiArrayValue");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "shape");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "count");

    if (v32 == 3)
    {
      objc_msgSend(v8, "setObject:atIndexedSubscript:", &unk_1E3DA2050, 0);
      objc_msgSend(v8, "setObject:atIndexedSubscript:", &unk_1E3DA2050, 1);
      -[MLFeatureValue multiArrayValue](self, "multiArrayValue");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "shape");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "objectAtIndexedSubscript:", 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:atIndexedSubscript:", v35, 2);

      -[MLFeatureValue multiArrayValue](self, "multiArrayValue");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "shape");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "objectAtIndexedSubscript:", 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:atIndexedSubscript:", v38, 3);

      -[MLFeatureValue multiArrayValue](self, "multiArrayValue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "shape");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "objectAtIndexedSubscript:", 2);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:atIndexedSubscript:", v40, 4);

LABEL_10:
LABEL_11:
      v12 = v8;
      goto LABEL_22;
    }
    -[MLFeatureValue multiArrayValue](self, "multiArrayValue");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "shape");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "count");

    if (v43 == 5)
    {
      -[MLFeatureValue multiArrayValue](self, "multiArrayValue");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "shape");
      v12 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_22;
    }
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      v46 = 0;
      _os_log_error_impl(&dword_19C486000, v45, OS_LOG_TYPE_ERROR, "Attempting to hash an MLFeatureValue that is not an image or multi array.", (uint8_t *)&v46, 2u);
    }

    if (!a3)
    {
LABEL_21:
      v12 = 0;
      goto LABEL_22;
    }
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v51 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Attempting to hash an MLFeatureValue that is not an image or multi array."));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = v19;
    v20 = (void *)MEMORY[0x1E0C99D80];
    v21 = (void **)v52;
    v22 = &v51;
LABEL_20:
    objc_msgSend(v20, "dictionaryWithObjects:forKeys:count:", v21, v22, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v24);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_21;
  }

LABEL_22:
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  void *BaseAddress;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeInt:forKey:", -[MLFeatureValue type](self, "type"), CFSTR("type"));
  objc_msgSend(v6, "encodeBool:forKey:", -[MLFeatureValue isUndefined](self, "isUndefined"), CFSTR("undefined"));
  if (-[MLFeatureValue type](self, "type") == MLFeatureTypeImage)
  {
    if (-[MLFeatureValue imageBufferValue](self, "imageBufferValue"))
    {
      objc_msgSend(v6, "encodeInt:forKey:", CVPixelBufferGetWidth(-[MLFeatureValue imageBufferValue](self, "imageBufferValue")), CFSTR("width"));
      objc_msgSend(v6, "encodeInt:forKey:", CVPixelBufferGetHeight(-[MLFeatureValue imageBufferValue](self, "imageBufferValue")), CFSTR("height"));
      objc_msgSend(v6, "encodeInt:forKey:", CVPixelBufferGetPixelFormatType(-[MLFeatureValue imageBufferValue](self, "imageBufferValue")), CFSTR("format"));
      objc_msgSend(v6, "encodeInt:forKey:", CVPixelBufferGetBytesPerRow(-[MLFeatureValue imageBufferValue](self, "imageBufferValue")), CFSTR("rowBytes"));
      if (CVPixelBufferLockBaseAddress(-[MLFeatureValue imageBufferValue](self, "imageBufferValue"), 1uLL))
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Failed to lock CVPixelBuffer's base address for serialization."));
      BaseAddress = CVPixelBufferGetBaseAddress(-[MLFeatureValue imageBufferValue](self, "imageBufferValue"));
      objc_msgSend(v6, "encodeBytes:length:forKey:", BaseAddress, CVPixelBufferGetDataSize(-[MLFeatureValue imageBufferValue](self, "imageBufferValue")), CFSTR("dataPointer"));
      CVPixelBufferUnlockBaseAddress(-[MLFeatureValue imageBufferValue](self, "imageBufferValue"), 1uLL);
      -[MLFeatureValue imageBufferValue](self, "imageBufferValue");
      objc_msgSend(v6, "encodeObject:forKey:", CVPixelBufferGetAttributes(), CFSTR("attributes"));
    }
  }
  else
  {
    -[MLFeatureValue value](self, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("value"));

  }
}

- (MLFeatureValue)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  MLFeatureValue *v6;
  size_t v7;
  size_t v8;
  OSType v9;
  size_t v10;
  id v11;
  const void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  const __CFDictionary *pixelBufferAttributes;
  void *v18;
  void *v19;
  void *v20;
  CVPixelBufferRef texture;
  size_t size;
  _QWORD v24[5];
  _QWORD v25[5];

  v25[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("type"));
  if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("undefined")))
  {
    v6 = -[MLFeatureValue initWithValue:type:](self, "initWithValue:type:", 0, v5);
  }
  else
  {
    if ((_DWORD)v5 == 4)
    {
      v7 = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("width"));
      v8 = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("height"));
      v9 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("format"));
      v10 = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("rowBytes"));
      size = 0;
      v11 = objc_retainAutorelease(v4);
      v12 = (const void *)objc_msgSend(v11, "decodeBytesForKey:returnedLength:", CFSTR("dataPointer"), &size);
      v13 = malloc_type_malloc(size, 0x849AF64BuLL);
      memcpy(v13, v12, size);
      v14 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v25[0] = objc_opt_class();
      v25[1] = objc_opt_class();
      v25[2] = objc_opt_class();
      v25[3] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObjectsFromArray:", v15);

      objc_msgSend(v11, "allowedClasses");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "unionSet:", v16);

      objc_msgSend(v11, "decodeObjectOfClasses:forKey:", v14, CFSTR("attributes"));
      pixelBufferAttributes = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      texture = 0;
      if (CVPixelBufferCreateWithBytes(0, v7, v8, v9, v13, v10, (CVPixelBufferReleaseBytesCallback)deallocator, 0, pixelBufferAttributes, &texture))
      {
        v6 = -[MLFeatureValue initWithValue:type:](self, "initWithValue:type:", 0, 4);
      }
      else
      {
        v6 = -[MLFeatureValue initWithValue:type:](self, "initWithValue:type:", texture, 4);
        CVPixelBufferRelease(texture);
      }

    }
    else
    {
      v14 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v24[0] = objc_opt_class();
      v24[1] = objc_opt_class();
      v24[2] = objc_opt_class();
      v24[3] = objc_opt_class();
      v24[4] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 5);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObjectsFromArray:", v18);

      objc_msgSend(v4, "allowedClasses");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "unionSet:", v19);

      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("value"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[MLFeatureValue initWithValue:type:](self, "initWithValue:type:", v20, v5);

    }
  }

  return v6;
}

- (id)stateValue
{
  if (self->_type == 8 && !self->_undefined)
    return self->_value;
  else
    return 0;
}

- (id)value
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setValue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void)setObjectValue:(id)a3
{
  objc_storeStrong((id *)&self->_objectValue, a3);
}

+ (MLFeatureValue)undefinedFeatureValueWithType:(MLFeatureType)type
{
  return (MLFeatureValue *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithUndefinedValueAndType:", type);
}

+ (MLFeatureValue)featureValueWithInt64:(int64_t)value
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", value);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithValue:type:", v5, 1);

  return (MLFeatureValue *)v6;
}

+ (MLFeatureValue)featureValueWithString:(NSString *)value
{
  NSString *v4;
  void *v5;

  v4 = value;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithValue:type:", v4, 3);

  return (MLFeatureValue *)v5;
}

+ (MLFeatureValue)featureValueWithPixelBuffer:(CVPixelBufferRef)value
{
  return (MLFeatureValue *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithValue:type:", value, 4);
}

+ (MLFeatureValue)featureValueWithSequence:(MLSequence *)sequence
{
  MLSequence *v4;
  void *v5;

  v4 = sequence;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithValue:type:", v4, 7);

  return (MLFeatureValue *)v5;
}

+ (id)internalFeatureValueWithState:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithValue:type:", v4, 8);

  return v5;
}

+ (MLFeatureValue)featureValueWithDictionary:(NSDictionary *)value error:(NSError *)error
{
  NSDictionary *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = value;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NSDictionary allKeys](v6, "allKeys", 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (error)
            {
              +[MLModelErrorUtils featureTypeErrorWithFormat:](MLModelErrorUtils, "featureTypeErrorWithFormat:", CFSTR("Dictionary keys must be NSStrings or NSNumbers."));
              *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
            }

            v12 = 0;
            goto LABEL_14;
          }
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v9)
        continue;
      break;
    }
  }

  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithValue:type:", v6, 6);
LABEL_14:

  return (MLFeatureValue *)v12;
}

+ (MLFeatureValue)featureValueWithStringKeyDictionary:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithValue:type:", v4, 6);

  return (MLFeatureValue *)v5;
}

+ (MLFeatureValue)featureValueWithInt64KeyDictionary:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithValue:type:", v4, 6);

  return (MLFeatureValue *)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (MLFeatureValue)featureValueWithState:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithValue:type:", v4, 8);

  return (MLFeatureValue *)v5;
}

+ (unint64_t)visionCropAndScaleOptionFromOptions:(id)a3
{
  void *v3;
  unint64_t v4;
  NSObject *v5;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("MLFeatureValueImageOptionCropAndScale"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
LABEL_7:
    v4 = 2;
    goto LABEL_8;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = CFSTR("MLFeatureValueImageOptionCropAndScale");
      _os_log_error_impl(&dword_19C486000, v5, OS_LOG_TYPE_ERROR, "Value for %@ must respond to 'unsignedIntegerValue' selector. Will default to VNImageCropAndScaleOptionScaleFill = 2", (uint8_t *)&v7, 0xCu);
    }

    goto LABEL_7;
  }
  v4 = objc_msgSend(v3, "unsignedIntegerValue");
LABEL_8:

  return v4;
}

+ (CGRect)cropRectFromOptions:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  __int128 v18;
  CGRect result;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("MLFeatureValueImageOptionCropRect"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3
    && (v5 = objc_retainAutorelease(v3),
        !strncmp((const char *)objc_msgSend(v5, "objCType"), "{CGRect={CGPoint=dd}{CGSize=dd}}", 0xAuLL)))
  {
    v16 = 0.0;
    v17 = 0.0;
    __asm { FMOV            V0.2D, #1.0 }
    v18 = _Q0;
    objc_msgSend(v5, "getValue:size:", &v16, 32);
  }
  else
  {
    v16 = 0.0;
    v17 = 0.0;
    __asm { FMOV            V0.2D, #1.0 }
    v18 = _Q0;
  }

  v12 = v16;
  v13 = v17;
  v15 = *((double *)&v18 + 1);
  v14 = *(double *)&v18;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

+ (MLFeatureValue)featureValueWithImageAtURL:(NSURL *)url pixelsWide:(NSInteger)pixelsWide pixelsHigh:(NSInteger)pixelsHigh pixelFormatType:(OSType)pixelFormatType options:(NSDictionary *)options error:(NSError *)error
{
  uint64_t v9;
  NSDictionary *v14;
  NSURL *v15;
  void *v16;
  void *v17;

  v9 = *(_QWORD *)&pixelFormatType;
  v14 = options;
  v15 = url;
  +[MLImageConstraint constraintWithPixelsWide:pixelsHigh:pixelType:](MLImageConstraint, "constraintWithPixelsWide:pixelsHigh:pixelType:", pixelsWide, pixelsHigh, +[MLImageConstraint imagePixelTypeFromOSType:](MLImageConstraint, "imagePixelTypeFromOSType:", v9));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "featureValueWithImageAtURL:constraint:options:error:", v15, v16, v14, error);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (MLFeatureValue *)v17;
}

+ (MLFeatureValue)featureValueWithImageAtURL:(NSURL *)url constraint:(MLImageConstraint *)constraint options:(NSDictionary *)options error:(NSError *)error
{
  NSURL *v10;
  MLImageConstraint *v11;
  NSDictionary *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  __CVBuffer *v19;
  void *v20;
  const __CFString *v21;

  v10 = url;
  v11 = constraint;
  v12 = options;
  +[_MLVNFrameworkHandle sharedHandle](_MLVNFrameworkHandle, "sharedHandle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    if (!error)
      goto LABEL_11;
    v21 = CFSTR("Functionality unavailable");
LABEL_10:
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", v21);
    v20 = 0;
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if (!-[MLImageConstraint pixelsHigh](v11, "pixelsHigh") || !-[MLImageConstraint pixelsWide](v11, "pixelsWide"))
  {
    if (!error)
      goto LABEL_11;
    v21 = CFSTR("Operation failed due to missing or zero crop parameters in image constraint.");
    goto LABEL_10;
  }
  objc_msgSend(a1, "cropRectFromOptions:", v12);
  v18 = objc_msgSend(v13, "createPixelBufferFromImageAtURL:constraint:cropRect:cropAndScaleOption:options:error:", v10, v11, objc_msgSend(a1, "visionCropAndScaleOptionFromOptions:", v12), v12, error, v14, v15, v16, v17);
  if (!v18)
  {
LABEL_11:
    v20 = 0;
    goto LABEL_12;
  }
  v19 = (__CVBuffer *)v18;
  +[MLFeatureValue featureValueWithPixelBuffer:](MLFeatureValue, "featureValueWithPixelBuffer:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  CVPixelBufferRelease(v19);
LABEL_12:

  return (MLFeatureValue *)v20;
}

+ (MLFeatureValue)featureValueWithCGImage:(CGImageRef)cgImage pixelsWide:(NSInteger)pixelsWide pixelsHigh:(NSInteger)pixelsHigh pixelFormatType:(OSType)pixelFormatType options:(NSDictionary *)options error:(NSError *)error
{
  uint64_t v9;
  NSDictionary *v14;
  void *v15;
  void *v16;

  v9 = *(_QWORD *)&pixelFormatType;
  v14 = options;
  +[MLImageConstraint constraintWithPixelsWide:pixelsHigh:pixelType:](MLImageConstraint, "constraintWithPixelsWide:pixelsHigh:pixelType:", pixelsWide, pixelsHigh, +[MLImageConstraint imagePixelTypeFromOSType:](MLImageConstraint, "imagePixelTypeFromOSType:", v9));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "featureValueWithCGImage:constraint:options:error:", cgImage, v15, v14, error);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (MLFeatureValue *)v16;
}

+ (MLFeatureValue)featureValueWithCGImage:(CGImageRef)cgImage constraint:(MLImageConstraint *)constraint options:(NSDictionary *)options error:(NSError *)error
{
  MLImageConstraint *v10;
  NSDictionary *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  __CVBuffer *v18;
  void *v19;

  v10 = constraint;
  v11 = options;
  +[_MLVNFrameworkHandle sharedHandle](_MLVNFrameworkHandle, "sharedHandle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    if (error)
    {
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Functionality unavailable"));
      v19 = 0;
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
LABEL_6:
    v19 = 0;
    goto LABEL_7;
  }
  objc_msgSend(a1, "cropRectFromOptions:", v11);
  v17 = objc_msgSend(v12, "createPixelBufferFromCGImage:constraint:cropRect:cropAndScaleOption:options:error:", cgImage, v10, objc_msgSend(a1, "visionCropAndScaleOptionFromOptions:", v11), v11, error, v13, v14, v15, v16);
  if (!v17)
    goto LABEL_6;
  v18 = (__CVBuffer *)v17;
  +[MLFeatureValue featureValueWithPixelBuffer:](MLFeatureValue, "featureValueWithPixelBuffer:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  CVPixelBufferRelease(v18);
LABEL_7:

  return (MLFeatureValue *)v19;
}

+ (MLFeatureValue)featureValueWithImageAtURL:(NSURL *)url orientation:(CGImagePropertyOrientation)orientation pixelsWide:(NSInteger)pixelsWide pixelsHigh:(NSInteger)pixelsHigh pixelFormatType:(OSType)pixelFormatType options:(NSDictionary *)options error:(NSError *)error
{
  uint64_t v10;
  uint64_t v13;
  NSURL *v15;
  void *v16;
  void *v17;

  v10 = *(_QWORD *)&pixelFormatType;
  v13 = *(_QWORD *)&orientation;
  v15 = url;
  +[_MLVNFrameworkHandle addOrientation:toOptions:](_MLVNFrameworkHandle, "addOrientation:toOptions:", v13, options);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "featureValueWithImageAtURL:pixelsWide:pixelsHigh:pixelFormatType:options:error:", v15, pixelsWide, pixelsHigh, v10, v16, error);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (MLFeatureValue *)v17;
}

+ (MLFeatureValue)featureValueWithImageAtURL:(NSURL *)url orientation:(CGImagePropertyOrientation)orientation constraint:(MLImageConstraint *)constraint options:(NSDictionary *)options error:(NSError *)error
{
  uint64_t v9;
  MLImageConstraint *v12;
  NSURL *v13;
  void *v14;
  void *v15;

  v9 = *(_QWORD *)&orientation;
  v12 = constraint;
  v13 = url;
  +[_MLVNFrameworkHandle addOrientation:toOptions:](_MLVNFrameworkHandle, "addOrientation:toOptions:", v9, options);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "featureValueWithImageAtURL:constraint:options:error:", v13, v12, v14, error);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (MLFeatureValue *)v15;
}

+ (MLFeatureValue)featureValueWithCGImage:(CGImageRef)cgImage orientation:(CGImagePropertyOrientation)orientation pixelsWide:(NSInteger)pixelsWide pixelsHigh:(NSInteger)pixelsHigh pixelFormatType:(OSType)pixelFormatType options:(NSDictionary *)options error:(NSError *)error
{
  uint64_t v9;
  void *v14;
  void *v15;

  v9 = *(_QWORD *)&pixelFormatType;
  +[_MLVNFrameworkHandle addOrientation:toOptions:](_MLVNFrameworkHandle, "addOrientation:toOptions:", *(_QWORD *)&orientation, options);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "featureValueWithCGImage:pixelsWide:pixelsHigh:pixelFormatType:options:error:", cgImage, pixelsWide, pixelsHigh, v9, v14, error);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (MLFeatureValue *)v15;
}

+ (MLFeatureValue)featureValueWithCGImage:(CGImageRef)cgImage orientation:(CGImagePropertyOrientation)orientation constraint:(MLImageConstraint *)constraint options:(NSDictionary *)options error:(NSError *)error
{
  uint64_t v9;
  MLImageConstraint *v12;
  void *v13;
  void *v14;

  v9 = *(_QWORD *)&orientation;
  v12 = constraint;
  +[_MLVNFrameworkHandle addOrientation:toOptions:](_MLVNFrameworkHandle, "addOrientation:toOptions:", v9, options);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "featureValueWithCGImage:constraint:options:error:", cgImage, v12, v13, error);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (MLFeatureValue *)v14;
}

@end
