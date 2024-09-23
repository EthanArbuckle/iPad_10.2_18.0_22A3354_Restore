@implementation HUMediaItem

- (HUMediaItem)initWithPlaybackArchiveDisplayProperties:(id)a3
{
  id v4;
  HUMediaItem *v5;
  HUMediaItem *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HUMediaItem;
  v5 = -[HUMediaItem init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[HUMediaItem setPlaybackArchiveDisplayProperties:](v5, "setPlaybackArchiveDisplayProperties:", v4);

  return v6;
}

- (void)setPlaybackArchiveDisplayProperties:(id)a3
{
  MPPlaybackArchiveDisplayProperties *v5;
  MPPlaybackArchiveDisplayProperties *v6;

  v5 = (MPPlaybackArchiveDisplayProperties *)a3;
  if (self->_playbackArchiveDisplayProperties != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_playbackArchiveDisplayProperties, a3);
    v5 = v6;
  }

}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMediaItem playbackArchiveDisplayProperties](self, "playbackArchiveDisplayProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HUMediaItem playbackArchiveDisplayProperties](self, "playbackArchiveDisplayProperties");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D30D18]);

    -[HUMediaItem playbackArchiveDisplayProperties](self, "playbackArchiveDisplayProperties");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "subtitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D30BF8]);

    -[HUMediaItem playbackArchiveDisplayProperties](self, "playbackArchiveDisplayProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "artworkImageData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = objc_alloc(MEMORY[0x1E0D31168]);
      -[HUMediaItem playbackArchiveDisplayProperties](self, "playbackArchiveDisplayProperties");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "artworkImageData");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v12, "initWithImageData:", v14);

      objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0D30C60]);
    }
  }
  v24 = *MEMORY[0x1E0D30D70];
  v16 = (void *)MEMORY[0x1E0CB37E8];
  -[HUMediaItem playbackArchiveDisplayProperties](self, "playbackArchiveDisplayProperties");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "numberWithInt:", v17 == 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v19);

  v20 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0D314B8], "outcomeWithResults:", v4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "futureWithResult:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (MPPlaybackArchiveDisplayProperties)playbackArchiveDisplayProperties
{
  return self->_playbackArchiveDisplayProperties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackArchiveDisplayProperties, 0);
}

@end
