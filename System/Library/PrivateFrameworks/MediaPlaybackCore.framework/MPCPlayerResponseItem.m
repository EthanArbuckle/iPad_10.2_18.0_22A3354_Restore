@implementation MPCPlayerResponseItem

- (MPModelGenericObject)metadataObject
{
  return self->_metadataObject;
}

- (MPCPlayerResponseItem)initWithModelGenericObject:(id)a3 indexPath:(id)a4 enqueueingParticipant:(id)a5 response:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  MPCPlayerResponseItem *v15;
  void *v16;
  uint64_t v17;
  NSString *contentItemIdentifier;
  void *v19;
  NSIndexPath *indexPath;
  void *v21;
  void *v22;
  NSIndexPath *v23;
  void *v24;
  __int128 v25;
  void *v26;
  NSIndexPath *v27;
  void *v28;
  uint64_t v29;
  NSString *localizedDurationString;
  void *v31;
  NSIndexPath *v32;
  void *v33;
  uint64_t v34;
  NSString *explicitBadge;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  NSIndexPath *v40;
  void *v41;
  void *v42;
  void *v43;
  NSIndexPath *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  NSArray *languageOptionGroups;
  void *v49;
  void *v50;
  uint64_t v51;
  MPCPlayerAudioFormat *preferredFormat;
  void *v53;
  void *v54;
  uint64_t v55;
  MPCPlayerAudioFormat *activeFormat;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  NSArray *alternateFormats;
  void *v65;
  void *v66;
  uint64_t v67;
  MPCPlayerAudioRoute *audioRoute;
  void *v69;
  NSIndexPath *v70;
  void *v71;
  _OWORD v73[3];
  uint64_t v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint64_t v78;
  objc_super v79;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v79.receiver = self;
  v79.super_class = (Class)MPCPlayerResponseItem;
  v15 = -[MPCPlayerResponseItem init](&v79, sel_init);
  if (v15)
  {
    objc_msgSend(v11, "identifiers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "contentItemID");
    v17 = objc_claimAutoreleasedReturnValue();
    contentItemIdentifier = v15->_contentItemIdentifier;
    v15->_contentItemIdentifier = (NSString *)v17;

    v15->_revision = 0;
    objc_storeWeak((id *)&v15->_response, v14);
    objc_storeStrong((id *)&v15->_enqueueingParticipant, a5);
    objc_storeStrong((id *)&v15->_indexPath, a4);
    objc_storeStrong((id *)&v15->_metadataObject, a3);
    objc_msgSend(v14, "builder");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    indexPath = v15->_indexPath;
    objc_msgSend(v14, "chain");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v15->_placeholder = objc_msgSend(v19, "playerItemIsPlaceholder:atIndexPath:chain:", 0, indexPath, v21);

    objc_msgSend(v14, "builder");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v15->_indexPath;
    objc_msgSend(v14, "chain");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v74 = 0;
      memset(v73, 0, sizeof(v73));
      objc_msgSend(v22, "playerItemDuration:atIndexPath:chain:", v73, v23, v24);
    }
    else
    {
      v78 = 0;
      v76 = 0u;
      v77 = 0u;
      v75 = 0u;
    }
    v25 = v76;
    *(_OWORD *)&v15->_duration.snapshotTime = v75;
    *(_OWORD *)&v15->_duration.endTime = v25;
    *(_OWORD *)&v15->_duration.elapsedDuration = v77;
    *(_QWORD *)&v15->_duration.isLiveContent = v78;

    objc_msgSend(v14, "builder");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v15->_indexPath;
    objc_msgSend(v14, "chain");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "playerItemLocalizedDurationString:atIndexPath:chain:", 0, v27, v28);
    v29 = objc_claimAutoreleasedReturnValue();
    localizedDurationString = v15->_localizedDurationString;
    v15->_localizedDurationString = (NSString *)v29;

    objc_msgSend(v14, "builder");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v15->_indexPath;
    objc_msgSend(v14, "chain");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "playerItemExplicitBadge:atIndexPath:chain:", 0, v32, v33);
    v34 = objc_claimAutoreleasedReturnValue();
    explicitBadge = v15->_explicitBadge;
    v15->_explicitBadge = (NSString *)v34;

    objc_msgSend(v14, "builder");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = -[NSIndexPath section](v15->_indexPath, "section");
    objc_msgSend(v14, "chain");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v15->_autoPlay = objc_msgSend(v36, "sectionIsAutoPlaySection:atIndex:chain:", 0, v37, v38);

    objc_msgSend(v14, "builder");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v15->_indexPath;
    objc_msgSend(v14, "chain");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "playerItemLanguageOptionGroups:atIndexPath:chain:", 0, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "builder");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v15->_indexPath;
    objc_msgSend(v14, "chain");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "playerItemCurrentLanguageOptions:atIndexPath:chain:", 0, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    -[MPCPlayerResponseItem _buildLanguageOptionGroups:currentLanguageOptions:](v15, "_buildLanguageOptionGroups:currentLanguageOptions:", v42, v46);
    v47 = objc_claimAutoreleasedReturnValue();
    languageOptionGroups = v15->_languageOptionGroups;
    v15->_languageOptionGroups = (NSArray *)v47;

    objc_msgSend(v14, "builder");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "chain");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "preferredAudioFormat:chain:", 0, v50);
    v51 = objc_claimAutoreleasedReturnValue();
    preferredFormat = v15->_preferredFormat;
    v15->_preferredFormat = (MPCPlayerAudioFormat *)v51;

    objc_msgSend(v14, "builder");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "chain");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "activeAudioFormat:chain:", 0, v54);
    v55 = objc_claimAutoreleasedReturnValue();
    activeFormat = v15->_activeFormat;
    v15->_activeFormat = (MPCPlayerAudioFormat *)v55;

    objc_msgSend(v14, "builder");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "chain");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v15->_activeFormatJustification = objc_msgSend(v57, "activeAudioFormatJustification:chain:", 0, v58);

    objc_msgSend(v14, "builder");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "chain");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v15->_preferredTiers = objc_msgSend(v59, "audioFormatPreference:chain:", 0, v60);

    objc_msgSend(v14, "builder");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "chain");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "alternateAudioFormats:chain:", 0, v62);
    v63 = objc_claimAutoreleasedReturnValue();
    alternateFormats = v15->_alternateFormats;
    v15->_alternateFormats = (NSArray *)v63;

    objc_msgSend(v14, "builder");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "chain");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "audioRoute:chain:", 0, v66);
    v67 = objc_claimAutoreleasedReturnValue();
    audioRoute = v15->_audioRoute;
    v15->_audioRoute = (MPCPlayerAudioRoute *)v67;

    objc_msgSend(v14, "builder");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = v15->_indexPath;
    objc_msgSend(v14, "chain");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v15->_isFavoritable = objc_msgSend(v69, "playerItemIsFavoritable:atIndexPath:chain:", 0, v70, v71);

  }
  return v15;
}

