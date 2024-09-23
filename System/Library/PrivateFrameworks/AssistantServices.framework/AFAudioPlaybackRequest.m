@implementation AFAudioPlaybackRequest

- (AFAudioPlaybackRequest)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFAudioPlaybackRequestMutation *);
  AFAudioPlaybackRequest *v5;
  AFAudioPlaybackRequest *v6;
  _AFAudioPlaybackRequestMutation *v7;
  void *v8;
  uint64_t v9;
  NSURL *itemURL;
  void *v11;
  uint64_t v12;
  NSData *itemData;
  float v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  NSDictionary *userInfo;
  void *v20;
  uint64_t v21;
  NSString *hapticLibraryKey;
  void *v23;
  uint64_t v24;
  NSString *UUID;
  objc_super v27;

  v4 = (void (**)(id, _AFAudioPlaybackRequestMutation *))a3;
  v27.receiver = self;
  v27.super_class = (Class)AFAudioPlaybackRequest;
  v5 = -[AFAudioPlaybackRequest init](&v27, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFAudioPlaybackRequestMutation initWithBase:]([_AFAudioPlaybackRequestMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFAudioPlaybackRequestMutation isDirty](v7, "isDirty"))
    {
      -[_AFAudioPlaybackRequestMutation getItemURL](v7, "getItemURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      itemURL = v6->_itemURL;
      v6->_itemURL = (NSURL *)v9;

      -[_AFAudioPlaybackRequestMutation getItemData](v7, "getItemData");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      itemData = v6->_itemData;
      v6->_itemData = (NSData *)v12;

      v6->_numberOfLoops = -[_AFAudioPlaybackRequestMutation getNumberOfLoops](v7, "getNumberOfLoops");
      -[_AFAudioPlaybackRequestMutation getVolume](v7, "getVolume");
      v6->_volume = v14;
      -[_AFAudioPlaybackRequestMutation getFadeInDuration](v7, "getFadeInDuration");
      v6->_fadeInDuration = v15;
      -[_AFAudioPlaybackRequestMutation getFadeOutDuration](v7, "getFadeOutDuration");
      v6->_fadeOutDuration = v16;
      -[_AFAudioPlaybackRequestMutation getUserInfo](v7, "getUserInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "copy");
      userInfo = v6->_userInfo;
      v6->_userInfo = (NSDictionary *)v18;

      -[_AFAudioPlaybackRequestMutation getHapticLibraryKey](v7, "getHapticLibraryKey");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "copy");
      hapticLibraryKey = v6->_hapticLibraryKey;
      v6->_hapticLibraryKey = (NSString *)v21;

      -[_AFAudioPlaybackRequestMutation getUUID](v7, "getUUID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "copy");
      UUID = v6->_UUID;
      v6->_UUID = (NSString *)v24;

    }
  }

  return v6;
}

- (AFAudioPlaybackRequest)init
{
  return -[AFAudioPlaybackRequest initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFAudioPlaybackRequest)initWithItemURL:(id)a3 itemData:(id)a4 numberOfLoops:(int64_t)a5 volume:(float)a6 fadeInDuration:(double)a7 fadeOutDuration:(double)a8 userInfo:(id)a9 hapticLibraryKey:(id)a10 UUID:(id)a11
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  AFAudioPlaybackRequest *v30;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  int64_t v38;
  double v39;
  double v40;
  float v41;

  v20 = a3;
  v21 = a4;
  v22 = a9;
  v23 = a10;
  v24 = a11;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __134__AFAudioPlaybackRequest_initWithItemURL_itemData_numberOfLoops_volume_fadeInDuration_fadeOutDuration_userInfo_hapticLibraryKey_UUID___block_invoke;
  v32[3] = &unk_1E3A34510;
  v33 = v20;
  v34 = v21;
  v41 = a6;
  v39 = a7;
  v40 = a8;
  v35 = v22;
  v36 = v23;
  v37 = v24;
  v38 = a5;
  v25 = v24;
  v26 = v23;
  v27 = v22;
  v28 = v21;
  v29 = v20;
  v30 = -[AFAudioPlaybackRequest initWithBuilder:](self, "initWithBuilder:", v32);

  return v30;
}

