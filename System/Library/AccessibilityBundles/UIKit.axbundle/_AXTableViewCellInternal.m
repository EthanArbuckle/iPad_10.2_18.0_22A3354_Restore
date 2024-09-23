@implementation _AXTableViewCellInternal

- (_AXTableViewCellInternal)init
{
  uint64_t v2;
  NSMutableArray *children;
  uint64_t v4;
  NSMutableArray *mockSubviews;
  uint64_t v6;
  NSMutableDictionary *subClassData;
  _AXTableViewCellInternal *v9;
  objc_super v10;
  SEL v11;
  _AXTableViewCellInternal *v12;

  v11 = a2;
  v12 = 0;
  v10.receiver = self;
  v10.super_class = (Class)_AXTableViewCellInternal;
  v12 = -[_AXTableViewCellInternal init](&v10, sel_init);
  objc_storeStrong((id *)&v12, v12);
  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCEB8]), "initWithCapacity:");
  children = v12->children;
  v12->children = (NSMutableArray *)v2;

  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 0);
  mockSubviews = v12->mockSubviews;
  v12->mockSubviews = (NSMutableArray *)v4;

  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCED8]), "initWithCapacity:", 0);
  subClassData = v12->_subClassData;
  v12->_subClassData = (NSMutableDictionary *)v6;

  v9 = v12;
  objc_storeStrong((id *)&v12, 0);
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->discardedLabels, 0);
  objc_storeStrong((id *)&self->_subClassData, 0);
  objc_destroyWeak((id *)&self->mockParent);
  objc_storeStrong((id *)&self->mockSubviews, 0);
  objc_storeStrong(&self->accessoryButton, 0);
  objc_storeStrong((id *)&self->removeConfirmButton, 0);
  objc_storeStrong((id *)&self->text, 0);
  objc_storeStrong((id *)&self->removeMinusButton, 0);
  objc_storeStrong((id *)&self->children, 0);
}

@end
