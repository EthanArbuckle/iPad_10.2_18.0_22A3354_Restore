@implementation VCStatisticsHistory

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[VCStatisticsHistory clearSendHistory](self, "clearSendHistory");
  v3.receiver = self;
  v3.super_class = (Class)VCStatisticsHistory;
  -[VCStatisticsHistory dealloc](&v3, sel_dealloc);
}

- (void)clearSendHistory
{
  VCStatisticsSendHistoryElement *sendHistory;
  VCStatisticsSendHistoryElement *var5;

  sendHistory = self->_sendHistory;
  if (sendHistory)
  {
    do
    {
      var5 = sendHistory->var5;
      free(sendHistory);
      sendHistory = var5;
    }
    while (var5);
  }
}

@end
