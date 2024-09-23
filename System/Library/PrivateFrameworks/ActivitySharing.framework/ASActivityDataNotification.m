@implementation ASActivityDataNotification

- (ASFriend)friend
{
  return self->_friend;
}

- (void)setFriend:(id)a3
{
  objc_storeStrong((id *)&self->_friend, a3);
}

- (id)sample
{
  return self->_sample;
}

- (void)setSample:(id)a3
{
  objc_storeStrong(&self->_sample, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sample, 0);
  objc_storeStrong((id *)&self->_friend, 0);
}

@end
