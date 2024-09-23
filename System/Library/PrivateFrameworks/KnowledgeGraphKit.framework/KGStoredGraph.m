@implementation KGStoredGraph

- (id)initGraphWithStore:(id)a3 entityFactory:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)KGStoredGraph;
  return -[KGMutableGraph initWithMutableImplementation:entityFactory:](&v5, sel_initWithMutableImplementation_entityFactory_, a3, a4);
}

@end
