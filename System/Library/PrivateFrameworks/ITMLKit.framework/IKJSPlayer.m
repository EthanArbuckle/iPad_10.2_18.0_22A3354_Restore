@implementation IKJSPlayer

- (IKJSPlayer)init
{
  void *v3;
  IKJSPlayer *v4;
  IKAppPlayerBridge *v5;
  void *v6;
  uint64_t v7;
  IKAppPlayerBridge *bridge;
  uint64_t v9;
  NSMutableDictionary *timeListeners;
  uint64_t v11;
  NSMutableDictionary *boundaryListeners;
  objc_super v14;

  +[IKAppContext currentAppContext](IKAppContext, "currentAppContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)IKJSPlayer;
  v4 = -[IKJSObject initWithAppContext:](&v14, sel_initWithAppContext_, v3);

  if (v4)
  {
    v5 = [IKAppPlayerBridge alloc];
    -[IKJSObject appContext](v4, "appContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[IKAppPlayerBridge initWithAppContext:jsPlayer:](v5, "initWithAppContext:jsPlayer:", v6, v4);
    bridge = v4->_bridge;
    v4->_bridge = (IKAppPlayerBridge *)v7;

    v4->_playerState = 0;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    timeListeners = v4->_timeListeners;
    v4->_timeListeners = (NSMutableDictionary *)v9;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    boundaryListeners = v4->_boundaryListeners;
    v4->_boundaryListeners = (NSMutableDictionary *)v11;

    -[IKAppPlayerBridge startObservingEvent:extraInfo:](v4->_bridge, "startObservingEvent:extraInfo:", CFSTR("stateDidChange"), 0);
  }
  return v4;
}

- (IKJSPlayer)initWithAppContext:(id)a3 bridge:(id)a4
{
  id v7;
  IKJSPlayer *v8;
  IKJSPlayer *v9;
  uint64_t v10;
  NSMutableDictionary *timeListeners;
  uint64_t v12;
  NSMutableDictionary *boundaryListeners;
  objc_super v15;

  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)IKJSPlayer;
  v8 = -[IKJSObject initWithAppContext:](&v15, sel_initWithAppContext_, a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_bridge, a4);
    v9->_playerState = 0;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    timeListeners = v9->_timeListeners;
    v9->_timeListeners = (NSMutableDictionary *)v10;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = objc_claimAutoreleasedReturnValue();
    boundaryListeners = v9->_boundaryListeners;
    v9->_boundaryListeners = (NSMutableDictionary *)v12;

  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[IKAppPlayerBridge cleanup](self->_bridge, "cleanup");
  v3.receiver = self;
  v3.super_class = (Class)IKJSPlayer;
  -[IKJSPlayer dealloc](&v3, sel_dealloc);
}

- (BOOL)dispatchEvent:(id)a3 userInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char v22;
  id v23;
  void *v24;
  void *v25;
  objc_super v26;
  objc_super v27;
  id v28;
  objc_super v29;
  objc_super v30;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "properties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("timedMetadata")))
  {
    LOBYTE(v9) = -[IKJSPlayer _timedMetadataDidChangeWithExtraInfo:](self, "_timedMetadataDidChangeWithExtraInfo:", v8);
    goto LABEL_9;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("timeDidChange")))
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("interval"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    v12 = v11;

    objc_msgSend(CFSTR("timeDidChange"), "stringByAppendingFormat:", CFSTR("_%lu"), (unint64_t)v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKJSEventListenerObject _eventInformationForType:extraInfo:](self, "_eventInformationForType:extraInfo:", v6, v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v30.receiver = self;
    v30.super_class = (Class)IKJSPlayer;
    v15 = -[IKJSEventListenerObject invokeListeners:extraInfo:](&v30, sel_invokeListeners_extraInfo_, v13, v14);
LABEL_7:
    LOBYTE(v9) = v15;

LABEL_8:
    goto LABEL_9;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("timeBoundaryDidCross")))
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("boundary"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValue");
    v18 = v17;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.3f"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("timeBoundaryDidCross"), "stringByAppendingFormat:", CFSTR("_%@"), v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[IKJSEventListenerObject _eventInformationForType:extraInfo:](self, "_eventInformationForType:extraInfo:", v6, v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v29.receiver = self;
    v29.super_class = (Class)IKJSPlayer;
    v15 = -[IKJSEventListenerObject invokeListeners:extraInfo:](&v29, sel_invokeListeners_extraInfo_, v13, v14);
    goto LABEL_7;
  }
  v22 = objc_opt_respondsToSelector();
  -[IKJSEventListenerObject _eventInformationForType:extraInfo:](self, "_eventInformationForType:extraInfo:", v6, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v22 & 1) == 0)
  {
    v26.receiver = self;
    v26.super_class = (Class)IKJSPlayer;
    LOBYTE(v9) = -[IKJSEventListenerObject invokeListeners:extraInfo:](&v26, sel_invokeListeners_extraInfo_, v6, v13);
    goto LABEL_8;
  }
  v27.receiver = self;
  v27.super_class = (Class)IKJSPlayer;
  v28 = 0;
  v9 = -[IKJSEventListenerObject invokeSingleListener:extraInfo:return:](&v27, sel_invokeSingleListener_extraInfo_return_, v6, v13, &v28);
  v23 = v28;

  if (v9)
  {
    -[IKJSObject appContext](self, "appContext");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "jsContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "processReturnJSValue:inContext:", v23, v25);

  }
