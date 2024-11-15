@implementation HDCloudSyncStatus

- (NSDate)lastSuccessfulPullDate
{
  return self->_lastSuccessfulPullDate;
}

- (void)setLastSuccessfulPullDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastSuccessfulPullDate, a3);
}

- (NSDate)lastSuccessfulPushDate
{
  return self->_lastSuccessfulPushDate;
}

- (void)setLastSuccessfulPushDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastSuccessfulPushDate, a3);
}

- (NSDate)lastSuccessfulLitePushDate
{
  return self->_lastSuccessfulLitePushDate;
}

- (void)setLastSuccessfulLitePushDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastSuccessfulLitePushDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSuccessfulLitePushDate, 0);
  objc_storeStrong((id *)&self->_lastSuccessfulPushDate, 0);
  objc_storeStrong((id *)&self->_lastSuccessfulPullDate, 0);
}

@end
