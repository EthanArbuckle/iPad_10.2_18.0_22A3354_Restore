@implementation ULRapportMonitorEventIdentities

- (NSArray)identities
{
  return self->_identities;
}

- (void)setIdentities:(id)a3
{
  objc_storeStrong((id *)&self->_identities, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identities, 0);
}

@end
