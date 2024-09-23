@implementation HKMCCycleTimelinePillConfiguration

+ (id)pillConfigurationWithWidth:(double)a3 spacing:(double)a4
{
  HKMCCycleTimelinePillConfiguration *v6;

  v6 = objc_alloc_init(HKMCCycleTimelinePillConfiguration);
  v6->_width = a3;
  v6->_spacing = a4;
  return v6;
}

- (double)heightWithAspectRatio:(double)a3
{
  return self->_width * a3;
}

- (double)width
{
  return self->_width;
}

- (double)spacing
{
  return self->_spacing;
}

@end
