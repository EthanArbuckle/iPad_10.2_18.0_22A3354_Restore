@implementation BTMediaPlayerView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)startMovieLoopWithPath:(id)a3
{
  AVQueuePlayer *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  AVPlayerLooper *v9;
  AVPlayerLooper *avLooper;
  id v11;

  v11 = a3;
  v4 = self->_avPlayer;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDB1858], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCategory:withOptions:error:", *MEMORY[0x24BDB1598], 1, 0);

    v4 = (AVQueuePlayer *)objc_alloc_init(MEMORY[0x24BDB2670]);
    -[AVQueuePlayer setAllowsExternalPlayback:](v4, "setAllowsExternalPlayback:", 0);
    -[AVQueuePlayer setPreventsDisplaySleepDuringVideoPlayback:](v4, "setPreventsDisplaySleepDuringVideoPlayback:", 0);
    -[AVQueuePlayer _setDisallowsAutoPauseOnRouteRemovalIfNoAudio:](v4, "_setDisallowsAutoPauseOnRouteRemovalIfNoAudio:", 1);
    objc_storeStrong((id *)&self->_avPlayer, v4);
    -[BTMediaPlayerView layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPlayer:", v4);

  }
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v11, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDB2618], "playerItemWithURL:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDB2650], "playerLooperWithPlayer:templateItem:", v4, v8);
  v9 = (AVPlayerLooper *)objc_claimAutoreleasedReturnValue();
  avLooper = self->_avLooper;
  self->_avLooper = v9;

  -[AVQueuePlayer play](self->_avPlayer, "play");
}

- (void)startMovieLoopWithPath:(id)a3 assetType:(int)a4 adjustmentsURL:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  double v11;
  float v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  double v17;
  double v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  float v23;
  __int128 v24;
  int v25;
  float v26;
  __int128 v27;
  int v28;
  float v29;
  _BYTE v30[28];
  int v31;

  v8 = a3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfURL:error:", a5, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (a4 == 1 || a4 == 2)
    {
      CFDictionaryGetTypeID();
      CFDictionaryGetTypedValue();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    v31 = 0;
    CFDictionaryGetDouble();
    v12 = v11;
    v13 = objc_alloc(MEMORY[0x24BDE56B0]);
    v14 = (void *)objc_msgSend(v13, "initWithType:", *MEMORY[0x24BDE5A00]);
    v23 = v12;
    v24 = *(_OWORD *)(MEMORY[0x24BDE53E8] + 4);
    v25 = *(_DWORD *)(MEMORY[0x24BDE53E8] + 20);
    v26 = v12;
    v27 = *(_OWORD *)(MEMORY[0x24BDE53E8] + 28);
    v28 = *(_DWORD *)(MEMORY[0x24BDE53E8] + 44);
    v29 = v12;
    *(_OWORD *)v30 = *(_OWORD *)(MEMORY[0x24BDE53E8] + 52);
    *(_OWORD *)&v30[12] = *(_OWORD *)(MEMORY[0x24BDE53E8] + 64);
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithCAColorMatrix:", &v23);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setValue:forKey:", v15, CFSTR("inputColorMatrix"));

    v16 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v16, "addObject:", v14);

    CFDictionaryGetDouble();
    if (!v31)
    {
      v18 = v17;
      v19 = objc_alloc(MEMORY[0x24BDE56B0]);
      v20 = (void *)objc_msgSend(v19, "initWithType:", *MEMORY[0x24BDE59A0]);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setValue:forKey:", v21, CFSTR("inputAmount"));

      if (!v16)
        v16 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      objc_msgSend(v16, "addObject:", v20);

    }
    if (objc_msgSend(v16, "count"))
    {
      -[BTMediaPlayerView layer](self, "layer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setFilters:", v16);

    }
  }
  -[BTMediaPlayerView startMovieLoopWithPath:](self, "startMovieLoopWithPath:", v8);

}

- (void)stop
{
  void *v3;
  AVQueuePlayer *avPlayer;
  AVPlayerLooper *avLooper;

  -[AVQueuePlayer pause](self->_avPlayer, "pause");
  -[BTMediaPlayerView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPlayer:", 0);

  -[AVQueuePlayer removeAllItems](self->_avPlayer, "removeAllItems");
  avPlayer = self->_avPlayer;
  self->_avPlayer = 0;

  avLooper = self->_avLooper;
  self->_avLooper = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avPlayer, 0);
  objc_storeStrong((id *)&self->_avLooper, 0);
}

@end
