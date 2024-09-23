@implementation IMXPCDictionary

- (IMXPCDictionary)initWithDictionary:(id)a3 key:(const char *)a4
{
  id v6;
  xpc_object_t v7;
  void *v8;
  IMXPCDictionary *v9;
  objc_super v11;

  v6 = a3;
  v7 = xpc_dictionary_create(0, 0, 0);
  if (v6)
  {
    v8 = (void *)IMCreateXPCObjectFromDictionary();
    xpc_dictionary_set_value(v7, a4, v8);

  }
  v11.receiver = self;
  v11.super_class = (Class)IMXPCDictionary;
  v9 = -[IMXPCObject initWithXPCObject:](&v11, sel_initWithXPCObject_, v7);

  return v9;
}

- (id)dictionaryForKey:(const char *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  -[IMXPCObject object](self, "object");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[IMXPCObject object](self, "object"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = MEMORY[0x1A1AE8C40](),
        v9 = MEMORY[0x1E0C812F8],
        v7,
        v6,
        v8 == v9))
  {
    -[IMXPCObject object](self, "object");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_get_value(v11, a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)IMCreateDictionaryFromXPCObjectWithStandardAllowlist();
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

+ (_xpc_type_s)type
{
  return (_xpc_type_s *)MEMORY[0x1E0C812F8];
}

@end
