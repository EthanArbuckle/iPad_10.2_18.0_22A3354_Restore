@implementation VSTrieNode

- (VSTrieNode)init
{
  VSTrieNode *v2;
  NSMutableArray *v3;
  NSMutableArray *objects;
  NSMutableDictionary *v5;
  NSMutableDictionary *next;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VSTrieNode;
  v2 = -[VSTrieNode init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objects = v2->_objects;
    v2->_objects = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    next = v2->_next;
    v2->_next = v5;

  }
  return v2;
}

- (NSMutableArray)objects
{
  return self->_objects;
}

- (void)setObjects:(id)a3
{
  objc_storeStrong((id *)&self->_objects, a3);
}

- (NSMutableDictionary)next
{
  return self->_next;
}

- (void)setNext:(id)a3
{
  objc_storeStrong((id *)&self->_next, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_next, 0);
  objc_storeStrong((id *)&self->_objects, 0);
}

@end
