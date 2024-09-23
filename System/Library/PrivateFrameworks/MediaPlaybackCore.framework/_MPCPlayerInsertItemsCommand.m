@implementation _MPCPlayerInsertItemsCommand

- (id)insertAfterPlayingItemWithPlaybackIntent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!objc_msgSend(v4, "prefersEnqueuingUsingAirPlay")
    || (-[_MPCPlayerCommand playerPath](self, "playerPath"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "route"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isDeviceRoute"),
        v6,
        v5,
        v7))
  {
    objc_msgSend(v4, "tracklistToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[_MPCPlayerCommand response](self, "response");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "tracklist");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "playingItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "metadataObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "identifiers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(v4, "tracklistToken");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "seedContentReference");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "referenceModelObjectIdentifiers");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v17, "intersectsSet:", v14) & 1) != 0)
        {
          -[_MPCPlayerInsertItemsCommand _createRadioStationCommandRequest](self, "_createRadioStationCommandRequest");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
          goto LABEL_14;
        }

      }
    }
    v19 = (void *)MEMORY[0x24BDBCED8];
    v20 = *MEMORY[0x24BE65948];
    v26[0] = CFSTR("MPCPlayerCommandRequestMediaRemoteOptionPlaybackIntent");
    v26[1] = v20;
    v27[0] = v4;
    v27[1] = &unk_24CB16CF8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryWithDictionary:", v21);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[_MPCPlayerCommand response](self, "response");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "tracklist");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "playingItem");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "contentItemIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BE65928]);
    -[_MPCPlayerInsertItemsCommand _insertWithOptions:](self, "_insertWithOptions:", v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  v18 = 0;
LABEL_14:

  return v18;
}

- (id)insertPlaybackIntent:(id)a3 afterItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "prefersEnqueuingUsingAirPlay")
    && (-[_MPCPlayerCommand playerPath](self, "playerPath"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "route"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "isDeviceRoute"),
        v9,
        v8,
        !v10))
  {
    v16 = 0;
  }
  else
  {
    objc_msgSend(v7, "metadataObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "contentItemID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "length"))
    {
      v14 = *MEMORY[0x24BE65948];
      v18[0] = CFSTR("MPCPlayerCommandRequestMediaRemoteOptionPlaybackIntent");
      v18[1] = v14;
      v19[0] = v6;
      v19[1] = &unk_24CB16D10;
      v18[2] = *MEMORY[0x24BE65908];
      v19[2] = v13;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MPCPlayerInsertItemsCommand _insertWithOptions:](self, "_insertWithOptions:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = 0;
    }

  }
  return v16;
}