- (id)_buildLanguageOptionGroups:(id)a3 currentLanguageOptions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  MPCPlayerResponse **p_response;
  uint64_t v13;
  uint64_t v14;
  MPCPlayerLanguageOptionGroup *v15;
  id WeakRetained;
  MPCPlayerLanguageOptionGroup *v17;
  void *v18;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    p_response = &self->_response;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v13);
        v15 = [MPCPlayerLanguageOptionGroup alloc];
        WeakRetained = objc_loadWeakRetained((id *)p_response);
        v17 = -[MPCPlayerLanguageOptionGroup initWithLanguageOptionGroups:currentLanguageOptions:response:](v15, "initWithLanguageOptionGroups:currentLanguageOptions:response:", v14, v7, WeakRetained);
        objc_msgSend(v8, "addObject:", v17);

        ++v13;
      }
      while (v10 != v13);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  v18 = (void *)objc_msgSend(v8, "copy");
  return v18;
}

- (BOOL)isAutoPlay
{
  return self->_autoPlay;
}

- (NSString)contentItemIdentifier
{
  return self->_contentItemIdentifier;
}

- (BOOL)isPlaceholder
{
  return self->_placeholder;
}

- ($04B05C73ED6AEEF31C5815932084562D)duration
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].var7;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[2].var4;
  *(_OWORD *)&retstr->var2 = v3;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self[3].var1;
  *(double *)&retstr->var7 = self[3].var3;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enqueueingParticipant, 0);
  objc_storeStrong((id *)&self->_metadataObject, 0);
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_destroyWeak((id *)&self->_response);
  objc_storeStrong((id *)&self->_languageOptionGroups, 0);
  objc_storeStrong((id *)&self->_explicitBadge, 0);
  objc_storeStrong((id *)&self->_localizedDurationString, 0);
  objc_storeStrong((id *)&self->_contentItemIdentifier, 0);
  objc_storeStrong((id *)&self->_audioRoute, 0);
  objc_storeStrong((id *)&self->_alternateFormats, 0);
  objc_storeStrong((id *)&self->_activeFormat, 0);
  objc_storeStrong((id *)&self->_preferredFormat, 0);
}

