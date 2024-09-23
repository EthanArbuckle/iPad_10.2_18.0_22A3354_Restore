@implementation CTFeatureSetting

- (uint64_t)tag
{
  if (result)
    return objc_msgSend(*(id *)(result + 8), "objectForKey:", CFSTR("CTFeatureOpenTypeTag"));
  return result;
}

- (uint64_t)type
{
  if (result)
    return objc_msgSend(*(id *)(result + 8), "objectForKey:", CFSTR("CTFeatureTypeIdentifier"));
  return result;
}

- (_QWORD)initWithType:(uint64_t)a3 selector:(uint64_t)a4 tag:(NSNumber *)a5 value:
{
  NSNumber *v9;
  NSNumber *v10;
  void *v11;
  _QWORD *v12;
  _QWORD *v13;

  if (a1)
  {
    v9 = ValidatedValue(a5);
    if (v9)
    {
      v10 = v9;
      if (a2)
      {
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", a2, CFSTR("CTFeatureTypeIdentifier"), a3, CFSTR("CTFeatureSelectorIdentifier"), a4, CFSTR("CTFeatureOpenTypeTag"), v9, CFSTR("CTFeatureOpenTypeValue"), 0);
        v12 = (_QWORD *)objc_msgSend(a1, "initWithDictionary:", v11);
LABEL_7:
        v13 = v12;

        return v13;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", a4, CFSTR("CTFeatureOpenTypeTag"), v10, CFSTR("CTFeatureOpenTypeValue"), 0);
        v12 = -[CTFeatureSetting initWithNormalizedDictionary:](a1, v11);
        goto LABEL_7;
      }
    }

  }
  return 0;
}

- (BOOL)isEqualToDictionary:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return -[CTFeatureSetting isEqualToFeatureSetting:]((uint64_t)self, (uint64_t)a3);
  else
    return -[NSDictionary isEqualToDictionary:](self->_dictionary, "isEqualToDictionary:", a3);
}

- (CTFeatureSetting)initWithDictionary:(id)a3
{
  NSNumber *v6;
  NSNumber *v7;
  NSNumber *v8;
  __int16 v9;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (CTFeatureSetting *)-[CTFeatureSetting initWithNormalizedDictionary:](self, a3);
  v9 = -21846;
  if (GetSettingValue<__CFNumber const*,unsigned short>(objc_msgSend(a3, "objectForKey:", CFSTR("CTFeatureTypeIdentifier")), &v9)&& v9)
  {
    if ((GetSettingValue<__CFNumber const*,unsigned short>(objc_msgSend(a3, "objectForKey:", CFSTR("CTFeatureSelectorIdentifier")), 0) & 1) != 0)return (CTFeatureSetting *)-[CTFeatureSetting initWithNormalizedDictionary:](self, a3);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return (CTFeatureSetting *)-[CTFeatureSetting initWithNormalizedDictionary:](self, a3);
  }
  else
  {
    objc_msgSend(a3, "objectForKey:", CFSTR("CTFeatureOpenTypeTag"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (NSNumber *)objc_msgSend(a3, "objectForKey:", CFSTR("CTFeatureOpenTypeValue"));
      v7 = ValidatedValue(v6);
      if (v7)
      {
        v8 = v7;
        if (v7 != v6)
        {
          a3 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a3);
          objc_msgSend(a3, "setObject:forKey:", v8, CFSTR("CTFeatureOpenTypeValue"));
        }
        return (CTFeatureSetting *)-[CTFeatureSetting initWithNormalizedDictionary:](self, a3);
      }
    }
  }

  return 0;
}

- (_QWORD)initWithNormalizedDictionary:(void *)a1
{
  _QWORD *v3;
  objc_super v5;

  if (!a1)
    return 0;
  v5.receiver = a1;
  v5.super_class = (Class)CTFeatureSetting;
  v3 = objc_msgSendSuper2(&v5, sel_init);
  if (v3)
    v3[1] = a2;
  return v3;
}

