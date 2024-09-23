@implementation CMIOExtensionPropertyState

+ (CMIOExtensionPropertyState)propertyStateWithValue:(id)value
{
  return (CMIOExtensionPropertyState *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithValue:", value);
}

+ (CMIOExtensionPropertyState)propertyStateWithValue:(id)value attributes:(CMIOExtensionPropertyAttributes *)attributes
{
  return (CMIOExtensionPropertyState *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithValue:attributes:", value, attributes);
}

- (CMIOExtensionPropertyState)initWithValue:(id)value
{
  return -[CMIOExtensionPropertyState initWithValue:attributes:](self, "initWithValue:attributes:", value, 0);
}

- (CMIOExtensionPropertyState)initWithValue:(id)value attributes:(CMIOExtensionPropertyAttributes *)attributes
{
  CMIOExtensionPropertyState *v6;
  CMIOExtensionPropertyState *v7;
  int64_t objectType;
  CFTypeID v9;
  id v10;
  void *v12;
  uint64_t v13;
  const __CFString *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CMIOExtensionPropertyState;
  v6 = -[CMIOExtensionPropertyState init](&v15, sel_init);
  v7 = v6;
  if (!v6)
    return v7;
  v6->_objectType = 0;
  if (value)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objectType = 4;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objectType = 2;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objectType = 3;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objectType = 5;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objectType = 6;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objectType = 7;
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objectType = 8;
                }
                else
                {
                  v9 = CFGetTypeID(value);
                  if (v9 != CVPixelBufferGetTypeID())
                  {

                    v12 = (void *)MEMORY[0x24BDBCE88];
                    v13 = *MEMORY[0x24BDBCAB8];
                    v14 = CFSTR("value argument must be a NSString or a NSData or a NSNumber or a CMIOExtensionStreamFormat");
                    goto LABEL_30;
                  }
                  objectType = 9;
                }
              }
            }
          }
        }
      }
    }
  }
  else
  {
    objectType = 1;
  }
  v7->_objectType = objectType;
  if (attributes)
  {
    if (-[CMIOExtensionPropertyAttributes objectType](attributes, "objectType") == 1)
    {
      objectType = v7->_objectType;
      goto LABEL_24;
    }
    objectType = -[CMIOExtensionPropertyAttributes objectType](attributes, "objectType");
    if (objectType == v7->_objectType)
      goto LABEL_24;

    v12 = (void *)MEMORY[0x24BDBCE88];
    v13 = *MEMORY[0x24BDBCAB8];
    v14 = CFSTR("value argument must be the same type");
LABEL_30:
    objc_msgSend(v12, "raise:format:", v13, v14);
    return 0;
  }
LABEL_24:
  if (objectType == 9)
    v10 = value;
  else
    v10 = (id)objc_msgSend(value, "copy");
  v7->_value = v10;
  v7->_attributes = attributes;
  v7->_description = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("<CMIOExtensionPropertyState: value %@, attributes %@>"), v7->_value, v7->_attributes);
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMIOExtensionPropertyState;
  -[CMIOExtensionPropertyState dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return self->_description;
}

- (BOOL)isEqual:(id)a3
{
  id value;
  int v6;
  CMIOExtensionPropertyAttributes *attributes;

  if (a3 == self)
    goto LABEL_7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    LOBYTE(v6) = 0;
    return v6;
  }
  value = self->_value;
  if (value == (id)objc_msgSend(a3, "value")
    || (v6 = objc_msgSend(self->_value, "isEqual:", objc_msgSend(a3, "value"))) != 0)
  {
    attributes = self->_attributes;
    if (attributes != (CMIOExtensionPropertyAttributes *)objc_msgSend(a3, "attributes"))
    {
      LOBYTE(v6) = -[CMIOExtensionPropertyAttributes isEqual:](self->_attributes, "isEqual:", objc_msgSend(a3, "attributes"));
      return v6;
    }
LABEL_7:
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CMIOExtensionPropertyState initWithValue:attributes:](+[CMIOExtensionPropertyState allocWithZone:](CMIOExtensionPropertyState, "allocWithZone:", a3), "initWithValue:attributes:", self->_value, self->_attributes);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id value;
  CMIOExtensionPropertyAttributes *attributes;

  value = self->_value;
  if (value)
    objc_msgSend(a3, "encodeObject:forKey:", value, CFSTR("value"));
  attributes = self->_attributes;
  if (attributes)
    objc_msgSend(a3, "encodeObject:forKey:", attributes, CFSTR("attributes"));
}