- (id)seekCommand
{
  unint64_t seekSupport;
  _MPCPlayerSeekCommand *v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  _BOOL8 v22;
  void *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  void *v31;

  seekSupport = self->_seekSupport;
  if ((seekSupport & 1) == 0)
  {
    seekSupport = -[MPCPlayerResponseItem _determineSeekSupport](self, "_determineSeekSupport");
    self->_seekSupport = seekSupport;
  }
  if (seekSupport == 1)
  {
    v4 = 0;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_response);
    v4 = -[_MPCPlayerSeekCommand initWithResponse:seekSupport:]([_MPCPlayerSeekCommand alloc], "initWithResponse:seekSupport:", WeakRetained, self->_seekSupport);
    -[_MPCPlayerItemCommand setContentItemID:](v4, "setContentItemID:", self->_contentItemIdentifier);
    if ((-[_MPCPlayerSeekCommand seekSupport](v4, "seekSupport") & 0x20) != 0)
    {
      objc_msgSend(WeakRetained, "builder");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *MEMORY[0x24BE65640];
      objc_msgSend(WeakRetained, "chain");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "playerCommandOptionValue:forKey:command:chain:", &unk_24CB17458, v7, 17, v8);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      if (v9)
        v11 = (void *)v9;
      else
        v11 = &unk_24CB17458;
      -[_MPCPlayerSeekCommand setPreferredForwardJumpIntervals:](v4, "setPreferredForwardJumpIntervals:", v11);

    }
    if ((-[_MPCPlayerSeekCommand seekSupport](v4, "seekSupport") & 0x40) != 0)
    {
      objc_msgSend(WeakRetained, "builder");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *MEMORY[0x24BE65640];
      objc_msgSend(WeakRetained, "chain");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "playerCommandOptionValue:forKey:command:chain:", &unk_24CB17458, v13, 18, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v17 = v15 ? v15 : &unk_24CB17458;
      -[_MPCPlayerSeekCommand setPreferredBackwardJumpIntervals:](v4, "setPreferredBackwardJumpIntervals:", v17);

      -[_MPCPlayerSeekCommand preferredBackwardJumpIntervals](v4, "preferredBackwardJumpIntervals");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "firstObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "doubleValue");
      v21 = v20;
      v22 = v20 < 0.0;

      -[_MPCPlayerSeekCommand setPrefersNegativeBackwardSkipIntervals:](v4, "setPrefersNegativeBackwardSkipIntervals:", v22);
      if (v21 >= 0.0)
      {
        -[_MPCPlayerSeekCommand preferredBackwardJumpIntervals](v4, "preferredBackwardJumpIntervals");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)objc_msgSend(v23, "mutableCopy");

        if (objc_msgSend(v24, "count"))
        {
          v25 = 0;
          do
          {
            v26 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v24, "objectAtIndexedSubscript:", v25);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "doubleValue");
            v29 = v28;

            v30 = -v29;
            if (v29 < 0.0)
              v30 = v29;
            objc_msgSend(v26, "numberWithDouble:", v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "replaceObjectAtIndex:withObject:", v25, v31);

            ++v25;
          }
          while (v25 < objc_msgSend(v24, "count"));
        }
        -[_MPCPlayerSeekCommand setPreferredBackwardJumpIntervals:](v4, "setPreferredBackwardJumpIntervals:", v24);

      }
    }

  }
  return v4;
}

- (unint64_t)_determineSeekSupport
{
  id WeakRetained;
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  unint64_t v25;

  WeakRetained = objc_loadWeakRetained((id *)&self->_response);
  objc_msgSend(WeakRetained, "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "chain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "playerCommandEnabled:command:chain:", 0, 8, v4);

  if (v5)
    v6 = 7;
  else
    v6 = 1;
  objc_msgSend(WeakRetained, "builder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "chain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "playerCommandEnabled:command:chain:", 0, 10, v8);

  if (v9)
    v6 |= 0x18uLL;
  objc_msgSend(WeakRetained, "builder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "chain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "playerCommandEnabled:command:chain:", 0, 17, v11);

  if (v12)
    v6 |= 0x20uLL;
  objc_msgSend(WeakRetained, "builder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "chain");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "playerCommandEnabled:command:chain:", 0, 18, v14);

  if (v15)
    v6 |= 0x40uLL;
  objc_msgSend(WeakRetained, "builder");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "chain");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "playerCommandEnabled:command:chain:", 0, 24, v17);

  if (v18)
    v19 = v6 | 0x80;
  else
    v19 = v6;
  objc_msgSend(WeakRetained, "builder");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = *MEMORY[0x24BE656E8];
  objc_msgSend(WeakRetained, "chain");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "playerCommandOptionValue:forKey:command:chain:", MEMORY[0x24BDBD1C0], v21, 24, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "BOOLValue");

  if (v24)
    v25 = v19 | 0x100;
  else
    v25 = v19;

  return v25;
}