- (id)objectForKey:(id)a3
{
  return -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", a3);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CTFeatureSetting;
  -[CTFeatureSetting dealloc](&v3, sel_dealloc);
}

- (unint64_t)count
{
  return -[NSDictionary count](self->_dictionary, "count");
}

- (id)keyEnumerator
{
  return -[NSDictionary keyEnumerator](self->_dictionary, "keyEnumerator");
}

- (uint64_t)selector
{
  if (result)
    return objc_msgSend(*(id *)(result + 8), "objectForKey:", CFSTR("CTFeatureSelectorIdentifier"));
  return result;
}

- (uint64_t)value
{
  if (result)
    return objc_msgSend(*(id *)(result + 8), "objectForKey:", CFSTR("CTFeatureOpenTypeValue"));
  return result;
}

- (uint64_t)isEqualToFeatureSetting:(uint64_t)result
{
  uint64_t v3;
  uint64_t v4;
  const void *v5;
  const void *v6;
  const void *v7;
  const void *v8;
  BOOL v9;
  uint64_t v10;
  const void *v11;
  const void *v12;
  const void *v13;
  const void *v14;
  BOOL v15;

  if (result)
  {
    v3 = result;
    v4 = objc_msgSend(*(id *)(result + 8), "objectForKey:", CFSTR("CTFeatureTypeIdentifier"));
    if (a2)
    {
      v5 = (const void *)v4;
      if (v4)
      {
        v6 = (const void *)objc_msgSend(*(id *)(a2 + 8), "objectForKey:", CFSTR("CTFeatureTypeIdentifier"));
        if (v5 == v6 || v6 && CFEqual(v5, v6))
        {
          v7 = (const void *)objc_msgSend(*(id *)(v3 + 8), "objectForKey:", CFSTR("CTFeatureSelectorIdentifier"));
          v8 = (const void *)objc_msgSend(*(id *)(a2 + 8), "objectForKey:", CFSTR("CTFeatureSelectorIdentifier"));
          if (v7 == v8)
            return 1;
          v9 = !v7 || v8 == 0;
          if (!v9 && CFEqual(v7, v8))
            return 1;
        }
      }
    }
    if ((v10 = objc_msgSend(*(id *)(v3 + 8), "objectForKey:", CFSTR("CTFeatureOpenTypeTag")), a2)
      && (v11 = (const void *)v10) != 0
      && ((v12 = (const void *)objc_msgSend(*(id *)(a2 + 8), "objectForKey:", CFSTR("CTFeatureOpenTypeTag")), v11 == v12)
       || v12 && CFEqual(v11, v12))
      && ((v13 = (const void *)objc_msgSend(*(id *)(v3 + 8), "objectForKey:", CFSTR("CTFeatureOpenTypeValue")),
           v14 = (const void *)objc_msgSend(*(id *)(a2 + 8), "objectForKey:", CFSTR("CTFeatureOpenTypeValue")),
           v13 == v14)
       || (v13 ? (v15 = v14 == 0) : (v15 = 1), !v15 && CFEqual(v13, v14))))
    {
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return -[CTFeatureSetting isEqualToFeatureSetting:]((uint64_t)self, (uint64_t)a3);
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && -[NSDictionary isEqualToDictionary:](self->_dictionary, "isEqualToDictionary:", a3);
}

- (unint64_t)hash
{
  id v3;
  int v4;
  uint64_t v6;
  id v7;

  if (self)
  {
    v3 = -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("CTFeatureTypeIdentifier"));
    if (v3)
    {
      v4 = objc_msgSend(v3, "unsignedShortValue");
      return (int)(objc_msgSend(-[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("CTFeatureSelectorIdentifier")), "unsignedShortValue") | (v4 << 16));
    }
    v6 = objc_msgSend(-[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("CTFeatureOpenTypeTag")), "hash");
    v7 = -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("CTFeatureOpenTypeValue"));
  }
  else
  {
    v6 = objc_msgSend(0, "hash");
    v7 = 0;
  }
  return v6 + objc_msgSend(v7, "unsignedIntValue");
}

@end