LABEL_9:
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("stateDidChange")))
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("state"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    self->_playerState = +[IKPlayerStateChangeEventUserInfo stateForStateName:](IKPlayerStateChangeEventUserInfo, "stateForStateName:", v20);

    if (self->_playerState == 8)
      -[IKJSPlayer _removeManagedReference](self, "_removeManagedReference");
  }

  return v9;
}

- (void)setOverlayDocument:(id)a3
{
  -[IKAppPlayerBridge setOverlayDocument:](self->_bridge, "setOverlayDocument:", a3);
}

- (IKDOMDocument)overlayDocument
{
  return -[IKAppPlayerBridge overlayDocument](self->_bridge, "overlayDocument");
}

- (BOOL)interactiveOverlayDismissable
{
  return -[IKAppPlayerBridge interactiveOverlayDismissable](self->_bridge, "interactiveOverlayDismissable");
}

- (void)setInteractiveOverlayDismissable:(BOOL)a3
{
  -[IKAppPlayerBridge setInteractiveOverlayDismissable:](self->_bridge, "setInteractiveOverlayDismissable:", a3);
}

- (void)setInteractiveOverlayDocument:(id)a3
{
  -[IKAppPlayerBridge setInteractiveOverlayDocument:](self->_bridge, "setInteractiveOverlayDocument:", a3);
}

- (IKDOMDocument)interactiveOverlayDocument
{
  return -[IKAppPlayerBridge interactiveOverlayDocument](self->_bridge, "interactiveOverlayDocument");
}

- (IKJSPlaylist)playlist
{
  return self->_playlist;
}

- (void)setPlaylist:(id)a3
{
  IKJSPlaylist *v4;
  void *v5;
  void *v6;
  IKJSPlaylist *playlist;
  IKJSPlaylist *v8;
  IKAppPlayerBridge *bridge;
  void *v10;
  void *v11;
  id v12;

  v4 = (IKJSPlaylist *)a3;
  -[IKJSObject appContext](self, "appContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "jsContext");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (self->_playlist)
  {
    objc_msgSend(v12, "virtualMachine");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeManagedReference:withOwner:", self->_playlist, self);

  }
  playlist = self->_playlist;
  self->_playlist = v4;
  v8 = v4;

  bridge = self->_bridge;
  -[IKJSPlaylist bridge](v8, "bridge");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKAppPlayerBridge setPlaylist:](bridge, "setPlaylist:", v10);

  objc_msgSend(v12, "virtualMachine");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addManagedReference:withOwner:", self->_playlist, self);

}

- (NSDictionary)userInfo
{
  return -[IKAppPlayerBridge userInfo](self->_bridge, "userInfo");
}

- (void)setUserInfo:(id)a3
{
  -[IKAppPlayerBridge setUserInfo:](self->_bridge, "setUserInfo:", a3);
}

- (void)seekToTime:(double)a3
{
  -[IKAppPlayerBridge setElapsedTime:](self->_bridge, "setElapsedTime:", a3);
}

- (NSDate)currentMediaItemDate
{
  return -[IKAppPlayerBridge currentMediaItemDate](self->_bridge, "currentMediaItemDate");
}

- (NSNumber)currentMediaItemDuration
{
  return -[IKAppPlayerBridge currentMediaItemDuration](self->_bridge, "currentMediaItemDuration");
}

