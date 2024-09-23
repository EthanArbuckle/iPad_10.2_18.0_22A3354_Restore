@implementation HUComfortSound

+ (id)comfortSoundWithAsset:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", CFSTR("SoundName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "properties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForKey:", CFSTR("SoundGroup"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUComfortSound soundWithName:path:andGroup:](HUComfortSound, "soundWithName:path:andGroup:", v5, v6, objc_msgSend(v8, "unsignedIntegerValue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setAsset:", v3);
  return v9;
}

+ (id)defaultComfortSoundForGroup:(unint64_t)a3
{
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;

  if (a3 - 1 > 7)
    v4 = 0;
  else
    v4 = off_1EA8E8408[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLForResource:withExtension:", v4, CFSTR("m4a"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUComfortSound soundWithName:path:andGroup:](HUComfortSound, "soundWithName:path:andGroup:", v4, v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)soundWithName:(id)a3 path:(id)a4 andGroup:(unint64_t)a5
{
  id v7;
  id v8;
  HUComfortSound *v9;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "length"))
  {
    v9 = objc_alloc_init(HUComfortSound);
    -[HUComfortSound setName:](v9, "setName:", v7);
    -[HUComfortSound setPath:](v9, "setPath:", v8);
    -[HUComfortSound setSoundGroup:](v9, "setSoundGroup:", a5);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (HUComfortSound)initWithCoder:(id)a3
{
  id v4;
  HUComfortSound *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HUComfortSound;
  v5 = -[HUComfortSound init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HUComfortSoundNameKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUComfortSound setName:](v5, "setName:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HUComfortSoundPathKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUComfortSound setPath:](v5, "setPath:", v7);

    -[HUComfortSound setSoundGroup:](v5, "setSoundGroup:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HUComfortSoundGroupKey")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HUComfortSoundAssetKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUComfortSound setAsset:](v5, "setAsset:", v8);

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HUComfortSound name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HUComfortSoundNameKey"));

  -[HUComfortSound path](self, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HUComfortSoundPathKey"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[HUComfortSound soundGroup](self, "soundGroup"), CFSTR("HUComfortSoundGroupKey"));
  -[HUComfortSound asset](self, "asset");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("HUComfortSoundAssetKey"));

}

- (id)localizedName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HUComfortSound name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("ComfortSound"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  hearingLocString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)nextFilePath
{
  void *v3;
  NSObject *v4;
  HUComfortSoundsShuffler *fileShuffler;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  HUComfortSoundsShuffler *v19;
  HUComfortSoundsShuffler *v20;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  -[HUComfortSound path](self, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = *MEMORY[0x1E0D2F918];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F918], OS_LOG_TYPE_FAULT))
      -[HUComfortSound nextFilePath].cold.1((uint64_t)self, v4);
  }
  fileShuffler = self->_fileShuffler;
  if (!fileShuffler)
  {
    -[HUComfortSound path](self, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pathExtension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("m4a"));

    if (v8)
    {
      v25[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 0;
LABEL_15:
      +[HUComfortSoundsShuffler shufflerWithArray:](HUComfortSoundsShuffler, "shufflerWithArray:", v9);
      v19 = (HUComfortSoundsShuffler *)objc_claimAutoreleasedReturnValue();
      v20 = self->_fileShuffler;
      self->_fileShuffler = v19;

      fileShuffler = self->_fileShuffler;
      goto LABEL_16;
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    objc_msgSend(v11, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v6, 0, 0, &v22);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v22;

    if (v10)
    {
      CSInitializeLogging();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error loading assets %@"), v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSound nextFilePath]", 178, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)*MEMORY[0x1E0D2F918];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F918], OS_LOG_TYPE_DEFAULT))
      {
        v16 = objc_retainAutorelease(v14);
        v17 = v15;
        v18 = objc_msgSend(v16, "UTF8String");
        *(_DWORD *)buf = 136446210;
        v24 = v18;
        _os_log_impl(&dword_1DE311000, v17, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

      }
    }
    else if (objc_msgSend(v12, "count"))
    {
      objc_msgSend(v12, "ax_filteredArrayUsingBlock:", &__block_literal_global_1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    v9 = 0;
LABEL_14:

    goto LABEL_15;
  }
LABEL_16:
  -[HUComfortSoundsShuffler nextObject](fileShuffler, "nextObject");
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __30__HUComfortSound_nextFilePath__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "pathExtension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("m4a"));

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUComfortSound path](self, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)HUComfortSound;
  -[HUComfortSound description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUComfortSound name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HUComfortSound soundGroup](self, "soundGroup");
  -[HUComfortSound path](self, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - %@ [%lu] = %@"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSURL)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->_path, a3);
}

- (unint64_t)soundGroup
{
  return self->_soundGroup;
}

- (void)setSoundGroup:(unint64_t)a3
{
  self->_soundGroup = a3;
}

- (AXAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (HUComfortSoundsShuffler)fileShuffler
{
  return self->_fileShuffler;
}

- (void)setFileShuffler:(id)a3
{
  objc_storeStrong((id *)&self->_fileShuffler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileShuffler, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)nextFilePath
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_1DE311000, a2, OS_LOG_TYPE_FAULT, "Comfort sound path is nil %@", (uint8_t *)&v2, 0xCu);
}

@end
