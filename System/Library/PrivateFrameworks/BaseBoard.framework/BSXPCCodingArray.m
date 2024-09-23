@implementation BSXPCCodingArray

- (void)encodeWithXPCDictionary:(id)a3
{
  BSSerializeArrayToXPCDictionaryWithKey(self->_array, a3, "items", &__block_literal_global_2);
}

- (BSXPCCodingArray)initWithXPCDictionary:(id)a3
{
  id v4;
  BSXPCCodingArray *v5;
  NSArray *v6;
  NSArray *array;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BSXPCCodingArray;
  v5 = -[BSXPCCodingArray init](&v9, sel_init);
  if (v5)
  {
    v6 = (NSArray *)BSCreateDeserializedArrayFromXPCDictionaryWithKey(v4, "items", &__block_literal_global_20);
    array = v5->_array;
    v5->_array = v6;

  }
  return v5;
}

- (id)array
{
  return self->_array;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_array, 0);
}

- (BSXPCCodingArray)initWithArray:(id)a3
{
  id v4;
  BSXPCCodingArray *v5;
  uint64_t v6;
  NSArray *array;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BSXPCCodingArray;
  v5 = -[BSXPCCodingArray init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    array = v5->_array;
    v5->_array = (NSArray *)v6;

  }
  return v5;
}

- (unint64_t)count
{
  return -[NSArray count](self->_array, "count");
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return -[NSArray countByEnumeratingWithState:objects:count:](self->_array, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[BSXPCCodingArray succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;

  +[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[NSArray count](self->_array, "count"), CFSTR("count"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[BSXPCCodingArray descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[BSXPCCodingArray succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendArraySection:withName:multilinePrefix:skipIfEmpty:", self->_array, 0, v4, 1);

  return v5;
}

@end
