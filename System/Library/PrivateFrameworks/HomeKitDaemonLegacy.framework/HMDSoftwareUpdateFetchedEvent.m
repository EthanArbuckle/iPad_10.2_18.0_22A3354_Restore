@implementation HMDSoftwareUpdateFetchedEvent

- (BOOL)wasUserInitiated
{
  return self->_userInitiated;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->_userInitiated = a3;
}

- (BOOL)wasNewUpdateFetched
{
  return self->_newUpdateFetched;
}

- (void)setNewUpdateFetched:(BOOL)a3
{
  self->_newUpdateFetched = a3;
}

+ (id)eventWasUserInitiated:(BOOL)a3 wasNewUpdateFetched:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  HMDSoftwareUpdateFetchedEvent *v6;

  v4 = a4;
  v5 = a3;
  v6 = objc_alloc_init(HMDSoftwareUpdateFetchedEvent);
  -[HMDSoftwareUpdateFetchedEvent setUserInitiated:](v6, "setUserInitiated:", v5);
  -[HMDSoftwareUpdateFetchedEvent setNewUpdateFetched:](v6, "setNewUpdateFetched:", v4);
  return v6;
}

@end
