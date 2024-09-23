@implementation NFTrustObject

+ (id)allowedXPCClasses
{
  if (_MergedGlobals_1 != -1)
    dispatch_once(&_MergedGlobals_1, &__block_literal_global_6);
  return (id)qword_1EE3FD528;
}

void __34__NFTrustObject_allowedXPCClasses__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  v18 = objc_alloc(MEMORY[0x1E0C99E60]);
  v17 = objc_opt_class();
  v16 = objc_opt_class();
  v15 = objc_opt_class();
  v14 = objc_opt_class();
  v13 = objc_opt_class();
  v12 = objc_opt_class();
  v0 = objc_opt_class();
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_msgSend(v18, "initWithObjects:", v17, v16, v15, v14, v13, v12, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(),
          0);
  v11 = (void *)qword_1EE3FD528;
  qword_1EE3FD528 = v10;

}

- (id)allowedXPCClasses
{
  return +[NFTrustObject allowedXPCClasses](NFTrustObject, "allowedXPCClasses");
}

- (id)dictionaryRepresentation
{
  void *v3;
  objc_class *Superclass;
  void *v5;
  objc_class *v6;
  void *v7;
  char v8;
  objc_property_t *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  char v18;
  objc_class *cls;
  unsigned int outCount;

  v3 = (void *)objc_opt_new();
  Superclass = (objc_class *)objc_opt_class();
  NSStringFromClass(Superclass);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  if ((v8 & 1) == 0)
  {
    while (1)
    {
      outCount = 0;
      cls = Superclass;
      v9 = class_copyPropertyList(Superclass, &outCount);
      if (outCount)
        break;
LABEL_13:
      free(v9);
      Superclass = class_getSuperclass(cls);
      NSStringFromClass(Superclass);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v15, "isEqualToString:", v17);

      if ((v18 & 1) != 0)
        return v3;
    }
    v10 = 0;
    while (1)
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), property_getName(v9[v10]));
      if ((objc_msgSend(v11, "hasPrefix:", CFSTR("trustObjectInternal")) & 1) == 0)
        break;
LABEL_12:

      if (++v10 >= (unint64_t)outCount)
        goto LABEL_13;
    }
    -[NFTrustObject valueForKey:](self, "valueForKey:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, v11);
        goto LABEL_11;
      }
      objc_msgSend(v12, "dictionaryRepresentation");
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v13 = objc_claimAutoreleasedReturnValue();
    }
    v14 = (void *)v13;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, v11);

LABEL_11:
    goto LABEL_12;
  }
  return v3;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NFTrustObject dictionaryRepresentation](self, "dictionaryRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ : %@"), v5, v6);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NFTrustObject)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NFTrustObject;
  return -[NFTrustObject init](&v4, sel_init, a3);
}

@end