- (CMIOExtensionPropertyState)initWithCoder:(id)a3
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
  v11 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, v7, v8, v9, v10, objc_opt_class(), 0), CFSTR("value"));
  return -[CMIOExtensionPropertyState initWithValue:attributes:](self, "initWithValue:attributes:", v11, objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("attributes")));
}

- (id)copyXPCDictionary
{
  xpc_object_t v3;
  CMIOExtensionPropertyAttributes *attributes;
  id v5;
  void *v6;
  NSObject *v7;
  id value;
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  id v21;
  void *v22;
  __CVBuffer *v23;
  xpc_object_t empty;
  __IOSurface *IOSurface;
  xpc_object_t XPCObject;
  CFDictionaryRef v27;
  CFDictionaryRef v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v32;

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v3, "type", self->_objectType);
  attributes = self->_attributes;
  if (attributes)
  {
    v5 = -[CMIOExtensionPropertyAttributes copyXPCDictionary](attributes, "copyXPCDictionary");
    if (v5)
    {
      v6 = v5;
      xpc_dictionary_set_value(v3, "attributes", v5);
      xpc_release(v6);
    }
    else
    {
      v7 = CMIOLog();
      if (v7 && os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[CMIOExtensionPropertyState copyXPCDictionary].cold.10();
    }
  }
  switch(self->_objectType)
  {
    case 0:
    case 1:
      return v3;
    case 2:
      value = self->_value;
      if (value)
      {
        if (cmio_XPCMessageSetCFData(v3, "value", value))
        {
          v9 = CMIOLog();
          if (v9)
          {
            if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
              -[CMIOExtensionPropertyState copyXPCDictionary].cold.1();
          }
        }
      }
      break;
    case 3:
      v10 = self->_value;
      if (v10)
      {
        if (cmio_XPCMessageSetCFNumber(v3, "value", v10))
        {
          v11 = CMIOLog();
          if (v11)
          {
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
              -[CMIOExtensionPropertyState copyXPCDictionary].cold.2();
          }
        }
      }
      break;
    case 4:
      v12 = self->_value;
      if (v12)
      {
        if (cmio_XPCMessageSetCFString(v3, "value", v12))
        {
          v13 = CMIOLog();
          if (v13)
          {
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
              -[CMIOExtensionPropertyState copyXPCDictionary].cold.3();
          }
        }
      }
      break;
    case 5:
      v14 = self->_value;
      if (v14)
      {
        v15 = objc_msgSend(v14, "copyXPCDictionary");
        if (v15)
          goto LABEL_42;
        v16 = CMIOLog();
        if (v16 && os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          -[CMIOExtensionPropertyState copyXPCDictionary].cold.4();
      }
      break;
    case 6:
      v17 = self->_value;
      if (v17)
      {
        if (cmio_XPCMessageSetCFDictionary(v3, "value", v17))
        {
          v18 = CMIOLog();
          if (v18)
          {
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              -[CMIOExtensionPropertyState copyXPCDictionary].cold.5();
          }
        }
      }
      break;
    case 7:
      v19 = self->_value;
      if (v19)
      {
        if (objc_msgSend(v19, "count"))
        {
          if (cmio_XPCMessageSetCFArray(v3, "value", v19))
          {
            v20 = CMIOLog();
            if (v20)
            {
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                -[CMIOExtensionPropertyState copyXPCDictionary].cold.6();
            }
          }
        }
      }
      break;
    case 8:
      v21 = self->_value;
      if (v21)
      {
        v15 = objc_msgSend(v21, "copyXPCDictionary");
        if (v15)
        {
LABEL_42:
          v22 = (void *)v15;
          goto LABEL_43;
        }
        v29 = CMIOLog();
        if (v29 && os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          -[CMIOExtensionPropertyState copyXPCDictionary].cold.7();
      }
      break;
    case 9:
      v23 = (__CVBuffer *)self->_value;
      if (v23)
      {
        empty = xpc_dictionary_create_empty();
        if (empty)
        {
          v22 = empty;
          IOSurface = CVPixelBufferGetIOSurface(v23);
          if (IOSurface)
          {
            XPCObject = IOSurfaceCreateXPCObject(IOSurface);
            xpc_dictionary_set_value(v22, "surface", XPCObject);
            xpc_release(XPCObject);
            v27 = CMCopyDictionaryOfAttachments((CFAllocatorRef)*MEMORY[0x24BDBD240], v23, 1u);
            if (v27)
            {
              v28 = v27;
              cmio_XPCMessageSetCFDictionary(v22, "attachments", v27);
              CFRelease(v28);
            }
LABEL_43:
            xpc_dictionary_set_value(v3, "value", v22);
          }
          else
          {
            v32 = CMIOLog();
            if (v32 && os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
              -[CMIOExtensionPropertyState copyXPCDictionary].cold.9();
          }
          xpc_release(v22);
        }
        else
        {
          v30 = CMIOLog();
          if (v30 && os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            -[CMIOExtensionPropertyState copyXPCDictionary].cold.8();
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

- (CMIOExtensionPropertyState)initWithXPCDictionary:(id)a3
{
  uint64_t uint64;
  CMIOExtensionPropertyAttributes *dictionary;
  NSObject *v7;
  NSObject *v8;
  CMIOExtensionPropertyState *v9;
  NSObject *v10;
  NSObject *v11;
  xpc_object_t value;
  xpc_object_t v13;
  __objc2_class *v14;
  NSObject *v15;
  NSObject *v16;
  xpc_object_t v17;
  xpc_object_t v19;
  void *v20;
  xpc_object_t v21;
  __IOSurface *v22;
  __IOSurface *v23;
  CVReturn v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  CFDictionaryRef theAttachments;
  CVPixelBufferRef pixelBufferOut;
  NSObject *v33;

  if (a3)
  {
    v33 = 0;
    uint64 = xpc_dictionary_get_uint64(a3, "type");
    dictionary = (CMIOExtensionPropertyAttributes *)xpc_dictionary_get_dictionary(a3, "attributes");
    if (dictionary)
    {
      dictionary = -[CMIOExtensionPropertyAttributes initWithXPCDictionary:]([CMIOExtensionPropertyAttributes alloc], "initWithXPCDictionary:", dictionary);
      if (!dictionary)
      {
        v7 = CMIOLog();
        dictionary = (CMIOExtensionPropertyAttributes *)v7;
        if (v7)
        {
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
            -[CMIOExtensionPropertyState initWithXPCDictionary:].cold.12();
          dictionary = 0;
        }
      }
    }
    switch(uint64)
    {
      case 2uLL:
        if (cmio_XPCMessageCopyCFData(a3, "value", &v33))
        {
          v8 = CMIOLog();
          if (v8)
          {
            if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
              -[CMIOExtensionPropertyState initWithXPCDictionary:].cold.6();
          }
        }
        break;
      case 3uLL:
        if (cmio_XPCMessageCopyCFNumber(a3, "value", &v33))
        {
          v10 = CMIOLog();
          if (v10)
          {
            if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
              -[CMIOExtensionPropertyState initWithXPCDictionary:].cold.7();
          }
        }
        break;
      case 4uLL:
        if (cmio_XPCMessageCopyCFString(a3, "value", &v33))
        {
          v11 = CMIOLog();
          if (v11)
          {
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
              -[CMIOExtensionPropertyState initWithXPCDictionary:].cold.8();
          }
        }
        break;
      case 5uLL:
        value = xpc_dictionary_get_value(a3, "value");
        if (value)
        {
          v13 = value;
          v14 = CMIOExtensionStreamFormat;
          goto LABEL_34;
        }
        v25 = CMIOLog();
        if (v25 && os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          -[CMIOExtensionPropertyState initWithXPCDictionary:].cold.9();
        break;
      case 6uLL:
        if (cmio_XPCMessageCopyCFDictionary(a3, "value", &v33))
        {
          v15 = CMIOLog();
          if (v15)
          {
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
              -[CMIOExtensionPropertyState initWithXPCDictionary:].cold.10();
          }
        }
        break;
      case 7uLL:
        if (cmio_XPCMessageCopyCFArray(a3, "value", &v33))
        {
          v16 = CMIOLog();
          if (v16)
          {
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              -[CMIOExtensionPropertyState initWithXPCDictionary:].cold.11();
          }
        }
        break;
      case 8uLL:
        v17 = xpc_dictionary_get_value(a3, "value");
        if (v17)
        {
          v13 = v17;
          v14 = CMIOExtensionStreamCustomClockConfiguration;
LABEL_34:
          v33 = objc_msgSend([v14 alloc], "initWithXPCDictionary:", v13);
        }
        else
        {
          v26 = CMIOLog();
          if (v26 && os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            -[CMIOExtensionPropertyState initWithXPCDictionary:].cold.5();
        }
        break;
      case 9uLL:
        v19 = xpc_dictionary_get_value(a3, "value");
        if (v19)
        {
          v20 = v19;
          v21 = xpc_dictionary_get_value(v19, "surface");
          if (v21)
          {
            v22 = IOSurfaceLookupFromXPCObject(v21);
            if (v22)
            {
              v23 = v22;
              pixelBufferOut = 0;
              v24 = CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x24BDBD240], v22, 0, &pixelBufferOut);
              CFRelease(v23);
              if (v24 || !pixelBufferOut)
              {
                if (pixelBufferOut)
                  CFRelease(pixelBufferOut);
                v30 = CMIOLog();
                if (v30 && os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                  -[CMIOExtensionPropertyState initWithXPCDictionary:].cold.4();
              }
              else
              {
                v33 = pixelBufferOut;
                theAttachments = 0;
                cmio_XPCMessageCopyCFDictionary(v20, "attachments", (NSObject **)&theAttachments);
                if (theAttachments)
                {
                  CMSetAttachments(pixelBufferOut, theAttachments, 1u);
                  CFRelease(theAttachments);
                }
              }
            }
            else
            {
              v29 = CMIOLog();
              if (v29 && os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                -[CMIOExtensionPropertyState initWithXPCDictionary:].cold.3();
            }
          }
          else
          {
            v28 = CMIOLog();
            if (v28 && os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              -[CMIOExtensionPropertyState initWithXPCDictionary:].cold.2();
          }
        }
        else
        {
          v27 = CMIOLog();
          if (v27 && os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            -[CMIOExtensionPropertyState initWithXPCDictionary:].cold.1();
        }
        break;
      default:
        break;
    }
    v9 = -[CMIOExtensionPropertyState initWithValue:attributes:](self, "initWithValue:attributes:", v33, dictionary);

  }
  else
  {

    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("nil xpc dictionary"));
    return 0;
  }
  return v9;
}

+ (id)copyXPCDictionaryFromPropertyStates:(id)a3
{
  xpc_object_t v4;
  _QWORD v6[5];

  v4 = xpc_dictionary_create(0, 0, 0);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __66__CMIOExtensionPropertyState_copyXPCDictionaryFromPropertyStates___block_invoke;
  v6[3] = &unk_250457DB8;
  v6[4] = v4;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v6);
  return v4;
}

void __66__CMIOExtensionPropertyState_copyXPCDictionaryFromPropertyStates___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  NSObject *v7;

  v5 = (void *)objc_msgSend(a3, "copyXPCDictionary");
  if (v5)
  {
    v6 = v5;
    xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), (const char *)objc_msgSend(a2, "UTF8String"), v5);
    xpc_release(v6);
  }
  else
  {
    v7 = CMIOLog();
    if (v7)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __66__CMIOExtensionPropertyState_copyXPCDictionaryFromPropertyStates___block_invoke_cold_1();
    }
  }
}

+ (id)copyXPCDictionaryFromPropertyValues:(id)a3
{
  xpc_object_t v4;
  _QWORD v6[5];

  v4 = xpc_dictionary_create(0, 0, 0);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __66__CMIOExtensionPropertyState_copyXPCDictionaryFromPropertyValues___block_invoke;
  v6[3] = &unk_250457618;
  v6[4] = v4;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v6);
  return v4;
}

void __66__CMIOExtensionPropertyState_copyXPCDictionaryFromPropertyValues___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  CMIOExtensionPropertyState *v5;
  CMIOExtensionPropertyState *v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;

  v5 = -[CMIOExtensionPropertyState initWithValue:]([CMIOExtensionPropertyState alloc], "initWithValue:", a3);
  if (v5)
  {
    v6 = v5;
    v7 = -[CMIOExtensionPropertyState copyXPCDictionary](v5, "copyXPCDictionary");
    if (v7)
    {
      v8 = v7;
      xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), (const char *)objc_msgSend(a2, "UTF8String"), v7);
      xpc_release(v8);
    }
    else
    {
      v10 = CMIOLog();
      if (v10)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          __66__CMIOExtensionPropertyState_copyXPCDictionaryFromPropertyValues___block_invoke_cold_2();
      }
    }

  }
  else
  {
    v9 = CMIOLog();
    if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __66__CMIOExtensionPropertyState_copyXPCDictionaryFromPropertyValues___block_invoke_cold_1();
  }
}

+ (id)copyPropertyStatesFromXPCDictionary:(id)a3
{
  id v4;
  _QWORD applier[5];

  if (a3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    applier[0] = MEMORY[0x24BDAC760];
    applier[1] = 3221225472;
    applier[2] = __66__CMIOExtensionPropertyState_copyPropertyStatesFromXPCDictionary___block_invoke;
    applier[3] = &unk_250457DE0;
    applier[4] = v4;
    xpc_dictionary_apply(a3, applier);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("nil xpc dictionary"));
    return 0;
  }
  return v4;
}

