@implementation NWStatsInterfaceSource

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("NWStatsInterfaceSource with srcref %lld interface %u threshold %lld"), self->_srcRef, self->_ifIndex, self->_threshold);
}

- (unint64_t)srcRef
{
  return self->_srcRef;
}

- (void)setSrcRef:(unint64_t)a3
{
  self->_srcRef = a3;
}

- (unint64_t)threshold
{
  return self->_threshold;
}

- (void)setThreshold:(unint64_t)a3
{
  self->_threshold = a3;
}

- (unsigned)ifIndex
{
  return self->_ifIndex;
}

- (void)setIfIndex:(unsigned int)a3
{
  self->_ifIndex = a3;
}

@end