- (id)_initWithContentItemID:(id)a3 autoPlay:(BOOL)a4
{
  id v6;
  MPCPlayerResponseItem *v7;
  uint64_t v8;
  NSString *contentItemIdentifier;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MPCPlayerResponseItem;
  v7 = -[MPCPlayerResponseItem init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    contentItemIdentifier = v7->_contentItemIdentifier;
    v7->_contentItemIdentifier = (NSString *)v8;

    v7->_autoPlay = a4;
  }

  return v7;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p %@ autoPlay=%d>"), objc_opt_class(), self, self->_contentItemIdentifier, self->_autoPlay);
}

- (id)playbackRateCommand
{
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  _MPCPlayerPlaybackRateCommand *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  NSIndexPath *indexPath;
  void *v27;
  double v28;
  _OWORD v30[3];
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;

  WeakRetained = objc_loadWeakRetained((id *)&self->_response);
  objc_msgSend(WeakRetained, "builder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "chain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "playerState:chain:", 0, v5);

  objc_msgSend(WeakRetained, "builder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BE65648];
  objc_msgSend(WeakRetained, "chain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "playerCommandOptionValue:forKey:command:chain:", 0, v8, 19, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v11 = 1;
  else
    v11 = v6 == 2;
  if (!v11)
  {
    objc_msgSend(WeakRetained, "request");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "disablePlaybackRateValidation");

    if (!v13)
    {
      v10 = 0;
      goto LABEL_16;
    }
  }
  objc_msgSend(WeakRetained, "request");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v14, "disablePlaybackRateValidation"))
  {
    objc_msgSend(WeakRetained, "builder");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "chain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "playerCommandEnabled:command:chain:", 0, 19, v16);

    if (v17)
      goto LABEL_9;
LABEL_16:
    v18 = 0;
    goto LABEL_20;
  }

LABEL_9:
  v18 = -[_MPCPlayerCommand initWithResponse:]([_MPCPlayerPlaybackRateCommand alloc], "initWithResponse:", WeakRetained);
  -[_MPCPlayerItemCommand setContentItemID:](v18, "setContentItemID:", self->_contentItemIdentifier);
  objc_msgSend(WeakRetained, "builder");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *MEMORY[0x24BE656B8];
  objc_msgSend(WeakRetained, "chain");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "playerCommandOptionValue:forKey:command:chain:", &unk_24CB17470, v20, 19, v21);
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  if (v22)
    v24 = (void *)v22;
  else
    v24 = &unk_24CB17470;
  -[_MPCPlayerPlaybackRateCommand setSupportedPlaybackRates:](v18, "setSupportedPlaybackRates:", v24);

  if (!v10)
  {
    v35 = 0;
    v33 = 0u;
    v34 = 0u;
    v32 = 0u;
    objc_msgSend(WeakRetained, "builder");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    indexPath = self->_indexPath;
    objc_msgSend(WeakRetained, "chain");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      v31 = 0;
      memset(v30, 0, sizeof(v30));
      objc_msgSend(v25, "playerItemDuration:atIndexPath:chain:", v30, indexPath, v27);
    }
    else
    {
      v35 = 0;
      v33 = 0u;
      v34 = 0u;
      v32 = 0u;
    }

    LODWORD(v28) = DWORD2(v34);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v28);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v10, "floatValue");
  -[_MPCPlayerPlaybackRateCommand setPreferredPlaybackRate:](v18, "setPreferredPlaybackRate:");
LABEL_20:

  return v18;
}

- (id)likeCommand
{
  id WeakRetained;
  void *v4;
  void *v5;
  int v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_response);
  objc_msgSend(WeakRetained, "controller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resolvedPlayerPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isSystemMusicPath");

  if (v6)
    -[MPCPlayerResponseItem _favoriteCommandWithMediaRemoteCommand:](self, "_favoriteCommandWithMediaRemoteCommand:", 21);
  else
    -[MPCPlayerResponseItem _feedbackCommandWithMediaRemoteCommand:](self, "_feedbackCommandWithMediaRemoteCommand:", 21);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)dislikeCommand
{
  id WeakRetained;
  void *v4;
  void *v5;
  int v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_response);
  objc_msgSend(WeakRetained, "controller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resolvedPlayerPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isSystemMusicPath");

  if (v6)
    -[MPCPlayerResponseItem _favoriteCommandWithMediaRemoteCommand:](self, "_favoriteCommandWithMediaRemoteCommand:", 22);
  else
    -[MPCPlayerResponseItem _feedbackCommandWithMediaRemoteCommand:](self, "_feedbackCommandWithMediaRemoteCommand:", 22);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)wishlistCommand
{
  return -[MPCPlayerResponseItem _feedbackCommandWithMediaRemoteCommand:](self, "_feedbackCommandWithMediaRemoteCommand:", 23);
}

