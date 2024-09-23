@implementation HSPlayStatusUpdateResponse

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p: nextRevisionID:%u playStatusInformation:%@>"), v5, self, self->_nextRevisionID, self->_playStatusInformation);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unsigned)nextRevisionID
{
  return self->_nextRevisionID;
}

- (void)setNextRevisionID:(unsigned int)a3
{
  self->_nextRevisionID = a3;
}

- (unint64_t)nowPlayingContainerID
{
  return self->_nowPlayingContainerID;
}

- (void)setNowPlayingContainerID:(unint64_t)a3
{
  self->_nowPlayingContainerID = a3;
}

- (unint64_t)nowPlayingContainerItemID
{
  return self->_nowPlayingContainerItemID;
}

- (void)setNowPlayingContainerItemID:(unint64_t)a3
{
  self->_nowPlayingContainerItemID = a3;
}

- (unint64_t)nowPlayingDatabaseID
{
  return self->_nowPlayingDatabaseID;
}

- (void)setNowPlayingDatabaseID:(unint64_t)a3
{
  self->_nowPlayingDatabaseID = a3;
}

- (unint64_t)nowPlayingItemID
{
  return self->_nowPlayingItemID;
}

- (void)setNowPlayingItemID:(unint64_t)a3
{
  self->_nowPlayingItemID = a3;
}

- (NSDictionary)playStatusInformation
{
  return self->_playStatusInformation;
}

- (void)setPlayStatusInformation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playStatusInformation, 0);
}

@end
