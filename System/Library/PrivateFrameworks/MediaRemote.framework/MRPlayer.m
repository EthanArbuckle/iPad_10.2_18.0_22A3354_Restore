@implementation MRPlayer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mxSessionIDs, 0);
  objc_storeStrong((id *)&self->_appIcon, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[MRPlayer identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setIdentifier:", v7);

  -[MRPlayer displayName](self, "displayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setDisplayName:", v9);

  -[MRPlayer appIcon](self, "appIcon");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  objc_msgSend(v5, "setAppIcon:", v11);

  objc_msgSend(v5, "setAudioSessionType:", -[MRPlayer audioSessionType](self, "audioSessionType"));
  -[MRPlayer mxSessionIDs](self, "mxSessionIDs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copyWithZone:", a3);
  objc_msgSend(v5, "setMxSessionIDs:", v13);

  objc_msgSend(v5, "setAudioSessionID:", -[MRPlayer audioSessionID](self, "audioSessionID"));
  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)audioSessionType
{
  return self->_audioSessionType;
}

- (NSSet)mxSessionIDs
{
  return self->_mxSessionIDs;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSURL)appIcon
{
  return self->_appIcon;
}

- (unsigned)audioSessionID
{
  return self->_audioSessionID;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setAudioSessionType:(int64_t)a3
{
  self->_audioSessionType = a3;
}

- (void)setMxSessionIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setAudioSessionID:(unsigned int)a3
{
  self->_audioSessionID = a3;
}

- (void)setAppIcon:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isEqual:(id)a3
{
  MRPlayer *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (MRPlayer *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[MRPlayer identifier](v4, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRPlayer identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqualToString:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (BOOL)isDefaultPlayer
{
  void *v3;

  +[MRPlayer defaultPlayer](MRPlayer, "defaultPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[MRPlayer isEqual:](self, "isEqual:", v3);

  return (char)self;
}

+ (MRPlayer)defaultPlayer
{
  if (defaultPlayer_onceToken != -1)
    dispatch_once(&defaultPlayer_onceToken, &__block_literal_global_91);
  return (MRPlayer *)(id)defaultPlayer_defaultPlayer;
}

- (id)initWithProtobuf:(id)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  int v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;

  v3 = a2;
  v4 = v3;
  if (a1 && v3)
  {
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(a1, "initWithIdentifier:displayName:", v5, v6);

    if (v7)
    {
      if ((objc_msgSend(v4, "hasIconURL") & 1) != 0)
      {
        v8 = objc_alloc(MEMORY[0x1E0C99E98]);
        objc_msgSend(v4, "iconURL");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "initWithString:", v9);
        v11 = *(void **)(v7 + 32);
        *(_QWORD *)(v7 + 32) = v10;

      }
      else
      {
        v9 = *(void **)(v7 + 32);
        *(_QWORD *)(v7 + 32) = 0;
      }

      v13 = objc_msgSend(v4, "audioSessionType");
      v14 = 2 * (v13 == 2);
      if (v13 == 1)
        v14 = 1;
      *(_QWORD *)(v7 + 40) = v14;
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v4, "mxSessionIDsCount"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "mxSessionIDsCount"))
      {
        v16 = 0;
        do
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v4, "mxSessionIDAtIndex:", v16));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v17);

          ++v16;
        }
        while (v16 < objc_msgSend(v4, "mxSessionIDsCount"));
      }
      v18 = objc_msgSend(v15, "copy");
      v19 = *(void **)(v7 + 48);
      *(_QWORD *)(v7 + 48) = v18;

      *(_DWORD *)(v7 + 8) = objc_msgSend(v4, "audioSessionID");
    }
    a1 = (id)v7;
    v12 = a1;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (MRPlayer)initWithIdentifier:(id)a3 displayName:(id)a4
{
  id v6;
  id v7;
  MRPlayer *v8;
  uint64_t v9;
  NSString *identifier;
  uint64_t v11;
  NSString *displayName;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MRPlayer;
  v8 = -[MRPlayer init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    displayName = v8->_displayName;
    v8->_displayName = (NSString *)v11;

  }
  return v8;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_identifier, "hash");
}

