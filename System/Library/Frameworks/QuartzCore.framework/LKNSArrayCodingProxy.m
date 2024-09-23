@implementation LKNSArrayCodingProxy

- (id)decodedObject
{
  return self->_array;
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
  v3.super_class = (Class)LKNSArrayCodingProxy;
  -[LKNSArrayCodingProxy dealloc](&v3, sel_dealloc);
}

- (LKNSArrayCodingProxy)initWithCoder:(id)a3
{
  LKNSArrayCodingProxy *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)LKNSArrayCodingProxy;
  v4 = -[LKNSArrayCodingProxy init](&v14, sel_init);
  if (v4)
  {
    v5 = (void *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(MEMORY[0x1E0CB3510], "CA_supportedClasses"), CFSTR("array"));
    if (v5)
    {
      v6 = v5;
      v7 = objc_msgSend(v5, "count");
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v7);
      if (v7)
      {
        v9 = 0;
        v10 = (void *)*MEMORY[0x1E0C9B0D0];
        do
        {
          v11 = (void *)objc_msgSend(v6, "objectAtIndex:", v9);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v11 = (void *)objc_msgSend(v11, "decodedObject");
          if (v11)
            v12 = v11;
          else
            v12 = v10;
          objc_msgSend(v8, "addObject:", v12);
          ++v9;
        }
        while (v7 != v9);
      }
      v4->_array = (NSArray *)objc_msgSend(v8, "copy");

    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (LKNSArrayCodingProxy)initWithObject:(id)a3
{
  LKNSArrayCodingProxy *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)LKNSArrayCodingProxy;
  v4 = -[LKNSArrayCodingProxy init](&v6, sel_init);
  if (v4)
    v4->_array = (NSArray *)objc_msgSend(a3, "copy");
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  NSUInteger v5;
  uint64_t v6;
  objc_object *v7;
  objc_object *v8;
  CATintedImage *Proxy;
  CATintedImage *v10;
  objc_object *v11;
  CATintedImage *v12;
  id v13;

  v5 = -[NSArray count](self->_array, "count");
  v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v5);
  if (v5)
  {
    v6 = 0;
    v7 = (objc_object *)*MEMORY[0x1E0C9B0D0];
    do
    {
      v8 = -[NSArray objectAtIndex:](self->_array, "objectAtIndex:", v6);
      Proxy = CACodingCreateProxy((NSCoder *)a3, v8);
      v10 = Proxy;
      if (v8)
        v11 = v8;
      else
        v11 = v7;
      if (Proxy)
        v12 = Proxy;
      else
        v12 = (CATintedImage *)v11;
      objc_msgSend(v13, "addObject:", v12);

      ++v6;
    }
    while (v5 != v6);
  }
  objc_msgSend(a3, "encodeObject:forKey:", v13, CFSTR("array"));

}

@end
