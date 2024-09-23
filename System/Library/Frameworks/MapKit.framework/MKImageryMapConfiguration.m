@implementation MKImageryMapConfiguration

- (MKImageryMapConfiguration)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MKImageryMapConfiguration;
  return -[MKMapConfiguration initWithElevationStyle:](&v3, sel_initWithElevationStyle_, 0);
}

- (MKImageryMapConfiguration)initWithElevationStyle:(MKMapElevationStyle)elevationStyle
{
  MKImageryMapConfiguration *v4;
  MKImageryMapConfiguration *v5;

  v4 = -[MKImageryMapConfiguration init](self, "init");
  v5 = v4;
  if (v4)
    -[MKMapConfiguration setElevationStyle:](v4, "setElevationStyle:", elevationStyle);
  return v5;
}

@end
