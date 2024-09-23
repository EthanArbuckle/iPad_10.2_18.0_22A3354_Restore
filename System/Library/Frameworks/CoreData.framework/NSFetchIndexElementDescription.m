@implementation NSFetchIndexElementDescription

- (BOOL)isAscending
{
  return *(_DWORD *)&self->_indexElementDescriptionFlags & 1;
}

- (NSFetchIndexElementType)collationType
{
  return self->_collationType;
}

- (_QWORD)initWithPropertyName:(void *)a3 property:(uint64_t)a4 collationType:(int)a5 ascending:
{
  _QWORD *v9;
  unsigned int v10;
  objc_super v12;

  if (!a1)
    return 0;
  v12.receiver = a1;
  v12.super_class = (Class)NSFetchIndexElementDescription;
  v9 = objc_msgSendSuper2(&v12, sel_init);
  if (v9)
  {
    v9[2] = a2;
    if (a3 && objc_msgSend(a3, "_propertyType") == 5)
    {
      v9[1] = a3;
      v10 = *((_DWORD *)v9 + 10) | 2;
    }
    else
    {
      v9[1] = 0;
      v10 = v9[5] & 0xFFFFFFFD;
    }
    v9[3] = a4;
    *((_DWORD *)v9 + 10) = v10 & 0xFFFFFFFE | a5;
  }
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSFetchIndexElementDescription)initWithProperty:(NSPropertyDescription *)property collationType:(NSFetchIndexElementType)collationType
{
  unint64_t v7;
  NSFetchIndexElementDescription *v8;
  unsigned int v9;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  objc_super v14;

  if (!property)
  {

    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = *MEMORY[0x1E0C99778];
    v13 = CFSTR("Can't create an index element without a property");
    goto LABEL_17;
  }
  if (!-[NSPropertyDescription name](property, "name"))
  {

    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = *MEMORY[0x1E0C99778];
    v13 = CFSTR("Can't create an index element with an unnamed property");
    goto LABEL_17;
  }
  v7 = -[NSPropertyDescription _propertyType](property, "_propertyType");
  if (v7 - 4 >= 3 && v7 != 2)
  {
    if (v7 == 7)
    {

      v11 = (void *)MEMORY[0x1E0C99DA0];
      v12 = *MEMORY[0x1E0C99778];
      v13 = CFSTR("Can't create an index element with composite property");
    }
    else
    {

      v11 = (void *)MEMORY[0x1E0C99DA0];
      v12 = *MEMORY[0x1E0C99778];
      v13 = CFSTR("Can't create an index element with non-attribute property");
    }
LABEL_17:
    objc_exception_throw((id)objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, v13, 0));
  }
  -[NSFetchIndexElementDescription _validateCollationType:forProperty:]((uint64_t)self, collationType, property);
  v14.receiver = self;
  v14.super_class = (Class)NSFetchIndexElementDescription;
  v8 = -[NSFetchIndexElementDescription init](&v14, sel_init);
  if (v8)
  {
    if (-[NSPropertyDescription _propertyType](property, "_propertyType") == 5 || !v8->_indexDescription)
    {
      v8->_property = property;
      v9 = *(_DWORD *)&v8->_indexElementDescriptionFlags | 2;
    }
    else
    {
      v8->_property = property;
      v9 = *(_DWORD *)&v8->_indexElementDescriptionFlags & 0xFFFFFFFD;
    }
    v8->_indexElementDescriptionFlags = (__indexElementDescriptionFlags)v9;
    v8->_propertyName = -[NSPropertyDescription name](property, "name");
    v8->_collationType = collationType;
    *(_DWORD *)&v8->_indexElementDescriptionFlags |= 1u;
  }
  return v8;
}