- (id)_favoriteCommandWithMediaRemoteCommand:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v5;
  _BOOL4 v6;
  _MPCPlayerFeedbackCommand *v7;
  _BOOL4 v8;
  _BOOL8 v9;
  _MPCPlayerFeedbackCommand *v10;
  id WeakRetained;
  void *v12;

  v3 = *(_QWORD *)&a3;
  if (!-[MPCPlayerResponseItem _isFavoriteEligible](self, "_isFavoriteEligible")
    || (LODWORD(v5) = -[MPCPlayerResponseItem _isDisliked](self, "_isDisliked"),
        v6 = -[MPCPlayerResponseItem _isFavorited](self, "_isFavorited"),
        (_DWORD)v3 == 22)
    && v6)
  {
    v7 = 0;
  }
  else
  {
    v8 = (_DWORD)v3 == 21 && v6;
    v9 = (_DWORD)v3 == 22;
    if ((_DWORD)v3 == 22)
      v5 = v5;
    else
      v5 = v8;
    v10 = [_MPCPlayerFeedbackCommand alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_response);
    v7 = -[_MPCPlayerFeedbackCommand initWithResponse:mediaRemoteCommand:](v10, "initWithResponse:mediaRemoteCommand:", WeakRetained, v3);

    -[MPCPlayerResponseItem _modelSongMetadataObject](self, "_modelSongMetadataObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MPCPlayerFeedbackCommand setFavoritableModelObject:](v7, "setFavoritableModelObject:", v12);

    -[_MPCPlayerFeedbackCommand setIsDislikingFavoritableModelObject:](v7, "setIsDislikingFavoritableModelObject:", v9);
    -[_MPCPlayerFeedbackCommand setValue:](v7, "setValue:", v5);
    -[_MPCPlayerFeedbackCommand setPresentationStyle:](v7, "setPresentationStyle:", 1);
  }
  return v7;
}

