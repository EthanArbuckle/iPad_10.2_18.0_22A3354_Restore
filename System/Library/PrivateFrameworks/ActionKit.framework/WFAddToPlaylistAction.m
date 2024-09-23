@implementation WFAddToPlaylistAction

- (id)disabledOnPlatforms
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFAddToPlaylistAction;
  -[WFAddToPlaylistAction disabledOnPlatforms](&v5, sel_disabledOnPlatforms);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObject:", *MEMORY[0x24BEC43E8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  WFAddToPlaylistAction *v23;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFAddToPlaylistAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFPlaylistName"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WFPlaylistsMatchingDescriptor(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_msgSend(v5, "entireMusicLibrary") & 1) != 0)
  {
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __52__WFAddToPlaylistAction_runAsynchronouslyWithInput___block_invoke;
    v21[3] = &unk_24F8BB180;
    v22 = v7;
    v23 = self;
    WFAddContentToPlaylist(v22, v4, v21);
    v8 = v22;
  }
  else
  {
    WFLocalizedString(CFSTR("Playlist Not Found"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "playlistName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    v11 = (void *)MEMORY[0x24BDD17C8];
    if (v10)
    {
      WFLocalizedString(CFSTR("%1$@ failed because the playlist “%2$@” could not be found."));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAddToPlaylistAction localizedName](self, "localizedName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "playlistName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringWithFormat:", v12, v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      WFLocalizedString(CFSTR("%1$@ failed because no playlist was specified. Please choose a playlist."));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAddToPlaylistAction localizedName](self, "localizedName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringWithFormat:", v12, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v16 = (void *)MEMORY[0x24BDD1540];
    v17 = *MEMORY[0x24BEC4270];
    v18 = *MEMORY[0x24BDD0FC8];
    v24[0] = *MEMORY[0x24BDD0FD8];
    v24[1] = v18;
    v25[0] = v8;
    v25[1] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 5, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFAddToPlaylistAction finishRunningWithError:](self, "finishRunningWithError:", v20);
  }

}

void __52__WFAddToPlaylistAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "items", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        objc_msgSend(*(id *)(a1 + 40), "output");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  objc_msgSend(*(id *)(a1 + 40), "finishRunningWithError:", v4);
}

@end
