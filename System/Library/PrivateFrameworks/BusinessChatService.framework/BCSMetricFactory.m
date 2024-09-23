@implementation BCSMetricFactory

- (BCSMetricFactory)initWithMeasurementFactory:(id)a3
{
  id v5;
  BCSMetricFactory *v6;
  BCSMetricFactory *v7;
  void *v8;
  BCSCoreAnalyticsMetricHandler *v9;
  uint64_t v10;
  NSArray *postProcessingMetricHandlers;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BCSMetricFactory;
  v6 = -[BCSMetricFactory init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_measurementFactory, a3);
    v8 = (void *)MEMORY[0x24BDBCE30];
    v9 = objc_alloc_init(BCSCoreAnalyticsMetricHandler);
    objc_msgSend(v8, "arrayWithObject:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    postProcessingMetricHandlers = v7->_postProcessingMetricHandlers;
    v7->_postProcessingMetricHandlers = (NSArray *)v10;

  }
  return v7;
}

- (id)configResolutionMetricForConfigType:(int64_t)a3
{
  NSArray *postProcessingMetricHandlers;

  if (self)
    postProcessingMetricHandlers = self->_postProcessingMetricHandlers;
  else
    postProcessingMetricHandlers = 0;
  return +[BCSConfigResolutionMetric metricForConfigType:postProcessingMetricHandlers:](BCSConfigResolutionMetric, "metricForConfigType:postProcessingMetricHandlers:", a3, postProcessingMetricHandlers);
}

- (id)shardResolutionMetricForShardIdentifier:(id)a3
{
  NSArray *postProcessingMetricHandlers;

  if (self)
    postProcessingMetricHandlers = self->_postProcessingMetricHandlers;
  else
    postProcessingMetricHandlers = 0;
  return +[BCSShardResolutionMetric metricForShardIdentifier:postProcessingMetricHandlers:](BCSShardResolutionMetric, "metricForShardIdentifier:postProcessingMetricHandlers:", a3, postProcessingMetricHandlers);
}

- (id)itemResolutionMetricForItemIdentifier:(id)a3
{
  NSArray *postProcessingMetricHandlers;

  if (self)
    postProcessingMetricHandlers = self->_postProcessingMetricHandlers;
  else
    postProcessingMetricHandlers = 0;
  return +[BCSItemResolutionMetric metricForItemIdentifier:postProcessingMetricHandlers:](BCSItemResolutionMetric, "metricForItemIdentifier:postProcessingMetricHandlers:", a3, postProcessingMetricHandlers);
}

- (id)businessLinkRegisteredMetricForItemIdentifier:(id)a3
{
  NSArray *postProcessingMetricHandlers;

  if (self)
    postProcessingMetricHandlers = self->_postProcessingMetricHandlers;
  else
    postProcessingMetricHandlers = 0;
  return +[BCSBusinessLinkRegisteredMetric metricWithPostProcessingMetricHandlers:](BCSBusinessLinkRegisteredMetric, "metricWithPostProcessingMetricHandlers:", postProcessingMetricHandlers);
}

- (id)businessLinkFetchMetricForItemIdentifier:(id)a3
{
  NSArray *postProcessingMetricHandlers;

  if (self)
    postProcessingMetricHandlers = self->_postProcessingMetricHandlers;
  else
    postProcessingMetricHandlers = 0;
  return +[BCSBusinessLinkFetchMetric metricWithPostProcessingMetricHandlers:](BCSBusinessLinkFetchMetric, "metricWithPostProcessingMetricHandlers:", postProcessingMetricHandlers);
}

- (id)businessLinkHashFetchMetricForItemIdentifier:(id)a3
{
  NSArray *postProcessingMetricHandlers;

  if (self)
    postProcessingMetricHandlers = self->_postProcessingMetricHandlers;
  else
    postProcessingMetricHandlers = 0;
  return +[BCSBusinessLinkHashFetchMetric metricWithPostProcessingMetricHandlers:](BCSBusinessLinkHashFetchMetric, "metricWithPostProcessingMetricHandlers:", postProcessingMetricHandlers);
}

- (id)chatSuggestRegisteredMetricForItemIdentifier:(id)a3
{
  NSArray *postProcessingMetricHandlers;

  if (self)
    postProcessingMetricHandlers = self->_postProcessingMetricHandlers;
  else
    postProcessingMetricHandlers = 0;
  return +[BCSChatSuggestRegisteredMetric metricWithPostProcessingMetricHandlers:](BCSChatSuggestRegisteredMetric, "metricWithPostProcessingMetricHandlers:", postProcessingMetricHandlers);
}

- (id)chatSuggestFetchMetricForItemIdentifier:(id)a3
{
  NSArray *postProcessingMetricHandlers;

  if (self)
    postProcessingMetricHandlers = self->_postProcessingMetricHandlers;
  else
    postProcessingMetricHandlers = 0;
  return +[BCSChatSuggestFetchMetric metricWithPostProcessingMetricHandlers:](BCSChatSuggestFetchMetric, "metricWithPostProcessingMetricHandlers:", postProcessingMetricHandlers);
}

- (id)businessCallerFetchMetricForItemIdentifier:(id)a3
{
  NSArray *postProcessingMetricHandlers;

  if (self)
    postProcessingMetricHandlers = self->_postProcessingMetricHandlers;
  else
    postProcessingMetricHandlers = 0;
  return +[BCSBusinessCallerFetchMetric metricWithPostProcessingMetricHandlers:](BCSBusinessCallerFetchMetric, "metricWithPostProcessingMetricHandlers:", postProcessingMetricHandlers);
}

- (id)megashardFetchMetricForType:(int64_t)a3
{
  NSArray *postProcessingMetricHandlers;

  if (self)
    postProcessingMetricHandlers = self->_postProcessingMetricHandlers;
  else
    postProcessingMetricHandlers = 0;
  return +[BCSMegashardFetchMetric metricForMegashardType:postProcessingMetricHandlers:](BCSMegashardFetchMetric, "metricForMegashardType:postProcessingMetricHandlers:", a3, postProcessingMetricHandlers);
}

- (BCSMeasurementFactoryProtocol)measurementFactory
{
  return self->_measurementFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postProcessingMetricHandlers, 0);
  objc_storeStrong((id *)&self->_measurementFactory, 0);
}

@end
