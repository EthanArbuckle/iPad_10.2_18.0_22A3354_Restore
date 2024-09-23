@implementation CMIOExtensionPropertyAttributes

+ (CMIOExtensionPropertyAttributes)propertyAttributesWithMinValue:(id)minValue maxValue:(id)maxValue validValues:(NSArray *)validValues readOnly:(BOOL)readOnly
{
  return (CMIOExtensionPropertyAttributes *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithMinValue:maxValue:validValues:readOnly:", minValue, maxValue, validValues, readOnly);
}

+ (CMIOExtensionPropertyAttributes)propertyAttributesWithSharedStreamDefaultValue:(id)a3 minValue:(id)a4 maxValue:(id)a5 validValues:(id)a6
{
  return (CMIOExtensionPropertyAttributes *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithMinValue:maxValue:validValues:sharedStreamDefaultValue:", a4, a5, a6, a3);
}

- (CMIOExtensionPropertyAttributes)initWithMinValue:(id)a3 maxValue:(id)a4 validValues:(id)a5 sharedStreamDefaultValue:(id)a6
{
  CMIOExtensionPropertyAttributes *result;

  result = -[CMIOExtensionPropertyAttributes initWithMinValue:maxValue:validValues:readOnly:](self, "initWithMinValue:maxValue:validValues:readOnly:", a3, a4, a5, 0);
  if (result)
    result->_sharedStreamDefaultValue = a6;
  return result;
}

- (CMIOExtensionPropertyAttributes)initWithMinValue:(id)minValue maxValue:(id)maxValue validValues:(NSArray *)validValues readOnly:(BOOL)readOnly
{
  CMIOExtensionPropertyAttributes *v10;
  CMIOExtensionPropertyAttributes *v11;
  uint64_t v12;
  int64_t objectType;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  int64_t v17;
  void *v18;
  uint64_t v19;
  const __CFString *v20;
  id v21;
  uint64_t v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)CMIOExtensionPropertyAttributes;
  v10 = -[CMIOExtensionPropertyAttributes init](&v24, sel_init);
  v11 = v10;
  if (!v10)
    return v11;
  v10->_sharedStreamDefaultValue = 0;
  if (minValue)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = 4;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = 2;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = 3;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v12 = 5;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v12 = 6;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                goto LABEL_64;
              v12 = 7;
            }
          }
        }
      }
    }
    objectType = v11->_objectType;
    if (objectType)
    {
      if (objectType != v12)
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("%@ value argument must be the same type"), v11);
    }
    else
    {
      v11->_objectType = v12;
    }
    v11->_minValue = (id)objc_msgSend(minValue, "copy");
  }
  if (maxValue)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = 4;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = 2;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v14 = 3;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v14 = 5;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v14 = 6;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                goto LABEL_64;
              v14 = 7;
            }
          }
        }
      }
    }
    v15 = v11->_objectType;
    if (v15)
    {
      if (v15 != v14)
        goto LABEL_54;
    }
    else
    {
      v11->_objectType = v14;
    }
    v11->_maxValue = (id)objc_msgSend(maxValue, "copy");
  }
  if (validValues)
  {
    if (!-[NSArray count](validValues, "count"))
    {
LABEL_57:
      v11->_validValues = (NSArray *)-[NSArray copy](validValues, "copy");
      goto LABEL_58;
    }
    -[NSArray objectAtIndexedSubscript:](validValues, "objectAtIndexedSubscript:", 0);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = 4;
      goto LABEL_52;
    }
    -[NSArray objectAtIndexedSubscript:](validValues, "objectAtIndexedSubscript:", 0);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = 2;
      goto LABEL_52;
    }
    -[NSArray objectAtIndexedSubscript:](validValues, "objectAtIndexedSubscript:", 0);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = 3;
      goto LABEL_52;
    }
    -[NSArray objectAtIndexedSubscript:](validValues, "objectAtIndexedSubscript:", 0);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = 5;
      goto LABEL_52;
    }
    -[NSArray objectAtIndexedSubscript:](validValues, "objectAtIndexedSubscript:", 0);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = 6;
      goto LABEL_52;
    }
    -[NSArray objectAtIndexedSubscript:](validValues, "objectAtIndexedSubscript:", 0);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = 7;
