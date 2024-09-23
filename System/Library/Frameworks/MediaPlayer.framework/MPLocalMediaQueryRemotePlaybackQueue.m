@implementation MPLocalMediaQueryRemotePlaybackQueue

- (MPLocalMediaQueryRemotePlaybackQueue)initWithMediaRemotePlaybackQueue:(_MRSystemAppPlaybackQueue *)a3 options:(id)a4
{
  MPLocalMediaQueryRemotePlaybackQueue *v4;
  MPLocalMediaQueryRemotePlaybackQueue *v5;
  void *v6;
  MPPMediaQuery *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  MPMediaQuery *v11;
  NSObject *v12;
  MPMediaQuery *v13;
  MPPMediaQuery *v14;
  NSObject *v15;
  MPMediaQuery *v16;
  MPMediaQuery *mediaQuery;
  NSObject *v18;
  MPMediaQuery *v19;
  const char *v20;
  NSObject *v21;
  os_log_type_t v22;
  uint32_t v23;
  void *v24;
  MPMediaQuery *v25;
  NSObject *v26;
  MPMediaItem *v27;
  MPMediaItem *firstItem;
  MPMediaItem *v29;
  NSObject *v30;
  NSObject *v31;
  MPMediaItem *v32;
  const char *v33;
  uint64_t LocalQueryFirstItemPID;
  uint64_t v35;
  NSObject *v36;
  MPMediaQuery *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  MPMediaItem *v44;
  MPMediaItem *v45;
  NSObject *v46;
  MPMediaItem *v47;
  NSObject *v48;
  os_log_type_t v49;
  uint32_t v50;
  unsigned int LocalQueryShuffleMode;
  int64_t v52;
  unsigned int LocalQueryRepeatMode;
  int64_t v54;
  NSObject *v55;
  MPPMediaQuery *v56;
  void *v57;
  objc_super v59;
  uint8_t buf[4];
  MPPMediaQuery *v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v59.receiver = self;
  v59.super_class = (Class)MPLocalMediaQueryRemotePlaybackQueue;
  v4 = -[MPRemotePlaybackQueue initWithMediaRemotePlaybackQueue:options:](&v59, sel_initWithMediaRemotePlaybackQueue_options_);
  v5 = v4;
  if (!v4)
    return v5;
  -[MPRemotePlaybackQueue userIdentity](v4, "userIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPMediaLibrary deviceMediaLibraryWithUserIdentity:](MPMediaLibrary, "deviceMediaLibraryWithUserIdentity:", v6);
  v7 = (MPPMediaQuery *)objc_claimAutoreleasedReturnValue();

  v8 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v61 = v7;
    _os_log_impl(&dword_193B9B000, v8, OS_LOG_TYPE_DEFAULT, "RPQ: initWithMediaRemotePlaybackQueue: [library] library=%{public}@", buf, 0xCu);
  }

  MRSystemAppPlaybackQueueGetLocalQueryData();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (MRSystemAppPlaybackQueueGetLocalQueryEncodingType() != 1)
  {
    v14 = -[MPPMediaQuery initWithData:]([MPPMediaQuery alloc], "initWithData:", v9);
    v15 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl_Oversize");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v61 = v14;
      _os_log_impl(&dword_193B9B000, v15, OS_LOG_TYPE_DEFAULT, "RPQ: initWithMediaRemotePlaybackQueue: [query] source=protobuf protobuf=%{public}@", buf, 0xCu);
    }

    if (v14)
    {
      v16 = -[MPMediaQuery initWithProtobufferDecodableObject:library:]([MPMediaQuery alloc], "initWithProtobufferDecodableObject:library:", v14, v7);
      mediaQuery = v5->_mediaQuery;
      v5->_mediaQuery = v16;

      v18 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl_Oversize");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = v5->_mediaQuery;
        *(_DWORD *)buf = 138543362;
        v61 = (MPPMediaQuery *)v19;
        v20 = "RPQ: initWithMediaRemotePlaybackQueue: [query] source=protobuf query=%{public}@";
        v21 = v18;
        v22 = OS_LOG_TYPE_DEFAULT;
        v23 = 12;
LABEL_15:
        _os_log_impl(&dword_193B9B000, v21, v22, v20, buf, v23);
      }
    }
    else
    {
      v18 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v20 = "RPQ: initWithMediaRemotePlaybackQueue: [query] source=protobuf query=(null)";
        v21 = v18;
        v22 = OS_LOG_TYPE_ERROR;
        v23 = 2;
        goto LABEL_15;
      }
    }

    goto LABEL_17;
  }
  objc_opt_class();
  MSVUnarchivedObjectOfClass();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v5->_mediaQuery;
  v5->_mediaQuery = (MPMediaQuery *)v10;

  v12 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl_Oversize");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v5->_mediaQuery;
    *(_DWORD *)buf = 138543362;
    v61 = (MPPMediaQuery *)v13;
    _os_log_impl(&dword_193B9B000, v12, OS_LOG_TYPE_DEFAULT, "RPQ: initWithMediaRemotePlaybackQueue: [query] source=bplist query=%{public}@", buf, 0xCu);
  }

