@implementation BSXPCCoder

- (id)_finishCoding
{
  int *p_finalized;

  p_finalized = &self->_finalized;
  while (!__ldxr((unsigned int *)p_finalized))
  {
    if (!__stxr(1u, (unsigned int *)p_finalized))
      return self->_message;
  }
  __clrex();
  return self->_message;
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (self->_codingContext)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSXPCCoder.m"), 154, CFSTR("cannot dealloc while the coding context is in flight"));

  }
  v5.receiver = self;
  v5.super_class = (Class)BSXPCCoder;
  -[BSXPCCoder dealloc](&v5, sel_dealloc);
}

- (OS_xpc_object)message
{
  return self->_message;
}

- (OS_xpc_object)XPCConnection
{
  return self->_xpcConnection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codingContext, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeBool:(BOOL)a3 forKey:(id)a4
{
  uint64_t v6;
  const char *v7;
  OS_xpc_object *codingContext;

  v6 = objc_msgSend(objc_retainAutorelease(a4), "UTF8String");
  if (v6)
  {
    v7 = (const char *)v6;
    codingContext = self->_codingContext;
    if (!codingContext)
      codingContext = self->_message;
    xpc_dictionary_set_BOOL(codingContext, v7, a3);
  }
}

- (BOOL)decodeBoolForKey:(id)a3
{
  uint64_t v4;
  const char *v5;
  OS_xpc_object *codingContext;

  v4 = objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  if (v4)
  {
    v5 = (const char *)v4;
    codingContext = self->_codingContext;
    if (!codingContext)
      codingContext = self->_message;
    LOBYTE(v4) = xpc_dictionary_get_BOOL(codingContext, v5);
  }
  return v4;
}

- (BSXPCCoder)init
{
  return -[BSXPCCoder initWithMessage:](self, "initWithMessage:", 0);
}

- (void)encodeUInt64:(unint64_t)a3 forKey:(id)a4
{
  uint64_t v6;
  const char *v7;
  OS_xpc_object *codingContext;

  v6 = objc_msgSend(objc_retainAutorelease(a4), "UTF8String");
  if (v6)
  {
    v7 = (const char *)v6;
    codingContext = self->_codingContext;
    if (!codingContext)
      codingContext = self->_message;
    xpc_dictionary_set_uint64(codingContext, v7, a3);
  }
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;

  -[BSXPCCoder createMessage](self, "createMessage");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "encodeXPCObject:forKey:");

}

- (void)encodeObject:(id)a3 forKey:(id)a4
{
  int *p_finalized;
  unsigned int v9;
  void *v10;
  void *v11;

  p_finalized = &self->_finalized;
  while (1)
  {
    v9 = __ldxr((unsigned int *)p_finalized);
    if (v9 != 1)
      break;
    if (!__stxr(1u, (unsigned int *)p_finalized))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSXPCCoder.m"), 174, CFSTR("cannot continue encoding after finalizing"));

      goto LABEL_6;
    }
  }
  __clrex();
LABEL_6:
  if (a4)
  {
    if (!a3)
      return;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSXPCCoder.m"), 175, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key != nil"));

  if (a3)
LABEL_8:
    _BSXPCEncodeObjectForKey((uint64_t)self, a3, a4);
}

- (void)encodeCollection:(id)a3 forKey:(id)a4
{
  void *v8;

  if (a3
    && (objc_msgSend(a3, "isNSArray") & 1) == 0
    && (objc_msgSend(a3, "isNSSet") & 1) == 0
    && (objc_msgSend(a3, "isNSOrderedSet") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSXPCCoder.m"), 183, CFSTR("Collection class %@ not supported"), objc_msgSend(a3, "classForCoder"));

  }
  -[BSXPCCoder encodeObject:forKey:](self, "encodeObject:forKey:", a3, a4);
}

- (id)decodeStringForKey:(id)a3
{
  OS_xpc_object *codingContext;
  OS_xpc_object *v5;
  const char *v6;
  OS_xpc_object *v7;
  OS_xpc_object *v8;
  OS_xpc_object *v9;
  Class v10;
  objc_class *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v17;
  Class Class;
  objc_class *v19;
  void *v20;
  void *v21;

  codingContext = self->_codingContext;
  if (!codingContext)
    codingContext = self->_message;
  v5 = codingContext;
  v6 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  v7 = v5;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "xpc_object_t  _Nullable BSXPCDictionaryGetValue(xpc_object_t  _Nullable __strong, const char * _Nonnull, xpc_type_t _Nullable)");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("BSXPCObjectUtilities.h"), 50, CFSTR("key must not be nil"));

  }
  v8 = v7;
  v9 = v8;
  if (v8
    && (v10 = object_getClass(v8),
        v11 = (objc_class *)MEMORY[0x1E0C812F8],
        v9,
        v9,
        v10 == v11))
  {
    xpc_dictionary_get_value(v9, v6);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v12 = v17;
    if (v17)
    {
      Class = object_getClass(v17);
      v19 = (objc_class *)MEMORY[0x1E0C81390];

      if (Class == v19)
        v13 = v12;
      else
        v13 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    v12 = 0;
  }
  v13 = 0;
LABEL_9:
  v14 = v13;

  if (v14)
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", xpc_string_get_string_ptr(v14));
  else
    v15 = 0;

  return v15;
}

