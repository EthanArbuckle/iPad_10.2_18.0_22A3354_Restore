@implementation ANTrackPlayerInfo

- (ANTrackPlayerInfo)initWithPlayerItem:(id)a3 announcementID:(id)a4 trackType:(int64_t)a5
{
  id v9;
  id v10;
  ANTrackPlayerInfo *v11;
  ANTrackPlayerInfo *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ANTrackPlayerInfo;
  v11 = -[ANTrackPlayerInfo init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_playerItem, a3);
    objc_storeStrong((id *)&v12->_announcementID, a4);
    v12->_trackType = a5;
    v12->_completed = 0;
  }

  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[ANTrackPlayerInfo announcementID](self, "announcementID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANTrackPlayerInfo playerItem](self, "playerItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("AnnouncementID = %@, Player Item = %@, Track Type = %ld, completed = %d"), v4, v5, -[ANTrackPlayerInfo trackType](self, "trackType"), -[ANTrackPlayerInfo completed](self, "completed"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (AVPlayerItem)playerItem
{
  return self->_playerItem;
}

- (void)setPlayerItem:(id)a3
{
  objc_storeStrong((id *)&self->_playerItem, a3);
}

- (NSString)announcementID
{
  return self->_announcementID;
}

- (int64_t)trackType
{
  return self->_trackType;
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_announcementID, 0);
  objc_storeStrong((id *)&self->_playerItem, 0);
}

@end
