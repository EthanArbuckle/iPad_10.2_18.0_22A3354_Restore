@implementation _NSPropertyDescriptionProxy

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_underlyingProperty;
}

- (id)_underlyingProperty
{
  return self->_underlyingProperty;
}

- (BOOL)isKindOfClass:(Class)a3
{
  return objc_opt_isKindOfClass() & 1;
}

- (id)entity
{
  return self->_entityDescription;
}

- (unsigned)_entitysReferenceID
{
  return self->_entitysReferenceIDForProperty;
}

+ (BOOL)resolveInstanceMethod:(SEL)a3
{
  objc_class *v5;
  objc_method *InstanceMethod;
  objc_class *v7;
  char *TypeEncoding;
  const char *v9;
  int v10;
  void (*v11)(void);

  v5 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v5, a3);
  if (InstanceMethod
    || (v7 = (objc_class *)objc_opt_class(),
        TypeEncoding = (char *)class_getInstanceMethod(v7, a3),
        (InstanceMethod = (objc_method *)TypeEncoding) != 0))
  {
    TypeEncoding = (char *)method_getTypeEncoding(InstanceMethod);
    if (TypeEncoding)
    {
      v9 = TypeEncoding;
      if (method_getNumberOfArguments(InstanceMethod) == 2)
      {
        LOBYTE(TypeEncoding) = 0;
        v10 = *v9;
        if (v10 <= 98)
        {
          if (v10 == 64)
          {
            v11 = (void (*)(void))returnIdThing1;
            goto LABEL_15;
          }
          if (v10 != 81)
            return (char)TypeEncoding;
LABEL_12:
          v11 = (void (*)(void))returnUIntegerThing1;
LABEL_15:
          class_addMethod((Class)a1, a3, v11, v9);
          LOBYTE(TypeEncoding) = 1;
          return (char)TypeEncoding;
        }
        if (v10 == 99)
        {
          v11 = (void (*)(void))returnBoolThing1;
          goto LABEL_15;
        }
        if (v10 == 113)
          goto LABEL_12;
      }
      else
      {
        LOBYTE(TypeEncoding) = 0;
      }
    }
  }
  return (char)TypeEncoding;
}

- (_NSPropertyDescriptionProxy)initWithPropertyDescription:(id)a3
{
  self->_underlyingProperty = (NSPropertyDescription *)a3;
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_NSPropertyDescriptionProxy)initWithCoder:(id)a3
{
  _NSPropertyDescriptionProxy *v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;
  _QWORD v14[2];
  void (*v15)(uint64_t);
  void *v16;
  _QWORD *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)_NSPropertyDescriptionProxy;
  v4 = -[_NSPropertyDescriptionProxy init](&v18, sel_init);
  if (v4)
  {
    v5 = +[PFModelDecoderContext retainedContext](PFModelDecoderContext, "retainedContext");
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v15 = __45___NSPropertyDescriptionProxy_initWithCoder___block_invoke;
    v16 = &unk_1E1EDD520;
    v17 = v5;
    v6 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSUnderlyingProperty"));
    v4->_underlyingProperty = (NSPropertyDescription *)v6;
    if (!v6)
      goto LABEL_11;
    if (v5)
      v7 = (void *)v5[3];
    else
      v7 = 0;
    objc_msgSend(v7, "addObject:", v6);
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
      v9 = &unk_1E1F4B010;
    else
      v9 = &unk_1E1F4AFE8;
    if ((isKindOfClass & 1 & (v5 != 0)) == 0)
      goto LABEL_18;
    if (v5[1] || v5[2])
    {
LABEL_11:
      v4->_entitysReferenceIDForProperty = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSReferenceID"));
      v10 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSEntityDescription"));
      v4->_entityDescription = (NSEntityDescription *)v10;
      if (!v10)
      {
LABEL_19:
        v15((uint64_t)v14);
        return v4;
      }
      if (v5)
        v11 = (void *)v5[3];
      else
        v11 = 0;
      objc_msgSend(v11, "addObject:", v10);
      objc_opt_class();
      v12 = objc_opt_isKindOfClass();
      if ((v12 & 1) != 0)
        v9 = &unk_1E1F4B060;
      else
        v9 = &unk_1E1F4B038;
      if (v5 != 0 && (v12 & 1) != 0)
      {
        if (v5[1] || v5[2])
          goto LABEL_19;
        v9 = &unk_1E1F4B060;
      }
    }
    else
    {
      v9 = &unk_1E1F4B010;
    }
LABEL_18:
    objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4866, v9));

    v4 = 0;
    goto LABEL_19;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_underlyingProperty, CFSTR("NSUnderlyingProperty"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_entitysReferenceIDForProperty, CFSTR("NSReferenceID"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_entityDescription, CFSTR("NSEntityDescription"));
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Proxy for prop named %@ on ed %@, real %@"), -[NSPropertyDescription name](self->_underlyingProperty, "name"), -[NSEntityDescription name](self->_entityDescription, "name"), self->_underlyingProperty);
}

- (void)_setEntitysReferenceID:(unsigned int)a3
{
  self->_entitysReferenceIDForProperty = a3;
}

- (void)_setEntity:(id)a3
{
  self->_entityDescription = (NSEntityDescription *)a3;
}

- (void)_setEntityAndMaintainIndices:(id)a3
{
  self->_entityDescription = (NSEntityDescription *)a3;
}

- (void)_versionHash:(char *)a3 inStyle:(unint64_t)a4
{
  unint64_t v7;
  NSPropertyDescription *underlyingProperty;

  v7 = -[NSPropertyDescription _propertyType](self->_underlyingProperty, "_propertyType");
  underlyingProperty = self->_underlyingProperty;
  if (v7 == 4)
    -[NSPropertyDescription _versionHash:inStyle:proxyContext:](underlyingProperty, "_versionHash:inStyle:proxyContext:", a3, a4, self);
  else
    -[NSPropertyDescription _versionHash:inStyle:](underlyingProperty, "_versionHash:inStyle:", a3, a4);
}

- (Class)class
{
  return (Class)objc_opt_class();
}

- (BOOL)isEqual:(id)a3
{
  return -[NSPropertyDescription isEqual:](self->_underlyingProperty, "isEqual:", a3);
}

- (unint64_t)hash
{
  return -[NSPropertyDescription hash](self->_underlyingProperty, "hash");
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)-[NSPropertyDescription methodSignatureForSelector:](self->_underlyingProperty, "methodSignatureForSelector:", a3);
}

@end
