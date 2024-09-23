@implementation ARXPCDictionaryWrapper

+ (id)wrapperWithDictionary:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDictionary:", v4);

  return v5;
}

- (ARXPCDictionaryWrapper)initWithDictionary:(id)a3
{
  id v5;
  void *v6;
  ARXPCDictionaryWrapper *v7;
  ARXPCDictionaryWrapper *v8;
  ARXPCDictionaryWrapper *v9;
  objc_super v11;

  v5 = a3;
  v6 = v5;
  if (v5 && object_getClass(v5) == (Class)MEMORY[0x1E0C812F8])
  {
    v11.receiver = self;
    v11.super_class = (Class)ARXPCDictionaryWrapper;
    v8 = -[ARXPCDictionaryWrapper init](&v11, sel_init);
    v9 = v8;
    if (v8)
      objc_storeStrong((id *)&v8->_dictionary, a3);
    self = v9;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ARXPCDictionaryWrapper)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ARXPCDictionaryWrapper *v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C812F8], CFSTR("dictionary"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[ARXPCDictionaryWrapper initWithDictionary:](self, "initWithDictionary:", v5);

    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  OS_xpc_object *dictionary;
  id v5;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    dictionary = self->_dictionary;
    if (dictionary)
      objc_msgSend(v5, "encodeXPCObject:forKey:", dictionary, CFSTR("dictionary"));
  }

}

- (OS_xpc_object)dictionary
{
  return self->_dictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end
