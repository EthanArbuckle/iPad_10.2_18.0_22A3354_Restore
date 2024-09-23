@implementation PHASEXPCDictionaryWrapper

+ (id)wrapperWithDictionary:(id)a3
{
  id v3;
  PHASEXPCDictionaryWrapper *v4;

  v3 = a3;
  v4 = -[PHASEXPCDictionaryWrapper initWithDictionary:]([PHASEXPCDictionaryWrapper alloc], "initWithDictionary:", v3);

  return v4;
}

- (PHASEXPCDictionaryWrapper)initWithDictionary:(id)a3
{
  id v5;
  void *v6;
  PHASEXPCDictionaryWrapper *v7;
  PHASEXPCDictionaryWrapper *v8;
  PHASEXPCDictionaryWrapper *v9;
  objc_super v11;

  v5 = a3;
  v6 = v5;
  if (v5 && MEMORY[0x2199FA91C](v5) == MEMORY[0x24BDACFA0])
  {
    v11.receiver = self;
    v11.super_class = (Class)PHASEXPCDictionaryWrapper;
    v8 = -[PHASEXPCDictionaryWrapper init](&v11, sel_init);
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

- (PHASEXPCDictionaryWrapper)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  PHASEXPCDictionaryWrapper *v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "decodeXPCObjectOfType:forKey:", MEMORY[0x24BDACFA0], CFSTR("dictionary"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[PHASEXPCDictionaryWrapper initWithDictionary:](self, "initWithDictionary:", v5);

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
