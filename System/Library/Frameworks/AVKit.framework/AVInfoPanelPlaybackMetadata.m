@implementation AVInfoPanelPlaybackMetadata

- (AVInfoPanelPlaybackMetadata)initWithPlayerController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  AVInfoPanelPlaybackMetadata *v8;
  BOOL v9;
  uint64_t v10;
  NSArray *metadataItems;
  NSDate *creationDate;
  double v13;
  objc_super v15;

  v4 = a3;
  objc_msgSend(v4, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "asset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)AVInfoPanelPlaybackMetadata;
  v8 = -[AVInfoPanelPlaybackMetadata init](&v15, sel_init);
  if (v8)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    objc_msgSend((id)objc_opt_class(), "_metadataItemsForPlayerItem:withAsset:", v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    metadataItems = v8->_metadataItems;
    v8->_metadataItems = (NSArray *)v10;

    creationDate = v8->_creationDate;
    v8->_creationDate = 0;

    objc_msgSend((id)objc_opt_class(), "_durationForPlayerController:", v4);
    v8->_duration = v13;
    v8->_closedCaptioned = objc_msgSend((id)objc_opt_class(), "_closedCaptioningStatusForPlayerController:", v4);
    v8->_livePlayback = objc_msgSend(v4, "hasLiveStreamingContent");
  }

  return v8;
}

- (AVInfoPanelPlaybackMetadata)initWithPlaybackMetadata:(id)a3
{
  id v4;
  AVInfoPanelPlaybackMetadata *v5;
  void *v6;
  uint64_t v7;
  NSArray *metadataItems;
  double v9;
  void *v10;
  uint64_t v11;
  NSDate *creationDate;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AVInfoPanelPlaybackMetadata;
  v5 = -[AVInfoPanelPlaybackMetadata init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "metadataItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    metadataItems = v5->_metadataItems;
    v5->_metadataItems = (NSArray *)v7;

    objc_msgSend(v4, "duration");
    v5->_duration = v9;
    v5->_closedCaptioned = objc_msgSend(v4, "isClosedCaptioned");
    v5->_livePlayback = objc_msgSend(v4, "isLivePlayback");
    objc_msgSend(v4, "creationDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v11;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithPlaybackMetadata:", self);
}

- (unint64_t)hash
{
  return -[NSArray hash](self->_metadataItems, "hash");
}

- (BOOL)isEqual:(id)a3
{
  AVInfoPanelPlaybackMetadata *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;

  v4 = (AVInfoPanelPlaybackMetadata *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[AVInfoPanelPlaybackMetadata metadataItems](self, "metadataItems");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVInfoPanelPlaybackMetadata metadataItems](v4, "metadataItems");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5 == v6)
      {
        -[AVInfoPanelPlaybackMetadata creationDate](self, "creationDate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVInfoPanelPlaybackMetadata creationDate](v4, "creationDate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v8 == v9;

      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (NSDateFormatter)_yearDateFormatter
{
  NSDateFormatter *yearDateFormatter;
  NSDateFormatter *v4;
  NSDateFormatter *v5;

  yearDateFormatter = self->_yearDateFormatter;
  if (!yearDateFormatter)
  {
    v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    v5 = self->_yearDateFormatter;
    self->_yearDateFormatter = v4;

    -[NSDateFormatter setDateFormat:](self->_yearDateFormatter, "setDateFormat:", CFSTR("yyyy"));
    yearDateFormatter = self->_yearDateFormatter;
  }
  return yearDateFormatter;
}

- (NSArray)metadataItems
{
  return self->_metadataItems;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (double)duration
{
  return self->_duration;
}

- (BOOL)isClosedCaptioned
{
  return self->_closedCaptioned;
}

- (BOOL)isLivePlayback
{
  return self->_livePlayback;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_metadataItems, 0);
  objc_storeStrong((id *)&self->_yearDateFormatter, 0);
}

+ (id)playbackMetadataForPlayerController:(id)a3 fulfillment:(id)a4
{
  id v6;
  void (**v7)(id, void *, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = (void (**)(id, void *, void *))a4;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPlayerController:", v6);
  if (v7)
  {
    objc_msgSend(v6, "player");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "asset");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = (void *)objc_msgSend(v8, "copy");
      objc_msgSend(a1, "_loadAssetValues:into:completion:", v11, v12, v7);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v8, v12);
    }

  }
  return v8;
}

+ (void)_loadAssetValues:(id)a3 into:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v18[0] = CFSTR("creationDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __64__AVInfoPanelPlaybackMetadata__loadAssetValues_into_completion___block_invoke;
  v14[3] = &unk_1E5BB4C38;
  v15 = v7;
  v16 = v8;
  v17 = v9;
  v11 = v9;
  v12 = v8;
  v13 = v7;
  objc_msgSend(v13, "loadValuesAsynchronouslyForKeys:completionHandler:", v10, v14);

}

+ (id)_metadataItemsForPlayerItem:(id)a3 withAsset:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  int v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (void *)MEMORY[0x1E0C99DC8];
  v7 = a3;
  objc_msgSend(v6, "preferredLanguages");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayByAddingObject:", CFSTR("und"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v5, "statusOfValueForKey:error:", CFSTR("metadata"), 0);
  v11 = (void *)MEMORY[0x1E0C9AA60];
  if (v10 == 2)
  {
    v12 = (void *)MEMORY[0x1E0C8B220];
    objc_msgSend(v5, "metadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "metadataItemsFromArray:filteredAndSortedAccordingToPreferredLanguages:", v13, v9);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v14)
      v16 = (void *)v14;
    else
      v16 = v11;
    v17 = v16;

  }
  else
  {
    _AVLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v27 = 136315138;
      v28 = "+[AVInfoPanelPlaybackMetadata _metadataItemsForPlayerItem:withAsset:]";
      _os_log_error_impl(&dword_1AC4B1000, v18, OS_LOG_TYPE_ERROR, "%s: metadata has not yet been loaded: this is the caller's responsibility!", (uint8_t *)&v27, 0xCu);
    }

    v17 = (id)MEMORY[0x1E0C9AA60];
  }
  v19 = (void *)MEMORY[0x1E0C8B220];
  objc_msgSend(v7, "externalMetadata");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "metadataItemsFromArray:filteredAndSortedAccordingToPreferredLanguages:", v20, v9);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v21;
  if (v21)
    v23 = (void *)v21;
  else
    v23 = v11;
  v24 = v23;

  objc_msgSend(v24, "arrayByAddingObjectsFromArray:", v17);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