- (IKJSMediaItem)currentMediaItem
{
  void *v2;
  void *v3;
  void *v4;

  -[IKAppPlayerBridge currentMediaItem](self->_bridge, "currentMediaItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "jsMediaItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (IKJSMediaItem *)v4;
}

- (IKJSMediaItem)nextMediaItem
{
  void *v2;
  void *v3;
  void *v4;

  -[IKAppPlayerBridge nextMediaItem](self->_bridge, "nextMediaItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "jsMediaItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (IKJSMediaItem *)v4;
}

- (IKJSMediaItem)previousMediaItem
{
  void *v2;
  void *v3;
  void *v4;

  -[IKAppPlayerBridge previousMediaItem](self->_bridge, "previousMediaItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "jsMediaItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (IKJSMediaItem *)v4;
}

- (NSArray)currentMediaItemAccessLogs
{
  return -[IKAppPlayerBridge currentMediaItemAccessLogs](self->_bridge, "currentMediaItemAccessLogs");
}

- (NSArray)currentMediaItemErrorLogs
{
  return -[IKAppPlayerBridge currentMediaItemErrorLogs](self->_bridge, "currentMediaItemErrorLogs");
}

- (BOOL)showsResumeMenu
{
  return -[IKAppPlayerBridge showsResumeMenu](self->_bridge, "showsResumeMenu");
}

- (void)setShowsResumeMenu:(BOOL)a3
{
  -[IKAppPlayerBridge setShowsResumeMenu:](self->_bridge, "setShowsResumeMenu:", a3);
}

- (BOOL)muted
{
  return -[IKAppPlayerBridge muted](self->_bridge, "muted");
}

- (void)setMuted:(BOOL)a3
{
  -[IKAppPlayerBridge setMuted:](self->_bridge, "setMuted:", a3);
}

- (NSDictionary)contextMenuData
{
  return -[IKAppPlayerBridge contextMenuData](self->_bridge, "contextMenuData");
}

- (void)setContextMenuData:(id)a3
{
  -[IKAppPlayerBridge setContextMenuData:](self->_bridge, "setContextMenuData:", a3);
}

- (int64_t)state
{
  return self->_playerState;
}

- (void)present
{
  -[IKAppPlayerBridge present](self->_bridge, "present");
  -[IKJSPlayer _addManagedReference](self, "_addManagedReference");
}

- (void)play
{
  -[IKAppPlayerBridge play](self->_bridge, "play");
  -[IKJSPlayer _addManagedReference](self, "_addManagedReference");
}

- (void)pause
{
  -[IKAppPlayerBridge pause](self->_bridge, "pause");
}

- (void)stop
{
  -[IKAppPlayerBridge stop](self->_bridge, "stop");
}

- (void)next
{
  -[IKAppPlayerBridge next](self->_bridge, "next");
}

- (void)previous
{
  -[IKAppPlayerBridge previous](self->_bridge, "previous");
}

- (void)changeToMediaAtIndex:(unint64_t)a3
{
  -[IKAppPlayerBridge changeToMediaAtIndex:](self->_bridge, "changeToMediaAtIndex:", a3);
}

- (double)playbackRate
{
  double result;

  -[IKAppPlayerBridge scanRate](self->_bridge, "scanRate");
  return result;
}

- (void)setPlaybackRate:(double)a3
{
  -[IKAppPlayerBridge scan:](self->_bridge, "scan:", a3);
}

- (NSString)playbackState
{
  return (NSString *)+[IKPlayerStateChangeEventUserInfo stateNameForState:](IKPlayerStateChangeEventUserInfo, "stateNameForState:", self->_playerState);
}

- (void)addEventListener:(id)a3 :(id)a4 :(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSMutableDictionary *timeListeners;
  void *v13;
  uint64_t v14;
  void *v15;
  NSMutableDictionary *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  void *v39;
  char v40;
  void *v41;
  IKAppPlayerBridge *v42;
  void *v43;
  void *v44;
  void *v45;
  IKAppPlayerBridge *v46;
  void *v47;
  IKAppPlayerBridge *bridge;
  void *v49;
  void *v50;
  NSMutableDictionary *v51;
  NSMutableDictionary *timedMetadataListeners;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t i;
  uint64_t v57;
  void *v58;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t j;
  void *v65;
  char v66;
  void *v67;
  IKAppPlayerBridge *v68;
  void *v69;
  id v70;
  id v71;
  id v72;
  char v73;
  char v74;
  id obj;
  id obja;
  id v77;
  id v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  objc_super v85;
  objc_super v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  objc_super v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  objc_super v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  const __CFString *v109;
  id v110;
  _BYTE v111[128];
  _BYTE v112[128];
  const __CFString *v113;
  void *v114;
  _BYTE v115[128];
  _BYTE v116[128];
  const __CFString *v117;
  void *v118;
  _BYTE v119[128];
  uint64_t v120;

  v120 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("timeDidChange")))
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("interval"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "toNumber");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8 || !objc_msgSend(v11, "unsignedIntegerValue"))
      goto LABEL_52;
    v77 = v9;
    v70 = v7;
    objc_msgSend(CFSTR("timeDidChange"), "stringByAppendingFormat:", CFSTR("_%lu"), objc_msgSend(v11, "unsignedIntegerValue"));
    v82 = objc_claimAutoreleasedReturnValue();
    timeListeners = self->_timeListeners;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v11, "unsignedIntegerValue"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](timeListeners, "objectForKey:", v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v14;
    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = self->_timeListeners;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v11, "unsignedIntegerValue"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v16, "setObject:forKey:", v15, v17);

    }
    v107 = 0u;
    v108 = 0u;
    v105 = 0u;
    v106 = 0u;
    v18 = v15;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v105, v119, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v106;