- (id)description
{
  return -[AFAudioPlaybackRequest _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8.receiver = self;
  v8.super_class = (Class)AFAudioPlaybackRequest;
  -[AFAudioPlaybackRequest description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {itemURL = %@, itemData = (%llu bytes), numberOfLoops = %lld, volume = %f, fadeInDuration = %f, fadeOutDuration = %f, userInfo = %@, hapticLibraryKey = %@, UUID = %@}"), v5, self->_itemURL, -[NSData length](self->_itemData, "length"), self->_numberOfLoops, self->_volume, *(_QWORD *)&self->_fadeInDuration, *(_QWORD *)&self->_fadeOutDuration, self->_userInfo, self->_hapticLibraryKey, self->_UUID);

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSUInteger v15;
  NSUInteger v16;

  v3 = -[NSURL hash](self->_itemURL, "hash");
  v4 = -[NSData hash](self->_itemData, "hash") ^ v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_numberOfLoops);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ objc_msgSend(v5, "hash");
  *(float *)&v7 = self->_volume;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_fadeInDuration);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v6 ^ v9 ^ objc_msgSend(v10, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_fadeOutDuration);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hash");
  v14 = v13 ^ -[NSDictionary hash](self->_userInfo, "hash");
  v15 = v11 ^ v14 ^ -[NSString hash](self->_hapticLibraryKey, "hash");
  v16 = v15 ^ -[NSString hash](self->_UUID, "hash");

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  AFAudioPlaybackRequest *v4;
  AFAudioPlaybackRequest *v5;
  int64_t numberOfLoops;
  float volume;
  float v8;
  double fadeInDuration;
  double v10;
  double fadeOutDuration;
  double v12;
  BOOL v13;
  NSURL *v15;
  NSURL *itemURL;
  NSData *v17;
  NSData *itemData;
  NSDictionary *v19;
  NSDictionary *userInfo;
  NSString *v21;
  NSString *hapticLibraryKey;
  NSString *v23;
  NSString *UUID;

  v4 = (AFAudioPlaybackRequest *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      numberOfLoops = self->_numberOfLoops;
      if (numberOfLoops == -[AFAudioPlaybackRequest numberOfLoops](v5, "numberOfLoops")
        && (volume = self->_volume, -[AFAudioPlaybackRequest volume](v5, "volume"), volume == v8)
        && (fadeInDuration = self->_fadeInDuration,
            -[AFAudioPlaybackRequest fadeInDuration](v5, "fadeInDuration"),
            fadeInDuration == v10)
        && (fadeOutDuration = self->_fadeOutDuration,
            -[AFAudioPlaybackRequest fadeOutDuration](v5, "fadeOutDuration"),
            fadeOutDuration == v12))
      {
        -[AFAudioPlaybackRequest itemURL](v5, "itemURL");
        v15 = (NSURL *)objc_claimAutoreleasedReturnValue();
        itemURL = self->_itemURL;
        if (itemURL == v15 || -[NSURL isEqual:](itemURL, "isEqual:", v15))
        {
          -[AFAudioPlaybackRequest itemData](v5, "itemData");
          v17 = (NSData *)objc_claimAutoreleasedReturnValue();
          itemData = self->_itemData;
          if (itemData == v17 || -[NSData isEqual:](itemData, "isEqual:", v17))
          {
            -[AFAudioPlaybackRequest userInfo](v5, "userInfo");
            v19 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
            userInfo = self->_userInfo;
            if (userInfo == v19 || -[NSDictionary isEqual:](userInfo, "isEqual:", v19))
            {
              -[AFAudioPlaybackRequest hapticLibraryKey](v5, "hapticLibraryKey");
              v21 = (NSString *)objc_claimAutoreleasedReturnValue();
              hapticLibraryKey = self->_hapticLibraryKey;
              if (hapticLibraryKey == v21 || -[NSString isEqual:](hapticLibraryKey, "isEqual:", v21))
              {
                -[AFAudioPlaybackRequest UUID](v5, "UUID");
                v23 = (NSString *)objc_claimAutoreleasedReturnValue();
                UUID = self->_UUID;
                v13 = UUID == v23 || -[NSString isEqual:](UUID, "isEqual:", v23);

              }
              else
              {
                v13 = 0;
              }

            }
            else
            {
              v13 = 0;
            }

          }
          else
          {
            v13 = 0;
          }

        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (AFAudioPlaybackRequest)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  AFAudioPlaybackRequest *v27;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFAudioPlaybackRequest::itemURL"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFAudioPlaybackRequest::itemData"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFAudioPlaybackRequest::numberOfLoops"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v4, "integerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFAudioPlaybackRequest::volume"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  v7 = v6;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFAudioPlaybackRequest::fadeInDuration"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFAudioPlaybackRequest::fadeOutDuration"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = v12;

  v30 = (void *)MEMORY[0x1E0C99E60];
  v29 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  v19 = objc_opt_class();
  v20 = objc_opt_class();
  v21 = objc_opt_class();
  objc_msgSend(v30, "setWithObjects:", v29, v14, v15, v16, v17, v18, v19, v20, v21, objc_opt_class(), 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v22, CFSTR("AFAudioPlaybackRequest::userInfo"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFAudioPlaybackRequest::hapticLibraryKey"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFAudioPlaybackRequest::UUID"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v26) = v7;
  v27 = -[AFAudioPlaybackRequest initWithItemURL:itemData:numberOfLoops:volume:fadeInDuration:fadeOutDuration:userInfo:hapticLibraryKey:UUID:](self, "initWithItemURL:itemData:numberOfLoops:volume:fadeInDuration:fadeOutDuration:userInfo:hapticLibraryKey:UUID:", v33, v32, v31, v23, v24, v25, v26, v10, v13);

  return v27;
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *itemURL;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  itemURL = self->_itemURL;
  v10 = a3;
  objc_msgSend(v10, "encodeObject:forKey:", itemURL, CFSTR("AFAudioPlaybackRequest::itemURL"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_itemData, CFSTR("AFAudioPlaybackRequest::itemData"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_numberOfLoops);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v5, CFSTR("AFAudioPlaybackRequest::numberOfLoops"));

  *(float *)&v6 = self->_volume;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v7, CFSTR("AFAudioPlaybackRequest::volume"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_fadeInDuration);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v8, CFSTR("AFAudioPlaybackRequest::fadeInDuration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_fadeOutDuration);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("AFAudioPlaybackRequest::fadeOutDuration"));

  objc_msgSend(v10, "encodeObject:forKey:", self->_userInfo, CFSTR("AFAudioPlaybackRequest::userInfo"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_hapticLibraryKey, CFSTR("AFAudioPlaybackRequest::hapticLibraryKey"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_UUID, CFSTR("AFAudioPlaybackRequest::UUID"));

}

- (NSURL)itemURL
{
  return self->_itemURL;
}

- (NSData)itemData
{
  return self->_itemData;
}

- (int64_t)numberOfLoops
{
  return self->_numberOfLoops;
}

- (float)volume
{
  return self->_volume;
}

- (double)fadeInDuration
{
  return self->_fadeInDuration;
}

- (double)fadeOutDuration
{
  return self->_fadeOutDuration;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (NSString)hapticLibraryKey
{
  return self->_hapticLibraryKey;
}

- (NSString)UUID
{
  return self->_UUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_hapticLibraryKey, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_itemData, 0);
  objc_storeStrong((id *)&self->_itemURL, 0);
}

void __134__AFAudioPlaybackRequest_initWithItemURL_itemData_numberOfLoops_volume_fadeInDuration_fadeOutDuration_userInfo_hapticLibraryKey_UUID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  double v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "setItemURL:", v3);
  objc_msgSend(v5, "setItemData:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v5, "setNumberOfLoops:", *(_QWORD *)(a1 + 72));
  LODWORD(v4) = *(_DWORD *)(a1 + 96);
  objc_msgSend(v5, "setVolume:", v4);
  objc_msgSend(v5, "setFadeInDuration:", *(double *)(a1 + 80));
  objc_msgSend(v5, "setFadeOutDuration:", *(double *)(a1 + 88));
  objc_msgSend(v5, "setUserInfo:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v5, "setHapticLibraryKey:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v5, "setUUID:", *(_QWORD *)(a1 + 64));

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
  void (**v4)(id, _AFAudioPlaybackRequestMutation *);
  _AFAudioPlaybackRequestMutation *v5;
  AFAudioPlaybackRequest *v6;
  void *v7;
  uint64_t v8;
  NSURL *itemURL;
  void *v10;
  uint64_t v11;
  NSData *itemData;
  float v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  NSDictionary *userInfo;
  void *v19;
  uint64_t v20;
  NSString *hapticLibraryKey;
  void *v22;
  uint64_t v23;
  NSString *UUID;

  v4 = (void (**)(id, _AFAudioPlaybackRequestMutation *))a3;
  if (v4)
  {
    v5 = -[_AFAudioPlaybackRequestMutation initWithBase:]([_AFAudioPlaybackRequestMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFAudioPlaybackRequestMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFAudioPlaybackRequest);
      -[_AFAudioPlaybackRequestMutation getItemURL](v5, "getItemURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      itemURL = v6->_itemURL;
      v6->_itemURL = (NSURL *)v8;

      -[_AFAudioPlaybackRequestMutation getItemData](v5, "getItemData");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      itemData = v6->_itemData;
      v6->_itemData = (NSData *)v11;

      v6->_numberOfLoops = -[_AFAudioPlaybackRequestMutation getNumberOfLoops](v5, "getNumberOfLoops");
      -[_AFAudioPlaybackRequestMutation getVolume](v5, "getVolume");
      v6->_volume = v13;
      -[_AFAudioPlaybackRequestMutation getFadeInDuration](v5, "getFadeInDuration");
      v6->_fadeInDuration = v14;
      -[_AFAudioPlaybackRequestMutation getFadeOutDuration](v5, "getFadeOutDuration");
      v6->_fadeOutDuration = v15;
      -[_AFAudioPlaybackRequestMutation getUserInfo](v5, "getUserInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "copy");
      userInfo = v6->_userInfo;
      v6->_userInfo = (NSDictionary *)v17;

      -[_AFAudioPlaybackRequestMutation getHapticLibraryKey](v5, "getHapticLibraryKey");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "copy");
      hapticLibraryKey = v6->_hapticLibraryKey;
      v6->_hapticLibraryKey = (NSString *)v20;

      -[_AFAudioPlaybackRequestMutation getUUID](v5, "getUUID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "copy");
      UUID = v6->_UUID;
      v6->_UUID = (NSString *)v23;

    }
    else
    {
      v6 = (AFAudioPlaybackRequest *)-[AFAudioPlaybackRequest copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFAudioPlaybackRequest *)-[AFAudioPlaybackRequest copy](self, "copy");
  }

  return v6;
}

@end
