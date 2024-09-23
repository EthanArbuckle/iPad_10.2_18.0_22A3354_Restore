@implementation SALocalSearchShowMapPoints

- (id)_afui_mapsRelatedChild
{
  return -[SALocalSearchShowMapPoints itemDestination](self, "itemDestination");
}

@end
