@implementation MPTimedMetadata

- (MPTimedMetadata)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("MPTimedMetadata cannot be created directly"));

  return 0;
}

- (id)_initWithMetadataItem:(id)a3
{
  id v5;
  MPTimedMetadata *v6;
  MPTimedMetadata *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPTimedMetadata;
  v6 = -[MPTimedMetadata init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_metadataItem, a3);

  return v7;
}

- (NSString)key
{
  return (NSString *)-[AVMetadataItem key](self->_metadataItem, "key");
}

- (NSString)keyspace
{
  return -[AVMetadataItem keySpace](self->_metadataItem, "keySpace");
}

- (id)value
{
  void *v2;
  id v3;

  -[AVMetadataItem value](self->_metadataItem, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v3 = v2;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (NSTimeInterval)timestamp
{
  AVMetadataItem *metadataItem;
  CMTime v4[2];

  memset(&v4[1], 0, sizeof(CMTime));
  metadataItem = self->_metadataItem;
  if (metadataItem)
    -[AVMetadataItem time](metadataItem, "time");
  v4[0] = v4[1];
  return CMTimeGetSeconds(v4);
}

- (NSDictionary)allMetadata
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  -[AVMetadataItem extraAttributes](self->_metadataItem, "extraAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 4);
  v7 = v6;

  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    -[MPTimedMetadata key](self, "key");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("key"));

    -[MPTimedMetadata keyspace](self, "keyspace");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v9, CFSTR("keyspace"));

    -[MPTimedMetadata value](self, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v10, CFSTR("value"));

    v11 = (void *)MEMORY[0x1E0CB37E8];
    -[MPTimedMetadata timestamp](self, "timestamp");
    objc_msgSend(v11, "numberWithDouble:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v12, CFSTR("timestamp"));

  }
  v13 = *MEMORY[0x1E0C8A9C8];
  if ((objc_msgSend(CFSTR("name"), "isEqualToString:", *MEMORY[0x1E0C8A9C8]) & 1) == 0)
  {
    objc_msgSend(v3, "objectForKey:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      objc_msgSend(v7, "setObject:forKey:", v14, CFSTR("name"));

  }
  v15 = *MEMORY[0x1E0C8A9B0];
  if ((objc_msgSend(CFSTR("info"), "isEqualToString:", *MEMORY[0x1E0C8A9B0]) & 1) == 0)
  {
    objc_msgSend(v3, "objectForKey:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      objc_msgSend(v7, "setObject:forKey:", v16, CFSTR("info"));

  }
  v17 = *MEMORY[0x1E0C8A9C0];
  if ((objc_msgSend(CFSTR("mimeType"), "isEqualToString:", *MEMORY[0x1E0C8A9C0]) & 1) == 0)
  {
    objc_msgSend(v3, "objectForKey:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
      objc_msgSend(v7, "setObject:forKey:", v18, CFSTR("mimeType"));

  }
  v19 = *MEMORY[0x1E0C8A9A8];
  if ((objc_msgSend(CFSTR("dataType"), "isEqualToString:", *MEMORY[0x1E0C8A9A8]) & 1) == 0)
  {
    objc_msgSend(v3, "objectForKey:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
      objc_msgSend(v7, "setObject:forKey:", v20, CFSTR("dataType"));

  }
  v21 = *MEMORY[0x1E0C8A9B8];
  if ((objc_msgSend(CFSTR("languageCode"), "isEqualToString:", *MEMORY[0x1E0C8A9B8]) & 1) == 0)
  {
    objc_msgSend(v3, "objectForKey:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
      objc_msgSend(v7, "setObject:forKey:", v22, CFSTR("languageCode"));

  }
  if (dyld_program_sdk_at_least())
  {
    objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0C8A8D8]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "isEqualToString:", CFSTR("org.iana.media-type")))
    {
      objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0C8A8D0]);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
        objc_msgSend(v7, "setObject:forKey:", v24, CFSTR("mimeType"));

    }
    objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0C8A8F0]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
      objc_msgSend(v7, "setObject:forKey:", v25, CFSTR("dataType"));

  }
  return (NSDictionary *)v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataItem, 0);
}

@end
