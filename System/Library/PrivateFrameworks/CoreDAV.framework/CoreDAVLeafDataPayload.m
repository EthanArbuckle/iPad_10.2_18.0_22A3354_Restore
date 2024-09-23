@implementation CoreDAVLeafDataPayload

- (CoreDAVLeafDataPayload)initWithURL:(id)a3 eTag:(id)a4 dataPayload:(id)a5 inContainerWithURL:(id)a6 withAccountInfoProvider:(id)a7
{
  id v11;
  id v12;
  id v13;
  CoreDAVLeafDataPayload *v14;
  CoreDAVLeafDataPayload *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CoreDAVLeafDataPayload;
  v14 = -[CoreDAVLeafDataPayload init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_dataPayload, a5);
    objc_storeStrong((id *)&v15->_serverID, a3);
    objc_storeStrong((id *)&v15->_syncKey, a4);
  }

  return v15;
}

- (NSURL)serverID
{
  return self->_serverID;
}

- (void)setServerID:(id)a3
{
  objc_storeStrong((id *)&self->_serverID, a3);
}

- (NSData)dataPayload
{
  return self->_dataPayload;
}

- (NSString)syncKey
{
  return self->_syncKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataPayload, 0);
  objc_storeStrong((id *)&self->_syncKey, 0);
  objc_storeStrong((id *)&self->_serverID, 0);
}

@end
