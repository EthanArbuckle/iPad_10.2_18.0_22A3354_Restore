@implementation WDHourlyActivitySummaryPage

- (NSArray)activitySummaryItems
{
  return self->_activitySummaryItems;
}

- (void)setActivitySummaryItems:(id)a3
{
  objc_storeStrong((id *)&self->_activitySummaryItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activitySummaryItems, 0);
}

@end
