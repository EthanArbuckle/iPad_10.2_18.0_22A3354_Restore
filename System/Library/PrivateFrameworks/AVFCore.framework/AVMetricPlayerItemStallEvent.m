@implementation AVMetricPlayerItemStallEvent

- (id)debugDescription
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMetricPlayerItemStallEvent;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<AVMetricPlayerItemStallEvent:%p %@>"), self, -[AVMetricPlayerItemRateChangeEvent debugDescriptionForAttr](&v3, sel_debugDescriptionForAttr));
}

@end