- (uint64_t)_validateCollationType:(void *)a3 forProperty:
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (result && a2 == 1)
  {
    if (objc_msgSend(a3, "_propertyType") == 2 || objc_msgSend(a3, "_propertyType") == 6)
    {
      result = objc_msgSend(a3, "attributeType");
      if (result == 100 || result == 200 || result == 600)
        return result;
      v4 = (void *)MEMORY[0x1E0C99DA0];
      v5 = *MEMORY[0x1E0C99778];
      v8 = CFSTR("property");
      v9 = a3;
      v6 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
      v7 = CFSTR("Invalid collation type (rtree indexes can only be created for floats or integers < 32 bit).");
    }
    else
    {
      v4 = (void *)MEMORY[0x1E0C99DA0];
      v5 = *MEMORY[0x1E0C99778];
      v10 = CFSTR("property");
      v11[0] = a3;
      v6 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
      v7 = CFSTR("Invalid collation type (rtree indexes can only be created on attributes).");
    }
    objc_exception_throw((id)objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, v7, v6));
  }
  return result;
}

- (void)_setIndexDescription:(uint64_t)a1
{
  unsigned int v4;
  id v5;

  if (a1)
  {
    if (!a2 || *(_QWORD *)(a1 + 32) || objc_msgSend(*(id *)(a1 + 8), "_propertyType") == 5)
      goto LABEL_10;
    if (objc_msgSend(a2, "entity"))
    {

      *(_QWORD *)(a1 + 8) = 0;
      v4 = *(_DWORD *)(a1 + 40) & 0xFFFFFFFD;
    }
    else
    {
      if ((*(_BYTE *)(a1 + 40) & 2) != 0)
      {
LABEL_10:
        *(_QWORD *)(a1 + 32) = a2;
        return;
      }
      v5 = *(id *)(a1 + 8);
      v4 = *(_DWORD *)(a1 + 40) | 2;
    }
    *(_DWORD *)(a1 + 40) = v4;
    goto LABEL_10;
  }
}

- (NSPropertyDescription)property
{
  NSPropertyDescription *property;
  NSFetchIndexDescription *indexDescription;
  uint64_t v6;
  __indexElementDescriptionFlags indexElementDescriptionFlags;

  property = self->_property;
  if (!property)
  {
    indexDescription = self->_indexDescription;
    if (indexDescription)
    {
      v6 = -[NSFetchIndexDescription entity](indexDescription, "entity");
      if (v6)
        property = (NSPropertyDescription *)objc_msgSend(*(id *)(v6 + 96), "objectForKey:", self->_propertyName);
      else
        property = 0;
      if (!-[NSPropertyDescription _isEditable](property, "_isEditable"))
      {
        indexElementDescriptionFlags = self->_indexElementDescriptionFlags;
        if ((*(_BYTE *)&indexElementDescriptionFlags & 2) != 0)
        {

          indexElementDescriptionFlags = self->_indexElementDescriptionFlags;
        }
        self->_property = property;
        self->_indexElementDescriptionFlags = (__indexElementDescriptionFlags)(*(_DWORD *)&indexElementDescriptionFlags & 0xFFFFFFFD);
      }
    }
    else
    {
      return 0;
    }
  }
  return property;
}

- (NSFetchIndexElementDescription)initWithCoder:(id)a3
{
  NSFetchIndexElementDescription *v4;
  _QWORD *v5;
  NSString *v6;
  uint64_t v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  unsigned int v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  _QWORD *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)NSFetchIndexElementDescription;
  v4 = -[NSFetchIndexElementDescription init](&v19, sel_init);
  if (v4)
  {
    v5 = +[PFModelDecoderContext retainedContext](PFModelDecoderContext, "retainedContext");
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __48__NSFetchIndexElementDescription_initWithCoder___block_invoke;
    v17 = &unk_1E1EDD520;
    v18 = v5;
    v6 = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSPropertyName"));
    v4->_propertyName = v6;
    if (v6 && (-[NSString isNSString](v6, "isNSString") & 1) == 0)
    {
      v10 = &unk_1E1F4B100;
    }
    else
    {
      v7 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSFetchIndexDescription"));
      v4->_indexDescription = (NSFetchIndexDescription *)v7;
      if (!v7)
      {
LABEL_13:
        v11 = (void *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0, v14, v15), CFSTR("NSIndexedProperty"));
        if (!v11)
          goto LABEL_17;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (objc_msgSend(v11, "_propertyType") == 5 || !v4->_indexDescription)
          {
            v4->_property = (NSPropertyDescription *)v11;
            v12 = *(_DWORD *)&v4->_indexElementDescriptionFlags | 2;
            goto LABEL_23;
          }
LABEL_17:
          v4->_property = 0;
          v12 = *(_DWORD *)&v4->_indexElementDescriptionFlags & 0xFFFFFFFD;
LABEL_23:
          v4->_indexElementDescriptionFlags = (__indexElementDescriptionFlags)v12;
          v4->_collationType = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSFetchIndexElementType"));
          v4->_indexElementDescriptionFlags = (__indexElementDescriptionFlags)(*(_DWORD *)&v4->_indexElementDescriptionFlags & 0xFFFFFFFE | objc_msgSend(a3, "decodeBoolForKey:", CFSTR("NSAscending")));
          goto LABEL_24;
        }
        objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4866, &unk_1E1F4B178));