LABEL_17:
  -[MPMediaQuery setMediaLibrary:](v5->_mediaQuery, "setMediaLibrary:", v7);
  MRSystemAppPlaybackQueueGetLocalQueryFirstItemMultiverseIDData();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = (MPMediaQuery *)objc_msgSend(objc_alloc(MEMORY[0x1E0D511C0]), "initWithData:", v24);
    v26 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v61 = (MPPMediaQuery *)v25;
      _os_log_impl(&dword_193B9B000, v26, OS_LOG_TYPE_DEFAULT, "RPQ: initWithMediaRemotePlaybackQueue: [firstItem] source=mip multiverseIdentifier=%{public}@", buf, 0xCu);
    }

    v27 = -[MPMediaItem initWithMultiverseIdentifier:library:]([MPMediaItem alloc], "initWithMultiverseIdentifier:library:", v25, v7);
    firstItem = v5->_firstItem;
    v5->_firstItem = v27;

    v29 = v5->_firstItem;
    v30 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    v31 = v30;
    if (v29)
    {
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v32 = v5->_firstItem;
        *(_DWORD *)buf = 138543362;
        v61 = (MPPMediaQuery *)v32;
        v33 = "RPQ: initWithMediaRemotePlaybackQueue: [firstItem] source=mip firstItem=%{public}@";
LABEL_29:
        v48 = v31;
        v49 = OS_LOG_TYPE_DEFAULT;
        v50 = 12;
LABEL_35:
        _os_log_impl(&dword_193B9B000, v48, v49, v33, buf, v50);
        goto LABEL_36;
      }
      goto LABEL_36;
    }
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      goto LABEL_36;
    *(_WORD *)buf = 0;
    v33 = "RPQ: initWithMediaRemotePlaybackQueue: [firstItem] source=mip firstItem=(null)";
    goto LABEL_34;
  }
  LocalQueryFirstItemPID = MRSystemAppPlaybackQueueGetLocalQueryFirstItemPID();
  if (LocalQueryFirstItemPID)
  {
    v35 = LocalQueryFirstItemPID;
    v36 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v61 = (MPPMediaQuery *)v35;
      _os_log_impl(&dword_193B9B000, v36, OS_LOG_TYPE_DEFAULT, "RPQ: initWithMediaRemotePlaybackQueue: [firstItem] source=pid pid=%lld", buf, 0xCu);
    }

    v37 = [MPMediaQuery alloc];
    v38 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v35);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v39, CFSTR("persistentID"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setWithObject:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[MPMediaQuery initWithFilterPredicates:library:](v37, "initWithFilterPredicates:library:", v41, v7);

    -[MPMediaQuery setShouldIncludeNonLibraryEntities:](v25, "setShouldIncludeNonLibraryEntities:", 1);
    -[MPMediaQuery items](v25, "items");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "firstObject");
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = v5->_firstItem;
    v5->_firstItem = (MPMediaItem *)v43;

    v45 = v5->_firstItem;
    v46 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    v31 = v46;
    if (v45)
    {
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        v47 = v5->_firstItem;
        *(_DWORD *)buf = 138543362;
        v61 = (MPPMediaQuery *)v47;
        v33 = "RPQ: initWithMediaRemotePlaybackQueue: [firstItem] source=pid firstItem=%{public}@";
        goto LABEL_29;
      }
LABEL_36:

      goto LABEL_37;
    }
    if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      goto LABEL_36;
    *(_WORD *)buf = 0;
    v33 = "RPQ: initWithMediaRemotePlaybackQueue: [firstItem] source=pid firstItem=(null)";
LABEL_34:
    v48 = v31;
    v49 = OS_LOG_TYPE_ERROR;
    v50 = 2;
    goto LABEL_35;
  }
LABEL_37:
  LocalQueryShuffleMode = MRSystemAppPlaybackQueueGetLocalQueryShuffleMode();
  if (LocalQueryShuffleMode > 3)
    v52 = 0;
  else
    v52 = qword_193F0BDD0[LocalQueryShuffleMode];
  v5->_shuffleType = v52;
  LocalQueryRepeatMode = MRSystemAppPlaybackQueueGetLocalQueryRepeatMode();
  if (LocalQueryRepeatMode > 3)
    v54 = 0;
  else
    v54 = qword_193F0BDB0[LocalQueryRepeatMode];
  v5->_repeatType = v54;
  v55 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl_Oversize");
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    MPNSStringFromShuffleType(v5->_shuffleType);
    v56 = (MPPMediaQuery *)objc_claimAutoreleasedReturnValue();
    MPNSStringFromRepeatType(v5->_repeatType);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v61 = v56;
    v62 = 2114;
    v63 = v57;
    _os_log_impl(&dword_193B9B000, v55, OS_LOG_TYPE_DEFAULT, "RPQ: initWithMediaRemotePlaybackQueue: [shuffle/repeat] shuffle=%{public}@ repeat=%{public}@", buf, 0x16u);

  }
  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  MPMediaQuery *mediaQuery;
  MPMediaItem *firstItem;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  mediaQuery = self->_mediaQuery;
  firstItem = self->_firstItem;
  MPNSStringFromShuffleType(self->_shuffleType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MPNSStringFromRepeatType(self->_repeatType);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p, query = %@, firstItem = %@, shuffleType = %@, repeatType = %@>"), v4, self, mediaQuery, firstItem, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)verifyWithError:(id *)a3
{
  void *v4;
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[MPLocalMediaQueryRemotePlaybackQueue mediaQuery](self, "mediaQuery");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "_countOfItems") || objc_msgSend(v4, "_countOfCollections"))
  {

    return 1;
  }
  else
  {

    if (a3)
    {
      v8 = *MEMORY[0x1E0CB2D50];
      v9[0] = CFSTR("The provided queue has no items or collections.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("MPErrorDomain"), 100, v6));
      *a3 = v7;

    }
    return 0;
  }
}

- (MPMediaQuery)mediaQuery
{
  return self->_mediaQuery;
}

- (MPMediaItem)firstItem
{
  return self->_firstItem;
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
  objc_storeStrong((id *)&self->_firstItem, 0);
  objc_storeStrong((id *)&self->_mediaQuery, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
