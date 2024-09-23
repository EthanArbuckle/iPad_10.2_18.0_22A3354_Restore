@implementation KGEdgeFilter

- (BOOL)matchesEdge:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)KGEdgeFilter;
  return -[KGElementFilter matchesElement:](&v4, sel_matchesElement_, a3);
}

@end
