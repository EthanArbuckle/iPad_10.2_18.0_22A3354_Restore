@implementation NUFullExtentRegionPolicy

- (id)regionForGeometry:(id)a3
{
  uint64_t v3;
  _QWORD v5[4];

  v5[2] = objc_msgSend(a3, "scaledSize", 0, 0);
  v5[3] = v3;
  +[NURegion regionWithRect:](NURegion, "regionWithRect:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
