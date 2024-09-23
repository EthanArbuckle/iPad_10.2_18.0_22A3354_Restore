@implementation MPGenericTracklistPlaybackQueue

- (MPGenericTracklistPlaybackQueue)initWithMediaRemotePlaybackQueue:(_MRSystemAppPlaybackQueue *)a3 options:(id)a4
{
  MPGenericTracklistPlaybackQueue *v4;
  void *v5;
  uint64_t v6;
  NSArray *trackIdentifiers;
  uint64_t v8;
  NSString *firstTrackIdentifier;
  unsigned int TracklistShuffleMode;
  int64_t v11;
  unsigned int TracklistRepeatMode;
  int64_t v13;
  void *v14;
  uint64_t v15;
  MPIdentifierSet *collectionIdentifierSet;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)MPGenericTracklistPlaybackQueue;
  v4 = -[MPRemotePlaybackQueue initWithMediaRemotePlaybackQueue:options:](&v18, sel_initWithMediaRemotePlaybackQueue_options_);
  if (v4)
  {
    v5 = (void *)MRSystemAppPlaybackQueueCopyGenericTrackIdentifiers();
    objc_msgSend(v5, "msv_map:", &__block_literal_global_4087);
    v6 = objc_claimAutoreleasedReturnValue();
    trackIdentifiers = v4->_trackIdentifiers;
    v4->_trackIdentifiers = (NSArray *)v6;

    MRSystemAppPlaybackQueueGetFirstItemGenericTrackIdentifier();
    v8 = objc_claimAutoreleasedReturnValue();
    firstTrackIdentifier = v4->_firstTrackIdentifier;
    v4->_firstTrackIdentifier = (NSString *)v8;

    TracklistShuffleMode = MRSystemAppPlaybackQueueGetTracklistShuffleMode();
    if (TracklistShuffleMode > 3)
      v11 = 0;
    else
      v11 = qword_193F0BDD0[TracklistShuffleMode];
    v4->_shuffleType = v11;
    TracklistRepeatMode = MRSystemAppPlaybackQueueGetTracklistRepeatMode();
    if (TracklistRepeatMode > 3)
      v13 = 0;
    else
      v13 = qword_193F0BDB0[TracklistRepeatMode];
    v4->_repeatType = v13;
    MRSystemAppPlaybackQueueGetTracklistCollectionIdentifierSetData();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_opt_class();
      MSVUnarchivedObjectOfClass();
      v15 = objc_claimAutoreleasedReturnValue();
      collectionIdentifierSet = v4->_collectionIdentifierSet;
      v4->_collectionIdentifierSet = (MPIdentifierSet *)v15;

    }
  }
  return v4;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  MPNSStringFromShuffleType(self->_shuffleType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p, shuffleType = %@, trackIDs = %@>"), v4, self, v5, self->_trackIdentifiers);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)verifyWithError:(id *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[MPGenericTracklistPlaybackQueue trackIdentifiers](self, "trackIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
  {
    v10 = *MEMORY[0x1E0CB2D50];
    v11[0] = CFSTR("Empty track IDs array provided");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("MPErrorDomain"), 100, v6);
    v8 = v7;
    if (a3)
      *a3 = objc_retainAutorelease(v7);

  }
  return v5 != 0;
}

- (NSString)firstTrackIdentifier
{
  return self->_firstTrackIdentifier;
}

- (NSArray)trackIdentifiers
{
  return self->_trackIdentifiers;
}

- (MPIdentifierSet)collectionIdentifierSet
{
  return self->_collectionIdentifierSet;
}

- (int64_t)shuffleType
{
  return self->_shuffleType;
}

- (int64_t)repeatType
{
  return self->_repeatType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionIdentifierSet, 0);
  objc_storeStrong((id *)&self->_trackIdentifiers, 0);
  objc_storeStrong((id *)&self->_firstTrackIdentifier, 0);
}

id __76__MPGenericTracklistPlaybackQueue_initWithMediaRemotePlaybackQueue_options___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;

  v2 = a2;
  if (_NSIsNSString())
  {
    v3 = v2;
  }
  else
  {
    objc_msgSend(v2, "stringValue");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