+ (double)_durationForPlayerController:(id)a3
{
  id v3;
  double v4;
  double v5;

  v3 = a3;
  v4 = 0.0;
  if ((objc_msgSend(v3, "hasLiveStreamingContent") & 1) == 0)
  {
    objc_msgSend(v3, "contentDuration");
    v4 = v5;
  }

  return v4;
}

+ (BOOL)_closedCaptioningStatusForPlayerController:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  char v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "legibleMediaSelectionOptions");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    v7 = *MEMORY[0x1E0C8A7B8];
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "mediaType", (_QWORD)v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", v7);

        if ((v10 & 1) != 0)
        {
          v11 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

void __64__AVInfoPanelPlaybackMetadata__loadAssetValues_into_completion___block_invoke(id *a1)
{
  void *v2;
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;

  if (objc_msgSend(a1[4], "statusOfValueForKey:error:", CFSTR("creationDate"), 0) == 2)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("creationDate"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __64__AVInfoPanelPlaybackMetadata__loadAssetValues_into_completion___block_invoke_2;
    v5[3] = &unk_1E5BB4B48;
    v6 = a1[4];
    v7 = a1[5];
    v3 = a1[6];
    v8 = v2;
    v9 = v3;
    v4 = v2;
    dispatch_async(MEMORY[0x1E0C80D38], v5);

  }
}

void __64__AVInfoPanelPlaybackMetadata__loadAssetValues_into_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "creationDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateValue");
  obj = (id)objc_claimAutoreleasedReturnValue();

  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    objc_storeStrong((id *)(v3 + 32), obj);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (NSString)titleString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSString *v9;

  -[AVInfoPanelPlaybackMetadata titleItem](self, "titleItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVInfoPanelPlaybackMetadata secondaryTitleItem](self, "secondaryTitleItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v6, "length") || (v7 = objc_msgSend(v4, "length"), v8 = v6, v7))
    v8 = v4;
  v9 = v8;

  return v9;
}

- (NSString)secondaryTitleString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[AVInfoPanelPlaybackMetadata titleItem](self, "titleItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVInfoPanelPlaybackMetadata secondaryTitleItem](self, "secondaryTitleItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length") && !objc_msgSend(v4, "length"))
    v7 = 0;
  else
    v7 = v6;

  return (NSString *)v7;
}

- (NSString)seasonNumberString
{
  id v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  char v7;
  void *v8;

  -[AVInfoPanelPlaybackMetadata seasonNumberItem](self, "seasonNumberItem");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v2, "stringValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v2, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      objc_msgSend(v2, "value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringValue");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }
  }

  return (NSString *)v5;
}