LABEL_8:
      v22 = 0;
      while (1)
      {
        if (*(_QWORD *)v106 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(*((_QWORD *)&v105 + 1) + 8 * v22), "value");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "isEqual:", v8);

        if ((v24 & 1) != 0)
          break;
        if (v20 == ++v22)
        {
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v105, v119, 16);
          if (v20)
            goto LABEL_8;
          goto LABEL_14;
        }
      }

      v26 = (void *)v82;
      if (v14)
        goto LABEL_51;
    }
    else
    {
LABEL_14:

      objc_msgSend(MEMORY[0x1E0CBE0F8], "managedValueWithValue:andOwner:", v8, self);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObject:", v25);

      v104.receiver = self;
      v104.super_class = (Class)IKJSPlayer;
      v26 = (void *)v82;
      -[IKJSEventListenerObject addEventListener:::](&v104, sel_addEventListener_::, v82, v8, v77);
      if (v14)
      {
LABEL_51:

        v7 = v70;
        v9 = v77;
LABEL_52:

        goto LABEL_53;
      }
    }
    bridge = self->_bridge;
    v117 = CFSTR("intervals");
    -[NSMutableDictionary allKeys](self->_timeListeners, "allKeys");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v118 = v49;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v118, &v117, 1);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKAppPlayerBridge startObservingEvent:extraInfo:](bridge, "startObservingEvent:extraInfo:", v70, v50);

    goto LABEL_51;
  }
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("timeBoundaryDidCross")))
  {
    if (!objc_msgSend(v7, "isEqualToString:", CFSTR("timedMetadata")))
    {
      v85.receiver = self;
      v85.super_class = (Class)IKJSPlayer;
      -[IKJSEventListenerObject addEventListener:::](&v85, sel_addEventListener_::, v7, v8, v9);
      v46 = self->_bridge;
      if ((objc_msgSend(v9, "isObject") & 1) != 0)
      {
        objc_msgSend(v9, "toObject");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[IKAppPlayerBridge startObservingEvent:extraInfo:](v46, "startObservingEvent:extraInfo:", v7, v47);

      }
      else
      {
        -[IKAppPlayerBridge startObservingEvent:extraInfo:](v46, "startObservingEvent:extraInfo:", v7, 0);
      }
      goto LABEL_53;
    }
    if ((objc_msgSend(v9, "isArray") & 1) == 0
      && (objc_msgSend(v9, "isNull") & 1) == 0
      && !objc_msgSend(v9, "isUndefined"))
    {
      goto LABEL_53;
    }
    if (objc_msgSend(v9, "isArray"))
    {
      objc_msgSend(v9, "toArray");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v45 = 0;
    }
    if (!self->_timedMetadataListeners)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v51 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      timedMetadataListeners = self->_timedMetadataListeners;
      self->_timedMetadataListeners = v51;

    }
    if (!v45)
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("all"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v93 = 0u;
    v94 = 0u;
    v91 = 0u;
    v92 = 0u;
    v53 = v45;
    v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v91, v112, 16);
    obja = v53;
    if (v54)
    {
      v55 = v54;
      v72 = v7;
      v74 = 0;
      v79 = v9;
      v81 = *(_QWORD *)v92;
      do
      {
        for (i = 0; i != v55; ++i)
        {
          if (*(_QWORD *)v92 != v81)
            objc_enumerationMutation(obja);
          v57 = *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * i);
          objc_msgSend(CFSTR("timedMetadata"), "stringByAppendingFormat:", CFSTR("_%@"), v57);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKey:](self->_timedMetadataListeners, "objectForKey:", v57);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v59)
          {
            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKey:](self->_timedMetadataListeners, "setObject:forKey:", v59, v57);
            v74 = 1;
          }
          v89 = 0u;
          v90 = 0u;
          v87 = 0u;
          v88 = 0u;
          v60 = v59;
          v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v87, v111, 16);
          if (v61)
          {
            v62 = v61;
            v63 = *(_QWORD *)v88;
            while (2)
            {
              for (j = 0; j != v62; ++j)
              {
                if (*(_QWORD *)v88 != v63)
                  objc_enumerationMutation(v60);
                objc_msgSend(*(id *)(*((_QWORD *)&v87 + 1) + 8 * j), "value");
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                v66 = objc_msgSend(v65, "isEqual:", v8);

                if ((v66 & 1) != 0)
                {

                  goto LABEL_77;
                }
              }
              v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v87, v111, 16);
              if (v62)
                continue;
              break;
            }
          }

          objc_msgSend(MEMORY[0x1E0CBE0F8], "managedValueWithValue:andOwner:", v8, self);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "addObject:", v67);

          v86.receiver = self;
          v86.super_class = (Class)IKJSPlayer;
          -[IKJSEventListenerObject addEventListener:::](&v86, sel_addEventListener_::, v58, v8, v79);
