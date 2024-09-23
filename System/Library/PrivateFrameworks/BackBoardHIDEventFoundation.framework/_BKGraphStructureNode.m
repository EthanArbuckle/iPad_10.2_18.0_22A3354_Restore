@implementation _BKGraphStructureNode

- (_BKGraphStructureNode)init
{
  _BKGraphStructureNode *v2;
  NSMutableArray *v3;
  NSMutableArray *subnodes;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_BKGraphStructureNode;
  v2 = -[_BKGraphStructureNode init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    subnodes = v2->_subnodes;
    v2->_subnodes = v3;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_subnodes, 0);
  objc_storeStrong((id *)&self->_supernode, 0);
}

@end
