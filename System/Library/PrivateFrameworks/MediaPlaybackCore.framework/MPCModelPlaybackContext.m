@implementation MPCModelPlaybackContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)descriptionComponents
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MPCModelPlaybackContext;
  -[MPCModelPlaybackContext descriptionComponents](&v10, sel_descriptionComponents);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[MPCModelPlaybackContext playbackRequestEnvironment](self, "playbackRequestEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("playbackRequestEnvironment"));

  if (-[MPModelRequest conformsToProtocol:](self->_request, "conformsToProtocol:", &unk_254A9D5E8))
  {
    -[MPModelRequest playbackRequestEnvironment](self->_request, "playbackRequestEnvironment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("request.playbackRequestEnvironment"));

  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_request, CFSTR("request"));
  -[MPIdentifierSet humanDescription](self->_startItemIdentifiers, "humanDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("startItemIdentifiers"));

  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_delegateTokenB, CFSTR("delegateTokenB"));
  return v4;
}

- (MPCPlaybackRequestEnvironment)playbackRequestEnvironment
{
  return self->_playbackRequestEnvironment;
}

- (void)clearStartItem
{
  MPIdentifierSet *startItemIdentifiers;

  startItemIdentifiers = self->_startItemIdentifiers;
  self->_startItemIdentifiers = 0;

}

- (MPCModelPlaybackContext)initWithCoder:(id)a3
{
  id v4;
  MPCModelPlaybackContext *v5;
  uint64_t v6;
  MPModelRequest *request;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  MPIdentifierSet *startItemIdentifiers;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSDictionary *startTimeModifications;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSDictionary *endTimeModifications;
  uint64_t v27;
  MPModelGenericObject *fallbackSectionRepresentation;
  uint64_t v29;
  NSString *encodedMediaLibraryUniqueID;
  void *v32;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)MPCModelPlaybackContext;
  v5 = -[MPCModelPlaybackContext initWithCoder:](&v33, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPCModelPlaybackContextRequest"));
    v6 = objc_claimAutoreleasedReturnValue();
    request = v5->_request;
    v5->_request = (MPModelRequest *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPCModelPlaybackContextUserIdentity"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPCModelPlaybackContextPlaybackRequestEnvironment"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (!v9)
    {
      +[MPCPlaybackRequestEnvironment requestEnvironmentWithUserIdentity:](MPCPlaybackRequestEnvironment, "requestEnvironmentWithUserIdentity:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v32 = (void *)v8;
    objc_storeStrong((id *)&v5->_playbackRequestEnvironment, v10);
    if (!v9)

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPCModelPlaybackContextStartItemIdentifiers"));
    v11 = objc_claimAutoreleasedReturnValue();
    startItemIdentifiers = v5->_startItemIdentifiers;
    v5->_startItemIdentifiers = (MPIdentifierSet *)v11;

    v13 = (void *)MEMORY[0x24BDBCF20];
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, v15, v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("MPCModelPlaybackContextStartTimeModifications"));
    v18 = objc_claimAutoreleasedReturnValue();
    startTimeModifications = v5->_startTimeModifications;
    v5->_startTimeModifications = (NSDictionary *)v18;

    v20 = (void *)MEMORY[0x24BDBCF20];
    v21 = objc_opt_class();
    v22 = objc_opt_class();
    v23 = objc_opt_class();
    objc_msgSend(v20, "setWithObjects:", v21, v22, v23, objc_opt_class(), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("MPCModelPlaybackContextEndTimeModifications"));
    v25 = objc_claimAutoreleasedReturnValue();
    endTimeModifications = v5->_endTimeModifications;
    v5->_endTimeModifications = (NSDictionary *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPCModelPlaybackContextFallbackSectionRepresentation"));
    v27 = objc_claimAutoreleasedReturnValue();
    fallbackSectionRepresentation = v5->_fallbackSectionRepresentation;
    v5->_fallbackSectionRepresentation = (MPModelGenericObject *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPCModelPlaybackContextMediaLibraryUniqueID"));
    v29 = objc_claimAutoreleasedReturnValue();
    encodedMediaLibraryUniqueID = v5->_encodedMediaLibraryUniqueID;
    v5->_encodedMediaLibraryUniqueID = (NSString *)v29;

    v5->_skipEncodingMediaLibraryUniqueID = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("semlUID"));
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MPCModelPlaybackContext;
  v4 = -[MPCModelPlaybackContext copyWithZone:](&v14, sel_copyWithZone_, a3);
  -[MPCModelPlaybackContext playbackRequestEnvironment](self, "playbackRequestEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPlaybackRequestEnvironment:", v5);

  -[MPCModelPlaybackContext request](self, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v4, "setRequest:", v7);

  -[MPCModelPlaybackContext startItemIdentifiers](self, "startItemIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStartItemIdentifiers:", v8);

  -[MPCModelPlaybackContext startTimeModifications](self, "startTimeModifications");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStartTimeModifications:", v9);

  -[MPCModelPlaybackContext endTimeModifications](self, "endTimeModifications");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEndTimeModifications:", v10);

  -[MPCModelPlaybackContext fallbackSectionRepresentation](self, "fallbackSectionRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFallbackSectionRepresentation:", v11);

  objc_msgSend(v4, "setSkipEncodingMediaLibraryUniqueID:", -[MPCModelPlaybackContext skipEncodingMediaLibraryUniqueID](self, "skipEncodingMediaLibraryUniqueID"));
  objc_msgSend(v4, "setAllowsJumpToIt:", -[MPCModelPlaybackContext allowsJumpToIt](self, "allowsJumpToIt"));
  -[MPCModelPlaybackContext delegateTokenB](self, "delegateTokenB");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegateTokenB:", v12);

  return v4;
}

- (NSDictionary)startTimeModifications
{
  return self->_startTimeModifications;
}

- (MPIdentifierSet)startItemIdentifiers
{
  return self->_startItemIdentifiers;
}

- (void)setStartItemIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void)setPlaybackRequestEnvironment:(id)a3
{
  MPCPlaybackRequestEnvironment *v5;

  v5 = (MPCPlaybackRequestEnvironment *)a3;
  if (self->_playbackRequestEnvironment != v5)
    objc_storeStrong((id *)&self->_playbackRequestEnvironment, a3);
  -[MPCModelPlaybackContext updateRequestPlaybackEnvironment](self, "updateRequestPlaybackEnvironment");

}

- (void)updateRequestPlaybackEnvironment
{
  if (-[MPModelRequest conformsToProtocol:](self->_request, "conformsToProtocol:", &unk_254A9D5E8))
    -[MPModelRequest setPlaybackRequestEnvironment:](self->_request, "setPlaybackRequestEnvironment:", self->_playbackRequestEnvironment);
}

- (MPModelGenericObject)fallbackSectionRepresentation
{
  return self->_fallbackSectionRepresentation;
}

- (NSDictionary)endTimeModifications
{
  return self->_endTimeModifications;
}

- (MPModelRequest)request
{
  return self->_request;
}

- (BOOL)skipEncodingMediaLibraryUniqueID
{
  return self->_skipEncodingMediaLibraryUniqueID;
}

- (void)setStartTimeModifications:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (void)setSkipEncodingMediaLibraryUniqueID:(BOOL)a3
{
  self->_skipEncodingMediaLibraryUniqueID = a3;
}

- (void)setRequest:(id)a3
{
  MPModelRequest *v4;
  MPModelRequest *request;

  v4 = (MPModelRequest *)objc_msgSend(a3, "copy");
  request = self->_request;
  self->_request = v4;

  -[MPCModelPlaybackContext updateRequestPlaybackEnvironment](self, "updateRequestPlaybackEnvironment");
}

- (void)setFallbackSectionRepresentation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (void)setEndTimeModifications:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void)setAllowsJumpToIt:(BOOL)a3
{
  self->_allowsJumpToIt = a3;
}

- (BOOL)isSupported
{
  void *v3;
  int v4;
  NSObject *v5;
  id v6;
  int v7;
  id v8;
  MPModelRequest *v9;
  void *v10;
  void *v11;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  int v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  NSString *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "forceLibrarySupplementalContexts");

    if (v4)
    {
      v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 138543618;
        v21 = (id)objc_opt_class();
        v22 = 2048;
        v23 = self;
        v6 = v21;
        _os_log_impl(&dword_210BD8000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> isSupported: NO [user default override]", (uint8_t *)&v20, 0x16u);

      }
      LOBYTE(v7) = 0;
      goto LABEL_18;
    }
    -[MPCModelPlaybackContext userIdentity](self, "userIdentity");
    v5 = objc_claimAutoreleasedReturnValue();
    v9 = self->_request;
    objc_msgSend(MEMORY[0x24BDDC7F0], "deviceMediaLibraryWithUserIdentity:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uniqueIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = self->_encodedMediaLibraryUniqueID;
    -[MPModelRequest valueForKeyPath:](v9, "valueForKeyPath:", CFSTR("_mediaLibrary.uniqueIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPModelRequest mediaLibrary](v9, "mediaLibrary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "uniqueIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback_Oversize");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 134219266;
      v21 = self;
      v22 = 2114;
      v23 = v5;
      v24 = 2114;
      v25 = v11;
      v26 = 2114;
      v27 = v12;
      v28 = 2114;
      v29 = v13;
      v30 = 2114;
      v31 = v15;
      _os_log_impl(&dword_210BD8000, v16, OS_LOG_TYPE_DEFAULT, "[MPC:%p] isSupported | matching device libraries [] user=%{public}@ userDeviceLibraryID=%{public}@ encodedLibraryID=%{public}@ requestDecodedLibraryID=%{public}@ requestLibraryID=%{public}@", (uint8_t *)&v20, 0x3Eu);
    }

    if (v12)
    {
      v7 = objc_msgSend(v11, "isEqualToString:", v12);
      v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 134218240;
        v21 = self;
        v22 = 1024;
        LODWORD(v23) = v7;
        v18 = "[MPC:%p] isSupported | returning %{BOOL}u [using encoded media library]";
LABEL_16:
        _os_log_impl(&dword_210BD8000, v17, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v20, 0x12u);
      }
    }
    else
    {
      v7 = objc_msgSend(v11, "isEqualToString:", v15);
      v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 134218240;
        v21 = self;
        v22 = 1024;
        LODWORD(v23) = v7;
        v18 = "[MPC:%p] isSupported | returning %{BOOL}u [using request media library]";
        goto LABEL_16;
      }
    }

    goto LABEL_18;
  }
  v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 134218242;
    v21 = self;
    v22 = 2114;
    v23 = (id)objc_opt_class();
    v8 = v23;
    _os_log_impl(&dword_210BD8000, v5, OS_LOG_TYPE_DEFAULT, "[MPC:%p] isSupported | returning YES [non-library request] request.class=%{public}@", (uint8_t *)&v20, 0x16u);

  }
  LOBYTE(v7) = 1;