LABEL_52:
      v17 = v11->_objectType;
      if (v17)
      {
        if (v17 != v16)
        {
LABEL_54:

          v18 = (void *)MEMORY[0x24BDBCE88];
          v19 = *MEMORY[0x24BDBCAB8];
          v20 = CFSTR("value argument must be the same type");
LABEL_55:
          objc_msgSend(v18, "raise:format:", v19, v20);
          return 0;
        }
      }
      else
      {
        v11->_objectType = v16;
      }
      goto LABEL_57;
    }
LABEL_64:

    v18 = (void *)MEMORY[0x24BDBCE88];
    v19 = *MEMORY[0x24BDBCAB8];
    v20 = CFSTR("value argument must be a NSString or a NSData or a NSNumber or a CMIOExtensionStreamFormat or a NSDictionary or a NSArray");
    goto LABEL_55;
  }
LABEL_58:
  if (!v11->_objectType)
    v11->_objectType = 1;
  v11->_readOnly = readOnly;
  v21 = objc_alloc(MEMORY[0x24BDD17C8]);
  v22 = 89;
  if (!v11->_readOnly)
    v22 = 78;
  v11->_description = (NSString *)objc_msgSend(v21, "initWithFormat:", CFSTR("<CMIOExtensionPropertyAttributes: %@:%@:%@:(%c)>"), *(_OWORD *)&v11->_minValue, v11->_validValues, v22);
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMIOExtensionPropertyAttributes;
  -[CMIOExtensionPropertyAttributes dealloc](&v3, sel_dealloc);
}

+ (CMIOExtensionPropertyAttributes)readOnlyPropertyAttribute
{
  if (readOnlyPropertyAttribute_onceToken != -1)
    dispatch_once(&readOnlyPropertyAttribute_onceToken, &__block_literal_global_0);
  return (CMIOExtensionPropertyAttributes *)readOnlyPropertyAttribute_gReadOnlyAttribute;
}

CMIOExtensionPropertyAttributes *__60__CMIOExtensionPropertyAttributes_readOnlyPropertyAttribute__block_invoke()
{
  CMIOExtensionPropertyAttributes *result;

  result = -[CMIOExtensionPropertyAttributes initWithMinValue:maxValue:validValues:readOnly:]([CMIOExtensionPropertyAttributes alloc], "initWithMinValue:maxValue:validValues:readOnly:", 0, 0, 0, 1);
  readOnlyPropertyAttribute_gReadOnlyAttribute = (uint64_t)result;
  return result;
}

- (id)description
{
  return self->_description;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id minValue;
  int v12;
  id maxValue;
  NSArray *validValues;
  int readOnly;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  if (a3 == self)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    v17 = v5;
    v18 = v4;
    v19 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      minValue = self->_minValue;
      if (minValue == (id)objc_msgSend(a3, "minValue")
        || (v12 = objc_msgSend(self->_minValue, "isEqual:", objc_msgSend(a3, "minValue"))) != 0)
      {
        maxValue = self->_maxValue;
        if (maxValue == (id)objc_msgSend(a3, "maxValue", v6, v17, v18, v19, v7, v8)
          || (v12 = objc_msgSend(self->_maxValue, "isEqual:", objc_msgSend(a3, "maxValue"))) != 0)
        {
          validValues = self->_validValues;
          if (validValues == (NSArray *)objc_msgSend(a3, "validValues")
            || (v12 = -[NSArray isEqual:](self->_validValues, "isEqual:", objc_msgSend(a3, "validValues"))) != 0)
          {
            readOnly = self->_readOnly;
            LOBYTE(v12) = readOnly == objc_msgSend(a3, "isReadOnly");
          }
        }
      }
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }
  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CMIOExtensionPropertyAttributes initWithMinValue:maxValue:validValues:readOnly:](+[CMIOExtensionPropertyAttributes allocWithZone:](CMIOExtensionPropertyAttributes, "allocWithZone:", a3), "initWithMinValue:maxValue:validValues:readOnly:", self->_minValue, self->_maxValue, self->_validValues, self->_readOnly);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id minValue;
  id maxValue;
  NSArray *validValues;

  minValue = self->_minValue;
  if (minValue)
    objc_msgSend(a3, "encodeObject:forKey:", minValue, CFSTR("min"));
  maxValue = self->_maxValue;
  if (maxValue)
    objc_msgSend(a3, "encodeObject:forKey:", maxValue, CFSTR("max"));
  validValues = self->_validValues;
  if (validValues)
    objc_msgSend(a3, "encodeObject:forKey:", validValues, CFSTR("validValues"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_readOnly, CFSTR("readonly"));
}

