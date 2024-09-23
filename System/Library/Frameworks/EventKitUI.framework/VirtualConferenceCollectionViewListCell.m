@implementation VirtualConferenceCollectionViewListCell

- (EKVirtualConferenceRoomType)currentRoomType
{
  return self->_currentRoomType;
}

- (void)setCurrentRoomType:(id)a3
{
  objc_storeStrong((id *)&self->_currentRoomType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentRoomType, 0);
}

@end