LABEL_18:

  return v7;
}

- (id)userIdentity
{
  return -[MPCPlaybackRequestEnvironment userIdentity](self->_playbackRequestEnvironment, "userIdentity");
}

- (BOOL)allowsJumpToIt
{
  return self->_allowsJumpToIt;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateTokenB, 0);
  objc_storeStrong((id *)&self->_playbackRequestEnvironment, 0);
  objc_storeStrong((id *)&self->_encodedMediaLibraryUniqueID, 0);
  objc_storeStrong((id *)&self->_fallbackSectionRepresentation, 0);
  objc_storeStrong((id *)&self->_endTimeModifications, 0);
  objc_storeStrong((id *)&self->_startTimeModifications, 0);
  objc_storeStrong((id *)&self->_startItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

- (void)getRemotePlaybackQueueRepresentationWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _MPCProtoTracklist *v13;
  uint64_t v14;
  void *v15;
  dispatch_queue_t v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  _MPCProtoTracklist *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  NSObject *v32;
  id v33;
  id v34;
  _MPCProtoTracklist *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[4];
  _MPCProtoTracklist *v41;
  MPCModelPlaybackContext *v42;
  id v43;
  _QWORD *v44;
  _QWORD *v45;
  _QWORD v46[4];
  id v47;
  _QWORD *v48;
  _QWORD *v49;
  _QWORD v50[4];
  id v51;
  id v52;
  NSObject *v53;
  NSObject *v54;
  MPCModelPlaybackContext *v55;
  _MPCProtoTracklist *v56;
  _QWORD *v57;
  _QWORD *v58;
  uint64_t v59;
  id v60;
  _QWORD v61[4];
  NSObject *v62;
  NSObject *v63;
  MPCModelPlaybackContext *v64;
  _MPCProtoTracklist *v65;
  _QWORD *v66;
  _QWORD *v67;
  _QWORD v68[3];
  char v69;
  _QWORD v70[5];
  id v71;
  _QWORD block[4];
  id v73;

  v4 = a3;
  -[MPCModelPlaybackContext request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BEC8A58], "activeAccount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v4;
    if (objc_msgSend(v6, "conformsToProtocol:", &unk_254A9D5E8))
    {
      v8 = v6;
      objc_msgSend(v8, "playbackRequestEnvironment");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        -[MPCModelPlaybackContext playbackRequestEnvironment](self, "playbackRequestEnvironment");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setPlaybackRequestEnvironment:", v10);

      }
      objc_msgSend(v8, "playbackRequestEnvironment");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "userIdentity");
      v12 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v12;
    }
    v13 = objc_alloc_init(_MPCProtoTracklist);
    v14 = -[MPCModelPlaybackContext shuffleType](self, "shuffleType");
    if (v14 == 1000)
    {
      objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v15, "musicShuffleType");

    }
    v39 = v7;
    if (v13)
    {
      *(_BYTE *)&v13->_has |= 1u;
      v13->_shuffleMode = v14 != 0;
    }
    v70[0] = 0;
    v70[1] = v70;
    v70[2] = 0x3032000000;
    v70[3] = __Block_byref_object_copy__4157;
    v70[4] = __Block_byref_object_dispose__4158;
    v71 = 0;
    v68[0] = 0;
    v68[1] = v68;
    v68[2] = 0x2020000000;
    v69 = 1;
    v16 = dispatch_queue_create("com.apple.MediaPlaybackCore.MPCModelPlaybackContext.MPCPlaybackQueue.serialQueue", 0);
    v17 = dispatch_group_create();
    dispatch_group_enter(v17);
    objc_msgSend(v6, "setLabel:", CFSTR("com.apple.MediaPlaybackCore.MPCModelPlaybackIntentDataSource.remotePlaybackQueueResolution"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v6, "setDisableImplicitSectioning:", 1);
    v18 = MEMORY[0x24BDAC760];
    v61[0] = MEMORY[0x24BDAC760];
    v61[1] = 3221225472;
    v61[2] = __96__MPCModelPlaybackContext_MPCPlaybackQueue__getRemotePlaybackQueueRepresentationWithCompletion___block_invoke_61;
    v61[3] = &unk_24CAB3048;
    v19 = v17;
    v62 = v19;
    v20 = v16;
    v63 = v20;
    v64 = self;
    v21 = v13;
    v65 = v21;
    v66 = v70;
    v67 = v68;
    objc_msgSend(v6, "performWithResponseHandler:", v61);
    objc_msgSend(MEMORY[0x24BEC8A60], "defaultIdentityStore");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = 0;
    objc_msgSend(v22, "getPropertiesForUserIdentity:error:", v39, &v60);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v60;
    v37 = v23;
    objc_msgSend(v23, "DSID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "unsignedLongLongValue");

    if (v25)
    {
      v26 = (void *)MEMORY[0x24BEC8A58];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "specificAccountWithDSID:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "identityAllowingDelegation:", 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      dispatch_group_enter(v19);
      v50[0] = MEMORY[0x24BDAC760];
      v50[1] = 3221225472;
      v50[2] = __96__MPCModelPlaybackContext_MPCPlaybackQueue__getRemotePlaybackQueueRepresentationWithCompletion___block_invoke_78;
      v50[3] = &unk_24CAB30C0;
      v51 = v22;
      v30 = v29;
      v52 = v30;
      v59 = v25;
      v53 = v19;
      v57 = v70;
      v58 = v68;
      v54 = v20;
      v55 = self;
      v56 = v21;
      objc_msgSend(v51, "getDelegationUUIDsForUserIdentity:completionHandler:", v30, v50);

      v18 = MEMORY[0x24BDAC760];
      v31 = v36;
    }
    else
    {
      v46[0] = v18;
      v46[1] = 3221225472;
      v46[2] = __96__MPCModelPlaybackContext_MPCPlaybackQueue__getRemotePlaybackQueueRepresentationWithCompletion___block_invoke_4_88;
      v46[3] = &unk_24CABA108;
      v48 = v70;
      v31 = v36;
      v47 = v36;
      v49 = v68;
      dispatch_group_async(v19, v20, v46);
      v30 = v47;
    }

    v40[0] = v18;
    v40[1] = 3221225472;
    v40[2] = __96__MPCModelPlaybackContext_MPCPlaybackQueue__getRemotePlaybackQueueRepresentationWithCompletion___block_invoke_5;
    v40[3] = &unk_24CAB92D0;
    v41 = v21;
    v42 = self;
    v43 = v38;
    v44 = v68;
    v45 = v70;
    v34 = v38;
    v35 = v21;
    dispatch_group_notify(v19, v20, v40);

    _Block_object_dispose(v68, 8);
    _Block_object_dispose(v70, 8);

    v33 = v39;
  }
  else
  {
    dispatch_get_global_queue(21, 0);
    v32 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __96__MPCModelPlaybackContext_MPCPlaybackQueue__getRemotePlaybackQueueRepresentationWithCompletion___block_invoke;
    block[3] = &unk_24CAB9720;
    v73 = v4;
    v33 = v4;
    dispatch_async(v32, block);

  }
}

