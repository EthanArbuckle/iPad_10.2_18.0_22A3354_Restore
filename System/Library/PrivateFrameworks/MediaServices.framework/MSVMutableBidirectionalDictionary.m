@implementation MSVMutableBidirectionalDictionary

- (void)setObject:(id)a3 forKey:(id)a4
{
  NSDictionary *v7;
  id v8;
  id v9;
  void *v10;
  NSDictionary *v11;

  v11 = self->super._keyToObjectDictionary;
  v7 = self->super._objectToKeyDictionary;
  v8 = a4;
  v9 = a3;
  -[NSDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    -[NSDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", 0, v10);
  -[NSDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v9, v8);
  -[NSDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v8, v9);

}

- (MSVMutableBidirectionalDictionary)initWithDictionary:(id)a3
{
  MSVMutableBidirectionalDictionary *v3;
  MSVMutableBidirectionalDictionary *v4;
  NSDictionary *v5;
  NSDictionary *keyToObjectDictionary;
  uint64_t v7;
  NSDictionary *v8;
  NSDictionary *objectToKeyDictionary;
  uint64_t v10;
  NSDictionary *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MSVMutableBidirectionalDictionary;
  v3 = -[MSVBidirectionalDictionary initWithDictionary:](&v13, sel_initWithDictionary_, a3);
  v4 = v3;
  if (v3)
  {
    v5 = (NSDictionary *)MEMORY[0x1E0C9AA70];
    if (v3->super._keyToObjectDictionary)
      keyToObjectDictionary = v3->super._keyToObjectDictionary;
    else
      keyToObjectDictionary = (NSDictionary *)MEMORY[0x1E0C9AA70];
    v7 = -[NSDictionary mutableCopy](keyToObjectDictionary, "mutableCopy");
    v8 = v4->super._keyToObjectDictionary;
    v4->super._keyToObjectDictionary = (NSDictionary *)v7;

    if (v4->super._objectToKeyDictionary)
      objectToKeyDictionary = v4->super._objectToKeyDictionary;
    else
      objectToKeyDictionary = v5;
    v10 = -[NSDictionary mutableCopy](objectToKeyDictionary, "mutableCopy");
    v11 = v4->super._objectToKeyDictionary;
    v4->super._objectToKeyDictionary = (NSDictionary *)v10;

  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[MSVBidirectionalDictionary initWithDictionary:]([MSVBidirectionalDictionary alloc], "initWithDictionary:", self->super._keyToObjectDictionary);
}

- (void)removeObjectForKey:(id)a3
{
  NSDictionary *v4;
  NSDictionary *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = self->super._keyToObjectDictionary;
  v5 = self->super._objectToKeyDictionary;
  -[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[NSDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", 0, v7);
    -[NSDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", 0, v6);
  }

}

- (void)removeAllObjects
{
  NSDictionary *keyToObjectDictionary;
  NSDictionary *v3;
  NSDictionary *v4;

  keyToObjectDictionary = self->super._keyToObjectDictionary;
  v3 = self->super._objectToKeyDictionary;
  v4 = keyToObjectDictionary;
  -[NSDictionary removeAllObjects](v4, "removeAllObjects");
  -[NSDictionary removeAllObjects](v3, "removeAllObjects");

}

- (void)setKey:(id)a3 forObject:(id)a4
{
  NSDictionary *v7;
  id v8;
  id v9;
  void *v10;
  NSDictionary *v11;

  v11 = self->super._keyToObjectDictionary;
  v7 = self->super._objectToKeyDictionary;
  v8 = a4;
  v9 = a3;
  -[NSDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    -[NSDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", 0, v10);
  -[NSDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v8, v9);
  -[NSDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v9, v8);

}

- (void)removeKeyForObject:(id)a3
{
  NSDictionary *v4;
  NSDictionary *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = self->super._keyToObjectDictionary;
  v5 = self->super._objectToKeyDictionary;
  -[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[NSDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", 0, v6);
    -[NSDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", 0, v7);
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