LABEL_77:

        }
        v55 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v91, v112, 16);
      }
      while (v55);

      v7 = v72;
      v9 = v79;
      if ((v74 & 1) == 0)
        goto LABEL_82;
      v68 = self->_bridge;
      v109 = CFSTR("keys");
      -[NSMutableDictionary allKeys](self->_timedMetadataListeners, "allKeys");
      v53 = (id)objc_claimAutoreleasedReturnValue();
      v110 = v53;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v110, &v109, 1);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      -[IKAppPlayerBridge startObservingEvent:extraInfo:](v68, "startObservingEvent:extraInfo:", v72, v69);

    }
LABEL_82:

    goto LABEL_53;
  }
  objc_msgSend(v9, "toArray");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (v27)
    {
      v102 = 0u;
      v103 = 0u;
      v100 = 0u;
      v101 = 0u;
      obj = v27;
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v100, v116, 16);
      v27 = obj;
      v83 = v28;
      if (v28)
      {
        v71 = v7;
        v73 = 0;
        v78 = v9;
        v80 = *(_QWORD *)v101;
        do
        {
          v29 = 0;
          do
          {
            if (*(_QWORD *)v101 != v80)
              objc_enumerationMutation(obj);
            v30 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * v29);
            objc_msgSend(v30, "doubleValue");
            objc_msgSend(CFSTR("timeBoundaryDidCross"), "stringByAppendingFormat:", CFSTR("_%.3f"), v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary objectForKey:](self->_boundaryListeners, "objectForKey:", v30);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v33)
            {
              objc_msgSend(MEMORY[0x1E0C99E20], "set");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKey:](self->_boundaryListeners, "setObject:forKey:", v33, v30);
              v73 = 1;
            }
            v98 = 0u;
            v99 = 0u;
            v96 = 0u;
            v97 = 0u;
            v34 = v33;
            v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v96, v115, 16);
            if (v35)
            {
              v36 = v35;
              v37 = *(_QWORD *)v97;
              while (2)
              {
                for (k = 0; k != v36; ++k)
                {
                  if (*(_QWORD *)v97 != v37)
                    objc_enumerationMutation(v34);
                  objc_msgSend(*(id *)(*((_QWORD *)&v96 + 1) + 8 * k), "value");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  v40 = objc_msgSend(v39, "isEqual:", v8);

                  if ((v40 & 1) != 0)
                  {

                    goto LABEL_36;
                  }
                }
                v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v96, v115, 16);
                if (v36)
                  continue;
                break;
              }
            }

            objc_msgSend(MEMORY[0x1E0CBE0F8], "managedValueWithValue:andOwner:", v8, self);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "addObject:", v41);

            v95.receiver = self;
            v95.super_class = (Class)IKJSPlayer;
            -[IKJSEventListenerObject addEventListener:::](&v95, sel_addEventListener_::, v32, v8, v78);
LABEL_36:

            ++v29;
          }
          while (v29 != v83);
          v83 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v116, 16);
        }
        while (v83);
        v7 = v71;
        v27 = obj;
        v9 = v78;
        if ((v73 & 1) != 0)
        {
          v42 = self->_bridge;
          v113 = CFSTR("boundaries");
          -[NSMutableDictionary allKeys](self->_boundaryListeners, "allKeys");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v114 = v43;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v114, &v113, 1);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          -[IKAppPlayerBridge startObservingEvent:extraInfo:](v42, "startObservingEvent:extraInfo:", v71, v44);

          v27 = obj;
        }
      }
    }
  }