void __96__MPCModelPlaybackContext_MPCPlaybackQueue__getRemotePlaybackQueueRepresentationWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 6, CFSTR("Tracklist token missing model request (nil)."));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __96__MPCModelPlaybackContext_MPCPlaybackQueue__getRemotePlaybackQueueRepresentationWithCompletion___block_invoke_61(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  __int128 v18;

  v5 = a2;
  v6 = a3;
  v13[0] = MEMORY[0x24BDAC760];
  v13[2] = __96__MPCModelPlaybackContext_MPCPlaybackQueue__getRemotePlaybackQueueRepresentationWithCompletion___block_invoke_2;
  v13[3] = &unk_24CAB3020;
  v7 = *(_QWORD *)(a1 + 48);
  v8 = *(void **)(a1 + 56);
  v14 = v6;
  v15 = v7;
  v9 = *(NSObject **)(a1 + 32);
  v10 = *(NSObject **)(a1 + 40);
  v13[1] = 3221225472;
  v16 = v5;
  v17 = v8;
  v18 = *(_OWORD *)(a1 + 64);
  v11 = v5;
  v12 = v6;
  dispatch_group_async(v9, v10, v13);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __96__MPCModelPlaybackContext_MPCPlaybackQueue__getRemotePlaybackQueueRepresentationWithCompletion___block_invoke_78(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char *v11;
  uint64_t quot;
  lldiv_t v13;
  uint64_t v14;
  const UInt8 *v15;
  __CFString *v16;
  void *v17;
  char v18;
  char v19;
  void *v20;
  NSObject *v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  uint64_t v27;
  NSObject *v28;
  id v29;
  __int128 v30;
  uint64_t v31;
  char v32;
  char v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = *(void **)(a1 + 32);
    v34 = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v34, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addDelegationUUIDs:forUserIdentity:completionHandler:", v8, *(_QWORD *)(a1 + 40), 0);

    v4 = (void *)v6;
  }
  +[MPCPlaybackAccountManager sharedManager](MPCPlaybackAccountManager, "sharedManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 96);
  v11 = (char *)&v35 + 1;
  quot = v10;
  do
  {
    v13 = lldiv(quot, 10);
    quot = v13.quot;
    if (v13.rem >= 0)
      LOBYTE(v14) = v13.rem;
    else
      v14 = -v13.rem;
    *(v11 - 2) = v14 + 48;
    v15 = (const UInt8 *)(v11 - 2);
    --v11;
  }
  while (v13.quot);
  if (v10 < 0)
  {
    *(v11 - 2) = 45;
    v15 = (const UInt8 *)(v11 - 2);
  }
  v16 = (__CFString *)CFStringCreateWithBytes(0, v15, (char *)&v35 - (char *)v15, 0x8000100u, 0);
  objc_msgSend(v9, "accountForDSID:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(v17, "hasCatalogPlaybackCapability");
  v19 = objc_msgSend(v17, "hasDelegationCapability");
  v20 = *(void **)(a1 + 48);
  v21 = *(NSObject **)(a1 + 56);
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __96__MPCModelPlaybackContext_MPCPlaybackQueue__getRemotePlaybackQueueRepresentationWithCompletion___block_invoke_2_82;
  v24[3] = &unk_24CAB3098;
  v31 = *(_QWORD *)(a1 + 96);
  v32 = v18;
  v33 = v19;
  v25 = v4;
  v26 = v17;
  v30 = *(_OWORD *)(a1 + 80);
  v27 = *(_QWORD *)(a1 + 64);
  v28 = v20;
  v29 = *(id *)(a1 + 72);
  v22 = v17;
  v23 = v4;
  dispatch_group_async(v28, v21, v24);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __96__MPCModelPlaybackContext_MPCPlaybackQueue__getRemotePlaybackQueueRepresentationWithCompletion___block_invoke_4_88(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
}

void __96__MPCModelPlaybackContext_MPCPlaybackQueue__getRemotePlaybackQueueRepresentationWithCompletion___block_invoke_5(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v2 = objc_alloc(MEMORY[0x24BDDC728]);
    objc_msgSend(*(id *)(a1 + 32), "data");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v8 = (id)objc_msgSend(v2, "initWithIdentifier:data:options:", CFSTR("com.apple.music.playbackqueue.tracklist"), v3, MEMORY[0x24BDBD1B8]);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "data");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (id)objc_msgSend(v2, "initWithIdentifier:data:options:", CFSTR("com.apple.music.playbackqueue.tracklist"), v5, MEMORY[0x24BDBD1B8]);

    }
    objc_msgSend(v8, "setRequestingImmediatePlayback:", 1);
    objc_msgSend(*(id *)(a1 + 40), "playActivityRecommendationData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v6, 4);
    else
      v7 = 0;
    objc_msgSend(v8, "setSiriRecommendationIdentifier:", v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    v4 = *(_QWORD *)(a1 + 48);
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    {
      (*(void (**)(_QWORD, _QWORD))(v4 + 16))(*(_QWORD *)(a1 + 48), 0);
      return;
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MPCError"), 0, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v4 + 16))(v4, 0, v8);
  }

}

void __96__MPCModelPlaybackContext_MPCPlaybackQueue__getRemotePlaybackQueueRepresentationWithCompletion___block_invoke_2_82(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  id *v10;
  uint64_t v11;
  void *v12;
  _MPCProtoDelegateInfoTokenB *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  __int128 v18;
  id v19;

  +[_MPCProtoDelegateInfo currentDeviceDelegateInfo](_MPCProtoDelegateInfo, "currentDeviceDelegateInfo");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    *(_BYTE *)(v2 + 116) |= 2u;
    *(_QWORD *)(v2 + 40) = 1;
    v4 = *(_QWORD *)(a1 + 88);
    *(_BYTE *)(v2 + 116) |= 1u;
    *(_QWORD *)(v2 + 32) = v4;
  }
  -[_MPCProtoDelegateInfo setUuid:](v2, *(void **)(a1 + 32));
  if (*(_BYTE *)(a1 + 96))
  {
    if (v3)
    {
      PBRepeatedInt32Add();
      if (!*(_BYTE *)(a1 + 97))
        goto LABEL_19;
      PBRepeatedInt32Add();
    }
    else if (!*(_BYTE *)(a1 + 97))
    {
      goto LABEL_19;
    }
    v5 = *(void **)(a1 + 40);
    v19 = 0;
    objc_msgSend(v5, "delegateTokenAWithError:", &v19);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v19;
    v8 = v19;
    if (v6)
    {
      if (v3)
        PBRepeatedInt32Add();
      -[_MPCProtoDelegateInfo setTokenA:]((uint64_t)v3, v6);
    }
    else
    {
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v11 = *(_QWORD *)(v9 + 40);
      v10 = (id *)(v9 + 40);
      if (!v11)
        objc_storeStrong(v10, v7);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
    }
    objc_msgSend(*(id *)(a1 + 48), "delegateTokenB");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = -[_MPCProtoDelegateInfoTokenB initWithData:]([_MPCProtoDelegateInfoTokenB alloc], "initWithData:", v12);
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 56));
      v14 = *(void **)(a1 + 40);
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __96__MPCModelPlaybackContext_MPCPlaybackQueue__getRemotePlaybackQueueRepresentationWithCompletion___block_invoke_3_85;
      v15[3] = &unk_24CAB3070;
      v16 = v3;
      v18 = *(_OWORD *)(a1 + 72);
      v17 = *(id *)(a1 + 56);
      objc_msgSend(v14, "getDelegateTokenEWithTokenB:completion:", v13, v15);

    }
  }
  else if (v3)
  {
    PBRepeatedInt32Add();
  }
