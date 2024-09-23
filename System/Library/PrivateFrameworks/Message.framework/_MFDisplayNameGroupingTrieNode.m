@implementation _MFDisplayNameGroupingTrieNode

- (_MFDisplayNameGroupingTrieNode)initWithValue:(id)a3
{
  id v4;
  _MFDisplayNameGroupingTrieNode *v5;
  uint64_t v6;
  NSString *value;
  NSMutableDictionary *v8;
  NSMutableDictionary *children;
  EFMutableInt64Set *v10;
  EFMutableInt64Set *addressIDs;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_MFDisplayNameGroupingTrieNode;
  v5 = -[_MFDisplayNameGroupingTrieNode init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    value = v5->_value;
    v5->_value = (NSString *)v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    children = v5->_children;
    v5->_children = v8;

    v10 = (EFMutableInt64Set *)objc_alloc_init(MEMORY[0x1E0D1EF08]);
    addressIDs = v5->_addressIDs;
    v5->_addressIDs = v10;

  }
  return v5;
}

- (NSDictionary)children
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_children, "copy");
}

- (EFInt64Set)addressIDs
{
  return (EFInt64Set *)(id)-[EFMutableInt64Set copy](self->_addressIDs, "copy");
}

- (void)addChild:(id)a3
{
  void *v4;
  _MFDisplayNameGroupingTrieNode *v5;
  id v6;

  v6 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_children, "objectForKeyedSubscript:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = -[_MFDisplayNameGroupingTrieNode initWithValue:]([_MFDisplayNameGroupingTrieNode alloc], "initWithValue:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_children, "setObject:forKeyedSubscript:", v5, v6);

  }
}

- (void)addAddressID:(int64_t)a3
{
  -[EFMutableInt64Set addIndex:](self->_addressIDs, "addIndex:", a3);
}

- (NSString)value
{
  return self->_value;
}

- (BOOL)isEndOfName
{
  return self->_isEndOfName;
}

- (void)setIsEndOfName:(BOOL)a3
{
  self->_isEndOfName = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_addressIDs, 0);
  objc_storeStrong((id *)&self->_children, 0);
}

@end
