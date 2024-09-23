@implementation MSVBidirectionalDictionary

- (id)keyForObject:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_objectToKeyDictionary, "objectForKeyedSubscript:", a3);
}

- (id)objectForKey:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_keyToObjectDictionary, "objectForKeyedSubscript:", a3);
}

uint64_t __49__MSVBidirectionalDictionary_initWithDictionary___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a2, a3);
}

- (MSVBidirectionalDictionary)initWithDictionary:(id)a3
{
  id v4;
  MSVBidirectionalDictionary *v5;
  uint64_t v6;
  NSDictionary *keyToObjectDictionary;
  id v8;
  NSDictionary *v9;
  id v10;
  uint64_t v11;
  NSDictionary *objectToKeyDictionary;
  _QWORD v14[4];
  id v15;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MSVBidirectionalDictionary;
  v5 = -[MSVBidirectionalDictionary init](&v16, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    keyToObjectDictionary = v5->_keyToObjectDictionary;
    v5->_keyToObjectDictionary = (NSDictionary *)v6;

    if (v5->_keyToObjectDictionary)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v9 = v5->_keyToObjectDictionary;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __49__MSVBidirectionalDictionary_initWithDictionary___block_invoke;
      v14[3] = &unk_1E43E9B80;
      v10 = v8;
      v15 = v10;
      -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v9, "enumerateKeysAndObjectsUsingBlock:", v14);

    }
    else
    {
      v10 = 0;
    }
    v11 = objc_msgSend(v10, "copy");
    objectToKeyDictionary = v5->_objectToKeyDictionary;
    v5->_objectToKeyDictionary = (NSDictionary *)v11;

  }
  return v5;
}

- (id)allKeys
{
  return -[NSDictionary allKeys](self->_keyToObjectDictionary, "allKeys");
}

+ (id)bidirectionalDictionary
{
  return objc_alloc_init((Class)a1);
}

- (MSVBidirectionalDictionary)init
{
  return -[MSVBidirectionalDictionary initWithDictionary:](self, "initWithDictionary:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectToKeyDictionary, 0);
  objc_storeStrong((id *)&self->_keyToObjectDictionary, 0);
}

- (MSVBidirectionalDictionary)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  MSVBidirectionalDictionary *v8;

  v4 = a3;
  objc_msgSend(v4, "allowedClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setByAddingObject:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("keyToObjectDictionary"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[MSVBidirectionalDictionary initWithDictionary:](self, "initWithDictionary:", v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *keyToObjectDictionary;
  id v4;
  id v5;

  keyToObjectDictionary = self->_keyToObjectDictionary;
  v4 = a3;
  v5 = (id)-[NSDictionary copy](keyToObjectDictionary, "copy");
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("keyToObjectDictionary"));

}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[MSVMutableBidirectionalDictionary initWithDictionary:]([MSVMutableBidirectionalDictionary alloc], "initWithDictionary:", self->_keyToObjectDictionary);
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v5 = -[NSDictionary isEqual:](self->_keyToObjectDictionary, "isEqual:", v4[1]);
  else
    v5 = 0;

  return v5;
}

- (unint64_t)hash
{
  return -[NSDictionary hash](self->_keyToObjectDictionary, "hash");
}

- (id)description
{
  return -[NSDictionary description](self->_keyToObjectDictionary, "description");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