LABEL_19:
  -[_MPCProtoTracklist addAccountInfo:](*(_QWORD *)(a1 + 64), v3);

}

void __96__MPCModelPlaybackContext_MPCPlaybackQueue__getRemotePlaybackQueueRepresentationWithCompletion___block_invoke_3_85(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (v5)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(_QWORD *)(v6 + 40);
    v7 = (id *)(v6 + 40);
    if (!v8)
      objc_storeStrong(v7, a3);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }
  else
  {
    -[_MPCProtoDelegateInfo setTokenE:](*(_QWORD *)(a1 + 32), v9);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __96__MPCModelPlaybackContext_MPCPlaybackQueue__getRemotePlaybackQueueRepresentationWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v5 = *(_QWORD *)(v3 + 40);
    v4 = (id *)(v3 + 40);
    if (!v5)
      objc_storeStrong(v4, v2);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "startItemIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_QWORD *)(a1 + 48))
    {
      v25 = 0;
      v26 = &v25;
      v27 = 0x3032000000;
      v28 = __Block_byref_object_copy__4157;
      v29 = __Block_byref_object_dispose__4158;
      v30 = 0;
      v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      objc_msgSend(*(id *)(a1 + 48), "results");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "playActivityFeatureName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "playActivityQueueGroupingID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __96__MPCModelPlaybackContext_MPCPlaybackQueue__getRemotePlaybackQueueRepresentationWithCompletion___block_invoke_3;
      v18[3] = &unk_24CAB2FF8;
      v11 = v9;
      v19 = v11;
      v12 = v10;
      v20 = v12;
      v13 = v8;
      v21 = v13;
      v24 = &v25;
      v22 = v6;
      v14 = v7;
      v23 = v14;
      objc_msgSend(v13, "enumerateSectionIdentifiersUsingBlock:", v18);
      v15 = *(_QWORD *)(a1 + 56);
      if (v15)
        objc_storeStrong((id *)(v15 + 16), v7);
      v16 = (void *)v26[5];
      if (v16)
      {
        v17 = *(_QWORD *)(a1 + 56);
        if (v17)
          objc_storeStrong((id *)(v17 + 32), v16);
      }

      _Block_object_dispose(&v25, 8);
    }

  }
}

void __96__MPCModelPlaybackContext_MPCPlaybackQueue__getRemotePlaybackQueueRepresentationWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  _MPCProtoContainer *v5;
  _MPCProtoContainerIdentifierSet *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  char v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _MPCProtoContainerIdentifierSet *v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;

  v34 = a3;
  v5 = objc_alloc_init(_MPCProtoContainer);
  v6 = objc_alloc_init(_MPCProtoContainerIdentifierSet);
  objc_msgSend(v34, "modelKind");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identityKind");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDC838], "identityKind");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 == v9)
  {

    goto LABEL_8;
  }
  v10 = v9;
  v11 = objc_msgSend(v8, "isEqual:", v9);

  if ((v11 & 1) != 0)
  {
LABEL_8:
    if (v5)
    {
      *(_BYTE *)&v5->_has |= 1u;
      v5->_containerType = 1;
    }
    objc_msgSend(v34, "universalStore");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "adamID");
    if (v18)
    {
      if (v6)
      {
        *(_BYTE *)&v6->_has |= 4u;
        v6->_storeAdamID = v18;
      }
    }
    else
    {
      objc_msgSend(v34, "universalStore");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "subscriptionAdamID");
      if (v6)
      {
        *(_BYTE *)&v6->_has |= 4u;
        v6->_storeAdamID = v20;
      }

    }
    goto LABEL_27;
  }
  objc_msgSend(v34, "modelKind");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identityKind");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDC968], "identityKind");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (v13 == v14)
  {

    goto LABEL_17;
  }
  v15 = v14;
  v16 = objc_msgSend(v13, "isEqual:", v14);

  if ((v16 & 1) != 0)
  {
LABEL_17:
    if (v5)
    {
      *(_BYTE *)&v5->_has |= 1u;
      v5->_containerType = 5;
    }
    objc_msgSend(v34, "personalizedStore");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "cloudID");
    if (v6)
    {
      *(_BYTE *)&v6->_has |= 1u;
      v6->_cloudID = v22;
    }

    objc_msgSend(v34, "universalStore");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "globalPlaylistID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_storeStrong((id *)&v6->_storePlaylistGlobalID, v24);

    objc_msgSend(v34, "universalStore");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "universalCloudLibraryID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_storeStrong((id *)&v6->_cloudUniversalLibraryID, v26);

    objc_msgSend(v34, "versionHash");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_storeStrong((id *)&v6->_storePlaylistVersionHash, v17);
LABEL_27:

    goto LABEL_28;
  }
  if (!v5)
    goto LABEL_31;
  *(_BYTE *)&v5->_has |= 1u;
  v5->_containerType = 0;
LABEL_28:
  v27 = *(void **)(a1 + 32);
  if (v27 && v5)
    objc_storeStrong((id *)&v5->_playActivityFeatureName, v27);
LABEL_31:
  v28 = *(void **)(a1 + 40);
  if (v28)
  {
    if (v5)
    {
      objc_storeStrong((id *)&v5->_playActivityQueueGroupingID, v28);
      goto LABEL_35;
    }
LABEL_40:
    v29 = 0;
    goto LABEL_37;
  }
  if (!v5)
    goto LABEL_40;
LABEL_35:
  objc_storeStrong((id *)&v5->_identifierSet, v6);
  v29 = v5->_identifierSet;
  if (v29)
  {
    *(_BYTE *)&v29->_has |= 2u;
    v29->_delegateInfoID = 1;
  }
LABEL_37:

  v30 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __96__MPCModelPlaybackContext_MPCPlaybackQueue__getRemotePlaybackQueueRepresentationWithCompletion___block_invoke_4;
  v35[3] = &unk_24CAB2FD0;
  v38 = *(_QWORD *)(a1 + 72);
  v31 = *(void **)(a1 + 48);
  v32 = *(id *)(a1 + 56);
  v39 = a2;
  v36 = v32;
  v37 = v30;
  v33 = v30;
  objc_msgSend(v31, "enumerateItemIdentifiersInSectionAtIndex:usingBlock:", a2, v35);
  if (v5)
    objc_storeStrong((id *)&v5->_items, v30);
  objc_msgSend(*(id *)(a1 + 64), "addObject:", v5);

}

