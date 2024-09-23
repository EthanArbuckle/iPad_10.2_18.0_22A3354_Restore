@implementation CMSNowPlayingInfo

+ (id)nowPlayingInfoFromDictionary:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "instanceFromCMSCoded:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)cmsCoded
{
  return 0;
}

+ (id)instanceFromCMSCoded:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  cmsSafeDictionary(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(v3, "cmsOptionalStringForKey:", CFSTR("albumName"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAlbumName:", v5);

    objc_msgSend(v3, "cmsOptionalStringForKey:", CFSTR("artistName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setArtistName:", v6);

    objc_msgSend(v3, "cmsOptionalDictionaryForKey:", CFSTR("artwork"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("url"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setArtworkURLString:", v8);

    objc_msgSend(v3, "cmsOptionalStringForKey:", CFSTR("composerName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setComposerName:", v9);

    objc_msgSend(v4, "setDiscNumber:", objc_msgSend(v3, "cmsUnsignedForKey:withDefault:", CFSTR("discNumber"), 0));
    objc_msgSend(v4, "setTrackNumber:", objc_msgSend(v3, "cmsUnsignedForKey:withDefault:", CFSTR("trackNumber"), 0));
    objc_msgSend(v3, "cmsOptionalStringForKey:", CFSTR("name"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitle:", v10);

    objc_msgSend(v3, "cmsOptionalArrayOfClass:forKey:", objc_opt_class(), CFSTR("genreNames"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setGenre:", v12);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSString)albumName
{
  return self->_albumName;
}

- (void)setAlbumName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)artistName
{
  return self->_artistName;
}

- (void)setArtistName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)genre
{
  return self->_genre;
}

- (void)setGenre:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)composerName
{
  return self->_composerName;
}

- (void)setComposerName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)externalContentIdentifier
{
  return self->_externalContentIdentifier;
}

- (void)setExternalContentIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)collectionIdentifier
{
  return self->_collectionIdentifier;
}

- (void)setCollectionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)externalUserProfileIdentifier
{
  return self->_externalUserProfileIdentifier;
}

- (void)setExternalUserProfileIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)artworkURLString
{
  return self->_artworkURLString;
}

- (void)setArtworkURLString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (unint64_t)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(unint64_t)a3
{
  self->_mediaType = a3;
}

- (unint64_t)trackNumber
{
  return self->_trackNumber;
}

- (void)setTrackNumber:(unint64_t)a3
{
  self->_trackNumber = a3;
}

- (unint64_t)discNumber
{
  return self->_discNumber;
}

- (void)setDiscNumber:(unint64_t)a3
{
  self->_discNumber = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)elapsedTime
{
  return self->_elapsedTime;
}

- (void)setElapsedTime:(double)a3
{
  self->_elapsedTime = a3;
}

- (float)playbackRate
{
  return self->_playbackRate;
}

- (void)setPlaybackRate:(float)a3
{
  self->_playbackRate = a3;
}

- (float)defaultPlaybackRate
{
  return self->_defaultPlaybackRate;
}

- (void)setDefaultPlaybackRate:(float)a3
{
  self->_defaultPlaybackRate = a3;
}

- (unint64_t)queueIndex
{
  return self->_queueIndex;
}

- (void)setQueueIndex:(unint64_t)a3
{
  self->_queueIndex = a3;
}

- (BOOL)isAdvertisement
{
  return self->_isAdvertisement;
}

- (void)setIsAdvertisement:(BOOL)a3
{
  self->_isAdvertisement = a3;
}

- (BOOL)isLive
{
  return self->_isLive;
}

- (void)setIsLive:(BOOL)a3
{
  self->_isLive = a3;
}

- (NSString)requesterSharedUserID
{
  return self->_requesterSharedUserID;
}

- (void)setRequesterSharedUserID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)userAccountHomeUserID
{
  return self->_userAccountHomeUserID;
}

- (void)setUserAccountHomeUserID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)endpointID
{
  return self->_endpointID;
}

- (void)setEndpointID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSString)applicationBundleID
{
  return self->_applicationBundleID;
}

- (void)setApplicationBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)userActivityPersistentIdentifier
{
  return self->_userActivityPersistentIdentifier;
}

- (void)setUserActivityPersistentIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userActivityPersistentIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationBundleID, 0);
  objc_storeStrong((id *)&self->_endpointID, 0);
  objc_storeStrong((id *)&self->_userAccountHomeUserID, 0);
  objc_storeStrong((id *)&self->_requesterSharedUserID, 0);
  objc_storeStrong((id *)&self->_artworkURLString, 0);
  objc_storeStrong((id *)&self->_externalUserProfileIdentifier, 0);
  objc_storeStrong((id *)&self->_collectionIdentifier, 0);
  objc_storeStrong((id *)&self->_externalContentIdentifier, 0);
  objc_storeStrong((id *)&self->_composerName, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_albumName, 0);
}

@end