LABEL_53:
}

- (void)removeEventListener:(id)a3 :(id)a4
{
  id v6;
  id v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  IKAppPlayerBridge *bridge;
  void *v28;
  void *v29;
  void **v30;
  const __CFString **v31;
  uint64_t k;
  void *v33;
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  char v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t m;
  uint64_t v48;
  void *v49;
  uint64_t n;
  uint64_t v51;
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t ii;
  void *v58;
  void *v59;
  char v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t jj;
  uint64_t v66;
  IKAppPlayerBridge *v67;
  void *v68;
  void *v69;
  id v70;
  id v71;
  id v72;
  void *v73;
  void *v74;
  char *v75;
  id obj;
  id obja;
  id objb;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  IKJSPlayer *v85;
  objc_super v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  objc_super v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  objc_super v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  const __CFString *v125;
  void *v126;
  _BYTE v127[128];
  _BYTE v128[128];
  _BYTE v129[128];
  const __CFString *v130;
  void *v131;
  _BYTE v132[128];
  _BYTE v133[128];
  _BYTE v134[128];
  const __CFString *v135;
  void *v136;
  _BYTE v137[128];
  _BYTE v138[128];
  _BYTE v139[128];
  uint64_t v140;

  v140 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v85 = self;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("timeDidChange")))
  {
    v70 = v6;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v121 = 0u;
    v122 = 0u;
    v123 = 0u;
    v124 = 0u;
    -[NSMutableDictionary allKeys](self->_timeListeners, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v121, v139, 16);
    if (v82)
    {
      v79 = *(_QWORD *)v122;
      do
      {
        for (i = 0; i != v82; ++i)
        {
          if (*(_QWORD *)v122 != v79)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * i);
          -[NSMutableDictionary objectForKey:](self->_timeListeners, "objectForKey:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v117 = 0u;
          v118 = 0u;
          v119 = 0u;
          v120 = 0u;
          v11 = v10;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v117, v138, 16);
          v13 = v11;
          if (v12)
          {
            v14 = v12;
            v15 = *(_QWORD *)v118;
LABEL_9:
            v16 = 0;
            while (1)
            {
              if (*(_QWORD *)v118 != v15)
                objc_enumerationMutation(v11);
              v17 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * v16);
              objc_msgSend(v17, "value");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v18, "isEqual:", v7);

              if ((v19 & 1) != 0)
                break;
              if (v14 == ++v16)
              {
                v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v117, v138, 16);
                if (v14)
                  goto LABEL_9;
                v13 = v11;
                self = v85;
                goto LABEL_20;
              }
            }
            v13 = v17;

            self = v85;
            if (!v13)
              goto LABEL_21;
            objc_msgSend(v11, "removeObject:", v13);
            objc_msgSend(CFSTR("timeDidChange"), "stringByAppendingFormat:", CFSTR("_%lu"), objc_msgSend(v9, "unsignedIntegerValue"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v116.receiver = v85;
            v116.super_class = (Class)IKJSPlayer;
            -[IKJSEventListenerObject removeEventListener::](&v116, sel_removeEventListener::, v20, v7);
            if (!objc_msgSend(v11, "count"))
              objc_msgSend(v73, "addObject:", v9);

          }
LABEL_20:

LABEL_21:
        }
        v82 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v121, v139, 16);
      }
      while (v82);
    }

    v114 = 0u;
    v115 = 0u;
    v112 = 0u;
    v113 = 0u;
    v21 = v73;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v112, v137, 16);
    v6 = v70;
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v113;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v113 != v24)
            objc_enumerationMutation(v21);
          -[NSMutableDictionary removeObjectForKey:](self->_timeListeners, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v112 + 1) + 8 * j));
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v112, v137, 16);
      }
      while (v23);
    }

    if (!objc_msgSend(v21, "count"))
      goto LABEL_103;
    v26 = -[NSMutableDictionary count](self->_timeListeners, "count");
    bridge = self->_bridge;
    if (v26)
    {
      v135 = CFSTR("intervals");
      -[NSMutableDictionary allKeys](self->_timeListeners, "allKeys");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v136 = v28;
      v29 = (void *)MEMORY[0x1E0C99D80];
      v30 = &v136;
      v31 = &v135;
LABEL_67:
      objc_msgSend(v29, "dictionaryWithObjects:forKeys:count:", v30, v31, 1);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[IKAppPlayerBridge startObservingEvent:extraInfo:](bridge, "startObservingEvent:extraInfo:", v6, v49);

LABEL_103:
      goto LABEL_104;
    }
    goto LABEL_99;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("timeBoundaryDidCross")))
  {
    v71 = v6;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = 0u;
    v109 = 0u;
    v110 = 0u;
    v111 = 0u;
    -[NSMutableDictionary allKeys](self->_boundaryListeners, "allKeys");
    obja = (id)objc_claimAutoreleasedReturnValue();
    v83 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v108, v134, 16);
    if (v83)
    {
      v80 = *(_QWORD *)v109;
      do
      {
        for (k = 0; k != v83; ++k)
        {
          if (*(_QWORD *)v109 != v80)
            objc_enumerationMutation(obja);
          v33 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * k);
          -[NSMutableDictionary objectForKey:](self->_boundaryListeners, "objectForKey:", v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v104 = 0u;
          v105 = 0u;
          v106 = 0u;
          v107 = 0u;
          v35 = v34;
          v36 = (id)objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v104, v133, 16);
          if (v36)
          {
            v37 = *(_QWORD *)v105;
LABEL_41:
            v38 = 0;
            while (1)
            {
              if (*(_QWORD *)v105 != v37)
                objc_enumerationMutation(v35);
              v39 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * v38);
              objc_msgSend(v39, "value");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = objc_msgSend(v40, "isEqual:", v7);

              if ((v41 & 1) != 0)
                break;
              if (v36 == (id)++v38)
              {
                v36 = (id)objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v104, v133, 16);
                if (v36)
                  goto LABEL_41;
                v42 = v35;
                self = v85;
                goto LABEL_51;
              }
            }
            v36 = v39;

            if (v36)
            {
              objc_msgSend(v35, "removeObject:", v36);
              objc_msgSend(v33, "doubleValue");
              objc_msgSend(CFSTR("timeBoundaryDidCross"), "stringByAppendingFormat:", CFSTR("_%.3f"), v43);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              self = v85;
              v103.receiver = v85;
              v103.super_class = (Class)IKJSPlayer;
              -[IKJSEventListenerObject removeEventListener::](&v103, sel_removeEventListener::, v42, v7);
              goto LABEL_51;
            }
            self = v85;
          }
          else
          {
            v42 = v35;
LABEL_51:

          }
          if (!objc_msgSend(v35, "count"))
            objc_msgSend(v74, "addObject:", v33);

        }
        v83 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v108, v134, 16);
      }
      while (v83);
    }

    v101 = 0u;
    v102 = 0u;
    v99 = 0u;
    v100 = 0u;
    v21 = v74;
    v44 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v99, v132, 16);
    v6 = v71;
    if (v44)
    {
      v45 = v44;
      v46 = *(_QWORD *)v100;
      do
      {
        for (m = 0; m != v45; ++m)
        {
          if (*(_QWORD *)v100 != v46)
            objc_enumerationMutation(v21);
          -[NSMutableDictionary removeObjectForKey:](self->_boundaryListeners, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * m));
        }
        v45 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v99, v132, 16);
      }
      while (v45);
    }

    if (!objc_msgSend(v21, "count"))
      goto LABEL_103;
    v48 = -[NSMutableDictionary count](self->_boundaryListeners, "count");
    bridge = self->_bridge;
    if (v48)
    {
      v130 = CFSTR("boundaries");
      -[NSMutableDictionary allKeys](self->_boundaryListeners, "allKeys");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v131 = v28;
      v29 = (void *)MEMORY[0x1E0C99D80];
      v30 = &v131;
      v31 = &v130;
      goto LABEL_67;
    }
