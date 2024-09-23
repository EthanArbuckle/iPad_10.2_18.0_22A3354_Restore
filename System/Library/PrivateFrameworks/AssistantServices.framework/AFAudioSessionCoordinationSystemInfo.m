@implementation AFAudioSessionCoordinationSystemInfo

- (AFAudioSessionCoordinationSystemInfo)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFAudioSessionCoordinationSystemInfoMutation *);
  AFAudioSessionCoordinationSystemInfo *v5;
  AFAudioSessionCoordinationSystemInfo *v6;
  _AFAudioSessionCoordinationSystemInfoMutation *v7;
  void *v8;
  uint64_t v9;
  NSString *homeKitRoomName;
  void *v11;
  uint64_t v12;
  NSUUID *homeKitMediaSystemIdentifier;
  void *v14;
  uint64_t v15;
  NSString *mediaRemoteGroupIdentifier;
  void *v17;
  uint64_t v18;
  NSString *mediaRemoteRouteIdentifier;
  objc_super v21;

  v4 = (void (**)(id, _AFAudioSessionCoordinationSystemInfoMutation *))a3;
  v21.receiver = self;
  v21.super_class = (Class)AFAudioSessionCoordinationSystemInfo;
  v5 = -[AFAudioSessionCoordinationSystemInfo init](&v21, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFAudioSessionCoordinationSystemInfoMutation initWithBase:]([_AFAudioSessionCoordinationSystemInfoMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFAudioSessionCoordinationSystemInfoMutation isDirty](v7, "isDirty"))
    {
      v6->_isSupportedAndEnabled = -[_AFAudioSessionCoordinationSystemInfoMutation getIsSupportedAndEnabled](v7, "getIsSupportedAndEnabled");
      -[_AFAudioSessionCoordinationSystemInfoMutation getHomeKitRoomName](v7, "getHomeKitRoomName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      homeKitRoomName = v6->_homeKitRoomName;
      v6->_homeKitRoomName = (NSString *)v9;

      -[_AFAudioSessionCoordinationSystemInfoMutation getHomeKitMediaSystemIdentifier](v7, "getHomeKitMediaSystemIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      homeKitMediaSystemIdentifier = v6->_homeKitMediaSystemIdentifier;
      v6->_homeKitMediaSystemIdentifier = (NSUUID *)v12;

      -[_AFAudioSessionCoordinationSystemInfoMutation getMediaRemoteGroupIdentifier](v7, "getMediaRemoteGroupIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "copy");
      mediaRemoteGroupIdentifier = v6->_mediaRemoteGroupIdentifier;
      v6->_mediaRemoteGroupIdentifier = (NSString *)v15;

      -[_AFAudioSessionCoordinationSystemInfoMutation getMediaRemoteRouteIdentifier](v7, "getMediaRemoteRouteIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "copy");
      mediaRemoteRouteIdentifier = v6->_mediaRemoteRouteIdentifier;
      v6->_mediaRemoteRouteIdentifier = (NSString *)v18;

    }
  }

  return v6;
}

- (AFAudioSessionCoordinationSystemInfo)init
{
  return -[AFAudioSessionCoordinationSystemInfo initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFAudioSessionCoordinationSystemInfo)initWithIsSupportedAndEnabled:(BOOL)a3 homeKitRoomName:(id)a4 homeKitMediaSystemIdentifier:(id)a5 mediaRemoteGroupIdentifier:(id)a6 mediaRemoteRouteIdentifier:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  AFAudioSessionCoordinationSystemInfo *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  BOOL v27;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __169__AFAudioSessionCoordinationSystemInfo_initWithIsSupportedAndEnabled_homeKitRoomName_homeKitMediaSystemIdentifier_mediaRemoteGroupIdentifier_mediaRemoteRouteIdentifier___block_invoke;
  v22[3] = &unk_1E3A2F288;
  v27 = a3;
  v23 = v12;
  v24 = v13;
  v25 = v14;
  v26 = v15;
  v16 = v15;
  v17 = v14;
  v18 = v13;
  v19 = v12;
  v20 = -[AFAudioSessionCoordinationSystemInfo initWithBuilder:](self, "initWithBuilder:", v22);

  return v20;
}

- (NSString)description
{
  return (NSString *)-[AFAudioSessionCoordinationSystemInfo _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  objc_super v10;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v10.receiver = self;
  v10.super_class = (Class)AFAudioSessionCoordinationSystemInfo;
  -[AFAudioSessionCoordinationSystemInfo description](&v10, sel_description);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = CFSTR("YES");
  if (!self->_isSupportedAndEnabled)
    v7 = CFSTR("NO");
  v8 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {isSupportedAndEnabled = %@, homeKitRoomName = %@, homeKitMediaSystemIdentifier = %@, mediaRemoteGroupIdentifier = %@, mediaRemoteRouteIdentifier = %@}"), v5, v7, self->_homeKitRoomName, self->_homeKitMediaSystemIdentifier, self->_mediaRemoteGroupIdentifier, self->_mediaRemoteRouteIdentifier);

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isSupportedAndEnabled);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSString hash](self->_homeKitRoomName, "hash");
  v6 = v5 ^ -[NSUUID hash](self->_homeKitMediaSystemIdentifier, "hash");
  v7 = v6 ^ -[NSString hash](self->_mediaRemoteGroupIdentifier, "hash") ^ v4;
  v8 = v7 ^ -[NSString hash](self->_mediaRemoteRouteIdentifier, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  AFAudioSessionCoordinationSystemInfo *v4;
  AFAudioSessionCoordinationSystemInfo *v5;
  _BOOL4 isSupportedAndEnabled;
  NSString *v7;
  NSString *homeKitRoomName;
  NSUUID *v9;
  NSUUID *homeKitMediaSystemIdentifier;
  NSString *v11;
  NSString *mediaRemoteGroupIdentifier;
  NSString *v13;
  NSString *mediaRemoteRouteIdentifier;
  BOOL v15;

  v4 = (AFAudioSessionCoordinationSystemInfo *)a3;
  if (self == v4)
  {
    v15 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      isSupportedAndEnabled = self->_isSupportedAndEnabled;
      if (isSupportedAndEnabled == -[AFAudioSessionCoordinationSystemInfo isSupportedAndEnabled](v5, "isSupportedAndEnabled"))
      {
        -[AFAudioSessionCoordinationSystemInfo homeKitRoomName](v5, "homeKitRoomName");
        v7 = (NSString *)objc_claimAutoreleasedReturnValue();
        homeKitRoomName = self->_homeKitRoomName;
        if (homeKitRoomName == v7 || -[NSString isEqual:](homeKitRoomName, "isEqual:", v7))
        {
          -[AFAudioSessionCoordinationSystemInfo homeKitMediaSystemIdentifier](v5, "homeKitMediaSystemIdentifier");
          v9 = (NSUUID *)objc_claimAutoreleasedReturnValue();
          homeKitMediaSystemIdentifier = self->_homeKitMediaSystemIdentifier;
          if (homeKitMediaSystemIdentifier == v9
            || -[NSUUID isEqual:](homeKitMediaSystemIdentifier, "isEqual:", v9))
          {
            -[AFAudioSessionCoordinationSystemInfo mediaRemoteGroupIdentifier](v5, "mediaRemoteGroupIdentifier");
            v11 = (NSString *)objc_claimAutoreleasedReturnValue();
            mediaRemoteGroupIdentifier = self->_mediaRemoteGroupIdentifier;
            if (mediaRemoteGroupIdentifier == v11
              || -[NSString isEqual:](mediaRemoteGroupIdentifier, "isEqual:", v11))
            {
              -[AFAudioSessionCoordinationSystemInfo mediaRemoteRouteIdentifier](v5, "mediaRemoteRouteIdentifier");
              v13 = (NSString *)objc_claimAutoreleasedReturnValue();
              mediaRemoteRouteIdentifier = self->_mediaRemoteRouteIdentifier;
              v15 = mediaRemoteRouteIdentifier == v13
                 || -[NSString isEqual:](mediaRemoteRouteIdentifier, "isEqual:", v13);

            }
            else
            {
              v15 = 0;
            }

          }
          else
          {
            v15 = 0;
          }

        }
        else
        {
          v15 = 0;
        }

      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }
  }

  return v15;
}

- (AFAudioSessionCoordinationSystemInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  AFAudioSessionCoordinationSystemInfo *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFAudioSessionCoordinationSystemInfo::isSupportedAndEnabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFAudioSessionCoordinationSystemInfo::homeKitRoomName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFAudioSessionCoordinationSystemInfo::homeKitMediaSystemIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFAudioSessionCoordinationSystemInfo::mediaRemoteGroupIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFAudioSessionCoordinationSystemInfo::mediaRemoteRouteIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[AFAudioSessionCoordinationSystemInfo initWithIsSupportedAndEnabled:homeKitRoomName:homeKitMediaSystemIdentifier:mediaRemoteGroupIdentifier:mediaRemoteRouteIdentifier:](self, "initWithIsSupportedAndEnabled:homeKitRoomName:homeKitMediaSystemIdentifier:mediaRemoteGroupIdentifier:mediaRemoteRouteIdentifier:", v6, v7, v8, v9, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  _BOOL8 isSupportedAndEnabled;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  isSupportedAndEnabled = self->_isSupportedAndEnabled;
  v7 = a3;
  objc_msgSend(v4, "numberWithBool:", isSupportedAndEnabled);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("AFAudioSessionCoordinationSystemInfo::isSupportedAndEnabled"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_homeKitRoomName, CFSTR("AFAudioSessionCoordinationSystemInfo::homeKitRoomName"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_homeKitMediaSystemIdentifier, CFSTR("AFAudioSessionCoordinationSystemInfo::homeKitMediaSystemIdentifier"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_mediaRemoteGroupIdentifier, CFSTR("AFAudioSessionCoordinationSystemInfo::mediaRemoteGroupIdentifier"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_mediaRemoteRouteIdentifier, CFSTR("AFAudioSessionCoordinationSystemInfo::mediaRemoteRouteIdentifier"));

}

- (AFAudioSessionCoordinationSystemInfo)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  AFAudioSessionCoordinationSystemInfo *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("isSupportedAndEnabled"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;

    v9 = objc_msgSend(v7, "BOOLValue");
    objc_msgSend(v5, "objectForKey:", CFSTR("homeKitRoomName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("homeKitMediaSystemIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("mediaRemoteGroupIdentifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("mediaRemoteRouteIdentifier"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v16;
    else
      v17 = 0;

    self = -[AFAudioSessionCoordinationSystemInfo initWithIsSupportedAndEnabled:homeKitRoomName:homeKitMediaSystemIdentifier:mediaRemoteGroupIdentifier:mediaRemoteRouteIdentifier:](self, "initWithIsSupportedAndEnabled:homeKitRoomName:homeKitMediaSystemIdentifier:mediaRemoteGroupIdentifier:mediaRemoteRouteIdentifier:", v9, v11, v13, v15, v17);
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
  void *v4;
  NSString *homeKitRoomName;
  NSUUID *homeKitMediaSystemIdentifier;
  NSString *mediaRemoteGroupIdentifier;
  NSString *mediaRemoteRouteIdentifier;
  void *v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isSupportedAndEnabled);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("isSupportedAndEnabled"));

  homeKitRoomName = self->_homeKitRoomName;
  if (homeKitRoomName)
    objc_msgSend(v3, "setObject:forKey:", homeKitRoomName, CFSTR("homeKitRoomName"));
  homeKitMediaSystemIdentifier = self->_homeKitMediaSystemIdentifier;
  if (homeKitMediaSystemIdentifier)
    objc_msgSend(v3, "setObject:forKey:", homeKitMediaSystemIdentifier, CFSTR("homeKitMediaSystemIdentifier"));
  mediaRemoteGroupIdentifier = self->_mediaRemoteGroupIdentifier;
  if (mediaRemoteGroupIdentifier)
    objc_msgSend(v3, "setObject:forKey:", mediaRemoteGroupIdentifier, CFSTR("mediaRemoteGroupIdentifier"));
  mediaRemoteRouteIdentifier = self->_mediaRemoteRouteIdentifier;
  if (mediaRemoteRouteIdentifier)
    objc_msgSend(v3, "setObject:forKey:", mediaRemoteRouteIdentifier, CFSTR("mediaRemoteRouteIdentifier"));
  v9 = (void *)objc_msgSend(v3, "copy");

  return v9;
}

- (BOOL)isSupportedAndEnabled
{
  return self->_isSupportedAndEnabled;
}

- (NSString)homeKitRoomName
{
  return self->_homeKitRoomName;
}

- (NSUUID)homeKitMediaSystemIdentifier
{
  return self->_homeKitMediaSystemIdentifier;
}

- (NSString)mediaRemoteGroupIdentifier
{
  return self->_mediaRemoteGroupIdentifier;
}

- (NSString)mediaRemoteRouteIdentifier
{
  return self->_mediaRemoteRouteIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaRemoteRouteIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaRemoteGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_homeKitMediaSystemIdentifier, 0);
  objc_storeStrong((id *)&self->_homeKitRoomName, 0);
}

void __169__AFAudioSessionCoordinationSystemInfo_initWithIsSupportedAndEnabled_homeKitRoomName_homeKitMediaSystemIdentifier_mediaRemoteGroupIdentifier_mediaRemoteRouteIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(unsigned __int8 *)(a1 + 64);
  v4 = a2;
  objc_msgSend(v4, "setIsSupportedAndEnabled:", v3);
  objc_msgSend(v4, "setHomeKitRoomName:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setHomeKitMediaSystemIdentifier:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setMediaRemoteGroupIdentifier:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v4, "setMediaRemoteRouteIdentifier:", *(_QWORD *)(a1 + 56));

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
  void (**v4)(id, _AFAudioSessionCoordinationSystemInfoMutation *);
  _AFAudioSessionCoordinationSystemInfoMutation *v5;
  AFAudioSessionCoordinationSystemInfo *v6;
  void *v7;
  uint64_t v8;
  NSString *homeKitRoomName;
  void *v10;
  uint64_t v11;
  NSUUID *homeKitMediaSystemIdentifier;
  void *v13;
  uint64_t v14;
  NSString *mediaRemoteGroupIdentifier;
  void *v16;
  uint64_t v17;
  NSString *mediaRemoteRouteIdentifier;

  v4 = (void (**)(id, _AFAudioSessionCoordinationSystemInfoMutation *))a3;
  if (v4)
  {
    v5 = -[_AFAudioSessionCoordinationSystemInfoMutation initWithBase:]([_AFAudioSessionCoordinationSystemInfoMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFAudioSessionCoordinationSystemInfoMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFAudioSessionCoordinationSystemInfo);
      v6->_isSupportedAndEnabled = -[_AFAudioSessionCoordinationSystemInfoMutation getIsSupportedAndEnabled](v5, "getIsSupportedAndEnabled");
      -[_AFAudioSessionCoordinationSystemInfoMutation getHomeKitRoomName](v5, "getHomeKitRoomName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      homeKitRoomName = v6->_homeKitRoomName;
      v6->_homeKitRoomName = (NSString *)v8;

      -[_AFAudioSessionCoordinationSystemInfoMutation getHomeKitMediaSystemIdentifier](v5, "getHomeKitMediaSystemIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      homeKitMediaSystemIdentifier = v6->_homeKitMediaSystemIdentifier;
      v6->_homeKitMediaSystemIdentifier = (NSUUID *)v11;

      -[_AFAudioSessionCoordinationSystemInfoMutation getMediaRemoteGroupIdentifier](v5, "getMediaRemoteGroupIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "copy");
      mediaRemoteGroupIdentifier = v6->_mediaRemoteGroupIdentifier;
      v6->_mediaRemoteGroupIdentifier = (NSString *)v14;

      -[_AFAudioSessionCoordinationSystemInfoMutation getMediaRemoteRouteIdentifier](v5, "getMediaRemoteRouteIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "copy");
      mediaRemoteRouteIdentifier = v6->_mediaRemoteRouteIdentifier;
      v6->_mediaRemoteRouteIdentifier = (NSString *)v17;

    }
    else
    {
      v6 = (AFAudioSessionCoordinationSystemInfo *)-[AFAudioSessionCoordinationSystemInfo copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFAudioSessionCoordinationSystemInfo *)-[AFAudioSessionCoordinationSystemInfo copy](self, "copy");
  }

  return v6;
}

@end
