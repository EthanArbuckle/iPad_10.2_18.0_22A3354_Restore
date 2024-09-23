@implementation HKOrganDonationFlowErrorAnalyticEvent

- (HKOrganDonationFlowErrorAnalyticEvent)initWithErrorType:(int)a3
{
  HKOrganDonationFlowErrorAnalyticEvent *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKOrganDonationFlowErrorAnalyticEvent;
  result = -[HKOrganDonationFlowErrorAnalyticEvent init](&v5, sel_init);
  if (result)
    result->_errorType = a3;
  return result;
}

- (NSString)eventName
{
  return (NSString *)CFSTR("com.apple.HealthApp.OrganDonation.Error.Event");
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
  HKOrganDonationErrorTypeAsString(self->_errorType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("errorType"));

  return v5;
}

@end