LABEL_99:
    -[IKAppPlayerBridge stopObservingEvent:](bridge, "stopObservingEvent:", v6);
    goto LABEL_103;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("timedMetadata")))
  {
    v72 = v6;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v75 = (char *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary allKeys](self->_timedMetadataListeners, "allKeys");
    v95 = 0u;
    v96 = 0u;
    v97 = 0u;
    v98 = 0u;
    objb = (id)objc_claimAutoreleasedReturnValue();
    v84 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v95, v129, 16);
    if (v84)
    {
      v81 = *(_QWORD *)v96;
      do
      {
        for (n = 0; n != v84; ++n)
        {
          if (*(_QWORD *)v96 != v81)
            objc_enumerationMutation(objb);
          v51 = *(_QWORD *)(*((_QWORD *)&v95 + 1) + 8 * n);
          -[NSMutableDictionary objectForKey:](self->_timedMetadataListeners, "objectForKey:", v51);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v91 = 0u;
          v92 = 0u;
          v93 = 0u;
          v94 = 0u;
          v53 = v52;
          v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v91, v128, 16);
          if (v54)
          {
            v55 = v54;
            v56 = *(_QWORD *)v92;
            while (2)
            {
              for (ii = 0; ii != v55; ++ii)
              {
                if (*(_QWORD *)v92 != v56)
                  objc_enumerationMutation(v53);
                v58 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * ii);
                objc_msgSend(v58, "value");
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                v60 = objc_msgSend(v59, "isEqual:", v7);

                if ((v60 & 1) != 0)
                {
                  v61 = v58;

                  if (v61)
                    objc_msgSend(v53, "removeObject:", v61);
                  goto LABEL_85;
                }
              }
              v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v91, v128, 16);
              if (v55)
                continue;
              break;
            }
          }

          v61 = 0;
