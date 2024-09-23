@implementation _NSOwningObservingObservation

- (void)setObservation:(id)a3
{
  NSObservation *ownedObservation;

  ownedObservation = self->_ownedObservation;
  if (ownedObservation != a3)
  {

    self->_ownedObservation = (NSObservation *)a3;
  }
}

@end
