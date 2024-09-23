@implementation NPKSettingsPreservingFileDataAccessor

- (void)updateSettings:(unint64_t)a3
{
  NPKCompanionAgentConnection *connection;
  id v5;

  connection = self->_connection;
  -[NPKSettingsPreservingFileDataAccessor objectUniqueID](self, "objectUniqueID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NPKCompanionAgentConnection updateSettings:forPassWithUniqueID:](connection, "updateSettings:forPassWithUniqueID:", a3, v5);

}

- (NPKCompanionAgentConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (NSString)objectUniqueID
{
  return self->_objectUniqueID;
}

- (void)setObjectUniqueID:(id)a3
{
  objc_storeStrong((id *)&self->_objectUniqueID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectUniqueID, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