LABEL_20:
        v4 = 0;
LABEL_24:
        v16((uint64_t)&v14);
        return v4;
      }
      if (v5)
        v8 = (void *)v5[3];
      else
        v8 = 0;
      objc_msgSend(v8, "addObject:", v7);
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) != 0)
        v10 = &unk_1E1F4B150;
      else
        v10 = &unk_1E1F4B128;
      if (v5 != 0 && (isKindOfClass & 1) != 0)
      {
        if (v5[1] || v5[2])
          goto LABEL_13;
        v10 = &unk_1E1F4B150;
      }
    }
    objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4866, v10));

    goto LABEL_20;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->_propertyName = 0;
  if ((*(_BYTE *)&self->_indexElementDescriptionFlags & 2) != 0)
  {

    self->_property = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)NSFetchIndexElementDescription;
  -[NSFetchIndexElementDescription dealloc](&v3, sel_dealloc);
}

- (_DWORD)initWithPropertyName:(uint64_t)a3 collationType:
{
  _DWORD *v5;
  id v6;
  int v7;
  objc_super v9;

  if (!a1)
    return 0;
  v9.receiver = a1;
  v9.super_class = (Class)NSFetchIndexElementDescription;
  v5 = objc_msgSendSuper2(&v9, sel_init);
  if (v5)
  {
    v6 = a2;
    v7 = v5[10];
    *((_QWORD *)v5 + 2) = v6;
    *((_QWORD *)v5 + 3) = a3;
    v5[10] = v7 & 0xFFFFFFFC | 1;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_propertyName, CFSTR("NSPropertyName"));
  if (-[NSPropertyDescription _propertyType](self->_property, "_propertyType") == 5)
    objc_msgSend(a3, "encodeObject:forKey:", self->_property, CFSTR("NSIndexedProperty"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_collationType, CFSTR("NSFetchIndexElementType"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_indexDescription, CFSTR("NSFetchIndexDescription"));
  objc_msgSend(a3, "encodeBool:forKey:", *(_DWORD *)&self->_indexElementDescriptionFlags & 1, CFSTR("NSAscending"));
}

void __48__NSFetchIndexElementDescription_initWithCoder___block_invoke(uint64_t a1)
{

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  NSPropertyDescription *v6;
  int v7;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    *(_QWORD *)(v4 + 32) = 0;
    *(_QWORD *)(v4 + 16) = -[NSString copy](self->_propertyName, "copy");
    if (-[NSPropertyDescription _propertyType](self->_property, "_propertyType") == 5)
      v6 = (NSPropertyDescription *)-[NSPropertyDescription copy](self->_property, "copy");
    else
      v6 = -[NSFetchIndexElementDescription property](self, "property");
    *(_QWORD *)(v5 + 8) = v6;
    v7 = *(_DWORD *)(v5 + 40) | 2;
    *(_DWORD *)(v5 + 40) = v7;
    *(_QWORD *)(v5 + 24) = self->_collationType;
    *(_DWORD *)(v5 + 40) = v7 & 0xFFFFFFFE | *(_DWORD *)&self->_indexElementDescriptionFlags & 1;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t collationType;
  int v12;
  uint64_t v13;
  NSString *propertyName;
  uint64_t v15;
  NSPropertyDescription *property;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  if (a3 == self)
  {
    LOBYTE(v13) = 1;
  }
  else
  {
    v19 = v5;
    v20 = v4;
    v21 = v3;
    if (a3
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && (collationType = self->_collationType, collationType == objc_msgSend(a3, "collationType"))
      && (v12 = -[NSFetchIndexElementDescription isAscending](self, "isAscending"),
          v12 == objc_msgSend(a3, "isAscending")))
    {
      propertyName = self->_propertyName;
      v13 = objc_msgSend(a3, "propertyName");
      if (propertyName == (NSString *)v13
        || (v15 = v13, LOBYTE(v13) = 0, propertyName)
        && v15
        && (LODWORD(v13) = -[NSString isEqual:](propertyName, "isEqual:"), (_DWORD)v13))
      {
        if (-[NSPropertyDescription _propertyType](self->_property, "_propertyType", v6, v19, v20, v21, v7, v8) != 5
          || (property = self->_property, v13 = objc_msgSend(a3, "property"), property == (NSPropertyDescription *)v13)
          || (v17 = v13, LOBYTE(v13) = 0, property)
          && v17
          && (LODWORD(v13) = -[NSPropertyDescription isEqual:](property, "isEqual:"), (_DWORD)v13))
        {
          LOBYTE(v13) = 1;
        }
      }
    }
    else
    {
      LOBYTE(v13) = 0;
    }
  }
  return v13;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_propertyName, "hash");
}

- (id)description
{
  void *v3;
  NSString *propertyName;
  NSPropertyDescription *property;
  unint64_t collationType;
  _BOOL4 v7;
  const __CFString *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  propertyName = self->_propertyName;
  if (-[NSPropertyDescription _propertyType](self->_property, "_propertyType") == 5)
    property = self->_property;
  else
    property = (NSPropertyDescription *)CFSTR("modeled property");
  collationType = self->_collationType;
  v7 = -[NSFetchIndexElementDescription isAscending](self, "isAscending");
  v8 = CFSTR("descending");
  if (v7)
    v8 = CFSTR("ascending");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<NSFetchIndexElementDescription : (%@ (%@), %d, %@)>"), propertyName, property, collationType, v8);
}

- (_QWORD)_throwIfNotEditable
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = (void *)objc_msgSend(result, "property");
    if (!v2)
    {
      if (v1[2])
      {
        v3 = *MEMORY[0x1E0C99768];
        v4 = CFSTR("offender");
        v5[0] = v1;
        objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", v3, CFSTR("Broken logic around index elements"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1)));
      }
    }
    return (_QWORD *)objc_msgSend(v2, "_throwIfNotEditable");
  }
  return result;
}

- (void)setCollationType:(NSFetchIndexElementType)collationType
{
  -[NSFetchIndexElementDescription _throwIfNotEditable](self);
  if (self->_collationType != collationType)
  {
    -[NSFetchIndexElementDescription _validateCollationType:forProperty:]((uint64_t)self, collationType, self->_property);
    -[NSFetchIndexDescription _validateCollationTypeChangeFrom:to:]((unint64_t)self->_indexDescription, self->_collationType, collationType);
    self->_collationType = collationType;
  }
}

- (void)setAscending:(BOOL)ascending
{
  _BOOL4 v3;

  v3 = ascending;
  -[NSFetchIndexElementDescription _throwIfNotEditable](self);
  self->_indexElementDescriptionFlags = (__indexElementDescriptionFlags)(*(_DWORD *)&self->_indexElementDescriptionFlags & 0xFFFFFFFE | v3);
}

- (NSFetchIndexDescription)indexDescription
{
  return self->_indexDescription;
}

- (NSString)propertyName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

@end
