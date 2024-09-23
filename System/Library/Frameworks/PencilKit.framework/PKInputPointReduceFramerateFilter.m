@implementation PKInputPointReduceFramerateFilter

- (void)addInputPoint:(id *)a3
{
  int64_t numInputPoints;
  unint64_t coalescingCounter;

  if (self)
  {
    numInputPoints = self->super._numInputPoints;
    self->super._numInputPoints = numInputPoints + 1;
    if (numInputPoints)
    {
      coalescingCounter = self->_coalescingCounter;
      if (coalescingCounter < self->_numPointsToCoalesce)
      {
        self->_coalescingCounter = coalescingCounter + 1;
        return;
      }
    }
    memmove(&self->super._filteredPoint, a3, 0x80uLL);
  }
  self->_coalescingCounter = 0;
}

@end
