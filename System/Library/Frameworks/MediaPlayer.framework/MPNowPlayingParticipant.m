@implementation MPNowPlayingParticipant

- (MPNowPlayingParticipant)initWithIdentifier:(id)a3
{
  id v5;
  MPNowPlayingParticipant *v6;
  uint64_t v7;
  MRContentItem *mediaRemoteContentItem;
  void *v10;
  objc_super v11;

  v5 = a3;
  if (!objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPNowPlayingParticipant.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier.length > 0"));

  }
  v11.receiver = self;
  v11.super_class = (Class)MPNowPlayingParticipant;
  v6 = -[MPNowPlayingParticipant init](&v11, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0D4C528]), "initWithIdentifier:", v5);
    mediaRemoteContentItem = v6->_mediaRemoteContentItem;
    v6->_mediaRemoteContentItem = (MRContentItem *)v7;

  }
  return v6;
}

- (MPNowPlayingParticipant)initWithMediaRemoteContentItem:(id)a3
{
  id v6;
  MPNowPlayingParticipant *v7;
  MPNowPlayingParticipant *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPNowPlayingParticipant.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mediaRemoteContentItem"));

  }
  v11.receiver = self;
  v11.super_class = (Class)MPNowPlayingParticipant;
  v7 = -[MPNowPlayingParticipant init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_mediaRemoteContentItem, a3);

  return v8;
}

- (MPNowPlayingParticipant)initWithMediaRemoteUserIdentity:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  MPNowPlayingParticipant *v8;
  void *v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPNowPlayingParticipant.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mediaRemoteUserIdentity"));

  }
  MSVNanoIDCreateTaggedPointer();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MRContentItemRepresentationForIdentity();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[MPNowPlayingParticipant initWithMediaRemoteContentItem:](self, "initWithMediaRemoteContentItem:", v7);
  return v8;
}

- (MPNowPlayingParticipant)initWithIdentifier:(id)a3 mediaRemoteUserIdentity:(id)a4
{
  id v7;
  id v8;
  void *v9;
  MPNowPlayingParticipant *v10;
  void *v12;
  void *v13;

  v7 = a3;
  v8 = a4;
  if (!objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPNowPlayingParticipant.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier.length > 0"));

    if (v8)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPNowPlayingParticipant.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mediaRemoteUserIdentity"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  MRContentItemRepresentationForIdentity();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MPNowPlayingParticipant initWithMediaRemoteContentItem:](self, "initWithMediaRemoteContentItem:", v9);

  return v10;
}

- (NSString)identifier
{
  return (NSString *)-[MRContentItem identifier](self->_mediaRemoteContentItem, "identifier");
}

- (MRUserIdentity)mediaRemoteUserIdentity
{
  void *v2;
  void *v3;

  -[MPNowPlayingParticipant mediaRemoteContentItem](self, "mediaRemoteContentItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MRIdentityRepresentationForParticipantItem();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MRUserIdentity *)v3;
}

- (NSString)participantIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[MPNowPlayingParticipant mediaRemoteContentItem](self, "mediaRemoteContentItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "participantIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setParticipantIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[MPNowPlayingParticipant participantIdentifier](self, "participantIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v4)
  {

  }
  else
  {
    v6 = v5;
    v7 = objc_msgSend(v4, "isEqual:", v5);

    if ((v7 & 1) == 0)
    {
      -[MPNowPlayingParticipant mediaRemoteContentItem](self, "mediaRemoteContentItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "metadata");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setParticipantIdentifier:", v4);

      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __52__MPNowPlayingParticipant_setParticipantIdentifier___block_invoke;
      v10[3] = &unk_1E3153288;
      v11 = v4;
      -[MPNowPlayingParticipant _postParticipantItemChangedNotificationWithDeltaBlock:](self, "_postParticipantItemChangedNotificationWithDeltaBlock:", v10);

    }
  }

}

- (int64_t)participantIdentifierType
{
  void *v2;
  void *v3;
  unsigned int v4;

  -[MPNowPlayingParticipant mediaRemoteContentItem](self, "mediaRemoteContentItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isResolvableParticipant");

  return v4;
}

- (void)setParticipantIdentifierType:(int64_t)a3
{
  _BOOL8 v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  BOOL v9;

  if (-[MPNowPlayingParticipant participantIdentifierType](self, "participantIdentifierType") != a3)
  {
    v5 = a3 == 1;
    -[MPNowPlayingParticipant mediaRemoteContentItem](self, "mediaRemoteContentItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "metadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setIsResolvableParticipant:", v5);

    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __56__MPNowPlayingParticipant_setParticipantIdentifierType___block_invoke;
    v8[3] = &__block_descriptor_33_e23_v16__0__MRContentItem_8l;
    v9 = v5;
    -[MPNowPlayingParticipant _postParticipantItemChangedNotificationWithDeltaBlock:](self, "_postParticipantItemChangedNotificationWithDeltaBlock:", v8);
  }
}

- (NSString)displayName
{
  void *v2;
  void *v3;
  void *v4;

  -[MPNowPlayingParticipant mediaRemoteContentItem](self, "mediaRemoteContentItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "participantName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setDisplayName:(id)a3
{
  id v4;
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[MPNowPlayingParticipant displayName](self, "displayName");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v4)
  {

  }
  else
  {
    v6 = v5;
    v7 = objc_msgSend(v4, "isEqual:", v5);

    if ((v7 & 1) == 0)
    {
      -[MPNowPlayingParticipant mediaRemoteContentItem](self, "mediaRemoteContentItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "metadata");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setParticipantName:", v4);

      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __42__MPNowPlayingParticipant_setDisplayName___block_invoke;
      v10[3] = &unk_1E3153288;
      v11 = v4;
      -[MPNowPlayingParticipant _postParticipantItemChangedNotificationWithDeltaBlock:](self, "_postParticipantItemChangedNotificationWithDeltaBlock:", v10);

    }
  }

}

- (void)_postParticipantItemChangedNotificationWithDeltaBlock:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  v4 = (void (**)(id, void *))a3;
  if (!+[MPContentItem isSuppressingChangeNotifications](MPContentItem, "isSuppressingChangeNotifications"))
  {
    -[MPNowPlayingParticipant identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if (v4)
      {
        v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4C528]), "initWithIdentifier:", v5);
        v4[2](v4, v6);
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
        v7 = objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v6, CFSTR("_MPContentItemDidChangeUserInfoKeyDeltaItem"));

      }
      else
      {
        v7 = 0;
      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("_MPContentItemDidChangeNotification"), self, v7);

    }
    else
    {
      v7 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_ERROR, "Cannot post _MPContentItemDidChangeNotification, item is missing required identifier.", v9, 2u);
      }
    }

  }
}

- (MRContentItem)mediaRemoteContentItem
{
  return self->_mediaRemoteContentItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaRemoteContentItem, 0);
}

void __42__MPNowPlayingParticipant_setDisplayName___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "metadata");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setParticipantName:", v2);

}

void __56__MPNowPlayingParticipant_setParticipantIdentifierType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(unsigned __int8 *)(a1 + 32);
  objc_msgSend(a2, "metadata");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsResolvableParticipant:", v2);

}

void __52__MPNowPlayingParticipant_setParticipantIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "metadata");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setParticipantIdentifier:", v2);

}

@end
