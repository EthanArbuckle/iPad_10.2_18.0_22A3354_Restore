@implementation FCArticleAudioTrack

- (FCArticleAudioTrack)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCArticleAudioTrack init]";
    v9 = 2080;
    v10 = "FCArticleAudioTrack.m";
    v11 = 1024;
    v12 = 17;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCArticleAudioTrack init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCArticleAudioTrack)initWithType:(int64_t)a3 asset:(id)a4 duration:(double)a5
{
  return -[FCArticleAudioTrack initWithType:asset:duration:embeddedUpsellStartTime:embeddedUpsellEndTime:](self, "initWithType:asset:duration:embeddedUpsellStartTime:embeddedUpsellEndTime:", a3, a4, a5, 0.0, 0.0);
}

- (FCArticleAudioTrack)initWithType:(int64_t)a3 asset:(id)a4 duration:(double)a5 embeddedUpsellStartTime:(double)a6 embeddedUpsellEndTime:(double)a7
{
  id v13;
  FCArticleAudioTrack *v14;
  FCArticleAudioTrack *v15;
  objc_super v17;

  v13 = a4;
  v17.receiver = self;
  v17.super_class = (Class)FCArticleAudioTrack;
  v14 = -[FCArticleAudioTrack init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_type = a3;
    objc_storeStrong((id *)&v14->_asset, a4);
    v15->_duration = a5;
    v15->_embeddedUpsellStartTime = a6;
    v15->_embeddedUpsellEndTime = a7;
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (v6)
  {
    -[FCArticleAudioTrack asset](self, "asset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "asset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[FCArticleAudioTrack asset](self, "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (FCContentArchive)contentArchive
{
  void *v2;
  void *v3;

  -[FCArticleAudioTrack asset](self, "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentArchive");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCContentArchive *)v3;
}

- (FCContentManifest)contentManifest
{
  void *v2;
  void *v3;

  -[FCArticleAudioTrack asset](self, "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentManifest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCContentManifest *)v3;
}

- (int64_t)type
{
  return self->_type;
}

- (FCAVAsset)asset
{
  return self->_asset;
}

- (double)duration
{
  return self->_duration;
}

- (double)embeddedUpsellStartTime
{
  return self->_embeddedUpsellStartTime;
}

- (double)embeddedUpsellEndTime
{
  return self->_embeddedUpsellEndTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
}

@end
