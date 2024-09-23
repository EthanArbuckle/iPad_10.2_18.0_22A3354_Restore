@implementation GKMatchEvent

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (GKPlayer)recipientPlayer
{
  return self->_recipientPlayer;
}

- (void)setRecipientPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_recipientPlayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipientPlayer, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
