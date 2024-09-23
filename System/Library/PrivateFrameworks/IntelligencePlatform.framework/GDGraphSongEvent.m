@implementation GDGraphSongEvent

- (GDGraphSongEvent)initWithEntityIdentifierField:(id)a3 dateField:(id)a4 playbackStateField:(id)a5 songField:(id)a6 allDateField:(id)a7 allPlaybackStateField:(id)a8 allSongField:(id)a9
{
  id v16;
  id v17;
  GDGraphSongEvent *v18;
  GDGraphSongEvent *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v25 = a3;
  v24 = a4;
  v23 = a5;
  v22 = a6;
  v21 = a7;
  v16 = a8;
  v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)GDGraphSongEvent;
  v18 = -[GDGraphSongEvent init](&v26, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_entityIdentifier, a3);
    objc_storeStrong((id *)&v19->_date, a4);
    objc_storeStrong((id *)&v19->_playbackState, a5);
    objc_storeStrong((id *)&v19->_song, a6);
    objc_storeStrong((id *)&v19->_allDate, a7);
    objc_storeStrong((id *)&v19->_allPlaybackState, a8);
    objc_storeStrong((id *)&v19->_allSong, a9);
  }

  return v19;
}

- (GDGraphSongEventEntityIdentifier)entityIdentifier
{
  return self->_entityIdentifier;
}

- (GDGraphDateRelationship)date
{
  return self->_date;
}

- (NSString)playbackState
{
  return self->_playbackState;
}

- (GDGraphSongRelationship)song
{
  return self->_song;
}

- (NSArray)allDate
{
  return self->_allDate;
}

- (NSArray)allPlaybackState
{
  return self->_allPlaybackState;
}

- (NSArray)allSong
{
  return self->_allSong;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allSong, 0);
  objc_storeStrong((id *)&self->_allPlaybackState, 0);
  objc_storeStrong((id *)&self->_allDate, 0);
  objc_storeStrong((id *)&self->_song, 0);
  objc_storeStrong((id *)&self->_playbackState, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
}

@end
