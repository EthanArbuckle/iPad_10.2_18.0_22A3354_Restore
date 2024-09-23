@implementation ML3StatementCacheNode

- (ML3StatementCacheNode)next
{
  return self->_next;
}

- (NSCopying)dictionaryKey
{
  return self->_dictionaryKey;
}

- (void)setNext:(id)a3
{
  objc_storeStrong((id *)&self->_next, a3);
}

- (ML3StatementCacheNode)initWithDictionaryKey:(id)a3
{
  id v4;
  ML3StatementCacheNode *v5;
  uint64_t v6;
  NSCopying *dictionaryKey;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ML3StatementCacheNode;
  v5 = -[ML3StatementCacheNode init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    dictionaryKey = v5->_dictionaryKey;
    v5->_dictionaryKey = (NSCopying *)v6;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_next, 0);
  objc_storeStrong((id *)&self->_dictionaryKey, 0);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p '%@'>"), objc_opt_class(), self, self->_dictionaryKey);
}

- (void)setDictionaryKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

@end