- (id)decodeObjectOfClass:(Class)a3 forKey:(id)a4
{
  return _BSXPCDecodeObjectForKey((uint64_t)self, a4, a3, 0);
}

- (id)decodeCollectionOfClass:(Class)a3 containingClass:(Class)a4 forKey:(id)a5
{
  return _BSXPCDecodeObjectForKey((uint64_t)self, a5, a3, a4);
}

- (BSXPCCoder)initWithBSXPCCoder:(id)a3
{
  void *v4;
  BSXPCCoder *v5;

  objc_msgSend(a3, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C812F8], CFSTR("message"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BSXPCCoder initWithMessage:](self, "initWithMessage:", v4);

  return v5;
}

- (id)decodeXPCObjectOfType:(_xpc_type_s *)a3 forKey:(id)a4
{
  uint64_t class4NSXPC;

  if (a3)
    class4NSXPC = xpc_get_class4NSXPC();
  else
    class4NSXPC = (uint64_t)BSXPCObjectBaseClass();
  return -[BSXPCCoder decodeObjectOfClass:forKey:](self, "decodeObjectOfClass:forKey:", class4NSXPC, a4);
}

+ (id)coder
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithMessage:", 0);
}

+ (id)coderWithMessage:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithMessage:", a3);
}

- (BSXPCCoder)initWithMessage:(id)a3
{
  BSXPCCoder *v6;
  BSXPCCoder *v7;
  uint64_t v8;
  OS_xpc_object *xpcConnection;
  OS_xpc_object *v10;
  void *v12;
  objc_super v13;

  if (a3 && object_getClass(a3) != (Class)MEMORY[0x1E0C812F8])
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSXPCCoder.m"), 138, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!message || (xpc_get_type(message) == XPC_TYPE_DICTIONARY)"));

  }
  v13.receiver = self;
  v13.super_class = (Class)BSXPCCoder;
  v6 = -[BSXPCCoder init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_finalized = 0;
    if (a3)
    {
      objc_storeStrong((id *)&v6->_message, a3);
      xpc_dictionary_get_remote_connection(a3);
      v8 = objc_claimAutoreleasedReturnValue();
      xpcConnection = v7->_xpcConnection;
      v7->_xpcConnection = (OS_xpc_object *)v8;
    }
    else
    {
      v10 = (OS_xpc_object *)xpc_dictionary_create(0, 0, 0);
      xpcConnection = v7->_message;
      v7->_message = v10;
    }

  }
  return v7;
}

- (unint64_t)decodeUInt64ForKey:(id)a3
{
  unint64_t result;
  const char *v5;
  OS_xpc_object *codingContext;

  result = objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  if (result)
  {
    v5 = (const char *)result;
    codingContext = self->_codingContext;
    if (!codingContext)
      codingContext = self->_message;
    return xpc_dictionary_get_uint64(codingContext, v5);
  }
  return result;
}

