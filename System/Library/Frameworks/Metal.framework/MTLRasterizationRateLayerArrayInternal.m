@implementation MTLRasterizationRateLayerArrayInternal

- (MTLRasterizationRateLayerArrayInternal)initWithParent:(id)a3
{
  MTLRasterizationRateLayerArrayInternal *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTLRasterizationRateLayerArrayInternal;
  result = -[MTLRasterizationRateLayerArray init](&v5, sel_init);
  if (result)
    result->_parent = (MTLRasterizationRateMapDescriptor *)a3;
  return result;
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  return -[MTLRasterizationRateMapDescriptor layerAtIndex:](self->_parent, "layerAtIndex:", a3);
}

- (void)setObject:(id)a3 atIndexedSubscript:(unint64_t)a4
{
  -[MTLRasterizationRateMapDescriptor setLayer:atIndex:](self->_parent, "setLayer:atIndex:", a3, a4);
}

@end