void __96__MPCModelPlaybackContext_MPCPlaybackQueue__getRemotePlaybackQueueRepresentationWithCompletion___block_invoke_4(void *a1, uint64_t a2, void *a3)
{
  id v5;
  _MPCProtoTracklistIndexPath *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _MPCProtoItem *v12;
  _MPCProtoItemIdentifierSet *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  char v29;
  id v30;
  id v31;
  void *v32;
  char v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  char v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  char v43;
  char v44;
  unint64_t v45;
  _MPCProtoItemIdentifierSet *v46;
  NSObject *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  int v55;
  void *v56;
  uint8_t buf[4];
  uint64_t v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!*(_QWORD *)(*(_QWORD *)(*((_QWORD *)a1 + 6) + 8) + 40))
  {
    if (objc_msgSend(*((id *)a1 + 4), "intersectsSet:", v5))
    {
      v6 = objc_alloc_init(_MPCProtoTracklistIndexPath);
      v7 = *(_QWORD *)(*((_QWORD *)a1 + 6) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

      v9 = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)a1 + 6) + 8) + 40);
      if (v9)
      {
        v10 = *((_QWORD *)a1 + 7);
        *(_BYTE *)(v9 + 24) |= 1u;
        *(_QWORD *)(v9 + 8) = v10;
        v11 = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)a1 + 6) + 8) + 40);
        if (v11)
        {
          *(_BYTE *)(v11 + 24) |= 2u;
          *(_QWORD *)(v11 + 16) = a2;
        }
      }
    }
  }
  v12 = objc_alloc_init(_MPCProtoItem);
  v13 = objc_alloc_init(_MPCProtoItemIdentifierSet);
  objc_msgSend(v5, "personalizedStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "cloudID");
  v16 = 0x254A77000uLL;
  if (v13)
  {
    *(_BYTE *)&v13->_has |= 1u;
    v13->_cloudID = v15;
  }

  objc_msgSend(v5, "universalStore");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "adamID");
  if (v13)
  {
    *(_BYTE *)&v13->_has |= 8u;
    v13->_storeAdamID = v18;
  }

  objc_msgSend(v5, "universalStore");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "subscriptionAdamID");
  if (v13)
  {
    *(_BYTE *)&v13->_has |= 0x10u;
    v13->_storeSubscriptionAdamID = v20;
  }

  objc_msgSend(v5, "universalStore");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "universalCloudLibraryID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    objc_storeStrong((id *)&v13->_cloudUniversalLibraryID, v22);

  objc_msgSend(v5, "universalStore");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "purchasedAdamID");
  if (v13)
  {
    *(_BYTE *)&v13->_has |= 4u;
    v13->_purchaseHistoryID = v24;
  }

  objc_msgSend(v5, "modelKind");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "identityKind");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDC9E0], "identityKind");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  v28 = v26;
  if (v26 == v27)
    goto LABEL_27;
  v29 = objc_msgSend(v26, "isEqual:", v27);

  if ((v29 & 1) != 0)
  {
LABEL_28:

    goto LABEL_29;
  }
  v56 = a1;
  objc_msgSend(v5, "modelKind");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "identityKind");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDC958], "identityKind");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  if (v30 == v31)
  {

    v16 = 0x254A77000uLL;
LABEL_27:

    goto LABEL_28;
  }
  v32 = v31;
  v33 = objc_msgSend(v30, "isEqual:", v31);

  a1 = v56;
  v16 = 0x254A77000;
  if ((v33 & 1) != 0)
  {
LABEL_29:
    if (v12)
    {
      *(_BYTE *)&v12->_has |= 1u;
      v12->_mediaType = 1;
      v44 = objc_msgSend(v5, "shouldExcludeFromShuffle");
      *(_BYTE *)&v12->_has |= 2u;
      v12->_excludeFromShuffle = v44;
      goto LABEL_31;
    }
    objc_msgSend(v5, "shouldExcludeFromShuffle");
    goto LABEL_50;
  }
  objc_msgSend(v5, "modelKind");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "identityKind");
  v35 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDCA30], "identityKind");
  v36 = (id)objc_claimAutoreleasedReturnValue();
  if (v35 == v36)
  {

LABEL_43:
    if (v12)
    {
      *(_BYTE *)&v12->_has |= 1u;
      v55 = 6;
LABEL_48:
      v12->_mediaType = v55;
      goto LABEL_31;
    }
LABEL_50:
    v46 = 0;
    v45 = 0x254A77000;
    goto LABEL_33;
  }
  v37 = v36;
  v38 = objc_msgSend(v35, "isEqual:", v36);

  if ((v38 & 1) != 0)
    goto LABEL_43;
  objc_msgSend(v5, "modelKind");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "identityKind");
  v40 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDC920], "identityKind");
  v41 = (id)objc_claimAutoreleasedReturnValue();
  if (v40 == v41)
  {

LABEL_46:
    if (v12)
    {
      *(_BYTE *)&v12->_has |= 1u;
      v55 = 5;
      goto LABEL_48;
    }
    goto LABEL_50;
  }
  v42 = v41;
  v43 = objc_msgSend(v40, "isEqual:", v41);

  if ((v43 & 1) != 0)
    goto LABEL_46;
  if (!v12)
    goto LABEL_50;
LABEL_31:
  v45 = 0x254A77000uLL;
  objc_storeStrong((id *)&v12->_identifierSet, v13);
  v46 = v12->_identifierSet;
  if (v46)
  {
    *((_BYTE *)&v46->super.super.isa + *(int *)(v16 + 1968)) |= 2u;
    v46->_delegateInfoID = 1;
  }
LABEL_33:

  v47 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v5, "library");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "containedPersistentID");
    v50 = v49;
    if (!v49)
    {
      objc_msgSend(v5, "library");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v56, "persistentID");
    }
    v51 = a1;
    if (v12)
      v52 = *(Class *)((char *)&v12->super.super.isa + *(int *)(v45 + 1004));
    else
      v52 = 0;
    v53 = v52;
    objc_msgSend(v53, "dictionaryRepresentation");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v58 = v50;
    v59 = 2114;
    v60 = v54;
    _os_log_impl(&dword_210BD8000, v47, OS_LOG_TYPE_DEBUG, "XDLib: => %lld => %{public}@", buf, 0x16u);

    if (!v49)
    a1 = v51;
  }

  objc_msgSend(*((id *)a1 + 5), "addObject:", v12);
}

