@implementation SALocalSearchMapItem

- (id)_afui_mapsRelatedChild
{
  return -[SALocalSearchMapItem detail](self, "detail");
}

@end
