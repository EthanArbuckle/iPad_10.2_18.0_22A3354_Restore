@implementation CKMediaObject(Internal)

- (BOOL)isMonoskiAsset
{
  if (!-[CKMediaObject spatialState](self, "spatialState"))
    -[CKMediaObject _refreshSpatialMetadata](self, "_refreshSpatialMetadata");
  return -[CKMediaObject spatialState](self, "spatialState") == 3;
}

@end
