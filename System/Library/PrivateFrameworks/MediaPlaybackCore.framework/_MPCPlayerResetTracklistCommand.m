@implementation _MPCPlayerResetTracklistCommand

- (void)setSupportsSetQueueCommand:(BOOL)a3
{
  self->_supportsSetQueueCommand = a3;
}

- (void)setSupportedSpecializedQueues:(id)a3
{
  objc_storeStrong((id *)&self->_supportedSpecializedQueues, a3);
}

- (void)setSupportedQueueTypes:(id)a3
{
  objc_storeStrong((id *)&self->_supportedQueueTypes, a3);
}

- (void)setSupportedCustomDataQueueIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_supportedCustomDataQueueIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedCustomDataQueueIdentifiers, 0);
  objc_storeStrong((id *)&self->_supportedQueueTypes, 0);
  objc_storeStrong((id *)&self->_supportedSpecializedQueues, 0);
  objc_storeStrong((id *)&self->_devices, 0);
}

- (NSArray)specializedIntents
{
  return (NSArray *)MEMORY[0x24BDBD1A8];
}

- (id)clear
{
  void *v3;
  void *v4;
  int v5;
  void *ExternalRepresentation;
  void *v7;
  MPCPlayerCommandRequest *v8;
  void *v9;
  void *v10;
  void *v11;
  MPCPlayerCommandRequest *v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  -[_MPCPlayerCommand response](self, "response");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    && (-[_MPCPlayerResetTracklistCommand supportedQueueTypes](self, "supportedQueueTypes"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "containsObject:", &unk_24CB16CC8),
        v4,
        !v5))
  {
    v12 = 0;
  }
  else
  {
    MRSystemAppPlaybackQueueCreate();
    MRSystemAppPlaybackQueueSetReplaceIntent();
    ExternalRepresentation = (void *)MRSystemAppPlaybackQueueCreateExternalRepresentation();
    v14 = *MEMORY[0x24BE659D8];
    v15[0] = ExternalRepresentation;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = [MPCPlayerCommandRequest alloc];
    objc_msgSend(v3, "controller");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "request");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "label");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[MPCPlayerCommandRequest initWithMediaRemoteCommand:options:controller:label:](v8, "initWithMediaRemoteCommand:options:controller:label:", 122, v7, v9, v11);

  }
  return v12;
}

- (id)clearUpNextItems
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  MPCPlayerCommandRequest *v6;
  void *v7;
  void *v8;
  void *v9;
  MPCPlayerCommandRequest *v10;

  -[_MPCPlayerCommand response](self, "response");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "playerCommandEnabled:command:chain:", 0, 144, v4);

  if (v5)
  {
    v6 = [MPCPlayerCommandRequest alloc];
    objc_msgSend(v2, "controller");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "request");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "label");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[MPCPlayerCommandRequest initWithMediaRemoteCommand:options:controller:label:](v6, "initWithMediaRemoteCommand:options:controller:label:", 144, MEMORY[0x24BDBD1B8], v7, v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)replaceWithPlaybackIntent:(id)a3
{
  return -[_MPCPlayerResetTracklistCommand replaceWithPlaybackIntent:replaceIntent:](self, "replaceWithPlaybackIntent:replaceIntent:", a3, 1);
}

