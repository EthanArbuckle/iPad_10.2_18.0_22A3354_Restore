@implementation CLSClient

- (void)clientRemote_databaseRecreated
{
  NSObject *v2;

  clsNotificationQueue();
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v2, &unk_1E974BD08);

}

- (CLSClientDelegate)delagate
{
  return (CLSClientDelegate *)objc_loadWeakRetained((id *)&self->_delagate);
}

- (void)setDelagate:(id)a3
{
  objc_storeWeak((id *)&self->_delagate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delagate);
}

@end
