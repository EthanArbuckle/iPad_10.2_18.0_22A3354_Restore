@implementation AFMediaPlaybackStateSnapshot

- (id)ad_shortDescription
{
  void *v3;
  unint64_t v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[AFMediaPlaybackStateSnapshot playbackState](self, "playbackState");
  if (v4 > 5)
    v5 = CFSTR("(unknown)");
  else
    v5 = *(&off_1E3A325B8 + v4);
  v6 = v5;
  -[AFMediaPlaybackStateSnapshot nowPlayingTimestamp](self, "nowPlayingTimestamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFMediaPlaybackStateSnapshot mediaType](self, "mediaType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFMediaPlaybackStateSnapshot groupIdentifier](self, "groupIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("(playstate: %@, time: %@, mediaType: %@, group: %@)"), v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (AFMediaPlaybackStateSnapshot)initWithSerializedBackingStore:(id)a3
{
  id v4;
  AFMediaPlaybackStateSnapshot *v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    self = -[AFMediaPlaybackStateSnapshot initWithDictionaryRepresentation:](self, "initWithDictionaryRepresentation:", v4);
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (AFMediaPlaybackStateSnapshot)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFMediaPlaybackStateSnapshotMutation *);
  AFMediaPlaybackStateSnapshot *v5;
  AFMediaPlaybackStateSnapshot *v6;
  _AFMediaPlaybackStateSnapshotMutation *v7;
  void *v8;
  uint64_t v9;
  NSDate *nowPlayingTimestamp;
  void *v11;
  uint64_t v12;
  NSString *mediaType;
  void *v14;
  uint64_t v15;
  NSString *groupIdentifier;
  objc_super v18;

  v4 = (void (**)(id, _AFMediaPlaybackStateSnapshotMutation *))a3;
  v18.receiver = self;
  v18.super_class = (Class)AFMediaPlaybackStateSnapshot;
  v5 = -[AFMediaPlaybackStateSnapshot init](&v18, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFMediaPlaybackStateSnapshotMutation initWithBase:]([_AFMediaPlaybackStateSnapshotMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFMediaPlaybackStateSnapshotMutation isDirty](v7, "isDirty"))
    {
      v6->_playbackState = -[_AFMediaPlaybackStateSnapshotMutation getPlaybackState](v7, "getPlaybackState");
      -[_AFMediaPlaybackStateSnapshotMutation getNowPlayingTimestamp](v7, "getNowPlayingTimestamp");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      nowPlayingTimestamp = v6->_nowPlayingTimestamp;
      v6->_nowPlayingTimestamp = (NSDate *)v9;

      -[_AFMediaPlaybackStateSnapshotMutation getMediaType](v7, "getMediaType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      mediaType = v6->_mediaType;
      v6->_mediaType = (NSString *)v12;

      -[_AFMediaPlaybackStateSnapshotMutation getGroupIdentifier](v7, "getGroupIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "copy");
      groupIdentifier = v6->_groupIdentifier;
      v6->_groupIdentifier = (NSString *)v15;

      v6->_isProxyGroupPlayer = -[_AFMediaPlaybackStateSnapshotMutation getIsProxyGroupPlayer](v7, "getIsProxyGroupPlayer");
    }

  }
  return v6;
}

- (AFMediaPlaybackStateSnapshot)init
{
  return -[AFMediaPlaybackStateSnapshot initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFMediaPlaybackStateSnapshot)initWithPlaybackState:(int64_t)a3 nowPlayingTimestamp:(id)a4 mediaType:(id)a5 groupIdentifier:(id)a6 isProxyGroupPlayer:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  AFMediaPlaybackStateSnapshot *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  int64_t v24;
  BOOL v25;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __119__AFMediaPlaybackStateSnapshot_initWithPlaybackState_nowPlayingTimestamp_mediaType_groupIdentifier_isProxyGroupPlayer___block_invoke;
  v20[3] = &unk_1E3A36870;
  v21 = v12;
  v22 = v13;
  v23 = v14;
  v24 = a3;
  v25 = a7;
  v15 = v14;
  v16 = v13;
  v17 = v12;
  v18 = -[AFMediaPlaybackStateSnapshot initWithBuilder:](self, "initWithBuilder:", v20);

  return v18;
}

- (NSString)description
{
  return (NSString *)-[AFMediaPlaybackStateSnapshot _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  unint64_t playbackState;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  const __CFString *v10;
  void *v11;
  objc_super v13;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v13.receiver = self;
  v13.super_class = (Class)AFMediaPlaybackStateSnapshot;
  -[AFMediaPlaybackStateSnapshot description](&v13, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  playbackState = self->_playbackState;
  if (playbackState > 5)
    v7 = CFSTR("(unknown)");
  else
    v7 = *(&off_1E3A325B8 + playbackState);
  v8 = v7;
  v9 = v8;
  if (self->_isProxyGroupPlayer)
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  v11 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {playbackState = %@, nowPlayingTimestamp = %@, mediaType = %@, groupIdentifier = %@, isProxyGroupPlayer = %@}"), v5, v8, *(_OWORD *)&self->_nowPlayingTimestamp, self->_groupIdentifier, v10);

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  void *v8;
  unint64_t v9;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_playbackState);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSDate hash](self->_nowPlayingTimestamp, "hash");
  v6 = v5 ^ -[NSString hash](self->_mediaType, "hash");
  v7 = v6 ^ -[NSString hash](self->_groupIdentifier, "hash") ^ v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isProxyGroupPlayer);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash");

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  AFMediaPlaybackStateSnapshot *v4;
  AFMediaPlaybackStateSnapshot *v5;
  int64_t playbackState;
  _BOOL4 isProxyGroupPlayer;
  NSDate *v8;
  NSDate *nowPlayingTimestamp;
  NSString *v10;
  NSString *mediaType;
  NSString *v12;
  NSString *groupIdentifier;
  BOOL v14;

  v4 = (AFMediaPlaybackStateSnapshot *)a3;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      playbackState = self->_playbackState;
      if (playbackState == -[AFMediaPlaybackStateSnapshot playbackState](v5, "playbackState")
        && (isProxyGroupPlayer = self->_isProxyGroupPlayer,
            isProxyGroupPlayer == -[AFMediaPlaybackStateSnapshot isProxyGroupPlayer](v5, "isProxyGroupPlayer")))
      {
        -[AFMediaPlaybackStateSnapshot nowPlayingTimestamp](v5, "nowPlayingTimestamp");
        v8 = (NSDate *)objc_claimAutoreleasedReturnValue();
        nowPlayingTimestamp = self->_nowPlayingTimestamp;
        if (nowPlayingTimestamp == v8 || -[NSDate isEqual:](nowPlayingTimestamp, "isEqual:", v8))
        {
          -[AFMediaPlaybackStateSnapshot mediaType](v5, "mediaType");
          v10 = (NSString *)objc_claimAutoreleasedReturnValue();
          mediaType = self->_mediaType;
          if (mediaType == v10 || -[NSString isEqual:](mediaType, "isEqual:", v10))
          {
            -[AFMediaPlaybackStateSnapshot groupIdentifier](v5, "groupIdentifier");
            v12 = (NSString *)objc_claimAutoreleasedReturnValue();
            groupIdentifier = self->_groupIdentifier;
            v14 = groupIdentifier == v12 || -[NSString isEqual:](groupIdentifier, "isEqual:", v12);

          }
          else
          {
            v14 = 0;
          }

        }
        else
        {
          v14 = 0;
        }

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
}

- (AFMediaPlaybackStateSnapshot)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  AFMediaPlaybackStateSnapshot *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFMediaPlaybackStateSnapshot::playbackState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFMediaPlaybackStateSnapshot::nowPlayingTimestamp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFMediaPlaybackStateSnapshot::mediaType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFMediaPlaybackStateSnapshot::groupIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFMediaPlaybackStateSnapshot::isProxyGroupPlayer"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "BOOLValue");
  v12 = -[AFMediaPlaybackStateSnapshot initWithPlaybackState:nowPlayingTimestamp:mediaType:groupIdentifier:isProxyGroupPlayer:](self, "initWithPlaybackState:nowPlayingTimestamp:mediaType:groupIdentifier:isProxyGroupPlayer:", v6, v7, v8, v9, v11);

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  int64_t playbackState;
  id v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  playbackState = self->_playbackState;
  v6 = a3;
  objc_msgSend(v4, "numberWithInteger:", playbackState);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("AFMediaPlaybackStateSnapshot::playbackState"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_nowPlayingTimestamp, CFSTR("AFMediaPlaybackStateSnapshot::nowPlayingTimestamp"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_mediaType, CFSTR("AFMediaPlaybackStateSnapshot::mediaType"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_groupIdentifier, CFSTR("AFMediaPlaybackStateSnapshot::groupIdentifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isProxyGroupPlayer);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("AFMediaPlaybackStateSnapshot::isProxyGroupPlayer"));

}

- (AFMediaPlaybackStateSnapshot)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  AFMediaPlaybackStateSnapshot *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("playbackState"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = AFMediaPlaybackStateGetFromName(v6);
    else
      v7 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("nowPlayingTimestamp"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("mediaType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("groupIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("isProxyGroupPlayer"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;

    v17 = objc_msgSend(v16, "BOOLValue");
    self = -[AFMediaPlaybackStateSnapshot initWithPlaybackState:nowPlayingTimestamp:mediaType:groupIdentifier:isProxyGroupPlayer:](self, "initWithPlaybackState:nowPlayingTimestamp:mediaType:groupIdentifier:isProxyGroupPlayer:", v7, v10, v12, v14, v17);

    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)buildDictionaryRepresentation
{
  id v3;
  unint64_t playbackState;
  __CFString *v5;
  __CFString *v6;
  NSDate *nowPlayingTimestamp;
  NSString *mediaType;
  NSString *groupIdentifier;
  void *v10;
  void *v11;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  playbackState = self->_playbackState;
  if (playbackState > 5)
    v5 = CFSTR("(unknown)");
  else
    v5 = *(&off_1E3A325B8 + playbackState);
  v6 = v5;
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("playbackState"));

  nowPlayingTimestamp = self->_nowPlayingTimestamp;
  if (nowPlayingTimestamp)
    objc_msgSend(v3, "setObject:forKey:", nowPlayingTimestamp, CFSTR("nowPlayingTimestamp"));
  mediaType = self->_mediaType;
  if (mediaType)
    objc_msgSend(v3, "setObject:forKey:", mediaType, CFSTR("mediaType"));
  groupIdentifier = self->_groupIdentifier;
  if (groupIdentifier)
    objc_msgSend(v3, "setObject:forKey:", groupIdentifier, CFSTR("groupIdentifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isProxyGroupPlayer);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("isProxyGroupPlayer"));

  v11 = (void *)objc_msgSend(v3, "copy");
  return v11;
}

- (int64_t)playbackState
{
  return self->_playbackState;
}

- (NSDate)nowPlayingTimestamp
{
  return self->_nowPlayingTimestamp;
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (BOOL)isProxyGroupPlayer
{
  return self->_isProxyGroupPlayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaType, 0);
  objc_storeStrong((id *)&self->_nowPlayingTimestamp, 0);
}

void __119__AFMediaPlaybackStateSnapshot_initWithPlaybackState_nowPlayingTimestamp_mediaType_groupIdentifier_isProxyGroupPlayer___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 56);
  v4 = a2;
  objc_msgSend(v4, "setPlaybackState:", v3);
  objc_msgSend(v4, "setNowPlayingTimestamp:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setMediaType:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setGroupIdentifier:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v4, "setIsProxyGroupPlayer:", *(unsigned __int8 *)(a1 + 64));

}

+ (id)newWithBuilder:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBuilder:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _AFMediaPlaybackStateSnapshotMutation *);
  _AFMediaPlaybackStateSnapshotMutation *v5;
  AFMediaPlaybackStateSnapshot *v6;
  void *v7;
  uint64_t v8;
  NSDate *nowPlayingTimestamp;
  void *v10;
  uint64_t v11;
  NSString *mediaType;
  void *v13;
  uint64_t v14;
  NSString *groupIdentifier;

  v4 = (void (**)(id, _AFMediaPlaybackStateSnapshotMutation *))a3;
  if (v4)
  {
    v5 = -[_AFMediaPlaybackStateSnapshotMutation initWithBase:]([_AFMediaPlaybackStateSnapshotMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFMediaPlaybackStateSnapshotMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFMediaPlaybackStateSnapshot);
      v6->_playbackState = -[_AFMediaPlaybackStateSnapshotMutation getPlaybackState](v5, "getPlaybackState");
      -[_AFMediaPlaybackStateSnapshotMutation getNowPlayingTimestamp](v5, "getNowPlayingTimestamp");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      nowPlayingTimestamp = v6->_nowPlayingTimestamp;
      v6->_nowPlayingTimestamp = (NSDate *)v8;

      -[_AFMediaPlaybackStateSnapshotMutation getMediaType](v5, "getMediaType");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      mediaType = v6->_mediaType;
      v6->_mediaType = (NSString *)v11;

      -[_AFMediaPlaybackStateSnapshotMutation getGroupIdentifier](v5, "getGroupIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "copy");
      groupIdentifier = v6->_groupIdentifier;
      v6->_groupIdentifier = (NSString *)v14;

      v6->_isProxyGroupPlayer = -[_AFMediaPlaybackStateSnapshotMutation getIsProxyGroupPlayer](v5, "getIsProxyGroupPlayer");
    }
    else
    {
      v6 = (AFMediaPlaybackStateSnapshot *)-[AFMediaPlaybackStateSnapshot copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFMediaPlaybackStateSnapshot *)-[AFMediaPlaybackStateSnapshot copy](self, "copy");
  }

  return v6;
}

@end
