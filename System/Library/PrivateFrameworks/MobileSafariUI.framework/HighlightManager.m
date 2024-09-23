@implementation HighlightManager

- (void)loadLinkMetadataForMessageWithGUID:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  SafariSandboxBrokerConnection *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(SafariSandboxBrokerConnection);
  -[WBSUISafariSandboxBrokerConnection getLinkMetadataForMessageWithGUID:completionHandler:](v7, "getLinkMetadataForMessageWithGUID:completionHandler:", v6, v5);

}

- (void)setPresenter:(id)a3 forHighlightIdentifier:(id)a4
{
  id v6;
  NSMutableDictionary *highlightToPresentersMap;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *highlightToBackForwardListItemsMap;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v6 = a4;
  highlightToPresentersMap = self->_highlightToPresentersMap;
  if (!highlightToPresentersMap)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v9 = self->_highlightToPresentersMap;
    self->_highlightToPresentersMap = v8;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    highlightToBackForwardListItemsMap = self->_highlightToBackForwardListItemsMap;
    self->_highlightToBackForwardListItemsMap = v10;

    highlightToPresentersMap = self->_highlightToPresentersMap;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](highlightToPresentersMap, "objectForKeyedSubscript:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_highlightToPresentersMap, "setObject:forKeyedSubscript:", v13, v6);

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_highlightToBackForwardListItemsMap, "setObject:forKeyedSubscript:", v14, v6);

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_highlightToPresentersMap, "objectForKeyedSubscript:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v18);

  -[NSMutableDictionary objectForKeyedSubscript:](self->_highlightToBackForwardListItemsMap, "objectForKeyedSubscript:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "currentBackForwardListItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", v17);

}

- (void)_handleRemovalOfHighlights:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id obj;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v4)
  {
    v5 = v4;
    v22 = *(_QWORD *)v32;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v32 != v22)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v6);
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        -[NSMutableDictionary objectForKeyedSubscript:](self->_highlightToPresentersMap, "objectForKeyedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "allObjects");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v28;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v28 != v12)
                objc_enumerationMutation(v9);
              objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v13++), "hideBannerForHighlightIdentifier:", v7);
            }
            while (v11 != v13);
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
          }
          while (v11);
        }

        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        -[NSMutableDictionary objectForKeyedSubscript:](self->_highlightToBackForwardListItemsMap, "objectForKeyedSubscript:", v7);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "allObjects");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v24;
          do
          {
            v19 = 0;
            do
            {
              if (*(_QWORD *)v24 != v18)
                objc_enumerationMutation(v15);
              objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v19++), "safari_setHighlight:", 0);
            }
            while (v17 != v19);
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
          }
          while (v17);
        }

        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_highlightToPresentersMap, "setObject:forKeyedSubscript:", 0, v7);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_highlightToBackForwardListItemsMap, "setObject:forKeyedSubscript:", 0, v7);
        objc_msgSend(MEMORY[0x1E0D4ECA0], "sharedTracker");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "unblockBannerForHighlight:", v7);

        ++v6;
      }
      while (v6 != v5);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v5);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightToBackForwardListItemsMap, 0);
  objc_storeStrong((id *)&self->_highlightToPresentersMap, 0);
}

@end
