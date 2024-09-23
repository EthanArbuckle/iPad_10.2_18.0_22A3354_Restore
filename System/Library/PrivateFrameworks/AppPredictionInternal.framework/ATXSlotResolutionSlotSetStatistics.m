@implementation ATXSlotResolutionSlotSetStatistics

- (ATXSlotResolutionSlotSetStatistics)init
{
  ATXSlotResolutionSlotSetStatistics *v2;
  ATXSlotResolutionSlotSetStatistics *v3;
  ATXSlotResolutionSlotSetStatistics *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXSlotResolutionSlotSetStatistics;
  v2 = -[ATXSlotResolutionSlotSetStatistics init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_entropy = 0.0;
    v2->_numOccurrences = 0.0;
    v4 = v2;
  }

  return v3;
}

@end
