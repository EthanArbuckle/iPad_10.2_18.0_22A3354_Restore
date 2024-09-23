@implementation MSPGetMSPAuthFeedbackReportTicketLog

void __MSPGetMSPAuthFeedbackReportTicketLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Maps.MSP", "MSPAuthFeedbackReportTicket");
  v1 = (void *)_MergedGlobals_46;
  _MergedGlobals_46 = (uint64_t)v0;

}

@end
