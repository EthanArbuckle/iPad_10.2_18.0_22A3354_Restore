@implementation NSObject(NTKIntrospection)

- (id)ntk_listOfProperties
{
  objc_class *v0;
  objc_property_t *v1;
  id v2;
  unint64_t i;
  objc_property *v4;
  const char *Name;
  const char *v6;
  void *v7;
  NTKObjectPropertyInfo *v8;
  void *v9;
  unsigned __int8 v11;
  unsigned int outCount;

  outCount = 0;
  v0 = (objc_class *)objc_opt_class();
  v1 = class_copyPropertyList(v0, &outCount);
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (outCount)
  {
    for (i = 0; i < outCount; ++i)
    {
      v4 = v1[i];
      Name = property_getName(v4);
      if (Name)
      {
        v6 = Name;
        v11 = 0;
        getObjectType(v4, &v11);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_alloc_init(NTKObjectPropertyInfo);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v6, objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NTKObjectPropertyInfo setName:](v8, "setName:", v9);

        if (v7)
          -[NTKObjectPropertyInfo setTypeString:](v8, "setTypeString:", v7);
        -[NTKObjectPropertyInfo setIsDynamic:](v8, "setIsDynamic:", v11);
        objc_msgSend(v2, "addObject:", v8);

      }
    }
  }
  free(v1);
  return v2;
}

- (id)ntk_listOfDynamicProperties
{
  id v2;
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(a1, "ntk_listOfProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__NSObject_NTKIntrospection__ntk_listOfDynamicProperties__block_invoke;
  v6[3] = &unk_1E6BD9178;
  v4 = v2;
  v7 = v4;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);

  return v4;
}

@end
