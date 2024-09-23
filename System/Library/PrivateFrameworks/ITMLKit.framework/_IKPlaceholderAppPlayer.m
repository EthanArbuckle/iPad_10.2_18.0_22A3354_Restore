@implementation _IKPlaceholderAppPlayer

- (void)transferValuesToAppPlayer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_IKPlaceholderAppPlayer playlist](self, "playlist");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPlaylist:", v5);

  objc_msgSend(v4, "setMuted:", -[_IKPlaceholderAppPlayer muted](self, "muted"));
  objc_msgSend(v4, "setShowsResumeMenu:", -[_IKPlaceholderAppPlayer showsResumeMenu](self, "showsResumeMenu"));
  -[_IKPlaceholderAppPlayer overlayDocument](self, "overlayDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOverlayDocument:", v6);

  -[_IKPlaceholderAppPlayer interactiveOverlayDocument](self, "interactiveOverlayDocument");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInteractiveOverlayDocument:", v7);

  objc_msgSend(v4, "setInteractiveOverlayDismissable:", -[_IKPlaceholderAppPlayer interactiveOverlayDismissable](self, "interactiveOverlayDismissable"));
  -[_IKPlaceholderAppPlayer contextMenuData](self, "contextMenuData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContextMenuData:", v8);

  -[_IKPlaceholderAppPlayer userInfo](self, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInfo:", v9);

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[NSMutableDictionary allKeys](self->_eventExtraInfoByEvent, "allKeys", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_eventExtraInfoByEvent, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16 == v17)
          v18 = 0;
        else
          v18 = v16;
        objc_msgSend(v4, "startObservingEvent:extraInfo:", v15, v18);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

}

- (void)startObservingEvent:(id)a3 extraInfo:(id)a4
{
  id v6;
  void *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *eventExtraInfoByEvent;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = v6;
  if (!self->_eventExtraInfoByEvent)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
    v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    eventExtraInfoByEvent = self->_eventExtraInfoByEvent;
    self->_eventExtraInfoByEvent = v8;

    if (v7)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_eventExtraInfoByEvent, "setObject:forKeyedSubscript:", v10, v11);

    goto LABEL_6;
  }
  if (!v6)
    goto LABEL_5;
LABEL_3:
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_eventExtraInfoByEvent, "setObject:forKeyedSubscript:", v7, v11);
LABEL_6:

}

- (void)stopObservingEvent:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_eventExtraInfoByEvent, "removeObjectForKey:", a3);
}

- (IKAppPlayerBridge)bridge
{
  return self->bridge;
}

- (int64_t)state
{
  return self->state;
}

- (IKAppPlaylist)playlist
{
  return self->playlist;
}

- (void)setPlaylist:(id)a3
{
  objc_storeStrong((id *)&self->playlist, a3);
}

- (NSNumber)currentMediaItemDuration
{
  return self->currentMediaItemDuration;
}

- (NSDate)currentMediaItemDate
{
  return self->currentMediaItemDate;
}

- (IKAppMediaItem)currentMediaItem
{
  return self->currentMediaItem;
}

- (double)scanRate
{
  return self->scanRate;
}

- (BOOL)muted
{
  return self->muted;
}

- (void)setMuted:(BOOL)a3
{
  self->muted = a3;
}

- (BOOL)showsResumeMenu
{
  return self->showsResumeMenu;
}

- (void)setShowsResumeMenu:(BOOL)a3
{
  self->showsResumeMenu = a3;
}

- (IKAppMediaItem)nextMediaItem
{
  return self->nextMediaItem;
}

- (IKAppMediaItem)previousMediaItem
{
  return self->previousMediaItem;
}

- (IKAppDocument)overlayDocument
{
  return self->overlayDocument;
}

- (void)setOverlayDocument:(id)a3
{
  objc_storeStrong((id *)&self->overlayDocument, a3);
}

- (IKAppDocument)interactiveOverlayDocument
{
  return self->interactiveOverlayDocument;
}

- (void)setInteractiveOverlayDocument:(id)a3
{
  objc_storeStrong((id *)&self->interactiveOverlayDocument, a3);
}

- (BOOL)interactiveOverlayDismissable
{
  return self->interactiveOverlayDismissable;
}

- (void)setInteractiveOverlayDismissable:(BOOL)a3
{
  self->interactiveOverlayDismissable = a3;
}

- (NSArray)currentMediaItemAccessLogs
{
  return self->currentMediaItemAccessLogs;
}

- (NSArray)currentMediaItemErrorLogs
{
  return self->currentMediaItemErrorLogs;
}

- (NSDictionary)contextMenuData
{
  return self->contextMenuData;
}

- (void)setContextMenuData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSDictionary)userInfo
{
  return self->userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->userInfo, 0);
  objc_storeStrong((id *)&self->contextMenuData, 0);
  objc_storeStrong((id *)&self->currentMediaItemErrorLogs, 0);
  objc_storeStrong((id *)&self->currentMediaItemAccessLogs, 0);
  objc_storeStrong((id *)&self->interactiveOverlayDocument, 0);
  objc_storeStrong((id *)&self->overlayDocument, 0);
  objc_storeStrong((id *)&self->previousMediaItem, 0);
  objc_storeStrong((id *)&self->nextMediaItem, 0);
  objc_storeStrong((id *)&self->currentMediaItem, 0);
  objc_storeStrong((id *)&self->currentMediaItemDate, 0);
  objc_storeStrong((id *)&self->currentMediaItemDuration, 0);
  objc_storeStrong((id *)&self->playlist, 0);
  objc_storeStrong((id *)&self->bridge, 0);
  objc_storeStrong((id *)&self->_eventExtraInfoByEvent, 0);
}

@end
