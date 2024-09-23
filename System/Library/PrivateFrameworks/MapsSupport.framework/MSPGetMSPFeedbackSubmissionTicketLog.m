@implementation MSPGetMSPFeedbackSubmissionTicketLog

void __MSPGetMSPFeedbackSubmissionTicketLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Maps.MSP", "MSPFeedbackSubmissionTicket");
  v1 = (void *)_MergedGlobals_48;
  _MergedGlobals_48 = (uint64_t)v0;

}

@end