- (_MRNowPlayingPlayerProtobuf)protobuf
{
  _MRNowPlayingPlayerProtobuf *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return (_MRNowPlayingPlayerProtobuf *)0;
  v2 = objc_alloc_init(_MRNowPlayingPlayerProtobuf);
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRNowPlayingPlayerProtobuf setIdentifier:](v2, "setIdentifier:", v3);

  objc_msgSend(a1, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRNowPlayingPlayerProtobuf setDisplayName:](v2, "setDisplayName:", v4);

  objc_msgSend(a1, "appIcon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRNowPlayingPlayerProtobuf setIconURL:](v2, "setIconURL:", v6);

  v7 = objc_msgSend(a1, "audioSessionType");
  if (v7 == 1)
    v8 = 1;
  else
    v8 = 2 * (v7 == 2);
  -[_MRNowPlayingPlayerProtobuf setAudioSessionType:](v2, "setAudioSessionType:", v8);
  -[_MRNowPlayingPlayerProtobuf setHasAudioSessionType:](v2, "setHasAudioSessionType:", objc_msgSend(a1, "audioSessionType") != 0);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a1, "mxSessionIDs", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        -[_MRNowPlayingPlayerProtobuf addMxSessionID:](v2, "addMxSessionID:", objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "integerValue"));
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

  -[_MRNowPlayingPlayerProtobuf setAudioSessionID:](v2, "setAudioSessionID:", a1[2]);
  return v2;
}

+ (MRPlayer)anyPlayer
{
  return (MRPlayer *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:displayName:", CFSTR("any"), CFSTR("any"));
}

void __25__MRPlayer_defaultPlayer__block_invoke()
{
  MRPlayer *v0;
  void *v1;

  v0 = -[MRPlayer initWithIdentifier:displayName:]([MRPlayer alloc], "initWithIdentifier:displayName:", CFSTR("MediaRemote-DefaultPlayer"), CFSTR("Default Player"));
  v1 = (void *)defaultPlayer_defaultPlayer;
  defaultPlayer_defaultPlayer = (uint64_t)v0;

}

- (MRPlayer)initWithData:(id)a3
{
  id v4;
  _MRNowPlayingPlayerProtobuf *v5;
  MRPlayer *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[_MRNowPlayingPlayerProtobuf initWithData:]([_MRNowPlayingPlayerProtobuf alloc], "initWithData:", v4);

    self = (MRPlayer *)-[MRPlayer initWithProtobuf:](self, v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSData)data
{
  void *v2;
  void *v3;

  -[MRPlayer protobuf]((unsigned int *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (MRPlayer)skeleton
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc((Class)objc_opt_class());
  -[MRPlayer identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRPlayer displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithIdentifier:displayName:", v4, v5);

  return (MRPlayer *)v6;
}

- (BOOL)hasAuxiliaryProperties
{
  BOOL v3;
  void *v5;

  if (-[MRPlayer audioSessionType](self, "audioSessionType")
    || -[NSSet count](self->_mxSessionIDs, "count")
    || self->_audioSessionID)
  {
    return 1;
  }
  -[MRPlayer appIcon](self, "appIcon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v5 != 0;

  return v3;
}

- (id)dictionaryRepresentation
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a1)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(a1, "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("identifier"));

    objc_msgSend(a1, "displayName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("displayName"));

    objc_msgSend(a1, "appIcon");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("appIcon"));

    NSStringFromMRPlayerAudioSessionType(objc_msgSend(a1, "audioSessionType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("audioSessionType"));

    objc_msgSend(a1, "mxSessionIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, CFSTR("mxSessionIDs"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a1, "audioSessionID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("audioSessionID"));

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)description
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[MRPlayer dictionaryRepresentation](self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p> %@"), v4, self, v5);

  return v6;
}

- (void)mergeFrom:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v12, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRPlayer setIdentifier:](self, "setIdentifier:", v5);

  }
  objc_msgSend(v12, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v12, "displayName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRPlayer setDisplayName:](self, "setDisplayName:", v7);

  }
  objc_msgSend(v12, "appIcon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v12, "appIcon");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRPlayer setAppIcon:](self, "setAppIcon:", v9);

  }
  if (objc_msgSend(v12, "audioSessionType"))
    -[MRPlayer setAudioSessionType:](self, "setAudioSessionType:", objc_msgSend(v12, "audioSessionType"));
  objc_msgSend(v12, "mxSessionIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v12, "mxSessionIDs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRPlayer setMxSessionIDs:](self, "setMxSessionIDs:", v11);

  }
  if (objc_msgSend(v12, "audioSessionID"))
    -[MRPlayer setAudioSessionID:](self, "setAudioSessionID:", objc_msgSend(v12, "audioSessionID"));

}

@end
