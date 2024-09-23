@implementation CLSNowPlayingStreamConverter

- (CLSNowPlayingStreamConverter)init
{
  CLSNowPlayingStreamConverter *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CLSNowPlayingStreamConverter;
  v2 = -[CLSNowPlayingStreamConverter init](&v4, sel_init);
  if (v2)
    v2->_options = objc_msgSend((id)objc_opt_class(), "defaultOptions");
  return v2;
}

- (id)eventFromDuetKnoweledgeEvent:(id)a3
{
  id v4;
  CLSNowPlayingStreamEvent *v5;
  CLSNowPlayingStreamEvent *v6;

  v4 = a3;
  v5 = -[CLSNowPlayingStreamEvent initWithDuetKnowledgeEvent:]([CLSNowPlayingStreamEvent alloc], "initWithDuetKnowledgeEvent:", v4);

  if (-[CLSNowPlayingStreamConverter _canUseEvent:](self, "_canUseEvent:", v5))
    v6 = v5;
  else
    v6 = 0;

  return v6;
}

- (id)eventsFromDuetKnowledgeEvents:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        -[CLSNowPlayingStreamConverter eventFromDuetKnoweledgeEvent:](self, "eventFromDuetKnoweledgeEvent:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (BOOL)_canUseEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  unint64_t v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;

  v4 = a3;
  objc_msgSend(v4, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localStartDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localEndDate");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  LOBYTE(v9) = 0;
  if (!v6 || !v7)
    goto LABEL_27;
  objc_msgSend(v4, "localEndDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localStartDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceDate:", v11);
  v13 = v12;

  objc_msgSend(v5, "durationInSeconds");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  v16 = v15;

  v17 = -[CLSNowPlayingStreamConverter options](self, "options");
  if (!v17)
  {
LABEL_19:
    LOBYTE(v9) = 1;
    goto LABEL_27;
  }
  v18 = v17;
  if ((v17 & 1) != 0)
  {
    objc_msgSend(v5, "album");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "artist");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "title");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v19, "length") && !objc_msgSend(v20, "length") && !objc_msgSend(v21, "length"))
    {

      goto LABEL_25;
    }

  }
  if ((v18 & 0xA) != 0)
  {
    LOBYTE(v9) = 0;
    if (v13 == 0.0 || v16 == 0.0)
      goto LABEL_27;
    if (v13 < 300.0 && v13 / v16 < 0.2)
      goto LABEL_26;
  }
  if ((v18 & 4) != 0)
  {
    objc_msgSend(v5, "title");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "lowercaseString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19 && objc_msgSend(v19, "length"))
    {
      v25 = objc_msgSend(v19, "hasPrefix:", CFSTR("track"));

      if ((v25 & 1) == 0)
        goto LABEL_15;
LABEL_26:
      LOBYTE(v9) = 0;
      goto LABEL_27;
    }
LABEL_25:

    goto LABEL_26;
  }
LABEL_15:
  if ((v18 & 0x10) != 0 && v13 > v16 * 4.0)
    goto LABEL_26;
  if ((v18 & 0x20) == 0)
    goto LABEL_19;
  objc_msgSend((id)objc_opt_class(), "recognizedMusicSources");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "source");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v22, "containsObject:", v23);

  if (v9)
    goto LABEL_19;
LABEL_27:

  return v9;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

+ (unint64_t)defaultOptions
{
  return 3;
}

+ (id)recognizedMusicSources
{
  if (recognizedMusicSources_onceToken != -1)
    dispatch_once(&recognizedMusicSources_onceToken, &__block_literal_global_5132);
  return (id)recognizedMusicSources_musicSources;
}

void __54__CLSNowPlayingStreamConverter_recognizedMusicSources__block_invoke()
{
  void *v0;
  int v1;
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("multisourceMusicEnabled"));

  if (v1)
    v2 = &unk_1E85121D0;
  else
    v2 = &unk_1E85121E8;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)recognizedMusicSources_musicSources;
  recognizedMusicSources_musicSources = v3;

}

@end