- (id)replaceWithPlaybackIntent:(id)a3 replaceIntent:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  int v10;
  void *v11;
  void *v12;
  MPCPlayerCommandRequest *v13;
  void *v14;
  void *v15;
  void *v16;
  MPCPlayerCommandRequest *v17;
  uint64_t v18;
  MPCPlayerCommandRequest *v19;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  char v27;
  void *v28;
  char v29;
  void *v30;
  char v31;
  _QWORD v32[2];
  _QWORD v33[3];

  v33[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[_MPCPlayerCommand response](self, "response");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((!v7 || -[_MPCPlayerResetTracklistCommand supportsSetQueueCommand](self, "supportsSetQueueCommand"))
    && (objc_msgSend(v6, "tracklistSource") != 100 || _os_feature_enabled_impl()))
  {
    -[_MPCPlayerCommand playerPath](self, "playerPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isInProcess");

    if ((v9 & 1) != 0)
    {
LABEL_6:
      v10 = 1;
      goto LABEL_7;
    }
    v18 = objc_msgSend(v6, "tracklistSource");
    v10 = 0;
    if (v18 <= 3)
    {
      if (v18 == 1)
      {
        -[_MPCPlayerResetTracklistCommand supportedQueueTypes](self, "supportedQueueTypes");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "containsObject:", &unk_24CB16CE0);

        if ((v31 & 1) != 0)
          goto LABEL_6;
        -[_MPCPlayerResetTracklistCommand supportedCustomDataQueueIdentifiers](self, "supportedCustomDataQueueIdentifiers");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23;
        v25 = CFSTR("com.apple.music.playbackqueue.radio");
      }
      else
      {
        if (v18 != 3)
          goto LABEL_7;
        -[_MPCPlayerResetTracklistCommand supportedQueueTypes](self, "supportedQueueTypes");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "containsObject:", &unk_24CB16CE0);

        if ((v22 & 1) != 0)
          goto LABEL_6;
        -[_MPCPlayerResetTracklistCommand supportedCustomDataQueueIdentifiers](self, "supportedCustomDataQueueIdentifiers");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23;
        v25 = CFSTR("com.apple.music.playbackqueue.tracklist");
      }
    }
    else
    {
      switch(v18)
      {
        case 4:
          -[_MPCPlayerResetTracklistCommand supportedQueueTypes](self, "supportedQueueTypes");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "containsObject:", &unk_24CB16CE0);

          if ((v27 & 1) != 0)
            goto LABEL_6;
          -[_MPCPlayerResetTracklistCommand supportedCustomDataQueueIdentifiers](self, "supportedCustomDataQueueIdentifiers");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v23;
          v25 = CFSTR("com.apple.mediaplayer.playbackcontext");
          break;
        case 100:
          -[_MPCPlayerResetTracklistCommand supportedQueueTypes](self, "supportedQueueTypes");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "containsObject:", &unk_24CB16CE0);

          if ((v29 & 1) != 0)
            goto LABEL_6;
          -[_MPCPlayerResetTracklistCommand supportedCustomDataQueueIdentifiers](self, "supportedCustomDataQueueIdentifiers");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v23;
          v25 = CFSTR("com.apple.music.playbackqueue.sharedlistening");
          break;
        case 500:
          goto LABEL_6;
        default:
LABEL_7:
          v32[0] = CFSTR("MPCPlayerCommandRequestMediaRemoteOptionPlaybackIntent");
          v32[1] = CFSTR("MPCPlayerCommandRequestMediaRemoteOptionReplaceIntent");
          v33[0] = v6;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v33[1] = v11;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v7)
          {
            if (!v10)
            {
              v17 = 0;
              goto LABEL_19;
            }
            v13 = [MPCPlayerCommandRequest alloc];
            objc_msgSend(v7, "controller");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "request");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "label");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = -[MPCPlayerCommandRequest initWithMediaRemoteCommand:options:controller:label:](v13, "initWithMediaRemoteCommand:options:controller:label:", 122, v12, v14, v16);

          }
          else
          {
            v19 = [MPCPlayerCommandRequest alloc];
            -[_MPCPlayerCommand playerPath](self, "playerPath");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = -[MPCPlayerCommandRequest initWithMediaRemoteCommand:options:playerPath:label:](v19, "initWithMediaRemoteCommand:options:playerPath:label:", 122, v12, v14, CFSTR("presumptuous command"));
          }

LABEL_19:
          goto LABEL_20;
      }
    }
    v10 = objc_msgSend(v23, "containsObject:", v25);

    goto LABEL_7;
  }
  v17 = 0;
LABEL_20:

  return v17;
}

- (NSArray)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDictionary)supportedSpecializedQueues
{
  return self->_supportedSpecializedQueues;
}

- (BOOL)supportsSetQueueCommand
{
  return self->_supportsSetQueueCommand;
}

- (NSSet)supportedQueueTypes
{
  return self->_supportedQueueTypes;
}

- (NSSet)supportedCustomDataQueueIdentifiers
{
  return self->_supportedCustomDataQueueIdentifiers;
}

@end