- (id)getSharedListeningTracklistWithCompletion:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  char *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  BOOL v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[5];
  id v38;
  id v39;
  id v40;
  id v41[2];
  BOOL v42;
  id buf[2];

  v5 = a3;
  -[MPCModelPlaybackContext request](self, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  if ((objc_msgSend(v7, "conformsToProtocol:", &unk_254AABA00) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPPlaybackContext+MPCSharedListening.m"), 39, CFSTR("Request class (%@) must conform to MPCModelPlaybackRequest"), objc_opt_class());

  }
  objc_msgSend(v7, "itemKind");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "modelClass");

  objc_msgSend(v9, "mqf_requiredItemPlaybackProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v7, "setItemProperties:", v10);
    objc_msgSend(v7, "sectionKind");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "modelClass");

    objc_msgSend(v12, "mqf_requiredSectionPlaybackProperties");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sectionProperties");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "propertySetByCombiningWithPropertySet:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setSectionProperties:", v15);
    objc_msgSend(MEMORY[0x24BDD1768], "progressWithTotalUnitCount:", -1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = os_log_create("com.apple.amp.mediaplaybackcore", "SharedSession");
    v18 = (char *)os_signpost_id_make_with_pointer(v17, self);

    -[MPCModelPlaybackContext startItemIdentifiers](self, "startItemIdentifiers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = os_log_create("com.apple.amp.mediaplaybackcore", "SharedSession");
    v21 = v20;
    if ((unint64_t)(v18 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      LOWORD(buf[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_210BD8000, v21, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v18, "sharedListeningTracklist:modelRequest:perform", ", (uint8_t *)buf, 2u);
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "legacyMediaQuery");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22 != 0;

    }
    else
    {
      v23 = 0;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(v19, "library");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        v26 = objc_msgSend(v19, "copyWithSource:block:", CFSTR("PlaybackContext-SharePlay"), &__block_literal_global_19560);

        v19 = (void *)v26;
      }
    }
    objc_initWeak(buf, v16);
    v27 = MEMORY[0x24BDAC760];
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = __89__MPCModelPlaybackContext_MPCSharedListening__getSharedListeningTracklistWithCompletion___block_invoke_2;
    v37[3] = &unk_24CAB6F70;
    v41[1] = v18;
    objc_copyWeak(v41, buf);
    v40 = v5;
    v37[4] = self;
    v28 = v19;
    v38 = v28;
    v42 = v23;
    v39 = v7;
    v35[0] = v27;
    v35[1] = 3221225472;
    v35[2] = __89__MPCModelPlaybackContext_MPCSharedListening__getSharedListeningTracklistWithCompletion___block_invoke_100;
    v35[3] = &unk_24CABA2D0;
    v29 = (id)objc_msgSend(v39, "newOperationWithResponseHandler:", v37);
    v36 = v29;
    objc_msgSend(v16, "setCancellationHandler:", v35);
    -[MPCModelPlaybackContext request](self, "request");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "preferredQueue");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addOperation:", v29);

    objc_destroyWeak(v41);
    objc_destroyWeak(buf);

  }
  else
  {
    if (MSVDeviceOSIsInternalInstall())
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPPlaybackContext+MPCSharedListening.m"), 44, CFSTR("Invalid request item class: %@ for %@"), v9, v7);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCMusicPlaybackContextSharePlayError"), 3, CFSTR("Invalid request item class: %@ for %@"), v9, v7);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v5 + 2))(v5, 0, 0, v24);

    objc_msgSend(MEMORY[0x24BDD1768], "progressWithTotalUnitCount:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

void __89__MPCModelPlaybackContext_MPCSharedListening__getSharedListeningTracklistWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  void *v10;
  id WeakRetained;
  int v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  os_signpost_id_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  NSObject *v34;
  NSObject *v35;
  os_signpost_id_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  uint64_t v48;
  void *v49;
  NSObject *v50;
  uint64_t v51;
  void *v52;
  NSObject *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void (*v58)(uint64_t, void *, uint64_t, _BYTE *);
  void *v59;
  id v60;
  uint64_t v61;
  id v62;
  id v63;
  id v64;
  id v65;
  _BYTE *v66;
  uint64_t *v67;
  uint64_t v68;
  char v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  id v75;
  uint8_t v76[4];
  uint64_t v77;
  __int16 v78;
  id v79;
  _BYTE buf[24];
  uint64_t (*v81)(uint64_t, uint64_t);
  void (*v82)(uint64_t);
  id v83;
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = os_log_create("com.apple.amp.mediaplaybackcore", "SharedSession");
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 72);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    objc_msgSend(v5, "results");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = objc_msgSend(v10, "totalItemCount");
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v6;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v8, OS_SIGNPOST_INTERVAL_END, v9, "sharedListeningTracklist:modelRequest:perform", "items=%lld; error=%{public}@",
      buf,
      0x16u);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v12 = objc_msgSend(WeakRetained, "isCancelled");

  if (!v12)
  {
    if (v6)
    {
      v15 = *(_QWORD *)(a1 + 56);
      objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCMusicPlaybackContextSharePlayError"), 4, v6, CFSTR("Failed to load request: %@"), *(_QWORD *)(a1 + 32));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v15 + 16))(v15, 0, 0, v16);

      goto LABEL_36;
    }
    objc_msgSend(v5, "results");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "totalItemCount") == 0;

    if (v18)
    {
      v38 = *(_QWORD *)(a1 + 56);
      objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCMusicPlaybackContextSharePlayError"), 5, CFSTR("Request did not produce any items: %@"), *(_QWORD *)(a1 + 32));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v38 + 16))(v38, 0, 0, v39);

      goto LABEL_36;
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v81 = __Block_byref_object_copy__19567;
    v82 = __Block_byref_object_dispose__19568;
    v83 = 0;
    v70 = 0;
    v71 = &v70;
    v72 = 0x3032000000;
    v73 = __Block_byref_object_copy__19567;
    v74 = __Block_byref_object_dispose__19568;
    v75 = 0;
    objc_msgSend(*(id *)(a1 + 32), "playActivityFeatureName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x24BDBCEB8];
    objc_msgSend(v5, "results");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "arrayWithCapacity:", objc_msgSend(v21, "totalItemCount"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_alloc_init(MEMORY[0x24BE65C68]);
    v24 = os_log_create("com.apple.amp.mediaplaybackcore", "SharedSession");
    v25 = v24;
    v26 = *(_QWORD *)(a1 + 72);
    if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_WORD *)v76 = 0;
      _os_signpost_emit_with_name_impl(&dword_210BD8000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v26, "sharedListeningTracklist:modelRequest:enumerate", ", v76, 2u);
    }

    objc_msgSend(v5, "results");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = MEMORY[0x24BDAC760];
    v57 = 3221225472;
    v58 = __89__MPCModelPlaybackContext_MPCSharedListening__getSharedListeningTracklistWithCompletion___block_invoke_72;
    v59 = &unk_24CAB6F08;
    v28 = v19;
    v66 = buf;
    v29 = *(_QWORD *)(a1 + 32);
    v60 = v28;
    v61 = v29;
    v30 = v23;
    v62 = v30;
    v31 = v5;
    v63 = v31;
    v64 = *(id *)(a1 + 40);
    v67 = &v70;
    v32 = v22;
    v69 = *(_BYTE *)(a1 + 80);
    v33 = *(_QWORD *)(a1 + 72);
    v65 = v32;
    v68 = v33;
    objc_msgSend(v27, "enumerateSectionsUsingBlock:", &v56);

    v34 = os_log_create("com.apple.amp.mediaplaybackcore", "SharedSession");
    v35 = v34;
    v36 = *(_QWORD *)(a1 + 72);
    if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
    {
      v37 = objc_msgSend(v30, "totalItemCount");
      *(_DWORD *)v76 = 134217984;
      v77 = v37;
      _os_signpost_emit_with_name_impl(&dword_210BD8000, v35, OS_SIGNPOST_INTERVAL_END, v36, "sharedListeningTracklist:modelRequest:enumerate", "items=%lld", v76, 0xCu);
    }

    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
      goto LABEL_16;
    if (objc_msgSend(v30, "totalItemCount"))
    {
      if (v71[5] || !*(_QWORD *)(a1 + 40))
      {
        if (objc_msgSend(v32, "count"))
        {
          objc_msgSend(v32, "msv_map:", &__block_literal_global_98);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          _MPCLogCategoryPlayback_Oversize();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            v42 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)v76 = 134218242;
            v77 = v42;
            v78 = 2114;
            v79 = v40;
            _os_log_impl(&dword_210BD8000, v41, OS_LOG_TYPE_DEFAULT, "[SLQF] %p getSharedListeningTracklist [dropping unsupported IDs] unsupportedIDs=%{public}@", v76, 0x16u);
          }

        }
LABEL_16:
        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_35:

        _Block_object_dispose(&v70, 8);
        _Block_object_dispose(buf, 8);

        goto LABEL_36;
      }
      _MPCLogCategoryPlayback_Oversize();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        v48 = *(_QWORD *)(a1 + 32);
        v49 = *(void **)(a1 + 40);
        *(_DWORD *)v76 = 134218242;
        v77 = v48;
        v78 = 2114;
        v79 = v49;
        _os_log_impl(&dword_210BD8000, v47, OS_LOG_TYPE_ERROR, "[SLQF] %p getSharedListeningTracklist failed (1/3) [invalid start item IDs] startItemIdentifiers=%{public}@", v76, 0x16u);
      }

      _MPCLogCategoryPlayback_Oversize();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        v51 = *(_QWORD *)(a1 + 32);
        v52 = *(void **)(a1 + 48);
        *(_DWORD *)v76 = 134218242;
        v77 = v51;
        v78 = 2114;
        v79 = v52;
        _os_log_impl(&dword_210BD8000, v50, OS_LOG_TYPE_ERROR, "[SLQF] %p getSharedListeningTracklist failed (2/3) [invalid start item IDs] request=%{public}@", v76, 0x16u);
      }

      _MPCLogCategoryPlayback_Oversize();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        v54 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)v76 = 134218242;
        v77 = v54;
        v78 = 2114;
        v79 = v31;
        _os_log_impl(&dword_210BD8000, v53, OS_LOG_TYPE_ERROR, "[SLQF] %p getSharedListeningTracklist failed (3/3) [invalid start item IDs] response=%{public}@", v76, 0x16u);
      }

      v55 = *(_QWORD *)(a1 + 56);
      objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCMusicPlaybackContextSharePlayError"), 8, CFSTR("Intent did not produce start item for identifiers: %@"), *(_QWORD *)(a1 + 40));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v55 + 16))(v55, 0, 0, v45);
    }
    else
    {
      v43 = *(_QWORD *)(a1 + 56);
      v44 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(v31, "results");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCMusicPlaybackContextSharePlayError"), 7, CFSTR("Intent did not produce any store items: %@ %@"), v45, *(_QWORD *)(a1 + 32), v56, v57, v58, v59, v60, v61, v62, v63, v64);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v43 + 16))(v43, 0, 0, v46);

    }
    goto LABEL_35;
  }
  v13 = *(_QWORD *)(a1 + 56);
  objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCMusicPlaybackContextSharePlayError"), 2, CFSTR("Cancelled while performing request: %@"), *(_QWORD *)(a1 + 32));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v13 + 16))(v13, 0, 0, v14);

