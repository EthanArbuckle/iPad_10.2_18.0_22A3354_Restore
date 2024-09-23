@implementation CHSMutableWidgetConfiguration

- (void)setContainerDescriptors:(id)a3
{
  NSArray *v4;
  NSArray *containerDescriptors;
  id v6;

  v6 = a3;
  v4 = (NSArray *)objc_msgSend(v6, "copy");
  containerDescriptors = self->super._containerDescriptors;
  self->super._containerDescriptors = v4;

}

- (void)setMetricsSpecification:(id)a3
{
  CHSWidgetMetricsSpecification *v4;
  CHSWidgetMetricsSpecification *metricsSpecification;
  id v6;

  v6 = a3;
  v4 = (CHSWidgetMetricsSpecification *)objc_msgSend(v6, "copy");
  metricsSpecification = self->super._metricsSpecification;
  self->super._metricsSpecification = v4;

}

- (void)setRateLimitPolicies:(id)a3
{
  NSSet *v4;
  NSSet *rateLimitPolicies;
  id v6;

  v6 = a3;
  v4 = (NSSet *)objc_msgSend(v6, "copy");
  rateLimitPolicies = self->super._rateLimitPolicies;
  self->super._rateLimitPolicies = v4;

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CHSWidgetConfiguration initWithConfiguration:](+[CHSWidgetConfiguration allocWithZone:](CHSWidgetConfiguration, "allocWithZone:", a3), "initWithConfiguration:", self);
}

@end
