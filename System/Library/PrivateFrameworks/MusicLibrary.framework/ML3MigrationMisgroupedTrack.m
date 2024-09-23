@implementation ML3MigrationMisgroupedTrack

- (ML3MigrationMisgroupedTrack)initWithPersistentID:(int64_t)a3 albumArtistPID:(int64_t)a4
{
  ML3MigrationMisgroupedTrack *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ML3MigrationMisgroupedTrack;
  result = -[ML3MigrationMisgroupedTrack init](&v7, sel_init);
  if (result)
  {
    result->_persistentID = a3;
    result->_albumArtistPID = a4;
  }
  return result;
}

- (int64_t)persistentID
{
  return self->_persistentID;
}

- (int64_t)albumArtistPID
{
  return self->_albumArtistPID;
}

@end