- (id)insertAtEndOfTracklistWithPlaybackIntent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "prefersEnqueuingUsingAirPlay")
    && (-[_MPCPlayerCommand playerPath](self, "playerPath"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "route"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isDeviceRoute"),
        v6,
        v5,
        !v7))
  {
    v10 = 0;
  }
  else
  {
    v8 = *MEMORY[0x24BE65948];
    v12[0] = CFSTR("MPCPlayerCommandRequestMediaRemoteOptionPlaybackIntent");
    v12[1] = v8;
    v13[0] = v4;
    v13[1] = &unk_24CB16D28;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MPCPlayerInsertItemsCommand _insertWithOptions:](self, "_insertWithOptions:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)insertAtEndOfUpNextWithPlaybackIntent:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_MPCPlayerInsertItemsCommand supportedInsertionPositions](self, "supportedInsertionPositions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", &unk_24CB16D40);

  if (!v6)
    goto LABEL_3;
  -[_MPCPlayerInsertItemsCommand lastSection](self, "lastSection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7
    || objc_msgSend(v4, "prefersEnqueuingUsingAirPlay")
    && (-[_MPCPlayerCommand playerPath](self, "playerPath"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "route"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "isDeviceRoute"),
        v11,
        v10,
        !v12))
  {
LABEL_3:
    v8 = 0;
  }
  else
  {
    v13 = (void *)MEMORY[0x24BDBCED8];
    v14 = *MEMORY[0x24BE65948];
    v21[0] = CFSTR("MPCPlayerCommandRequestMediaRemoteOptionPlaybackIntent");
    v21[1] = v14;
    v22[0] = v4;
    v22[1] = &unk_24CB16D40;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryWithDictionary:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[_MPCPlayerCommand response](self, "response");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "tracklist");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "playingItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "contentItemIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v20, *MEMORY[0x24BE65928]);
    -[_MPCPlayerInsertItemsCommand _insertWithOptions:](self, "_insertWithOptions:", v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)insertAfterLastSection
{
  void *v3;
  int v4;
  void *v5;
  _MPCPlayerInsertItemsCommand *v6;

  -[_MPCPlayerInsertItemsCommand supportedInsertionPositions](self, "supportedInsertionPositions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", &unk_24CB16D40);

  if (v4
    && (-[_MPCPlayerInsertItemsCommand lastSection](self, "lastSection"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    v6 = self;
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (MPCPlayerResponseSection)section
{
  void *v4;
  void *v6;

  -[_MPCPlayerInsertItemsCommand lastSection](self, "lastSection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCPlayerResponseTracklist.m"), 914, CFSTR("Invalid attempt to access section [insertAfterLastSection command is nil]"));

  }
  return -[_MPCPlayerInsertItemsCommand lastSection](self, "lastSection");
}

- (id)insertWithPlaybackIntent:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[_MPCPlayerInsertItemsCommand lastSection](self, "lastSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCPlayerResponseTracklist.m"), 919, CFSTR("Invalid attempt to access insertWithPlaybackIntent [insertAfterLastSection command is nil]"));

  }
  if (objc_msgSend(v5, "prefersEnqueuingUsingAirPlay")
    && (-[_MPCPlayerCommand playerPath](self, "playerPath"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "route"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isDeviceRoute"),
        v8,
        v7,
        !v9))
  {
    v18 = 0;
  }
  else
  {
    v10 = (void *)MEMORY[0x24BDBCED8];
    v11 = *MEMORY[0x24BE65948];
    v21[0] = CFSTR("MPCPlayerCommandRequestMediaRemoteOptionPlaybackIntent");
    v21[1] = v11;
    v22[0] = v5;
    v22[1] = &unk_24CB16D40;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryWithDictionary:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[_MPCPlayerCommand response](self, "response");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "tracklist");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "playingItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "contentItemIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v17, *MEMORY[0x24BE65928]);
    -[_MPCPlayerInsertItemsCommand _insertWithOptions:](self, "_insertWithOptions:", v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v18;
}

- (id)_insertWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  MPCPlayerCommandRequest *v12;
  void *v13;
  void *v14;
  void *v15;
  MPCPlayerCommandRequest *v16;
  MPCPlayerCommandRequest *v17;

  v4 = a3;
  -[_MPCPlayerCommand response](self, "response");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCPlayerCommand playerPath](self, "playerPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isInProcess");

  if (v5)
  {
    v8 = v7 ^ 1u;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MPCPlayerCommandRequestMediaRemoteOptionPlaybackIntent"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE65948]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "integerValue");

    if (-[_MPCPlayerInsertItemsCommand _isSupportedPlaybackIntent:forRemotePlayer:atInsertionPosition:](self, "_isSupportedPlaybackIntent:forRemotePlayer:atInsertionPosition:", v9, v8, v11))
    {
      v12 = [MPCPlayerCommandRequest alloc];
      objc_msgSend(v5, "controller");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "request");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "label");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[MPCPlayerCommandRequest initWithMediaRemoteCommand:options:controller:label:](v12, "initWithMediaRemoteCommand:options:controller:label:", 125, v4, v13, v15);

    }
    else
    {
      v16 = 0;
    }
  }
  else
  {
    v17 = [MPCPlayerCommandRequest alloc];
    -[_MPCPlayerCommand playerPath](self, "playerPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[MPCPlayerCommandRequest initWithMediaRemoteCommand:options:playerPath:label:](v17, "initWithMediaRemoteCommand:options:playerPath:label:", 125, v4, v9, CFSTR("presumptuous command"));
  }

  return v16;
}