LABEL_85:
          self = v85;
          if (!objc_msgSend(v53, "count"))
            objc_msgSend(v75, "addObject:", v51);

        }
        v84 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v95, v129, 16);
      }
      while (v84);
    }
    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = 0u;
    v21 = v75;
    v62 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v87, v127, 16);
    v6 = v72;
    if (v62)
    {
      v63 = v62;
      v64 = *(_QWORD *)v88;
      do
      {
        for (jj = 0; jj != v63; ++jj)
        {
          if (*(_QWORD *)v88 != v64)
            objc_enumerationMutation(v21);
          -[NSMutableDictionary removeObjectForKey:](self->_timedMetadataListeners, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * jj));
        }
        v63 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v87, v127, 16);
      }
      while (v63);
    }

    if (objc_msgSend(v21, "count"))
    {
      v66 = -[NSMutableDictionary count](self->_timedMetadataListeners, "count");
      v67 = self->_bridge;
      if (v66)
      {
        v125 = CFSTR("keys");
        -[NSMutableDictionary allKeys](self->_timedMetadataListeners, "allKeys");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v126 = v68;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v126, &v125, 1);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        -[IKAppPlayerBridge startObservingEvent:extraInfo:](v67, "startObservingEvent:extraInfo:", v72, v69);

      }
      else
      {
        -[IKAppPlayerBridge stopObservingEvent:](self->_bridge, "stopObservingEvent:", v72);
      }
    }

    goto LABEL_103;
  }
  v86.receiver = self;
  v86.super_class = (Class)IKJSPlayer;
  -[IKJSEventListenerObject removeEventListener::](&v86, sel_removeEventListener::, v6, v7);
  -[IKAppPlayerBridge stopObservingEvent:](self->_bridge, "stopObservingEvent:", v6);
LABEL_104:

}

- (void)_addManagedReference
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (!self->_holdingSelfReference)
  {
    self->_holdingSelfReference = 1;
    -[IKJSObject appContext](self, "appContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "jsContext");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "virtualMachine");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKJSObject appContext](self, "appContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "jsContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("App"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addManagedReference:withOwner:", self, v7);

  }
}

- (void)_removeManagedReference
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (self->_holdingSelfReference)
  {
    self->_holdingSelfReference = 0;
    -[IKJSObject appContext](self, "appContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "jsContext");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "virtualMachine");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKJSObject appContext](self, "appContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "jsContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("App"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeManagedReference:withOwner:", self, v7);

  }
}

- (BOOL)_timedMetadataDidChangeWithExtraInfo:(id)a3
{
  id v4;
  NSMutableDictionary *timedMetadataListeners;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  BOOL v19;
  void *v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  timedMetadataListeners = self->_timedMetadataListeners;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("key"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](timedMetadataListeners, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  -[NSMutableDictionary objectForKey:](self->_timedMetadataListeners, "objectForKey:", CFSTR("all"));
  v9 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v9;
  if (v9)
  {
    v10 = v9;
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 1, v9);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "unionSet:", v10, v21);
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v8;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "value", v21);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[IKJSEventListenerObject _eventInformationForType:extraInfo:](self, "_eventInformationForType:extraInfo:", CFSTR("timedMetadata"), v4);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v16;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (id)objc_msgSend(v15, "callWithArguments:", v17);

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v12);
  }

  v19 = objc_msgSend(obj, "count") != 0;
  return v19;
}

- (IKAppPlayerBridge)bridge
{
  return self->_bridge;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bridge, 0);
  objc_storeStrong((id *)&self->_boundaryListeners, 0);
  objc_storeStrong((id *)&self->_timeListeners, 0);
  objc_storeStrong((id *)&self->_timedMetadataListeners, 0);
  objc_storeStrong((id *)&self->_playlist, 0);
}

@end
