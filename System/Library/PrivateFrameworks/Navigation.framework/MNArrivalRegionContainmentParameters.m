@implementation MNArrivalRegionContainmentParameters

- (double)includeDistancePadding
{
  return self->_includeDistancePadding;
}

- (void)setIncludeDistancePadding:(double)a3
{
  self->_includeDistancePadding = a3;
}

- (double)excludeDistancePadding
{
  return self->_excludeDistancePadding;
}

- (void)setExcludeDistancePadding:(double)a3
{
  self->_excludeDistancePadding = a3;
}

@end