- (BOOL)containsValueForKey:(id)a3
{
  OS_xpc_object *codingContext;
  OS_xpc_object *v5;
  const char *v6;
  OS_xpc_object *v7;
  OS_xpc_object *v8;
  OS_xpc_object *v9;
  Class Class;
  objc_class *v11;
  void *v12;
  void *v14;
  void *v15;

  codingContext = self->_codingContext;
  if (!codingContext)
    codingContext = self->_message;
  v5 = codingContext;
  v6 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  v7 = v5;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "xpc_object_t  _Nullable BSXPCDictionaryGetValue(xpc_object_t  _Nullable __strong, const char * _Nonnull, xpc_type_t _Nullable)");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("BSXPCObjectUtilities.h"), 50, CFSTR("key must not be nil"));

  }
  v8 = v7;
  v9 = v8;
  if (v8
    && (Class = object_getClass(v8),
        v11 = (objc_class *)MEMORY[0x1E0C812F8],
        v9,
        v9,
        Class == v11))
  {
    xpc_dictionary_get_value(v9, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12 != 0;
}

- (id)_implicitDecodeXPCObjectForKey:(id)a3
{
  OS_xpc_object *codingContext;
  OS_xpc_object *v5;
  const char *v6;
  OS_xpc_object *v7;
  OS_xpc_object *v8;
  OS_xpc_object *v9;
  Class Class;
  objc_class *v11;
  void *v12;
  id v13;
  void *v15;
  void *v16;

  codingContext = self->_codingContext;
  if (!codingContext)
    codingContext = self->_message;
  v5 = codingContext;
  v6 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  v7 = v5;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "xpc_object_t  _Nullable BSXPCDictionaryGetValue(xpc_object_t  _Nullable __strong, const char * _Nonnull, xpc_type_t _Nullable)");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("BSXPCObjectUtilities.h"), 50, CFSTR("key must not be nil"));

  }
  v8 = v7;
  v9 = v8;
  if (v8
    && (Class = object_getClass(v8),
        v11 = (objc_class *)MEMORY[0x1E0C812F8],
        v9,
        v9,
        Class == v11))
  {
    xpc_dictionary_get_value(v9, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  if (v12 && (BSXPCObjectBaseClass(), (objc_opt_isKindOfClass() & 1) != 0))
    v13 = v12;
  else
    v13 = 0;

  return v13;
}

- (int64_t)decodeInt64ForKey:(id)a3
{
  int64_t result;
  const char *v5;
  OS_xpc_object *codingContext;

  result = objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  if (result)
  {
    v5 = (const char *)result;
    codingContext = self->_codingContext;
    if (!codingContext)
      codingContext = self->_message;
    return xpc_dictionary_get_int64(codingContext, v5);
  }
  return result;
}

- (void)encodeInt64:(int64_t)a3 forKey:(id)a4
{
  uint64_t v6;
  const char *v7;
  OS_xpc_object *codingContext;

  v6 = objc_msgSend(objc_retainAutorelease(a4), "UTF8String");
  if (v6)
  {
    v7 = (const char *)v6;
    codingContext = self->_codingContext;
    if (!codingContext)
      codingContext = self->_message;
    xpc_dictionary_set_int64(codingContext, v7, a3);
  }
}

- (void)encodeDictionary:(id)a3 forKey:(id)a4
{
  void *v8;

  if (a3 && (objc_msgSend(a3, "isNSDictionary") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSXPCCoder.m"), 188, CFSTR("Object is not an NSDictionary"));

  }
  -[BSXPCCoder encodeObject:forKey:](self, "encodeObject:forKey:", a3, a4);
}

- (void)encodeCGPoint:(CGPoint)a3 forKey:(id)a4
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3B18], "bs_valueWithCGPoint:", a3.x, a3.y);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[BSXPCCoder encodeObject:forKey:](self, "encodeObject:forKey:");

}

- (void)encodeCGSize:(CGSize)a3 forKey:(id)a4
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3B18], "bs_valueWithCGSize:", a3.width, a3.height);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[BSXPCCoder encodeObject:forKey:](self, "encodeObject:forKey:");

}

- (void)encodeCGRect:(CGRect)a3 forKey:(id)a4
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3B18], "bs_valueWithCGRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[BSXPCCoder encodeObject:forKey:](self, "encodeObject:forKey:");

}

- (void)encodeDouble:(double)a3 forKey:(id)a4
{
  OS_xpc_object *codingContext;
  OS_xpc_object *v7;

  codingContext = self->_codingContext;
  if (!codingContext)
    codingContext = self->_message;
  v7 = codingContext;
  BSSerializeDoubleToXPCDictionaryWithKey(v7, (const char *)objc_msgSend(objc_retainAutorelease(a4), "UTF8String"), a3);

}

- (id)decodeDictionaryOfClass:(Class)a3 forKey:(id)a4
{
  objc_class *v7;

  v7 = (objc_class *)objc_opt_class();
  return _BSXPCDecodeObjectForKey((uint64_t)self, a4, v7, a3);
}