LABEL_36:
}

uint64_t __89__MPCModelPlaybackContext_MPCSharedListening__getSharedListeningTracklistWithCompletion___block_invoke_100(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

void __89__MPCModelPlaybackContext_MPCSharedListening__getSharedListeningTracklistWithCompletion___block_invoke_72(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  int v26;
  void *v27;
  id *v28;
  NSObject *v29;
  NSObject *v30;
  os_signpost_id_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  NSObject *v42;
  os_signpost_id_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  _QWORD v54[4];
  id v55;
  _QWORD v56[4];
  id v57;
  _QWORD aBlock[4];
  id v59;
  id v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint8_t buf[4];
  uint64_t v66;
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  objc_opt_class();
  v8 = v7;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = objc_alloc(MEMORY[0x24BDDC928]);
    objc_msgSend(MEMORY[0x24BDDC758], "emptyIdentifierSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v9, "initWithIdentifiers:block:", v10, &__block_literal_global_77_19582);

  }
  objc_msgSend(v8, "identifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "preferredStoreStringIdentifierForPersonID:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDC890], "genericObjectWithModelObject:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "length"))
  {
    if (objc_msgSend(v13, "type") == 4)
    {
      v51 = v12;
      v52 = v8;
      objc_msgSend(MEMORY[0x24BEC89A0], "playlistContainerWithMediaIdentifier:featureName:", v12, *(_QWORD *)(a1 + 32));
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v13, "type") != 2)
      {
        v44 = (void *)MEMORY[0x24BDD1540];
        objc_msgSend(v13, "type");
        NSStringFromMPModelGenericObjectType();
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCMusicPlaybackContextSharePlayError"), 6, CFSTR("Intent produced unsupported section (genericObject.type=%@) %@"), v45, *(_QWORD *)(a1 + 40));
        v46 = objc_claimAutoreleasedReturnValue();
        v47 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
        v48 = *(void **)(v47 + 40);
        *(_QWORD *)(v47 + 40) = v46;

        *a4 = 1;
        goto LABEL_31;
      }
      v51 = v12;
      v52 = v8;
      objc_msgSend(MEMORY[0x24BEC89A0], "albumContainerWithMediaIdentifier:featureName:", v12, *(_QWORD *)(a1 + 32));
      v14 = objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v51 = v12;
    v52 = v8;
    objc_msgSend(MEMORY[0x24BEC89A0], "groupWithFeatureName:", *(_QWORD *)(a1 + 32));
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v15 = v7;
  v50 = (void *)v14;
  objc_msgSend(*(id *)(a1 + 48), "appendSection:", v14);
  v16 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(*(id *)(a1 + 56), "results");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "arrayWithCapacity:", objc_msgSend(v17, "numberOfItemsInSection:", a3));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__MPCModelPlaybackContext_MPCSharedListening__getSharedListeningTracklistWithCompletion___block_invoke_3;
  aBlock[3] = &unk_24CAB6E90;
  v20 = v18;
  v59 = v20;
  v21 = *(id *)(a1 + 64);
  v63 = *(_QWORD *)(a1 + 88);
  v64 = a3;
  v22 = *(_QWORD *)(a1 + 40);
  v60 = v21;
  v61 = v22;
  v62 = *(id *)(a1 + 72);
  v53 = _Block_copy(aBlock);
  v23 = v11;
  if (objc_msgSend(v13, "type") == 4)
  {
    objc_msgSend(v13, "playlist");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "type") == 1;

  }
  else
  {
    v25 = 0;
  }
  v26 = *(unsigned __int8 *)(a1 + 104);
  objc_msgSend(*(id *)(a1 + 56), "results");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26 || v25)
  {
    v56[0] = v19;
    v56[1] = 3221225472;
    v56[2] = __89__MPCModelPlaybackContext_MPCSharedListening__getSharedListeningTracklistWithCompletion___block_invoke_85;
    v56[3] = &unk_24CAB6EB8;
    v28 = &v57;
    v57 = v53;
    objc_msgSend(v27, "enumerateItemsUsingBlock:", v56);
  }
  else
  {
    v54[0] = v19;
    v54[1] = 3221225472;
    v54[2] = __89__MPCModelPlaybackContext_MPCSharedListening__getSharedListeningTracklistWithCompletion___block_invoke_2_87;
    v54[3] = &unk_24CAB6EE0;
    v28 = &v55;
    v55 = v53;
    objc_msgSend(v27, "enumerateItemIdentifiersInSectionAtIndex:usingBlock:", a3, v54);
  }
  v11 = v23;

  v7 = v15;
  if (objc_msgSend(*(id *)(a1 + 40), "shuffleType") == 1)
  {
    v29 = os_log_create("com.apple.amp.mediaplaybackcore", "SharedSession");
    v30 = v29;
    v31 = *(_QWORD *)(a1 + 96);
    v8 = v52;
    if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      *(_DWORD *)buf = 134217984;
      v66 = a3;
      _os_signpost_emit_with_name_impl(&dword_210BD8000, v30, OS_SIGNPOST_INTERVAL_BEGIN, v31, "sharedListeningTracklist:modelRequest:scramble", "section=%ld", buf, 0xCu);
    }

    v49 = objc_alloc_init(MEMORY[0x24BE65C30]);
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE65C88]), "initWithRandomSource:lowestValue:highestValue:", v49, 0, 0x7FFFFFFFLL);
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v20, "count"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
    if (v34 && objc_msgSend(v34, "section") == a3)
    {
      objc_msgSend(v20, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "msv_item"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "removeObjectAtIndex:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "msv_item"));
      objc_msgSend(v33, "addObject:", v35);
      objc_msgSend(MEMORY[0x24BDD15D8], "msv_indexPathForItem:inSection:", 0, a3);
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
      v38 = *(void **)(v37 + 40);
      *(_QWORD *)(v37 + 40) = v36;

    }
    while (objc_msgSend(v20, "count"))
    {
      v39 = objc_msgSend(v32, "nextIntWithUpperBound:", objc_msgSend(v20, "count"));
      objc_msgSend(v20, "objectAtIndexedSubscript:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "addObject:", v40);

      objc_msgSend(v20, "removeObjectAtIndex:", v39);
    }

    v41 = os_log_create("com.apple.amp.mediaplaybackcore", "SharedSession");
    v42 = v41;
    v43 = *(_QWORD *)(a1 + 96);
    if (v43 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_210BD8000, v42, OS_SIGNPOST_INTERVAL_END, v43, "sharedListeningTracklist:modelRequest:scramble", ", buf, 2u);
    }

  }
  else
  {
    v33 = v20;
    v8 = v52;
  }
  objc_msgSend(*(id *)(a1 + 48), "appendItems:", v33);

  v12 = v51;
LABEL_31:

}

