@implementation ATXHeroAndClipSessionLogSampledEvent

- (id)initFromLaunch:(id)a3
{
  id v5;
  ATXHeroAndClipSessionLogSampledEvent *v6;
  ATXHeroAndClipSessionLogSampledEvent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXHeroAndClipSessionLogSampledEvent;
  v6 = -[ATXHeroAndClipSessionLogSampledEvent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_launch, a3);

  return v7;
}

- (id)location
{
  id v3;
  double v4;
  double v5;
  double v6;

  v3 = objc_alloc(MEMORY[0x1E0C9E3B8]);
  -[ATXAppOrClipLaunch latitude](self->_launch, "latitude");
  v5 = v4;
  -[ATXAppOrClipLaunch longitude](self->_launch, "longitude");
  return (id)objc_msgSend(v3, "initWithLatitude:longitude:", v5, v6);
}

- (id)bundleId
{
  return -[ATXAppOrClipLaunch bundleId](self->_launch, "bundleId");
}

- (BOOL)isClip
{
  return -[ATXAppOrClipLaunch isClip](self->_launch, "isClip");
}

- (ATXAppOrClipLaunch)launch
{
  return self->_launch;
}

- (void)setLaunch:(id)a3
{
  objc_storeStrong((id *)&self->_launch, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launch, 0);
}

@end
