@implementation _GEOLocalOfflineSubscriptionInfo

- (BOOL)isLoaded
{
  unint64_t v2;

  v2 = -[GEOMapDataSubscriptionState loadState](self->_state, "loadState");
  return (v2 < 4) & (6u >> (v2 & 0xF));
}

- (unsigned)device
{
  return 1;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@<%p> { region: %@, loadState: %d }"), v5, self, self->_region, -[GEOMapDataSubscriptionState loadState](self->_state, "loadState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (GEOMapRegion)region
{
  return self->_region;
}

- ($140BDABED96B4E653C9F0DB440664A5C)rect
{
  double x;
  double y;
  double width;
  double height;
  $140BDABED96B4E653C9F0DB440664A5C result;

  x = self->_rect.origin.x;
  y = self->_rect.origin.y;
  width = self->_rect.size.width;
  height = self->_rect.size.height;
  result.var1.var1 = height;
  result.var1.var0 = width;
  result.var0.var1 = y;
  result.var0.var0 = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_region, 0);
}

@end
