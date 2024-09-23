@implementation MPUbiquitousPlaybackPositionEntity

+ (id)ubiquitousIdentifierWithStoreAdamID:(int64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0DDC028], "ubiquitousIdentifierWithUniqueStoreID:", a3);
}

- (MPUbiquitousPlaybackPositionEntity)initWithUbiquitousIdentifier:(id)a3
{
  id v5;
  MPUbiquitousPlaybackPositionEntity *v6;
  MPUbiquitousPlaybackPositionEntity *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPUbiquitousPlaybackPositionEntity;
  v6 = -[MPUbiquitousPlaybackPositionEntity init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_ubiquitousIdentifier, a3);
    propertyMonitor_0 = 0;
  }

  return v7;
}

- (MPUbiquitousPlaybackPositionEntity)init
{
  return -[MPUbiquitousPlaybackPositionEntity initWithUbiquitousIdentifier:](self, "initWithUbiquitousIdentifier:", 0);
}

- (void)setBookmarkTimestamp:(double)a3
{
  self->_bookmarkTimestamp = a3;
  propertyMonitor_0 |= 2u;
}

- (void)setBookmarkTime:(double)a3
{
  self->_bookmarkTime = a3;
  propertyMonitor_0 |= 1u;
}

- (void)setUserPlayCount:(unint64_t)a3
{
  self->_userPlayCount = a3;
  propertyMonitor_0 |= 4u;
}

- (void)setHasBeenPlayed:(BOOL)a3
{
  self->_hasBeenPlayed = a3;
  propertyMonitor_0 |= 8u;
}

- (BOOL)hasBeenPlayedModified
{
  return (propertyMonitor_0 >> 3) & 1;
}

- (BOOL)userPlayCountModified
{
  return (propertyMonitor_0 >> 2) & 1;
}

- (BOOL)bookmarkTimeModified
{
  return propertyMonitor_0 & 1;
}

- (BOOL)bookmarkTimestampModified
{
  return (propertyMonitor_0 >> 1) & 1;
}

- (NSString)ubiquitousIdentifier
{
  return self->_ubiquitousIdentifier;
}

- (NSString)libraryIdentifier
{
  return self->_libraryIdentifier;
}

- (void)setLibraryIdentifier:(id)a3
{
  self->_libraryIdentifier = (NSString *)a3;
}

- (double)bookmarkTimestamp
{
  return self->_bookmarkTimestamp;
}

- (double)bookmarkTime
{
  return self->_bookmarkTime;
}

- (unint64_t)userPlayCount
{
  return self->_userPlayCount;
}

- (BOOL)hasBeenPlayed
{
  return self->_hasBeenPlayed;
}

- (NSNumber)accountDSID
{
  return self->_accountDSID;
}

- (void)setAccountDSID:(id)a3
{
  self->_accountDSID = (NSNumber *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ubiquitousIdentifier, 0);
}

@end
