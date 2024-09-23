@implementation TKRemoteImage

- (TKRemoteImage)init
{
  TKRemoteImage *v3;
  objc_super v4;
  SEL v5;
  TKRemoteImage *v6;

  v5 = a2;
  v6 = 0;
  v4.receiver = self;
  v4.super_class = (Class)TKRemoteImage;
  v6 = -[TKAdaptiveImage init](&v4, sel_init);
  objc_storeStrong((id *)&v6, v6);
  if (v6)
    -[TKAdaptiveImage setService:](v6, "setService:", CFSTR("original"));
  v3 = v6;
  objc_storeStrong((id *)&v6, 0);
  return v3;
}

- (id)imageTraitForMetrics
{
  return (id)objc_msgSend((id)objc_opt_class(), "zeroTrait");
}

@end
