@implementation LKNSDictionaryCodingProxy

- (id)decodedObject
{
  return self->_dict;
}

- (LKNSDictionaryCodingProxy)initWithCoder:(id)a3
{
  LKNSDictionaryCodingProxy *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)LKNSDictionaryCodingProxy;
  v4 = -[LKNSDictionaryCodingProxy init](&v15, sel_init);
  if (v4)
  {
    v5 = (void *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(MEMORY[0x1E0CB3510], "CA_supportedClasses"), CFSTR("dict"));
    if (v5)
    {
      v6 = v5;
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v5, "count"));
      v8 = (void *)objc_msgSend(v6, "keyEnumerator");
      v9 = objc_msgSend(v8, "nextObject");
      if (v9)
      {
        v10 = v9;
        v11 = (void *)*MEMORY[0x1E0C9B0D0];
        do
        {
          v12 = (void *)objc_msgSend(v6, "objectForKey:", v10);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v12 = (void *)objc_msgSend(v12, "decodedObject");
          if (v12)
            v13 = v12;
          else
            v13 = v11;
          objc_msgSend(v7, "setObject:forKey:", v13, v10);
          v10 = objc_msgSend(v8, "nextObject");
        }
        while (v10);
      }
      v4->_dict = (NSDictionary *)objc_msgSend(v7, "copy");

    }
    else
    {

      return 0;
    }
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)LKNSDictionaryCodingProxy;
  -[LKNSDictionaryCodingProxy dealloc](&v3, sel_dealloc);
}

- (LKNSDictionaryCodingProxy)initWithObject:(id)a3
{
  LKNSDictionaryCodingProxy *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)LKNSDictionaryCodingProxy;
  v4 = -[LKNSDictionaryCodingProxy init](&v6, sel_init);
  if (v4)
    v4->_dict = (NSDictionary *)objc_msgSend(a3, "copy");
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  NSEnumerator *v5;
  uint64_t v6;
  uint64_t v7;
  objc_object *v8;
  objc_object *v9;
  CATintedImage *Proxy;
  CATintedImage *v11;
  objc_object *v12;
  CATintedImage *v13;
  id v14;

  v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSDictionary count](self->_dict, "count"));
  v5 = -[NSDictionary keyEnumerator](self->_dict, "keyEnumerator");
  v6 = -[NSEnumerator nextObject](v5, "nextObject");
  if (v6)
  {
    v7 = v6;
    v8 = (objc_object *)*MEMORY[0x1E0C9B0D0];
    do
    {
      v9 = -[NSDictionary objectForKey:](self->_dict, "objectForKey:", v7);
      Proxy = CACodingCreateProxy((NSCoder *)a3, v9);
      v11 = Proxy;
      if (v9)
        v12 = v9;
      else
        v12 = v8;
      if (Proxy)
        v13 = Proxy;
      else
        v13 = (CATintedImage *)v12;
      objc_msgSend(v14, "setObject:forKey:", v13, v7);

      v7 = -[NSEnumerator nextObject](v5, "nextObject");
    }
    while (v7);
  }
  objc_msgSend(a3, "encodeObject:forKey:", v14, CFSTR("dict"));

}

@end
