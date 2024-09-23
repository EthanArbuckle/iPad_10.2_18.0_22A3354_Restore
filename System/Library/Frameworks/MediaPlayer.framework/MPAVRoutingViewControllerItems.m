@implementation MPAVRoutingViewControllerItems

- (NSDictionary)routeGrouping
{
  return self->_routeGrouping;
}

- (void)setRouteGrouping:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)localDevices
{
  return self->_localDevices;
}

- (void)setLocalDevices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)headphones
{
  return self->_headphones;
}

- (void)setHeadphones:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)speakersAndTVs
{
  return self->_speakersAndTVs;
}

- (void)setSpeakersAndTVs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speakersAndTVs, 0);
  objc_storeStrong((id *)&self->_headphones, 0);
  objc_storeStrong((id *)&self->_localDevices, 0);
  objc_storeStrong((id *)&self->_routeGrouping, 0);
}

@end
