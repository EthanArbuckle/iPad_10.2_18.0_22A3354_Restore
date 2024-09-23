@implementation NWRemoteBrowserWrapper

- (NSUUID)clientID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (void)setClientID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NWBrowser)browser
{
  return (NWBrowser *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBrowser:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browser, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
}

@end
