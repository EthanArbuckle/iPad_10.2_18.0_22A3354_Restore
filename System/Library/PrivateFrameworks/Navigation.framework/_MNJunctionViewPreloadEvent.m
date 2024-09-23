@implementation _MNJunctionViewPreloadEvent

- (GEOComposedGuidanceEvent)junctionViewEvent
{
  return self->_junctionViewEvent;
}

- (void)setJunctionViewEvent:(id)a3
{
  objc_storeStrong((id *)&self->_junctionViewEvent, a3);
}

- (BOOL)needsPreload
{
  return self->_needsPreload;
}

- (void)setNeedsPreload:(BOOL)a3
{
  self->_needsPreload = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_junctionViewEvent, 0);
}

@end