- (id)_createRadioStationCommandRequest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  MPCPlayerCommandRequest *v8;
  void *v9;
  void *v10;
  void *v11;
  MPCPlayerCommandRequest *v12;

  if (-[_MPCPlayerInsertItemsCommand supportsCreateStation](self, "supportsCreateStation"))
  {
    -[_MPCPlayerCommand response](self, "response");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "tracklist");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "playingItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contentItemIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BE65928]);
    v8 = [MPCPlayerCommandRequest alloc];
    objc_msgSend(v3, "controller");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "request");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "label");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[MPCPlayerCommandRequest initWithMediaRemoteCommand:options:controller:label:](v8, "initWithMediaRemoteCommand:options:controller:label:", 121, v4, v9, v11);

  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (BOOL)_isSupportedPlaybackIntent:(id)a3 forRemotePlayer:(BOOL)a4 atInsertionPosition:(int)a5
{
  uint64_t v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  char v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v25;

  v5 = *(_QWORD *)&a5;
  v6 = a4;
  v8 = a3;
  -[_MPCPlayerInsertItemsCommand supportedInsertionPositions](self, "supportedInsertionPositions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "containsObject:", v10);

  if (!v11)
    goto LABEL_17;
  if ((_DWORD)v5 == 2)
  {
    -[_MPCPlayerInsertItemsCommand supportedInsertionPositions](self, "supportedInsertionPositions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "containsObject:", &unk_24CB16D40);

    if ((v13 & 1) != 0)
      goto LABEL_17;
  }
  v14 = objc_msgSend(v8, "tracklistSource");
  if (v14 > 3)
  {
    if (v14 == 4)
    {
      -[_MPCPlayerInsertItemsCommand supportedQueueTypes](self, "supportedQueueTypes");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v25, "containsObject:", &unk_24CB16CE0);

      if (v16)
      {
        -[_MPCPlayerInsertItemsCommand supportedCustomDataQueueIdentifiers](self, "supportedCustomDataQueueIdentifiers");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        v19 = CFSTR("com.apple.mediaplayer.playbackcontext");
        goto LABEL_21;
      }
    }
    else
    {
      LOBYTE(v16) = v14 == 500;
    }
    goto LABEL_18;
  }
  if (v14 != 1)
  {
    if (v14 == 3)
    {
      if (!v6)
      {
        LOBYTE(v16) = 1;
        goto LABEL_18;
      }
      -[_MPCPlayerInsertItemsCommand supportedQueueTypes](self, "supportedQueueTypes");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "containsObject:", &unk_24CB16CE0);

      if (v16)
      {
        -[_MPCPlayerInsertItemsCommand supportedCustomDataQueueIdentifiers](self, "supportedCustomDataQueueIdentifiers");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        v19 = CFSTR("com.apple.music.playbackqueue.tracklist");
LABEL_21:
        LOBYTE(v16) = objc_msgSend(v17, "containsObject:", v19);

        goto LABEL_18;
      }
      goto LABEL_18;
    }
LABEL_17:
    LOBYTE(v16) = 0;
    goto LABEL_18;
  }
  if ((_DWORD)v5 != 2)
    goto LABEL_17;
  -[_MPCPlayerInsertItemsCommand supportedInsertionPositions](self, "supportedInsertionPositions");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "containsObject:", v21);

  if (!v22)
    goto LABEL_17;
  -[_MPCPlayerInsertItemsCommand supportedQueueTypes](self, "supportedQueueTypes");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v23, "containsObject:", &unk_24CB16D58);

  if (v16 && v6)
  {
    -[_MPCPlayerInsertItemsCommand supportedCustomDataQueueIdentifiers](self, "supportedCustomDataQueueIdentifiers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v19 = CFSTR("com.apple.music.playbackqueue.radio");
    goto LABEL_21;
  }
LABEL_18:

  return v16;
}

- (NSArray)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)supportsCreateStation
{
  return self->_supportsCreateStation;
}

- (void)setSupportsCreateStation:(BOOL)a3
{
  self->_supportsCreateStation = a3;
}

- (NSSet)supportedInsertionPositions
{
  return self->_supportedInsertionPositions;
}

- (void)setSupportedInsertionPositions:(id)a3
{
  objc_storeStrong((id *)&self->_supportedInsertionPositions, a3);
}

- (NSSet)supportedQueueTypes
{
  return self->_supportedQueueTypes;
}

- (void)setSupportedQueueTypes:(id)a3
{
  objc_storeStrong((id *)&self->_supportedQueueTypes, a3);
}

- (NSSet)supportedCustomDataQueueIdentifiers
{
  return self->_supportedCustomDataQueueIdentifiers;
}

- (void)setSupportedCustomDataQueueIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_supportedCustomDataQueueIdentifiers, a3);
}

- (MPCPlayerResponseSection)lastSection
{
  return self->_lastSection;
}

- (void)setLastSection:(id)a3
{
  objc_storeStrong((id *)&self->_lastSection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSection, 0);
  objc_storeStrong((id *)&self->_supportedCustomDataQueueIdentifiers, 0);
  objc_storeStrong((id *)&self->_supportedQueueTypes, 0);
  objc_storeStrong((id *)&self->_supportedInsertionPositions, 0);
  objc_storeStrong((id *)&self->_devices, 0);
}

@end
