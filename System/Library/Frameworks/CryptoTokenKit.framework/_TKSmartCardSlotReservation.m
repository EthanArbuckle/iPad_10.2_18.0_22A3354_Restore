@implementation _TKSmartCardSlotReservation

- (NSNumber)protocols
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setProtocols:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)exclusive
{
  return self->_exclusive;
}

- (void)setExclusive:(BOOL)a3
{
  self->_exclusive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protocols, 0);
}

@end