- (NSString)episodeNumberString
{
  id v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  char v7;
  void *v8;

  -[AVInfoPanelPlaybackMetadata episodeNumberItem](self, "episodeNumberItem");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v2, "stringValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v2, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      objc_msgSend(v2, "value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringValue");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }
  }

  return (NSString *)v5;
}

- (NSString)seasonEpisodeString
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[AVInfoPanelPlaybackMetadata seasonNumberString](self, "seasonNumberString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVInfoPanelPlaybackMetadata episodeNumberString](self, "episodeNumberString");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = 0;
  if (v3 && v4)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    AVLocalizedString(CFSTR("Season %@, Episode %@"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", v8, v3, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v6;
}

- (NSString)releaseDateString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void (*v18)(void);
  void *v19;
  _QWORD v21[5];
  _QWORD v22[6];

  v22[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C8B220], "identifierForKey:keySpace:", *MEMORY[0x1E0C8A890], *MEMORY[0x1E0C8A9D0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v3;
  objc_msgSend(MEMORY[0x1E0C8B220], "identifierForKey:keySpace:", *MEMORY[0x1E0C8AA90], *MEMORY[0x1E0C8A9E8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v4;
  objc_msgSend(MEMORY[0x1E0C8B220], "identifierForKey:keySpace:", *MEMORY[0x1E0C8AB10], *MEMORY[0x1E0C8A9F8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v5;
  objc_msgSend(MEMORY[0x1E0C8B220], "identifierForKey:keySpace:", *MEMORY[0x1E0C8A918], *MEMORY[0x1E0C8A9D8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v6;
  objc_msgSend(MEMORY[0x1E0C8B220], "identifierForKey:keySpace:", *MEMORY[0x1E0C8A820], *MEMORY[0x1E0C8A9E0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVInfoPanelPlaybackMetadata metadataItemForIdentifiers:](self, "metadataItemForIdentifiers:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVInfoPanelPlaybackMetadata creationDate](self, "creationDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVInfoPanelPlaybackMetadata _releaseDateStringItem](self, "_releaseDateStringItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __59__AVInfoPanelPlaybackMetadata_ViewModel__releaseDateString__block_invoke;
  v21[3] = &unk_1E5BB4B88;
  v21[4] = self;
  v15 = MEMORY[0x1AF43E9B8](v21);
  v16 = (void *)v15;
  if (v14)
  {
    v17 = v14;
  }
  else
  {
    if (v10)
    {
      v18 = *(void (**)(void))(v15 + 16);
    }
    else
    {
      if (v11)
      {
        v17 = v11;
        goto LABEL_8;
      }
      if (!v12)
      {
        v19 = 0;
        goto LABEL_9;
      }
      v18 = *(void (**)(void))(v15 + 16);
    }
    v18();
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_8:
  v19 = v17;
LABEL_9:

  return (NSString *)v19;
}

id __59__AVInfoPanelPlaybackMetadata_ViewModel__releaseDateString__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "_yearDateFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)metadataItemForIdentifiers:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v7)
        objc_enumerationMutation(v4);
      v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v8);
      v10 = (void *)MEMORY[0x1E0C8B220];
      -[AVInfoPanelPlaybackMetadata metadataItems](self, "metadataItems", (_QWORD)v15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "metadataItemsFromArray:filteredByIdentifier:", v11, v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v13 = 0;
  }

  return v13;
}

- (AVMetadataItem)titleItem
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v6[0] = *MEMORY[0x1E0C8A870];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVInfoPanelPlaybackMetadata metadataItemForIdentifiers:](self, "metadataItemForIdentifiers:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (AVMetadataItem *)v4;
}

- (AVMetadataItem)secondaryTitleItem
{
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0C8A9A0];
  v7[0] = CFSTR("avkt/com.apple.avkit.alternateSubTitle");
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVInfoPanelPlaybackMetadata metadataItemForIdentifiers:](self, "metadataItemForIdentifiers:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (AVMetadataItem *)v5;
}

- (AVMetadataItem)seasonNumberItem
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("avkt/com.apple.avkit.seasonNumber");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVInfoPanelPlaybackMetadata metadataItemForIdentifiers:](self, "metadataItemForIdentifiers:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (AVMetadataItem *)v4;
}

- (AVMetadataItem)episodeNumberItem
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("avkt/com.apple.avkit.episodeNumber");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVInfoPanelPlaybackMetadata metadataItemForIdentifiers:](self, "metadataItemForIdentifiers:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (AVMetadataItem *)v4;
}

- (id)_releaseDateStringItem
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("avkt/com.apple.avkit.releaseDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVInfoPanelPlaybackMetadata metadataItemForIdentifiers:](self, "metadataItemForIdentifiers:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
