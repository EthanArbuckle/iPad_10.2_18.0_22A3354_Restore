@implementation AVExtendedTempoEvent

- (AVExtendedTempoEvent)initWithTempo:(double)tempo
{
  AVExtendedTempoEvent *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVExtendedTempoEvent;
  result = -[AVExtendedTempoEvent init](&v5, sel_init);
  if (result)
    result->_bpm = tempo;
  return result;
}

- (double)tempo
{
  return self->_bpm;
}

- (void)setTempo:(double)tempo
{
  self->_bpm = tempo;
}

@end
