@implementation HKOrganDonationFlowImpressionAnalyticEvent

- (HKOrganDonationFlowImpressionAnalyticEvent)initWithImpressionEvent:(int)a3
{
  HKOrganDonationFlowImpressionAnalyticEvent *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKOrganDonationFlowImpressionAnalyticEvent;
  result = -[HKOrganDonationFlowImpressionAnalyticEvent init](&v5, sel_init);
  if (result)
    result->_impressionEvent = a3;
  return result;
}

- (NSString)eventName
{
  return (NSString *)CFSTR("com.apple.HealthApp.OrganDonation.FlowImpression.Event");
}

- (BOOL)isEventSubmissionIHAGated
{
  return 0;
}

- (id)createEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;

  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  HKOrganDonationFlowImpressionEventAsString(self->_impressionEvent);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("sourceOfFlowImpression"));

  return v5;
}

@end
