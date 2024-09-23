@implementation _EDMessageChangeManagerFlagChange

- (EDPersistedMessage)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (ECMessageFlagChange)serverChange
{
  return self->_serverChange;
}

- (void)setServerChange:(id)a3
{
  objc_storeStrong((id *)&self->_serverChange, a3);
}

- (ECMessageFlagChange)localChange
{
  return self->_localChange;
}

- (void)setLocalChange:(id)a3
{
  objc_storeStrong((id *)&self->_localChange, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localChange, 0);
  objc_storeStrong((id *)&self->_serverChange, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end