- (CGPoint)decodeCGPointForKey:(id)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  -[BSXPCCoder decodeObjectOfClass:forKey:](self, "decodeObjectOfClass:forKey:", objc_opt_class(), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_CGPointValue");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (CGSize)decodeCGSizeForKey:(id)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[BSXPCCoder decodeObjectOfClass:forKey:](self, "decodeObjectOfClass:forKey:", objc_opt_class(), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_CGSizeValue");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGRect)decodeCGRectForKey:(id)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[BSXPCCoder decodeObjectOfClass:forKey:](self, "decodeObjectOfClass:forKey:", objc_opt_class(), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_CGRectValue");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (double)decodeDoubleForKey:(id)a3
{
  OS_xpc_object *codingContext;
  OS_xpc_object *v5;
  double v6;

  codingContext = self->_codingContext;
  if (!codingContext)
    codingContext = self->_message;
  v5 = codingContext;
  v6 = BSDeserializeDoubleFromXPCDictionaryWithKey(v5, (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"));

  return v6;
}

- (void)_removeValueForKey:(id)a3
{
  OS_xpc_object *codingContext;
  OS_xpc_object *v5;
  const char *v6;
  OS_xpc_object *v7;
  void *v8;
  void *v9;
  void *v10;
  OS_xpc_object *xdict;

  if (a3)
  {
    codingContext = self->_codingContext;
    if (!codingContext)
      codingContext = self->_message;
    v5 = codingContext;
    v6 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
    v7 = v5;
    xdict = v7;
    if (v6)
    {
      if (v7)
      {
        xpc_dictionary_get_value(v7, v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
          xpc_dictionary_set_value(xdict, v6, 0);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BSXPCDictionarySetValue(xpc_object_t  _Nullable __strong, const char * _Nonnull, xpc_object_t  _Nullable __strong, xpc_type_t _Nullable)");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("BSXPCObjectUtilities.h"), 61, CFSTR("key must not be nil"));

    }
  }
}

+ (id)_testEncodeAndDecodeObject:(id)a3 ofClass:(Class)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  +[BSXPCCoder coder](BSXPCCoder, "coder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", a3, CFSTR("test"));
  objc_msgSend(v6, "createMessage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[BSXPCCoder coderWithMessage:](BSXPCCoder, "coderWithMessage:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "decodeObjectOfClass:forKey:", a4, CFSTR("test"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)description
{
  return (NSString *)-[BSXPCCoder descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (void)_appendXPCObject:(uint64_t)a3 withName:(void *)a4 toBuilder:
{
  id v7;
  void *v8;
  Class Class;
  objc_class *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[7];
  _QWORD v15[7];

  if (a1)
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
    v7 = a2;
    v8 = v7;
    if (!v7)
      goto LABEL_8;
    Class = object_getClass(v7);
    v10 = (objc_class *)MEMORY[0x1E0C812F8];

    if (Class == v10)
    {
      objc_msgSend(a4, "activeMultilinePrefix");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __50__BSXPCCoder__appendXPCObject_withName_toBuilder___block_invoke;
      v15[3] = &unk_1E1EC01E8;
      v15[4] = v8;
      v15[5] = a1;
      v15[6] = a4;
      objc_msgSend(a4, "appendBodySectionWithName:multilinePrefix:block:", v13, v12, v15);
    }
    else
    {
      if (object_getClass(v8) != (Class)MEMORY[0x1E0C812C8])
      {
LABEL_8:
        v11 = (id)objc_msgSend(a4, "appendObject:withName:skipIfNil:", v8, v13, 0);

        return;
      }
      objc_msgSend(a4, "activeMultilinePrefix");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __50__BSXPCCoder__appendXPCObject_withName_toBuilder___block_invoke_3;
      v14[3] = &unk_1E1EC01E8;
      v14[4] = v8;
      v14[5] = a1;
      v14[6] = a4;
      objc_msgSend(a4, "appendBodySectionWithName:multilinePrefix:block:", v13, v12, v14);
    }

  }
}

BOOL __50__BSXPCCoder__appendXPCObject_withName_toBuilder___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[4];
  __int128 v4;

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__BSXPCCoder__appendXPCObject_withName_toBuilder___block_invoke_2;
  v3[3] = &unk_1E1EC01C0;
  v4 = *(_OWORD *)(a1 + 40);
  return xpc_dictionary_apply(v1, v3);
}

uint64_t __50__BSXPCCoder__appendXPCObject_withName_toBuilder___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  -[BSXPCCoder _appendXPCObject:withName:toBuilder:](*(_QWORD *)(a1 + 32), a3, a2, *(_QWORD *)(a1 + 40));
  return 1;
}

BOOL __50__BSXPCCoder__appendXPCObject_withName_toBuilder___block_invoke_3(uint64_t a1)
{
  void *v1;
  _QWORD v3[4];
  __int128 v4;

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__BSXPCCoder__appendXPCObject_withName_toBuilder___block_invoke_4;
  v3[3] = &unk_1E1EC0210;
  v4 = *(_OWORD *)(a1 + 40);
  return xpc_array_apply(v1, v3);
}

uint64_t __50__BSXPCCoder__appendXPCObject_withName_toBuilder___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), a2);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[BSXPCCoder _appendXPCObject:withName:toBuilder:](v5, a3, objc_msgSend(v6, "UTF8String"), *(_QWORD *)(a1 + 40));

  return 1;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[BSXPCCoder succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;

  +[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", xpc_dictionary_get_count(self->_message), CFSTR("valueCount"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[BSXPCCoder descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;

  -[BSXPCCoder succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (xpc_dictionary_get_count(self->_message))
    -[BSXPCCoder _appendXPCObject:withName:toBuilder:]((uint64_t)self, self->_message, 0, v4);
  return v4;
}

@end
