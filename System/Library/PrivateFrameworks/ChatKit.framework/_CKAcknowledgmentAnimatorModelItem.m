@implementation _CKAcknowledgmentAnimatorModelItem

- (CKEntity)entity
{
  return self->_entity;
}

- (void)setEntity:(id)a3
{
  objc_storeStrong((id *)&self->_entity, a3);
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (void)setIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_indexPath, a3);
}

- (int64_t)ackVoteCount
{
  return self->_ackVoteCount;
}

- (void)setAckVoteCount:(int64_t)a3
{
  self->_ackVoteCount = a3;
}

- (int64_t)acknowledgmentType
{
  return self->_acknowledgmentType;
}

- (void)setAcknowledgmentType:(int64_t)a3
{
  self->_acknowledgmentType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_storeStrong((id *)&self->_entity, 0);
}

@end
