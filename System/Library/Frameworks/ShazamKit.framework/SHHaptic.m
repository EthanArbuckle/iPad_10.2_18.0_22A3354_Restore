@implementation SHHaptic

- (SHHaptic)initWithHapticTracks:(id)a3 representingMediaItem:(id)a4 spatialOffsets:(id)a5 error:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SHHaptic *v15;
  SHHaptic *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SHHaptic;
  v15 = -[SHHaptic init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_tracks, a3);
    objc_storeStrong((id *)&v16->_mediaItem, a4);
    objc_storeStrong((id *)&v16->_spatialOffsets, a5);
    objc_storeStrong((id *)&v16->_tracksError, a6);
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SHHaptic)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SHHaptic *v11;
  _QWORD v13[5];

  v13[4] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = a3;
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  v13[2] = objc_opt_class();
  v13[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SHHapticMediaItemKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("SHHapticItemsKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("SHHapticSpatialOffsetKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[SHHaptic initWithHapticTracks:representingMediaItem:spatialOffsets:error:](self, "initWithHapticTracks:representingMediaItem:spatialOffsets:error:", v9, v8, v10, 0);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[SHHaptic mediaItem](self, "mediaItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("SHHapticMediaItemKey"));

  -[SHHaptic tracks](self, "tracks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("SHHapticItemsKey"));

  -[SHHaptic spatialOffsets](self, "spatialOffsets");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("SHHapticSpatialOffsetKey"));

}

- (id)tracksWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[SHHaptic tracksError](self, "tracksError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x24BE90530];
    -[SHHaptic tracksError](self, "tracksError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "annotateError:withError:", a3, v7);

    sh_log_object();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[SHHaptic tracksError](self, "tracksError");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v9;
      _os_log_impl(&dword_218BF1000, v8, OS_LOG_TYPE_ERROR, "Error with fetching haptic track %@", (uint8_t *)&v11, 0xCu);

    }
  }
  -[SHHaptic tracks](self, "tracks");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (SHMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (NSArray)spatialOffsets
{
  return self->_spatialOffsets;
}

- (NSArray)tracks
{
  return self->_tracks;
}

- (NSError)tracksError
{
  return self->_tracksError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tracksError, 0);
  objc_storeStrong((id *)&self->_tracks, 0);
  objc_storeStrong((id *)&self->_spatialOffsets, 0);
  objc_storeStrong((id *)&self->_mediaItem, 0);
}

@end