- (id)rateCommand
{
  id WeakRetained;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  _MPCPlayerRateCommand *v21;
  int v22;
  int v23;
  double v24;
  int v25;
  int v26;
  double v27;

  WeakRetained = objc_loadWeakRetained((id *)&self->_response);
  objc_msgSend(WeakRetained, "builder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "chain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "playerCommandEnabled:command:chain:", 0, 20, v5);

  if (v6)
  {
    objc_msgSend(WeakRetained, "builder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x24BE65628];
    objc_msgSend(WeakRetained, "chain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "playerCommandOptionValue:forKey:command:chain:", &unk_24CB17590, v8, 20, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      v12 = (void *)v10;
    else
      v12 = &unk_24CB17590;
    v13 = v12;

    objc_msgSend(WeakRetained, "builder");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *MEMORY[0x24BE65620];
    objc_msgSend(WeakRetained, "chain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "playerCommandOptionValue:forKey:command:chain:", &unk_24CB17580, v15, 20, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v17)
      v19 = (void *)v17;
    else
      v19 = &unk_24CB17580;
    v20 = v19;

    v21 = -[_MPCPlayerCommand initWithResponse:]([_MPCPlayerRateCommand alloc], "initWithResponse:", WeakRetained);
    -[_MPCPlayerItemCommand setContentItemID:](v21, "setContentItemID:", self->_contentItemIdentifier);
    objc_msgSend(v13, "floatValue");
    v23 = v22;

    LODWORD(v24) = v23;
    -[_MPCPlayerRateCommand setMinimumValue:](v21, "setMinimumValue:", v24);
    objc_msgSend(v20, "floatValue");
    v26 = v25;

    LODWORD(v27) = v26;
    -[_MPCPlayerRateCommand setMaximumValue:](v21, "setMaximumValue:", v27);
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)remove
{
  id WeakRetained;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  NSIndexPath *indexPath;
  void *v9;
  MPCPlayerCommandRequest *v10;
  NSString *v11;
  void *v12;
  MPCPlayerCommandRequest *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_response);
  objc_msgSend(WeakRetained, "builder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "chain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "playerCommandEnabled:command:chain:", 0, 129, v5);

  if (v6)
  {
    objc_msgSend(WeakRetained, "builder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    indexPath = self->_indexPath;
    objc_msgSend(WeakRetained, "chain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(indexPath) = objc_msgSend(v7, "playerItemEditingStyleFlags:atIndexPath:chain:", 0, indexPath, v9);

    v10 = 0;
    if ((indexPath & 2) != 0)
    {
      v11 = self->_contentItemIdentifier;
      if (-[NSString length](v11, "length"))
      {
        v18 = *MEMORY[0x24BE658D0];
        v19[0] = v11;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = [MPCPlayerCommandRequest alloc];
        objc_msgSend(WeakRetained, "controller");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "request");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "label");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[MPCPlayerCommandRequest initWithMediaRemoteCommand:options:controller:label:](v13, "initWithMediaRemoteCommand:options:controller:label:", 129, v12, v14, v16);

      }
      else
      {
        v10 = 0;
      }

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_stateDumpObject
{
  int64_t revision;
  const __CFString *contentItemIdentifier;
  double snapshotTime;
  double startTime;
  double duration;
  double endTime;
  double elapsedDuration;
  float rate;
  float defaultRate;
  _BOOL4 isLiveContent;
  _BOOL4 isLoading;
  _BOOL4 isInTransition;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  MPModelGenericObject *metadataObject;
  uint64_t v32;
  void *v33;
  NSIndexPath *indexPath;
  const __CFString *explicitBadge;
  void *v36;
  void *v37;
  NSString *localizedDurationString;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[7];
  _QWORD v45[7];
  _QWORD v46[11];
  _QWORD v47[13];

  v47[11] = *MEMORY[0x24BDAC8D0];
  v42 = (void *)MEMORY[0x24BDBCED8];
  contentItemIdentifier = (const __CFString *)self->_contentItemIdentifier;
  revision = self->_revision;
  if (!contentItemIdentifier)
    contentItemIdentifier = CFSTR("@");
  v45[0] = contentItemIdentifier;
  v44[0] = CFSTR("contentItemID");
  v44[1] = CFSTR("revision");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", revision);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v43;
  v44[2] = CFSTR("duration");
  snapshotTime = self->_duration.snapshotTime;
  startTime = self->_duration.startTime;
  endTime = self->_duration.endTime;
  duration = self->_duration.duration;
  elapsedDuration = self->_duration.elapsedDuration;
  rate = self->_duration.rate;
  defaultRate = self->_duration.defaultRate;
  isLiveContent = self->_duration.isLiveContent;
  isLoading = self->_duration.isLoading;
  isInTransition = self->_duration.isInTransition;
  v46[0] = CFSTR("snapshotTime");
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", snapshotTime);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = v41;
  v46[1] = CFSTR("startTime");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", startTime);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v47[1] = v40;
  v46[2] = CFSTR("endTime");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", endTime);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v47[2] = v15;
  v46[3] = CFSTR("duration");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", duration);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v47[3] = v16;
  v46[4] = CFSTR("elapsedDuration");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", elapsedDuration);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v47[4] = v17;
  v46[5] = CFSTR("rate");
  *(float *)&v18 = rate;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v47[5] = v19;
  v46[6] = CFSTR("defaultRate");
  *(float *)&v20 = defaultRate;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v20);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v21;
  if (isLiveContent)
    v23 = CFSTR("YES");
  else
    v23 = CFSTR("NO");
  v47[6] = v21;
  v47[7] = v23;
  v46[7] = CFSTR("isLiveContent");
  v46[8] = CFSTR("isLoading");
  if (isLoading)
    v24 = CFSTR("YES");
  else
    v24 = CFSTR("NO");
  v47[8] = v24;
  v46[9] = CFSTR("isInTransition");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", isInTransition);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v47[9] = v25;
  v46[10] = CFSTR("_calculatedElapsedTime");
  v26 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  v28 = elapsedDuration + (v27 - snapshotTime) * rate;
  if (v28 >= duration)
    v28 = duration;
  objc_msgSend(v26, "numberWithDouble:", fmax(v28, 0.0));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v47[10] = v29;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, v46, 11);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  metadataObject = self->_metadataObject;
  if (!metadataObject)
    metadataObject = (MPModelGenericObject *)CFSTR("@");
  v45[2] = v30;
  v45[3] = metadataObject;
  v44[3] = CFSTR("metadataObject");
  v44[4] = CFSTR("isPlaceholder");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_placeholder);
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = (void *)v32;
  indexPath = self->_indexPath;
  if (!indexPath)
    indexPath = (NSIndexPath *)CFSTR("@");
  v45[4] = v32;
  v45[5] = indexPath;
  v44[5] = CFSTR("indexPath");
  v44[6] = CFSTR("explicitBadge");
  explicitBadge = (const __CFString *)self->_explicitBadge;
  if (!explicitBadge)
    explicitBadge = CFSTR("@");
  v45[6] = explicitBadge;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, v44, 7);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "dictionaryWithDictionary:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  localizedDurationString = self->_localizedDurationString;
  if (localizedDurationString)
    objc_msgSend(v37, "setObject:forKeyedSubscript:", localizedDurationString, CFSTR("localizedDurationString"));
  if (-[NSArray count](self->_languageOptionGroups, "count"))
    objc_msgSend(v37, "setObject:forKeyedSubscript:", self->_languageOptionGroups, CFSTR("languageOptionGroups"));
  return v37;
}

- (MPCPlayerResponseItemMusicAudio)musicAudio
{
  if (self->_activeFormat)
    return (MPCPlayerResponseItemMusicAudio *)self;
  else
    return (MPCPlayerResponseItemMusicAudio *)0;
}

- (MPNowPlayingInfoAudioFormat)nowPlayingAudioFormat
{
  return -[MPCPlayerAudioFormat nowPlayingAudioFormat](self->_activeFormat, "nowPlayingAudioFormat");
}

- (id)switchToAlternativeFormat:(id)a3
{
  return 0;
}

- (id)_feedbackCommandWithMediaRemoteCommand:(unsigned int)a3
{
  uint64_t v3;
  id WeakRetained;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  _MPCPlayerFeedbackCommand *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;

  v3 = *(_QWORD *)&a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_response);
  objc_msgSend(WeakRetained, "builder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "chain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "playerCommandEnabled:command:chain:", 0, v3, v7);

  objc_msgSend(WeakRetained, "builder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x24BE65650];
  objc_msgSend(WeakRetained, "chain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "playerCommandOptionValue:forKey:command:chain:", &unk_24CB16DA0, v10, v3, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (void *)v12;
  else
    v14 = &unk_24CB16DA0;
  v15 = v14;

  v16 = objc_msgSend(v15, "integerValue");
  v17 = 0;
  if (!v8 || v16 == 2)
    goto LABEL_16;
  v17 = -[_MPCPlayerFeedbackCommand initWithResponse:mediaRemoteCommand:]([_MPCPlayerFeedbackCommand alloc], "initWithResponse:mediaRemoteCommand:", WeakRetained, v3);
  -[_MPCPlayerItemCommand setContentItemID:](v17, "setContentItemID:", self->_contentItemIdentifier);
  -[_MPCPlayerFeedbackCommand setPresentationStyle:](v17, "setPresentationStyle:", v16);
  if ((_DWORD)v3 == 22)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mediaPlaybackCoreBundle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("REMOTE_CONTROL_DISLIKE_TRACK_RADIO"), &stru_24CABB5D0, CFSTR("Radio"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "mediaPlaybackCoreBundle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    v22 = CFSTR("REMOTE_CONTROL_DISLIKE_TRACK_SHORT");
  }
  else
  {
    if ((_DWORD)v3 != 21)
    {
      v19 = 0;
      v24 = 0;
      goto LABEL_12;
    }
    objc_msgSend(MEMORY[0x24BDD1488], "mediaPlaybackCoreBundle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("REMOTE_CONTROL_LIKE_TRACK_RADIO"), &stru_24CABB5D0, CFSTR("Radio"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "mediaPlaybackCoreBundle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    v22 = CFSTR("REMOTE_CONTROL_LIKE_TRACK_SHORT");
  }
  objc_msgSend(v20, "localizedStringForKey:value:table:", v22, &stru_24CABB5D0, CFSTR("Radio"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  objc_msgSend(WeakRetained, "builder");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = *MEMORY[0x24BE65618];
  objc_msgSend(WeakRetained, "chain");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "playerCommandOptionValue:forKey:command:chain:", v19, v26, v3, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCPlayerFeedbackCommand setLocalizedTitle:](v17, "setLocalizedTitle:", v28);

  objc_msgSend(WeakRetained, "builder");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = *MEMORY[0x24BE65610];
  objc_msgSend(WeakRetained, "chain");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "playerCommandOptionValue:forKey:command:chain:", v24, v30, v3, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCPlayerFeedbackCommand setLocalizedShortTitle:](v17, "setLocalizedShortTitle:", v32);

  objc_msgSend(WeakRetained, "builder");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = *MEMORY[0x24BE65600];
  objc_msgSend(WeakRetained, "chain");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)MEMORY[0x24BDBD1C0];
  objc_msgSend(v33, "playerCommandOptionValue:forKey:command:chain:", MEMORY[0x24BDBD1C0], v34, v3, v35);
  v37 = objc_claimAutoreleasedReturnValue();
  v38 = (void *)v37;
  if (v37)
    v39 = (void *)v37;
  else
    v39 = v36;
  v40 = v39;

  v41 = objc_msgSend(v40, "BOOLValue");
  -[_MPCPlayerFeedbackCommand setValue:](v17, "setValue:", v41);

LABEL_16:
  return v17;
}

- (id)_modelSongMetadataObject
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = -[MPModelGenericObject type](self->_metadataObject, "type");
  if (v3 == 5)
  {
    -[MPModelGenericObject playlistEntry](self->_metadataObject, "playlistEntry");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "song");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (v3 == 1)
  {
    -[MPModelGenericObject song](self->_metadataObject, "song");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)_isFavoriteEligible
{
  id WeakRetained;
  void *v4;
  __int16 v5;
  void *v6;
  void *v7;
  char v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_response);
  if (_os_feature_enabled_impl()
    && objc_msgSend(MEMORY[0x24BDDC7F0], "authorizationStatus") == 3
    && self->_metadataObject
    && self->_isFavoritable)
  {
    objc_msgSend(WeakRetained, "requestingUserSubscriptionStatus");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "capabilities");

    -[MPCPlayerResponseItem _modelSongMetadataObject](self, "_modelSongMetadataObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((v5 & 0x200) != 0 && (objc_msgSend(v6, "isLibraryAddEligible") & 1) != 0)
      v8 = 1;
    else
      v8 = objc_msgSend(v7, "isLibraryAdded");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_isFavorited
{
  void *v3;
  void *v4;
  uint64_t v5;
  BOOL v6;

  -[MPCPlayerResponseItem _modelSongMetadataObject](self, "_modelSongMetadataObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDC908], "sharedDeviceLibraryController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "transientFavoriteStateForModelObject:", v3);
  if (v5)
    v6 = v5 == 2;
  else
    v6 = -[MPCPlayerResponseItem _isFavoriteValueForSong:](self, "_isFavoriteValueForSong:", v3);

  return v6;
}

- (BOOL)_isFavoriteValueForSong:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "hasLoadedValueForKey:", *MEMORY[0x24BDDC120]))
    v5 = objc_msgSend(v4, "isFavorite");
  else
    v5 = 0;

  return v5;
}

- (BOOL)_isDisliked
{
  void *v3;
  void *v4;
  uint64_t v5;
  BOOL v6;

  -[MPCPlayerResponseItem _modelSongMetadataObject](self, "_modelSongMetadataObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDC908], "sharedDeviceLibraryController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "transientFavoriteStateForModelObject:", v3);
  if (v5)
    v6 = v5 == 3;
  else
    v6 = -[MPCPlayerResponseItem _isDislikedValueForSong:](self, "_isDislikedValueForSong:", v3);

  return v6;
}

- (BOOL)_isDislikedValueForSong:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "hasLoadedValueForKey:", *MEMORY[0x24BDDC118]))
    v5 = objc_msgSend(v4, "isDisliked");
  else
    v5 = 0;

  return v5;
}

- (MPCPlayerAudioFormat)preferredFormat
{
  return self->_preferredFormat;
}

- (MPCPlayerAudioFormat)activeFormat
{
  return self->_activeFormat;
}

- (unint64_t)preferredTiers
{
  return self->_preferredTiers;
}

- (int64_t)activeFormatJustification
{
  return self->_activeFormatJustification;
}

- (NSArray)alternateFormats
{
  return self->_alternateFormats;
}

- (MPCPlayerAudioRoute)audioRoute
{
  return self->_audioRoute;
}

- (int64_t)revision
{
  return self->_revision;
}

- (NSString)localizedDurationString
{
  return self->_localizedDurationString;
}

- (NSString)explicitBadge
{
  return self->_explicitBadge;
}

- (NSArray)languageOptionGroups
{
  return self->_languageOptionGroups;
}

- (MPCPlayerResponse)response
{
  return (MPCPlayerResponse *)objc_loadWeakRetained((id *)&self->_response);
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (MPCPlayerResponseParticipant)enqueueingParticipant
{
  return self->_enqueueingParticipant;
}

@end