uint64_t __66__CMIOExtensionPropertyState_copyPropertyStatesFromXPCDictionary___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  CMIOExtensionPropertyState *v5;
  CMIOExtensionPropertyState *v6;
  NSObject *v7;

  v5 = -[CMIOExtensionPropertyState initWithXPCDictionary:]([CMIOExtensionPropertyState alloc], "initWithXPCDictionary:", a3);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a2));

  }
  else
  {
    v7 = CMIOLog();
    if (v7 && os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __66__CMIOExtensionPropertyState_copyPropertyStatesFromXPCDictionary___block_invoke_cold_1();
  }
  return 1;
}

- (id)value
{
  return objc_getProperty(self, a2, 16, 1);
}

- (CMIOExtensionPropertyAttributes)attributes
{
  return (CMIOExtensionPropertyAttributes *)objc_getProperty(self, a2, 24, 1);
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

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s could not create xpc object", v2, v3, v4, v5, v6);
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

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s nil xpc object", v2, v3, v4, v5, v6);
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

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s pixel buffer missing surface", v2, v3, v4, v5, v6);
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

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s Could not lookup surface", v2, v3, v4, v5, v6);
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

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10_0(&dword_2330C2000, v0, v1, "%s:%d:%s Could not create pixel buffer: %d", v2, v3, v4, v5, v6);
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

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s nil xpc object", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageCopyCFData failed", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageCopyCFNumber failed", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageCopyCFString failed", v2, v3, v4, v5, v6);
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

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s nil xpc object", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageCopyCFDictionary failed", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageCopyCFArray failed", v2, v3, v4, v5, v6);
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

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s could not create attributes", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __66__CMIOExtensionPropertyState_copyXPCDictionaryFromPropertyStates___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s copyXPCDictionary error for %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __66__CMIOExtensionPropertyState_copyXPCDictionaryFromPropertyValues___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s CMIOExtensionPropertyState alloc failed for %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __66__CMIOExtensionPropertyState_copyXPCDictionaryFromPropertyValues___block_invoke_cold_2()
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
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s copyXPCDictionary error for %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __66__CMIOExtensionPropertyState_copyPropertyStatesFromXPCDictionary___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s initWithXPCDictionary failed for %{public}s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