uint64_t __89__MPCModelPlaybackContext_MPCSharedListening__getSharedListeningTracklistWithCompletion___block_invoke_96(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "humanDescription");
}

void __89__MPCModelPlaybackContext_MPCSharedListening__getSharedListeningTracklistWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "preferredStoreStringIdentifierForPersonID:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x24BEC89A8], "itemWithMediaIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    if (objc_msgSend(*(id *)(a1 + 40), "intersectsSet:", v3))
    {
      objc_msgSend(MEMORY[0x24BDD15D8], "msv_indexPathForItem:inSection:", objc_msgSend(*(id *)(a1 + 32), "count") - 1, *(_QWORD *)(a1 + 72));
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "universalStore");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "subscriptionAdamID");
      objc_msgSend(v3, "universalStore");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "subscriptionAdamID");

      if (v10 == v12)
      {
        v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback_Oversize");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v15 = *(_QWORD *)(a1 + 40);
          v14 = *(_QWORD *)(a1 + 48);
          v16 = 134218498;
          v17 = v14;
          v18 = 2114;
          v19 = v15;
          v20 = 2114;
          v21 = v3;
          _os_log_impl(&dword_210BD8000, v13, OS_LOG_TYPE_ERROR, "[SLQF] %p getSharedListeningTracklist unexpected failure [intersectsSet returned NO] startItemIdentifiers=%{public}@ itemIdentifierSet=%{public}@", (uint8_t *)&v16, 0x20u);
        }

      }
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v3);
  }

}

void __89__MPCModelPlaybackContext_MPCSharedListening__getSharedListeningTracklistWithCompletion___block_invoke_85(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "identifiers");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

uint64_t __89__MPCModelPlaybackContext_MPCSharedListening__getSharedListeningTracklistWithCompletion___block_invoke_2_87(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __89__MPCModelPlaybackContext_MPCSharedListening__getSharedListeningTracklistWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "clearLibraryIdentifiers");
}

- (MPCModelPlaybackContext)init
{
  MPCModelPlaybackContext *v2;
  MPCModelPlaybackContext *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MPCModelPlaybackContext;
  v2 = -[MPCModelPlaybackContext init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[MPCModelPlaybackContext setUserIdentity:](v2, "setUserIdentity:", 0);
  return v3;
}

- (Class)queueFeederClass
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  char v27;
  void *v28;
  uint64_t v29;
  void *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  if (_os_feature_enabled_impl())
  {
    -[MPCModelPlaybackContext request](self, "request");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_7:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (objc_msgSend(v3, "playbackRequestEnvironment"),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v11, "delegationProperties"),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            v12,
            v11,
            !v12))
      {

LABEL_34:
        goto LABEL_35;
      }
LABEL_33:

      goto LABEL_34;
    }
    v4 = v3;
    objc_msgSend(v4, "mediaLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isHomeSharingLibrary"))
    {
LABEL_32:

      goto LABEL_33;
    }
    objc_msgSend(MEMORY[0x24BDDC968], "identityKind");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sectionKind");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identityKind");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (v8 == v6)
    {

    }
    else
    {
      v9 = v8;
      v10 = objc_msgSend(v8, "isEqual:", v6);

      if ((v10 & 1) == 0)
      {

        goto LABEL_7;
      }
    }
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    objc_msgSend(v4, "scopedContainers", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v33;
LABEL_14:
      v17 = 0;
      while (1)
      {
        if (*(_QWORD *)v33 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(MEMORY[0x24BDDC890], "genericObjectWithModelObject:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v17));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v18, "type") == 4)
          break;

        if (v15 == ++v17)
        {
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
          if (v15)
            goto LABEL_14;
          goto LABEL_20;
        }
      }
      objc_msgSend(v18, "playlist");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "identifiers");
      v20 = (id)objc_claimAutoreleasedReturnValue();

      if (v20)
        goto LABEL_29;
    }
    else
    {
LABEL_20:

    }
    objc_msgSend(v4, "allowedSectionIdentifiers");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (id)objc_msgSend(v21, "count");

    if (!v20)
    {
LABEL_29:
      objc_msgSend(v20, "library");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "persistentID");

      if (v29)
      {
        objc_msgSend(v5, "playlistWithPersistentID:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "playlistAttributes");

      }
      goto LABEL_32;
    }
    objc_msgSend(v4, "allowedSectionIdentifiers");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "firstObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "modelKind");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "identityKind");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    if (v25 == v6)
    {

    }
    else
    {
      v26 = v25;
      v27 = objc_msgSend(v25, "isEqual:", v6);

      if ((v27 & 1) == 0)
      {
        v20 = 0;
LABEL_28:

        goto LABEL_29;
      }
    }
    v20 = v23;
    goto LABEL_28;
  }
LABEL_35:
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)containsRestorableContent
{
  return objc_msgSend((id)objc_opt_class(), "supportsSecureCoding");
}

- (BOOL)isReusableForPlaybackContext:(id)a3
{
  id v5;
  id v6;
  MPModelRequest *request;
  void *v8;
  char v9;
  void *v11;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MPCModelPlaybackContext;
  if (-[MPCModelPlaybackContext isReusableForPlaybackContext:](&v12, sel_isReusableForPlaybackContext_, v5))
  {
    v6 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCModelPlaybackContext.m"), 171, CFSTR("[super isReusableForPlaybackContext:] failed to check for equal types"));

    }
    request = self->_request;
    objc_msgSend(v6, "request");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MPModelRequest isEqual:](request, "isEqual:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *encodedMediaLibraryUniqueID;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MPCModelPlaybackContext;
  -[MPCModelPlaybackContext encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_request, CFSTR("MPCModelPlaybackContextRequest"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_playbackRequestEnvironment, CFSTR("MPCModelPlaybackContextPlaybackRequestEnvironment"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_startItemIdentifiers, CFSTR("MPCModelPlaybackContextStartItemIdentifiers"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_startTimeModifications, CFSTR("MPCModelPlaybackContextStartTimeModifications"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_endTimeModifications, CFSTR("MPCModelPlaybackContextEndTimeModifications"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_fallbackSectionRepresentation, CFSTR("MPCModelPlaybackContextFallbackSectionRepresentation"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_skipEncodingMediaLibraryUniqueID, CFSTR("semlUID"));
  if (!self->_skipEncodingMediaLibraryUniqueID)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      encodedMediaLibraryUniqueID = self->_encodedMediaLibraryUniqueID;
      if (encodedMediaLibraryUniqueID)
      {
        objc_msgSend(v4, "encodeObject:forKey:", encodedMediaLibraryUniqueID, CFSTR("MPCModelPlaybackContextMediaLibraryUniqueID"));
      }
      else
      {
        -[MPModelRequest mediaLibrary](self->_request, "mediaLibrary");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "uniqueIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("MPCModelPlaybackContextMediaLibraryUniqueID"));

      }
    }
  }

}

- (void)setUserIdentity:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BEC8A58], "activeAccount");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[MPCPlaybackRequestEnvironment userIdentity](self->_playbackRequestEnvironment, "userIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC8A60], "defaultIdentityStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToIdentity:inStore:", v8, v5);

  if ((v6 & 1) == 0)
  {
    +[MPCPlaybackRequestEnvironment requestEnvironmentWithUserIdentity:](MPCPlaybackRequestEnvironment, "requestEnvironmentWithUserIdentity:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelPlaybackContext setPlaybackRequestEnvironment:](self, "setPlaybackRequestEnvironment:", v7);

  }
}

- (NSString)encodedMediaLibraryUniqueID
{
  return self->_encodedMediaLibraryUniqueID;
}

- (NSData)delegateTokenB
{
  return self->_delegateTokenB;
}

- (void)setDelegateTokenB:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

+ (BOOL)supportsAutoPlay
{
  return 1;
}

@end