- (CMIOExtensionPropertyAttributes)initWithCoder:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = (void *)MEMORY[0x24BDBCF20];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_msgSend(v5, "setWithObjects:", v6, v7, v8, v9, v10, objc_opt_class(), 0);
  return -[CMIOExtensionPropertyAttributes initWithMinValue:maxValue:validValues:readOnly:](self, "initWithMinValue:maxValue:validValues:readOnly:", objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v11, CFSTR("min")), objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v11, CFSTR("max")), objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v11, CFSTR("validValues")), objc_msgSend(a3, "decodeBoolForKey:", CFSTR("readonly")));
}

- (id)copyXPCDictionary
{
  xpc_object_t v3;
  id minValue;
  NSObject *v5;
  id maxValue;
  NSObject *v7;
  NSArray *validValues;
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  NSArray *v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  NSArray *v20;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  id v27;
  NSObject *v28;
  NSArray *v29;
  NSObject *v30;
  id v31;
  NSObject *v32;
  id v33;
  NSObject *v34;
  NSArray *v35;
  NSObject *v36;
  NSObject *v37;
  id v38;
  void *v39;
  void *v40;
  NSObject *v41;
  id v42;
  void *v43;

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v3, "type", self->_objectType);
  xpc_dictionary_set_BOOL(v3, "readonly", self->_readOnly);
  switch(self->_objectType)
  {
    case 0:
    case 1:
      return v3;
    case 2:
      minValue = self->_minValue;
      if (minValue)
      {
        if (cmio_XPCMessageSetCFData(v3, "min", minValue))
        {
          v5 = CMIOLog();
          if (v5)
          {
            if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
              -[CMIOExtensionPropertyAttributes copyXPCDictionary].cold.3();
          }
        }
      }
      maxValue = self->_maxValue;
      if (maxValue)
      {
        if (cmio_XPCMessageSetCFData(v3, "max", maxValue))
        {
          v7 = CMIOLog();
          if (v7)
          {
            if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
              -[CMIOExtensionPropertyAttributes copyXPCDictionary].cold.2();
          }
        }
      }
      validValues = self->_validValues;
      if (validValues)
      {
        if (cmio_XPCMessageSetCFArray(v3, "validValues", validValues))
        {
          v9 = CMIOLog();
          if (v9)
          {
            if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
              -[CMIOExtensionPropertyAttributes copyXPCDictionary].cold.1();
          }
        }
      }
      break;
    case 3:
      v10 = self->_minValue;
      if (v10)
      {
        if (cmio_XPCMessageSetCFNumber(v3, "min", v10))
        {
          v11 = CMIOLog();
          if (v11)
          {
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
              -[CMIOExtensionPropertyAttributes copyXPCDictionary].cold.6();
          }
        }
      }
      v12 = self->_maxValue;
      if (v12)
      {
        if (cmio_XPCMessageSetCFNumber(v3, "max", v12))
        {
          v13 = CMIOLog();
          if (v13)
          {
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
              -[CMIOExtensionPropertyAttributes copyXPCDictionary].cold.5();
          }
        }
      }
      v14 = self->_validValues;
      if (v14)
      {
        if (cmio_XPCMessageSetCFArray(v3, "validValues", v14))
        {
          v15 = CMIOLog();
          if (v15)
          {
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
              -[CMIOExtensionPropertyAttributes copyXPCDictionary].cold.4();
          }
        }
      }
      break;
    case 4:
      v16 = self->_minValue;
      if (v16)
      {
        if (cmio_XPCMessageSetCFString(v3, "min", v16))
        {
          v17 = CMIOLog();
          if (v17)
          {
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              -[CMIOExtensionPropertyAttributes copyXPCDictionary].cold.9();
          }
        }
      }
      v18 = self->_maxValue;
      if (v18)
      {
        if (cmio_XPCMessageSetCFString(v3, "max", v18))
        {
          v19 = CMIOLog();
          if (v19)
          {
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              -[CMIOExtensionPropertyAttributes copyXPCDictionary].cold.8();
          }
        }
      }
      v20 = self->_validValues;
      if (v20)
      {
        if (cmio_XPCMessageSetCFArray(v3, "validValues", v20))
        {
          v21 = CMIOLog();
          if (v21)
          {
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              -[CMIOExtensionPropertyAttributes copyXPCDictionary].cold.7();
          }
        }
      }
      break;
    case 5:
      v22 = self->_minValue;
      if (v22)
      {
        v23 = (void *)objc_msgSend(v22, "copyXPCDictionary");
        if (v23)
        {
          v24 = v23;
          xpc_dictionary_set_value(v3, "min", v23);
          xpc_release(v24);
        }
        else
        {
          v37 = CMIOLog();
          if (v37 && os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            -[CMIOExtensionPropertyAttributes copyXPCDictionary].cold.11();
        }
      }
      v38 = self->_maxValue;
      if (v38)
      {
        v39 = (void *)objc_msgSend(v38, "copyXPCDictionary");
        if (v39)
        {
          v40 = v39;
          xpc_dictionary_set_value(v3, "max", v39);
          xpc_release(v40);
        }
        else
        {
          v41 = CMIOLog();
          if (v41 && os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            -[CMIOExtensionPropertyAttributes copyXPCDictionary].cold.10();
        }
      }
      if (self->_validValues)
      {
        v42 = +[CMIOExtensionStreamFormat copyXPCArrayFromFormats:](CMIOExtensionStreamFormat, "copyXPCArrayFromFormats:");
        if (v42)
        {
          v43 = v42;
          xpc_dictionary_set_value(v3, "validValues", v42);
          xpc_release(v43);
        }
      }
      break;
    case 6:
      v25 = self->_minValue;
      if (v25)
      {
        if (cmio_XPCMessageSetCFDictionary(v3, "min", v25))
        {
          v26 = CMIOLog();
          if (v26)
          {
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
              -[CMIOExtensionPropertyAttributes copyXPCDictionary].cold.14();
          }
        }
      }
      v27 = self->_maxValue;
      if (v27)
      {
        if (cmio_XPCMessageSetCFDictionary(v3, "max", v27))
        {
          v28 = CMIOLog();
          if (v28)
          {
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              -[CMIOExtensionPropertyAttributes copyXPCDictionary].cold.13();
          }
        }
      }
      v29 = self->_validValues;
      if (v29)
      {
        if (cmio_XPCMessageSetCFArray(v3, "validValues", v29))
        {
          v30 = CMIOLog();
          if (v30)
          {
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
              -[CMIOExtensionPropertyAttributes copyXPCDictionary].cold.12();
          }
        }
      }
      break;
    case 7:
      v31 = self->_minValue;
      if (v31)
      {
        if (cmio_XPCMessageSetCFArray(v3, "min", v31))
        {
          v32 = CMIOLog();
          if (v32)
          {
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
              -[CMIOExtensionPropertyAttributes copyXPCDictionary].cold.17();
          }
        }
      }
      v33 = self->_maxValue;
      if (v33)
      {
        if (cmio_XPCMessageSetCFArray(v3, "max", v33))
        {
          v34 = CMIOLog();
          if (v34)
          {
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
              -[CMIOExtensionPropertyAttributes copyXPCDictionary].cold.16();
          }
        }
      }
      v35 = self->_validValues;
      if (v35)
      {
        if (cmio_XPCMessageSetCFArray(v3, "validValues", v35))
        {
          v36 = CMIOLog();
          if (v36)
          {
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
              -[CMIOExtensionPropertyAttributes copyXPCDictionary].cold.15();
          }
        }
      }
      break;
    default:
      xpc_release(v3);
      v3 = 0;
      break;
  }
  return v3;
}

- (CMIOExtensionPropertyAttributes)initWithXPCDictionary:(id)a3
{
  uint64_t uint64;
  _BOOL8 v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  CMIOExtensionPropertyAttributes *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  xpc_object_t value;
  xpc_object_t v18;
  xpc_object_t v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v27;
  CMIOExtensionStreamFormat *v28;
  CMIOExtensionStreamFormat *v29;

  if (a3)
  {
    v28 = 0;
    v29 = 0;
    v27 = 0;
    uint64 = xpc_dictionary_get_uint64(a3, "type");
    v6 = xpc_dictionary_get_BOOL(a3, "readonly");
    switch(uint64)
    {
      case 2uLL:
        if (cmio_XPCMessageCopyCFData(a3, "min", (NSObject **)&v29))
        {
          v7 = CMIOLog();
          if (v7)
          {
            if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
              -[CMIOExtensionPropertyAttributes initWithXPCDictionary:].cold.9();
          }
        }
        if (cmio_XPCMessageCopyCFData(a3, "max", (NSObject **)&v28))
        {
          v8 = CMIOLog();
          if (v8)
          {
            if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
              -[CMIOExtensionPropertyAttributes initWithXPCDictionary:].cold.8();
          }
        }
        if (cmio_XPCMessageCopyCFArray(a3, "validValues", &v27))
        {
          v9 = CMIOLog();
          if (v9)
          {
            if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
              -[CMIOExtensionPropertyAttributes initWithXPCDictionary:].cold.7();
          }
        }
        break;
      case 3uLL:
        if (cmio_XPCMessageCopyCFNumber(a3, "min", (NSObject **)&v29))
        {
          v11 = CMIOLog();
          if (v11)
          {
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
              -[CMIOExtensionPropertyAttributes initWithXPCDictionary:].cold.12();
          }
        }
        if (cmio_XPCMessageCopyCFNumber(a3, "max", (NSObject **)&v28))
        {
          v12 = CMIOLog();
          if (v12)
          {
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
              -[CMIOExtensionPropertyAttributes initWithXPCDictionary:].cold.11();
          }
        }
        if (cmio_XPCMessageCopyCFArray(a3, "validValues", &v27))
        {
          v13 = CMIOLog();
          if (v13)
          {
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
              -[CMIOExtensionPropertyAttributes initWithXPCDictionary:].cold.10();
          }
        }
        break;
      case 4uLL:
        if (cmio_XPCMessageCopyCFString(a3, "min", (NSObject **)&v29))
        {
          v14 = CMIOLog();
          if (v14)
          {
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
              -[CMIOExtensionPropertyAttributes initWithXPCDictionary:].cold.15();
          }
        }
        if (cmio_XPCMessageCopyCFString(a3, "max", (NSObject **)&v28))
        {
          v15 = CMIOLog();
          if (v15)
          {
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
              -[CMIOExtensionPropertyAttributes initWithXPCDictionary:].cold.14();
          }
        }
        if (cmio_XPCMessageCopyCFArray(a3, "validValues", &v27))
        {
          v16 = CMIOLog();
          if (v16)
          {
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              -[CMIOExtensionPropertyAttributes initWithXPCDictionary:].cold.13();
          }
        }
        break;
      case 5uLL:
        value = xpc_dictionary_get_value(a3, "min");
        if (value)
          v29 = -[CMIOExtensionStreamFormat initWithXPCDictionary:]([CMIOExtensionStreamFormat alloc], "initWithXPCDictionary:", value);
        v18 = xpc_dictionary_get_value(a3, "max");
        if (v18)
          v28 = -[CMIOExtensionStreamFormat initWithXPCDictionary:]([CMIOExtensionStreamFormat alloc], "initWithXPCDictionary:", v18);
        v19 = xpc_dictionary_get_value(a3, "validValues");
        if (v19)
          v27 = +[CMIOExtensionStreamFormat copyFormatsFromXPCArray:](CMIOExtensionStreamFormat, "copyFormatsFromXPCArray:", v19);
        break;
      case 6uLL:
        if (cmio_XPCMessageCopyCFDictionary(a3, "min", (NSObject **)&v29))
        {
          v20 = CMIOLog();
          if (v20)
          {
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              -[CMIOExtensionPropertyAttributes initWithXPCDictionary:].cold.6();
          }
        }
        if (cmio_XPCMessageCopyCFDictionary(a3, "max", (NSObject **)&v28))
        {
          v21 = CMIOLog();
          if (v21)
          {
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              -[CMIOExtensionPropertyAttributes initWithXPCDictionary:].cold.5();
          }
        }
        if (cmio_XPCMessageCopyCFArray(a3, "validValues", &v27))
        {
          v22 = CMIOLog();
          if (v22)
          {
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              -[CMIOExtensionPropertyAttributes initWithXPCDictionary:].cold.4();
          }
        }
        break;
      case 7uLL:
        if (cmio_XPCMessageCopyCFArray(a3, "min", (NSObject **)&v29))
        {
          v23 = CMIOLog();
          if (v23)
          {
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              -[CMIOExtensionPropertyAttributes initWithXPCDictionary:].cold.3();
          }
        }
        if (cmio_XPCMessageCopyCFArray(a3, "max", (NSObject **)&v28))
        {
          v24 = CMIOLog();
          if (v24)
          {
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
              -[CMIOExtensionPropertyAttributes initWithXPCDictionary:].cold.2();
          }
        }
        if (cmio_XPCMessageCopyCFArray(a3, "validValues", &v27))
        {
          v25 = CMIOLog();
          if (v25)
          {
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              -[CMIOExtensionPropertyAttributes initWithXPCDictionary:].cold.1();
          }
        }
        break;
      default:
        break;
    }
    v10 = -[CMIOExtensionPropertyAttributes initWithMinValue:maxValue:validValues:readOnly:](self, "initWithMinValue:maxValue:validValues:readOnly:", v29, v28, v27, v6);

  }
  else
  {

    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("nil xpc dictionary"));
    return 0;
  }
  return v10;
}

