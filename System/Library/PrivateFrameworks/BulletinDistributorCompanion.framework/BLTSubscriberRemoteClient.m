@implementation BLTSubscriberRemoteClient

- (BLTSubscriberRemoteClient)init
{
  return -[BLTSubscriberRemoteClient initWithConnection:](self, "initWithConnection:", 0);
}

- (BLTSubscriberRemoteClient)initWithConnection:(id)a3
{
  id v5;
  BLTSubscriberRemoteClient *v6;
  BLTSubscriberRemoteClient *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BLTSubscriberRemoteClient;
  v6 = -[BLTSubscriberRemoteClient init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_connection, a3);

  return v7;
}

- (void)dealloc
{
  NSXPCConnection *connection;
  objc_super v4;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  connection = self->_connection;
  self->_connection = 0;

  v4.receiver = self;
  v4.super_class = (Class)BLTSubscriberRemoteClient;
  -[BLTSubscriberRemoteClient dealloc](&v4, sel_dealloc);
}

- (id)sectionIDs
{
  return 0;
}

- (id)sectionIDsForBulletins
{
  return 0;
}

- (id)subscriptionInfos
{
  return 0;
}

- (void)pingWithRecordID:(id)a3 forSectionID:(id)a4
{
  NSXPCConnection *connection;
  id v6;
  id v7;
  id v8;

  connection = self->_connection;
  v6 = a4;
  v7 = a3;
  -[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pingWithRecordID:forSectionID:", v7, v6);

}

- (void)pingWithRecordID:(id)a3 forSectionID:(id)a4 ack:(id)a5
{
  NSXPCConnection *connection;
  id v8;
  id v9;
  id v10;
  id v11;

  connection = self->_connection;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pingWithRecordID:forSectionID:ack:", v10, v9, v8);

}

- (void)pingWithBulletin:(id)a3
{
  NSXPCConnection *connection;
  id v4;
  id v5;

  connection = self->_connection;
  v4 = a3;
  -[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pingWithBulletin:", v4);

}

- (void)pingWithBulletin:(id)a3 ack:(id)a4
{
  NSXPCConnection *connection;
  id v6;
  id v7;
  id v8;

  connection = self->_connection;
  v6 = a4;
  v7 = a3;
  -[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pingWithBulletin:ack:", v7, v6);

}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
