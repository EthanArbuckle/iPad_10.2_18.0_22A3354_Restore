@implementation ANPlaybackSessionClient

+ (id)clientWithXPCConnection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSessionID:", v6);

  objc_msgSend(v4, "setConnection:", v3);
  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[ANPlaybackSessionClient connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANPlaybackSessionClient sessionID](self, "sessionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANPlaybackSessionClient groupID](self, "groupID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Connection = %@, Session ID: = %@, Group ID = %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)copy
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_new();
  -[ANPlaybackSessionClient connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setConnection:", v4);

  -[ANPlaybackSessionClient sessionID](self, "sessionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSessionID:", v5);

  -[ANPlaybackSessionClient groupID](self, "groupID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setGroupID:", v6);

  -[ANPlaybackSessionClient endpointID](self, "endpointID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEndpointID:", v7);

  return v3;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionID, a3);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (NSString)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(id)a3
{
  objc_storeStrong((id *)&self->_groupID, a3);
}

- (NSUUID)endpointID
{
  return self->_endpointID;
}

- (void)setEndpointID:(id)a3
{
  objc_storeStrong((id *)&self->_endpointID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpointID, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

@end
