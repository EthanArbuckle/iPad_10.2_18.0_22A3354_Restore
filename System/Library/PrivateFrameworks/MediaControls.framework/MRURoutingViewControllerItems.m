@implementation MRURoutingViewControllerItems

- (NSDictionary)routeGrouping
{
  return self->_routeGrouping;
}

- (void)setRouteGrouping:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)localDevicesAndHeadphones
{
  return self->_localDevicesAndHeadphones;
}

- (void)setLocalDevicesAndHeadphones:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)speakersAndTVs
{
  return self->_speakersAndTVs;
}

- (void)setSpeakersAndTVs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)customRows
{
  return self->_customRows;
}

- (void)setCustomRows:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customRows, 0);
  objc_storeStrong((id *)&self->_speakersAndTVs, 0);
  objc_storeStrong((id *)&self->_localDevicesAndHeadphones, 0);
  objc_storeStrong((id *)&self->_routeGrouping, 0);
}

@end