- (id)sharedStreamDefaultValue
{
  return self->_sharedStreamDefaultValue;
}

- (id)minValue
{
  return objc_getProperty(self, a2, 32, 1);
}

- (id)maxValue
{
  return objc_getProperty(self, a2, 40, 1);
}

- (NSArray)validValues
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)isReadOnly
{
  return self->_readOnly;
}

- (int64_t)objectType
{
  return self->_objectType;
}

- (void)copyXPCDictionary
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageSetCFArray failed for min", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithXPCDictionary:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageCopyCFArray failed for validValues", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithXPCDictionary:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageCopyCFArray failed for max", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithXPCDictionary:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageCopyCFArray failed for min", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithXPCDictionary:.cold.4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageCopyCFArray failed for validValues", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithXPCDictionary:.cold.5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageCopyCFDictionary failed for max", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithXPCDictionary:.cold.6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageCopyCFDictionary failed for min", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithXPCDictionary:.cold.7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageCopyCFArray failed for validValues", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithXPCDictionary:.cold.8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageCopyCFData failed for max", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithXPCDictionary:.cold.9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageCopyCFData failed for min", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithXPCDictionary:.cold.10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageCopyCFArray failed for validValues", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithXPCDictionary:.cold.11()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageCopyCFNumber failed for max", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithXPCDictionary:.cold.12()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageCopyCFNumber failed for min", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithXPCDictionary:.cold.13()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageCopyCFArray failed for validValues", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithXPCDictionary:.cold.14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageCopyCFString failed for max", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithXPCDictionary:.cold.15()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageCopyCFString failed for min", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
