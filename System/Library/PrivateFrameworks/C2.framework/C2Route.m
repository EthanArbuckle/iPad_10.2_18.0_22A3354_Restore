@implementation C2Route

- (NSString)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
  objc_storeStrong((id *)&self->_destination, a3);
}

- (double)lastUpdated
{
  return self->_lastUpdated;
}

- (void)setLastUpdated:(double)a3
{
  self->_lastUpdated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destination, 0);
}

@end
