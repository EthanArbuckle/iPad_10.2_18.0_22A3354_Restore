@implementation PHAssetCollection(PNMomentProtocol)

- (double)approximateCoordinate
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "approximateLocation");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "coordinate");
  v3 = v2;

  return v3;
}

- (BOOL)isCoarse
{
  double v1;

  objc_msgSend(a1, "gpsHorizontalAccuracy");
  return v1 >= *MEMORY[0x1E0D72F38];
}

@end
