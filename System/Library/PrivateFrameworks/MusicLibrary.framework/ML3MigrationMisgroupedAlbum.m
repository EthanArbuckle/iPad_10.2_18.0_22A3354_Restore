@implementation ML3MigrationMisgroupedAlbum

- (ML3MigrationMisgroupedAlbum)initWithAlbumPID:(int64_t)a3 albumArtistPID:(int64_t)a4
{
  ML3MigrationMisgroupedAlbum *v6;
  ML3MigrationMisgroupedAlbum *v7;
  NSMutableArray *v8;
  NSMutableArray *misgroupedTracks;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ML3MigrationMisgroupedAlbum;
  v6 = -[ML3MigrationMisgroupedAlbum init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_albumPID = a3;
    v6->_albumArtistPID = a4;
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    misgroupedTracks = v7->_misgroupedTracks;
    v7->_misgroupedTracks = v8;

  }
  return v7;
}

- (void)addMisgroupedTrack:(id)a3
{
  -[NSMutableArray addObject:](self->_misgroupedTracks, "addObject:", a3);
}

- (NSArray)misgroupedTracks
{
  return (NSArray *)self->_misgroupedTracks;
}

- (int64_t)albumPID
{
  return self->_albumPID;
}

- (int64_t)albumArtistPID
{
  return self->_albumArtistPID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_misgroupedTracks, 0);
}

@end
