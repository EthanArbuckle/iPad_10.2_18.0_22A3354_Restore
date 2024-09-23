@implementation _HKActivityRingViewSizingDirective

+ (id)sortedRingRatioDirectives
{
  if (sortedRingRatioDirectives_onceToken != -1)
    dispatch_once(&sortedRingRatioDirectives_onceToken, &__block_literal_global);
  return (id)sortedRingRatioDirectives_sortedRingRatioDirectives;
}

+ (id)activityRingSizingDirectiveWithIdentifier:(id)a3 width:(double)a4 outerRingOffset:(double)a5 ringThickness:(double)a6 ringInterspacing:(double)a7
{
  id v11;
  void *v12;

  v11 = a3;
  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "setIdentifier:", v11);

  objc_msgSend(v12, "setWidth:", a4);
  objc_msgSend(v12, "setOuterRingOffset:", a5);
  objc_msgSend(v12, "setRingThickness:", a6);
  objc_msgSend(v12, "setRingInterspacing:", a7);
  return v12;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void)setWidth:(double)a3
{
  self->_width = a3;
}

- (void)setOuterRingOffset:(double)a3
{
  self->_outerRingOffset = a3;
}

- (void)setRingThickness:(double)a3
{
  self->_ringThickness = a3;
}

- (void)setRingInterspacing:(double)a3
{
  self->_ringInterspacing = a3;
}

- (double)width
{
  return self->_width;
}

- (double)ringThickness
{
  return self->_ringThickness;
}

- (double)ringInterspacing
{
  return self->_ringInterspacing;
}

- (double)outerRingOffset
{
  return self->_outerRingOffset;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKActivityRingViewSizingDirective identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKActivityRingViewSizingDirective outerRingOffset](self, "outerRingOffset");
  v8 = v7;
  -[_HKActivityRingViewSizingDirective ringThickness](self, "ringThickness");
  v10 = v9;
  -[_HKActivityRingViewSizingDirective ringInterspacing](self, "ringInterspacing");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p %@ outerRingOffset: %f ringThickness: %f ringInterspacing: %f>"), v5, self, v6, v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
