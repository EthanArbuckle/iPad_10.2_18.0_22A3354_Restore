@implementation _HDOntologyGraphInflationCache

- (_HDOntologyGraphInflationCache)init
{
  _HDOntologyGraphInflationCache *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *conceptsByID;
  NSMutableArray *v5;
  NSMutableArray *conceptIDStack;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_HDOntologyGraphInflationCache;
  v2 = -[_HDOntologyGraphInflationCache init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    conceptsByID = v2->_conceptsByID;
    v2->_conceptsByID = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    conceptIDStack = v2->_conceptIDStack;
    v2->_conceptIDStack = v5;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conceptIDStack, 0);
  objc_storeStrong((id *)&self->_conceptsByID, 0);
}

@end
